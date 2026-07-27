Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D456379C3F
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 08:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140719; cv=pass; b=ujDDfbsvoihJtVypaBRtIL8Q3UFw8TghUqLe33GlnGglmG54W0Fcjm9v1hdnEFI1OiEM15bJmCGNXUgdkr/pddw1T7ssIBXep0vyXLOHkZllK93Yx6QFOc6DyhtUDPZU+eWUUc7oR8gJN2iNoepi6x8cBsekP5lsPB/2BWb3ygw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140719; c=relaxed/simple;
	bh=kfFHddLq7JV5DXyC1YIB5QjrnGvYaMpx2KZGptXwKn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PINEKMKtkcf911fOewglmA9IIfqIY+ieYNqeFy07zoqZhicCehAw5Bfkb+3FfOtgRmhdC7dWAHZfsSJh02vBBCyihGTi9/+EWjaLl55ivSYW+8bYzbt3l3dD1LDuWkkdmzNE73GSwCBj6uHzVFMAdFk5uEWE39j8j6G0xsFyRjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOojWHN5; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOojWHN5"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-660a40aac63so312563d50.0
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 01:25:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785140715; cv=none;
        d=google.com; s=arc-20260327;
        b=UPb+B6LtlHExdGQjXd3RFvRIs9HptLn3baEJm23Wg/S3Nw20s0M2u6YZqR5XbLuaLt
         CQazsEprCpePUNJamPkH/smELFGYanGtT4btimUI5YcY0OwXweGVdvja3Bq5XFao/SDu
         aQIvAEny1rZeUExweSR3lGJgW644JIAqAy0ZYpnCIHFqvIh7YX5x4eyCfSuQfHQ+Sokz
         ifYLNh7sfgr2MNfAgLNYqWD9yVoV2Z5gErtEDreSYz13Nh6c3JFK7eWNLGK9F84HJlxK
         v7jnK8p8u581DW8mstfiEpXkMJxEw+cmpSaK0hC+WFJmKxeAjjx1scPyNVlT0YUqcuhb
         VJmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KnuH9JNzZqkRfD81Q4WhVtoZdJkHzYHH48enGdGSTvg=;
        fh=109QbDg0QF7br7v2JnVAwOLYhOw+L3tCgSegCgc+4Q0=;
        b=B29DhR2ReYciCXfd2UqAcZW9M2lymnGH7iek87VhueCFE7GPEWFlXA1TFihry39jG0
         CAYEh5wBJKsdKOywpGgng5t5G4zWv5M21xjxEO+CRbMlFb/os0WYp1hFjrR3QfaFR2nm
         mqqms1T8N/x3cEwS6RhfF6cHrtGx7ln8IHvsTF/Q9sm/hvkuLEh/LME2c/7XNS/YHFMc
         PEYsdZCwnK3L8kvXgYmfV4usFeWW63h9xM8jINg51bOhcO0TYS1Ptd15dkqyKBR+8OZB
         SVrZTM4fh86uRBBy9GEqWtWxb5y0Qbfmx8+QvKzf20UPr/ydcGCKjeiX17kI/h2ae+O3
         o/AA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785140715; x=1785745515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KnuH9JNzZqkRfD81Q4WhVtoZdJkHzYHH48enGdGSTvg=;
        b=VOojWHN5cC0SaS/utqsELUgdOUyxwiyX7DdFjJNhtRW8VzjvMhUNWwsKsuwXQ4GdM9
         b0YUeVubVGpdUPPMxzIVRkGI2wxM3bbiV7jyRQzk0A2W4Foqn5YP+6oX+zNYTW4dAQmi
         bacYVqc/Rfh6zKwO/1qV1Uhb2INTkd7gYJpicNvVsnqGc/wklXJ5UckAwtkZ5QIDco8H
         Id2fiF4mcT4Pwu2of1kpUXy2u7FPzNw9o8DdwmrbWwamuS9ZBnECyKAdA4twcmr3r7IP
         gIkwrd4woRAvan5hLW41esTCvsxxEIoeyJqcRhEGOmyyiP+fZiTy85iyS9pMOp5fqd/Q
         jCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785140715; x=1785745515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KnuH9JNzZqkRfD81Q4WhVtoZdJkHzYHH48enGdGSTvg=;
        b=VmwSVEZQFtEZtR5YQjSLy5oVg649LiFIl4bbIk6rbk1YYnpPVak8GFxaUXeC7MEYKy
         hEiBXtVU/+HnYJkRvptk0aSuVK1YDOTYHGIESgvampUIkJcbnZKC3GW9NXIBekiPG+Cz
         f0ClU4M/p4ScNA3ze2agc1MzvtHrX0Bn7Kb9OQzxfY/MSTo6P5cQkLu2WQBHcer65rLj
         976yWJMD6jdMZrum3yuV8X4TW+9lLUQywz9ybfySzpsi9iFtpjHBQ40fTjQV/Lhr4Sis
         jzBAjbjDOFkTaxkX1fKi1fkI+RE59mcLJZgUg4xgQNGLYtsv8qWPEZQbPa8GuLWxFdrV
         IAFQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJm0spX02niFrAfWm2FkbPUgtROp474fHT8Bl92DMGT1CUh7t2GJZkuviORdXGsRSf3/wSwYLouP+E3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3fCfWzMvSB59BNRXm6ty0t6eVpAYV4/gmpEyGGj/oSCEDqW1t
	TP6AudSQj0iVaEBiebhtjcOIBml9RWz34R9C+wbVMKy8P/VgikUeYTwjpcbNypy8He43bbuBQy+
	3GdBd6dp6ajQlep7OlR6YeYRFdW8Qkd8=
