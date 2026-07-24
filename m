Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED3643990F
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 14:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784902126; cv=none; b=iK+QTfa4bMscIlDmhy3S+h+gWNQCOHut8fN52vdxoh8YqIhLO/DAa0ERqUrTbTJQ6lSpi8x0FCXPJaFJqYny4Ugvwujn8x1EX63wbDyOE5VNZbjCAmoyazY2q2qPsRb9jJdWdY2o5rXtVEm/OTBLBfpLTn5DklTcrWdBtj/t3Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784902126; c=relaxed/simple;
	bh=+95YylFSuPdwdS/zBGzUw1Hnx0TZkOi06MhtnFSjbBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XxJlpbl1DorPPooMQZrkCboi2XGJdxaCJds2Vn7zblb4BBgSqR8NqoGvNcks0xzulo71U80ECh2zb5DDGZgznQSAGVo4HSkiCB67xrJa+L8195rGfzxHouZufnITTJdLtO3fXdTmhcH5sWqUo9C692p6I4tFVvqxcTq8wM2o26A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NJxCTULv; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NJxCTULv"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39efab5d138so124691fa.2
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 07:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784902120; x=1785506920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kk9C3bC2SPMp6fc1IjuqNg0mxg9eXc/nnl4UNT3f89U=;
        b=NJxCTULv+f0ITCa2/J4VNqP/IevrerWGhDGeAxEg7UUXtmKKNM0eNDFgGZfEdXWGN5
         SP9gvAW9iJMDtPxfC11GB8c1gDo1v8sbf+IHWYUchT8oAZqndXvqYhKTxZQx9lbgug03
         2QfTVNPce/nB0PWbNNhuc5dm8aTW99/lu5e6wr1L9vHD58T5qL0UWrgYMZEZhIimTWqd
         INBTP9PXMA5ViupH29R1djlO2ykbZ57F5Y3+V4mtvxOaIgyAcFaPImTTWbtXR8vao4r+
         POs39F3GB+focLfmPp9CbA8llTzrgMGnWvDboz8JyPRsLckhLiYSsdIbrppwJWYhkZCY
         FduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784902120; x=1785506920;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kk9C3bC2SPMp6fc1IjuqNg0mxg9eXc/nnl4UNT3f89U=;
        b=oWXHS2VHu7tgqIh0R1s5jG4L8PX6I8WB5IUp8aOLztYLVl7/YIhhqyGWwo0hAB80Jb
         QsS7t+t7xV8IwdsQ2x1dvLQZfOG6/Z0IDaisMitsbHZlYU4C7UwBzFW/AlA6h0k65T0a
         3v8aq0/AefUV6GOc+aSuf8u95RXDw+d0H1D0DhOUcIdyeViwJnj3/utLFSOIHr8WkkCq
         J2op5jiBEHtLF7vFrJ7VKdoIgC0l/xyciDZByTC0YWZbfIKxh77Q6Bz5A28p1SB5skD3
         kbHINwx4O5F5kixYc6A6i/5zeFbDRHIVNS8EgiqDU5d4aQ+kio2Gt0GVCKtLOnIbJ2Dy
         SgxA==
X-Forwarded-Encrypted: i=1; AHgh+RrLHhOvvlKZcJMmlmCSMdcsPtARh3nrfBuk9GDPXHeZ3ghDcIizfzFQT+L2cVG9YfQR96bDS2nSFfmvBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRd7XRMrqy+9e4lbzDyk9snhtd6CT2Z8UIvK2on4qip2ZeeQuJ
	+gyMKR37KbLwXhmVsSyTXM+/0ZY2Plr2W+CTUdOmoYigqo476ixgtoaMp4vNxd9sOQI=
X-Gm-Gg: AR+sD13FrZIHo4FLTl783gM7qc5Y+YI/WqUbNHSfDosqwXM/THTqffZOs/OC9C/AimT
	1JJW4V25zPf8UlNsLDX2lQUmRTe4+DcFyrQKMcGpI7Tv2ZanGO2YvWYgKrEhSB/kzxFSv1wtBxI
	PEKM1YbSvP4x9ptKmHDLPwD5KI4firRuvoZjJvQmNnwjZa7mdeYmRvVEMMsNzDRFm39r7c/SEMb
	mYfRGphTq4now/+PoLMOcismhxxgPR47rxUJA2X3wQyhOVkVDqUG2b8LcD5QlTMZZUTFxQir5LY
	EvPP2zag5Vz3V+sqeEi0NSFNfQ37tF5vldSy9kOKsfiUTqweyGxur7R2Jp4/nZwBetIIM4GTxiM
	6806TJn6Jfl5YnZE0/iyaDQ1EdTFwtpULaKjZDef2nMhGIfJHVI6Y88o4fA4foRN3ko+czZxpmI
	0Z0a/dDbUBhb7wLW0W/pKcWCkKOfRDxNN5dE2sc8PKv7EkVCE8lX76obqC6WNokNrB6IU=
