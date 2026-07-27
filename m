Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278793DB321
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 06:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785134671; cv=pass; b=NRY7F0M626vxzn7cPxHk34bRXsQTEwpJTXPv84RRBXV0PDONRhdTnPC2CnsdlLF7PTEFm2tx5KJ0YVtxoIOI4Aar0tDIPNfEM0NDxOnck3d47fyfuFz/h4NaeMgx6wkCnX34BhX6JAvPfYbGNf3/zbQPwCRZnG9Yher/TfWjWJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785134671; c=relaxed/simple;
	bh=acvLY2MBWWiB4xKOz9R+iQo1cRxy8YD5tSb5zDn/VXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMxn1ms1nv1KT9dj7GPN0QpeUa/2oXqwfOZRTwI6TyzqkRVZKFtlzDgQ5xE1gxoFhlaTLpB2wDveDf/8NViKGmUcM8QO+EbqNF3WzCqfSNPxA29aiPULeCTKXBm3I6Bitmz6yCg3Qa3YO4BhWgkCy0eQNCN7Jv0CakKH6Qby2qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnWLpgDJ; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnWLpgDJ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so1743612a91.0
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 23:44:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785134669; cv=none;
        d=google.com; s=arc-20260327;
        b=UfJJFz/Qe7LmI2zSAXM1uSg10bQYiYmivpp/9sGfEVq1y6FGRAYaskOTz2wZsG38az
         TyDe6AMs4vnm1Jn5CIBQA8fRRnPOgyutuDVhmVY6LaxL04wtE447TAdKkUs0xU8CNwby
         ShxiAn9lAv1dggnyFtOZx9U6gYruAh1w0aB0+3BAl8/JBHZqwvRYl45WTIXRJUrJ9GZq
         OgDN4vYt5i3uEwM1zUjzJF9ha6lkQD8Kwhtv7L/PfHJ1tRzbBlVNLtLLTIWRi+KSq8r5
         wJPwi/6/qESzTkaOi2WWFQ7oWAQsc6JQoPMXmoAE35lwlFs56xic3UDS0vbRnrIuBXlR
         fCnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VVhy2zBHRxUQesgFWLmDsfBmAyKMFgT84KyKy5f5YfE=;
        fh=zLoRCCTUy9xkAiabf8TkexQgesAPdNKyXrjZzkfXRTQ=;
        b=HW1umB68bNZVIk87OSJt/JOKxYQJj/9VxO5XiPMThMfbn6oofaDQVtt4l7O6RCuW/0
         LMKUNgHRMqmIXEeuz9WDishlbOetydg7tLKoZAgqcnYbtmt5YpQO7nBl3IX5dHxAipnp
         XxajFy/GTErcVbCIpUE1bqYKxiAtnbjtk1/UP5d/slLTCGGk/CVyCGeP/ENN8oPgjPEg
         NQK47IeOYVI8+B47BnrA/cq5KDXFUXPLYBNBJfCthiIIgc99xG6Aw3ytdyltM1G2GTB0
         GyqyR+c3ou0zYeDhoVSoCDVh7RBRbiYWg0uxR+jazkSc82KQGxrYLMWDLFP52PrtWBNW
         WHIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785134669; x=1785739469; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVhy2zBHRxUQesgFWLmDsfBmAyKMFgT84KyKy5f5YfE=;
        b=YnWLpgDJkONdnVHExyaWTzE2sehPXttqJIa0IaTzdKRZQf49YYkdNEu8AGhGwx0jBg
         dQGQiSIP1Z7Gc6RlVjg75LR04HDIGN4wCI2yYwsDI/SitV12kHFkKcSy1MAWORHyTBLa
         Is5ls7AHTjUxegX1nCsdjJ05HWLvWvp8G/yGOpdlmCsq8skTIYYc2lp8TKgLjhOynfZO
         H2eB7Vme3izU8EWFCoe7e24hb/giTRPV9KtzN3n8OGLtOZ0rQHgJo4EumdosZ3K2F3ZW
         5EXcNWTjchMSNOS9NtQqNm3+8swPXrU6ixTS3ad25Bsrf8mHpnhFwE3pXmdP+A2OxEfk
         Cdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785134669; x=1785739469;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VVhy2zBHRxUQesgFWLmDsfBmAyKMFgT84KyKy5f5YfE=;
        b=BUs6C1ADXjC91tuCAq03MvNJij6T+3I/HW5JzfjuUrZWiU6gkXHBSqQvkLT8sM9xmR
         mXDHHCVj09nHM7MO0iwNXAkTWMguqJCllhBoXLiJbh43zaL/PxZ40JwrH6oBwNew83AB
         cONj48eBEZ5ggclt5+Fe4PXVOUQrGcVjqjtJkIta3b1+dswIRO0MDuIWMY34HtlmFNKt
         U1pO9aE1hNXRJMtmiLUF3ExgBLi9XibGIPQmGYT03IcmrVgL0DkjCnQiO0QKZrLfuwSC
         2J0/sS5rewp/weY2UIGQRxIZu8T8NXS5+S1rsavx8eUzm0C41EshY1ds81PFGh+8yXHb
         6ARg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1D3GB4lH3bsr7vHb84kb9LI0p4EFLrKp+IyzJzOicr1KzkH8NPZlwGRuzkpm1LjzXlUFLfQyoK2zMcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqPbFMOtFZFu5i5xSTZ39DaJxELLpl70iU+pWgNJJ3zJ5bwaj0
	bFpMjeYIuevIZSuv/V6dLoTxXjwJ2RJVCjfRbiebGRFuPI457+/rTme+cuSkI4cJ6KTEZ62ykG6
	AtxgNPh23FshgploKwtf9ObH4aeeADA==
