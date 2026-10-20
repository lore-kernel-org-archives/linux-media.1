Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792468414;
	b=bYDGF8TmqUigDjDJzna3dfa1shSpckha4OvzZ1udYPmw5KDznBU3CTcw2P2Sa5REeUDW
	 kRx/KWEXlKAOt4la4hdb4sWl91PJ432ETWSgyUTbtFi9hlPCmo06bxaiACS60gvmXVg0N
	 5OkmhjdAch7jXqbqmDP9YDq9B4EIAvf/ksm0elFadnl9F4qJR28cPlEsF1E67cqXyffVO
	 LDhmyYLEM08oIBRxOZoMgsG0vMh9CwEosv39Bfnpk9N3f1AiLpZQpSluu6NVKKIHNUdX0
	 LNIcPgeSYnhQljdiXId3SAH6UsyX7ZuyqlUKP54CMsXdiQfEN+EUjWipBvooqTe5Obw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792468414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=B8x7QIi4yGr+7efbbM83ajwXkFKzE+lcxp1Y5FQsBMY=;
	b=3/3s/ft72njkPFAxZBbl1LzBcenEC9bE0nJI+H787GDDHKCStJN6tMWjO6ZUBBAE09/m
	 IwJ85SqnnA21m8IQQz981njz6rWqhz2+aNGDVELss+UyJZR6UJB+62VPqdq74KpaVZdQ/
	 7eWPrRpiDqPUuKm7lZLYbhQ37OtHtpRu+huW5suji1DtJurZbOJYC/NH1Mc1KnM+4cv6h
	 iCt59zZxSpYlG3V4gE+u+lTcofwJ15fq3B6vsbMkAaQPPDSyYv5H3e3CuaMzo6WcBzgd9
	 znefq2VMpPArpGbR24EvpfCBQSwe1pQdJW9pthbICmE5KFUF20teOQhB9lUgbjDl8/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="E/1d89xz";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3C9606A31C
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 03:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D3C9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E/1d89xz
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so237245e0c.0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 20:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792468413; cv=none;
        d=google.com; s=arc-20260327;
        b=W5zKCu5vgFlmthsgw2ES94lRhskoBNsTeNKtqi4l7pu0mx+ah2/wUpvoz0d5uDW4bt
         kJERn68oYSexMxFEzG+kBDC+AAe0yM/bTZ3EEycnVcRQaYcbZI9dq0RGnAIS8DGUkAi+
         uNEDnIWB45SOX0L2NIYR09MKZv8R3DWB0B4Cz+JkXF03g4RGyY30f9SL+x1oUKWJiIR1
         nz+hferSTIZRpAYMgGxre5kLN5ZRj9YBFEPivZH+TYeZuEvjmOaBW3ZtpW0WestRrB5H
         Q/lBcZQHb8PQ6xmgGfl87+2cphJ7tYKH0YGQzFVo5Ef5GtBS6gShkv/cccLP+DwaEDD/
         l3Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=B8x7QIi4yGr+7efbbM83ajwXkFKzE+lcxp1Y5FQsBMY=;
        fh=39AgcrAumY7Rl1FFydTrSDQMt+GzL6FT7xgyVx/Wlos=;
        b=B0iTpYGEVTZZ4Ejg6EhwyjqYjXZxtcnpCyxKQEX64NcGp4NrvpEMO87zvpjWIdLOVj
         DQYBEzRQPzdqjhM0ISLePs8Vc6r7hXHvF2bwFRBhE700PeqOFkPLLKVJm5keYEVARQgm
         gK7pcKq4IscMPfbR6PE7ygCnaTcBVDMY8d/+ljLKe0XDk6FEVv7hODxMgjCaYhgvfWnT
         pSIag2LTdoaKR3INBuWKtqj5/FfSP8ah+7P8bOpxckHDsZavC8VFSpN3UPgiGIPGW/pE
         JPL5nSc8NDhwHbcTEsAGm2XtNwRL0946XDXvZyE7xNkoSEgXKpDfwyNALNH0BEf3X8MP
         xlIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792468413; x=1793073213; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B8x7QIi4yGr+7efbbM83ajwXkFKzE+lcxp1Y5FQsBMY=;
        b=E/1d89xzJd3uN6v8JmRj0qc1lnhhREM+ULZHcPaOOMv6guII5/oSZCYJ4nLHNRI8I7
         GNSQB1akrERgKLxg9Lj8dsWGPizgqaWAQ+ClxdZKJ/Q/qk9FLaimQXifDqypOtleo5OE
         X3+6WDdOVOZ/MtTaTgUvNS1iS87Yp7H1tWIN2pGduCTt0Zdvrd7E57QNBEtrXrouW+do
         STmVpeWqtzdMCO6QjTVRdgszrMyE9oLvw6gXQcQE4hmJzMOPJ14khsagqj6iKZnCQUnz
         1NwMQiwJZBVr3tNFp7pkmeUJWr2v7MWzwibVnNvXmPIJIpVyP3HG4jqm4UIN99TnXA1T
         Boqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792468413; x=1793073213;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B8x7QIi4yGr+7efbbM83ajwXkFKzE+lcxp1Y5FQsBMY=;
        b=cMb1Ap00MDN6B2rh5uH1hMx7UR+3BUfWeQFvRMeBiwAtIiIRDVCQsoF7+AwSn+/22r
         70r+TVGBYtak6W6oNo475X9V0iBhtLKngGlugHNDF9w4OfNbVeQRbwylQQ2ubQFa61ci
         TEhacrdhzPXgKQO5F3VOONbYGjkXzwxjPVwsMHQIK7yMbA0QvIerI137Hi/1gb4SyPPY
         SNd1l8wvKST1enYimGmaycGixBS1dM2hpF3OWLMIg7lsTEQB8nYE63H/ElA0eFE5PqSf
         Jnzn//iOpLCUiFg6A7mQk1w3UOPhK4RyuBpmILLqG7nVQwQhG+n3DOfgjDX2fUheKkCX
         8+Lg==
