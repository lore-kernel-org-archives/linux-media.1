Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991866;
	b=5ekRpiN0zMwHW06ZNykGGMmI6N7vN2zICLrj+CSEEZQLtTA5SSMxLTZXKmGh0K4vZ5AX
	 n1EMGt/1hFV0FxRHl+KOSltxpElB3Tlf0D6mvDZjXAFubHFu8f9+sMosKMac+7ZR5AKXz
	 eHoVcDhcwQl+3w3zxSKRr4H64Gt/lbtOyn7EWUnM87g7cwCrj5J4qR39fOc/pyPCKagDY
	 pUhRLoZLsV8+C4eRLmHzb3rUllYvB0Rr0RJkIQuf+tBMUYzk/uKUC676/Ew3E72RFMVQ3
	 dEpSJ6UrjVBnltUal0ds7syXMO/B5c7E2iA4evp34xBxxa/YNw6Hy7R+0XZGX0b5yyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6whm+AcfZcDMsCl4bnxzUqpb1ThUiBZ1VvGN/vyl6VY=;
	b=eU31ulvE4xCpYAfkOAPiCy4LuONyAbjSNZv2GW6vWB9ZuW6b1VNt72LVVW4RZgkWMnjR
	 EruZOyMx+9ZjdJfDA47DxjDnhU1f5zodo7+qnU5VMFLFsWhmByU4SDBvO+7EMz2khqkgP
	 ixBE9+wEMWRrhi5AVeYHMbU7wOAhTVG4O+uSOeauhPK2PmNh+QO0ieGQsI0T/Ndkii3At
	 o9HmOVdUEUI7EA3jCYsqvzt8UcekRHqAhvQJk9/NsnuE4j6iFQvkPFYuLjUkv32ra34le
	 sdjBAvpEdwOQ1N5woJahC05yCMcA3TDWI5Jr85sfz/XZdm7+J6oYkdlrGw71Qr8WjWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hXPM94lH;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED6B606A31C
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 08:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ED6B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hXPM94lH
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so7188145e9.3
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 00:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794991864; x=1795596664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6whm+AcfZcDMsCl4bnxzUqpb1ThUiBZ1VvGN/vyl6VY=;
        b=hXPM94lHSJsT/tsATgNcxpyxDvFPtlElD2vhwc598mJoZB3emNffE+3AHKkYVBLKlh
         N+uV2Sw5ywYGpGHNbmyPpVe1tTVvGLXjl5Sds7YrUqDyx1PtVlwXLMcYCTac9+xSxeFK
         jG4B1wQ/cHGnXo1D8i2ZzXgfel3973FoMNK10n8FbWxCwGudmcoqDm/7xKsgg3YyYp3/
         jjicAmvKrV1Bf220FPZZfugcoyHrA7Rn5/TOm9s6CF3Fyg5s3wepykwFEh4xO2COcHG4
         fmMn2yaCXW58QFRNXIOqUE1WQrzMetQadcqblDJAStY57i8q6PzeYDEDgBaz1h7MLhG9
         x5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991864; x=1795596664;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6whm+AcfZcDMsCl4bnxzUqpb1ThUiBZ1VvGN/vyl6VY=;
        b=uV1Qcfd4Y7ujxxBmDK6/g3i9dAUpyJUohRYErlW4SNg4YkLJwDXibrlnhtzyOQvcAQ
         38Cd6Bl7ve4andaEwwUwwQHYb1JstDfqR/E3slvAGkoTq37tMvTVKdcms2QJDBPPWPDL
         yuEAblOGJ/jDbED19GLFnzBCOKgc/5g7DT418rJ1bAGFz9Fu0BX6sNPoRrtuLTnDSC6N
         wVVaLJkmBSFeu3iGo/TrEkumXzO6Gl2w8LCozTyj/XA1u2TatTSEE00iYkYP0ZbKAa/c
         /88de2BILNLMW51kx1Lfu7h8hC39XYyLzPfMMP+7Q+1fwmyGwLxu7L/79MNgVEMWlME0
         /D4w==
X-Gm-Message-State: APuU4Z9qyzcdp/hZ6ji8qevF8dAzE/aqcL8/wffeMv9sAg6KP78EjkqW
	IeIECqjScaEYW4ejUaEjZDBcux4BvUt7gZWht6VYJbzcNSifNTwfQ57vUq+uuHWtT3A=
