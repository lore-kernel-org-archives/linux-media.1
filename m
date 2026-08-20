Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FAE2D8DB5
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 08:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215612; cv=pass; b=DboF7DGMMVAJFjkxL+xe/+43rSQXqYSFfm3untw4BfdapJkZEwjeCWbydp3kTgIMv1KcNGVPT89NgZ1TVlIoxZVrzpSpV5OTKU04kKA31TaMlGo+HPmu3r1Sa1App3aE902DEtJ6CU2Gnns2hXJOmga1IUrTbjOwydGebZXnhlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215612; c=relaxed/simple;
	bh=cU2M9PQTUwXXPvb4pWGxaXdz2036Pp0jkz2zQWC/bPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TkCsZn7Ec6sjRdFki15Uzm7u04C5DkpQicf0lMRgHBNJoHAmy9KoFHmpufeMKlxZLUR+cz+NLzqpI72c9CM2gge3MhVTegBRMEMiTd+ralAbGWVc5GZhrL8WCtXs7tW2x0Z5/yn6V/OpQefMw3QoeDErIu6u4G06m0XshtY2zp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FABH+VlM; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FABH+VlM"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47fe377a217so1141104f8f.1
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 01:46:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787215609; cv=none;
        d=google.com; s=arc-20260327;
        b=DQB7seyoYW8Ix9YedCxgGZqf8xJoR6UsMjX0DeiRrwJzmMaWapioh1Sod4WVwJkbBx
         IwdmeUPfslk8yGTZNOC1ar+bQR1zMlrqBNGp006x6s/5clscCY1sqTJeb9A49XFGHf74
         0lKYolomzMK3W1zGf+nmlutBcNNuai7xEUwXPd2mU34nbKLs/JUZuWx6Bt7bTTQyHKIi
         WULSo/CTPmkKwXf7Q6PZyfg38Ga16rh6KZs4IX+qccMjK9cXKVKbxlta5DFBWRg5zVFm
         R8y/CyTMzMjxXcJMauQ4NFULQEUh/jX2a1z7gNz4M9K1/cSPNpQqL5d5JJlLEtZda/tM
         MgwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qk+WGSHaUqhCb3U92mE+N/QPAOIrTCp/3aDSHoJPti4=;
        fh=EPRu7gvCdmhBbfvAMlbLuwhc4lv53JPOtL7+DWcdzrs=;
        b=OLDtidWXdH/3N+pRBL9ljOKt+KFsLFs/DFGleKCOkRq3i46l70K0ALzlMkK1JuTqYh
         kSWjDxlqfy3jVLU07B9VLjHU7pBBHN/CrcdfS3oS8huJsyVL3X13Ez7Hmby42g+NarCz
         /eg95e900GgcPtnxkst4TeDGMgO9SrRo9O2Yr+sPUAU4XvjVy89klquG4YTNKxbZApE5
         fJ+jCoV/BwS1R0yowri33B0OvxfSB7M1FnBfcL3hW9dEan0n/Y7UoTBg5Ykw2RfHXqkN
         xNi9G956EAsir3Lm+1CqPDZ6T14ZMvbm26OKg+1Uy+kcWwe2Gkq08AXctUIWj0Q/cqKJ
         s7AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787215609; x=1787820409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qk+WGSHaUqhCb3U92mE+N/QPAOIrTCp/3aDSHoJPti4=;
        b=FABH+VlM+aJzZQgoidbhsJXfjVoAG43izeE2uZNFyLDFDMMelQ9DWajwJg4+KUKL2v
         7eFu0BD91dpixFRlXexEzcz5ZvN+EXhel0le2kVZK5puTAx5j9wjTm+ZU+Ug5XZEHxDx
         nOOdWqPrU15R8/wMCFqWN8NIeaZ8PsONi7TEKcIXYZgED61uIOHUPoFGT7mwvlo8dv7h
         FB/32AzzFKCquQJ+9CBb4makqV0aJ//9nbuIgD+gdDGElsFBEGwmA/H/LtEv2CqXdAof
         CdD2a91pN8BJyIFYpcPstgomVSnn5D36aKlB8zroIMpke33+IbZkXqFk8VcScxVzMQcz
         /wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787215609; x=1787820409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qk+WGSHaUqhCb3U92mE+N/QPAOIrTCp/3aDSHoJPti4=;
        b=pnwGVefSq5o9ZblgY8pFx4Yl47x2PdlVNSMtM61/lOQMpnjhSz8+Ewcb94WxdtcZ6p
         MhUTEXcJDzuLGIe3E1ohPwt0ZRpSl+5+wcjQ3rcu9rcBIniC6ttlsMhL83sALHDTjyEa
         FyUnL2uOUkJLkd8G2yqaI4J8aRMy1ZvUJtf3mEoS3BUWFczmITllwZyMiHxSwNPCCD1A
         Q3t/WN85Xwiujm4OWJTjZbqLymxBugvXzy1bqLxomU55h6GQMHZBFC0dFzrZ81e74V6l
         oRv2T3I6u/eB6IEYJdaW+XBHqMKshb22KAO+iLN9u00A8SlZuOZVN60mBbuyuY4C/qUa
         pSLg==
