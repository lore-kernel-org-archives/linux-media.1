Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A4B48551E
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 12:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165477; cv=pass; b=hExaMmG3fe7z26J316wqeK7hfQ6XZl+n6pQhz8TiZoKGHxIWIh8s2HOtoV/07AZkkse5ZDeYbWhHECnScJE55gKhE9f/7+JcIc1wLrcg+5TfcQIeniPodNF07QmzVC53hNevgPZL8VRUYEqnKAbA9AQWG8C8arFdu/BV59rifYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165477; c=relaxed/simple;
	bh=o9ESTc8AilBu3NYkC+X8HMlQp3tCaNfUdjSt8pFWTNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Al6PhZnxdG+zfFf7ZxiJuWZII1QRltlv/+tQhE0okqB+GXjA9C0UXvuO37wK9TPUbC5t3rnB3Y4HHaoDY5WM+nbbTfoPVtc+lMaJckONysAzGJowNE3dgWYX7dA15PhI4aAdxGcieKnZibIHv1uS8564ayp1mT0L3T+XMfYQDEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GZcG+Bfr; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GZcG+Bfr"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bf5a1c4d9so830597eec.3
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 05:11:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790165469; cv=none;
        d=google.com; s=arc-20260327;
        b=ateKs0YXQEQfE67Sbsk1RRTrXqPLUyT2jc0Czf8s5M3Nrux8doWLeL7gJp9BvkFStO
         AkAPlC1ja41yrxQXvlE0phmBLwyoCYTw1lGfBR2n96KEZIK/oPsrYgzyXJZs433HgFO8
         vYTc8irhC1cEWvYOlXkqnbPE1vtPK9ou97RhH9ZSGbHADdIpAUuxCWtInCg90F6zs66m
         dGv8Xqzfi3Z4L1ULWZuljgbQdnhdO/y3swt6vpEd+yTKzTFEPTMNVEJb1q3hdcVSqMGh
         j0/o3OJ5/KKVTwXlRm5f364DsucBbU99H6+Ucfqg2xXUTRGl3vFFKmm8mhRATGTVo3+y
         hjpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D+sAs6/yZPqQPCCjoSh/yVQa4eqK/t0Brk5AQsTggYw=;
        fh=vP0r0bcdb4ZRA4M+e944SMpEVc8nxYjiv9fbbyqOXSM=;
        b=b6GdOJObBr5tnioJCCvp7SpCEayMOM+QtlzCr+6W0cUWzWfi44If5aV9hy6G21NLzK
         l2sklu3lw0nfv/Z1sfLCQBFa7IzPs4yXikx6mRQNcCLwV1YX4N5yqFvPLKB15z2R24Hh
         gEiy/6dlTfc6FXXojqd0cFRZl1sxXtIS3weB2Bk5vHcreWxVv6ARyjAVj41OKVVIm0I2
         a2NTZykwMLwTx2CTdEqIfNSM67QfBHM0ugjvETehQ9uu+j5FDK9RYm0IheoEbCNVdRD3
         tDvUqa2IL9sWZ6In0dZhZmNQiZCdFd18bE24C3l8vJ7FJkx17QQEhsiVEeCvuiBosNK7
         /aYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790165469; x=1790770269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D+sAs6/yZPqQPCCjoSh/yVQa4eqK/t0Brk5AQsTggYw=;
        b=GZcG+Bfrctp90SgnaW2005h4KSGeXknsgAXHqcDiNpcEcYbov1jNVuX3GmtsYG3pes
         Jores8Ppn0OeG++B359bJDC+xZSyc7AMmua133RaAFNTlDSH5FQ42EJpu881IIcB+cMg
         oMzbmLDEMrwYyfL+quIY35sOCkjkCzYT0KK5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165469; x=1790770269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+sAs6/yZPqQPCCjoSh/yVQa4eqK/t0Brk5AQsTggYw=;
        b=GdECWKUuQQxmDjZYELNd7JgyWYQuxuOmhNpggd4+0ok4wibo/foQuvrH3RxPYiAmJu
         h2m5NRI7zUDS5ZqJy3m4+I74pH757PHIrRw6R4rt5ktUBKH/UuZFiF4ATFHjgAIM40Nc
         6edvEwQCBCuSnXAtkfhmGnFs3clxG2uXx311CJV1+nuFqe1lYsA27O0QCDcOobUuAU+d
         j9ZV10o+H6sxQ+C0jIrLnS00STOz9vrM6NUCKMvX1tGfo/K4o6ZZJBfb0SQUmdJM+xir
         mEudNJ33BmdKLVyoHPCaQGL1QNJli/tUzRlme7I3o09dfWADFSlEOX0NdA0yhI6Ob3zZ
         C37g==
