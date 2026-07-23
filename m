Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4921A479889
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 13:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784814507; cv=none; b=BXJEaaHOOFcq0+DGMEj5EtYjUeMLTHc+j2Z8EJGtiL/1i9N6W232yj2sLLg1QESjKQHcbsF70ZgqtVvXbhZGPIe0Ba80FV42PATEo2H9xinhFmOd4LJbdkw5vuquU2Fs9rQFf9k0C/Wyx8TbCapVmCrHdCtwYMbpY1Pkd7MLDA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784814507; c=relaxed/simple;
	bh=UDM5FB1Zt33g7udDACnUJokhcXf/56BScidi0KzLrbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mbAK0JWAJENb2KxUYKy6xsGQ7Ri79gc4o58J/8k31TQy9kzjAcNAUBO1AhFxCoE4pK8e8cxIS/2fQsNbIr+1Rv1yNFI5wger/0uZBBc9lQwQS/cXuSBXMR25AU6mgeYG03fdn5eAtFu4OZxmQExAwmdFTiJW8arnCSCaELTZPE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t4fB8OK7; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t4fB8OK7"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c70270e6aso628811fa.1
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 06:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784814500; x=1785419300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Z/Y32LlMadHVaAvlj+AeJfJyfIJzuAiPRVTaYDCfC0=;
        b=t4fB8OK7qE9GjLi2PfUOshCi8wjNBKn7Wk9yCW46NqZKvDHOV30fVrEYgD7z1Kg65H
         xWMLXR8AEZlVQBKxwKfZvEvy18o5sGq8N0pc+fJelsa0wKIdsWZhi6K5i0J8mY0LZoHm
         F/PpdKCIty/wnPanGdCV20yr5AwAOZ0yXHVBHEUWaEvqEJWw3oI/KTC8JkezOmoTyaLi
         m4KPMQAy6vkBKv+YY6RUet/bYhtbJGN/9uSeG3TTT1kUPTOUFr1f5ZzRZsY2z0WB7EJ3
         zQYXPzH16deCdx44SqTqKjeXoRh7yLPYPSApwHYE9Q4HsT8Sv0Ei97DmPqoRh7e5SoyG
         bDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784814500; x=1785419300;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Z/Y32LlMadHVaAvlj+AeJfJyfIJzuAiPRVTaYDCfC0=;
        b=JdYUKnoV2Owd9pTHhsPeOubZ3EuaZrahb3K+HgJa2ctnfdM8CGLW+ViiosPCZGsxib
         DsRRXOeQojVdJ3cZJt4jWkuw0ncX4ZWy8wJka13C5pLQ3GmkbUwifFd/xKv1N1cCGCRw
         4LQqVGu/Ux0Z51WfHARSn2CoCIcdENiT1/G+IrmN5c9TZd5N7xRGMWoKPFeuwhTHxT2B
         NXUYhov8oicu96Fme+1WEP43x3shcmgS7SUY98MySUTb39CTBHh2IzJoRhOSjU2WcXAn
         O/bt9RCuTiqSZoZjo5oz1SxxndYzKfrxXyMf4G9erFtUWpoKSnUGCy5JwvVo89SscJTu
         6/5g==
X-Gm-Message-State: AOJu0YyXELvk+g2q9aDxjhI9oEa5NE1MDZuSvp8NzQ048XefNtBUZpLB
	sI0bfY3F7qSquB7YEx/xyAaOE1vX39svc1lkqN+uSVnY80avRe1zP1A7A0zCPh4UEXVBVDa+pN7
	Eh08jNbE=
X-Gm-Gg: AR+sD12G7JYK+yEhgkh3didOb1nJ1Y8C98YeUeLkkVpVgaxQOXRUfF41WJEFyfyhiyp
	VsymNLh1zxblqQNwjgoDk8CuzSSsUh3Mq2OoAeN3mf1vT9NE1pazyYefL0ks5xWADIQ0m1l5KEy
	2zIKJK0EwnqHASiNVU1E2gB5gW7DdqYOWbcRFTqDXMiGsbuq82J9nHivwkjx989cGdAz+4hB9nM
	34Er39gCiN3CVTWC+WrQxMuLXx5kHdXBjP+/R58Itz5v2yH1FEZPe+7HJPF/u9lcky+nzZVVfkN
	WXlJkFT/G8Ex2DTHndzDaRAem6/qr5BKN3tSM5yhcAKEolinTVErTaXWpFQJogIth+dhqSgpMOO
	EMRmrAPTN4h0ITcUrdZ59sZyXpL3GQcy7enIypMBexTscwrYAGjxb55J11a03a0YSddcfIR8MKf
	qKtntcXncdBwpbSFvcXChRBBcpWQIwk1a/W97Cu15ICMoo7YxdeiTCc0JF
