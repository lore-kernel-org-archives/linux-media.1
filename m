Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E578221FD4
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 05:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790227834; cv=pass; b=MnrGT5x0zbM1BUigjb+E1h9oEEBdISRItAFXJCdhjXCQgsSd9M9GksVlKLrwYw/CHHvY2maTmqQR2Sv8d19iuuJfUfhCGK1yRUET2qgAhKMwFyfBKSJS8m85zzZ6g1sJjlQRggfnGcnKzjtIUEtoaZYIR/W3QpIQ0vA/DaYx+KA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790227834; c=relaxed/simple;
	bh=Y6lfdMzfxBrctx+JVGwRqRWinjsXPeJStQCGnizzDN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I/q5L5bve24uvQKadb578W7ge9OxZaWveWP46WRrbO3iy8UChEUgSLIxKjEyrlq6TjvrIMtc5o2eSz46P4grkgBSygVAtWEKDuKyKgoHBkjbuER1QrXLfo1zRAHITeOZ8inPeA+gjT1kH4b9RvmSeWjq2NimXcM6efeUhM8D0TQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=cqKZ32fz; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="cqKZ32fz"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664ef791so1125993eec.3
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 22:30:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790227832; cv=none;
        d=google.com; s=arc-20260327;
        b=J3YmA+aTNXd5FqduyR9vO7Ncs++Ii9MOnHbLgMRmIhlM5G3aycOZIfwKNo1kc+2cSD
         cbamJjRhwY2JvNM57lkV+ZMDmivC1LMIUU3oLgsNOXfg+OKKo1A6jPFEeDJXRXatM1mW
         +8wSH1XjXHQE1jSUv5fjaEU34JxC7kHqwu7IbVey8cjNy5nVylb0+xOgzkUdCgoZAnB4
         R/McVxNvGWZgOpfE84EieF47dBbYKfntSuvxSliShMbeMjK8pdP4XO4j+xJ2cI8w3luY
         l3wV+6QV32gCdqm6zSr0zzWZFw2L4yiIQzhBM76foaZlIst4S9ukiQ1Hkojw1mCC+DUM
         tolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g/rW7+9DYBHHx7/UU3/p+sXhhnDN4m/dqMHLzOkRYuw=;
        fh=1TZAjPiWAxppikzq1Kchj2zKzXyiTISiQeyBKi46kJw=;
        b=nYyGn7bQqyHqcRX4CwutJGJ3ePSQ+ZokMrTyggs7K1KhWyEqYbUFX9J0FZdlueoYUS
         78qv/euPbDKCqkCnxFixVc/5/deba2neVRUv2xCMPam3lh1rrdMM+MyYtbtxVWDrU6hZ
         rqSElBTanDkkygVyDg8zq0sSyE4WZhSk+AtYX2iKEO5tWXhX9Bg0RY0ymJpo8up6dkGG
         Bp0ZCiJINPZd6Dl/GQRe6kDOUkcN6diEZM4E/poiL4LqunqhahBNQUMf4XL4xvS9unYe
         XTATz2kxcD2kKsSAKa3UiUM8Nau333zbmnOJF8+t9rBDLXSor3hDo9qjR6lusix7o1+H
         CcMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790227832; x=1790832632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g/rW7+9DYBHHx7/UU3/p+sXhhnDN4m/dqMHLzOkRYuw=;
        b=cqKZ32fzb5+rZNhbvs7BqlbuV+ArnWdl9kU55DykaD4nll5Buwuz2CK1Kpaat0oT4o
         wTF9q0wqkPThmEA3GMsQDdE+ad7P1tAnOssIn22LjC5AtTxG8uvRUi47ztDsDjZ56jqL
         xEUi0M38EotP/ond7iJ4B6hM7WjsDrGK4nO1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790227832; x=1790832632;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/rW7+9DYBHHx7/UU3/p+sXhhnDN4m/dqMHLzOkRYuw=;
        b=kwilPC0HhL1IoNugtqbYaat1WrYecmqHqpQ1YiqRFHtcFXsdqd9erjToqKMVm4b5Hk
         nhjkyvouvuwzyKlg/LIh2Aobki3p1sVqMvk6vgKnVisHk0wnafktGpzbjjeOwd4Muwrr
         1bF9o02G3CdbnsLN8jgGB+vMMyf5/0d2/QKceaUUyK4J7qWEJ3vjSq2O1njmUbmRLPuR
         I7iRyQkpLiGYblwLSl1YJj1wVSxWppQL5e2LvKDQweQFjx5jibfBxwCRrT5ww3ObIXW1
         3a2hs5/d0z3orx7ZowiLCETs0cAhZ/8nO0giDSagLebZoSlsgjJV0q6MaFBA517BQYry
         sH3w==