X-Forwarded-Encrypted: i=1; AKwUvBzdn/lW4IcmYfn3/UB/IoYyl8Ao30yqx3Q/IdizFXNSIVDNFHkkhfCMNDN0LY6/Md2yV5TO70qkdtamxA==@vger.kernel.org
X-Gm-Message-State: AFuF++leG4r9Lt/0oCjx1CiOmDmhCWzruNgorFOKr8kVe1AAzeZqNcZk
	u+CglvCMiIIaYgucqcXJFsEo7uUr3uU7hEH3Dcir+n//BCITgSdKpHuOKOoZSgG3nR9KWjH0qf0
	bUsYzHhxpmrb93+74DPPeOAGSt3Mh0eeHo1CiMPyV5Q==
X-Gm-Gg: AYBFou1qCgoJ/iM6gSeD5QeJy0IVawFdDIaFwyB3l+N6vp9IwJ7NVQvrFFIU06xrATe
	eOSualhEs8DgR28kcH9n5njHRm25PktzaYsoQ7Ps5ieXW6HGWRScPJb9z7ynL0V53YN63ZI0Ncv
	1oha0BL44aut85KjYuOyjfMYGkucV21xkFfMroCFFNEXo6GZMKGYH7ayVz4ZVkEvW4jB+EKStrc
	PMCB0GrWdVv6Igv6Cao6xRHqIw1EGxFxvcaJeSFojpADGLwpB7vHAzs1r6qV+vlGeTYftP+wfj0
	/lebJJQa8sW3/r4nqHLGWfn/Mk66qwS++pwtksCMIstlP0JJnHo+IGde0L8hGaSMgsuR+1DEGrE
	t4m5e9rKF
X-Received: by 2002:a05:7300:c7c8:b0:315:9d54:6bf with SMTP id
 5a478bee46e88-33ea4d875damr2193402eec.10.1790165464415; Wed, 23 Sep 2026
 05:11:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
In-Reply-To: <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 23 Sep 2026 14:10:52 +0200
X-Gm-Features: AclHuK-84lPkb8p5nYwdkesZrMKYeKl0UBKC7sQ4h-YVRpCrvvaQQCitxdpuwrs
Message-ID: <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E support
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, 
	Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, May 22, 2026 at 4:55=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi Paul,