X-Forwarded-Encrypted: i=1; AKwUvBwcoxWYhl1xXZ5BBsN/7JD83sk+FXW+6sTYIiJ5PCUPkh7NyHgPBfyJbYTwKKOEgVA7vcsLBMbjStWzFg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLjFjvlNCFmK+hNdINE87TgwODj6ksFiXgZAfbkHFL+pA0R5VHt
	Q6Bhdey9RTcHQpu5ODRO57fIJzlLx83j/w67fuochq/rzUmxKs38d9V9klLZmLlrAr+1Ve1+SSS
	/tXupYqxDky0fvJd7JbTUDxKGbc+Nmo/BSJA5s+k=
X-Gm-Gg: AYBFou0pCwSsI2KqvFLZlcwm2O0kQ6mf6dU9I1AvZXvcHzyqzUItT8/u6UsfRM4v+ZP
	phnYlibXlbumM8zrDROZx307bavIYsIft9kcE+WsdUnPrgo5xW7EpIs+yPCck/ep4xELs/S+/uG
	CTFC8rhQNqRXI+nI9CdCqEZeDLYpt90vcxi7II5FNGAMYegrA4ifh4/UQsJefG7+K5eqNcGTyWx
	t/13U8YuhjdekIiZHXDiIBjK56BGAT47nalL6RA1jOIZxai2znmBLyOE0Lk9GLdVmVHuBCK6bJ3
	9ByQr9mlc/2XCAQGkeEA/cZm7SJQ/xmrJg8RkCouzoU/mOjpSZhJP0xTdAaDef8V8vKZ
X-Received: by 2002:a05:6102:8645:10b0:7a9:e680:efd5 with SMTP id
 ada2fe7eead31-7cc7bca6de0mr171865137.28.1792468412768; Mon, 19 Oct 2026
 20:53:32 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 19 Oct 2026 20:53:32 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 19 Oct 2026 22:45:49 -0500
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <9a1b8caa-c260-469d-8b0b-6a2ca29226d0@collabora.com>
References: <20261018-fix-imx415-vblank-exposure-sync-20261018-v1-1-920383f39185@gmail.com>
 <9a1b8caa-c260-469d-8b0b-6a2ca29226d0@collabora.com>
