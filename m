Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892EC402B93
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784898933; cv=none; b=YNlvFHecVrvH+rmJmXrdvk/bWYAhqJbElL/QO2RHUnNMG7pD6rUkHqOzS8bezXn1Uf7JwzcDOYgKiy3YUiEjEsoAdLypLamd3BxHMRO02D72jgHxyKtvRWB4jfLJm3iaazyZkUYenUOrp7i/cM0A7IqgjiH3v5YPMitXjbcVrA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784898933; c=relaxed/simple;
	bh=mytmLjw00SKza60sJL16TQSBEWqZ6rjTnD1St8aeA/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PC3cjK2PMM+ZyTONErCCcempb3CagwPUdtz+ZfsOjj+XjCLxGfSpd1xXxdsCO4Mew4RDcjDI9EFuLJgKTZvwjDvL1aq7+Aa8h4FNurZ4O/E0x9mXtmkw/JPviZxTGU0yv5M2hjNLqcNi9+qy7zpp5VJJWRmm+kJb1vD0BiIqxqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FSyn1G21; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FSyn1G21"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b0190a62beso64907e87.0
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 06:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784898929; x=1785503729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kA59vUE7m4ECPboC5exULRzAZyferaA5ztYUd5SayZg=;
        b=FSyn1G21Ijczzqi8Gzdp1IyXXFNRcDfgjRLtpg/fEUBRFqm1glpG2gdo0rXVfJcIcj
         AIkjL2Er5ZXS7dlk3GWrKeaxbG9QoZxyZDKBPFJM4ngvlbmrldHR2QV86m+HTsJBiF2H
         6Y1KQdTIIcw/DAfwSpwqEFok0ttuCU69m1kkVwOBCsnqnd1QtLpnANC0JaNquJn2Pt+6
         4LdKxf+zSoVBHs+kOFkmP4V6acyDMpfVvzs45V4FgQ8O8GKbgos7R7o6kDV/7w5oh7H2
         uJzIY13oGqSq6h7cdYbTd8UBF8twMO/Egfoy0AZPsY7sXkOppu3aIJ1FoMR9FzM0ttzH
         4rbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784898929; x=1785503729;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kA59vUE7m4ECPboC5exULRzAZyferaA5ztYUd5SayZg=;
        b=qo2dcaB2U/8pe9KLB0LWek9iRib5ZuWa5H9xxAZoih0vtIAGY+BPwPOOeBi/B9DotT
         BK5y47BxV8McTg2g8I70xBkBF84V53/kqzUKNMmixtiZ1td/KfLJ2vg+5h5X+zViC5gp
         RnPzbxeEqPCmUUGl/HFmEFNhvNZtrGDDFhSZP/ilIVV7Y6SDKrcKFvBZlJPj6jj5hVSM
         mcX6SGZUGdS9MdtKF75huFZLbp6UJQRSEqVj1qauaLyV4Ae6atdkxopivAGJrOqRZm0y
         IsgG5JFT69QDX+DGrKVRU1LHX8bFjr+Ij45zA5MKXb0cRJxwvYn1Q3XYbwyxS5Eal1BH
         Z73w==
X-Forwarded-Encrypted: i=1; AHgh+RpaSqDPYkMuqpw/2f7YpfDmandZVDwrb29K/7ylMlfwgd1EUSNcrEAEAJRqw0cDXg6LoDf1XT6mQ4NSyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhHanniFlO0U2IAtYwMm95piBpgakhjcVDGzWIL2qvnrVyzYdh
	zlAw2wPYtmnN/KXM5jTny2EDjOdDJNvS1N9skPxkFSHTWtEPTdidFd11PdEhnDNQtYBSVWxRwE3
	HrueNP2Q=
X-Gm-Gg: AR+sD13Bgn78ziLecrgH+nhSe7QPmUnrNWIXVYeO+ji7l8K9vN1jRtFpuQo0XYMyjmh
	vdg5PzIrD9UgdYNLTrClofrjdUTHxzjQFQt0fv1EbzgJ8lBPrYY1Aey0drCqAaEhrcVozWwac8D
	RiKMXc2Sht+uR9fK9QrKhgFizZNP+ItxYDl65JxpNStE3QLmLOF8/B4b/qUKrcBrp/hRFpJYK87
	738aVZhMsG5vcCOaS2U5rFJT9+WlYd6C7Jj9f81zPa7w7GOFDzQHnWu/ORB/3MBmX9Jo8G2JiMR
	DzgKlsaTx+B6E75MErp9MOQ40xljqi/agtgAenndkcicfEXY47kkS/Dlzwo8yjI3vO+DnksJu1e
	ATAjwjzGiw2Myz9bM0z3IDdqr+Muq4XMQ0jMN+GQC5WD7A1g9QFT9RNdEPGXXhM3IKhsBL0utxS
	h2U+Cpz4Tf+QElIRmjPnzS0GuyTQfkQ+TjP8w2JeXfrGgGHe5L4n6s0rn8lmt/w8gArlc=