X-Received: by 2002:a05:6512:2311:b0:5b1:5b49:9463 with SMTP id 2adb3069b0e04-5b2b2f6f00amr472124e87.4.1784814500437;
        Thu, 23 Jul 2026 06:48:20 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b0c511sm1057374e87.0.2026.07.23.06.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:48:19 -0700 (PDT)
Message-ID: <4f420ef4-b204-4d2c-bbc8-f2a2ade494d2@linaro.org>
Date: Thu, 23 Jul 2026 16:48:19 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] media: i2c: og0ve1b: Introduce per-sensor data
 structure
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com>
 <20260708-og0va1b-v3-2-de8e44455a42@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260708-og0va1b-v3-2-de8e44455a42@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wenmeng.

On 7/8/26 17:33, Wenmeng Liu wrote:
> Refactor the driver to separate sensor-specific data from the common
> driver code. Introduce a sensor_data structure, populated through
> i2c_get_match_data(), to hold the chip ID, MCLK frequency, link
> frequencies and supported modes.
> 
> Test pattern programming is described by a per-sensor callback, and each
> mode stores its media bus format code (rather than a bits-per-pixel
> value) so that sensors with a different output format can be supported.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/i2c/og0ve1b.c | 99 ++++++++++++++++++++++++++++++++-------------
>   1 file changed, 71 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
> index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..041342fbe3c822400388f58a03e6057e186f060f 100644
> --- a/drivers/media/i2c/og0ve1b.c
> +++ b/drivers/media/i2c/og0ve1b.c
> @@ -65,11 +65,23 @@ struct og0ve1b_mode {
>   	u32 height;	/* Frame height in pixels */
>   	u32 hts;	/* Horizontal timing size */
>   	u32 vts;	/* Default vertical timing size */
> -	u32 bpp;	/* Bits per pixel */
> +	u32 code;	/* MEDIA_BUS_FMT code */
>   
>   	const struct og0ve1b_reg_list reg_list;	/* Sensor register setting */
>   };
>   
> +struct og0ve1b;
> +
> +struct og0ve1b_sensor_data {
> +	u64 chip_id;
> +	unsigned long mclk_freq;
> +	int (*enable_test_pattern)(struct og0ve1b *og0ve1b, u32 pattern);
> +	const s64 *link_freq_menu;
> +	int num_link_freqs;
> +	const struct og0ve1b_mode *modes;
> +	int num_modes;
> +};
> +
>   static const char * const og0ve1b_test_pattern_menu[] = {
>   	"Disabled",
>   	"Vertical Colour Bars",
> @@ -99,6 +111,8 @@ struct og0ve1b {
>   
>   	/* Saved register value */
>   	u64 pre_isp;
> +
> +	const struct og0ve1b_sensor_data *data;
>   };
>   
>   static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
> @@ -247,13 +261,13 @@ static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
>   	{ CCI_REG8(0x3f47), 0x35 },
>   };
>   
> -static const struct og0ve1b_mode supported_modes[] = {
> +static const struct og0ve1b_mode og0ve1b_supported_modes[] = {
>   	{
>   		.width = 640,
>   		.height = 480,
>   		.hts = 792,
>   		.vts = 568,
> -		.bpp = 8,
> +		.code = MEDIA_BUS_FMT_Y8_1X8,
>   		.reg_list = {
>   			.regs = og0ve1b_640x480_120fps_mode,
>   			.num_regs = ARRAY_SIZE(og0ve1b_640x480_120fps_mode),
> @@ -273,11 +287,21 @@ static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
>   	return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
>   }
>   
> +static const struct og0ve1b_sensor_data og0ve1b_data = {
> +	.chip_id = OG0VE1B_CHIP_ID,
> +	.mclk_freq = OG0VE1B_MCLK_FREQ_24MHZ,
> +	.enable_test_pattern = og0ve1b_enable_test_pattern,
> +	.link_freq_menu = og0ve1b_link_freq_menu,
> +	.num_link_freqs = ARRAY_SIZE(og0ve1b_link_freq_menu),
> +	.modes = og0ve1b_supported_modes,
> +	.num_modes = ARRAY_SIZE(og0ve1b_supported_modes),
> +};
> +
>   static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
>   {
>   	struct og0ve1b *og0ve1b = container_of(ctrl->handler, struct og0ve1b,
>   					       ctrl_handler);
> -	const struct og0ve1b_mode *mode = &supported_modes[0];
> +	const struct og0ve1b_mode *mode = &og0ve1b->data->modes[0];
>   	s64 exposure_max;
>   	int ret;
>   
> @@ -314,7 +338,7 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
>   				ctrl->val + mode->height, NULL);
>   		break;
>   	case V4L2_CID_TEST_PATTERN:
> -		ret = og0ve1b_enable_test_pattern(og0ve1b, ctrl->val);
> +		ret = og0ve1b->data->enable_test_pattern(og0ve1b, ctrl->val);
>   		break;
>   	default:
>   		ret = -EINVAL;
> @@ -330,10 +354,19 @@ static const struct v4l2_ctrl_ops og0ve1b_ctrl_ops = {
>   	.s_ctrl = og0ve1b_set_ctrl,
>   };
>   
> +static s64 og0ve1b_pixel_rate(const struct og0ve1b_sensor_data *data)
> +{
> +	const struct og0ve1b_mode *mode = &data->modes[0];
> +	unsigned int bpp = mode->code == MEDIA_BUS_FMT_Y8_1X8 ? 8 : 10;
> +
> +	return data->link_freq_menu[0] / bpp;
> +}
> +
>   static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
>   {
>   	struct v4l2_ctrl_handler *ctrl_hdlr = &og0ve1b->ctrl_handler;
> -	const struct og0ve1b_mode *mode = &supported_modes[0];
> +	const struct og0ve1b_mode *mode = &og0ve1b->data->modes[0];
> +	const struct og0ve1b_sensor_data *data = og0ve1b->data;
>   	s64 exposure_max, pixel_rate, h_blank, v_blank;
>   	struct v4l2_fwnode_device_properties props;
>   	struct v4l2_ctrl *ctrl;
> @@ -343,12 +376,12 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
>   
>   	ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr, &og0ve1b_ctrl_ops,
>   				      V4L2_CID_LINK_FREQ,
> -				      ARRAY_SIZE(og0ve1b_link_freq_menu) - 1,
> -				      0, og0ve1b_link_freq_menu);
> +				      data->num_link_freqs - 1,
> +				      0, data->link_freq_menu);
>   	if (ctrl)
>   		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>   
> -	pixel_rate = og0ve1b_link_freq_menu[0] / mode->bpp;
> +	pixel_rate = og0ve1b_pixel_rate(data);
>   	v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, V4L2_CID_PIXEL_RATE,
>   			  0, pixel_rate, 1, pixel_rate);
>   
> @@ -407,7 +440,7 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
>   static void og0ve1b_update_pad_format(const struct og0ve1b_mode *mode,
>   				      struct v4l2_mbus_framefmt *fmt)
>   {
> -	fmt->code = MEDIA_BUS_FMT_Y8_1X8;
> +	fmt->code = mode->code;
>   	fmt->width = mode->width;
>   	fmt->height = mode->height;
>   	fmt->field = V4L2_FIELD_NONE;
> @@ -421,8 +454,8 @@ static int og0ve1b_enable_streams(struct v4l2_subdev *sd,
>   				  struct v4l2_subdev_state *state, u32 pad,
>   				  u64 streams_mask)
>   {
> -	const struct og0ve1b_reg_list *reg_list = &supported_modes[0].reg_list;
>   	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
> +	const struct og0ve1b_reg_list *reg_list = &og0ve1b->data->modes[0].reg_list;
>   	int ret;
>   
>   	ret = pm_runtime_resume_and_get(og0ve1b->dev);
> @@ -484,13 +517,14 @@ static int og0ve1b_set_pad_format(struct v4l2_subdev *sd,
>   				  struct v4l2_subdev_state *state,
>   				  struct v4l2_subdev_format *fmt)
>   {
> +	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
>   	struct v4l2_mbus_framefmt *format;
>   	const struct og0ve1b_mode *mode;
>   
>   	format = v4l2_subdev_state_get_format(state, 0);
>   
> -	mode = v4l2_find_nearest_size(supported_modes,
> -				      ARRAY_SIZE(supported_modes),
> +	mode = v4l2_find_nearest_size(og0ve1b->data->modes,
> +				      og0ve1b->data->num_modes,
>   				      width, height,
>   				      fmt->format.width,
>   				      fmt->format.height);
> @@ -505,10 +539,12 @@ static int og0ve1b_enum_mbus_code(struct v4l2_subdev *sd,
>   				  struct v4l2_subdev_state *sd_state,
>   				  struct v4l2_subdev_mbus_code_enum *code)
>   {
> +	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
> +
>   	if (code->index > 0)
>   		return -EINVAL;
>   
> -	code->code = MEDIA_BUS_FMT_Y8_1X8;
> +	code->code = og0ve1b->data->modes[0].code;
>   
>   	return 0;
>   }
> @@ -517,15 +553,18 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
>   				   struct v4l2_subdev_state *sd_state,
>   				   struct v4l2_subdev_frame_size_enum *fse)
>   {
> -	if (fse->index >= ARRAY_SIZE(supported_modes))
> +	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
> +	const struct og0ve1b_sensor_data *data = og0ve1b->data;
> +
> +	if (fse->index >= data->num_modes)
>   		return -EINVAL;
>   
> -	if (fse->code != MEDIA_BUS_FMT_Y8_1X8)
> +	if (fse->code != data->modes[fse->index].code)
>   		return -EINVAL;
>   
> -	fse->min_width = supported_modes[fse->index].width;
> +	fse->min_width = data->modes[fse->index].width;
>   	fse->max_width = fse->min_width;
> -	fse->min_height = supported_modes[fse->index].height;
> +	fse->min_height = data->modes[fse->index].height;
>   	fse->max_height = fse->min_height;
>   
>   	return 0;
> @@ -534,13 +573,14 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
>   static int og0ve1b_init_state(struct v4l2_subdev *sd,
>   			      struct v4l2_subdev_state *state)
>   {
> +	const struct og0ve1b_mode *mode = &to_og0ve1b(sd)->data->modes[0];
>   	struct v4l2_subdev_format fmt = {
>   		.which = V4L2_SUBDEV_FORMAT_TRY,
>   		.pad = 0,
>   		.format = {
> -			.code = MEDIA_BUS_FMT_Y8_1X8,
> -			.width = supported_modes[0].width,
> -			.height = supported_modes[0].height,
> +			.code = mode->code,
> +			.width = mode->width,
> +			.height = mode->height,
>   		},
>   	};
>   
> @@ -586,9 +626,9 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
>   		return ret;
>   	}
>   
> -	if (val != OG0VE1B_CHIP_ID) {
> -		dev_err(og0ve1b->dev, "chip id mismatch: %x!=%llx\n",
> -			OG0VE1B_CHIP_ID, val);
> +	if (val != og0ve1b->data->chip_id) {
> +		dev_err(og0ve1b->dev, "chip id mismatch: %llx!=%llx\n",
> +			og0ve1b->data->chip_id, val);
>   		return -ENODEV;
>   	}
>   
> @@ -624,8 +664,8 @@ static int og0ve1b_check_hwcfg(struct og0ve1b *og0ve1b)
>   	ret = v4l2_link_freq_to_bitmap(og0ve1b->dev,
>   				       bus_cfg.link_frequencies,
>   				       bus_cfg.nr_of_link_frequencies,
> -				       og0ve1b_link_freq_menu,
> -				       ARRAY_SIZE(og0ve1b_link_freq_menu),
> +				       og0ve1b->data->link_freq_menu,
> +				       og0ve1b->data->num_link_freqs,
>   				       &freq_bitmap);
>   
>   	v4l2_fwnode_endpoint_free(&bus_cfg);
> @@ -686,6 +726,9 @@ static int og0ve1b_probe(struct i2c_client *client)
>   		return -ENOMEM;
>   
>   	og0ve1b->dev = &client->dev;
> +	og0ve1b->data = i2c_get_match_data(client);
> +	if (!og0ve1b->data)
> +		return -ENODEV;
>   
>   	v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
>   
> @@ -700,7 +743,7 @@ static int og0ve1b_probe(struct i2c_client *client)
>   				     "failed to get XVCLK clock\n");
>   
>   	freq = clk_get_rate(og0ve1b->xvclk);
> -	if (freq && freq != OG0VE1B_MCLK_FREQ_24MHZ)
> +	if (freq && freq != og0ve1b->data->mclk_freq)
>   		return dev_err_probe(og0ve1b->dev, -EINVAL,
>   				     "XVCLK clock frequency %lu is not supported\n",
>   				     freq);
> @@ -819,7 +862,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
>   };
>   
>   static const struct of_device_id og0ve1b_of_match[] = {
> -	{ .compatible = "ovti,og0ve1b" },
> +	{ .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, og0ve1b_of_match);
> 

I'm sorry for a delay in completion of my review and testing.
The change is good in my opinion:

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
