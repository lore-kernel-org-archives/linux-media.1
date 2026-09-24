Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91EC3DB30B
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 19:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278714; cv=pass; b=DuTSvOPjnFaMFufINr14VRbR59Z1ZsQiWNxs1/TpM4WXVoy0gKLdZA63Gh3/vpmCb0CC+iXF0V03DZ7YmgssrQFOw7JDdlPpa3RY1BFZsPiDa8ETS5FelCRU8CstnXJHKSJpLLo6AZxH9ngDd3VMd6IYMn03vp//TlUjxngdAtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278714; c=relaxed/simple;
	bh=kRmPVZ4kecfhKStpwP/qseJ7BCFTN/An8sItpAF8EtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a0lp31wuqfdtFWCknyldwSXMncpvQz3wKa1rySlmGAoygcno8uHApeWHhp/AFWSbng99+Ah35r5EYTt/eQtgeiSGW/T3OSEZL0p0ZbDc06daS/HgFVIjBj+4CUViHY8iz6IqgH69hunHJF3pywcUHJBMWyiLGV3iFs9rKvD/IlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=fGFTbzFk; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fGFTbzFk"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-671563fb8beso331560d50.3
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 12:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790278708; cv=none;
        d=google.com; s=arc-20260327;
        b=cFg+bEyG57RbasqAOCFZuiwYIqyD8opvieB4zg4hRiCE8mWAo5AXnE/rkelX0Neob6
         Xm2vbAhMMbkx59ewdUzilUQb9AX3RNgw5JKQw0C7N/m4Y8khLcZBdq3CO4ynJDTFNS5Q
         WHL+HDhq7HuemQHr2uxUhzDhxiORt7nmIRSfNErr2Lm7CPDH3G5/YHlbjwDDbVhhu2X2
         tdZ3wBJ+MBmv0oeMZhL9BTgtStGMIj9QZz7VGirri/SnNjC7h/H766Z2/eaURXoO5z7B
         Qp/6FiA/H0mQmyG7KDZ7abj9ZjU9+G91ExPdVz2/BB8o9v3nSyJY/we2cgczxlf+1mIG
         f2Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NVqptNo8neXdqpn4T2EkAUKxv7O1l9NSFa3yzxG78T4=;
        fh=b6bdUZSdmHCEzcxNr5DMdKzZof+8V0JkFjs2ZA9Wtxs=;
        b=Y7UxELkDFLMr8lDALbQw6/sc3SDBP+9F+v28dOLCaOHaaTsiKKXI8m/JeHfv1il2qM
         LKnXX8golwZTZTsuPnNCwB8Vg4yacDnI12DG5bJNqcngfAlR78Skh1BOtodx52/lneeo
         rG7Fq6GPYdSSAAdVAU8Lvyf+eW6kyzUsYOxk5o/IMekFmVUEO5esAiUlSEhSf51EFd1F
         HYOSJifAc5SXIz1qSNQjIg80RBYswI5CA3/YPCCUK11ARPj9k5e/WzoKL/AcnCndg/on
         hr3DB5U3NXRXYGTe4nWWQE/z4Jd42FQgg9L1hX0cybv3AacH9Z3nAZogcTTGvaXrsV5n
         bL9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790278708; x=1790883508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NVqptNo8neXdqpn4T2EkAUKxv7O1l9NSFa3yzxG78T4=;
        b=fGFTbzFkD2vohgWY7lcS4JIlpogquzpzQWX9qpvL7OPbZs8Akb3FxfbeSc1MhCSPMT
         TolFECnrfA/rzVaXnfQh8ggSJbez6gD6t1qLOYDR5JwkUmBRKEXoLbRvofqGA2rjywp7
         Y40YHBYkP1vt8sRaywet6uEgRAMocR6pX1O44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278708; x=1790883508;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVqptNo8neXdqpn4T2EkAUKxv7O1l9NSFa3yzxG78T4=;
        b=vpC4835v0elInK8o1B0Y99nTsvd517VNTuK7IZQNSW58UU+AqEeZXt2HBEXl/COlIN
         Ibqikeqc4SvQsGAStIlRBfD9anNEWUBGq7oBKd0nMMrMit3yn/I8UmpdmDLfj4NQzWbS
         +QK7WD1185dN8r9ZrGLf7R6AGDbTqA7IyLCkfK/HNgLc/+uMmn5y69JeYXhDP+i3ojo1
         hGz2RArflGyUHf8wIwPzyvEdj/b4+B0m4rWKnuVIYk2HAnLZdtVxNtaMwVD3LApKaYgq
         5Ud+VN+kk7yUaVCfYPASKmMSkKcGg4VPGC0dNqBOmlphfFYcDn04bdNufu3UiepCBHYo
         fqIA==
X-Forwarded-Encrypted: i=1; AKwUvBzLFzHcq7DuaQNkScApkDXr7mCjcYWWnkfOd40UB2S4FjpGILY68b10ZJcN70gCH59K97JvGkVMEuvRNA==@vger.kernel.org
X-Gm-Message-State: AFuF++kW9Pk1WGBRxqWkMOmEM4sfn7as7WF+oqRvNF2Kghw07ET9X1jG
	qSOjtf4Btnf1AINLqS9sxYJGlMzlr/Zz3MvZKEofHllpV3Hc40/nDzyF9PDsGw7dhrmInapZIiB
	qbqccmxPkXQgbpfEUQlbAQ1PTjErd6p3sarM9fQcKxA==
