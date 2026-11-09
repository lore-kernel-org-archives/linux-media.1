Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229075;
	b=FZ77HIW76FEfy0c2Yny8DVfwPvuetCmeVY5XYFs5FchJEPKdD8xqIljbeHLryXh4xph+
	 3arHwbeuCYRHd5QFQLSW+s9xm2MhawsSC5ZNx6UVDpybW6z2moKesuGdPffRE2U9gsz0K
	 2TJEWAP1WOtEuzx3i7OtBQoNYUTMQl96hVr1tpxIPvQQw1/ftbJ8QPToiYG7kEPdIYOOq
	 VYPp7vVyX+tKxe+5AT9TMRMYAMW86p+XlWKEOyz0vGuv4Zu71mKoPJEzv2x1u2bovgHta
	 iArBSBMEm2rXxcMGvBffja0GRo/RWWrI8IGY71M17B6jamWNzIYpveTRfLGn1wnUowg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wyy6bj7a11JEqmvDJpj3bQb2yikehoJWRBg5g2tkGFM=;
	b=aj1fnfUKUhQedev1Uk4xmXUG8NnD+p1vhaq6OMCjkJSlgtzKiDmikl3oasCghxqd9k4f
	 SfBIcP8/TYaCqaEmrVqvhulqli2szM5msrz9qqRKnj2uGyEsT0K1GLKnCCtjj+1NLfHDy
	 x29ayW8qyOAl72ntqCtvoRRSCrxHtK5x10QBs5Rv9mHZ0Z7VYF+sbCsk7h5Bznsb4Eqra
	 Q2rAIW7e2BPVRsXxbf6iB30ZpDtEv7dGIVT2OaKdCTm8CFwx0RSnFICWznmWcY9Y1ICGA
	 aDsWghB/htu/Q8TCji9MjhA2oc0+t9fQwmCBmHDQYhH1aMxbCUNbh+thYy8e8uPhIXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CLgHMq6l;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7BD606A31C
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 12:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB7BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CLgHMq6l
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so6891935e9.0
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 04:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794229073; x=1794833873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wyy6bj7a11JEqmvDJpj3bQb2yikehoJWRBg5g2tkGFM=;
        b=CLgHMq6lC/oa24etmU5uFOjanSEBhpMx2wF82F4+zWSCY/XU0I9/ziXs+kkm4nYTW/
         /WLu4CD9tygvMMVCsBLZPNYtYB5OIkSIjZzh4Qa50BKbzSu2WxGOrCvGVlhXLQHbmLXn
         x2SiOE4cZ7upzDNteFyZG94MpGO+Vi9zojFzo1RSwL1yVJgexWHA/8HYxG/NhNgqxbRw
         MpkeJbN7s07O3l/IRtucYkIS3xDEQj5vF1rYC23HuZeFmz80NdQQdxuNnVUSKMiKYROy
         8olnNnKw/+SlbL1BLc1aUYI5wRWkyHLNMjTRgVW7qKAXmSAt4Ea1qR4PUfmQu0dlz82D
         QzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229073; x=1794833873;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wyy6bj7a11JEqmvDJpj3bQb2yikehoJWRBg5g2tkGFM=;
        b=IrGRfMqP2ofRGCpibr2hgD2e1EyMrBycG/Y76RGe9QuTlcYqpPebpBKoMIcfVODe7m
         iKa/KM9R9jp0p8OdJFyqcGc+Q+hLwpiNEBZa3mi0uRriDw9IRZHXqgDMEY/OKeKkVlke
         Ytc9I03tUfJGs8YhOuLeA89DuR7kgA7/OTpZjJXmdNQuhWoDasaudMK4T/lHYVgqPZa4
         WdzkrDmQEEhHu7j4LukTcaQEdYauxsxWyhf+ZwO/PqBn5wb4CTSXqxQOtW4nnKgzsDdA
         jjbs2fnG1a6pJsw4yuTcm92xFFwjDYoRD7/86vwS8VjsZhG9yZQkweOLELYLgZhKHK5U
         3p5Q==
X-Forwarded-Encrypted: i=1; AL+hErGNyNy7GTtK5rJf8eTm49+SJ6NVvy6sK5k/ZXSijmMYJdB/3bmhAaPj/itEowI23mftuKWXBmCjEo45Ag==@vger.kernel.org
X-Gm-Message-State: APuU4Z9BAMFKVVyGGbZDTaMJWlbXO6z3+MS7ZYkXw7LmNcSaomS0O9Bd
	ZUWXqpKOa5ZCTxQy2M7bNw7g0+BgcJkwhA2YUuYq0o9/eMu6MlihrDresB5yWXhOINw=
