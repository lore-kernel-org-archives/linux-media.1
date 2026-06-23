Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1696E37C0EB
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 11:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214001; cv=none; b=OzUrMy6VQXfoyyWiQccHVPINb4+w0nnJBUVGQLrdiVbRTaGlc/6RO+8X6NYZuLfxEns6S/YsDawWM5YTEwQYDdaEFX4akmOlxOEwWID0xX6Lp7EiuPeDFh7MlRhUu9pMYwPLhjn5e7ZFsfZU2YdsDMjiOS9HJn4bky8RINUpAr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214001; c=relaxed/simple;
	bh=soeXldmtt2/8kQwJYWKtRqEeVTZgpz8NOvdBSSabwp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kxMgTWqD8jXLsHoaw8m12htUPCxhNB27DTrrM5kOTmGz5PYoYqmrPn9IhAe5hzlFiAejWkFw2Ps1zQqu4S5xkHhejoJQshN0/mN/UR9aRduuvpfkvEU9nMqrWf017u9Vpp+u7syztni7EDLIT45sEh68g6CEncuO/Bie8mwBVhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6351F000E9;
	Tue, 23 Jun 2026 11:26:38 +0000 (UTC)
Message-ID: <d9b110be-a14b-4fbe-bf2d-036f3cd922a6@nxsw.ie>
Date: Tue, 23 Jun 2026 12:26:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: i2c: ov8856 : remove ACPI node bypass
 mechanism
To: Serin Yeh <serin.yeh@intel.com>, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, jimmy.su@intel.com, sarang.sapre@intel.com
References: <BPkAfNBWv3FtV-5v-zRwnqX_ASShq9wG6NhI7ftYKii_3qF0KxcdaxS31MAkVKB7zlAUoLQQXAaef5p2Qpn4LA==@protonmail.internalid>
 <20260623084536.3400318-1-serin.yeh@intel.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <20260623084536.3400318-1-serin.yeh@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/06/2026 09:45, Serin Yeh wrote:
> The driver currently skips power-on and power-off sequences when
> running with ACPI devices by checking is_acpi_node(). This results in
> all power configuration steps (GPIO, and regulators) being bypassed.
> 
> Remove the is_acpi_node() checks to ensure that the full power
> sequence is always executed regardless of the firmware interface.

Since you are submitting a bugfix you need

- Fixes:
- Cc: stable

The question is how/why is this a bugfix for you ? Are you supplying the 
appropriate regulators which are discoverable and usable on an ACPI system ?

If so which one. More detail is required here. You'll need to detail how 
on existing ACPI platforms this change won't regress i.e. prove you've 
thought/tested about that or ask for testers to validate the change.

> Also fix a debug message to report the actual number of CSI data lanes
> from the parsed bus configuration instead of cur_mode.

This should be and is in a separate patch, so drop from your git log.

> 
> With these changes, the driver behaves consistently across DT and ACPI
> platforms and ensures correct hardware initialization.
> 
> Signed-off-by: Serin Yeh <serin.yeh@intel.com>
> ---
>   drivers/media/i2c/ov8856.c | 29 ++++++++++-------------------
>   1 file changed, 10 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> index 8bedb47cd7cf..9d2b0469a576 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -2082,9 +2082,6 @@ static int ov8856_power_on(struct device *dev)
>   	struct ov8856 *ov8856 = to_ov8856(sd);
>   	int ret;
> 
> -	if (is_acpi_node(dev_fwnode(dev)))
> -		return 0;
> -
>   	ret = clk_prepare_enable(ov8856->xvclk);
>   	if (ret < 0) {
>   		dev_err(dev, "failed to enable xvclk\n");
> @@ -2120,9 +2117,6 @@ static int ov8856_power_off(struct device *dev)
>   	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>   	struct ov8856 *ov8856 = to_ov8856(sd);
> 
> -	if (is_acpi_node(dev_fwnode(dev)))
> -		return 0;
> -
>   	gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
>   	regulator_bulk_disable(ARRAY_SIZE(ov8856_supply_names),
>   			       ov8856->supplies);
> @@ -2293,21 +2287,18 @@ static int ov8856_get_hwcfg(struct ov8856 *ov8856)
>   		dev_warn(dev, "external clock rate %u is unsupported",
>   			 xvclk_rate);
> 
> -	if (!is_acpi_node(fwnode)) {
> -		ov8856->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> -							     GPIOD_OUT_LOW);
> -		if (IS_ERR(ov8856->reset_gpio))
> -			return PTR_ERR(ov8856->reset_gpio);
> +	ov8856->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						     GPIOD_OUT_LOW);
> +	if (IS_ERR(ov8856->reset_gpio))
> +		return PTR_ERR(ov8856->reset_gpio);
> 
> -		for (i = 0; i < ARRAY_SIZE(ov8856_supply_names); i++)
> -			ov8856->supplies[i].supply = ov8856_supply_names[i];
> +	for (i = 0; i < ARRAY_SIZE(ov8856_supply_names); i++)
> +		ov8856->supplies[i].supply = ov8856_supply_names[i];
> 
> -		ret = devm_regulator_bulk_get(dev,
> -					      ARRAY_SIZE(ov8856_supply_names),
> -					      ov8856->supplies);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov8856_supply_names),
> +				      ov8856->supplies);
> +	if (ret)
> +		return ret;

This looks like a legitimate fix on its own.

You should break this up, into a series and provide more detail on what 
is going on both in the overview and the individual 3-4 patches themselves.

>   	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
>   	if (!ep)
> --
> 2.25.1
> 
> 

---
bod
