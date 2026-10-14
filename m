Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6055F54489F
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 14:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986814; cv=pass; b=MDNV33XC29GEjDuHn1lbAh9Ynypac6//96wnIf7xeGkS4NW0toyQRfFcaJa5Q7tkqj3nQyIpPsI/mWvI8GQ7PGqEEdo91I1XQ8YPURt80HyeOYPFXYVXQLm+KXG5IYvAZoBJTm7yHyb+02mFKod7dOphrfmIuzZ2rJqvoTi4avQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986814; c=relaxed/simple;
	bh=0LcwAlWWK0AFCf1TILkUnxNzteLJZfEicsPDrj8s9Co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKxUqTCP94+eXrUE5oZC9pbQHrxILJjZMzwxUlqjR+B/ft0YudJG2Qhvfy78al6Rgp5lR1AKJgg1kDO6RGPvoKGd3hPdthtLOewmVn+Ekmht4itjRqyNHY8sWvwfjkshjeVFT10qGoH8FBqrxh5sM7qTnElHAmmUN7Gls3LH+B0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=eNe1DuNO; arc=pass smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="eNe1DuNO"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-49e1d10ccbdso974841fac.1
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 07:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791986807; cv=none;
        d=google.com; s=arc-20260327;
        b=EbCaROjwuzaeA8Ugz25qYHvWDB9s8/IC300HufsLW3uZivBg4PejTkNQ7CLPLg43iw
         npIW9s4rNONu1wKjtHRTO3BsiZL0+JxNno23GDJr/Sr6p4QFLh3scFbeAGVIwN8T9nqD
         aMB0R2bWxdV2NmdR/LSUQZyPtLQ+XlLMja8OdnFo/mrQN98aIPbXPQovXeoxQ18qUh3w
         84y+/iwzrLqyEbKGih9jmTVubTaIWxjGfJ2nokC5dSqbGFnv4Nq4fsplBAsGO7e8xtm0
         ecACepDDuVDkH/fNEK3WY+usGIImkx4thBMHLk1SVCQgL1m8+PM4ZbqEEbqqd4JIa1YO
         M2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=45UmRzUopsg3Oy314idTfdd3gLWGouyWXj8QTFCxVZ0=;
        fh=3b/hHU2Ku7+7+gv1V13lUcKrjXO/xhj2ew5FfUQ4xcc=;
        b=oLFolYOqaw/IFoj5cDJsL6PBqksjhUKSDRtnYZbpz5vR1TohRx4UxMjM1512A62qVS
         A6Fg0SdisaZs7WeQbVs1kPvzB19hni7Qs1R/Gi0L7M45brXTitRqmfXS+6ndR6WeJq0l
         +uvozPwodof9LUWT3yE9usAM+42SFoSe/+GJI7sBfd8aocEXOrDsqXbd9dwrI2XKm8W9
         JDS16BU7Qnl5Yxm4OrDTu7335NK2iHybydoJ/cuKWxYod7AvrkbIsyFO59GhxIoEw007
         H6uyeI6AMrA2CtvHQRZge9VMOH7I/T2BD6A4a1qElue2G3cMTI6sZkffVJktej2vH5tT
         uy3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791986807; x=1792591607; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45UmRzUopsg3Oy314idTfdd3gLWGouyWXj8QTFCxVZ0=;
        b=eNe1DuNODth6IsJInnlNhfk876kXkB83E4SamZQQVGKZeHYyBu+7NWSd2RP3rMgvbq
         yqeA2SSB3+ImWPbUiy9WBxk/iFnY5urRw3sNLUaXzn/np+H7eaOQ6j0R3nbjmNayBcLi
         xHXnX8IcR+Zpe4Hxi6XIPEBoKRKl+kKGWDccRlrJOnbadtwH5l7LjSoUh2PCF80T2VIg
         CfqYGx/wlP+1IzZdBoWD3KQTvXTKZuAXFzy6DOgiGldW6mcoPweGZUKkrPXOwEa45puE
         r1wAkx0UyjCKQCuQ9fRovXQ0+ayQxZHz4wXr4JzIAcdyYkELld9L2417nSgHWDP2IVIN
         NSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986807; x=1792591607;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=45UmRzUopsg3Oy314idTfdd3gLWGouyWXj8QTFCxVZ0=;
        b=BDUpkK/3U1v6TEGckzt8dt6f9RYYIXz3GBnsH62LfkRo+EntJg4gRTIzkbRO4FRzR7
         mUMktWXBZaHMjugCKCHEbaizO9+p9Zd+YeOONmUBu4vZboWoXCzzfoNdjg1L0zp28bIy
         D7XHUjT3ehY9T+Iepw8omJS7hSoX7+2VSZ0Cb8NaLinaY3FBGTr/1ukyhc/TA3g2xnUM
         pg1a91gZf524cSxQ6GUBvSIMJEN542IsrD4NuupUw1sAH/sfUAjEYpXUaxzCNLzPee1K
         mPbSkHgg5Q4s319KJF2pKe+SIVsDVEB8fILcd3mBB3MlTLprY/GyQZCFfYphUxTp+TLd
         a1ig==