X-Gm-Gg: AYBFou1tdsVcPg1vxWjnzlsfv6zLEo1NpddXDpQHkkYFhJWB9DIiVlQ1JuMBc88eZf7
	4GhAYVaBpLKSyVOJPPNhqPlsztcFsSUTFjQL3eWdUW1xSYnAgGAZaiRYfo9pzaTv3NcJQGFLuVI
	i8bNDobgrmmCCypeOS3Z6o4WJ6M+osa7dwNDnjp813GhZRyQzS8jq6eW3pUYX/p4VWCMXosFY5L
	oY7eGoG0ZeqSqKF4R/HLm3HOxVNVfI/n8IlAh+p/ilQDaonrSx8zz6LRcvdu2OIunIEgsMrgy4W
	fnRi9P7duuMI5nMgoSUyd6V4Ecfo706oIhQhA3IgZ8bqynyp0Yv883aij/upI5RV0VkoSAnJo2q
	MVOpckyyGziQRJ+0m0E9o6WBCZhEJscVgeuuCVxTSzlgCFZ8+9kfh2JupTqUXaa6UKKOvpjmKc1
	dXAmQ2VUZW9qFHYVI448v1pmvPnMxTPlpzw/CAkheBkMS/Gkyc/RtcexRsnoq4DUTe1vWLUyjHt
	E4SUeVqA9jTXcIKc2rVQaqGCO42HsGHFdWAsB1wSokLdhULayrTXqJrixtvca78YbbR2syqsKaj
	/Yf58RxRdCe7NOf77QIEwwO9Qo+Zpal3HqM4yb4WmCmbY/QjwzhQTBsT2TOaRhHk4fS0i9qwB3R
	Ow4yI0p0=
