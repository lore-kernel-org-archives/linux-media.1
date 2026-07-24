Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3B441A51D
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 13:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784899635; cv=none; b=I5KdH2BYaFh4uQQXdHMCr4wAjavwxgEnHoTtSnw0yUZNZBtnKF+PLNSyxQVicOIJxRSOOrc+xPJNJ1475kWl4Gy3Ivkdlsvw6yZ+OqGCQevDvM3+XrhMF68HaRmBQnnr8uqKFeWEqqTLvEdcXRD57LQaWBQbT1U6jpf79Xtho38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784899635; c=relaxed/simple;
	bh=9i+fqpJJVodPr3EYl+cYo+mG7fXc4EP+oPdrqWlbX8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhtIb6Ju20Vf0l4N1rs6Txxt5NdZzIeVc3z9ijwg93OL45T80OiPNU83j5pPU2/FTZUnHvltQsUc8iKdPMJs4bOI1WQvPlYQUDgUq6YbZSWUjY/08YK5laFecH9XA6tc3AWdpIk555xXKxChrvcMZt7A4u3T41y7MtDtUKBwZQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sQTcPyJZ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sQTcPyJZ"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeafa51b5cso58076e87.1
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 06:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784899628; x=1785504428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TvKKWFw0cmhK0wjKFGEdx7eH0kIrLjjTxehxj0zrAa8=;
        b=sQTcPyJZwPD2KC18ixabThZaiaLHQ3q4fWxzieMd7o1CVkDykj3txAb85EfelQC8mn
         aP8OKQONnCTtiELJCB6+RK+CjJpRxV4w/4igMWcj4eU9ZVM0oD3WDeEu4vM7DhRRD+ho
         tfx2l+BLNrUae7u2Tp1bcieoKO7IvS37dIs9MhaiLAX+KVnKGF74DeamtRYBDbPq05BJ
         0ABUjPlN2ahk1Sfzuk5SUS5Th2dZ8uoIISZZgi2wKO/b0C0RrlH3/aWLRzaCbdnGlfg9
         Hv6c2rsHdQZIJlgPaPr3NyMHmd8wsTDUtei4Z+Rwqp/sPH+Mvqxq2sfxUuOrjHoDY+va
         J9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784899628; x=1785504428;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TvKKWFw0cmhK0wjKFGEdx7eH0kIrLjjTxehxj0zrAa8=;
        b=Q9iNaG0rCr+1biVlLOLWXoNB7EjG1vlhfT8h2iBbuf/WtlZd1Hj8jzRnO8cuQYDvHi
         gBKLKuvePudKJlUbsWWcfY3QvU1EZ2uA5/vKH2DIIAipbEijDeUDPd+Xw1+jFck7fhd9
         ni8DZKcCgHLwviNLJsYqXP2xuzI6jFbqm8iyj4dBfsI+RFU7RXAiARVms2VOnKyQJ7uC
         aTMLaTva+Bszceqn2aHkgjiN32lMd5sYgidzdTws0IC/cAvZ8P+xd3ERsjPYJqvkA1fZ
         ZwuKRezlIaGS9WrbNJEFqbbuQji1q8yaS1pBTVSB80JTNtdt47aD4RnA+PuewLOvIG+r
         Ob8A==
X-Forwarded-Encrypted: i=1; AHgh+RoW3VHFuZ4cfzqJubMock7Eux1lvQ6lHAfckOLxITBYsyUSr67Z02TzCaEx0S+lEUDnuQHwIHzug/opCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfRejh3i6vcfIsJKGqO3e4v/klsai2czbIdMjHxKMi5gRQNBw0
	vWbOQ2e86FvJ6xC2VCZ4eGWip+Wp+WEXA4OMZdOqK2UCFfOPrcVqTWddJkPRL1mRY6w=
