Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6125D49B20F
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 11:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436483; cv=pass; b=lo7oXSadN3iWvjMosfVTqmiJchdyHUvxHnz4ft4C1Ittd3LbRu5hy0B9csbVz6Ho1jcjevtqWewlfUPpmh5BMUxFH/+acXPDk7gJ+r58cg+kaNcCm08ZUoi8aW31X9D7WnzJp6ze6VorxclcCMNfs7pVwgpYsVPLwctmez5VIC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436483; c=relaxed/simple;
	bh=gHAbW6wIQAOgircilBDDKDXMDhXhvTa/oibSBhPS/GE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsTg/dPqGTfkM8ZYOCfv9k+46APgILB6ImuAEaOE8gbYygX4zvQu9ImyYcKgKZntKDiJ649NHBLAe2VvS7L2WHy9LFPywWjY9SXqe0A+66KpVGLsVjL2wq/FIO2iz41q0oYKPtnU3n7DpjvgnEiuAEkYjG/mMgqT9UOG5eAyYO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=C/UgoQp6; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="C/UgoQp6"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6aaf3f54dbeso1993866eaf.2
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2026 04:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788436477; cv=none;
        d=google.com; s=arc-20260327;
        b=SfgsLuueMcM4s3CnPJyGfBaCQbTqjTX9F0ka4MicqxnP+oSzzCzWmZh6wfoPnSg8fr
         kRB93Y4yB4sXTozFvgZ6qH+rEp949Pm7AKtw56rhtOLIx5r64MI5y2F8Dh/Qu6WrT+Ld
         RSDOR+hcgXaA1/ebbYhm8mdd33RwuS/Z9H5/O/6ECvchQIxnEE+T7+r2/ll7zuwRr3y/
         8/1eRnH6umrb1NVoQYNanprOzPnhsqmUBUeK8W7D9ypzjy6zcRtTDsQ5iMaAPYCIhdRf
         7LpD4vQVvLGvb8c+gTRGIAln3uOOIVjIkBXHiqCD3t4NGBwvTKl+z4MCKoblJxgurx3n
         YkXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tG8aNzzaKVpd1oQICpnTjkqoBtjprmAy6CZLg1VWzM4=;
        fh=MH7ofW5ayolThqtW1BgI7Rhj0Ck83VuU/5hInDZc9N4=;
        b=TVOImht5S9EpyURC9i25dvbKgmdOpcXkKFA7RZcXmjmgzc7HydCNuM6sVpbuzbdHzL
         ZfNNH1q0SHTXSzWyE1vpxy1meTzDW+ISsYTaWpj4e09WgwHBWEcX9N9B/qdZmXUStrdG
         RG6xBM6ZjY1C6lE17JwnmH1bsGB4CbjsOQRX523mi9fNvIqkf72N+DhhlxVcceaNWp4h
         bKEfSfHPFQg41Vyj0fIOAWttsro0YXRNLlMv6DPqX2F8+WYP53zPSzgAb23EQsN5f2d1
         7Djt3nmiO+Sy9w52W3vI5XeXdQ+9X60IqRej/qdO1sxf1fErVDOWDr1HqhaPl2DqoaqU
         Wz4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1788436477; x=1789041277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tG8aNzzaKVpd1oQICpnTjkqoBtjprmAy6CZLg1VWzM4=;
        b=C/UgoQp6/0MKC+uiBhDIFo+95dcr5Pg5+iT3xMqqNmcSWztMd0XlI6783L4jwXaDS2
         ny76T5oUAbt9g0uEnJgYWrH/UbB56aRnu90vObSnGB+B8J0nYGO6Pt2Sr32iTSigEBfZ
         vQijFGCABHHq4bNpMM74p+X62rcOBuXNhpLvKhuxWDUSXdbjZtJ/pXw6nsSDnLh193yP
         9YfI2lIXMVRw6o8k5WfA1k6GKI4wtQiBTRNLoAPIHJu1DK5EJn8spbsCd+goKu5hF47F
         MaO2K1ZSfQ/aD0gBzdlOPo9JGloxv8xuitnAfrtbxnWrFtcMyvFpbSx+9KbyQ5fbzUwx
         OI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436477; x=1789041277;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tG8aNzzaKVpd1oQICpnTjkqoBtjprmAy6CZLg1VWzM4=;
        b=C15XTQzT8cpXvE8kWgf+XRo/Cn+QvLvHywoxdCyAdg6EPehipM+4KNrjR2onyy6Wd6
         pe315r9CkuzOMb0yMiUy0aAh+RfAd+7hdwz51gZKfpsq1n0SeI8NfdaDBjA6BKBO4YKj
         YWnC6j4YZFqSGy8Mkt+Z7/1EprD2BGDbJFuNM0ApE9hf8Wx6mqhcA99MWO7crulXTWD3
         CgDpl7SNdutCctOqPXgN/XxzHYmG+dKTUHcaMHBx0dCBYtayOUiDdb7mQII3h8sqMCyE
         C0Go1LHV/1H4gpS9I/1aUZfsRyP1+cFWfM3Xn8OTP1BCNahATc4y8sglA14+E6GWie0q
         W0lw==
