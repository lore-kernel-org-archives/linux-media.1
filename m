Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9071F0991
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 07:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784964607; cv=none; b=NPWJmLYID5iBszvcxk3N0PeVRZnViDUKscMuM4zu0UIV5T/GE0n9kDNI7WOwUVeeLpLzHBq8n3Gc6w9riJAQK7aM4TbImWISQ1MQ2CTJxYzhS8SxptY5DQdrSb1lDzDart95tJR2LYf7GGNLArXYIjGxK0TqtLmlysM9EafeJAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784964607; c=relaxed/simple;
	bh=QJ0pw6kT+7ttJEjN5QtiAww89rTFm26gWIo1rCvMZDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0Gs08u+TxrlwptPqDC+uqE9+jFXaDohAi052TImsNzjj8zRXOZaCJGdM7hjyo71DNr1lhj5cZxlvr5zjkbyCrb+s9tzkhurYF+/YQQzqaNPJdrpB3MCZgtz5TSqawn2bqXBtRA4KomjxADsT6klkvJVeQ4ob12sPLlUbDU2ih0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wt9TTikE; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wt9TTikE"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b2a73d5fc3so88132e87.1
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 00:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784964604; x=1785569404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XduFr5bfGfiijp0kkCnpSMKS9c+QPdxDM+BNYvNsJf4=;
        b=wt9TTikE/BucEJ7aMHK7FM0w96ixomWfHCDjYS5jdHvAcGHdwYRicTCJrRZwcnmU4t
         AICOTOuYosMBhWqNJzFDvf5a+/66H7n18YOVdMWcWbvhBUyotewcFYFUqJ4irB4to1pR
         7vjVdIf0T8e3gcGOFGGScL+WGiB3cyJRQ9OkUxVlpsozchckGrfPNH/y98teWRWZbyzl
         CdZe5vLze0ma+cj8nv9wtva6A5ZRpKRL8nI1AlNkpUYMPPojOAhbQlGfKJDslLLSrDKr
         1OSltQ7mQ4aJTO0oxzZXQWkMQSYMn3MDpdNH6ymjdxnxi7DZGRpGKRCdAVirL88ZYa6w
         ZxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784964604; x=1785569404;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XduFr5bfGfiijp0kkCnpSMKS9c+QPdxDM+BNYvNsJf4=;
        b=dT4ONXgoCcLCzYw5+c07NdtrxgZbQxCjSxv2DEuEmH7fTTT3sFanZ3jNdD0GVngHcF
         KgbhvGJdbzAhkAMFiLF2azw11+dY1FrQa1SZYAYYeBZq0xNM7RIfMWLd5kPxdAtjUHE2
         Duwyv0UsZz/XHy1TR2fkx29YSKI05KmKWtcVDYnyNfsErGKHPkpuMngkTtGstgcRYe7O
         Z+JFNI9qIRHvQ8zNJSQJQClDr90m7LqdPxzsES0xZsI1YuxViyAra9ZDGhr/Dk7femGa
         BakpvNsdbvv2BgBJwgSrcKL9+4WC6TljBv2VjW6pHJ8jEQ7pe0qW5r+dZJmELsEicLPJ
         qEbQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbuYHNxq/G0soY+AJ8tmkdVXqJeEZJciZyAoJUhZ3ViOa5GSxHtQTYU8ZGX9GftQ2PaLP7/vhCSd7J9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjajeNzdry8q9pvZfFyrqGfRVWIb/A/yZiTNmMwWc8UtNEFpnT
	mnLLSmLMAibbKLnOwIazuCmufMKReFeNw5RrWwLhiRCEzXebEueCLgQ7F6kq7EEcdWE=
