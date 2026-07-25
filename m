Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635833126B9
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 07:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784965136; cv=none; b=sLN+WQ4a8cdygic7V9ntOqZabhNTrPpHnWlho0eAvHPlWW6jlsuKAf1vPNZFdCnan5EqemWCEIGj4LoTWEPcVGyF7cuPOFGuKVaMDaZuQ54YTVsbRX6KomUmj3g1vAXtDGPsEUPW8jVivtj0xYjEYEGZDZxspIaxuhhWODkJBu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784965136; c=relaxed/simple;
	bh=VWMIk17SrSyGo5oTHUwCe4GU7j1K13mrWReRp5pKOUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dbpsKWg9jkbziTGXsWcKYispYdDpL55AQg1z45clDQVtvyPuw4ozL/U9U/J3CWfgon6X57guWVGS1//aP51SbO3PWLyNSa4xAwgZEwk+VQ6/DkP01grxafL3X/OP2dlP5vVnDGx5WSxXGHUHb/IW0UCI4dfCap6t96cbwls7xL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zIlpzSb3; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zIlpzSb3"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aebe49b227so273417e87.2
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 00:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784965132; x=1785569932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ATBMhXRdEW5TVTDYWajPFd+d4nyZcOHYkx9p8czNgDQ=;
        b=zIlpzSb3Wq75cYELT0cBFgIa/r3/2mY5/kaJM8klDxLmndcdvfhqtqlmhLLdMXBwX9
         TeTIhy/w6dXPPA10828CtWi4WkdQ3o4T5HEWJokfPsc2Lh9FIa/bmtOTlxHEQKEY6oIW
         gwJZxEhyLtKwoAemHTO5tIk9gMNc/trR+5n85pkRJXCKifJ04VaQ/1BpSssgdL9oYSq+
         AkMuHDstiLoRUY7GW/N+YduR1ynKRNxItNOo2HE79MC2xGas5sh6xgfn0A57l2fJtc+g
         oMVjg8VihFRDubKRpJc9gANnBa4nSVwFmSz0tU13dM+yf61FS/xc2dXHtvMLFmYTpa7I
         6I0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784965132; x=1785569932;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATBMhXRdEW5TVTDYWajPFd+d4nyZcOHYkx9p8czNgDQ=;
        b=FxxTG0bNi+qtcUQymMFq9NLIIG6ljh8pPjH4lg5sJ9qhXVXpRyY2upjNZNbcF7kxma
         lvtduCvHTX/bQF3sD3aSlY+nC+2r/CdXsaQrW0atF4z20QkXeqSmNbFvQV2Zy0XPR7it
         EUcsnVSTrEJfpStM4JTTkhD6LfTXMY2wyGaBr+4AKVUImP5w7090pxCgQWCa10XZQezG
         kc6Z8WIMOK2cGASV7Xug4bcmUYiid2BXbLVLckR41mqLG0Nc3BHEekSpjIx+fTUJz0TV
         AaC5rpSxx7sF78KpLzo/ackZ0kcL+DAaasvT6EvojP5qefrRTCNjBHJzp+vhEd5uNK6e
         hhcg==
X-Forwarded-Encrypted: i=1; AHgh+RpGd60vsWww7sPIzkC1985zNYsO8i0FmO4HVeT9p5AkHsGM47rHVUg5uWCp1268Sne4UtCmHNJHcwtGmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBYZiIwNUUt3oG0/f7mcJ7VOoKEKKu6jMUWQ1Vuk0u0TRSRaeF
	3NLEgIqlDBL2CfGFspy6q2N1lbAUG2+GXnlKgb7aH4RW4g8jG5xYFpIdF5TY4dKO1CQ=
X-Gm-Gg: AR+sD10N3KmCLxbVjiZcohjhKT/FdRZnD0EIvGLZ84a/hOHVp9qNOSvw2YeU+RAUSgX
	WEWZU+NxB6EvEx/mHEskkqwkJjE1Gc/2Q0Vgn8Reil0ck3ZKyqkRGvfBfQKdTyrVGJYqrgdJp1w
	hdwSNzvkwcJmgGMln7k+NyvIw6V+Yyj58obp9ZFBeyasqGqq8fjM/V0VSQpi4eJ6V0e4EP4gQqu
	zLOX/glm9dggv7cQ+mfLe/lE4YMbiA+HAeoIkfGuKVghzmY2w8UmwL93VcjAjsheTiaE46ItWTI
	tCRITnyXZt24Mduc0X5lERD7m4/BdTTUYG+KrelaKimGkKZjL7qBFsQVVgsNgWdwzZ8eYKANzFX
	t12+uJ1BMZFgCyX0ykSvoiyPl0JhtVbHGSUnS5t+W2lvSMN6x2MGNfItxGwbSM0RP/swEEjCrIo
	KWBSVxxQyz5cqf7a1r+wHkwHu/plQegh67uVI+Ce84ETMA8VvzN5xdVLAg
