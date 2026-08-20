Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E231DDA18
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 08:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215859; cv=pass; b=jGOy4aDXqoxDhbR5Hx958VTCPkNoigqhxra32RwnY+G8mxOy/p1OtEg1JuEl7cqDynLCD7QOBkpiRPdWZR4lAdG4JD49BA44L34cpzhgGoojQEr/Nov90tgB/AOhCcCRfTz4Jy339xYiD1qDUdpZikbaqTuSVGGcAtRjTZD5cOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215859; c=relaxed/simple;
	bh=GDnqSDkKScgrw/63AKS5/QQ0ImhBg6RKsAwuTPI4dfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bag4TvVQJClUV2SeE7w7aUbqYc9va9OIzuYXMiOMa11/VpHQAatHWEBN5CvR4t0HyEGgWahNitNgJ7hUYcPNhkCBXNbktReAtLAdzgxIgB2EM6tag24uMH/k+8Kd+mM4ac46by6cRFh1Emd+E+HAlB4aF+hFm9unEm+QN2IKTxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ztb1Mxle; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ztb1Mxle"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-480001972b8so709025f8f.2
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 01:50:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787215856; cv=none;
        d=google.com; s=arc-20260327;
        b=fojrZ2onQAwGj59rvw183YxwTi5SF0B1oMkZwyYI33AmXXhCajD/89ZBRtSgs9vdsM
         fUaSLK1Hilwo5zGFpE2CvJR43Xa/lrlqOwL+fHwBqTf2zE42j46h/lCWxg12t/3ot6tF
         Cpit/HSC8U7bwDm4an9lcLm09YDsOABzTPScQR1M1UW0iXKdMsg+LzbSxl+lNsJSTWaT
         gfHVgdzhiEvCtVq/hB+9p3GVxrPTCOXrgWt0+YoUtXI+PElsOS2tIzD4zJKulXKFtzUz
         8HRTR15jyyw8l6fJqDnizhN6R6KDqWq5n1LVr77d5IjMxOCvfSw5RM/qitLFxCVQH493
         lO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+b4KsqgVhxvXlRz9mSDNS12qqfAiKAY39eGBuHcw7yo=;
        fh=jfGn+2VPUWWJrI8KMP2NKGCItQ/OW74NB5uBCrffFjI=;
        b=jEVjOpMukmANguZh/7jYuN6bSkOCLHyGBQBWsjDA6zoGiqF+SymFV7Q6DxM1W4FfSN
         zR9ijJXXv8wwgAaSKNFQ/oaseKFu4bWfDpK9ktBGyooiryFK321UfbANmVB+7eocyRBY
         pxR5chaoIma27kbTILhr+TXp5+vF0hIhRHAlzY/KC7wcMPntTSvW5PLpBnkhQCNFBAEI
         Vz2213qHrk0/OCRaw0vgvjW7q9I4PHb9DQx2t2BMGqTeTK05X2y+deJysKJstb0o820h
         jpL84RzAIBlRAOIFBxmkZ2E+LCQy+srFu8IPTdaVBCCv27THcrzYN7KeCt4fEfBGkDvz
         YrTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787215856; x=1787820656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+b4KsqgVhxvXlRz9mSDNS12qqfAiKAY39eGBuHcw7yo=;
        b=Ztb1MxleVmN0uprmSW0Kn6b3hTuIam4KoQHZZQl/SfZ45rflL13KoI3W1RGBX30xSF
         1qOEH8O9uCNckpG/rYKk1H05jZz6XXEjk7AsD5J5ufgE/dooe3TKi+hSIoinOikkp/M1
         3pS4mtwcY59x9ZhJZ1GORUDw4ScGHDiALjWCwHxLLasKH2bLkORtG6I5djoIOWNN0n7d
         KEgBt9lNBSnBXrFJP5mZCRrkjXoSAuYn6ttSzWApiA/abynJqHh8DpnA3BFF5RH+TEwW
         BGtD9xU2zLgT/NlKJ2BTmiGvk497Mt9Lnr/PsGqOFjVm8xWyyGxZMpvmgzbtLxr2JsVc
         LTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787215856; x=1787820656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+b4KsqgVhxvXlRz9mSDNS12qqfAiKAY39eGBuHcw7yo=;
        b=sC2BpVEaW5WISTi4hobpNdYaEU5JbbnhRauA5M5FHZiyekRwaXe9O/0pZEYUZ3BjQQ
         3GqpLpFoyCgPTBqu8KsgIz6l8eJUJ9TH4J/bYNevnGDgCmkviESQtcKTZSjNw0ufAxBB
         keG1RGKGhlaALyt6uFt8bFRbNKajFD0eHjmoC6IvVmZTR3vJKyaXXnsvJ8J+yku+8TdW
         hNshGtMVZrFtycgIOnKGVJQOqag3xn6ZI/dGNeu8whop/tBWz4zcEJbn7Lahdz0Qzu/D
         dbpiA/9i5xu2iwaF5ERyv91XtmgAs9ckk8qOVKVEY1XuSNsUhaZsnV4t+bxgrR1Fv3Ye
         OUyw==