X-Received: by 2002:a05:600c:3e07:b0:4bb:6a2d:b42d with SMTP id 5b1f17b1804b1-4bb7da46454mr34893895e9.31.1794991863721;
        Wed, 18 Nov 2026 00:51:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:4c8:6fe2:5534:d99a? ([2a01:e0a:106d:1080:4c8:6fe2:5534:d99a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7df13dc8sm26760135e9.5.2026.11.18.00.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 00:51:03 -0800 (PST)
Message-ID: <3ea996f9-cfd6-42ba-83ad-39eca5b06a2c@linaro.org>
Date: Wed, 18 Nov 2026 09:51:02 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] media: qcom: iris: venc: drop operating rate to match
 spec
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261117-topic-iris-encoder-fixes-v1-0-169ce990d12d@linaro.org>
 <20261117-topic-iris-encoder-fixes-v1-2-169ce990d12d@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261117-topic-iris-encoder-fixes-v1-2-169ce990d12d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 16:21, Neil Armstrong wrote:
> Per the V4L2 Stateful Video Encoder UAPI documentation:
>    Set the raw frame interval on the OUTPUT queue via VIDIOC_S_PARM().
>    This also sets the coded frame interval on the CAPTURE queue to the same value.
> 
> This implies setting the frame interval on the OUTPUT queue _should_ be
> supported as a single operation, and setting the frame interval on the
> CAPTURE queue can be considered as optional since the S_PARM on
> the OUTPUT queue will set the same frame interval on the CAPTURE
> queue.
> 
> The current iris implementation maps:
>   - inst->operating_rate to OUTPUT
>   - inst->frame_rate to CAPTURE
> 
> Only inst->frame_rate is set to the firmware, and inst->operating_rate
> is used in combination with inst->frame_rate to calculate
> the entire iris bandwidth in iris_check_core_mbps() plus
> returing the frame interval with G_PARM on the CAPTURE queue.
> 
> So per the Documentation, the two major V4L2 Stateful Video Encoder
> client implementation (FFMpeg & GStreamer) only calls S_PARM
> on the OUTPUT queue, leaving inst->frame_rate to DEFAULT_FPS,
> and only setting inst->operating_rate.
> 
> Since inst->operating_rate is currently useless and breaks the
> conformance, let's just remove operating_rate entirely
> and just set inst->frame_rate only with S_PARM on the OUTPUT
> queue.
> 
> The two rate variables were probably added to allow scaling
> the iris OPP to allow faster encode speed, but wasn't yet
> properly implemented and breaks the S_PARM compliance.

Sashiko reported I should add:

Fixes: 4ff586ff28e3 ("media: iris: Add support for G/S_PARM for encoder video device")

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/iris_instance.h   |  2 -
>   .../platform/qcom/iris/iris_platform_common.h      |  1 -
>   .../media/platform/qcom/iris/iris_platform_milos.h |  1 -
>   .../platform/qcom/iris/iris_platform_qcs8300.h     |  1 -
>   .../platform/qcom/iris/iris_platform_sm8550.h      |  1 -
>   .../media/platform/qcom/iris/iris_platform_vpu2.c  |  1 -
>   .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |  1 -
>   drivers/media/platform/qcom/iris/iris_utils.c      |  8 ++--
>   drivers/media/platform/qcom/iris/iris_venc.c       | 53 ++++++----------------
>   9 files changed, 18 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 771269e705d9..8eaeae5aff5f 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -59,7 +59,6 @@ struct iris_hfi_session_ops;
>    * @last_buf_ns: start time of received input buffer for current one second FPS window
>    * @frame_counter: input buffer counter for current one second FPS window
>    * @frame_rate: frame rate of current instance
> - * @operating_rate: operating rate of current instance
>    * @hfi_rc_type: rate control type
>    * @enc_raw_width: source image width for encoder instance
>    * @enc_raw_height: source image height for encoder instance
> @@ -107,7 +106,6 @@ struct iris_inst {
>   	u64				last_buf_ns;
>   	u32				frame_counter;
>   	u32				frame_rate;
> -	u32				operating_rate;
>   	u32				hfi_rc_type;
>   	u32				enc_raw_width;
>   	u32				enc_raw_height;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index cf5ae420f646..d346eb668f6a 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -123,7 +123,6 @@ struct platform_inst_caps {
>   	u32 mb_cycles_fw;
>   	u32 mb_cycles_fw_vpp;
>   	u32 max_frame_rate;
> -	u32 max_operating_rate;
>   };
>   
>   enum platform_inst_fw_cap_type {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_milos.h b/drivers/media/platform/qcom/iris/iris_platform_milos.h
> index 8a45a4aa9e86..e92dac972389 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_milos.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_milos.h
> @@ -21,7 +21,6 @@ static struct platform_inst_caps platform_inst_cap_milos = {
>   	.mb_cycles_vsp = 25,
>   	.mb_cycles_vpp = 200,
>   	.max_frame_rate = MILOS_MAXIMUM_FPS,
> -	.max_operating_rate = MILOS_MAXIMUM_FPS,
>   };
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> index 3cfecae80d1e..5cab6df0115c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> @@ -16,7 +16,6 @@ static struct platform_inst_caps platform_inst_cap_qcs8300 = {
>   	.mb_cycles_fw = 326389,
>   	.mb_cycles_fw_vpp = 44156,
>   	.max_frame_rate = MAXIMUM_FPS,
> -	.max_operating_rate = MAXIMUM_FPS,
>   };
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
> index 3c9dae995bb2..46fed17b611e 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
> @@ -24,7 +24,6 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
>   	.mb_cycles_fw = 489583,
>   	.mb_cycles_fw_vpp = 66234,
>   	.max_frame_rate = MAXIMUM_FPS,
> -	.max_operating_rate = MAXIMUM_FPS,
>   };
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index becbe3776544..e31f27fa6a15 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -58,7 +58,6 @@ static struct platform_inst_caps platform_inst_cap_vpu2 = {
>   	.mb_cycles_vsp = 25,
>   	.mb_cycles_vpp = 200,
>   	.max_frame_rate = MAXIMUM_FPS,
> -	.max_operating_rate = MAXIMUM_FPS,
>   };
>   
>   static const struct icc_info iris_icc_info_vpu2[] = {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> index 43460b82ae77..aebda855a549 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> @@ -80,7 +80,6 @@ static struct platform_inst_caps platform_inst_cap_ar50lt = {
>   	.mb_cycles_fw = 733003,
>   	.mb_cycles_fw_vpp = 225975,
>   	.max_frame_rate = 120,
> -	.max_operating_rate = 120,
>   };
>   
>   const struct iris_platform_data qcm2290_data = {
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index 1096cc4b01c3..6384b4a438b6 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -128,13 +128,11 @@ int iris_check_core_mbps(struct iris_inst *inst)
>   {
>   	struct iris_core *core = inst->core;
>   	struct iris_inst *instance;
> -	u32 total_mbps = 0, fps = 0;
> +	u32 total_mbps = 0;
>   
>   	mutex_lock(&core->lock);
> -	list_for_each_entry(instance, &core->instances, list) {
> -		fps = max(instance->frame_rate, instance->operating_rate);
> -		total_mbps += iris_get_mbpf(instance) * fps;
> -	}
> +	list_for_each_entry(instance, &core->instances, list)
> +		total_mbps += iris_get_mbpf(instance) * instance->frame_rate;
>   	mutex_unlock(&core->lock);
>   
>   	if (total_mbps > core->iris_platform_data->max_core_mbps)
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 2f2c56bf9122..0db6ed1056bf 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -66,7 +66,6 @@ int iris_venc_inst_init(struct iris_inst *inst)
>   	inst->crop.width = DEFAULT_WIDTH;
>   	inst->crop.height = DEFAULT_HEIGHT;
>   
> -	inst->operating_rate = DEFAULT_FPS;
>   	inst->frame_rate = DEFAULT_FPS;
>   
>   	inst->enc_raw_width = DEFAULT_WIDTH;
> @@ -396,24 +395,17 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
>   {
>   	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
>   	struct vb2_queue *src_q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> -	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
>   	struct v4l2_fract *timeperframe = NULL;
>   	u32 default_rate = DEFAULT_FPS;
> -	bool is_frame_rate = false;
> -	u32 fps, max_rate;
> +	u32 fps;
>   
>   	int ret = 0;
>   
> -	if (s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> -		timeperframe = &s_parm->parm.output.timeperframe;
> -		max_rate = caps->max_operating_rate;
> -		s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
> -	} else {
> -		timeperframe = &s_parm->parm.capture.timeperframe;
> -		is_frame_rate = true;
> -		max_rate = caps->max_frame_rate;
> -		s_parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
> -	}
> +	if (s_parm->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +		return -EINVAL;

Sashiko reported I should drop the V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL now
S_PARM is not supported on CAPTURE, will drop on v2

> +
> +	timeperframe = &s_parm->parm.output.timeperframe;
> +	s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
>   
>   	if (!timeperframe->denominator || !timeperframe->numerator) {
>   		if (!timeperframe->numerator)
> @@ -426,18 +418,14 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
>   	if (!fps)
>   		return -EINVAL;
>   
> -	if (fps > max_rate) {
> +	if (fps > caps->max_frame_rate) {
>   		ret = -ENOMEM;
>   		goto reset_rate;
>   	}
>   
> -	if (is_frame_rate)
> -		inst->frame_rate = fps;
> -	else
> -		inst->operating_rate = fps;
> +	inst->frame_rate = fps;
>   
> -	if ((s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE && vb2_is_streaming(src_q)) ||
> -	    (s_parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE && vb2_is_streaming(dst_q))) {
> +	if (vb2_is_streaming(src_q)) {
>   		ret = iris_check_core_mbpf(inst);
>   		if (ret)
>   			goto reset_rate;
> @@ -449,12 +437,8 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
>   	return 0;
>   
>   reset_rate:
> -	if (ret) {
> -		if (is_frame_rate)
> -			inst->frame_rate = default_rate;
> -		else
> -			inst->operating_rate = default_rate;
> -	}
> +	if (ret)
> +		inst->frame_rate = default_rate;
>   
>   	return ret;
>   }
> @@ -463,17 +447,10 @@ int iris_venc_g_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
>   {
>   	struct v4l2_fract *timeperframe = NULL;
>   
> -	if (s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> -		timeperframe = &s_parm->parm.output.timeperframe;
> -		timeperframe->numerator = 1;
> -		timeperframe->denominator = inst->operating_rate;
> -		s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
> -	} else {
> -		timeperframe = &s_parm->parm.capture.timeperframe;
> -		timeperframe->numerator = 1;
> -		timeperframe->denominator = inst->frame_rate;
> -		s_parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
> -	}
> +	timeperframe = &s_parm->parm.output.timeperframe;
> +	timeperframe->numerator = 1;
> +	timeperframe->denominator = inst->frame_rate;
> +	s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;

Sashiko reported I should also return -EINVAL on CAPTURE to match S_PARM,
I'll do that on v2.

Neil

>   
>   	return 0;
>   }
> 