From: Iron Berrington <berringtoni36@gmail.com>
Date: Mon, 19 Oct 2026 20:53:32 -0700
X-Gm-Features: AclHuK9XNMAuACY9V_8Ap8NkrnCzm4l0f59JyBZIo7KA_7HpUs6PKGbdATumTtQ
Message-ID: <CAF2O-sNE3bKxuZrYvkBJ=-4sgSrPanzbKfcHJ0kVgFqwn0G9Sg@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx415: Use target vblank to calculate vmax
 in s_ctrl
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael, hi Dave,

Thank you both for reviewing the patch and for the Reviewed-by tags.

Best regards,
Wenqiang


On Mon, 19 Oct 2026 22:04:36 +0200, Michael Riesch
<michael.riesch@collabora.com> wrote:
> Hi Wenqiang,
>
> Thanks for the patch!
>
> On 10/18/26 14:54, Wenqiang Zhao via B4 Relay wrote:
> > From: Wenqiang Zhao <berringtoni36@gmail.com>
> >
> > When setting V4L2_CID_VBLANK, imx415_s_ctrl() writes the new frame length
> > (format->height + ctrl->val) to the IMX415_VMAX register, and then falls
> > through to case V4L2_CID_EXPOSURE to update the electronic shutter register
> > (IMX415_SHR0 = vmax - exposure) so that exposure is preserved across frame
> > rate changes.
> >
> > However, in case V4L2_CID_EXPOSURE, vmax is calculated as:
> >     vmax = format->height + sensor->vblank->cur.val;
> >
> > Within the V4L2 control framework, sensor->vblank->cur.val holds the
> > committed old vertical blanking value, which is not updated to the new
> > value until s_ctrl() returns 0. Consequently, when VBLANK changes, vmax
> > is calculated from the stale vblank value:
> > - If VBLANK increases, SHR0 is computed using the smaller old VMAX, causing
> >   the actual hardware exposure (VMAX - SHR0) to jump by the blanking delta.
> > - If VBLANK decreases, SHR0 is computed using the larger old VMAX, causing
> >   the actual hardware exposure to drop by the blanking delta.
> > - Additionally, ctrl->val is clamped against the stale vmax limit.
> >
> > Fix this by using sensor->vblank->val instead of sensor->vblank->cur.val,
> > which holds the target vertical blanking value currently being applied.
> > When setting V4L2_CID_EXPOSURE directly, sensor->vblank->val equals the
> > current vblank, keeping behavior unchanged.
> >
> > Fixes: 3bcae55ab96a ("media: i2c: imx415: Add read/write control of VBLANK")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Wenqiang Zhao <berringtoni36@gmail.com>
>
> LGTM!
>
> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
>
> Best regards,
> Michael
>
> > ---
> >  drivers/media/i2c/imx415.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> > index c3b22b238..e5aa741fc 100644
> > --- a/drivers/media/i2c/imx415.c
> > +++ b/drivers/media/i2c/imx415.c
> > @@ -729,7 +729,7 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
> >  		fallthrough;
> >  	case V4L2_CID_EXPOSURE:
> >  		/* clamp the exposure value to VMAX. */
> > -		vmax = format->height + sensor->vblank->cur.val;
> > +		vmax = format->height + sensor->vblank->val;
> >  		ctrl->val = min_t(int, ctrl->val, vmax);
> >  		ret = cci_write(sensor->regmap, IMX415_SHR0,
> >  				vmax - ctrl->val, NULL);
> >
> > ---
> > base-commit: a5ebb76233b79db01e82e061173cb73c6d2b5c6b
> > change-id: 20261018-fix-imx415-vblank-exposure-sync-20261018-967b008cf3fb
> >
> > Best regards,
> > --
> > Wenqiang Zhao <berringtoni36@gmail.com>
> >
> >