X-Forwarded-Encrypted: i=1; AKwUvBzRvD+yXbYGqVKibCU7Xij69sdugrICa5uCBgPignUA6HSxDvxPgXy0GtCB727k44B1yEb6dQBK48xdyw==@vger.kernel.org
X-Gm-Message-State: AFuF++nB0r4p9wgCTdz2yI0XwuXCXU/wUC6UlzTRdvuJjSzRwFEYjIK/
	b1ezQuyroKCDWdbHUa35Qn9oSQKdijGIUUKwJGApfcrv5YAAs7+qhprPv36+8i9Fn4IuZ0SMYVA
	uNa8gG3JlpSbOCCkh7lqCShDikKFDWZuTaNq/hVvGjA==
X-Gm-Gg: AYBFou2rOUKHChLSmxJIK1UcUilQ1olcd+ZkxPHz79Dsd3IaH4E4WdNCNpyOmn3fxy/
	s2UtS/fy1t2mQDPBQ3D0wjPRauc0FvliPKZHhl+puslN949jTXItqIiqncSzIsmTNfT8qZUDwhS
	wZYL3SOcmOekyaHJsi/WPvzkrJTQEOq3HwpFo+PzclA1ghMRBNmS91eMUh4b+CuYMkY8BkBPuSa
	rSA+3bNQX+MzcJuAlG3UeyNlvhT7lqU0Y4+Vy3qaAvlqEosHhWVw7Tot+UHQoM5KSbowRSdlU6r
	d9aPfLuoX214KnbyiDuVkD3rB/0qDii5bhFJwztKQTwDMfRSbazO7uLvxDQ1pg1Xz+nbo7/HQ49
	PP9gVre1W+C3MGRdMMYSOuTRQTMI1twvKx3cX7NxjMGndvICBAxW9n6jdZ7cKFg==
X-Received: by 2002:a05:6820:298f:b0:6b0:ab1f:ec11 with SMTP id
 006d021491bc7-6b47eac1288mr8752261eaf.29.1788436477103; Thu, 03 Sep 2026
 04:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com>
 <20260805-media-starvis2-v1-4-91e8e4eae44f@raspberrypi.com> <178840935437.11722.581815298725172345@freya>
In-Reply-To: <178840935437.11722.581815298725172345@freya>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 3 Sep 2026 12:54:19 +0100
X-Gm-Features: AcwNN1VdrRkuRy_rjt36H8K_XmrlY74SkAhK6SYkA9sk5Fx4sd6TrQFPclt--MY
Message-ID: <CAPY8ntBpR6vjP4Yd8ErVMuLjLshWb+rpfV=dzRNkhLN=K59rnw@mail.gmail.com>
Subject: Re: [PATCH RFC 4/4] media: i2c: imx678: Add imx675 support to the driver
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jai

