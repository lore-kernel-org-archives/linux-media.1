Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E633CE0B8;
	Mon, 20 Jul 2026 11:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547262; cv=none; b=swhVPFN74f3MBSqKp+rqOfWV/dYW5kmglnmxEqtXbifVxrmAAxlG4JilT0N9kfKmbEy8nCmAQPFxsG0rHLKZ/KHuCw6BOmYRqsNjDyhbizx0IpBQ6gwd25Arit7V+VaAnlBmLkuqQLLlkF87wiLrh4DEqkY57rPJ+Gn77miIUlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547262; c=relaxed/simple;
	bh=slzD7z0NpRZ+hYG+ro8DP+J4UAfIddNHIcjrx7+h39U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBv/sDPnDPWJGgR0NMpeMSZqVqYKlAgJV+4eZMpd+wUm3zb4TwYGB6aZk6dZVC6mD6VM0dixxtBrGBcXN/Tj15/+tFKl6RzauSZZ0k3J6NIOZIXj63SkifEmhiP1Psi2wh57zmt5b9SSI8tZAb0uqgr1Yd1cXGYsxAz+J+nlMJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+4G+f1D; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+4G+f1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784547261; x=1816083261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=slzD7z0NpRZ+hYG+ro8DP+J4UAfIddNHIcjrx7+h39U=;
  b=c+4G+f1DsuddiYZAvlpr0ISuMtIJrNe/4xXZyN0QJFWHsy7S2XJGoAl9
   BDXNwbSvAXI0X/vV8ore8KDxu/E0dQE8NcbQH4yYsrjYW5FwPmpAv1asN
   JPmjyJ0RgT5QjoCNIBlbOcRfhxIyhcud/UhyQsRAfSGLZPO88q1WLuOkE
   l7kzWnC7E3KNd/RyyiYz86+x8gBiagimjpgQTW9/nn2nvcfc7YuDhHZ3X
   Fz8Ya6+0sgjEaX8d9eL0SPvKOkejcjscSsHK2qCUjsVp9noc+fWaFulL0
   /Xu5FI+iXGXQGhUwmtjwkMhFNnb6OFnrZT1G/+VlDZFeFO/Wnnw5zCZpP
   g==;
X-CSE-ConnectionGUID: pASSHXXsQa2/IMgwltwD4Q==
X-CSE-MsgGUID: r/a5EiooSXOQBYsIINKS/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="88947904"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="88947904"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 04:34:21 -0700
X-CSE-ConnectionGUID: vpII2wS9SquMItrM4p97pg==
X-CSE-MsgGUID: HE2dcq9bSy2ZOel+VeTGaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="253492865"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.94])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 04:34:19 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A745C121C2B;
	Mon, 20 Jul 2026 14:34:21 +0300 (EEST)
Date: Mon, 20 Jul 2026 14:34:21 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Uday Khare <udaykhare77@gmail.com>
Cc: jacopo@jmondi.org, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: mt9t112: fix missing IS_ERR() check before
 PTR_ERR()
Message-ID: <al4HvRWaRAMFPUrQ@kekkonen.localdomain>
References: <20260720105935.16894-1-udaykhare77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720105935.16894-1-udaykhare77@gmail.com>

Hi Uday,

On Mon, Jul 20, 2026 at 04:29:35PM +0530, Uday Khare wrote:
> In mt9t112_probe(), the -ENOENT check after devm_v4l2_sensor_clk_get() is
> missing an IS_ERR() guard.
> 
> Without IS_ERR(), PTR_ERR(priv->clk) is executed unconditionally,
> including on successful clock lookups where priv->clk points to a valid
> struct clk pointer.  Calling PTR_ERR() on a valid pointer reinterprets its
> address as a signed long integer; the result is arbitrary and leads to an
> invalid comparison against -ENOENT.

How can the result be arbitrary? Both are the same size.

The patch addresses an API usage issue but I don't think there was an
actual bug there.

> 
> Fix this by nesting the -ENOENT check inside an IS_ERR() guard block.
> 
> Fixes: 6a26f141bf62 ("media: i2c: mt9t112: Remove soc_camera dependencies")
> Signed-off-by: Uday Khare <udaykhare77@gmail.com>
> ---
>  drivers/media/i2c/mt9t112.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9t112.c b/drivers/media/i2c/mt9t112.c
> index a8e2a3cf3456..56b7c8910112 100644
> --- a/drivers/media/i2c/mt9t112.c
> +++ b/drivers/media/i2c/mt9t112.c
> @@ -1079,10 +1079,12 @@ static int mt9t112_probe(struct i2c_client *client)
>  	v4l2_i2c_subdev_init(&priv->subdev, client, &mt9t112_subdev_ops);
>  
>  	priv->clk = devm_v4l2_sensor_clk_get(&client->dev, "extclk");
> -	if (PTR_ERR(priv->clk) == -ENOENT)
> -		priv->clk = NULL;
> -	else if (IS_ERR(priv->clk))
> -		return dev_err_probe(&client->dev, PTR_ERR(priv->clk),
> -				     "Unable to get clock \"extclk\"\n");
> +	if (IS_ERR(priv->clk)) {
> +		if (PTR_ERR(priv->clk) == -ENOENT)

You could test for !- -ENOENT and drop the else clause.

> +			priv->clk = NULL;
> +		else
> +			return dev_err_probe(&client->dev, PTR_ERR(priv->clk),
> +					     "Unable to get clock \"extclk\"\n");
> +	}
>  
>  	priv->standby_gpio = devm_gpiod_get_optional(&client->dev, "standby",

-- 
Regards,

Sakari Ailus
