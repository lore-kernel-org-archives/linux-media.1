Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794376603;
	b=AuzluZm6d+6MNcP8B3CFFKuMqHTz/C8dqi/3/YE+IkJsFshDu14X8VrshJglmxYnyfm8
	 Y6LPSNcxJnx3ik90C9bT8UYG2Raw/5f1MZNQyLG7snYsIACawsIrQ69aYaQvS0VdtOK0f
	 EqN4OOgTyjVAWeCUQxUM0X1i6AGygEcPdE3Ei05tvs0/uN/Exw8ynS42+ZE3QN/nBeRij
	 iGNXLU9JQTF6dG9V2VR7xTAeJXhf8BFts91olq5Teh6977+KQLwwoXm5CxevqJtErtt6Z
	 dwjUtXDBE1LecD7Kw4axYYdG2dIz2G7qJ7mxLUXkNkMTcS5RQ8HPEi7r2fe2VOqicag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SVdC4NoqsEAb0xjeu4zg9bcnEb0TfO6Tqq8G+6Aa5+w=;
	b=gEN6mOBMp+uD2u2q/ZDuWSIN8j8GO8s2YnV1xNaM4leo0rM8a/K3fPgb2EV4dIx5wJi8
	 arZ/2RehM9a46vTy+H8aDAdOQddGqLSBSBZHHsEGL/O/mB87tdo2ZNwF7Z4ZqUYNAZtvD
	 3AVfdXgsZ2jV2tnjlDGSj5G0cdj/QxqaysdxUqtDxK9Aa4PTjK2PEx8o+vPDCzj1tJSjo
	 4/EtiwZkHfqKLxpXyxLUHy/PWu6gfDJ8DLdLtaOm2YG1qBMuHD3rYbDj4mT1yydCb4Ysu
	 al9wjGGBE5pEn4WwbaYk7U6LjQZcuuTJ75PWTvCp+IWHzONnb/0mjuQhcUFB4NgUmgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j8DnNixo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1263C606A31C
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 05:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1263C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j8DnNixo
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-53656465d1dso1341377b6e.2
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 21:56:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794376601; cv=none;
        d=google.com; s=arc-20260327;
        b=p1cevDlB7cCWdR4Ncx9dYrvQBHVQVSeeMjOVGcAFrvQoa3dHitXaEY7owjZKzBWoww
         pnTzL/zXwL0HCaUM31yZLDo4vYNlNlW6kRwI8TgtyjtfTPXA1wypmLSusYJDYpA0CSVl
         MNYFwq4Cp28WyLSRjrDnJLuqWoopfn8VXGj/B+rp8nSxsj2peknCC0kudg1yuV9JMqDi
         KcFQ2xmBURGr4LqXnNqWYEBw2c97iRzs+sHb394PvQmCLxKzFzuArND84BBeUkUlpSMT
         dTJ/TzRkNj18xjmEMqWci8Qy0dQclY6EIXKsnupuX+BlauK3P/hyT6LjYns7p2+37PIK
         SgIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SVdC4NoqsEAb0xjeu4zg9bcnEb0TfO6Tqq8G+6Aa5+w=;
        fh=Wf964kQho2aCFANP6cEeGSFQwvHTR8RZe6oNoWl+FUQ=;
        b=XZr6D/6ma+qtIbt8NZ/+USb3nk5cxjzuoaU2b1k60/LRUjKyOUSfRNV5XJqOt6E0Lt
         oKGd8q+7aJ6myCkaGpQsHPvib6PlbTis157HDjmwQr5EIdScFAaPIeoQekhkL5hwDrIT
         RXS/xoxzfFAUu7XCrFUyP7azcq90X1eLEpSbGqrblV+rmHi62lzOy5YngPVi8UyPTb1r
         bGTiwYBsdcTxV4xxPInXPFoGpQ+akHy0k2MNydhbTCmMRa0aqdi+f1J/eandetS2jkeX
         7RBT2l75DVmBBa0CF/72x8SBsicB0k+ATfZqick6+OAMpJfcDK+wwphstWQqyxK9W783
         iElw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794376601; x=1794981401; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SVdC4NoqsEAb0xjeu4zg9bcnEb0TfO6Tqq8G+6Aa5+w=;
        b=j8DnNixo91ABh6Ud1k1J3g8aT3pLJT9qPII6YHh2PMwH0GPT0uCz17ceNKSWkB4kSo
         zNlqE6pisPqCcWJ0rHOnmVMs0oCFgNLWxkXLb9XHr1uelXj91icqJRc1JoDF3Uir7d0y
         yq12Y/L5wojdgHri6yXzY9qQI0EiKOx1GoVa9QHA3NobFrl/0nYgHysu1rp2yqjLQd72
         KUVmDsMyQ0hEVI2V9+KVllo1Pob7VGPMUxJ/aoyOOT4k4/f6jDvOXvzEgeecLyH5ydTq
         cORxLEcFj1HltGhuJswiKqhQ//CWBKlYTTSVjhNP4fuu7iClRZCv8tAMyZPZWUN8leqc
         YsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376601; x=1794981401;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SVdC4NoqsEAb0xjeu4zg9bcnEb0TfO6Tqq8G+6Aa5+w=;
        b=cUQFsQpn1j4VZwBAFr1CCQPPIeMuzrWBufxhn+PnrswxK9k53bjUMUmPKz0WKig9jO
         zgKuALn51mt8aQ6Xr0HsYMniUJHCVqWNmsZFqoqj/a0L8zSOeToeUDh75F8dTHMsGCtA
         VPMnkrCg2COs+/tvx2FsltTQBau7rO9bsA4S55/8XLeVmwgwlttiTk2/BLsM/obEe+xF
         7SK3SGw2V38bBglAmtKs87Jy/c7s0u7RnEAfgREu5TBeP+hV4xv+dHOLtIa16zEkfWN/
         XymmXHrVbKhpQwOFRhqYj+7FpbFAaWp6kszgPLIVNxMeGLPpMeOx3UGF5r8XhTwun897
         OXDA==
