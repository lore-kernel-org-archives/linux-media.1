Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794233807;
	b=APnJC4pua8AdvzW1+42prOOXvY4EAMr3Gudp9XEPniZmHy8YIycAJBLUPDBhwMERUthP
	 k2lyc6geZFKx/O/RGmLD8fZxId7edTJmTLJmDBH7DdT3zirBIF2+3VJVLRQhgJtu1R5QB
	 HBTQrNWvHDxApP71Lx84sGDKzxCUzBnZH5U9bHUMGZbPZ6ZqdmnVScTbLgcSUXxcGyy88
	 rPyMOa4Rg6IeA+VitxfA7utn0BZ3oSFNWPVycLjhNI0Rjvna+oM4RE5WAnOfSF4dKOQgw
	 wrQf5ygBmudzgRhQ5XYfibAOrf18Txp1jKtYd5wYnJQ2AvqXROaZCEn0vceRFK1vP0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0Es11pjpc3vZGasBDVSFJuT3wSMxl4W5FtFNnbP35PY=;
	b=Z+r4lJkLtfQ6nl95JaIUzXU5t+88OAWpWM4N8GUTm6ZdVIddazsV+HFZoBvI4z8cBEYa
	 xrCDB/sLT+p6gIKLHUjFX+H9N33zVUedhd45jLyTkOJ6dZ9okMMwECQUHG5RcrXpIsKDF
	 vPMYhtYRjh1BzJZwusy1bVIyChesMK9dtVH/yk2l1vDQfuwb+qxjiZ4Av7vPGmZFG5CyS
	 NBdgH7YGkAoXNxmFhJSGfY1UiBL6JYgweTCu9oCo3dhabrNVrJQ7fMtzAglx/Zuvhz5JR
	 6JM58IVPIuzLCeiD5X8kVTMqINmp3QnYdb47mgYzD7gNNF9iTAxYbLEj6pGTLPbfT5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sIG9xiBh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1151F606A331
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 14:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1151F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sIG9xiBh
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so224074b3a.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 06:16:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794233806; cv=none;
        d=google.com; s=arc-20260327;
        b=UYS+9C/V+sSEx9FJVIkB/p+NRxuLYpuhfn9oJMc8uciI4FPCRnuDmOAs01dUTl734T
         K2o4sESti90cVCRsoo0kX2O5q/8Oagt4/y5IIpiPjUQFl+pO43U5J0x7yTBxg9mc9P5z
         AsDnt/TezJcjaJwVR7figE8pb00UyJXgEnIftSzdBnyMuIibcZB87Ij0rtxFdyXplq5m
         B43bmO7hsuwjJYaPDQtb9QRj+9ImnJJlGj1PyyBkfhP6HLEncfpBnXN7QfgxyBrfGvAU
         L4FUdS3oi63hYtWS5Dq8IYK14psqLNvFz732a64RUZQKb9OLsxRAmlcs27rDR9IdqZlO
         r47w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0Es11pjpc3vZGasBDVSFJuT3wSMxl4W5FtFNnbP35PY=;
        fh=XZrdiadmuGqHaeY595orR6Q+H9dviUsgaES7WDG6nyc=;
        b=b/Qd7cc0y4f5vT4tV1poV3EuQG59gZoJUEM6I0oN2pxkY9j/XfN7jD4Ug/GD8jkfFV
         1aKq3QUvha0vQAyaq4+lgwGsypgEp3pgkvT4BAtTPGwTc6frff3HON2xeSRJ3JB/osZ4
         LmrVSrk6+sjlBYCWqcZaJSHPR2+v2vnT+2A3uGrArHWX/CjldRs7DHsvzYBfj5L9G0uA
         fM7TtHDYDKoCqc4eLMvl14DgKxqpUzuQujHEwVdiq73Dtuir8d78kBpNYtnRVvWBvuEK
         A1AkGYOr9I8n9gRJ6zOn3v4zXaG9nKih1J7M4BJ1NLkYUbY8iqFTAfPLP+YVkTLqGFv6
         dodg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794233806; x=1794838606; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Es11pjpc3vZGasBDVSFJuT3wSMxl4W5FtFNnbP35PY=;
        b=sIG9xiBhdNIHMXGNGEvPlbFyZKQI2EPQrE+Fv8IC6A3WwfXP3CZAUockc29tu3EMK2
         TWrWCsyuYMMUrnCVvKIYQKo4JxD8oBorh5q0DQOlcb4BCgSJurq+XSPF5p60lKpn6QGl
         vC1s1pomJ0bsLABLmKC8skzib8mgF3qv+VoRzw9EVoZN5Rg2KFVNc7ERXJNDsHXmrywH
         cYu7s7HtfcWg2HgyYKGYcjSJ7eIK9CyebDcZl5m/A+6tUDgg4uhRLZrfFXD6MZAqzg/r
         v4xD+HEtYOaghGmlISzLQW119KXgKH/sanelKuiGKwbyAqpVKqyWSKutQsvWORit+gA1
         QxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233806; x=1794838606;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0Es11pjpc3vZGasBDVSFJuT3wSMxl4W5FtFNnbP35PY=;
        b=HHAYvddzU08UccWXM1oTxjLgdgOEQ+zeswBZsM+N4JAU05KRnIAyd8P6wnZ6LL8IGv
         HSc4bK9LIqEG1GvOn1zfncTqHj8CAXEaw+rvPsYcGLmyvd7ZaxTSHHQukFC9EjsH93vx
         WpqPG9JjCduLEZmvrXiIPeRnCPeqI/kQqEbJ5lSPuvgHIRem2jySCfi3v97aAdXSjN0u
         ZL9JvGJ4vCSBgEp0kItw1iQCtzSb/0bNBCuvPaN5AVt1tLN3odXNqjy32gXN1ufbLuL4
         l33aKTZk1BZfI86ErZp+WM69rN4U8SKo9rmBrp76ONB0KXv3s71panI//r6FSNk7kCu4
         +Utw==