X-Gm-Gg: AR+sD13ZwjgMPRLSTu1rgDYh36trI85bwGBj+J2HFvf33fOqh/EprMbjmY2LRhbjbxx
	iBZP4wm0LA/6iya/iji3kcbHlyvB2xgW2uKtDXDbQhxclsKjHUG2z2g+wCm8C61n9Ex9cnxev/Q
	Fn67Phdxh2tWlkH+Zy3v33JJJqEU8MZpr5TnFhXYkCEwm7m74XgGgCpLqQ26VRlLo2ha1281FH8
	KDbjmXU3vpsnwp/JP9ZSDj4wH1HzSulIDstR0IYtesjiY4wGPm3dNSC7l0u/x9eiFkfGErHgMRv
	cQrnefTOkM57Qr8uMj/X/uG3y3xgRwCT3DyTcvfNSHpwoOslFaX4hzI/O4xfvmRv4Sc9AnIFqgf
	muXJVoEReNS4AzuYsN6c+/8mziLy6Jx3MQlZ7+ACca2ytz5aqivsOSmQIpgy+1IO3MszhKHuYGY
	sz5klPey3cjey9Yuk7J5t780ei/noH1UAgy2cdgoW41uTgYHF/0aM6p4LK3zA2XkG2hpQ=
X-Received: by 2002:a05:6512:1256:b0:5b0:6aea:cdb5 with SMTP id 2adb3069b0e04-5b2b7ad323amr492116e87.1.1784899628054;
        Fri, 24 Jul 2026 06:27:08 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm1562311e87.4.2026.07.24.06.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 06:27:07 -0700 (PDT)
Message-ID: <9cc2e087-ccc5-4121-83b6-c744cf944aa1@linaro.org>
Date: Fri, 24 Jul 2026 16:27:07 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/17] media: i2c: os05b10: Add H/V flip support
To: Tarang Raval <tarang.raval@siliconsignals.io>,
 sakari.ailus@linux.intel.com, mehdi.djait@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-7-tarang.raval@siliconsignals.io>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260718200912.16001-7-tarang.raval@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/26 23:08, Tarang Raval wrote:
