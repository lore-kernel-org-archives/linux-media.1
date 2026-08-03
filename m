Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C832DFF3F;
	Mon,  3 Aug 2026 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763359; cv=none; b=Wh7yfTkugahuX8FkUCCpC9O/ODcfQn02yIGGldBNwBTTifgYYywFq66TwZw3ID1+qY8fWrFNwTpv4I2M5iHdaNqxD0mbpSUXYBj4ifg9NLUO0ggl0EFT5hGHb91es2p0wzhPXFsGr/uFzZkz0FcqJTS8wk643OGD5u3FpV0N1qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763359; c=relaxed/simple;
	bh=EOAAR5kpuSpwwHr8hAQJbsCXWNNfOlSpC4pnEiqAkEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dc2iGCISV1O52NvaKmQJhzVMHQhkwW7EKp2bym7KZTpcjUGsnSaIaHUqbPXGWimVuItqKJo7SuMdclX37gi7vDjfCeE8/ntZ7GQFqh1VVcZt7X0mYcin17qbRGOlq0e0xJarAQy7l0kF9WcwT9YxU4gysZunRPl8cDFcNVUpkl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Iv79tk98; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Iv79tk98"
Received: from ideasonboard.com (mob-109-113-25-35.net.vodafone.it [109.113.25.35])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F147A512;
	Mon,  3 Aug 2026 15:21:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785763277;
	bh=EOAAR5kpuSpwwHr8hAQJbsCXWNNfOlSpC4pnEiqAkEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iv79tk98vAX3YrT1NHxMmzjkQWJwPx5Ock7rV2IrPrqWVQZljW0Ep2vzJdSJH0lWW
	 9SSkFo4UM1OIbqKT81irGrM4Tw4ex1iopXS3cxnI1ZfDgG5mElcrtKXrk/nI7FVVWM
	 V8oGhsWcx8iNJXUdpK4ZWs0QSd92GuLlTSfAtoHU=
Date: Mon, 3 Aug 2026 15:22:22 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Cc: michael.riesch@collabora.com, sakari.ailus@linux.intel.com, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx415: Fix control error handling
Message-ID: <anCVxbryOUYGxmCk@zed>
References: <20260731125542.293895-1-ahmisaranrao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260731125542.293895-1-ahmisaranrao@gmail.com>

Hello Narasimharao

On Fri, Jul 31, 2026 at 06:25:42PM +0530, Narasimharao Vadlamudi wrote:
> imx415_set_testpattern() accumulates failures from cci_write(), but drops
> the value and always returns success. Return the accumulated error so V4L2
> reports failures to userspace.
>
> The VBLANK path also returned immediately when programming VMAX failed
> after pm_runtime_get_if_in_use() had taken a runtime PM reference. Break
> out of the switch instead so the common pm_runtime_put() path is used.
>
These seems to be two separate issue worth two differnt patches ?

> Fixes: d5df1c7f3f83 ("media: i2c: imx415: Convert to new CCI register access helpers")
> Fixes: 3bcae55ab96a ("media: i2c: imx415: Add read/write control of VBLANK")

The double Fixes tag seems to suggest that

Also, Fixes commit need

Cc: stable@vger.kernel.org

> Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>

Thanks
   j

> ---
>  drivers/media/i2c/imx415.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index 0b424c17e880..c3b22b238ea0 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -686,7 +686,7 @@ static int imx415_set_testpattern(struct imx415 *sensor, int val)
>  		cci_write(sensor->regmap, IMX415_DIG_CLP_MODE, 0x01, &ret);
>  		cci_write(sensor->regmap, IMX415_WRJ_OPEN, 0x01, &ret);
>  	}
> -	return 0;
> +	return ret;
>  }
>
>  static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
> @@ -720,7 +720,7 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = cci_write(sensor->regmap, IMX415_VMAX,
>  				format->height + ctrl->val, NULL);
>  		if (ret)
> -			return ret;
> +			break;
>  		/*
>  		 * Exposure is set based on VMAX which has just changed, so
>  		 * program exposure register as well
> --
> 2.43.0
>
>