X-Gm-Gg: AR+sD10d0zLIB9JBRy110dBkYnOFgyuAjXv9LvbIxuzHHt4aV1/Kme6g+Cjd6ZZgs45
	0ijdcpyZNs1kNWWe1z25xhWMqI35egifNB2GqkbuJFvU+DqfbNrlqq/Qj+PFn+bmVtkAAAJxiLo
	VmzV/z6ZQke/T+yO9dS1FINNB/iHxPlR23F9xE6f2+aWApFos8lEH91ElAXm2OiuECfRShgDysc
	uC7crkM6AJoVaaNcrqFlRAiMceaCI1UIaXs7+IZzL16Rzkgz4V3cUKtisRgikB8MPrTFYZxUXR2
	MFtu3yprUBqvk9B5K9KUCc6iG8g7
X-Received: by 2002:a17:90b:3e47:b0:38e:4011:465f with SMTP id
 98e67ed59e1d1-38f2960cd53mr6833918a91.23.1785134669331; Sun, 26 Jul 2026
 23:44:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
In-Reply-To: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
From: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Date: Mon, 27 Jul 2026 08:44:17 +0200
X-Gm-Features: AUfX_mwqcqnNQMcZqt04xa55VFBtNE5LGKsPbm1cl7GlNjH5cXHOSWUWokyx1_s
Message-ID: <CAMhzubo-NJMro7+XbxD=MhSXiRp14chatDcn-=1Hsiak786uQw@mail.gmail.com>
Subject: Re: [PATCH 0/4] media: rkvdec: Add VP9 support for VDPU381 variant
To: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Rock 5B+ leg of the three-board run in the cover letter, as a tag you can
pick up. 7.1 base carrying this code, not a build of the series as posted.

Francesco Saverio Pavone <pavone.lawyer@gmail.com>