X-Received: by 2002:a05:6512:a8a:b0:5ae:c8d9:f977 with SMTP id 2adb3069b0e04-5b2c1b3f4b2mr149566e87.8.1784965132239;
        Sat, 25 Jul 2026 00:38:52 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be0777e2sm330157e87.4.2026.07.25.00.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2026 00:38:51 -0700 (PDT)
Message-ID: <a0deed4a-bcee-467c-8160-e71d8775df8d@linaro.org>
Date: Sat, 25 Jul 2026 10:38:49 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/17] media: i2c: os05b10: add 2-lane support
To: Tarang Raval <tarang.raval@siliconsignals.io>,
 sakari.ailus@linux.intel.com, mehdi.djait@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-15-tarang.raval@siliconsignals.io>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260718200912.16001-15-tarang.raval@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/26 23:09, Tarang Raval wrote:
> Add support for 2-lane.
> 
> Update link-frequency handling to select 750 MHz for 2-lane and 600 MHz for
> 4-lane, and adjust pixel rate computation accordingly. Extend endpoint
> parsing to accept 2 or 4 data lanes.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>   drivers/media/i2c/os05b10.c | 94 ++++++++++++++++++++++++++++---------
>   1 file changed, 71 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index 876186b22f5f..6d91a9660660 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -113,7 +113,8 @@
>   #define OS05B10_TRANSPARENT_EFFECT     0xa0
>   #define OS05B10_ROLLING_BAR_EFFECT     0xc0
>   
> -#define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
> +#define OS05B10_LINK_FREQ_4LANE                (600 * HZ_PER_MHZ)
> +#define OS05B10_LINK_FREQ_2LANE                (750 * HZ_PER_MHZ)

I believe the macro name shall be kept as is, frequency is not specific
to the number of lanes, it's driver implementation/limitation specifics.

