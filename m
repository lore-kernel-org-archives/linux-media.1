Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1D43368B9;
	Mon,  9 Mar 2026 09:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049090; cv=none; b=NwkMdFpIEpNTjpPfpiYVf2k1oiaYr2/OhRlLfhGrXkkWWjOda7vYL1UcSvOrKrafbcQtxOk+m4GoWvhYjnYWMpg1F2RpFYVuNAeEppurt7afHSiYA/BxCMJC1wan9igUilrGZNU2/SekKIH+vxBswfN2B689yiTKIdDSrllOIiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049090; c=relaxed/simple;
	bh=7Zh5M73KcPhHG2cJdl3SluK1OOo9Tb+H6yPQdHN82hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CG5zXCZvvSXMSGbc3U/+PyeApdbjKd0exkRNNT93UvBMfiUwFg+n0GAZvYA03AbRFM9MUytDWVpK31oDtfHfauZ66A8zWzEUDfwqLouC991NFwnB6/f37fBxFQvhgNt/noFAlG05A9OzLcZAhM9faz8SadvWL6EXO1xgThoadBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BkIM1bUn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BkIM1bUn"
Received: from ideasonboard.com (static.170.20.224.46.clients.your-server.de [46.224.20.170])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7967673B;
	Mon,  9 Mar 2026 10:36:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773049019;
	bh=7Zh5M73KcPhHG2cJdl3SluK1OOo9Tb+H6yPQdHN82hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BkIM1bUn60+1R0p/vHbHMTIx4681bzgzI/o8pA4srdQwgiOAbPqJdt1B0QwMN/lsZ
	 3AiUr/9s9L8X7YBGbqYWISDbBJqhWfr+MSPbM3G4jlvqYehFtcC9z/plC32f8c/6+s
	 hsXL02PKERgTLiBEHauVuW3cUQO6bboiMXod+8i4=
Date: Mon, 9 Mar 2026 10:38:02 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ov8856: parse and register V4L2 device
 tree properties
Message-ID: <aa6Uj3G5V3rv7_Mm@zed>
References: <20260307-ov8856-v4l2-props-v1-0-7677b4c658e4@pm.me>
 <20260307-ov8856-v4l2-props-v1-2-7677b4c658e4@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260307-ov8856-v4l2-props-v1-2-7677b4c658e4@pm.me>

Hi Alexander

On Sun, Mar 08, 2026 at 04:56:07AM +0000, Alexander Koskovich wrote:
> Parse V4L2 device tree properties and register controls for them.
>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/media/i2c/ov8856.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> index e2998cfa0d18..bd39d213e0be 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -1887,12 +1887,14 @@ static const struct v4l2_ctrl_ops ov8856_ctrl_ops = {
>
>  static int ov8856_init_controls(struct ov8856 *ov8856)
>  {
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> +	struct v4l2_fwnode_device_properties props;
>  	struct v4l2_ctrl_handler *ctrl_hdlr;
>  	s64 exposure_max, h_blank;
>  	int ret;
>
>  	ctrl_hdlr = &ov8856->ctrl_handler;
> -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
>  	if (ret)
>  		return ret;
>
> @@ -1954,9 +1956,23 @@ static int ov8856_init_controls(struct ov8856 *ov8856)
>  	if (ctrl_hdlr->error)
>  		return ctrl_hdlr->error;
>
> +	ret = v4l2_fwnode_device_parse(&client->dev, &props);
> +	if (ret)
> +		goto error;
> +
> +	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov8856_ctrl_ops,
> +					      &props);
> +	if (ret)
> +		goto error;
> +
>  	ov8856->sd.ctrl_handler = ctrl_hdlr;
>
>  	return 0;
> +
> +error:
> +	v4l2_ctrl_handler_free(ctrl_hdlr);

The control handler is released by the caller of
ov8856_init_controls() in case of errors.

You should just return ret here.

Thanks
  j

> +
> +	return ret;
>  }
>
>  static void ov8856_update_pad_format(struct ov8856 *ov8856,
>
> --
> 2.53.0
>
>
>