Il giorno dom 26 lug 2026 alle ore 22:28 Venkata Atchuta Bheemeswara
Sarma Darbha <vdarbha0473@gmail.com> ha scritto:
>
> Hi All,
> This patch series adds the initial VP9 support for VDPU381 present in rk3588.
>
> VDPU381 supports VP9 Profile 0 and Profile 2 up to 7680x4320@30fps.
>
> Tested with fluster (suite : VP9-TEST-VECTORS, decoder: GStreamer-VP9-V4L2SL-Gst1.0).
> The 224/305 score has been reproduced independently on three RK3588 boards
> across three kernel bases: Orange Pi 5 Pro (RK3588S, 7.2.0-rc3),
> Orange Pi 5 Plus (RK3588, 7.0) and Radxa Rock 5B+ (RK3588, 7.1).
>
> Most of the remaining failures fall into a few known categories:
>
> - All vp90-2-02-size-*.webm variants where either dimension is
>   smaller than 64 pixels fail because the hardware does not support
>   frames smaller than 64x64:
>   vp90-2-02-size-08x08.webm, vp90-2-02-size-08x10.webm,
>   vp90-2-02-size-08x16.webm, vp90-2-02-size-08x18.webm,
>   vp90-2-02-size-08x32.webm, vp90-2-02-size-08x34.webm,
>   vp90-2-02-size-08x64.webm, vp90-2-02-size-08x66.webm,
>   vp90-2-02-size-10x08.webm, vp90-2-02-size-10x10.webm,
>   vp90-2-02-size-10x16.webm, vp90-2-02-size-10x18.webm,
>   vp90-2-02-size-10x32.webm, vp90-2-02-size-10x34.webm,
>   vp90-2-02-size-10x64.webm, vp90-2-02-size-10x66.webm,
>   vp90-2-02-size-16x08.webm, vp90-2-02-size-16x10.webm,
>   vp90-2-02-size-16x16.webm, vp90-2-02-size-16x18.webm,
>   vp90-2-02-size-16x32.webm, vp90-2-02-size-16x34.webm,
>   vp90-2-02-size-16x64.webm, vp90-2-02-size-16x66.webm,
>   vp90-2-02-size-18x08.webm, vp90-2-02-size-18x10.webm,
>   vp90-2-02-size-18x18.webm, vp90-2-02-size-18x32.webm,
>   vp90-2-02-size-18x34.webm, vp90-2-02-size-18x64.webm,
>   vp90-2-02-size-18x66.webm, vp90-2-02-size-32x08.webm,
>   vp90-2-02-size-32x10.webm, vp90-2-02-size-32x18.webm,
>   vp90-2-02-size-32x34.webm, vp90-2-02-size-32x66.webm,
>   vp90-2-02-size-34x08.webm, vp90-2-02-size-34x10.webm,
>   vp90-2-02-size-34x16.webm, vp90-2-02-size-34x34.webm,
>   vp90-2-02-size-34x64.webm, vp90-2-02-size-34x66.webm,
>   vp90-2-02-size-64x08.webm, vp90-2-02-size-64x10.webm,
>   vp90-2-02-size-66x08.webm, vp90-2-02-size-66x10.webm.
>
> - vp90-2-05-resize.ivf, vp90-2-18-resize.ivf and all
>   vp90-2-21-resize_inter_*.webm variants fail. These streams change
>   resolution mid-stream on a non-keyframe, and a reference frame
>   from before the resize ends up unavailable by the time it's
>   needed again. This is being actively looked into:
>   vp90-2-05-resize.ivf, vp90-2-18-resize.ivf,
>   vp90-2-21-resize_inter_1280x720_5_1-2.webm,
>   vp90-2-21-resize_inter_1280x720_5_3-4.webm,
>   vp90-2-21-resize_inter_1280x720_7_1-2.webm,
>   vp90-2-21-resize_inter_1280x720_7_3-4.webm,
>   vp90-2-21-resize_inter_1920x1080_5_1-2.webm,
>   vp90-2-21-resize_inter_1920x1080_5_3-4.webm,
>   vp90-2-21-resize_inter_1920x1080_7_1-2.webm,
>   vp90-2-21-resize_inter_1920x1080_7_3-4.webm,
>   vp90-2-21-resize_inter_320x180_5_1-2.webm,
>   vp90-2-21-resize_inter_320x180_5_3-4.webm,
>   vp90-2-21-resize_inter_320x180_7_1-2.webm,
>   vp90-2-21-resize_inter_320x180_7_3-4.webm,
>   vp90-2-21-resize_inter_320x240_5_1-2.webm,
>   vp90-2-21-resize_inter_320x240_5_3-4.webm,
>   vp90-2-21-resize_inter_320x240_7_1-2.webm,
>   vp90-2-21-resize_inter_320x240_7_3-4.webm,
>   vp90-2-21-resize_inter_640x360_5_1-2.webm,
>   vp90-2-21-resize_inter_640x360_5_3-4.webm,
>   vp90-2-21-resize_inter_640x360_7_1-2.webm,
>   vp90-2-21-resize_inter_640x360_7_3-4.webm,
>   vp90-2-21-resize_inter_640x480_5_1-2.webm,
>   vp90-2-21-resize_inter_640x480_5_3-4.webm,
>   vp90-2-21-resize_inter_640x480_7_1-2.webm,
>   vp90-2-21-resize_inter_640x480_7_3-4.webm.
>
> - vp90-2-09-aq2.webm,
>   vp90-2-09-lf_deltas.webm,
>   vp90-2-15-segkey_adpq.webm,
>   vp90-2-19-skip-01.webm,
>   vp90-2-19-skip-02.webm,
>   vp90-2-19-skip.webm,  vp90-2-22-svc_1280x720_3.ivf,
>   are still failing and not yet root-caused.
>
> - vp91-2-04-yuv422.webm
>   vp91-2-04-yuv444.webm
>   fail because the hardware does not support the format these
>   streams use (4:2:2/4:4:4), only 4:2:0.
>
> The base vdpu381 VP9 driver support was introduced by me. Profile 2 support
> was added by Igor Paunovic. Francesco Saverio Pavone fixed bugs in
> the segmentation map size calculation and in the altref vertical
> scale factor. Igor Paunovic also fixed a decoded-frame stride bug, aligning
> bytesperline to 64 bytes in rkvdec_fill_decoded_pixfmt().
>
> ---
> Igor Paunovic (1):
>       media: rkvdec: align bytesperline to 64 bytes in rkvdec_fill_decoded_pixfmt()
>
> Venkata Atchuta Bheemeswara Sarma Darbha (3):
>       media: rkvdec: vp9: Changing get_ref_buf function name to get_ref_buf_vp9
>       media: rkvdec: Move vp9 functions to common file
>       media: rkvdec: Add VP9 support for VDPU381 variant
>
>  drivers/media/platform/rockchip/rkvdec/Makefile    |    2 +
>  .../platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h |  234 +++++
>  .../platform/rockchip/rkvdec/rkvdec-vdpu381-vp9.c  | 1067 ++++++++++++++++++++
>  .../platform/rockchip/rkvdec/rkvdec-vp9-common.c   |   65 ++
>  .../platform/rockchip/rkvdec/rkvdec-vp9-common.h   |   92 ++
>  .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |  121 +--
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c    |   73 +-
>  drivers/media/platform/rockchip/rkvdec/rkvdec.h    |    1 +
>  8 files changed, 1537 insertions(+), 118 deletions(-)
> ---
> base-commit: 1229e2e57a5c2980ccd457b9b53ea0eed5a22ab3
> change-id: 20260726-b4-add-rkvdec2-vp9-vdpu381-3d1bd8fca4f5
>
> Best regards,
> --
> Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
>