X-Forwarded-Encrypted: i=1; AKwUvByhtsSZmu2rFuYi3rqiE80naD4KdrBxYaAWRuwEeE15iYiv/qIKMMPAYN6Owf9eOLOey/NM9tFxy5i1Pw==@vger.kernel.org
X-Gm-Message-State: AFuF++n6bsYmfL+lXRipxlbeIqZzg/kXYYuZ4bwpPPtqsy1e/5l+bnZM
	/5YHmdIsBLdb9RnhSSkEJQM2tKkwBYUX82Ny6WtgsDYsfyq2uvreRzvhpBrv/ctckYBJ3dsQz+J
	b0uOpXm/0TmcQFULuWU9W9ZuBq66Zd/vC8wVaO3OubA==
X-Gm-Gg: AYBFou2V5srlfxoclqm2lZeHXUd/qatSVwsjfUSie78uqnqdF67teMpNUgdflSlxyyr
	Ui7E4+onhLK/qru7HfOhRe5DUXfWEDAiHeSOqSs6UnI3XmCXldeeMGbvbSG6XUpucz//tLZEvmG
	dhYumzmSXv7Pf58G+Bk7zA3VEGdPPtH5mfdCpu5mxa9QV+bDBAsVJTWdnmPpK6cJsYfEOtvawVt
	ScYVgNrYaFrzFcoMGHdmno9K4DX+M72SVl0yowyPrfi6ZVmD13b31Dd+1LZ+qq4CWbpIOLQBCcy
	SaNLO9I/7e4ai0QYNvXBFdDUxYk95Z0c+TW2MQyCcTQ/Bonsp0HgIER7EQQ9osWXp0RSO1+ANp5
	BTr8SoA5TNA==
X-Received: by 2002:a05:7300:8d14:b0:33b:e264:362a with SMTP id
 5a478bee46e88-34004a89a19mr1123625eec.13.1790227832039; Wed, 23 Sep 2026
 22:30:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com> <arQxC3DmDyVIGdqq@collins>
In-Reply-To: <arQxC3DmDyVIGdqq@collins>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 24 Sep 2026 07:30:20 +0200
X-Gm-Features: AclHuK9fIcxWA7Sv69t_uK1zMqbihMAU90hONvsInRjWG6YY9lFMwau8XYvA7qg
Message-ID: <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
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

Hi Paul


On Wed, Sep 23, 2026 at 10:05=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
>
> Hi Michael,
>
> Le Wed 23 Sep 26, 14:10, Michael Nazzareno Trimarchi a =C3=A9crit :
> > I tested on px30 and achieved working H.264 encoding with some small ch=
anges
>
> That is a bit surprising, the Rockchip PX30 should come with a Hantro H1
> (using a modified register layout) while this driver is for the
> Hantro VC8000E, which is a newer generation with very different registers=
.
>
> Maybe you ended up using CPU-based decoding when testing?

Using
>
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

I have added your patch to gstreamer

v4l2codecs: add the stateless H.264 and VP8 encoder elements

Backport of the encoder work from the branch v4l2codecs/h264enc of
https://github.com/paulkocialkowski/gstreamer (commit f59de5779ef1, based
on release 1.26.0) onto the gstreamer1.0-plugins-bad 1.28.5 this build
uses.

Generate the right element and encode stream:

gst-launch-1.0 videotestsrc num-buffers=3D100 !
video/x-raw,width=3D720,height=3D576 !  v4l2slh264enc ! h264parse !
matroskamux ! filesink location=3D/tmp/t2.mkv

And playback over Wayland.

Solve some problem. I have implemented:

const struct hantro_variant px30_vpu_variant =3D {
        .enc_offset =3D 0x0,
        .enc_fmts =3D rockchip_vpu_enc_fmts,
        .num_enc_fmts =3D ARRAY_SIZE(rockchip_vpu_enc_fmts),
        .dec_offset =3D 0x400,
        .dec_fmts =3D rockchip_vdpu2_dec_fmts,
        .num_dec_fmts =3D ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
        .codec =3D HANTRO_JPEG_ENCODER | HANTRO_H264_ENCODER |
                 HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
                 HANTRO_H264_DECODER,
        .codec_ops =3D px30_vpu_codec_ops,
        .irqs =3D rockchip_vpu2_irqs,
        .num_irqs =3D ARRAY_SIZE(rockchip_vpu2_irqs),
        .init =3D rk3036_vpu_hw_init,
        .clk_names =3D rockchip_vpu_clk_names,
        .num_clocks =3D ARRAY_SIZE(rockchip_vpu_clk_names)
};

I have advertised the:

       {
                .fourcc =3D V4L2_PIX_FMT_H264_SLICE,
                .codec_mode =3D HANTRO_MODE_H264_ENC,
                .max_depth =3D 2,
                .header_size =3D H264_ENC_HEADER_SIZE,
                .frmsize =3D {
                        .min_width =3D FMT_MIN_WIDTH,
                        .max_width =3D FMT_FHD_WIDTH,
                        .step_width =3D MB_DIM,
                        .min_height =3D FMT_MIN_HEIGHT,
                        .max_height =3D FMT_FHD_HEIGHT,
                        .step_height =3D MB_DIM,
                },
        },

Create the rockchip_vpu_hw_h264_enc.c. I need to test this on rk3399

I have a small change only in the common part. Hope that it's a bit clear.

Michael