X-Forwarded-Encrypted: i=1; AHgh+RrL01eK7CDTN/2SLamQkpuz6o6OibBH5HiHYA6UWoMKCdtS3hW7EViOZz0F7etTDzj94+9MJqj5Y8RLlg==@vger.kernel.org
X-Gm-Message-State: AFuF++kpa7oaFQCGcyp0WDLGpxCQ5ypTo1vZkUAOTK6yaHKH+U9dDTeB
	eDtUEMRcnyKvZx8/0/W4YgiNRAN8I6N36+79dzGPE1SIM1FmZMRA7LlvHQhE7Av0nK3O0e/Vxuz
	UE0ku2OnaIb56+JfcIEdWtmgWtLcybUE=
X-Gm-Gg: AR+sD12QRHnpXMLIdQubhux4uBcK528z4W9c5+f87/5ZwtQStCOyS4TEqfd3d/XPv1z
	yaryOSMqJWcsZQ/QGfzj+kYxf8WvaP5gIM9+hYmbMWlT6XM0dVzb+FtgkKuyaW2f7pvTRwl7uqH
	9yJhFRHldgF5Bn29hztwIuyglQTeAslkXS1EmSlcgZbF7Uu3kMYos+BjQXPIpTm2jQXVRORfGFD
	oOmrgHwfPfSyPzdAdoyyvSAYpdddnZkLC+4YXiqW8L19cvIkb68rKIG760UDTG56Gai4gddnqdf
	LphEz5UJJQeTgqaRcHewfoICWUF77EwwIdIXCuGp8Ops8opID4LHtq95otK1U6wILvkxfTnLBSA
	6ZiM5LnV8dUyBSit3p0GqqLn+Mbl1QTE=
X-Received: by 2002:adf:e190:0:b0:47f:96e6:70a with SMTP id
 ffacd0b85a97d-482b1e1eeecmr20816426f8f.0.1787215609438; Thu, 20 Aug 2026
 01:46:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com> <20260819102812.2592880-4-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260819102812.2592880-4-tommaso.merciai.xr@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 09:46:22 +0100
X-Gm-Features: AcwNN1VTPj6iLUNjW1T6H8GAeAfSIFUUWyR07LkafGHFIZ3H5Y3eG3WZpSJ1Wy4
Message-ID: <CA+V-a8vePb44xDTgxjb+5-wtOiZqWt_+oREs2fikgOCZbBGaEA@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] media: v4l2-common: Add kernel-doc for v4l2_fill_pixfmt_mp_aligned()
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: jacopo.mondi@ideasonboard.com, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Isaac Scott <isaac.scott@ideasonboard.com>, Paul Cercueil <paul@crapouillou.net>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 11:32=E2=80=AFAM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Replace the bare placeholder comment with a full kernel-doc block
> documenting all parameters, the function behaviour for both single
> memory plane (mem_planes =3D=3D 1) and multiple memory plane (mem_planes =
> 1)
> formats, and the return value.
>
> Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v5->v6:
>  - No changes.
>
> v4->v5:
>  - No changes.
>
> v3->v4:
>  - Collected tag.
>  - Fixed function documentation.
>
> v2->v3:
>  - Moved to PATCH 3/4
>  - Fixed documentation as suggested by Sven P=C3=BCschel
>
> v1->v2:
>  - New patch
>
>  include/media/v4l2-common.h | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 4e5c5ffaf651..33f5713734cb 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -591,7 +591,33 @@ static inline int v4l2_fill_pixfmt(struct v4l2_pix_f=
ormat *pixfmt,
>         return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, heigh=
t, 1);
>  }
>
> -/* @stride_alignment is a power of 2 value in bytes */
> +/**
> + * v4l2_fill_pixfmt_mp_aligned - Fill in a &struct v4l2_pix_format_mplan=
e with
> + *     stride alignment requirements.
> + *
> + * @pixfmt: pointer to the &struct v4l2_pix_format_mplane to be filled
> + * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
> + * @width: image width in pixels
> + * @height: image height in pixels
> + * @stride_alignment: stride alignment in bytes; must be a power of 2
> + *
> + * Fills all fields of @pixfmt for the given pixel format, dimensions, a=
nd
> + * stride alignment.
> + *
> + * For formats stored in a single memory plane (mem_planes =3D=3D 1), th=
e
> + * behaviour matches v4l2_fill_pixfmt_aligned(): plane_fmt[0].bytesperli=
ne
> + * is set to the primary plane stride. The strides of all components are
> + * aligned to the @stride_alignment. To keep the chroma strides consiste=
ntly
> + * derivable from the luma stride, strides may be aligned to a multiple =
of
> + * the @stride_alignment instead. plane_fmt[0].sizeimage covers all
> + * component planes.
> + *
> + * For formats with multiple memory planes (mem_planes > 1), each plane'=
s
> + * bytesperline is independently rounded up to @stride_alignment, and ea=
ch
> + * plane's sizeimage is set to bytesperline multiplied by the plane heig=
ht.
> + *
> + * Return: 0 on success, -EINVAL if @pixelformat is unknown.
> + */
>  int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
>                                 u32 pixelformat, u32 width, u32 height,
>                                 u8 stride_alignment);
> --
> 2.54.0
>
>
