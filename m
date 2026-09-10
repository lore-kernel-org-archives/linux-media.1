Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9DE481FD0
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 12:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789042816; cv=none; b=lOKG6pf0T894UhMGLcWAMMdHr+hnL681vcXvZ+7NAm2Lbjvgoi0JOstmC2K2Q+BvP3ZMfybQSAM2XOgsFpynUQgHFvDNKWxi7SzIyFlEFZAzYTfNCHazO+OQiv0tPDLDKFbfdoCQ48GIZrGVqwR7DjRKWM2a2TVGAgq4YMhAiJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789042816; c=relaxed/simple;
	bh=2aOriFAOP5nUDg3vEm2hm97I/CkxjZ+NJx8pruBxXoY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LkWsMsMU0M9/n9iqVOajbgIeWMz3sGshILQq2IVW5LA8LEwTDovIbeZQCJKmoI4nApaAB0mXOcd9Jgx6lNoJlpOE/j+Koib5G6p5va6/r7pS7yhQuo+v1sHJHjU7cH+mXQ8/V1KkVhj+ecrAotvY4XSmpeUmJW75mv6VYdVmpis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ipg2jH0t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ipg2jH0t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351101F000FF;
	Thu, 10 Sep 2026 12:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789042815;
	bh=hzpC9FshcZYSrQKYCJF8y7QcYPxI3VfAUOR95dORYRI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Ipg2jH0trFlxoY91YXWqfUk4bg4Sj5mj1DcsLpycmYilUMjqGCat9Cdc0S3ngunuU
	 /h6ZYMwN/7Gzbsy2HotMo8KCeh0HJSSMUsCa0Dk8lid6ZzRwicjuKrT+hq9WF4/3EG
	 b1/Sc/wy53KtSwBbbeaOHeFvwhn7w9GWX6/0TkrABcvLKt2R/wwrm5TF6KRxdcnvkm
	 mkc3MhF3hviyf6QMoeO7T1paUPbSOsZMCbqtVBYCICi7XgtfcI2oTJX/d/JW5VjTKv
	 7HgYxYD5ssEk7BhyFciLP9SE1lQh3TY/USzK8oymd4bveKFt4f0n8FldP8W7K6xvoj
	 RiUkcMb5rzvFw==
Message-ID: <1ef00988-51c7-47c6-8eba-95d4d2463d1f@kernel.org>
Date: Thu, 10 Sep 2026 14:20:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [RESEND PATCH 1/2] media: em28xx: adjust initialization order in
 em28xx_v4l2_init()
To: Dmitry Antipov <dmantipov@yandex.ru>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, lvc-project@linuxtesting.org,
 syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com
References: <20260907102824.95222-1-dmantipov@yandex.ru>
 <7f58710e-d235-446d-9c69-cf286eae8700@kernel.org>
 <fb450eee-7b63-4b85-b480-ce8759ba7c67@yandex.ru>
Content-Language: en-US, nl
In-Reply-To: <fb450eee-7b63-4b85-b480-ce8759ba7c67@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

I looked at this a bit more, and the real cause is that video_register_device is called before
em28xx_vb2_setup(). The order must be reversed: first set up the vb2 queue(s), then register
the video devices. That should fix this.

Can you try that?

Regards,

	Hans

On 08/09/2026 14:26, Dmitry Antipov wrote:
> On 9/8/26 12:23 PM, Hans Verkuil wrote:
> 
>> I prefer this simpler patch:
>>
>> https://patchwork.linuxtv.org/project/linux-media/patch/3e01154b-ab4d-4cb3-90d7-a5dce4e5b2c4@kernel.org/
> 
> Not sure whether it fixes https://syzkaller.appspot.com/bug?extid=dd0f06181ab66b93dc00.
> Running one of syzlang reproducers from the above, I'm seeing:
> 
> [   77.259135][  T194] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> [   77.259761][  T194] CPU: 4 UID: 0 PID: 194 Comm: kworker/4:1 Tainted: G        W           7.3.0-rc2+ #17 PREEMPT(full)
> [   77.260740][  T194] Tainted: [W]=WARN
> [   77.261092][  T194] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.17.0-10.fc44 06/10/2025
> [   77.262034][  T194] Workqueue: events request_module_async
> [   77.262636][  T194] RIP: 0010:__wake_up_common_lock+0xd6/0x1f0
> [   77.263839][  T194] Code: 0f 84 d4 00 00 00 44 8b 64 24 04 eb 13 48 ba 00 00 00 00 00 fc ff df 4c 39 fd 0f 84 ba 00 00 00 49 89 ee 48 89 e8 48 c1 e8 03 <80> 3c 10 00 74 12 4c 89 f7 e8 8c f4 8d 00 48 ba 00 00 00 00 00 fc
> [   77.265115][  T194] RSP: 0018:ffffc90003ef79a0 EFLAGS: 00010046
> [   77.265447][  T194] RAX: 0000000000000000 RBX: ffff8880267b9740 RCX: 0000000000000001
> [   77.265770][  T194] RDX: dffffc0000000000 RSI: 0000000000000004 RDI: ffffc90003ef7944
> [   77.266088][  T194] RBP: 0000000000000000 R08: ffffc90003ef7947 R09: 1ffff920007def28
> [   77.266425][  T194] R10: dffffc0000000000 R11: fffff520007def29 R12: 0000000000000000
> [   77.266781][  T194] R13: dffffc0000000000 R14: 0000000000000000 R15: ffff8880267b97d0
> [   77.267694][  T194] FS:  0000000000000000(0000) GS:ffff8881254a7000(0000) knlGS:0000000000000000
> [   77.268111][  T194] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   77.268437][  T194] CR2: 00007f37cbd2ceb8 CR3: 000000002e931000 CR4: 0000000000f52ef0
> [   77.268804][  T194] PKRU: 55555554
> [   77.268979][  T194] Call Trace:
> [   77.269144][  T194]  <TASK>
> [   77.269292][  T194]  __vb2_queue_cancel+0x2de/0xde0
> [   77.269542][  T194]  ? __vb2_cleanup_fileio+0x134/0x1f0
> [   77.269831][  T194]  vb2_core_queue_release+0x2f/0x150
> [   77.270109][  T194]  vb2_video_unregister_device+0x15b/0x200
> [   77.270437][  T194]  em28xx_v4l2_init+0x1c89/0x3150
> [   77.270695][  T194]  em28xx_init_extension+0x120/0x1d0
> [   77.270955][  T194]  ? process_scheduled_works+0x89d/0x14d0
> [   77.271237][  T194]  process_scheduled_works+0xb60/0x14d0
> [   77.271788][  T194]  worker_thread+0xa47/0xfb0
> [   77.274246][  T194]  ? __kthread_parkme+0x71/0x1f0
> [   77.275290][  T194]  kthread+0x38b/0x480
> [   77.276165][  T194]  ? __pfx_worker_thread+0x10/0x10
> [   77.277716][  T194]  ? __pfx_kthread+0x10/0x10
> [   77.279999][  T194]  ret_from_fork+0x48c/0xab0
> [   77.282292][  T194]  ? __pfx_kthread+0x10/0x10
> [   77.284802][  T194]  ret_from_fork_asm+0x1a/0x30
> 
> Dmitry
> 
> 

