Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFAB313E36;
	Tue, 24 Mar 2026 19:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381357; cv=none; b=jqWUFPgJIsjy2EA8uUvSmmtfDhA7Zxud3qysJGf01WVZeMWQbh/+9ptEkty6YdhnMR23sGhYJ/ypq+MrkZ+pl6nDo9iBiWmDgcv+zX2PuyH9xek9cU8zxVX0/SxBUNW1H8YLQGBQwc1s/jLgEs4dbQbc7RS9aFV4MqguEMp23Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381357; c=relaxed/simple;
	bh=U3DeWTAmE2LnB3qU+Q5A0k9c+mYIEcBPU8ZO5YFui3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YCzzD5f73JVN9Sq+Ccw5DfEfbyH+rr0SXM+KrCjQTsLoicTgPuks2M1MEJOh3f0gktwf0Q5IJOjMH/29KmABGlWmGOhLeH83kGPPm/3KIg7pSLMGFJ5txDqhYxk4zFI3QB+lxLNSn9qXApyTkJhu/iKFzh3QEfpL/GWsAUnoOZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=p+A6agZx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="p+A6agZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774381353;
	bh=U3DeWTAmE2LnB3qU+Q5A0k9c+mYIEcBPU8ZO5YFui3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p+A6agZxyYL7Q1ouQnrsLc5ELvsiJ43qHKdhEqCIojExK2Y9XrTuyEfe6SiORu7oa
	 sGJg5Wm111CCiVFKWmR2axOia5V7Jv1aKzDxau4RBBlDK9oqoS43BZko5z9dkMr/4o
	 cGEH+p1Tt7wM3Q9gX76vR15VOcVqRmYjYdwv7op/Qp4HaBsHOvQbdyAN7NbXzJBcEE
	 A6IyughffAgz/oCNuSU2ymuFd+9XNXB7qb+HqOIGiOfAY31DsxbiVfaSvECDHpEZIP
	 eOAZGIArt278F/nfjm/1fiSmT6v/8TyMCcSeLNbVV2S9x2Mnn9WoqvNui8BtyhSCBB
	 GUON6tcMAOy/A==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AEE7C17E4DEB;
	Tue, 24 Mar 2026 20:42:32 +0100 (CET)
Message-ID: <1378ed13-6744-422a-b0b8-02621117238f@collabora.com>
Date: Tue, 24 Mar 2026 20:42:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: imx415: Drop redundant runtime PM callbacks
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 sakari.ailus@linux.intel.com
Cc: tarang.raval@siliconsignals.io, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260324124524.135278-1-elgin.perumbilly@siliconsignals.io>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260324124524.135278-1-elgin.perumbilly@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Elgin,

Thanks for the patch but...

On 3/24/26 13:45, Elgin Perumbilly wrote:
> Replace runtime_suspend/resume wrappers by using power helpers
> directly with DEFINE_RUNTIME_DEV_PM_OPS().

...why? What advantage does this refactoring bring?

Best regards,
Michael

> 
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> ---
>  drivers/media/i2c/imx415.c | 44 +++++++++++++++-----------------------
>  1 file changed, 17 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index 0b424c17e880..b7d44f3e165b 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -1129,8 +1129,12 @@ static void imx415_subdev_cleanup(struct imx415 *sensor)
>  	v4l2_ctrl_handler_free(&sensor->ctrls);
>  }
> 
> -static int imx415_power_on(struct imx415 *sensor)
> +static int imx415_power_on(struct device *dev)
>  {
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> +	struct imx415 *sensor = to_imx415(subdev);
> +
>  	int ret;
> 
>  	ret = regulator_bulk_enable(ARRAY_SIZE(sensor->supplies),
> @@ -1161,11 +1165,17 @@ static int imx415_power_on(struct imx415 *sensor)
>  	return ret;
>  }
> 
> -static void imx415_power_off(struct imx415 *sensor)
> +static int imx415_power_off(struct device *dev)
>  {
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> +	struct imx415 *sensor = to_imx415(subdev);
> +
>  	clk_disable_unprepare(sensor->clk);
>  	gpiod_set_value_cansleep(sensor->reset, 1);
>  	regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supplies);
> +
> +	return 0;
>  }
> 
>  static int imx415_identify_model(struct imx415 *sensor)
> @@ -1371,7 +1381,7 @@ static int imx415_probe(struct i2c_client *client)
>  	 * work when runtime PM is disabled in the kernel. To that end, power
>  	 * the sensor on manually here, identify it, and fully initialize it.
>  	 */
> -	ret = imx415_power_on(sensor);
> +	ret = imx415_power_on(sensor->dev);
>  	if (ret)
>  		return ret;
> 
> @@ -1411,7 +1421,7 @@ static int imx415_probe(struct i2c_client *client)
>  	pm_runtime_put_noidle(sensor->dev);
>  	imx415_subdev_cleanup(sensor);
>  err_power:
> -	imx415_power_off(sensor);
> +	imx415_power_off(sensor->dev);
>  	return ret;
>  }
> 
> @@ -1430,32 +1440,12 @@ static void imx415_remove(struct i2c_client *client)
>  	 */
>  	pm_runtime_disable(sensor->dev);
>  	if (!pm_runtime_status_suspended(sensor->dev))
> -		imx415_power_off(sensor);
> +		imx415_power_off(sensor->dev);
>  	pm_runtime_set_suspended(sensor->dev);
>  }
> 
> -static int imx415_runtime_resume(struct device *dev)
> -{
> -	struct i2c_client *client = to_i2c_client(dev);
> -	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> -	struct imx415 *sensor = to_imx415(subdev);
> -
> -	return imx415_power_on(sensor);
> -}
> -
> -static int imx415_runtime_suspend(struct device *dev)
> -{
> -	struct i2c_client *client = to_i2c_client(dev);
> -	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> -	struct imx415 *sensor = to_imx415(subdev);
> -
> -	imx415_power_off(sensor);
> -
> -	return 0;
> -}
> -
> -static DEFINE_RUNTIME_DEV_PM_OPS(imx415_pm_ops, imx415_runtime_suspend,
> -				 imx415_runtime_resume, NULL);
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx415_pm_ops, imx415_power_off,
> +				 imx415_power_on, NULL);
> 
>  static const struct of_device_id imx415_of_match[] = {
>  	{ .compatible = "sony,imx415" },
> --
> 2.34.1
> 