X-Forwarded-Encrypted: i=1; AL+hErFbXpFEbixvLNvKHif0haAOLojeYceCL3N9qa384p/Zrcya+XpOIbQZUZa+KiOXxpOs2lc0eiSTP30ttw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9thgJF8bl5X8vSyDk0ZEjBfKzYnjm8B71iPm46fiWC5sXmUxKS
	J2q/htq2R4dl2og6m1AP8zJLt/vGqQbEut8A7EFbqqey9tWc8uuL4YXoMKGfwJwwSispfV1bz/Z
	Q+GYMokGy9V4kM+bNRT6x1sKu1WHWJQc=
X-Gm-Gg: AYBFou3UlLhefWne5qTPjGEhGE8m3ZHAIvBy4UaH6HLXq+idw7+stkrco7RkV+JVVTZ
	/2ToglUZiV1RphBoE7+7UBwHRXTUV5YPqdGhE4mEqKcG8jjW4NUKdcb2LqpSQ3T2cs1mGClJxMO
	3R+ZvPEmhldKGj+Aa4gMQH0LWTsEMZBIQZIaaJhPJG7ppESjjCDKZeSEVnL5pck1qGsbC8nY3GO
	lYJaZUGkNOxya9P2n77hMccWc9aSHwKjCp653ObF+qwpOA+MIF5ddMHFsPf0mZKpL0U13tJ5KVM
	geGuGMEwMCUpSgU0mrEwEnKFU3KxxhehiMR7hgzgpdikxT0ANLR47sfjQw0AwsysvCaHmzyYnxG
	K1+SSUBCbhtnVdIkzknbGYZgwzFPUUslkeA2v
X-Received: by 2002:a05:6a00:194d:b0:892:a02d:b6c8 with SMTP id
 d2e1a72fcca58-8b66e344e72mr3247857b3a.22.1794233806387; Mon, 09 Nov 2026
 06:16:46 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com>
 <20261017-ov9734-ipu6-v1-1-86eab22ae258@gmail.com> <avG1f6OUHUeHSgeA@kekkonen.localdomain>
In-Reply-To: <avG1f6OUHUeHSgeA@kekkonen.localdomain>
From: Tin Posavec <tin.posavec04@gmail.com>
Date: Mon, 9 Nov 2026 15:16:34 +0100
X-Gm-Features: AclHuK-koBG1Lh2nuzGjYJwOnurULhCfrrBVF7gX4ywgG5vLOsmLI6Sr6IL6vp0
Message-ID: <CAOJcTPXkPqRcHeySMKLB0Tt_LsMTxD+=4CmhhjvBQE3AsELNRg@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: i2c: ov9734: Return -EPROBE_DEFER if no
 endpoint is found
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari,

On Mon, Nov 09, 2026 at 01:58:55PM +0200, Sakari Ailus wrote:
> >       ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> >       if (!ep)
> > -             return -ENXIO;
> > +             return dev_err_probe(dev, -EPROBE_DEFER,
> > [...]
>
> Omit this error check altogether: v4l2_fwnode_endpoint_alloc_parse()
> already does it.

Thanks, I'll drop the check in v2 and return the error from
v4l2_fwnode_endpoint_alloc_parse() instead.

Tin Posavec