X-Gm-Gg: AYBFou32EfFCrZIVLvoVDZ4PtCA2Bfx0rnEFvN/u3lYXzOnj5msVXOY2HeuSXd3W9+x
	G9LCgPWyb1CfuOYt47aZgF403PJ4yXXI0Reo8OadUnAarjsaSWpEotDQGbC3kExJDtgrswe0jKu
	b7Y7facfh0S6UaWlDT1hRC2MhLdbKar6p9fXmmV44Mk3xmqMTwgLzY5Mr5QvKCJyqRE5mxTsHoD
	7Tv4i9Jnfo/PK2Cr92TrDsaSa997jqmdps281izDwxiYqlgKvlb+kRFKactW+NE9hfgcR7vZm9H
	Trj0BWv+lSiTGb5m3La/RsAGbOsSwQl42PUkd/1plwge+6INBtJj6Uh0NMSCeeVnwVkJ2DT24Jm
	JMcd4/DXrqTp6k6a7BCBtuYhTc8vLvofo0qlAyiCaifRlQUNCBqysMfvP5IGwWe8UzZh5LTZEe6
	Yux1WXRM5yTJOSQJ4cr5Oky2SY9GeeZNer49hvOclfp21z2vgGdgBej8zJv0BloFl/JQqhWNcSm
	LwUU3W9ccQgQjwuwi98ALUKUGm1elWVVPfABIxllCGWla2xhH5Ripso82ie1qKoDeLOkXr5G1SR
	BAjypsmOM4qkyam1vjqS189ZZsd60qV48WdNGQ==
X-Received: by 2002:a05:600c:1d0a:b0:4a2:191f:7cb8 with SMTP id 5b1f17b1804b1-4b963c6c86amr71185815e9.17.1794229072922;
        Mon, 09 Nov 2026 04:57:52 -0800 (PST)
Received: from [192.168.0.167] ([109.76.74.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e6eca30asm237745875e9.7.2026.11.09.04.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 04:57:52 -0800 (PST)
Message-ID: <7f8e0938-2b35-43df-afe7-18b0ad917698@linaro.org>
Date: Mon, 9 Nov 2026 12:57:51 +0000
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
Subject: Re: [PATCH v2 2/4] media: qcom: camss: vfe-4-1: program the RDI write
 master buffer size
To: Allan Siriani <allan@fatecpompeia.edu.br>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
 <20261109112611.94010-3-allan@fatecpompeia.edu.br>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261109112611.94010-3-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2026 11:26, Allan Siriani wrote:
>   .../media/platform/qcom/camss/camss-vfe-4-1.c | 34 ++++++++++++++++---
>   .../media/platform/qcom/camss/camss-vfe-4-7.c |  3 +-
>   .../media/platform/qcom/camss/camss-vfe-4-8.c |  3 +-
>   .../platform/qcom/camss/camss-vfe-gen1.c      |  5 +--
>   .../platform/qcom/camss/camss-vfe-gen1.h      |  3 +-
>   5 files changed, 39 insertions(+), 9 deletions(-)
Requires a Fixes: tag

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> index 9cf1ccdb2..53ebc12c4 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> @@ -107,6 +107,7 @@
>   #define VFE_0_BUS_IMAGE_MASTER_n_WR_UB_CFG_OFFSET_SHIFT	16
>   #define VFE_0_BUS_IMAGE_MASTER_n_WR_IMAGE_SIZE(n)	(0x080 + 0x24 * (n))
>   #define VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG(n)	(0x084 + 0x24 * (n))
> +#define VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG_BURST_LEN	0x3
>   #define VFE_0_BUS_IMAGE_MASTER_n_WR_FRAMEDROP_PATTERN(n)	\
>   							(0x088 + 0x24 * (n))
>   #define VFE_0_BUS_IMAGE_MASTER_n_WR_IRQ_SUBSAMPLE_PATTERN(n)	\
> @@ -269,14 +270,39 @@ static void vfe_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
>   			    1 << VFE_0_BUS_IMAGE_MASTER_n_WR_CFG_WR_PATH_SHIFT);
>   }
>   
> -static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm, u8 enable)
> +/*
> + * In frame based mode (RDI) the write master stores the incoming data as is,
> + * with no line structure. Program its buffer size in WR_BUFFER_CFG (words per
> + * line, lines, burst length) as the downstream msm_vfe40_axi_cfg_wm_reg()
> + * does, and clear WR_IMAGE_SIZE, which may hold a stale line based setup,
> + * so that the write master is bounded by the size of the V4L2 buffer.
> + */
> +static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm,
> +			       struct v4l2_pix_format_mplane *pix, u8 enable)
>   {
> -	if (enable)
> +	u32 reg;
> +
> +	if (enable) {
> +		/*
> +		 * bytesperline is aligned to 8 bytes (one bus word) on the RDI
> +		 * outputs, and sizeimage >= bytesperline * height.
> +		 */

and sizeimage >= bytesperline * height ?

Which sizeimage => pix_mp->plane_fmt[i].sizeimage ?

This feels like a slop-comment which is no bueno - please read this 
stuff before posting and make sure it actually makes sense...

> +		reg = VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG_BURST_LEN;
> +		reg |= (min(pix->height, 4096U) - 1) << 4;

I don't agree with this clamp lets just have a consistent logic albeit 
flawed with vfe_wm_line_based()

=>

(pix->height - 1) << 4

Silently truncating here is incorrect. If we need additional validation 
it should happen in try_fmt(). For this patch just stuff into the 
bit-fields the value given.

---
bod