X-Gm-Gg: AR+sD11CH3aU8Vte/dPkMZHKPQTrx/YGsCgwrKaN19OJc8MJr5qic3d+w/q7fJktwbJ
	ceuNZglnTlpEcAXPHe9/e69KiAsgXC/RcsoE2qmVi97nDO7Wlk9WdNoeByxPItYGQXp2WhvYtx+
	hobmIKWvilfo9zeurCEQLwkpSe3zGrsJjvcrJu0kH83t+yzzuhnOp0+keMiRv4VYLkigzMlQ/tP
	tyF3fC/4oAj6KHIAyW6cNw5nCW6e01bcs9vCyZdQtbDt7+z7w6aKl1BpbhP51UVBggkObxFrdB1
	TRlP8pFamcpMJqEu5gSQ
X-Received: by 2002:a05:690c:660c:b0:80c:80a2:9761 with SMTP id
 00721157ae682-81f69e5ced9mr23345447b3.6.1785140715181; Mon, 27 Jul 2026
 01:25:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com> <CAMhzubo-NJMro7+XbxD=MhSXiRp14chatDcn-=1Hsiak786uQw@mail.gmail.com>
In-Reply-To: <CAMhzubo-NJMro7+XbxD=MhSXiRp14chatDcn-=1Hsiak786uQw@mail.gmail.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Mon, 27 Jul 2026 10:25:02 +0200
X-Gm-Features: AUfX_my4MA58ugAK6hzdfyussxxhX0Ow06GltjruBbp1b6Mur8Y-LGUFlM4WYQo
Message-ID: <CAEWPSH754+Wq7W4CVKNqjuMZ22q_S79K-Tin9SXYw1RCYQwLwg@mail.gmail.com>
Subject: Re: [PATCH 0/4] media: rkvdec: Add VP9 support for VDPU381 variant
To: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Cc: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Orange Pi 5 Plus leg of the three-board run in the cover letter, as a
tag you can pick up. 7.0 base carrying this code, not a build of the
series as posted.

Tested-by: Igor Paunovic royalnet026@gmail.com