> Add HFLIP and VFLIP controls, lock them while streaming,
> and update the reported Bayer format based on the flip state.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>   drivers/media/i2c/os05b10.c | 56 ++++++++++++++++++++++++++++++++++---
>   1 file changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index abf3d2970900..61c51844a91e 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -96,6 +96,10 @@
>   #define OS05B10_MIRROR			BIT(3)
>   #define OS05B10_FLIP			GENMASK(5, 4)
>   
> +#define OS05B10_REG_ANALOG_FLIP         CCI_REG8(0x3716)
> +#define OS05B10_FLIP_ENABLE             0x04
> +#define OS05B10_FLIP_DISABLE            0x24
> +
>   #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
>   
>   #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
> @@ -231,7 +235,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>   	{ CCI_REG8(0x370f), 0x1c },
>   	{ CCI_REG8(0x3710), 0x00 },
>   	{ CCI_REG8(0x3713), 0x00 },
> -	{ CCI_REG8(0x3716), 0x24 },
>   	{ CCI_REG8(0x371a), 0x1e },
>   	{ CCI_REG8(0x3724), 0x09 },
>   	{ CCI_REG8(0x3725), 0xb2 },
> @@ -465,6 +468,8 @@ struct os05b10 {
>   	struct v4l2_ctrl *vblank;
>   	struct v4l2_ctrl *gain;
>   	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *vflip;
> +	struct v4l2_ctrl *hflip;
>   
>   	u32 link_freq_index;
>   	u32 data_lanes;
> @@ -513,6 +518,16 @@ static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
>   	return container_of_const(sd, struct os05b10, sd);
>   };
>   
> +static u32 os05b10_get_format_code(struct os05b10 *os05b10)
> +{
> +	static const u32 codes[2][2] = {
> +		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
> +		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
> +	};
> +
> +	return codes[os05b10->vflip->val][os05b10->hflip->val];
> +}
> +
>   static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
>   {
>   	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
> @@ -556,6 +571,20 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
>   		ret = cci_write(os05b10->cci, OS05B10_REG_EXPOSURE,
>   				ctrl->val, NULL);
>   		break;
> +	case V4L2_CID_HFLIP:
> +	case V4L2_CID_VFLIP:
> +		ret = cci_update_bits(os05b10->cci, OS05B10_REG_FORMAT1,
> +				      OS05B10_MIRROR | OS05B10_FLIP,
> +				      (!os05b10->hflip->val ?
> +				       OS05B10_MIRROR : 0) |
> +				      (os05b10->vflip->val ?
> +				       OS05B10_FLIP : 0), NULL);
> +
> +		ret |= cci_write(os05b10->cci, OS05B10_REG_ANALOG_FLIP,
> +				 (os05b10->vflip->val == 1) ?
> +				 OS05B10_FLIP_ENABLE : OS05B10_FLIP_DISABLE,
> +				 NULL);

Above please follow the review comment given by Mehdi.

It's expected to see

cci_update_bits(<...>, &ret);
cci_write(<...>, &ret);

> +		break;
>   	default:
>   		ret = -EINVAL;
>   		break;
> @@ -570,10 +599,12 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
>   				  struct v4l2_subdev_state *sd_state,
>   				  struct v4l2_subdev_mbus_code_enum *code)
>   {
> +	struct os05b10 *os05b10 = to_os05b10(sd);
> +
>   	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
>   		return -EINVAL;
>   
> -	code->code = os05b10_mbus_codes[code->index];
> +	code->code = os05b10_get_format_code(os05b10);
>   
>   	return 0;
>   }
> @@ -712,6 +743,9 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
>   	if (ret)
>   		goto err_rpm_put;
>   
> +	__v4l2_ctrl_grab(os05b10->vflip, true);
> +	__v4l2_ctrl_grab(os05b10->hflip, true);
> +
>   	return 0;
>   
>   err_rpm_put:
> @@ -732,6 +766,9 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
>   	if (ret)
>   		dev_err(os05b10->dev, "failed to set stream off\n");
>   
> +	__v4l2_ctrl_grab(os05b10->vflip, false);
> +	__v4l2_ctrl_grab(os05b10->hflip, false);
> +
>   	pm_runtime_put(os05b10->dev);
>   
>   	return 0;
> @@ -740,6 +777,7 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
>   static int os05b10_init_state(struct v4l2_subdev *sd,
>   			      struct v4l2_subdev_state *state)
>   {
> +	struct os05b10 *os05b10 = to_os05b10(sd);
>   	struct v4l2_mbus_framefmt *format;
>   	const struct os05b10_mode *mode;
>   
> @@ -747,7 +785,7 @@ static int os05b10_init_state(struct v4l2_subdev *sd,
>   	format = v4l2_subdev_state_get_format(state, 0);
>   
>   	mode = &supported_modes_10bit[0];
> -	format->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> +	format->code = os05b10_get_format_code(os05b10);
>   
>   	/* Update image pad formate */
>   	format->width = mode->width;
> @@ -928,7 +966,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
>   	int ret;
>   
>   	ctrl_hdlr = &os05b10->handler;
> -	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
> +	v4l2_ctrl_handler_init(ctrl_hdlr, 11);
>   
>   	pixel_rate = os05b10_pixel_rate(os05b10, mode);
>   	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
> @@ -974,6 +1012,16 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
>   			  OS05B10_DIGITAL_GAIN_MIN, OS05B10_DIGITAL_GAIN_MAX,
>   			  OS05B10_DIGITAL_GAIN_STEP, OS05B10_DIGITAL_GAIN_DEFAULT);
>   
> +	os05b10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
> +					   V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	if (os05b10->hflip)
> +		os05b10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +
> +	os05b10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
> +					   V4L2_CID_VFLIP, 0, 1, 1, 0);
> +	if (os05b10->vflip)
> +		os05b10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +

As a micro optimization againt the error path, setting of these flags can be
done at the end of the function, for instance check how it's done in ov2680.c

>   	if (ctrl_hdlr->error) {
>   		ret = ctrl_hdlr->error;
>   		dev_err(os05b10->dev, "control init failed (%d)\n", ret);

-- 
Best wishes,
Vladimir