On Thu, 3 Sept 2026 at 05:22, Jai Luthra <jai.luthra@ideasonboard.com> wrot=
e:
>
> Hi Dave,
>
> Quoting Dave Stevenson (2026-08-05 21:39:19)
> > The IMX675 is a 5MPix Starvis2 sensor that follows the same
> > programming pattern as IMX678 and IMX662, so add it into the
> > driver.
> >
> > FIXME: Validate common_regs against Sony documentation.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx678.c | 222 +++++++++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 222 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
> > index 9083f2744510..4b82823c260e 100644
> > --- a/drivers/media/i2c/imx678.c
> > +++ b/drivers/media/i2c/imx678.c
> > @@ -714,6 +714,205 @@ const struct imx678_variant imx662_variant_def =
=3D {
> >         .hmax_min =3D imx662_min_hmax_4lane,
> >  };
> >
> > +static const struct cci_reg_sequence imx675_common_regs[] =3D {
> > +       { CCI_REG8(0x301B), 0x00 },
>
> nit: Maybe run a quick grep to turn the hex values to lower case like res=
t
>      of the driver?

Already done for the next version

> > +       { CCI_REG8(0x301C), 0x00 },
> > +       { CCI_REG8(0x301E), 0x01 },
> > +
> > +       { CCI_REG8(0x3060), 0x95 },
> > +       { CCI_REG8(0x3061), 0x00 },
> > +       { CCI_REG8(0x3062), 0x00 },
> > +       { CCI_REG8(0x3064), 0x56 },
> > +       { CCI_REG8(0x3065), 0x00 },
> > +       { CCI_REG8(0x3066), 0x00 },
> > +
> > +       { CCI_REG8(0x3072), 0x00 },
> > +       { CCI_REG8(0x3073), 0x00 },
> > +       { CCI_REG8(0x3074), 0x00 },
> > +       { CCI_REG8(0x3075), 0x00 },
> > +       { CCI_REG8(0x3081), 0x00 },
> > +       { CCI_REG8(0x30A4), 0xAA },
> > +       { CCI_REG8(0x30A6), 0x0F },
> > +       { CCI_REG8(0x30CC), 0x00 },
> > +       { CCI_REG8(0x30CD), 0x00 },
> > +       { CCI_REG8(0x30CE), 0x02 },
> > +       { CCI_REG8(0x3400), 0x01 },
> > +
> > +       { CCI_REG8(0x3400), 0x01 },
> > +       { CCI_REG8(0x3460), 0x22 },
> > +       { CCI_REG8(0x3492), 0x08 },
> > +       { CCI_REG8(0x3B1D), 0x17 },
> > +       { CCI_REG8(0x3B44), 0x3F },
> > +       { CCI_REG8(0x3B60), 0x03 },
> > +       { CCI_REG8(0x3C03), 0x04 },
> > +       { CCI_REG8(0x3C04), 0x04 },
> > +       { CCI_REG8(0x3C0A), 0x00 },
> > +       { CCI_REG8(0x3C0B), 0x00 },
> > +       { CCI_REG8(0x3C0C), 0x00 },
> > +       { CCI_REG8(0x3C0D), 0x00 },
> > +       { CCI_REG8(0x3C0E), 0x00 },
> > +       { CCI_REG8(0x3C0F), 0x00 },
> > +       { CCI_REG8(0x3C30), 0x73 },
> > +       { CCI_REG8(0x3C3C), 0x20 },
> > +       { CCI_REG8(0x3C7C), 0xB9 },
> > +       { CCI_REG8(0x3C7D), 0x01 },
> > +       { CCI_REG8(0x3C7E), 0xB7 },
> > +       { CCI_REG8(0x3C7F), 0x01 },
> > +       { CCI_REG8(0x3CB0), 0x00 },
> > +       { CCI_REG8(0x3CB2), 0xFF },
> > +       { CCI_REG8(0x3CB3), 0x03 },
> > +       { CCI_REG8(0x3CB4), 0xFF },
> > +       { CCI_REG8(0x3CB5), 0x03 },
> > +       { CCI_REG8(0x3CBA), 0xFF },
> > +       { CCI_REG8(0x3CBB), 0x03 },
> > +       { CCI_REG8(0x3CC0), 0xFF },
> > +       { CCI_REG8(0x3CC1), 0x03 },
> > +       { CCI_REG8(0x3CC2), 0x00 },
> > +       { CCI_REG8(0x3CC6), 0xFF },
> > +       { CCI_REG8(0x3CC7), 0x03 },
> > +       { CCI_REG8(0x3CC8), 0xFF },
> > +       { CCI_REG8(0x3CC9), 0x03 },
> > +       { CCI_REG8(0x3E00), 0x1E },
> > +       { CCI_REG8(0x3E02), 0x04 },
> > +       { CCI_REG8(0x3E03), 0x00 },
> > +       { CCI_REG8(0x3E20), 0x04 },
> > +       { CCI_REG8(0x3E21), 0x00 },
> > +       { CCI_REG8(0x3E22), 0x1E },
> > +       { CCI_REG8(0x3E24), 0xBA },
> > +       { CCI_REG8(0x3E72), 0x85 },
> > +       { CCI_REG8(0x3E76), 0x0C },
> > +
> > +       { CCI_REG8(0x3E77), 0x01 },
> > +       { CCI_REG8(0x3E7A), 0x85 },
> > +       { CCI_REG8(0x3E7E), 0x1F },
> > +       { CCI_REG8(0x3E82), 0xA6 },
> > +       { CCI_REG8(0x3E86), 0x2D },
> > +       { CCI_REG8(0x3EE2), 0x33 },
> > +       { CCI_REG8(0x3EE3), 0x03 },
> > +       { CCI_REG8(0x4490), 0x07 },
> > +       { CCI_REG8(0x4494), 0x19 },
> > +       { CCI_REG8(0x4495), 0x00 },
> > +       { CCI_REG8(0x4496), 0xBB },
> > +       { CCI_REG8(0x4497), 0x00 },
> > +       { CCI_REG8(0x4498), 0x55 },
> > +       { CCI_REG8(0x449A), 0x50 },
> > +       { CCI_REG8(0x449C), 0x50 },
> > +       { CCI_REG8(0x449E), 0x50 },
> > +       { CCI_REG8(0x44A0), 0x3C },
> > +       { CCI_REG8(0x44A2), 0x19 },
> > +       { CCI_REG8(0x44A4), 0x19 },
> > +       { CCI_REG8(0x44A6), 0x19 },
> > +       { CCI_REG8(0x44A8), 0x4B },
> > +       { CCI_REG8(0x44AA), 0x4B },
> > +       { CCI_REG8(0x44AC), 0x4B },
> > +       { CCI_REG8(0x44AE), 0x4B },
> > +       { CCI_REG8(0x44B0), 0x3C },
> > +       { CCI_REG8(0x44B2), 0x19 },
> > +       { CCI_REG8(0x44B4), 0x19 },
> > +       { CCI_REG8(0x44B6), 0x19 },
> > +       { CCI_REG8(0x44B8), 0x4B },
> > +       { CCI_REG8(0x44BA), 0x4B },
> > +       { CCI_REG8(0x44BC), 0x4B },
> > +       { CCI_REG8(0x44BE), 0x4B },
> > +       { CCI_REG8(0x44C0), 0x3C },
> > +       { CCI_REG8(0x44C2), 0x19 },
> > +       { CCI_REG8(0x44C4), 0x19 },
> > +       { CCI_REG8(0x44C6), 0x19 },
> > +       { CCI_REG8(0x44C8), 0xF0 },
> > +       { CCI_REG8(0x44CA), 0xEB },
> > +       { CCI_REG8(0x44CC), 0xEB },
> > +       { CCI_REG8(0x44CE), 0xE6 },
> > +       { CCI_REG8(0x44D0), 0xE6 },
> > +       { CCI_REG8(0x44D2), 0xBB },
> > +
> > +       { CCI_REG8(0x44D4), 0xBB },
> > +       { CCI_REG8(0x44D6), 0xBB },
> > +       { CCI_REG8(0x44D8), 0xE6 },
> > +       { CCI_REG8(0x44DA), 0xE6 },
> > +       { CCI_REG8(0x44DC), 0xE6 },
> > +       { CCI_REG8(0x44DE), 0xE6 },
> > +       { CCI_REG8(0x44E0), 0xE6 },
> > +       { CCI_REG8(0x44E2), 0xBB },
> > +       { CCI_REG8(0x44E4), 0xBB },
> > +       { CCI_REG8(0x44E6), 0xBB },
> > +       { CCI_REG8(0x44E8), 0xE6 },
> > +       { CCI_REG8(0x44EA), 0xE6 },
> > +       { CCI_REG8(0x44EC), 0xE6 },
> > +       { CCI_REG8(0x44EE), 0xE6 },
> > +       { CCI_REG8(0x44F0), 0xE6 },
> > +       { CCI_REG8(0x44F2), 0xBB },
> > +       { CCI_REG8(0x44F4), 0xBB },
> > +       { CCI_REG8(0x44F6), 0xBB },
> > +       { CCI_REG8(0x4538), 0x15 },
> > +       { CCI_REG8(0x4539), 0x15 },
> > +       { CCI_REG8(0x453A), 0x15 },
> > +       { CCI_REG8(0x4544), 0x15 },
> > +       { CCI_REG8(0x4545), 0x15 },
> > +       { CCI_REG8(0x4546), 0x15 },
> > +       { CCI_REG8(0x4550), 0x11 },
> > +       { CCI_REG8(0x4551), 0x11 },
> > +       { CCI_REG8(0x4552), 0x11 },
> > +       { CCI_REG8(0x4553), 0x11 },
> > +       { CCI_REG8(0x4554), 0x11 },
> > +       { CCI_REG8(0x4555), 0x11 },
> > +       { CCI_REG8(0x4556), 0x11 },
> > +       { CCI_REG8(0x4557), 0x11 },
> > +       { CCI_REG8(0x4558), 0x11 },
> > +       { CCI_REG8(0x455C), 0x11 },
> > +       { CCI_REG8(0x455D), 0x11 },
> > +       { CCI_REG8(0x455E), 0x11 },
> > +       { CCI_REG8(0x455F), 0x11 },
> > +       { CCI_REG8(0x4560), 0x11 },
> > +       { CCI_REG8(0x4561), 0x11 },
> > +       { CCI_REG8(0x4562), 0x11 },
> > +       { CCI_REG8(0x4563), 0x11 },
> > +       { CCI_REG8(0x4564), 0x11 },
> > +
> > +       { CCI_REG8(0x4569), 0x01 },
> > +       { CCI_REG8(0x456A), 0x01 },
> > +       { CCI_REG8(0x456B), 0x06 },
> > +       { CCI_REG8(0x456C), 0x06 },
> > +       { CCI_REG8(0x456D), 0x06 },
> > +       { CCI_REG8(0x456E), 0x06 },
> > +       { CCI_REG8(0x456F), 0x06 },
> > +       { CCI_REG8(0x4570), 0x06 },
> > +};
> > +
> > +static const u16 imx675_min_hmax_4lane[] =3D {
> > +       [IMX678_LINK_FREQ_297MHZ] =3D 1125,
> > +       [IMX678_LINK_FREQ_360MHZ] =3D 1125,
> > +       [IMX678_LINK_FREQ_445MHZ] =3D 1125,
> > +       [IMX678_LINK_FREQ_594MHZ] =3D 1125 / 2,
> > +       [IMX678_LINK_FREQ_720MHZ] =3D 1125 / 2,
> > +       [IMX678_LINK_FREQ_891MHZ] =3D 1125 / 2,
> > +       [IMX678_LINK_FREQ_1039MHZ] =3D 1125 / 2,
> > +       [IMX678_LINK_FREQ_1188MHZ] =3D 1125 / 2,
> > +};
> > +
> > +const struct imx678_variant imx675_variant_def =3D {
> > +       .name =3D "imx675",
> > +       .id_reg =3D IMX678_REG_MODULE_ID,
> > +       .id_value =3D 0x296,
> > +       .native_area =3D {
> > +               .top =3D 0,
> > +               .left =3D 0,
> > +               .width =3D 2609,
> > +               .height =3D 1984,
> > +       },
> > +       .active_area =3D {
> > +               .top =3D 0,
> > +               .left =3D 0,
> > +               .width =3D 2608,
> > +               .height =3D 1984,
> > +       },
> > +       .pixel_rate =3D 594000000,
> > +       .pix_per_clk =3D 8,
> > +       .common_regs =3D imx675_common_regs,
> > +       .num_common_regs =3D ARRAY_SIZE(imx675_common_regs),
> > +       .vmax_default =3D 1984 + 40,
>
> Same doubt for the VBLANK =3D 40 here as IMX662, although I don't have a
> datasheet for IMX675.

Datasheet lists

VTTL (1farame line length or VMAX) =E2=89=A5 PIX_VWIDTH + 70
Set VTTL to 940 or more.
VTTL =E2=89=A5 940

But verified as working at +40. (I have a module from Soho Enterprises).
We can go for the more conservative values if preferred. From memory,
on IMX662 it'll lose about 10% (66fps at 40, ~60fps at 70).

  Dave

> Thanks,
>     Jai
>
> > +       .hmax_min =3D imx675_min_hmax_4lane,
> > +};
> > +
> >  struct imx678_model_info {
> >         enum imx678_type type;
> >         const u32 *codes;
> > @@ -764,6 +963,26 @@ static const struct imx678_model_info imx662_autod=
etect_info =3D {
> >         .auto_detect_mono =3D &imx662_aamr_info,
> >  };
> >
> > +static const struct imx678_model_info imx675_aaqr_info =3D {
> > +       .type =3D IMX678_COLOR,
> > +       .codes =3D codes_bayer,
> > +       .num_codes =3D ARRAY_SIZE(codes_bayer),
> > +       .variant =3D &imx675_variant_def,
> > +};
> > +
> > +static const struct imx678_model_info imx675_aamr_info =3D {
> > +       .type =3D IMX678_MONOCHROME,
> > +       .codes =3D codes_monochrome,
> > +       .num_codes =3D ARRAY_SIZE(codes_monochrome),
> > +       .variant =3D &imx675_variant_def,
> > +};
> > +
> > +static const struct imx678_model_info imx675_autodetect_info =3D {
> > +       .variant =3D &imx675_variant_def,
> > +       .auto_detect_colour =3D &imx675_aaqr_info,
> > +       .auto_detect_mono =3D &imx675_aamr_info,
> > +};
> > +
> >  static const char * const imx678_supply_name[] =3D {
> >         "avdd",  /* Analog (3.3V) supply */
> >         "dvdd",  /* Digital Core (1.1V) supply */
> > @@ -1533,9 +1752,12 @@ static const struct of_device_id imx678_of_match=
[] =3D {
> >         { .compatible =3D "sony,imx678-aaqr", .data =3D &imx678_aaqr_in=
fo },
> >         { .compatible =3D "sony,imx662-aamr", .data =3D &imx662_aamr_in=
fo },
> >         { .compatible =3D "sony,imx662-aaqr", .data =3D &imx662_aaqr_in=
fo },
> > +       { .compatible =3D "sony,imx675-aamr", .data =3D &imx675_aamr_in=
fo },
> > +       { .compatible =3D "sony,imx675-aaqr", .data =3D &imx675_aaqr_in=
fo },
> >         /* for non-conforming DTs that rely on runtime check */
> >         { .compatible =3D "sony,imx678", .data =3D &imx678_autodetect_i=
nfo },
> >         { .compatible =3D "sony,imx662", .data =3D &imx662_autodetect_i=
nfo },
> > +       { .compatible =3D "sony,imx675", .data =3D &imx675_autodetect_i=
nfo },
> >         { /* sentinel */ }
> >  };
> >
> >
> > --
> > 2.34.1
> >
