Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931282C1586;
	Wed, 18 Feb 2026 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421098; cv=none; b=K+gHWBOlCC5iuiX/uVOxSPdrRyvASfxai6nOF9pVwUjSVg5gfmYXO+OfZ72RkfO8OBHYMUhCU6xBAWXDrS5Uuv7uZrNM9Ad2QrXqwMbq7LEUsQc12Zh4+vudXgL//h/w3ZOMF8g701sbDb1ljMfbrdqQ0LF+LesdazCgVwB4/AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421098; c=relaxed/simple;
	bh=Tur/n8vICRq0YbrTKcQnoUKCCFf3Ljxib7W0Vs/eDZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AED//qGDkT63y/WMBVgFd3XwNW5jKdzf/vxXdR/7hGBeXwGWVN09P3gEGn+Msb5OmF/HA7T/sCHN2zqXkdSLKJ3x3Iay2thcOFFgMMa87pKWzIM4345FoiwwZ4iSHFmAeubFCProX+TfR8wBeryi2bzUdzWa1UpO4z+qOi8JIxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ewVlY/r5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GttaaICz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ewVlY/r5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GttaaICz"
Date: Wed, 18 Feb 2026 14:24:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1771421093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G4zWFbZKC7amkrsf9RbdR6/fQ4kNcOZhdhjrMFCh93E=;
	b=ewVlY/r5GTABz38QHQ/4ARebFWhMPOJDOWBKrAFiRaDg8swbYynltxBFtIBhi9UOeU4vpQ
	PFYamy2S8gBo1/Rx3uaE6hRqZBQILbj3/wIMj2q5hiOWgyno/GMqRquXDxbsG2/KUswNnm
	jVzdvpeta3oVKW/AWr+a94mneJDeP4BqFPMyXFpriZ8QgD7KcJA4/yVsR4C/vuqvqtjZJH
	6jn7srQzrMw8QeGXWmIviKEB9eQN2zjgD+yEF5lrn9jlww2MQVoU6sPolT+wzDYiAxGomo
	ybN4KzTtRJ2xB/C6PXHldnh+2SEMzS4TgwFd0mVZ7lrYQ6yumAQ6O1cSWX1G/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1771421093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G4zWFbZKC7amkrsf9RbdR6/fQ4kNcOZhdhjrMFCh93E=;
	b=GttaaICzTLrQLW6SaKbTE3yGSA7xz5++pm7bo9LzHr5LmojY+QfHfNzK+m2TLo2QPmJNFe
	E/PvvbUSdfitr9CA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Cc: dwlsalmeida@gmail.com, mchehab@kernel.org, linmag7@gmail.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: vidtv: fix uninitialized args.buf_sz passed by
 value
Message-ID: <20260218141123-d54e3a23-c3dc-4ce7-8a8f-1d77fa4c7960@linutronix.de>
References: <20260216211703.3702-1-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216211703.3702-1-abd.masalkhi@gmail.com>

Hi Abd-Alrhman!

On Mon, Feb 16, 2026 at 10:17:03PM +0100, Abd-Alrhman Masalkhi wrote:
> vidtv_ts_null_write_into() takes null_packet_write_args by value,
> causing MSAN to report an uninit-value warning on buf_sz inside
> the function.
> 
> Fix by passing the struct by pointer instead, avoiding the stack copy
> entirely.
> 
> Reported-by: syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=96f901260a0b2d29cd1a
> Fixes: cd7a5651db26 ("alpha: add missing address argument in call to page_table_check_pte_clear()")

The Fixes tag should point to the commit which originally introduced
the issue that is being fixed. My commit for alpha-specific code is
unlikely to be the root cause because a) syscaller is not running alpha
systems and b) the first occurrence of the syscaller was before my patch
was picked up by Linus. So please try to find a better Fixes tag.

> Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> ---
>  drivers/media/test-drivers/vidtv/vidtv_mux.c |  2 +-
>  drivers/media/test-drivers/vidtv/vidtv_ts.c  | 18 +++++++++---------
>  drivers/media/test-drivers/vidtv/vidtv_ts.h  |  2 +-
>  3 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
> index f99878eff7ac..67a580396112 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
> @@ -363,7 +363,7 @@ static u32 vidtv_mux_pad_with_nulls(struct vidtv_mux *m, u32 npkts)
>  	args.continuity_counter = &ctx->cc;
>  
>  	for (i = 0; i < npkts; ++i) {
> -		m->mux_buf_offset += vidtv_ts_null_write_into(args);
> +		m->mux_buf_offset += vidtv_ts_null_write_into(&args);

Please explain in the commit message why this is change is safe to do.
Modifying shared data might break the logic. (I have not verified this)

>  		args.dest_offset  = m->mux_buf_offset;
>  	}

(...)

Did have syscaller test this patch before submission?
See the following documentation from the report:

	If you want syzbot to run the reproducer, reply with:
	#syz test: git://repo/address.git branch-or-commit-hash
	If you attach or paste a git patch, syzbot will apply it before testing.


Thomas