X-Received: by 2002:a05:651c:211d:b0:39e:b5d2:dc63 with SMTP id 38308e7fff4ca-39f07f011f5mr8235551fa.5.1784902120067;
        Fri, 24 Jul 2026 07:08:40 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f22187279sm539991fa.13.2026.07.24.07.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 07:08:39 -0700 (PDT)
Message-ID: <f9ba3d84-2bda-40ec-8715-fa8d7ca2880b@linaro.org>
Date: Fri, 24 Jul 2026 17:08:38 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/17] media: i2c: os05b10: add 12-bit RAW mode support
To: Tarang Raval <tarang.raval@siliconsignals.io>,
 sakari.ailus@linux.intel.com, mehdi.djait@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-9-tarang.raval@siliconsignals.io>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260718200912.16001-9-tarang.raval@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/26 23:08, Tarang Raval wrote:
> Expose a 12-bit Bayer output option in the OS05B10 V4L2 sub-device driver.
> 
> Add a 12-bit mode table alongside the existing 10-bit mode, extend the
> enumerated mbus codes to include RAW12, and select the correct mode table
> based on the requested mbus format in enum_frame_size and stream enable.
> 
> Also move OS05B10_REG_MIPI_SC_CTRL_1 programming out of the common register
> list and program it at stream-on depending on the selected mode bpp (10/12).
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>   drivers/media/i2c/os05b10.c | 112 ++++++++++++++++++++++++++++++------
>   1 file changed, 96 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index 4e177eacc815..e11a3c308299 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -146,7 +146,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>   	{ CCI_REG8(0x301e), 0xb4 },
>   	{ CCI_REG8(0x301f), 0xd0 },
>   	{ CCI_REG8(0x3021), 0x03 },
> -	{ OS05B10_REG_MIPI_SC_CTRL_1, 0x01 },
>   	{ CCI_REG8(0x3107), 0xa1 },
>   	{ CCI_REG8(0x3108), 0x7d },
>   	{ CCI_REG8(0x3109), 0xfc },
> @@ -500,6 +499,21 @@ struct os05b10_mode {
>   	struct os05b10_reg_list reg_list;
>   };
>   
> +static const struct os05b10_mode supported_modes_12bit[] = {
> +	{
> +		.width = 2592,
> +		.height = 1944,
> +		.vts = 2007,
> +		.hts = 1744,

It's unusual to see .hts < .width and .vts < .height. Will is cause
errors in hblank/vblank computations in os05b10_set_framing_limits()?

> +		.exp = 1900,
> +		.bpp = 12,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_2592_1944_regs),
> +			.regs = mode_2592_1944_regs,
> +		},
> +	},
> +};
> +
>   static const struct os05b10_mode supported_modes_10bit[] = {
>   	{
>   		.width = 2592,
> @@ -521,6 +535,7 @@ static const s64 link_frequencies[] = {
>   
>   static const u32 os05b10_mbus_codes[] = {
>   	MEDIA_BUS_FMT_SBGGR10_1X10,
> +	MEDIA_BUS_FMT_SBGGR12_1X12,
>   };
>   
>   static const char * const os05b10_test_pattern_menu[] = {
> @@ -552,14 +567,20 @@ static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
>   	return container_of_const(sd, struct os05b10, sd);
>   };
>   
> -static u32 os05b10_get_format_code(struct os05b10 *os05b10)
> +static u32 os05b10_get_format_code(struct os05b10 *os05b10, u8 bpp)
>   {
> -	static const u32 codes[2][2] = {
> -		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
> -		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
> +	static const u32 codes[2][2][2] = {
> +		{	/* 10 bpp */
> +			{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10 },
> +			{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10 },
> +		},
> +		{	/* 12 bpp */
> +			{ MEDIA_BUS_FMT_SBGGR12_1X12, MEDIA_BUS_FMT_SGBRG12_1X12 },
> +			{ MEDIA_BUS_FMT_SGRBG12_1X12, MEDIA_BUS_FMT_SRGGB12_1X12 },
> +		},
>   	};
>   
> -	return codes[os05b10->vflip->val][os05b10->hflip->val];
> +	return codes[bpp == 12][os05b10->vflip->val][os05b10->hflip->val];
>   }
>   
>   static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
> @@ -571,6 +592,34 @@ static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
>                           os05b10_tp_val[pattern], NULL);
>   }
>   
> +static int get_mode_table(struct os05b10 *os05b10, unsigned int code,
> +			  const struct os05b10_mode **mode_list,
> +			  unsigned int *num_modes)
> +{
> +	switch (code) {
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +		*mode_list = supported_modes_12bit;
> +		*num_modes = ARRAY_SIZE(supported_modes_12bit);
> +		return 0;
> +
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +		*mode_list = supported_modes_10bit;
> +		*num_modes = ARRAY_SIZE(supported_modes_10bit);
> +		return 0;
> +
> +	default:
> +		dev_err(os05b10->dev,
> +			"Unsupported media bus format: %#x\n", code);
> +		return -EINVAL;
> +	}
> +}
> +
>   static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
>   {
>   	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
> @@ -650,8 +699,8 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
>   	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
>   		return -EINVAL;
>   
> -	code->code = os05b10_get_format_code(os05b10);
> -
> +	code->code = os05b10_get_format_code(os05b10,
> +					     (code->index == 1) ? 12 : 10);

os05b10_mbus_codes[code->index] == MEDIA_BUS_FMT_SBGGR12_1X12 is more
verbose, but seems to be a better and more reliable check.

Probably a simple inline function to get bpp from code->index can be added.

Another option is to change the second argument of os05b10_get_format_code()
from bpp to just media bus format, so you can write

     os05b10_get_format_code(os05b10, os05b10_mbus_codes[code->index]);

>   	return 0;
>   }
>   
> @@ -684,11 +733,20 @@ static int os05b10_set_pad_format(struct v4l2_subdev *sd,
>   				  struct v4l2_subdev_state *sd_state,
>   				  struct v4l2_subdev_format *fmt)
>   {
> -	const struct os05b10_mode *mode = &supported_modes_10bit[0];
>   	struct os05b10 *os05b10 = to_os05b10(sd);
> +	const struct os05b10_mode *mode_list;
>   	struct v4l2_mbus_framefmt *format;
> +	const struct os05b10_mode *mode;
> +	unsigned int num_modes;
>   	int ret;
>   
> +	ret = get_mode_table(os05b10, fmt->format.code, &mode_list, &num_modes);
> +	if (ret)
> +		return ret;
> +
> +	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
> +				      fmt->format.width, fmt->format.height);
> +
>   	fmt->format.width = mode->width;
>   	fmt->format.height = mode->height;
>   	fmt->format.field = V4L2_FIELD_NONE;
> @@ -731,12 +789,21 @@ static int os05b10_enum_frame_size(struct v4l2_subdev *sd,
>   				   struct v4l2_subdev_state *sd_state,
>   				   struct v4l2_subdev_frame_size_enum *fse)
>   {
> -	if (fse->index >= ARRAY_SIZE(supported_modes_10bit))
> +	struct os05b10 *os05b10 = to_os05b10(sd);
> +	const struct os05b10_mode *mode_list;
> +	unsigned int num_modes;
> +	int ret;
> +
> +	ret = get_mode_table(os05b10, fse->code, &mode_list, &num_modes);
> +	if (ret)
> +		return ret;
> +
> +	if (fse->index >= num_modes)
>   		return -EINVAL;
>   
> -	fse->min_width = supported_modes_10bit[fse->index].width;
> +	fse->min_width = mode_list[fse->index].width;
>   	fse->max_width = fse->min_width;
> -	fse->min_height = supported_modes_10bit[fse->index].height;
> +	fse->min_height = mode_list[fse->index].height;
>   	fse->max_height = fse->min_height;
>   
>   	return 0;
> @@ -749,13 +816,18 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
>   	struct os05b10 *os05b10 = to_os05b10(sd);
>   	const struct os05b10_reg_list *reg_list;
>   	const struct v4l2_mbus_framefmt *fmt;
> +	const struct os05b10_mode *mode_list;
>   	const struct os05b10_mode *mode;
> +	unsigned int num_modes;
>   	int ret;
>   
>   	fmt = v4l2_subdev_state_get_format(state, 0);
> -	mode = v4l2_find_nearest_size(supported_modes_10bit,
> -				      ARRAY_SIZE(supported_modes_10bit), width,
> -				      height, fmt->width, fmt->height);
> +	ret = get_mode_table(os05b10, fmt->code, &mode_list, &num_modes);
> +	if (ret)
> +		return ret;
> +
> +	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
> +				      fmt->width, fmt->height);
>   
>   	ret = pm_runtime_resume_and_get(os05b10->dev);
>   	if (ret < 0)
> @@ -769,6 +841,14 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
>   		goto err_rpm_put;
>   	}
>   
> +	ret = cci_write(os05b10->cci, OS05B10_REG_MIPI_SC_CTRL_1,
> +			(mode->bpp == 12) ? OS05B10_12BIT_MODE :
> +			OS05B10_10BIT_MODE, NULL);
> +	if (ret) {
> +		dev_err(os05b10->dev, "failed to write pixel bit registers\n");
> +		goto err_rpm_put;
> +	}
> +
>   	/* Write sensor mode registers */
>   	reg_list = &mode->reg_list;
>   	ret = cci_multi_reg_write(os05b10->cci, reg_list->regs,
> @@ -831,7 +911,7 @@ static int os05b10_init_state(struct v4l2_subdev *sd,
>   	format = v4l2_subdev_state_get_format(state, 0);
>   
>   	mode = &supported_modes_10bit[0];
> -	format->code = os05b10_get_format_code(os05b10);
> +	format->code = os05b10_get_format_code(os05b10, 10);

If the type of the second argument of os05b10_get_format_code() is changed,
it'd be needed to change it to a clearer

       os05b10_get_format_code(os05b10, os05b10_mbus_codes[0]);

>   
>   	/* Update image pad formate */
>   	format->width = mode->width;

-- 
Best wishes,
Vladimir
