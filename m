Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484113002DC;
	Mon, 15 Jun 2026 07:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509293; cv=none; b=u5MvTD0jTxHJm4G1gWI0HFrpD6uHgCOcWCpqbI9FDOrmiIZQC2Z/enW2l1dDu1NBmcbeSKhkI/c9xeu5/cq7iVfde61qetkrRI4yPnOE2kZMmjvB2c66Y/Fgq5XZCzyAKJT6LPlJmw0HehcdYR0JyVqP6qAwYnP8KTdaurY6dBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509293; c=relaxed/simple;
	bh=NKTJH16xWvGidL00ofxeyNXkdXkIR7U3OcaQPJYQguc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bY+iQg1jDAIU+FIs1ugIOX31wANYXRjfNPu/COYik1j3dHzE3M81YIA++sohk29Qc1Z1eR2yteL6ZFmgk8CUNFI6bG8uGVf1a1thtlDeGgvIvLdaxUgN33okgJQCRD3XJ719pEdIkEMaEM0RIvfXU3UdbhOCFnV3/D1J+3lPqhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mfPCEQbS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mfPCEQbS"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2F05591;
	Mon, 15 Jun 2026 09:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781509256;
	bh=NKTJH16xWvGidL00ofxeyNXkdXkIR7U3OcaQPJYQguc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mfPCEQbSEomeh3lwvN/RnZER1B3+gO3UMCBktPcfcKTGQq7p/ZxU9sFOfgngiKHVc
	 2taifzD2F1ICsktZvzhlOhxqtgF4XIFt3vPwG9N4dY6mnnuTHPRx+yCYCHX4qKsRYU
	 zjrFl2MhL2A9Umd+IIaAy8fJEODBkNmzF3y6bQRQ=
Date: Mon, 15 Jun 2026 10:41:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	mchehab@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: mt9p031: fix endpoint parsing use-after-free
Message-ID: <20260615074127.GE1982714@killaraus.ideasonboard.com>
References: <20260613084849.57897-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260613084849.57897-1-birenpandya@gmail.com>

On Sat, Jun 13, 2026 at 02:18:49PM +0530, Biren Pandya wrote:
> The mt9p031_probe() function calls fwnode_handle_put(np) immediately
> after parsing the endpoint. However, it subsequently calls
> fwnode_property_read_u32() twice using the same 'np' handle, leading
> to a potential use-after-free.
> 
> Fix this by moving fwnode_handle_put(np) to the end of the endpoint
> property reading block, and adding it to the error path of
> v4l2_fwnode_endpoint_parse().
> 
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/i2c/mt9p031.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index ea5d43d..04c17cb 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -1075,15 +1075,18 @@ static int mt9p031_parse_properties(struct mt9p031 *mt9p031, struct device *dev)
>  		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
>  
>  	ret = v4l2_fwnode_endpoint_parse(np, &endpoint);
> -	fwnode_handle_put(np);
> -	if (ret)
> +	if (ret) {
> +		fwnode_handle_put(np);
>  		return dev_err_probe(dev, -EINVAL, "could not parse endpoint\n");
> +	}
>  
>  	fwnode_property_read_u32(np, "input-clock-frequency",
>  				 &mt9p031->ext_freq);
>  	fwnode_property_read_u32(np, "pixel-clock-frequency",
>  				 &mt9p031->target_freq);
>  
> +	fwnode_handle_put(np);
> +

This seems to be a candidate for __free().

>  	mt9p031->pixclk_pol = !!(endpoint.bus.parallel.flags &
>  				 V4L2_MBUS_PCLK_SAMPLE_RISING);
>  

-- 
Regards,

Laurent Pinchart