X-Forwarded-Encrypted: i=1; AKwUvBzXIvyOZKRoKbTKjt4WExRnWAe7REick5R/WZNY8sP5eRJst2IVR6oSdB3yL4DSO2XsUNeJktRUUkO7hw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKJhOkhSTdMAwHzRK5CHa2cmzpDPx6F7ydb+QxyY+6FX3uXMQaP
	/lAnhJebG+ER+bG8PaOSL1UDaT+LWZrDLXQM0aVYAoJyOjlZ7+VazFK5IrS4GDhoT3XPAhWLwjT
	bGqHKrq+00l08ZO0Cro/7wQxMX+91EIbe2g6yrrIZWw==
X-Gm-Gg: AYBFou0k1VpsoY1GJ4fjbX8p8h6dts03zVJ4e1moZEqITOR17wi4JxvsLs6vodfZ2/G
	x0EC07K3xYSpAV8SSd+4s18GEagaPMpYznEmGpj5fV6uu5ZTXwm739ejrtocniYIJhOcjbqVlJD
	Z4wN+0jAQCfPouO2undCyNWXbSUGah15aeSytnwrH+wV+jcmxZhq1sdtmze3jd1dKSReJmGlnA2
	k7/OY1kpTCzljlywT0nVfH0weWnA9XiU0fNeiZ5cZ+kgwZAkD8yPsuqSE8WihBfn2VkXkmWOQ+9
	Gzuw/O7fguRJMW8piV1Lcsx9wQipnffNdN0PoKk/znt2FBolbnnlexzNIHyw2WrmK0u+X6jHF2h
	bcBbdR4v/AF2huxHzLDJe4+1JrEty3oX7EnBhUpNLi7AZg2pmthp7htDFEMAz+WGZspchtLI=
X-Received: by 2002:a05:6870:c454:20b0:4a6:9884:df32 with SMTP id
 586e51a60fabf-4a69884e90bmr5145882fac.30.1791986806999; Wed, 14 Oct 2026
 07:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
 <20261013-media-starvis2-v2-13-3670722d250a@raspberrypi.com> <179198580881.2512054.3955199510169892039@freya>
In-Reply-To: <179198580881.2512054.3955199510169892039@freya>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 15:06:30 +0100
X-Gm-Features: AclHuK8ciYOFPl8qXkuGtN5q6F621BPykoHgivZ0NylfNaoIYKBd2rEh12LHy8w
Message-ID: <CAPY8ntCjTWTtVn-EyvYYnMdgH4DFtf6eDbJOdhh4s_ZYfiNADw@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] media: sony-starvis2: Add support for IMX585
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jai

On Wed, 14 Oct 2026 at 14:50, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi Dave,
>
> Thank you for the series.
>
> Quoting Dave Stevenson (2026-10-13 20:47:12)
> > IMX585 is an 8MPix Starvis 2 sensor, so add support for it.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/sony-starvis2.c | 302 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 302 insertions(+)
> >
> > diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
> > index 1ce2b86c57ac..c9a3dd4fe529 100644
> > --- a/drivers/media/i2c/sony-starvis2.c
> > +++ b/drivers/media/i2c/sony-starvis2.c
> [...]
> > +const struct starvis2_variant imx585_variant_def = {
> > +     .name = "imx585",
> > +     .id_reg = CCI_REG16_LE(0x5a1d),
> > +     .id_mask = 0x3ff,
> > +     .id_value = 0x259,
> > +     .active_area = {
> > +             .top = 0,
> > +             .left = 0,
> > +             .width = 3857,
> > +             .height = 2201,
> > +     },
>
> s/.active_area/.native_area
>
> Apologies for the drive-by comment, I just spotted this and thought it
> might result in a painful debug session.

Indeed.
Sashiko had already picked up on that and a couple of other things,
and Krzysztof has made comments on the binding patch, so I'm hoping to
get a v3 out today or tomorrow addressing them.
As mentioned on libcamera-devel earlier, there are a couple of other
changes required for imx585, so that may hold me up.

https://sashiko.dev/#/patchset/20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com

> I'll do a proper review for the series, hopefully within this week :-)

Hold off for the v3, but that would be great.

Thanks
  Dave

> Thanks,
> Jai
>
> > +     .active_area = {
> > +             .top = 20,
> > +             .left = 0,
> > +             .width = 3856,
> > +             .height = 2180,
> > +     },
> > +     .pixel_rate = 594000000,
> > +     .pix_per_clk = 8,
> > +     .common_regs = imx585_common_regs,
> > +     .num_common_regs = ARRAY_SIZE(imx585_common_regs),
> > +     .vmax_default = 2250,
> > +     .hmax_min_link_freq = imx585_min_hmax_2lane,
> > +     .hmax_min_pixel_array = 550,
> > +};
> > +
>
> [...]