X-Gm-Gg: AYBFou021StLT2AN5J0TFqBOajFazVoOX2+QU7oUNPcWd2rZlA1KWOEBZg2HEGC4GsR
	j+93mpwO+6I4+LrvdfHsmNZGvh89FkeLPvLay3W2nZv6SCxNfTSRcdYBvWt39HxEN0EqJdegAk9
	zNSx5rJyth2QhwloVv2LRio9h07xqzdsuC8LHhNHT16/M5ySygZ9/ART4q3SQ5iE8TNc3i+vCqv
	5FLU+cuIZ3J16n7b9RhG/m4GLvjU9jydKCvSLTJanbhL26k09AlHNdtzNZZq/cUxWUhz6EpuAZl
	O2kbl5OSNUAUk3kh2n5BCIfO5K212dWfGP/U95fH4QbhpD2cJq0zODauCeSwQdqiExl4a+yLwIg
	tN0w7FEVOLg==
X-Received: by 2002:a05:690e:d56:b0:671:4d9c:91bc with SMTP id
 956f58d0204a3-672ed3b8549mr1938576d50.78.1790278708232; Thu, 24 Sep 2026
 12:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
 <arQxC3DmDyVIGdqq@collins> <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
 <arVnQmik-CveaAkY@collins>
In-Reply-To: <arVnQmik-CveaAkY@collins>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 24 Sep 2026 21:38:16 +0200
X-Gm-Features: AclHuK_bBSWqL6tBSki95SII0DxHlrmdAk4MDI9hfl1lTZlay91QzSspJUrifKY
Message-ID: <CAOf5uw=K5tWiodM0SEP_nFn0vBv3=YRFWrY1Bd-1jPmZtM7G4A@mail.gmail.com>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E support
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, devicetree <devicetree@vger.kernel.org>, 
	"open list:FREESCALE IMX / MXC FEC DRIVER" <imx@lists.linux.dev>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-media <linux-media@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, 
	Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Paul

On Thu, Sep 24, 2026 at 8:09=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Hi Michael,
>
> Le Thu 24 Sep 26, 07:30, Michael Nazzareno Trimarchi a =C3=A9crit :
> > I have added your patch to gstreamer
> >
> > v4l2codecs: add the stateless H.264 and VP8 encoder elements
> >
> > Backport of the encoder work from the branch v4l2codecs/h264enc of
> > https://github.com/paulkocialkowski/gstreamer (commit f59de5779ef1, bas=
ed
> > on release 1.26.0) onto the gstreamer1.0-plugins-bad 1.28.5 this build
> > uses.
>
> Yes this is the right gstreamer branch to use here.
>
> > Generate the right element and encode stream:
> >
> > gst-launch-1.0 videotestsrc num-buffers=3D100 !
> > video/x-raw,width=3D720,height=3D576 !  v4l2slh264enc ! h264parse !
> > matroskamux ! filesink location=3D/tmp/t2.mkv
> >
> > And playback over Wayland.
> >
> > Solve some problem. I have implemented:
> >
> > const struct hantro_variant px30_vpu_variant =3D {
> >         .enc_offset =3D 0x0,
> >         .enc_fmts =3D rockchip_vpu_enc_fmts,
> >         .num_enc_fmts =3D ARRAY_SIZE(rockchip_vpu_enc_fmts),
> >         .dec_offset =3D 0x400,
> >         .dec_fmts =3D rockchip_vdpu2_dec_fmts,
> >         .num_dec_fmts =3D ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
> >         .codec =3D HANTRO_JPEG_ENCODER | HANTRO_H264_ENCODER |
> >                  HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
> >                  HANTRO_H264_DECODER,
> >         .codec_ops =3D px30_vpu_codec_ops,
> >         .irqs =3D rockchip_vpu2_irqs,
> >         .num_irqs =3D ARRAY_SIZE(rockchip_vpu2_irqs),
> >         .init =3D rk3036_vpu_hw_init,
> >         .clk_names =3D rockchip_vpu_clk_names,
> >         .num_clocks =3D ARRAY_SIZE(rockchip_vpu_clk_names)
> > };
> >
> > I have advertised the:
> >
> >        {
> >                 .fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> >                 .codec_mode =3D HANTRO_MODE_H264_ENC,
> >                 .max_depth =3D 2,
> >                 .header_size =3D H264_ENC_HEADER_SIZE,
> >                 .frmsize =3D {
> >                         .min_width =3D FMT_MIN_WIDTH,
> >                         .max_width =3D FMT_FHD_WIDTH,
> >                         .step_width =3D MB_DIM,
> >                         .min_height =3D FMT_MIN_HEIGHT,
> >                         .max_height =3D FMT_FHD_HEIGHT,
> >                         .step_height =3D MB_DIM,
> >                 },
> >         },
> >
> > Create the rockchip_vpu_hw_h264_enc.c. I need to test this on rk3399
>
> Then I guess this is using register configuration from the earlier H.264
> encoding work that I've done at Bootlin, adapted for the new stateless

I need to check mpp code too

> encode helpers? That part is probably not quite trivial, which is why I
> was a bit surprised.
>

I would like to clean up the patches before sending, and check all the code=
 to
not make trivial mistakes. I'm not persistent, so if we aren't, one of
my colleagues will take over.

> > I have a small change only in the common part. Hope that it's a bit cle=
ar.
>
> Yes in comparison to the register configuration code, the platform
> changes are rather small indeed.
>

I wrote this email to state that this change would be impossible
without your work.
I'm currently working on other things, but I had some spare time. Now
apart from that,
I would like to ask about the status of the entire proposal and uapi change=
.

Michael

> All the best,
>
> Paul
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.