X-Received: by 2002:a05:6512:3e01:b0:5b1:5e89:30f6 with SMTP id 2adb3069b0e04-5b2b2f6efb3mr856162e87.3.1784898929451;
        Fri, 24 Jul 2026 06:15:29 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e4611dsm1545595e87.67.2026.07.24.06.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 06:15:26 -0700 (PDT)
Message-ID: <52c6ea74-5938-465d-ad22-4192eef658a1@linaro.org>
Date: Fri, 24 Jul 2026 16:15:25 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/17] media: i2c: os05b10: split common and
 mode-specific init registers
To: Tarang Raval <tarang.raval@siliconsignals.io>,
 sakari.ailus@linux.intel.com, mehdi.djait@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-5-tarang.raval@siliconsignals.io>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260718200912.16001-5-tarang.raval@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/26 23:08, Tarang Raval wrote:
> Separate common initialization registers from mode-specific settings.
> Move resolution-dependent registers into a per-mode register list and
> program them during stream enable.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>   drivers/media/i2c/os05b10.c | 96 ++++++++++++++++++++++++-------------
>   1 file changed, 63 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index 96395cd7a2ca..12c4e2610d6f 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -142,16 +142,13 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>   	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
>   	{ CCI_REG8(0x3600), 0x4d },
>   	{ CCI_REG8(0x3601), 0x08 },
> -	{ CCI_REG8(0x3610), 0x87 },
>   	{ CCI_REG8(0x3611), 0x24 },
>   	{ CCI_REG8(0x3614), 0x4c },
> -	{ CCI_REG8(0x3620), 0x0c },
>   	{ CCI_REG8(0x3632), 0x80 },
>   	{ CCI_REG8(0x3633), 0x00 },
>   	{ CCI_REG8(0x3636), 0xcc },
>   	{ CCI_REG8(0x3637), 0x27 },
>   	{ CCI_REG8(0x3660), 0x00 },
> -	{ CCI_REG8(0x3662), 0x10 },
>   	{ CCI_REG8(0x3665), 0x00 },
>   	{ CCI_REG8(0x3666), 0x00 },
>   	{ CCI_REG8(0x366a), 0x14 },
> @@ -235,7 +232,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>   	{ CCI_REG8(0x370f), 0x1c },
>   	{ CCI_REG8(0x3710), 0x00 },
>   	{ CCI_REG8(0x3713), 0x00 },
> -	{ CCI_REG8(0x3714), 0x24 },
>   	{ CCI_REG8(0x3716), 0x24 },
>   	{ CCI_REG8(0x371a), 0x1e },
>   	{ CCI_REG8(0x3724), 0x09 },
> @@ -244,7 +240,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>   	{ CCI_REG8(0x3730), 0xe1 },
>   	{ CCI_REG8(0x3735), 0x80 },
>   	{ CCI_REG8(0x3739), 0x10 },
> -	{ CCI_REG8(0x373f), 0xb0 },
>   	{ CCI_REG8(0x3740), 0x28 },
>   	{ CCI_REG8(0x3741), 0x21 },
>   	{ CCI_REG8(0x3742), 0x21 },
> @@ -290,8 +285,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>   	{ CCI_REG8(0x37ac), 0xa0 },
>   	{ CCI_REG8(0x37be), 0x0a },
>   	{ CCI_REG8(0x37bb), 0x02 },
> -	{ CCI_REG8(0x37bf), 0x05 },
> -	{ CCI_REG8(0x37c2), 0x04 },
>   	{ CCI_REG8(0x37c4), 0x11 },
>   	{ CCI_REG8(0x37c5), 0x80 },
>   	{ CCI_REG8(0x37c6), 0x14 },
> @@ -300,7 +293,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>   	{ CCI_REG8(0x37cd), 0x17 },
>   	{ CCI_REG8(0x37ce), 0x01 },
>   	{ CCI_REG8(0x37d8), 0x02 },
> -	{ CCI_REG8(0x37d9), 0x08 },
>   	{ CCI_REG8(0x37dc), 0x01 },
>   	{ CCI_REG8(0x37e0), 0x0c },
>   	{ CCI_REG8(0x37e1), 0x20 },
> @@ -313,25 +305,10 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>   	{ CCI_REG8(0x37f5), 0x00 },
>   	{ CCI_REG8(0x37f6), 0x00 },
>   	{ CCI_REG8(0x37f7), 0x00 },
> -	{ OS05B10_REG_X_ADDR_START, 0x0130 },
> -	{ OS05B10_REG_Y_ADDR_START, 0x0000 },
> -	{ OS05B10_REG_X_ADDR_END, 0x0b5f },
> -	{ OS05B10_REG_Y_ADDR_END, 0x07a7 },
> -	{ OS05B10_REG_X_OUTPUT_SIZE, 0x0a20 },
> -	{ OS05B10_REG_Y_OUTPUT_SIZE, 0x0798 },
> -	{ OS05B10_REG_HTS, 0x06d0 },
> -	{ OS05B10_REG_ISP_X_WIN, 0x0008 },
> -	{ OS05B10_REG_ISP_Y_WIN, 0x0008 },
> -	{ OS05B10_REG_X_INC_ODD, 0x01 },
> -	{ OS05B10_REG_X_INC_EVEN, 0x01 },
> -	{ OS05B10_REG_Y_INC_ODD, 0x01 },
> -	{ OS05B10_REG_Y_INC_EVEN, 0x01 },
>   	{ CCI_REG8(0x3818), 0x00 },
>   	{ CCI_REG8(0x3819), 0x00 },
>   	{ CCI_REG8(0x381a), 0x00 },
>   	{ CCI_REG8(0x381b), 0x01 },
> -	{ OS05B10_REG_FORMAT1, 0x88 },
> -	{ OS05B10_REG_FORMAT2, 0x00 },
>   	{ CCI_REG8(0x3822), 0x12 },
>   	{ CCI_REG8(0x3823), 0x08 },
>   	{ CCI_REG8(0x3824), 0x00 },
> @@ -341,7 +318,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>   	{ CCI_REG8(0x3829), 0x03 },
>   	{ CCI_REG8(0x382a), 0x00 },
>   	{ CCI_REG8(0x382b), 0x00 },
> -	{ CCI_REG8(0x3832), 0x08 },
>   	{ CCI_REG8(0x3838), 0x00 },
>   	{ CCI_REG8(0x3839), 0x00 },
>   	{ CCI_REG8(0x383a), 0x00 },
> @@ -362,26 +338,19 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>   	{ CCI_REG8(0x38a7), 0x04 },
>   	{ CCI_REG8(0x38b8), 0x02 },
>   	{ CCI_REG8(0x3c80), 0x3e },
> -	{ CCI_REG8(0x3c86), 0x01 },
>   	{ CCI_REG8(0x3c87), 0x02 },
>   	{ CCI_REG8(0x389c), 0x00 },
>   	{ CCI_REG8(0x3ca2), 0x0c },
>   	{ CCI_REG8(0x3d85), 0x1b },
> -	{ CCI_REG8(0x3d8c), 0x01 },
>   	{ CCI_REG8(0x3d8d), 0xe2 },
>   	{ CCI_REG8(0x3f00), 0xcb },
> -	{ CCI_REG8(0x3f03), 0x08 },
>   	{ CCI_REG8(0x3f9e), 0x07 },
>   	{ CCI_REG8(0x3f9f), 0x04 },
>   	{ CCI_REG8(0x4000), 0xf3 },
>   	{ CCI_REG8(0x4002), 0x00 },
>   	{ CCI_REG8(0x4003), 0x40 },
> -	{ CCI_REG8(0x4008), 0x02 },
> -	{ CCI_REG8(0x4009), 0x0d },
> -	{ CCI_REG8(0x400a), 0x01 },
>   	{ CCI_REG8(0x400b), 0x00 },
>   	{ CCI_REG8(0x4040), 0x00 },
> -	{ CCI_REG8(0x4041), 0x07 },
>   	{ CCI_REG8(0x4090), 0x14 },
>   	{ CCI_REG8(0x40b0), 0x01 },
>   	{ CCI_REG8(0x40b1), 0x01 },
> @@ -401,7 +370,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>   	{ CCI_REG8(0x4305), 0x83 },
>   	{ CCI_REG8(0x4306), 0x21 },
>   	{ CCI_REG8(0x430d), 0x00 },
> -	{ CCI_REG8(0x4505), 0xc4 },
>   	{ CCI_REG8(0x4506), 0x00 },
>   	{ CCI_REG8(0x4507), 0x60 },
>   	{ CCI_REG8(0x4803), 0x00 },
> @@ -413,7 +381,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>   	{ CCI_REG8(0x481f), 0x30 },
>   	{ CCI_REG8(0x4825), 0x34 },
>   	{ CCI_REG8(0x4829), 0x64 },
> -	{ CCI_REG8(0x4837), 0x12 },
>   	{ CCI_REG8(0x484b), 0x07 },
>   	{ CCI_REG8(0x4883), 0x36 },
>   	{ CCI_REG8(0x4885), 0x03 },
> @@ -446,6 +413,42 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>   	{ CCI_REG8(0x3222), 0x03 },
>   };
>   
> +static const struct cci_reg_sequence mode_2592_1944_regs[] = {
> +	{ OS05B10_REG_X_ADDR_START,	0x0130 },
> +	{ OS05B10_REG_Y_ADDR_START,	0x0000 },
> +	{ OS05B10_REG_X_ADDR_END,	0x0b5f },
> +	{ OS05B10_REG_Y_ADDR_END,	0x07a7 },
> +	{ OS05B10_REG_X_OUTPUT_SIZE,	0x0a20 },
> +	{ OS05B10_REG_Y_OUTPUT_SIZE,	0x0798 },
> +	{ OS05B10_REG_HTS,		0x06d0 },
> +	{ OS05B10_REG_ISP_X_WIN,	0x0008 },
> +	{ OS05B10_REG_ISP_Y_WIN,	0x0008 },
> +	{ OS05B10_REG_X_INC_ODD,	0x01 },
> +	{ OS05B10_REG_X_INC_EVEN,	0x01 },
> +	{ OS05B10_REG_Y_INC_ODD,	0x01 },
> +	{ OS05B10_REG_Y_INC_EVEN,	0x01 },
> +	{ OS05B10_REG_FORMAT1,		0x88 },
> +	{ OS05B10_REG_FORMAT2,		0x00 },
> +	{ CCI_REG8(0x3610), 0x87 },
> +	{ CCI_REG8(0x3620), 0x0c },
> +	{ CCI_REG8(0x3662), 0x10 },
> +	{ CCI_REG8(0x3714), 0x24 },
> +	{ CCI_REG8(0x373f), 0xb0 },
> +	{ CCI_REG8(0x37bf), 0x05 },
> +	{ CCI_REG8(0x37c2), 0x04 },
> +	{ CCI_REG8(0x37d9), 0x08 },
> +	{ CCI_REG8(0x3832), 0x08 },
> +	{ CCI_REG8(0x3c86), 0x01 },
> +	{ CCI_REG8(0x3d8c), 0x01 },
> +	{ CCI_REG8(0x3f03), 0x08 },
> +	{ CCI_REG8(0x4008), 0x02 },
> +	{ CCI_REG8(0x4009), 0x0d },
> +	{ CCI_REG8(0x400a), 0x01 },
> +	{ CCI_REG8(0x4041), 0x07 },
> +	{ CCI_REG8(0x4505), 0xc4 },
> +	{ CCI_REG8(0x4837), 0x12 },
> +};
> +
>   struct os05b10 {
>   	struct device *dev;
>   	struct regmap *cci;
> @@ -468,6 +471,11 @@ struct os05b10 {
>   	u32 data_lanes;
>   };
>   
> +struct os05b10_reg_list {
> +	u32 num_of_regs;
> +	const struct cci_reg_sequence *regs;
> +};
> +
>   struct os05b10_mode {
>   	u32 width;
>   	u32 height;
> @@ -475,6 +483,7 @@ struct os05b10_mode {
>   	u32 hts;
>   	u32 exp;
>   	u8 bpp;
> +	struct os05b10_reg_list reg_list;
>   };
>   
>   static const struct os05b10_mode supported_modes_10bit[] = {
> @@ -485,6 +494,10 @@ static const struct os05b10_mode supported_modes_10bit[] = {
>   		.hts = 1744,
>   		.exp = 1944,
>   		.bpp = 10,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_2592_1944_regs),
> +			.regs = mode_2592_1944_regs,
> +		},
>   	},
>   };
>   
> @@ -654,8 +667,16 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
>   				  u32 pad, u64 streams_mask)
>   {
>   	struct os05b10 *os05b10 = to_os05b10(sd);
> +	const struct os05b10_reg_list *reg_list;
> +	const struct v4l2_mbus_framefmt *fmt;
> +	const struct os05b10_mode *mode;
>   	int ret;
>   
> +	fmt = v4l2_subdev_state_get_format(state, 0);
> +	mode = v4l2_find_nearest_size(supported_modes_10bit,
> +				      ARRAY_SIZE(supported_modes_10bit), width,
> +				      height, fmt->width, fmt->height);
> +
>   	ret = pm_runtime_resume_and_get(os05b10->dev);
>   	if (ret < 0)
>   		return ret;
> @@ -668,6 +689,15 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
>   		goto err_rpm_put;
>   	}
>   
> +	/* Write sensor mode registers */
> +	reg_list = &mode->reg_list;
> +	ret = cci_multi_reg_write(os05b10->cci, reg_list->regs,
> +				  reg_list->num_of_regs, NULL);
> +	if (ret) {
> +		dev_err(os05b10->dev, "fail to write initial registers\n");
> +		goto err_rpm_put;
> +	}
> +
>   	/* Apply customized user controls */
>   	ret = __v4l2_ctrl_handler_setup(os05b10->sd.ctrl_handler);
>   	if (ret)

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