>
> Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9cri=
t :
> > This series introduces support for the V4L2 H.264 stateless encode uAPI=
,
> > core and support in the hantro driver for the Verisilicon VC8000E.
> >
> > While this is a first version that will likely need some level of rewor=
k,
> > it is already usable for most common use-cases and supports constant
> > bitrate rate-control.
> >
> > A GStreamer tree can be used to test the series at:
> > https://github.com/paulkocialkowski/gstreamer/tree/v4l2codecs/h264enc
> > And an example pipeline would look like:
> > gst-launch-1.0 videotestsrc pattern=3Dsmpte num-buffers=3D25 ! video/x-=
raw,width=3D640,height=3D480 ! v4l2slh264enc rate-control=3Dcbr bitrate=3D8=
000000 qp-min=3D8 qp-max=3D42 ! h264parse ! matroskamux ! filesink location=
=3Dencode.mkv
> >
> > Note that documentation for the new uAPI is intentionally left out of
> > this series since it has not yet received approval.
>
> The unfortunate part is that the spec is important for the actual review =
and
> interops analyses. That omission qualify this submission as RFC from my p=
oint of
> view. Any chances you can reply to this cover filling the blank for the f=
ew
> important bit (something similar but non spec style of:
>
> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-statel=
ess-decoder.html#initialization
>
> - Querying capabilities
> - Initialization
> - Encoding
> - Dynamic Resolution Changes**
>
> The other sections are just going to be the same imho. The ** for the DRC=
 is
> because H.264 is not that complicated, its intra only, so you can reset t=
he
> encoder (use the drain flow). So that's probably something for future us
> (VP9/AV1). Adding your view on these topics (or just matching what you ha=
ve
> implemented) will make review more constructive.
>
> cheers,
> Nicolas
>
> >
> > Marco Felsch (2):
> >   media: hantro: use hantro_decoded_buffer only for dst_vq
> >   arm64: dts: imx8mp: add VC8000E encoder node
> >
> > Paul Kocialkowski (12):
> >   media: h264: Add a more generic reflist builder init
> >   media: uapi: Add H.264 stateless encode support
> >   media: h264: Add SPS video definitions
> >   media: h264: Add stateless encode core
> >   media: h264: Add stateless encode rbsp
> >   media: h264: Add stateless encode reference management
> >   media: h264: Add stateless encode rate control
> >   media: verisilicon: Report default pixel coding for non-JPEG and fix =
JPEG case
> >   media: verisilicon: Cancel job with runtime pm put/clk disable on fai=
lure
> >   media: verisilicon: Add common encoder parm and frameintervals ioctls
> >   media: verisilicon: Add support for the VC8000E H.264 encoder
> >   media: verilisicon: imx8m: Add support for the VC8000E on i.MX8MP
> >
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   11 +
> >  drivers/media/platform/verisilicon/Kconfig    |    1 +
> >  drivers/media/platform/verisilicon/Makefile   |    2 +
> >  drivers/media/platform/verisilicon/hantro.h   |   17 +
> >  .../media/platform/verisilicon/hantro_drv.c   |  180 +-
> >  .../media/platform/verisilicon/hantro_h264.c  |    6 +-
> >  .../media/platform/verisilicon/hantro_hw.h    |   28 +
> >  .../media/platform/verisilicon/hantro_v4l2.c  |  123 +-
> >  .../platform/verisilicon/hantro_vc8000e.c     |   68 +
> >  .../verisilicon/hantro_vc8000e_h264_enc.c     |  883 +++++++
> >  .../verisilicon/hantro_vc8000e_regs.h         | 2129 +++++++++++++++++
> >  .../media/platform/verisilicon/imx8m_vpu_hw.c |  113 +
> >  drivers/media/v4l2-core/Kconfig               |    4 +
> >  drivers/media/v4l2-core/Makefile              |    2 +
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c     |   62 +
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    4 +
> >  drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c  | 1173 +++++++++
> >  drivers/media/v4l2-core/v4l2-h264-enc-rc.c    |  558 +++++
> >  drivers/media/v4l2-core/v4l2-h264-enc.c       | 1322 ++++++++++
> >  drivers/media/v4l2-core/v4l2-h264.c           |   69 +
> >  include/media/v4l2-ctrls.h                    |    2 +
> >  include/media/v4l2-h264-enc-rbsp.h            |   72 +
> >  include/media/v4l2-h264-enc-rc.h              |  108 +
> >  include/media/v4l2-h264-enc.h                 |  135 ++
> >  include/media/v4l2-h264.h                     |  146 ++
> >  include/uapi/linux/v4l2-controls.h            |   33 +
> >  include/uapi/linux/videodev2.h                |    1 +
> >  27 files changed, 7231 insertions(+), 21 deletions(-)
> >  create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e.c
> >  create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_h=
264_enc.c
> >  create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_r=
egs.h
> >  create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c
> >  create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rc.c
> >  create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc.c
> >  create mode 100644 include/media/v4l2-h264-enc-rbsp.h
> >  create mode 100644 include/media/v4l2-h264-enc-rc.h
> >  create mode 100644 include/media/v4l2-h264-enc.h

I tested on px30 and achieved working H.264 encoding with some small change=
s

Michael
