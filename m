Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC6F33E345
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 11:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784979196; cv=none; b=ZLEfJtXG/6Zpc9pByRfk3nz9cegzVwyGy2w12wl4bdSn3K54ve8wigQ9LBW8YHGVCergUuy9y7U571fBCtDQfubclv+qAjFXNEYRLHWBjvpbut0JAqiU7gsyZNe/wPTwDDDyl2V92P4gf+u6Z8n8FtMj08q7ZsZDUu+Ij/YcufU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784979196; c=relaxed/simple;
	bh=bjNsegpkQVYzEQDWLtmBk5ZxfdVigDusypTpo+aG2Ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gAxOuMWvuprriETtKF4+LgTkf+EiS0CnZzo25/Fj/AtnneKI0vCnQ5BYlGXZ9nMSyVlDSxidf7l4MBugejD9huhvP7tzRcsOjYY2CsOGHRRUm5kzO4KJk4v5aEjLhLMSnxlsRbFFGp3J00W2OegrfGx0fANuh1jB78R9WabAU90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OAtOvrjx; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OAtOvrjx"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b2af9beee4so212291e87.3
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 04:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784979193; x=1785583993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kWWe3xhReWpC2nYwU2tMGGrj5mSNsd5np1dCXgjryBY=;
        b=OAtOvrjxpR88gga+FqNoPRzyKdACVjo1q4xZTkbS5kT6ui5fvO8bwTrKb68ugEOt52
         r7lprTNHOVWVNWUeuD+e9YHDkbFYjb7lji4GsuS0h8Eb8+oBA2q7ptEAdwovorsClY4P
         205uyRpL1RXPLuaidptd1wWQ8QJn/tMDWqpgJkPp3DfR7QChmNT01bgXrvGo6ITVeFS7
         +z4Usxw4YRasuA2T3OeM4RySr90h9tt+zWLBKK982WTHDoz55vbw9ZYk4FTTrb2b29Wz
         lZzpKpxXkNEo2mfVRcVNTDvnALrHRSsL6mcJcBaY/C1AIoCHY477gtgqZLKi/BSLc/6K
         qNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784979193; x=1785583993;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWWe3xhReWpC2nYwU2tMGGrj5mSNsd5np1dCXgjryBY=;
        b=nV+DECJV8JsQgDS9oMk4jd5JSpTaPMwh5GLA4N4W8kwr91MSshiOQC2Ul34zSAOCqY
         f2ewjj+lvBzFKqHJhWGhQkrdhQQ3Vy/PPGN/8i4BNr1bn5KpzqMNtozrvaEk0wc8yPdQ
         0c5CtOlgzJnIBJllz1IVAVJtbLQTidcSlZW1VNLslZlqgAoQFQiBd4CBQ640AnW9KpzU
         u7WuSrgXPGijb8/bBMc1dILUpFU1PYDtfspD8BYoWajhVCt+gppEmetZk9cwPXbYddHs
         k93TO2RFQOwFz9NLH/u+L9I+MSD+2KbPHQ1ElpSo1rb5L9iBROGSV8ucZjZZLX/2sxaE
         mCmA==
X-Forwarded-Encrypted: i=1; AHgh+RqmpxiJWhJoamAfLey8Wn7JNTyUuZq0qH2TVEMwFfTXNHjg/3rBqLuv2nDwwaI37ulPPRE0YkgIodXxqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyWAZ3Qx+bRr+/H31RX4m6EnV8klLwWMVsyXj2X/vN14w9VuD7
	fT0bq3BVRi1gfCh/D40APulnJiYRApsEbLg9y6h+WgxAMGlenFMpgkL7K/jH3LMpavbGD6L2WrU
	9NV1xkYg=
X-Gm-Gg: AR+sD11PTkkN4Ut6YTC6/9l9k2EdJhhBk7hsLZ3D8339hYsoZUZqeGpa1BcAPNg5Jnc
	LPi3z6b4hBgHwxzAFWIqduJ0qjwKorV/6lGLjGL38hM6Lu++fyi6dxkLd6URc7KKgLh7BNbUDrj
	Tc43WAl41OJvwy7xD0Qq45S7EXygFyP4KtaXBrzLbLz/F/XBJCnnZm7csKZEN8ykP9SCdxvg0pZ
	wtybrK5cqWgAhai/NSlCo3bJmXOYT2R+quV313YHfrSAPBFTW63SHvxZRO44BUORszhTSFx1kLI
	Un7RZlHM3PuPt1fvA4scWIkxGQAlsAjFYLS48ydAELQMq0Q5JGpRoD/3aTZDHBFD+ec0P70ztD6
	E9jWMmZ0IvMcIkZ77KPQiDu57R2XlkykM6zXUHLEnuemfVydt83su2NlUXJo4LVVsTbT8SysVSi
	b4uLrYvJwIZIhHE/p4kh7zWlm3DFknbrsSToM0UyjYr2FXKhjcIb/uBM7a
X-Received: by 2002:ac2:51d0:0:b0:5b1:5b49:9463 with SMTP id 2adb3069b0e04-5b2c1b3d56fmr323900e87.4.1784979192811;
        Sat, 25 Jul 2026 04:33:12 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be0881d3sm410737e87.28.2026.07.25.04.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2026 04:33:12 -0700 (PDT)
Message-ID: <141c9f00-6fe9-4003-af7e-182cebcce22e@linaro.org>
Date: Sat, 25 Jul 2026 14:33:11 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/17] media: i2c: os05b10: remove unused control
 fields, simplify error handling
