Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35F01C01;
	Wed, 22 Jul 2026 05:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784699484; cv=none; b=HI1Oh7e5rcbySiur6JgjUUuzlqAXHsq6MEdvJrz8QOSD+zPLc27PEB2TfzBBPMxBIKydItQYC3yfhfzrzaxHbLBM3IHZ05jrGsm8/wwqAzhnQ/eqmAbowm9l3oMNzVdV/bUz5WOx1UVcLyKVGOnl2MLr1FR3F8twUqUYmHBPLtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784699484; c=relaxed/simple;
	bh=0Mh5StyrEKlRsy7QNa5G17sQ9L/SUiHbLXTyHElt2hA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=k/rnmdkmOiuZ2U4+XXhzu5+6eEGRvlaq7Fzq2FDQd43PxWQvJmfpHhHeIiQCCToCkiRqRWjTe6V6dIqWmPpWo/MoQi7vbWgCVH2eBQKLex9DMVnTf87JhiZYuU8+zkcVI4OQItb74jZ4ljCYf0rOp7M5RKPKQlL3KGiNhDy0otI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YOofbaYP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YOofbaYP"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B0E3BAE;
	Wed, 22 Jul 2026 07:50:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784699420;
	bh=0Mh5StyrEKlRsy7QNa5G17sQ9L/SUiHbLXTyHElt2hA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YOofbaYPEiASxd09RInnqVlDG9HW24pjVzrbyD8uE0CmNTc/v4tXLyrQfzfz5XRKO
	 HFID9XQJ4EIwaMD7fX8N0k6pMTapTrtvUb4vRg65209e+1HRlTGX5Z1/hPHJorHyDk
	 2/48WfopewpvakdzEz6OidqYnd7zkLBz6A9qRq4g=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260718200912.16001-7-tarang.raval@siliconsignals.io>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io> <20260718200912.16001-7-tarang.raval@siliconsignals.io>
Subject: Re: [PATCH v3 06/17] media: i2c: os05b10: Add H/V flip support
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Tarang Raval <tarang.raval@siliconsignals.io>, mehdi.djait@linux.intel.com, sakari.ailus@linux.intel.com
Date: Wed, 22 Jul 2026 11:21:15 +0530
Message-ID: <178469947556.3005206.10100902541399446849@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Tarang,

Quoting Tarang Raval (2026-07-19 01:38:57)
> Add HFLIP and VFLIP controls, lock them while streaming,
> and update the reported Bayer format based on the flip state.
>=20
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/os05b10.c | 56 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 52 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index abf3d2970900..61c51844a91e 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c

[...]

> @@ -556,6 +571,20 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
>                 ret =3D cci_write(os05b10->cci, OS05B10_REG_EXPOSURE,
>                                 ctrl->val, NULL);
>                 break;
> +       case V4L2_CID_HFLIP:
> +       case V4L2_CID_VFLIP:
> +               ret =3D cci_update_bits(os05b10->cci, OS05B10_REG_FORMAT1,
> +                                     OS05B10_MIRROR | OS05B10_FLIP,
> +                                     (!os05b10->hflip->val ?
> +                                      OS05B10_MIRROR : 0) |
> +                                     (os05b10->vflip->val ?
> +                                      OS05B10_FLIP : 0), NULL);
> +
> +               ret |=3D cci_write(os05b10->cci, OS05B10_REG_ANALOG_FLIP,
> +                                (os05b10->vflip->val =3D=3D 1) ?
> +                                OS05B10_FLIP_ENABLE : OS05B10_FLIP_DISAB=
LE,
> +                                NULL);
> +               break;
>         default:
>                 ret =3D -EINVAL;
>                 break;

Please update the active state format on HFLIP/VFLIP, so the subsequent
G_FMT calls show the correct format.

Many drivers miss this today, I assume because libcamera usually calls
S_FMT on streaming using the output of ENUM_FMT.

Thanks,
    Jai