X-Forwarded-Encrypted: i=1; AHgh+Roy/aIoW5GgJYUlNw7ZrtfJ5QPGeq/9sLYFwIFUi2evhpC5Jl+H0bnZhABCO4atTTWHFGsOEDdBh3hX4w==@vger.kernel.org
X-Gm-Message-State: AFuF++k+qOx2R8pRYXdtRBNQA9m2hFAURVqxD3fFfPRf95dHXhwpaQ+u
	6QP5XZuDVbo+/Ze1LIC7whkxVlNCC/Ajfgv0Zth5q9mK5I4BUkp/dCxuCXrDoBY6I47/tAkkpzi
	agVO3kkMcIIKAS+6ILzRQISGHUpzsXoc=
X-Gm-Gg: AR+sD12MUtRzHmsZ4aYCgopewv6cw8Kd3vNDpu0HynlHX546j3aGkT5j49Bw3c7DpuJ
	IqhdA6HEUX5fwP9FvQPj5GTmgmWmWxBAPs8SS668Duk1YcQP9aqj+gsiDX3j3uPM4LXC7aCVKAq
	xBLWs1SkRGB5VVVwuFx2CfNefuuklfTDxolGCVI+MJu6H7/hT1BOfdzXzGtvKMR5V3mAqpWYHG/
	iRM7lk99yhiwPUrMq+xQbwalqttHwWIhNa63j4serJ4TuEiHOKAiJw6jWr8NvaT8FHeaeRtv/mN
	tIIS3deqq62nPI5CphIveyACkgi5UjTDFcerCJcm7SVuEhfPUJwFRFMWXbCMlaLIIrW7apUnKYh
	ClcR8p/iWeBNp+T0VoV+JBTLSG3Pwe4c=
X-Received: by 2002:a05:6000:1448:b0:47f:96f9:a99f with SMTP id
 ffacd0b85a97d-482b1fdcb2emr17783279f8f.13.1787215855817; Thu, 20 Aug 2026
 01:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com> <20260819102812.2592880-5-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260819102812.2592880-5-tommaso.merciai.xr@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 09:50:00 +0100
X-Gm-Features: AcwNN1Vgk7ustH1NWBXWkgswHDe5qoB_RvWnWMldXDrYp2dck44yCb8inYnx0HM
Message-ID: <CA+V-a8to3fjK-phJ4PmsAdHxR5co3H3izH=KXcGhVjart8=Nuw@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] media: rzg2l-cru: Use v4l2_fill_pixfmt_aligned()
 for stride alignment
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: jacopo.mondi@ideasonboard.com, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Isaac Scott <isaac.scott@ideasonboard.com>, Paul Cercueil <paul@crapouillou.net>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 11:32=E2=80=AFAM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Replace the open-coded bytesperline/sizeimage rounding with the newly
> added v4l2_fill_pixfmt_aligned().
>
> No functional change intended.
>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v5->v6:
>  - Collected tag.
>
> v4->v5:
>  - Split the fix so it no longer depends on v4l2_fill_pixfmt_aligned()
>    and moved it first in the series, so it can be backported to stable
>    on its own (This the old v4 PATCH 4/4).
>
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 91eda5034248..27a35ef2a6df 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -849,12 +849,8 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_=
dev *cru,
>         v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
>                               &pix->height, 240, info->max_height, 2, 0);
>
> -       v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
> -
> -       if (info->has_stride) {
> -               pix->bytesperline =3D ALIGN(pix->bytesperline, RZG2L_CRU_=
STRIDE_ALIGN);
> -               pix->sizeimage =3D pix->bytesperline * pix->height;
> -       }
> +       v4l2_fill_pixfmt_aligned(pix, pix->pixelformat, pix->width, pix->=
height,
> +                                info->has_stride ? RZG2L_CRU_STRIDE_ALIG=
N : 1);
>
>         dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
>                 pix->width, pix->height, pix->bytesperline, pix->sizeimag=
e);
> --
> 2.54.0
>
>