X-Forwarded-Encrypted: i=1; AL+hErGNnFlZZy+zeK6GxKOVbXuyBGQdErLPUD7CCTCDxSDycJEEjeSkHMkpC9gVmR0VQJp74m3PFsFRQIH6ng==@vger.kernel.org
X-Gm-Message-State: APuU4Z+3QCRjoPlkHUpsYkFtG8iy2cPm2zJ51yLVly1KnfUNStyIFee+
	QnRtGIcJvozhgfLQkPi4kW/8kGphWYAsrSUAXNuGZPuvBxKokkZx6nNdMFi7jkcmkj4dL1m3wkj
	07X8gU5jYBckROdvM8/scT6Nojgl97c4=
X-Gm-Gg: AYBFou3RQ+OUSY9wTteA9rzwzMYEo4ninKCkkv47X4uTxuEICOqCkXW6z6//C8mHDAa
	pYOjLYnaiYlNCDuvnmakuDFcs+XZnb0uqE+7GY4M0MFQLDijjX63ExII0XVMTjU+9vyq5WULe/m
	gXsseNorEoFF6HjblR1MvHg0Cb570uesX2udVHfupe+jodiA1/Kq07V9xDfjzZi7WUmm/1NqeZM
	LZ5PPAowubIzHnOz99RdTfK6qw12XPsyflymZS0Na0dmc+Zi7sD70D8xanYxgeONbqYimfPi1UM
	XegkmP1C4cHNGl9HFgk7qITgMyF9wAe3Bzm3YUOd/r1z92bpKhtZNNycqQqsZpKvCRLNV2uQzdo
	TktWGlr6Eu0v+mgYLdjGYfUw+Cg+4YX8sH0FQ+TkxVO9plrA1MwOil3KMmIZQrUrKeWaeciqGXi
	HFItl64j5verkAT+EuV2ARad6Rovt5si6dLCka6U4B8VH0xhNaXrw=