On Mon, Jul 27, 2026 at 8:44=E2=80=AFAM Francesco Saverio Pavone
<pavone.lawyer@gmail.com> wrote:
>
> Rock 5B+ leg of the three-board run in the cover letter, as a tag you can
> pick up. 7.1 base carrying this code, not a build of the series as posted=
.
>
> Francesco Saverio Pavone <pavone.lawyer@gmail.com>
>
>
> Il giorno dom 26 lug 2026 alle ore 22:28 Venkata Atchuta Bheemeswara
> Sarma Darbha <vdarbha0473@gmail.com> ha scritto:
> >
> > Hi All,
> > This patch series adds the initial VP9 support for VDPU381 present in r=
k3588.
> >
> > VDPU381 supports VP9 Profile 0 and Profile 2 up to 7680x4320@30fps.
> >
> > Tested with fluster (suite : VP9-TEST-VECTORS, decoder: GStreamer-VP9-V=
4L2SL-Gst1.0).
> > The 224/305 score has been reproduced independently on three RK3588 boa=
rds
> > across three kernel bases: Orange Pi 5 Pro (RK3588S, 7.2.0-rc3),
> > Orange Pi 5 Plus (RK3588, 7.0) and Radxa Rock 5B+ (RK3588, 7.1).
> >
> > Most of the remaining failures fall into a few known categories:
> >
> > - All vp90-2-02-size-*.webm variants where either dimension is
> >   smaller than 64 pixels fail because the hardware does not support
> >   frames smaller than 64x64:
> >   vp90-2-02-size-08x08.webm, vp90-2-02-size-08x10.webm,
> >   vp90-2-02-size-08x16.webm, vp90-2-02-size-08x18.webm,
> >   vp90-2-02-size-08x32.webm, vp90-2-02-size-08x34.webm,
> >   vp90-2-02-size-08x64.webm, vp90-2-02-size-08x66.webm,
> >   vp90-2-02-size-10x08.webm, vp90-2-02-size-10x10.webm,
> >   vp90-2-02-size-10x16.webm, vp90-2-02-size-10x18.webm,
> >   vp90-2-02-size-10x32.webm, vp90-2-02-size-10x34.webm,
> >   vp90-2-02-size-10x64.webm, vp90-2-02-size-10x66.webm,
> >   vp90-2-02-size-16x08.webm, vp90-2-02-size-16x10.webm,
> >   vp90-2-02-size-16x16.webm, vp90-2-02-size-16x18.webm,
> >   vp90-2-02-size-16x32.webm, vp90-2-02-size-16x34.webm,
> >   vp90-2-02-size-16x64.webm, vp90-2-02-size-16x66.webm,
> >   vp90-2-02-size-18x08.webm, vp90-2-02-size-18x10.webm,
> >   vp90-2-02-size-18x18.webm, vp90-2-02-size-18x32.webm,
> >   vp90-2-02-size-18x34.webm, vp90-2-02-size-18x64.webm,
> >   vp90-2-02-size-18x66.webm, vp90-2-02-size-32x08.webm,
> >   vp90-2-02-size-32x10.webm, vp90-2-02-size-32x18.webm,
> >   vp90-2-02-size-32x34.webm, vp90-2-02-size-32x66.webm,
> >   vp90-2-02-size-34x08.webm, vp90-2-02-size-34x10.webm,
> >   vp90-2-02-size-34x16.webm, vp90-2-02-size-34x34.webm,
> >   vp90-2-02-size-34x64.webm, vp90-2-02-size-34x66.webm,
> >   vp90-2-02-size-64x08.webm, vp90-2-02-size-64x10.webm,
> >   vp90-2-02-size-66x08.webm, vp90-2-02-size-66x10.webm.
> >
> > - vp90-2-05-resize.ivf, vp90-2-18-resize.ivf and all
> >   vp90-2-21-resize_inter_*.webm variants fail. These streams change
> >   resolution mid-stream on a non-keyframe, and a reference frame
> >   from before the resize ends up unavailable by the time it's
> >   needed again. This is being actively looked into:
> >   vp90-2-05-resize.ivf, vp90-2-18-resize.ivf,
> >   vp90-2-21-resize_inter_1280x720_5_1-2.webm,
> >   vp90-2-21-resize_inter_1280x720_5_3-4.webm,
> >   vp90-2-21-resize_inter_1280x720_7_1-2.webm,
> >   vp90-2-21-resize_inter_1280x720_7_3-4.webm,
> >   vp90-2-21-resize_inter_1920x1080_5_1-2.webm,
> >   vp90-2-21-resize_inter_1920x1080_5_3-4.webm,
> >   vp90-2-21-resize_inter_1920x1080_7_1-2.webm,
> >   vp90-2-21-resize_inter_1920x1080_7_3-4.webm,
> >   vp90-2-21-resize_inter_320x180_5_1-2.webm,
> >   vp90-2-21-resize_inter_320x180_5_3-4.webm,
> >   vp90-2-21-resize_inter_320x180_7_1-2.webm,
> >   vp90-2-21-resize_inter_320x180_7_3-4.webm,
> >   vp90-2-21-resize_inter_320x240_5_1-2.webm,
> >   vp90-2-21-resize_inter_320x240_5_3-4.webm,
> >   vp90-2-21-resize_inter_320x240_7_1-2.webm,
> >   vp90-2-21-resize_inter_320x240_7_3-4.webm,
> >   vp90-2-21-resize_inter_640x360_5_1-2.webm,
> >   vp90-2-21-resize_inter_640x360_5_3-4.webm,
> >   vp90-2-21-resize_inter_640x360_7_1-2.webm,
> >   vp90-2-21-resize_inter_640x360_7_3-4.webm,
> >   vp90-2-21-resize_inter_640x480_5_1-2.webm,
> >   vp90-2-21-resize_inter_640x480_5_3-4.webm,
> >   vp90-2-21-resize_inter_640x480_7_1-2.webm,
> >   vp90-2-21-resize_inter_640x480_7_3-4.webm.
> >
> > - vp90-2-09-aq2.webm,
> >   vp90-2-09-lf_deltas.webm,
> >   vp90-2-15-segkey_adpq.webm,
> >   vp90-2-19-skip-01.webm,
> >   vp90-2-19-skip-02.webm,
> >   vp90-2-19-skip.webm,  vp90-2-22-svc_1280x720_3.ivf,
> >   are still failing and not yet root-caused.
> >
> > - vp91-2-04-yuv422.webm
> >   vp91-2-04-yuv444.webm
> >   fail because the hardware does not support the format these
> >   streams use (4:2:2/4:4:4), only 4:2:0.
> >
> > The base vdpu381 VP9 driver support was introduced by me. Profile 2 sup=
port
> > was added by Igor Paunovic. Francesco Saverio Pavone fixed bugs in
> > the segmentation map size calculation and in the altref vertical
> > scale factor. Igor Paunovic also fixed a decoded-frame stride bug, alig=
ning
> > bytesperline to 64 bytes in rkvdec_fill_decoded_pixfmt().
> >
> > ---
> > Igor Paunovic (1):
> >       media: rkvdec: align bytesperline to 64 bytes in rkvdec_fill_deco=
ded_pixfmt()
> >
> > Venkata Atchuta Bheemeswara Sarma Darbha (3):
> >       media: rkvdec: vp9: Changing get_ref_buf function name to get_ref=
_buf_vp9
> >       media: rkvdec: Move vp9 functions to common file
> >       media: rkvdec: Add VP9 support for VDPU381 variant
> >
> >  drivers/media/platform/rockchip/rkvdec/Makefile    |    2 +
> >  .../platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h |  234 +++++
> >  .../platform/rockchip/rkvdec/rkvdec-vdpu381-vp9.c  | 1067 ++++++++++++=
++++++++
> >  .../platform/rockchip/rkvdec/rkvdec-vp9-common.c   |   65 ++
> >  .../platform/rockchip/rkvdec/rkvdec-vp9-common.h   |   92 ++
> >  .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |  121 +--
> >  drivers/media/platform/rockchip/rkvdec/rkvdec.c    |   73 +-
> >  drivers/media/platform/rockchip/rkvdec/rkvdec.h    |    1 +
> >  8 files changed, 1537 insertions(+), 118 deletions(-)
> > ---
> > base-commit: 1229e2e57a5c2980ccd457b9b53ea0eed5a22ab3
> > change-id: 20260726-b4-add-rkvdec2-vp9-vdpu381-3d1bd8fca4f5
> >
> > Best regards,
> > --
> > Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
> >
