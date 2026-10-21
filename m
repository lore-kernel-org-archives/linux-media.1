Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792562317;
	b=RqDqYpGK0EXGzMEmw+HnOnpW3E99m5wh6lDkGBLPLNUjy/Zt81bfZBPPshkFrKPO3Lm2
	 w+DqO2AYVTmom9I6TyXhE7D5d899pM3VANZZ3eg5Dob4FQ8+LjdgLT/V5UjAJcz3TGWbq
	 4bvcnwD7h4qXEMyXKhbx7JMGlb+LlMy+7Dbfwv+hDoadxf0yxkC+3mF4bSW1Hju0pCUeh
	 y2EWTZKsnrqB3KDVqsnkeBp6o5n8dQ5hZB62XNNXJsDpHuRXlWumdcJhSudyHN+GMXDJG
	 GS13hi67zZzJ9CnP1Q0Mmi1ES4ItTiTIdyEyazFIE5/o6vDobCzIHXnk+BA+tYKwoTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cDTft4oCYYFLnSmAGGawpHgZJuk+rVPSatHBqJxDTuY=;
	b=m2K+kryNYv8n5MGwo/Xc2XUTEdUIZ8JYagEW+JdPuXDI9IiI93ZfJjU6ChO6KVEZlxdx
	 GN61r/4LKMpzFJr2B3INgnqqp317ohTJiHH9E/xIvAKDlfS9W5CWhPrd0SGIyUgRbK2tK
	 3F7Wn2XbabLxYPgm9g8zgSk3kPp0gTwY6E3Vcvh1evQKRe650Gz+eDhaUwPwq4WDPoWxH
	 9GDI+Qd/oZNb0pKNEJ9C+tSQdipRL3oke7KAqjqwo9TSJlfC43gNRpT4gnvfDciVPi2Cm
	 i4nc4Zlqy1cKS/CEEkyqIEWawmKhALmQBd85zuLCMDEE7OJVi9y3PKqVSCwNJQUkRlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QdeVr4lO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4403606A31A
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 05:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4403606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QdeVr4lO
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c423b145922so31752866b.3
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 22:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792562315; cv=none;
        d=google.com; s=arc-20260327;
        b=fVJaY0VXAzXxdwpMzoXViNXtyTI17zlFsWY2T8Y6cuS9QH9YJvRJav1zDhfHeEN/e3
         a/xEKinXi4CUvgzH6u85W7k/kIi+hYGh2nn3ZFOyvQdlS0PmvFI+X3wZ5rXty+JBzFIw
         rxSXQKC0FKQ8ECZTcsE043N4F6lfh1oXMBcisL1CJbu3OFVUjE552UZy3IEwEHGNBskz
         /7cfFQL6xKo5zsAH4oR34aEhod7FjGoFgdALfB4+KmAD07wHOxUvbxagXAh3t7SR6gIG
         T5ussNm2JMDMpc8SpMWvxK4HVsnN2OL4yh+jhqoipL6+lKSVZIB/3qeNvB4nrFHGuJmw
         ZN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cDTft4oCYYFLnSmAGGawpHgZJuk+rVPSatHBqJxDTuY=;
        fh=ZGTHA9fTDIKn7p9bZhlFj4sbQsJGKTBL+K/kXs215t8=;
        b=pgUPThwViaIld/tqnnhgTbznWqU1/wwQY/U4pc3iK67maEaWCA5qKgDRtIFWiP92Nq
         I5XX3qImFMjLDvd1FUkbdny0cDyOA126ngIr1qhYZMeCmc3GXjOAqDVflCz3SyNWzPAg
         0BSSjPYDTyISw7o0PWOcI+k197GD7KMFyud3SfVbfnjFnJt1OyHL0KE2ux+H1+IXeBCH
         xsHgQ9ls+Qc/rRNvna1GCdjuesuDn6Faz5sLvKHGcB2DCYUvOHsHVb8wWlEVvolJ/osJ
         5eLfb490itb2/pqd8JzIXfNcXz0QkRfrXmO/CznrMz0xo7z3Yc6DuHqqfvEdKKtkRoE+
         7cQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562315; x=1793167115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cDTft4oCYYFLnSmAGGawpHgZJuk+rVPSatHBqJxDTuY=;
        b=QdeVr4lOTL6AxWWcpOsY3zAqJ3qggfXrol95yDDKMyqSdO1nXV28EV6UpznchG4Hze
         o5xTDHUdwD7FLsPMnWeONBCXZy7Si+S3CCi+Th6e9DOgh78ObJ9xxTYA4CkUlYxkfGAG
         /VEPLmtAcBeti5Xj2A1I48feHuAFOsbuzqzvxvKqUb549nYP0BY8cg3ybwCGBAsiItaS
         pDgg46yMxRxGeD2sdOiXHAjDJ6hMZ5wcJCcZTnNb6PNPC6EgwWEbVFINsBqvDqfXhNDP
         WGYBXp/30TXPlSk7zmgVGgKK5vNnnGVI7ohd3UaPlRwTe06LC2y1bNQTJHmtfc7nc2Ee
         ZKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562315; x=1793167115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cDTft4oCYYFLnSmAGGawpHgZJuk+rVPSatHBqJxDTuY=;
        b=UxSZHA3QdFj/zfPo8E+Hl57EZDkwfyw4zzUUDNsiiF66KyXwDnnnt5wClWUG8QVpNb
         h5xzsHlgae4mP7uF75U0WyM3hwGmHNq4K6rnL9dUScXW3AZQ/f0mcpN0Jmxjk+Cd+y23
         fHEmGw1OsfepGjWb3EoBVK3A48Aq+ZCVy9p+iJkf8dn00x1NMOwwtUrAQ+fQ27ORaAK1
         hMTk+ZffqpYvwtDIBE2K+yzjG0xUsNotkIBci156F0qcHgroIM63z5qynoYReSzNd+r0
         yq+86iq95nKPowUKuvAO34xVr64cpOzpbvHCXA37eSFtxMtObQnT5ZvKvooPsfUgWjMB
         D2Fw==