>   
>   static const struct v4l2_rect os05b10_native_area = {
>   	.top = 0,
> @@ -136,13 +137,7 @@ static const char * const os05b10_supply_name[] = {
>   };
>   
>   static const struct cci_reg_sequence os05b10_common_regs[] = {
> -	{ OS05B10_REG_PLL_CTRL_01, 0x44 },
> -	{ OS05B10_REG_PLL_CTRL_03, 0x02 },
> -	{ OS05B10_REG_PLL_CTRL_05, 0x32 },
> -	{ OS05B10_REG_PLL_CTRL_06, 0x00 },
> -	{ OS05B10_REG_PLL_CTRL_25, 0x3b },
>   	{ CCI_REG8(0x3002), 0x21 },
> -	{ OS05B10_REG_MIPI_SC_CTRL, 0x72 },
>   	{ CCI_REG8(0x301e), 0xb4 },
>   	{ CCI_REG8(0x301f), 0xd0 },
>   	{ CCI_REG8(0x3021), 0x03 },
> @@ -532,6 +527,24 @@ static const struct cci_reg_sequence mode_1280_720_regs[] = {
>   	{ CCI_REG8(0x4837), 0x0d },
>   };
>   
> +static const struct cci_reg_sequence os05b10_2lane_regs[] = {
> +	{ OS05B10_REG_PLL_CTRL_01,	0x44 },
> +	{ OS05B10_REG_PLL_CTRL_03,	0x02 },
> +	{ OS05B10_REG_PLL_CTRL_05,	0x64 },
> +	{ OS05B10_REG_PLL_CTRL_06,	0x00 },
> +	{ OS05B10_REG_PLL_CTRL_25,	0x3b },
> +	{ OS05B10_REG_MIPI_SC_CTRL,	OS05B10_2_LANE_MODE },
> +};
> +
> +static const struct cci_reg_sequence os05b10_4lane_regs[] = {
> +	{ OS05B10_REG_PLL_CTRL_01,	0x44 },
> +	{ OS05B10_REG_PLL_CTRL_03,	0x02 },
> +	{ OS05B10_REG_PLL_CTRL_05,	0x32 },
> +	{ OS05B10_REG_PLL_CTRL_06,	0x00 },
> +	{ OS05B10_REG_PLL_CTRL_25,	0x3b },
> +	{ OS05B10_REG_MIPI_SC_CTRL,	OS05B10_4_LANE_MODE },
> +};
> +
>   struct os05b10 {
>   	struct device *dev;
>   	struct regmap *cci;
> @@ -650,8 +663,12 @@ static const struct os05b10_mode supported_modes_10bit[] = {
>   	},
>   };
>   
> -static const s64 link_frequencies[] = {
> -	OS05B10_LINK_FREQ_600MHZ,
> +static const s64 link_frequencies_4lane[] = {
> +	OS05B10_LINK_FREQ_4LANE,
> +};
> +
> +static const s64 link_frequencies_2lane[] = {
> +	OS05B10_LINK_FREQ_2LANE,
>   };

Please just use macro with frequency in its name, or plainly use the intended
frequencies here.

>   
>   static const u32 os05b10_mbus_codes[] = {
> @@ -838,7 +855,9 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
>   static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
>   			      const struct os05b10_mode *mode)
>   {
> -	u64 link_freq = link_frequencies[os05b10->link_freq_index];
> +	u64 link_freq = (os05b10->data_lanes == 2) ?
> +			link_frequencies_2lane[os05b10->link_freq_index] :
> +			link_frequencies_4lane[os05b10->link_freq_index];
>   	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);
>   
>   	dev_dbg(os05b10->dev,
> @@ -983,6 +1002,17 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
>   	ret = pm_runtime_resume_and_get(os05b10->dev);
>   	if (ret < 0)
>   		return ret;
> +	/* Set pll & mipi lane configuration */
> +	if (os05b10->data_lanes == 2)
> +		cci_multi_reg_write(os05b10->cci, os05b10_2lane_regs,
> +				    ARRAY_SIZE(os05b10_2lane_regs), &ret);
> +	else
> +		cci_multi_reg_write(os05b10->cci, os05b10_4lane_regs,
> +				    ARRAY_SIZE(os05b10_4lane_regs), &ret);
> +	if (ret) {
> +		dev_err(os05b10->dev, "failed to write pll & mipi lane registers\n");
> +		goto err_rpm_put;
> +	}
>   
>   	/* Write common registers */
>   	ret = cci_multi_reg_write(os05b10->cci, os05b10_common_regs,
> @@ -1195,22 +1225,39 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
>   	if (ret)
>   		return ret;
>   
> -	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4 &&
> +	    bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
>   		ret = dev_err_probe(os05b10->dev, -EINVAL,
> -				    "only 4 data lanes are supported\n");
> +				    "4 and 2 data lanes are supported\n");
>   		goto error_out;
>   	}
>   
>   	os05b10->data_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
>   
> -	ret = v4l2_link_freq_to_bitmap(os05b10->dev, bus_cfg.link_frequencies,
> -				       bus_cfg.nr_of_link_frequencies,
> -				       link_frequencies,
> -				       ARRAY_SIZE(link_frequencies),
> -				       &link_freq_bitmap);
> -	if (ret) {
> -		dev_err(os05b10->dev, "only 600MHz frequency is available\n");
> -		goto error_out;
> +	if (os05b10->data_lanes == 2) {
> +		ret = v4l2_link_freq_to_bitmap(os05b10->dev,
> +					       bus_cfg.link_frequencies,
> +					       bus_cfg.nr_of_link_frequencies,
> +					       link_frequencies_2lane,
> +					       ARRAY_SIZE(link_frequencies_2lane),
> +					       &link_freq_bitmap);
> +		if (ret) {
> +			dev_err(os05b10->dev,
> +				"For 2 lane 750MHz frequency is available\n");
> +			goto error_out;
> +		}
> +	} else {
> +		ret = v4l2_link_freq_to_bitmap(os05b10->dev,
> +					       bus_cfg.link_frequencies,
> +					       bus_cfg.nr_of_link_frequencies,
> +					       link_frequencies_4lane,
> +					       ARRAY_SIZE(link_frequencies_4lane),
> +					       &link_freq_bitmap);
> +		if (ret) {
> +			dev_err(os05b10->dev,
> +				"For 4 lane 600MHz frequency is available\n");
> +			goto error_out;
> +		}
>   	}
>   
>   	os05b10->link_freq_index = __ffs(link_freq_bitmap);
> @@ -1240,10 +1287,11 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
>   
>   	os05b10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
>   						    V4L2_CID_LINK_FREQ,
> -						    ARRAY_SIZE(link_frequencies) - 1,
> +						    ARRAY_SIZE(link_frequencies_4lane) - 1,
>   						    os05b10->link_freq_index,
> -						    link_frequencies);
> -
> +						    (os05b10->data_lanes == 2) ?
> +						    link_frequencies_2lane :
> +						    link_frequencies_4lane);
>   	if (os05b10->link_freq)
>   		os05b10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>   

-- 
Best wishes,
Vladimir