X-Gm-Gg: AR+sD122JD318d+p9lwhcElwyKimXtvDZT/1P6NCQoI/bTE/Or7gUMHNduUyvLR6zKc
	niTU3HE1PAgaSziqbU+IRGSnATTbYlnXTPkaO0c77kLiBtV8Qp3yHUuaW47nbI06FlGLsYWwhRA
	wDlyf+efdz9rbQ08Csk+0FTTBS8ltwjkKVgXfg9pD50Mo7dEJjGHDQZT76KtVDCynldum9MwFiO
	68HCewombi291ZeRJ9CpSa/0qvPOAlpjbfnhk07Q7cqt/qnJiLIWoBTY22DGdsMPUcLLU3wHD9D
	I6O/eVTsbWARA///rayxM5Emrc3WWyCh8rJRGCGDJnETmMKcS/jGTcgGkYBfKHEJ8n/weW6bAK6
	nYI/XOAlXaiQ3ldAesIviOlAUpgWl/8C1NE/Oa8lu2F/DJ5wtadaS9z8qP9Mwoa5OVnRdC1+NL/
	4xS95lZ26NqtClznNYAs9kd8fDjBMKm5GTJ8vFE/qZzjkSaYe8cMz1zvrb
X-Received: by 2002:a05:6512:3b1f:b0:5b1:4fde:61a with SMTP id 2adb3069b0e04-5b2c1b027b8mr134327e87.2.1784964603913;
        Sat, 25 Jul 2026 00:30:03 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1d88b2sm307970e87.46.2026.07.25.00.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2026 00:30:03 -0700 (PDT)
Message-ID: <b97ae9a9-6473-4004-8368-fd5ebef63897@linaro.org>
Date: Sat, 25 Jul 2026 10:30:02 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/17] media: i2c: os05b10: keep vblank and exposure
 range in sync on mode switch
To: Tarang Raval <tarang.raval@siliconsignals.io>,
 sakari.ailus@linux.intel.com, mehdi.djait@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-12-tarang.raval@siliconsignals.io>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260718200912.16001-12-tarang.raval@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/26 23:09, Tarang Raval wrote:
> Update vblank through the control path on mode changes so exposure
> limits and default values are recalculated consistently from the
> active mode.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>   drivers/media/i2c/os05b10.c | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index c54b466656aa..d124db74766c 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -745,13 +745,23 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
>   {
>   	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
>   						     struct os05b10, handler);
> +	const struct os05b10_mode *mode_list;
>   	struct v4l2_subdev_state *state;
> +	const struct os05b10_mode *mode;
>   	struct v4l2_mbus_framefmt *fmt;
> +	unsigned int num_modes;
>   	int vmax, ret;
>   
>   	state = v4l2_subdev_get_locked_active_state(&os05b10->sd);
>   	fmt = v4l2_subdev_state_get_format(state, 0);
>   
> +	ret = get_mode_table(os05b10, fmt->code, &mode_list, &num_modes);
> +	if (ret)
> +		return ret;
> +
> +	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
> +				      fmt->width, fmt->height);
> +
>   	if (ctrl->id == V4L2_CID_VBLANK) {
>   		/* Honour the VBLANK limits when setting exposure. */
>   		s64 max = fmt->height + ctrl->val - OS05B10_EXPOSURE_MARGIN;
> @@ -759,7 +769,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
>   		ret = __v4l2_ctrl_modify_range(os05b10->exposure,
>   					       os05b10->exposure->minimum, max,
>   					       os05b10->exposure->step,
> -					       os05b10->exposure->default_value);
> +					       mode->exp);
>   		if (ret)
>   			return ret;
>   	}
> @@ -842,7 +852,7 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
>   				      const struct os05b10_mode *mode)
>   {
>   	u64 pixel_rate = os05b10_pixel_rate(os05b10, mode);
> -	u32 hblank, vblank, vblank_max, max_exp;
> +	u32 hblank, vblank, vblank_max;
>   	int ret;
>   
>   	ret = __v4l2_ctrl_modify_range(os05b10->pixel_rate, pixel_rate,
> @@ -867,10 +877,7 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
>   	if (ret)
>   		return ret;
>   
> -	max_exp = mode->vts - OS05B10_EXPOSURE_MARGIN;
> -	return __v4l2_ctrl_modify_range(os05b10->exposure,
> -					OS05B10_EXPOSURE_MIN, max_exp,
> -					OS05B10_EXPOSURE_STEP, mode->exp);
> +	return __v4l2_ctrl_s_ctrl(os05b10->vblank, vblank);
>   }
>   
>   static int os05b10_set_pad_format(struct v4l2_subdev *sd,

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
