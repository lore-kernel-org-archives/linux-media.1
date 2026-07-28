Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE88339AD2A
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 17:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785258182; cv=pass; b=D2JwQJKVicPLNB9c26v8VastPCorpzL99nnAeuF9j+G62pays3ZJbGD7gyhllS9o2xteHC3JvBD5Eq7rD1YGMV7BzOX3RkJlZRusxqd+IK/qZ4MnbtkPFgZTC728ZtthVq2fhfafZydOhnmcGJi571gK72g9zA8DAZYpeFJ+ao8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785258182; c=relaxed/simple;
	bh=groxGWngifTVT5bewG236tGfo/7tcFA7IZ4+tPcJwJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D/CtRskV4+hDgIpVOcRepvHma0An09WcwEOwp5QaJGNqCWJfD9SH18UciqmNk1hR6ZGXTPvICR+910pNoDETfnf0NzQRaV1wm03NjYnqCI9xZPfwV3Dh15Vs2Fc8VrLJFKXxOipYG7myI4soIritZF3ZxHIl4ShrpUgSrxJcS2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=MFTqj+DX; arc=pass smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MFTqj+DX"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-448cf99c133so989432fac.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 10:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785258179; cv=none;
        d=google.com; s=arc-20260327;
        b=eedBn21Y8AUblqx9sQYAWfF8uZUCY/+9s08k2X3T/aXEQ1mIWvxYbYynzO/gdv6FSz
         2nDKoXJlcAwB/99M6+te1VWVoD4prnjxr1guAktNj1dwh2iosgzOGBW9NEApqanoOe5J
         cRBY/tBSiTRYO1aseZgNz0hReCn61ldwwYbfBust79oWjw688Gghl0JYagPs+/CFyr9l
         Tu3AEu+WNY9xb1+7Mwo3KoQuq9lsegk/YzIXW9g0c1AKNMsoN9IOcJBMPo6o5yazpzah
         ZQshutx9IUZyNQ5ZoBkL3OLCqSeiB3qlfN0PPI6jE1pYRydTcMediNXaXV+YxfBWE/n2
         btXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V8GPJp6TxM1kZFOBQxF7EjKvtzF1SyeUI22862FQRDc=;
        fh=zwnD6A+NrwpH1MhMde1NBroXXoBYn1M0iU+SJcU7jBc=;
        b=eKJXrHmdEsoUc3bz4bfTEyQY+lfIX9UL7DEw+CVB9x/3cR2qviHqwzcDS0BkGTx1cD
         1THThgS7VCQHXs6uhnftz56sG2wgRZPyyvBvIouuIGM+trS5Z6y650usyM0Wr51wbV1s
         ei9JPcL1Qap45uW9sOkzYUhNvE+jCLd5cQusI/OyRzz5+cO8H70A8ZxaJ90q67G3YJkn
         IYKCwLQao/UI/g9EyyAUI0In8DjXdJh5u+kItXRSjVvVqGj6O1p3ibwQZJL5ZtC5Dqqh
         J8SXJr9kFkl0cWxe0UetLnTuPwYyk765jC6M9XX3c0EwfQMWBcKuT2PuUoxG3a+HfINN
         hxkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1785258179; x=1785862979; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8GPJp6TxM1kZFOBQxF7EjKvtzF1SyeUI22862FQRDc=;
        b=MFTqj+DXdMFvdEqxVMRwmtKE9eHxYede7DnE/4YUHRTRz+apb1/BptmGsHiqjbOKjw
         2J7jDncaIkli/DTTTHeLkhyV8h9MPWXCHGm0mR4MtK04uKdKD3pg0SKBZoj/tj4Bz1qk
         IyDV4BhnsaItjeQILFWRSP1k3TP2YXTRcexj76zshx933+HwoQ17Bp6gkKn/ezputZ6n
         gpor2X73lga83XSpg5defbUf7G+vpwSYafs1ggmuz5pf6lOiuy09LQT5Fvp2+sj1SaQb
         gKTAR+BpTuySRJuhvTiiwfHQtr1FOJxVCbEtVP8jbJCQZBjlt0lZGn3uDsONW/air+A2
         JPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785258179; x=1785862979;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V8GPJp6TxM1kZFOBQxF7EjKvtzF1SyeUI22862FQRDc=;
        b=qF1eXhIupPVovKU6lKmCheUbh2VRYo6Ir3lZ7iPEWGhX8kfP9xCzFMoJAEDv6OrmCE
         YfrTiuOeo7EGCnGfkaw3fL9mGncbI7m/sSfT6F6Gv9xe3qzXYjSH+ifkuZev4gPECBhO
         okYoGq7MH2rKXgyi68F1IpkKIu91uZE43d4PI7RtcSQzUr6BUWOb5qAiazQwXuDKhVpn
         vOWDNYJtG19AyYeMOYZ+devZXqpDV3IoAsYEVYNaFaOhFE8zcosa4ZpK1Svt79WoH6mw
         gg0zrFiY2BUlXM0yAy7Duweg9iXWk4WjY2eHM8MCPrWS9VqY2ZGxNpIKwfumSKG8wKtJ
         fAdg==
