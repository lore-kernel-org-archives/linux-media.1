Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60E73546F1
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 10:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789035132; cv=none; b=X8QvodWNYmZSr4F5Hnz4m9e5Tnsuk8VPCbPk3bL3sg3kfuA4wWRpK1so/eXvXTbyJWn9S1ktBstJpvoVWPmYbzltnhVg726GNUgbJ557u8LL6JHfEwczPVA4xtUeKLjAwg6jkCj10se+bGMwAsJWgvlyOSAOPxmZKiVeGnVN1iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789035132; c=relaxed/simple;
	bh=IuMIYh9X9IVY6CJl/CwrShnkg2Zwau+nmNyWvs0XPPI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DoV2IVFphFOSKvMcXyZcmdDln+vGvdl+0/LrDU5h9qVZNlL5T9oewfUmz4RffKtx5gn3re5HLOKEEwlD9KvZwK5mxLf0jZSanbXn5FeAQ+IuRZVcHNUGHCXuegYwICm1dPDinKtm7vYRI6ZqHFA1Zh5qitWUKUbaVL+qR/WILm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0Tpm+Ce; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0Tpm+Ce"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E9F1F000FF;
	Thu, 10 Sep 2026 10:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789035130;
	bh=3pIjrAdTUxcrmKqoSrP6GWQlrDFixjrn05dFRma7Y+U=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=o0Tpm+CeKTsCCDCnRzuWMUFPnbj3MNKQl9AqFDxK6pOfp0vfF3Hl4yNuZWgFrTCw+
	 NSEGOoDnFpjuAyLcdPJd9qfqjN5mk/UGds1sDShxlfc+QwJJtGKO0fsISj/Ag541tB
	 GHXc9SNw89GdkVyXpyXK1ogdcjd2wOG4QAw7fbn1996dBdnb4XOnUjKXtMEr8zrgVX
	 LJE6va3wW5WrXa4QgYS9yfSSrOVMEDekyoR2is36LeC2W6eHyyigA33szoGWhjWrSM
	 xT3Luq5ea1jSkQ3uoeT5KTbCPrOWfHnLqZGrbT6ZpYVP4noWC7hftye2jNdprXIy/r
	 gpr9gJFbVjqOA==
Message-ID: <87c86455-31de-49a6-8621-224bb43150f9@kernel.org>
Date: Thu, 10 Sep 2026 12:12:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [RESEND PATCH 2/2] media: em28xx: fix race between
 em28xx_free_v4l2() and em28xx_v4l2_fini()
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, lvc-project@linuxtesting.org,
 syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com,
 linux-media@vger.kernel.org, Fedor Pchelkin <pchelkin@ispras.ru>
References: <20260907102824.95222-1-dmantipov@yandex.ru>
 <20260907102824.95222-2-dmantipov@yandex.ru>
 <20260907141901-c37057428f7d37dcdb29b1e5-pchelkin@ispras>
Content-Language: en-US, nl
In-Reply-To: <20260907141901-c37057428f7d37dcdb29b1e5-pchelkin@ispras>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 07/09/2026 13:30, Fedor Pchelkin wrote:
> Hi,
> 
> On Mon, 07. Sep 13:28, Dmitry Antipov wrote:
>> Take device (an instance of 'struct em28xx') lock in em28xx_free_v4l2()
>> and do the same early in em28xx_v4l2_fini() to avoid UaF-triggering
>> racy access to 'v4l2' member.
>>
>> Reported-by: syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=dd0f06181ab66b93dc00
>> Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
>> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
>> ---
> 
> It would be nice to know what is the race and what is the root cause.
> Since if em28xx_v4l2_fini() and em28xx_free_v4l2() can _actually_ have a
> race, it's not clear what happens in the following scenario:
> 
>   Thread A                               Thread B
> 
>                                       em28xx_v4l2_fini()
> em28xx_free_v4l2()
>   mutex_lock(&dev->lock) 
>   dev->v4l2 = NULL
>   mutex_unlock(&dev->lock) 
>                                         mutex_lock(%dev->lock)
>                                         if (!dev->v4l2)
>                                           return
>                                         mutex_unlock(%dev->lock)
> 
> What about the resources which em28xx_v4l2_fini() should deallocate /
> disconnect / put ref / etc. when it doesn't return early?  Are they
> released eventually and who is supposed to do that?
> 

I agree with Fedor, this doesn't feel like the correct fix. em28xx_free_v4l2() shouldn't
be called until the very last user went away.

At the least there has to be more detailed information how this happens.

I'm not saying the patch is wrong, but I am not certain whether it fixes the
actual bug, or whether it just fixes the symptom.

Regards,

	Hans