X-Forwarded-Encrypted: i=1; AKwUvBxeyr8WtGDT+GnH9sugLrZG5MmYtl/M+Z+RrWMnqh0CSOgBcNi5bxLADdfVQios0j6R+2I8ibtnPrDs8w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIRxN0fACrdySqZ84HWLaoLUMWqDnm/97YlY8e6Rhib/uUGPPdN
	FN3MWPsvYDgBpbZr4MuLi3pf5s6+A0+Or6ODTOXQ73p8mODgU/4h4aVFMYu5spfDgHo8P1jUsUZ
	W3nOERgC+RN9qh33+TDu9Ax52HBwl0Ss=
X-Gm-Gg: AYBFou0BjSeNCltjdpjn0DluP6HFD7e+P/k8xIRX2sgMN2SMYhp67eFGcrVcMPmU+9+
	0fxJLF3oJFLNL/mUntZ988LQFM68VOVVUpP/4nWiQf8/Q6jhijOBKWYgvBviM8Z8TEKFU/pzljR
	ULTEWFlwGtGKiNO+5vJvbDQl/8A7B52Y6fQSTvOh2yZuaezFAMIVw8iw36XusKklkaCZl85PCxn
	dHM1qqUYlWpruomlX8iTdtwEmkU6V3y6Cx9DXIcRKI450ZUq7ZK/kUkaFFbNvT6yMgHcFkBAS7V
	+6nuecN3h1MOTjP9sdlLbLOz+ZgWd0pDcxBCJOVVfd8P5QhZDJe/VubU27MlDjNs7D/3jldSGZc
	MEUi9OskPQzLd+OPFfLCX7hF6DU91WvwqrKWuBkVRw1nIQOPGJBOqsACOEM9BYaRZtD3peSdtao
	M4mGllcxbv1yGee/fR1VLBWL7NHR1zHudDbz61U1UbK+vQjaJtuTeENjFLwl7T+4LDBYrxBt3aR
	G8lZFjob6LGaIx9qpPBXirQ/YJAHcs+Cqr1Dw==
X-Received: by 2002:a17:907:97cc:b0:c42:e6c8:e496 with SMTP id
 a640c23a62f3a-c46797a19f7mr70958666b.36.1792562314818; Tue, 20 Oct 2026
 22:58:34 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
 <20261020015001.15672-1-patrakov@gmail.com> <20261020015001.15672-3-patrakov@gmail.com>
 <atcpXzA6KQfgiD7J@kekkonen.localdomain> <atcs_nK50gJ3dBRX@ashevche-desk.local>
 <atdaMqiA3RSb5GEs@monoceros>
In-Reply-To: <atdaMqiA3RSb5GEs@monoceros>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Oct 2026 08:57:58 +0300
X-Gm-Features: AclHuK-PF5pOS0r7ZZClhjL5fCAFIawvnh7U4tmrV2llCBHRZIaHJ4fecWq7QXw
Message-ID: <CAHp75VeoH8FMcwx1Q2C_KhxUrVCEKxetBq53BNwotgPMA714ww@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: ov5675: Add the OVTI5678 RGB-IR variant
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Alexander Patrakov <patrakov@gmail.com>, 
	johannes.goede@oss.qualcomm.com, adee.sahan@gmail.com, andy@kernel.org, 
	antti.laakso@linux.intel.com, dan.scally@ideasonboard.com, 
	diamondback@cohunt.app, ilpo.jarvinen@linux.intel.com, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 3:13=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
> On Tue, Oct 20, 2026 at 11:57:34AM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 20, 2026 at 11:42:07AM +0300, Sakari Ailus wrote:
> > > On Tue, Oct 20, 2026 at 09:50:01AM +0800, Alexander Patrakov wrote:

...

> > > >  #include <linux/gpio/consumer.h>
> > > >  #include <linux/i2c.h>
> > > > +#include <linux/mod_devicetable.h>
> > >
> > > #include <linux/device-id/acpi.h>
> >
> > No, this has to be part of i2c.h on par with device-id/of.h
>
> Well, <linux/i2c.h> includes <linux/acpi.h> which in turn includes
> <linux/device-id/acpi.h>, so <linux/i2c.h> already provides
> acpi_device_id.
>
> > Uwe, can we get this fixed, please?
>
> With the above said, there is nothing to fix, is there?

I believe it's just a coincidence. We need to include both explicitly
(I mean -id/of.h and -id/acpi.h). Do spi.h and platform_device.h
include acpi.h as well?

TL;DR: we have an inconsistency behind this, so it's definitely
something to address.


--=20
With Best Regards,
Andy Shevchenko