X-Forwarded-Encrypted: i=1; AHgh+RpPy31x+N7QHfLhecMa7TUg2qDKhVefkTZTyKJ/LygN7zhtAS4SQ9W0MTteIKI0mDLzvGyvOMrMvWfIbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVHubLQr1lI/MTMcRLNTmBavvcREb72OAklTIC52HvXpjYewfb
	KK33gohc/0KjoZwkcbRnWU5dFCKYqVYjwj9xTQIlJ+UUdK9VnyN4JkdhGH0WSA0VGNLT0ordTzZ
	1TxcooVNNZmbjMoojxMTt5fGt+R1AHRBNljM+hvXp1w==
X-Gm-Gg: AR+sD13OGOsWkwwGcVvBD3gMqAqav7m3piJPRKbU1tT+jgFsA8WNkx873m9EFmHb7k3
	xblpr9zJD761hD3Cx7uEDdmvr2JuVAu57vqzayFg/1xPosoq+nzP7aIBq+FlzIQ2iod0vYatgoN
	ItcHf7C+CdurmT22+JVKPnhQNsG0PWfOOXQHThmlwwQtpUZ0C1McLT+vfnV8Ytrlx4GinD12tks
	NMD6dboCO1bcnEcZBeJhR9YsRSBWqhGWWdoRUtBHvri3RYo3MWhvLYDmaWXUyLwMi5T0TESBlv3
	0Dp4v6iRISQi5ZMMVSmIM1+B3VazaLsbjv6dmiolDd9tMoqGf2frm+OjqOaGv/9xH2oQ2I8muDg
	W3g==
X-Received: by 2002:a05:6820:1611:b0:6aa:da90:8bd1 with SMTP id
 006d021491bc7-6ac96a2be31mr1559545eaf.11.1785258179388; Tue, 28 Jul 2026
 10:02:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715-imx708-v1-0-1f36f54e14d4@ideasonboard.com>
 <20260715-imx708-v1-1-1f36f54e14d4@ideasonboard.com> <178413842630.1426769.14095686086162764899@freya>
In-Reply-To: <178413842630.1426769.14095686086162764899@freya>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2026 18:02:43 +0100
X-Gm-Features: AUfX_mwSdrWqYhPenfvLyVGSkh4QDNAyWTECB24t2RneV51JiZrWgV36_HGpj3U
Message-ID: <CAPY8ntBnnFTjKiKL9AooYun7fX8DEdocs3sY_PoAXgT90nGYTA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add imx708 image sensor
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>, David Plowman <david.plowman@raspberrypi.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jai

Sorry for the delay in replying.

On Wed, 15 Jul 2026 at 19:00, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi Dave,
>
> Quoting Jai Luthra (2026-07-15 23:01:28)
> > Sony IMX708 is an 11.9 Megapixel CMOS sensor, that can output pixels
> > over MIPI CSI-2 bus. Add bindings for it.
> >
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  .../devicetree/bindings/media/i2c/sony,imx708.yaml | 120 +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 ++
> >  2 files changed, 127 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
> > new file mode 100644
> > index 000000000000..bc346730e1f3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
> > @@ -0,0 +1,120 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/sony,imx708.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony IMX708 Sensor
> > +
> > +maintainers:
> > +  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> > +  - Jai Luthra <jai.luthra@ideasonboard.com>
> > +
>
> [...]
>
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index febe918d6316..b0e3abfd88a9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25269,6 +25269,13 @@ S:     Maintained
> >  F:     Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> >  F:     drivers/media/i2c/imx678.c
> >
> > +SONY IMX708 SENSOR DRIVER
> > +M:     Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
>
> I've kept "kernel-list@raspberry.com" here from the downstream tree.
>
> Given you maintain other sensors used by Raspberry Pi modules, let me know
> in case you prefer I drop this or replace it with your email in v2.

Including our internal list means it gets the attention of all those
involved here. Whether that is L:, M:, or R: seems to be open to
debate.

If you need an individual name then I guess it may as well be me.

  Dave

> Thanks,
>     Jai
>
> > +M:     Jai Luthra <jai.luthra@ideasonboard.com>
> > +L:     linux-media@vger.kernel.org
> > +S:     Maintained
> > +F:     Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
> > +
> >  SONY MEMORYSTICK SUBSYSTEM
> >  M:     Maxim Levitsky <maximlevitsky@gmail.com>
> >  M:     Alex Dubov <oakad@yahoo.com>
> >
> > --
> > 2.54.0
> >
