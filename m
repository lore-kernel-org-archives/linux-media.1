Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB196348C4A;
	Thu, 30 Jul 2026 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402561; cv=none; b=l8/s6IcK62aff6x7GGItpOrzDPzjW58XG2t0trtdnE1mEa4evgMun8GJMmV637k86vqQs5WSnf6Z2d/CG0L8EVBXhwweAXZzLZHYV0HCIch02Dxnk9PJEZALwpjAV305ruCjYUlBhpSBdTBVOJYGkQ0uKMzBsSzhGaV5YbC1eqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402561; c=relaxed/simple;
	bh=8aI96xTt1FQlltGppSKP7p1b+xTt/C81QT+pshUKJfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CiYE4iNFni0Jn28Ecq1zLL4vDJTGDDkFjJQIN3xGSV7UzgAzTWm65+0DLv9K4hlxGH4TeXGanK8BOPxJGLpS67yJ7fpoBcnoZjui/W/lw16VAQgyLqf3DOvk5hIIEQjciV3KQqKDd1ymDY1UGBRqdcYO8f2G9HKpSAkyH6fUsgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMpnSSzR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMpnSSzR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999561F000E9;
	Thu, 30 Jul 2026 09:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785402560;
	bh=5JB5xncxO/PaAUBUbRddlHPk/+gwtswZ1zFbQ3Aty4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MMpnSSzRGJR8UaoMkNvFaybhg0040nwK47TWpjW3KGL6SU6YgE+p1UBZ85Gj75De7
	 xADR2OLvsWObN8lq8G2GxiJQjfn3W5FX3fdOr/epkrRNaaklOYKWiR4fpO+5ObjvdW
	 EB7+17emtW72RMn0FkkEowV/8kw9hGWpjcb6J4DAA4wyuOKAYRr0X8oM7sAgbMrSoU
	 EcHgtrSxduhIW3WBWkw5XCuXUh+PhW7DiwSllwQ3ezBxxww0PJ49eVyvaIoauiZRpb
	 ytdzCUChUnf9G46NvW7coLPn31baAQyVlO28nqLQLbh6crTyQ0HrhmzCvCjTXGQf8f
	 TZkv5TAQfhR2Q==
Date: Thu, 30 Jul 2026 11:09:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lachlan Michael <lachlan.michael@sony.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	kieran.bingham@ideasonboard.com, jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com, 
	Kengo.Hayasaka@sony.com, Tim.Bird@sony.com, Kazumi.A.Sato@sony.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: Add Sony IMX908 image sensor driver
Message-ID: <20260730-ruddy-tricky-wildebeest-ec9e46@quoll>
References: <20260730021525.166811-1-lachlan.michael@sony.com>
 <20260730021525.166811-3-lachlan.michael@sony.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730021525.166811-3-lachlan.michael@sony.com>

On Thu, Jul 30, 2026 at 11:15:25AM +0900, Lachlan Michael wrote:
> +	msleep(24); /* Regulator stabilization after standby cancel. */
> +
> +	ret = cci_read(imx->cci, IMX908_REG_TYPE_ID, &val, &err);
> +	if (ret || err)
> +		return ret ? ret : err;
> +
> +	chip_id = val;
> +	dev_info(imx->dev, "IMX908 chip ID: 0x%04x\n", chip_id);

Drivers should be silent on success. Drop or dev_dbg.

> +
> +	if (chip_id != IMX908_CHIP_ID) {
> +		dev_err(imx->dev, "Unexpected chip ID 0x%04x (expected 0x%04x)\n",
> +			chip_id, IMX908_CHIP_ID);
> +		return -ENXIO;
> +	}
> +
> +	/* Set to standby mode */
> +	ret = cci_write(imx->cci, IMX908_REG_STANDBY, IMX908_STANDBY_EN, NULL);
> +	if (ret)
> +		dev_err(imx->dev, "failed to enter standby state: %d\n", ret);
> +
> +	return 0;
> +}
> +
> +static int imx908_probe(struct i2c_client *client)
> +{
> +	struct imx908 *imx;
> +	int ret;
> +
> +	/* Allocate Memory */

Really?

> +	imx = devm_kzalloc(&client->dev, sizeof(*imx), GFP_KERNEL);
> +	if (!imx)
> +		return dev_err_probe(&client->dev, -ENOMEM,
> +				     "failed to allocate IMX908 device structure\n");
> +	imx->dev = &client->dev;
> +
> +	/* Initialize V4L2 subdevice */

Obvious.

> +	v4l2_i2c_subdev_init(&imx->sd, client, &imx908_subdev_ops);
> +	imx->sd.internal_ops = &imx908_internal_ops;
> +
> +	/* Register access initialization. Set 2-byte (16-bit) addresses */
> +	imx->cci = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(imx->cci))
> +		return dev_err_probe(&client->dev, PTR_ERR(imx->cci),
> +				     "CCI regmap init failed\n");
> +
> +	/* Get mandatory input clock from DT (INCK) */

Obvious.

> +	imx->xclk = devm_clk_get(imx->dev, "xclk");
> +	if (IS_ERR(imx->xclk))
> +		return dev_err_probe(imx->dev, PTR_ERR(imx->xclk), "xclk\n");
> +
> +	/* Get clock frequency and check against acceptable HW values */
> +	imx->xclk_freq = clk_get_rate(imx->xclk);
> +	ret = imx908_get_inck_sel(imx);
> +	if (ret)
> +		return ret;
> +
> +	/* GPIO reset acquisition */

Please drop obvious comments. Can devm_gpiod_get_optional() be anything
else than GPIO reset acquisition? No.

Redundant comments bloat the code and make it more difficult to actually
spot important things.

> +	imx->reset_gpio = devm_gpiod_get_optional(imx->dev, "reset",
> +						  GPIOD_OUT_HIGH);
> +
> +	if (IS_ERR(imx->reset_gpio))
> +		return dev_err_probe(imx->dev, PTR_ERR(imx->reset_gpio),
> +				     "reset gpio\n");
> +
> +	/* Link to power supplies */
> +	ret = imx908_get_regulators(imx);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "regulator get failed\n");
> +
> +	/* Parse Device Tree endpoint */

Obvious

> +	ret = imx908_parse_fwnode(imx);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "device tree parse failed\n");
> +
> +	/* Power on IMX908 image sensor */

What if imx908_power_on() does power off of the sensor?

> +	ret = imx908_power_on(imx);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "power-on failed\n");
> +
> +	/* Read IMX908 device ID */

Best regards,
Krzysztof

