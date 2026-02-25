Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37661F09B3;
	Wed, 25 Feb 2026 10:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772015272; cv=none; b=LJoV1XMtOkRD05miEez6UNfIlroXcmh69VLUb4/X6COb3t6Nk7TfIjHnGlNOIKwUJxD32iEXdU3u+S4LGGHCHKfxTHAJJ2+Zar2pzF6NV4j47Njf8UUiDdTS0LNJP4WxV0e3PClHk65+mzfTpLYyNUAc8Md6enJRl0ux/eYauXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772015272; c=relaxed/simple;
	bh=5Q73fS3LK+prOMnlhYI+ruwH86dKsKgpwqhRpGzoXuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9kRFStvl2GJoDMpyl0WwsbAgORj5EUebvmw6BN0tF2cfdHD62Q6Q+fnej1EVqwQqvWs5N57Z6x4FF9VqrEILySyVjZ9nKDYzc8uRFsmKRQu/wDrP6lb9t5fTSBWdD2BG4hXpMunfmT+uKg4uZbs3nXV6SmLpFd8t16nPfs4eTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E3D+Toiu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E3D+Toiu"
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65B60E47;
	Wed, 25 Feb 2026 11:26:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772015211;
	bh=5Q73fS3LK+prOMnlhYI+ruwH86dKsKgpwqhRpGzoXuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3D+ToiuW3oRIRWPDQc+THsjwRcj9Dohoble6QRDZT0NqlVixdb1LLK5WHZvXjjvk
	 6Z2Ddp1iaFOmC3ZT/fG1mrHpM+m3/bL7Q9kyYHGh0sWiDunzhQbkoJnse1TAPdFMxg
	 H+gSxZcupQXy3CX8dbhl6Rt4pPu3gurwkkCvWLYM=
Date: Wed, 25 Feb 2026 11:27:37 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: sakari.ailus@linux.intel.com, tarang.raval@siliconsignals.io, 
	laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com, jacopo@jmondi.org, 
	mchehab@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	hverkuil+cisco@kernel.org, johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl, 
	jai.luthra@ideasonboard.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5647: Fix runtime PM refcount leak in
 s_ctrl
Message-ID: <aZ7Og9Uq9tCMLi2U@zed>
References: <20260225085621.1756643-1-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225085621.1756643-1-xiaolei.wang@windriver.com>

Hello Xiaolei

On Wed, Feb 25, 2026 at 04:56:21PM +0800, Xiaolei Wang wrote:
> Three control cases (AUTOGAIN, EXPOSURE_AUTO, ANALOGUE_GAIN) directly
> return without calling pm_runtime_put(), causing runtime PM reference
> count leaks.
>
> Change these cases from 'return' to 'ret = ... break' pattern to ensure
> pm_runtime_put() is always called before function exit.
>
> Fixes: 4f66f36388d5 ("media: i2c: ov5647: Convert to CCI register access helpers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/i2c/ov5647.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 6a46ef7233ac..db9bd2892140 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -967,21 +967,21 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	case V4L2_CID_AUTOGAIN:
>  		/* Non-zero turns on AGC by clearing bit 1.*/
> -		return cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(1),
> -				       ctrl->val ? 0 : BIT(1), NULL);
> +		ret = cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(1),
> +				      ctrl->val ? 0 : BIT(1), NULL);
>  		break;
>  	case V4L2_CID_EXPOSURE_AUTO:
>  		/*
>  		 * Everything except V4L2_EXPOSURE_MANUAL turns on AEC by
>  		 * clearing bit 0.
>  		 */
> -		return cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(0),
> -				       ctrl->val == V4L2_EXPOSURE_MANUAL ? BIT(0) : 0, NULL);
> +		ret = cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(0),
> +				      ctrl->val == V4L2_EXPOSURE_MANUAL ? BIT(0) : 0, NULL);
>  		break;
>  	case V4L2_CID_ANALOGUE_GAIN:
>  		/* 10 bits of gain, 2 in the high register. */
> -		return cci_write(sensor->regmap, OV5647_REG_GAIN,
> -				 ctrl->val & 0x3ff, NULL);
> +		ret = cci_write(sensor->regmap, OV5647_REG_GAIN,
> +				ctrl->val & 0x3ff, NULL);
>  		break;
>  	case V4L2_CID_EXPOSURE:
>  		/*
> --
> 2.43.0
>