To: Tarang Raval <tarang.raval@siliconsignals.io>,
 sakari.ailus@linux.intel.com, mehdi.djait@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-18-tarang.raval@siliconsignals.io>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260718200912.16001-18-tarang.raval@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/26 23:09, Tarang Raval wrote:
> link_freq and gain don't need to be stored in struct os05b10; make
> them local.
> 
> Parse the fwnode properties up front and register them before the
> single ctrl_hdlr->error check, so all controls are covered by one
> check and the per-control NULL guards before setting flags can be
> dropped.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>   drivers/media/i2c/os05b10.c | 55 +++++++++++++++++--------------------
>   1 file changed, 25 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index b4dd3137ad5c..c355ac197eb2 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -557,11 +557,9 @@ struct os05b10 {
>   
>   	/* V4L2 Controls */
>   	struct v4l2_ctrl_handler handler;
> -	struct v4l2_ctrl *link_freq;
>   	struct v4l2_ctrl *pixel_rate;
>   	struct v4l2_ctrl *hblank;
>   	struct v4l2_ctrl *vblank;
> -	struct v4l2_ctrl *gain;
>   	struct v4l2_ctrl *exposure;
>   	struct v4l2_ctrl *vflip;
>   	struct v4l2_ctrl *hflip;
> @@ -1276,9 +1274,14 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
>   	struct v4l2_fwnode_device_properties props;
>   	struct v4l2_ctrl_handler *ctrl_hdlr;
>   	u64 vblank_def, exp_max, pixel_rate;
> +	struct v4l2_ctrl *link_freq;
>   	s64 hblank_def;
>   	int ret;
>   
> +	ret = v4l2_fwnode_device_parse(os05b10->dev, &props);
> +	if (ret)
> +		return ret;
> +
>   	ctrl_hdlr = &os05b10->handler;
>   	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
>   
> @@ -1287,22 +1290,18 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
>   						V4L2_CID_PIXEL_RATE, pixel_rate,
>   						pixel_rate, 1, pixel_rate);
>   
> -	os05b10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
> -						    V4L2_CID_LINK_FREQ,
> -						    ARRAY_SIZE(link_frequencies_4lane) - 1,
> -						    os05b10->link_freq_index,
> -						    (os05b10->data_lanes == 2) ?
> -						    link_frequencies_2lane :
> -						    link_frequencies_4lane);
> -	if (os05b10->link_freq)
> -		os05b10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
> +					   V4L2_CID_LINK_FREQ,
> +					   ARRAY_SIZE(link_frequencies_4lane) - 1,
> +					   os05b10->link_freq_index,
> +					   (os05b10->data_lanes == 2) ?
> +					   link_frequencies_2lane :
> +					   link_frequencies_4lane);
>   
>   	hblank_def = (s64)mode->hts -(s64)mode->width;
>   	os05b10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
>   					    hblank_def, hblank_def,
>   					    1, hblank_def);
> -	if (os05b10->hblank)
> -		os05b10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>   
>   	vblank_def = mode->vts - mode->height;
>   	os05b10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
> @@ -1317,12 +1316,10 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
>   					      exp_max, OS05B10_EXPOSURE_STEP,
>   					      mode->exp);
>   
> -	os05b10->gain = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
> -					  V4L2_CID_ANALOGUE_GAIN,
> -					  OS05B10_ANALOG_GAIN_MIN,
> -					  OS05B10_ANALOG_GAIN_MAX,
> -					  OS05B10_ANALOG_GAIN_STEP,
> -					  OS05B10_ANALOG_GAIN_DEFAULT);
> +	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
> +			  V4L2_CID_ANALOGUE_GAIN, OS05B10_ANALOG_GAIN_MIN,
> +			  OS05B10_ANALOG_GAIN_MAX, OS05B10_ANALOG_GAIN_STEP,
> +			  OS05B10_ANALOG_GAIN_DEFAULT);
>   
>   	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
>   			  OS05B10_DIGITAL_GAIN_MIN, OS05B10_DIGITAL_GAIN_MAX,
> @@ -1330,33 +1327,31 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
>   
>   	os05b10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
>   					   V4L2_CID_HFLIP, 0, 1, 1, 0);
> -	if (os05b10->hflip)
> -		os05b10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>   
>   	os05b10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
>   					   V4L2_CID_VFLIP, 0, 1, 1, 0);
> -	if (os05b10->vflip)
> -		os05b10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>   
>   	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &os05b10_ctrl_ops,
>   				     V4L2_CID_TEST_PATTERN,
>   				     ARRAY_SIZE(os05b10_test_pattern_menu) - 1,
>   				     0, 0, os05b10_test_pattern_menu);
>   
> +	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
> +					      &props);
> +	if (ret)
> +		goto error;
> +
>   	if (ctrl_hdlr->error) {
>   		ret = ctrl_hdlr->error;
>   		dev_err(os05b10->dev, "control init failed (%d)\n", ret);
>   		goto error;
>   	}
>   
> -	ret = v4l2_fwnode_device_parse(os05b10->dev, &props);
> -	if (ret)
> -		goto error;
>   
> -	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
> -					      &props);
> -	if (ret)
> -		goto error;
> +	link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	os05b10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	os05b10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +	os05b10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>   
>   	os05b10->sd.ctrl_handler = ctrl_hdlr;
>   

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>


I would suggest to reorganize and reorder changes in the changeset, moving
simple changes like this one to the very top. Also it might be possible to
merge a number of trivial changes earlier, this will save time and efforts.

-- 
Best wishes,
Vladimir