X-Received: by 2002:a05:6808:4f23:b0:53a:e153:e901 with SMTP id
 5614622812f47-56b932504ffmr1277212b6e.2.1794376601509; Tue, 10 Nov 2026
 21:56:41 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6ae09458.f0fe5aea.79aa1.008e.GAE@google.com> <20261027101009.18e9136537144533915008e4@linux-foundation.org>
In-Reply-To: <20261027101009.18e9136537144533915008e4@linux-foundation.org>
From: Rohith Matam <rohithmatham@gmail.com>
Date: Tue, 10 Nov 2026 21:56:30 -0800
X-Gm-Features: AclHuK-vbFkZZTGrimsL-YTV39zkF7VzvFxaCKkhVtRTZJlOUBJ0WGB_WgVtgM8
Message-ID: <CA+FtcErvvvg8EQUpgravNPTib4_CnFb3W20PY-xMYSTdDH4=4A@mail.gmail.com>
Subject: Re: [syzbot] [mm?] [usb?] WARNING in corrupted (4)
To: Andrew Morton <akpm@linux-foundation.org>
Cc: syzbot <syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com>, cl@gentwo.org, 
	hao.li@linux.dev, harry@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-usb@vger.kernel.org, rientjes@google.com, 
	roman.gushchin@linux.dev, syzkaller-bugs@googlegroups.com, vbabka@kernel.org, 
	mchehab@kernel.org, hverkuil@kernel.org, duoming@zju.edu.cn, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

I retested my v6 patch against the October reproducer, and syzbot
reported the patch test as OK.

The patch removes URB_FREE_BUFFER from the Siano-owned buffer and also
fixes the related work initialization and teardown ordering.

Patch:
https://lore.kernel.org/r/20260601201639.63171-1-rohithmatham@gmail.com

Mauro, Hans, could you please take another look at v6 for inclusion?

Thanks,
Rohith


On Tue, 27 Oct 2026 at 10:10, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Tue, 27 Oct 2026 05:08:56 -0700 syzbot <syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com> wrote:
>
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    5b0764a53235 Merge tag 'drm-next-2026-10-21' of https://gi..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=13739fc9580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=fd1433abd362f255
> > dashboard link: https://syzkaller.appspot.com/bug?extid=9fe09db3795456e0b442
> > compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
> > userspace arch: i386
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11cb9b0d580000
> >
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/05ac8658d211/disk-5b0764a5.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/9cfb73243216/vmlinux-5b0764a5.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/fc45c7faf785/bzImage-5b0764a5.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com
> >
> > ------------[ cut here ]------------
> > !PageLargeKmalloc(page)
> > WARNING: mm/slub.c:6855 at free_large_kmalloc+0x97/0x110 mm/slub.c:6855, CPU#0: kworker/0:1/10
> >
>
> Thanks.
>
> > This report is generated by a bot.
>
> So is this report ;)
>
> This looks like a double free in the Siano USB media driver, rather
> than an MM bug.
>
> The failure occurs during USB probe error recovery. The allocation
> comes from smscore_register_device(), and the page-owner records show
> that smscore_unregister_device() has already freed it. The USB core
> can then attempt to free the same memory because smsusb_submit_urb()
> sets URB_FREE_BUFFER on a buffer owned by the Siano core.
>
> Rohith Matam posted a patch in June which removes URB_FREE_BUFFER
> and fixes several related URB teardown races:
>
> https://lore.kernel.org/r/20260601201639.63171-1-rohithmatham@gmail.com
>
> I don't know why that patch hasn't resolved this problem, but it
> would be worth revisiting before developing another fix.
>
> This doesn't appear to need any MM changes.
