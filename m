Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B105D282F25
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784898591; cv=none; b=ZPdif73NagyLflAv8jmlZ8qe9s7sKcahVlQKgfrmFJDgmqXLbPzBEnNge30I2PQGz+twiEmdAfm6AKfK5sm5LgyPahplio39z8wIsaGuxE22GzNimNV3HCTVznroaePE+caGUvNL62jI7460xzKLDpv7QnzKRuz52TchTk72RHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784898591; c=relaxed/simple;
	bh=hiHQyjn0VKXb1ofyIsjoIX1kSu0QsHEBJD6L0QubhQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X+nwYbbgadTWbaj80bkwt+kaCMd4XsaKnauBbDdjgFNfdKKoSy6sukbhnzWDjWunWhdlUAp4R/gMBhy/+FTLqohDzn+IRMtesUZZ02yM5FtC4eK3IMZBH8zvQ9fPuKt8gkFgdsGRsk/MeBN2fgkMvVSR2e+5EwJc4Ka2LN7WJYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ojrlqyCg; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ojrlqyCg"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b2af9beee4so67862e87.3
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 06:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784898588; x=1785503388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z5FPQcDUW7sqo39ap2RSAowz94UVvDKKod3XJYRB/UE=;
        b=ojrlqyCgx0dbH5PCcdRWXm2iRU5WDtNxNebEwAQwbsb7Fz/a17n2YjL/Zybu9/kuTJ
         pvVI9abUZLFG+2LxZd6Qemtk1UDIPzc+EQ0FmbNdbjbvQyKauLNWey73mF8KB5HtONDM
         zKypnPp4ofL0BCF8BLIXLz2Gk/nEE2hKe/z4nPS0lxCsVi9Tv4o60R1JjXIRowHbkp4D
         UhJbbDaL/lpc7xz0GLYNMZHudhjkYxoVThsEqMjVANg+AhMg376DSPZ6T7iDwVdkIqaM
         vwm8inzZLVrn/TkPCmIXq7K16yLg1OgdrKzkN/H4AUqgPf7lIHlVHnkizf/lLTzdSA8k
         j9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784898588; x=1785503388;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5FPQcDUW7sqo39ap2RSAowz94UVvDKKod3XJYRB/UE=;
        b=oqdppZMVf1Fau7ejNTpTVR/z+vhbxFLqH9XEtxKRWWfwoj3a29eIWFq4ZKr/cUqCAY
         QkbAi6OhAeXKCGonx4j5SfFvIrqpr2/s9sWCNzWjzJOA4UDUMgyrdyy5pldwK53bYusQ
         8GndRdraLfFFChOQD6eQRFuc2+rULVmxHE8ffxPJponIDFV6h2wP0lIIuiCcgRDXwNpz
         iwISuBqNGMq+Z6gVZHdvarV+zP/bGYhVSx2nON5l5Pxa8/YF7mbG9RGG9oIm9RSosjHz
         aofLKy8Cca6Hv51+vYa1k1oDuxv7S6iGj4VQS84rrcVsM/22FFcC6fVD0rYTEGgI2mqR
         5Rcg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2fdlxuNzovWSaZuhCXUiEXeVIQPLTF1/FCvK2R76HqJQbNAaeR9+dJwbqn5HGJ2TwOiN3uSY63djwUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiObRnf+kJvSYvPU6s1b15+dkWiBdWUK3587yo1jhjDkxTPEJV
	6seK+cRygzpuvTbHJ3NQhXN+hoTN4B7EhP4rF9DFSlcVS/tDZUZDaI7WPKOvw2k7IMg=
X-Gm-Gg: AR+sD125mBq6SaTg+koc3RTBTTeLWgRZZQ84mXHbVKPT+qM1EPv+MVu4SGLWy49T7ue
	OS8q+38jLACYKDTfqAD1pwXF5frqxK33OJc/tYsAcO4KL8YnyQ9texg7dogyWuvDD9EZBp8ulRS
	atCu7KajNB3PacFJ8YzTjFDAHP21ifQ0LWlXnBAWy0fCiaju0Qwj1RmMSynaidZtvULsAON0SkS
	b10vKgtSnvI5neqdRuxBwTorURlMjozxuj8HQeSG5ewN7H1Hvk4Agw3D8lHS/RGUS5A+T122f+T
	20vZQeNTlE6TEFfFDKRvF1ZpF1XyTI5THDZwbF0tKs4xShsJhttW51uM6r3+qKjsOSbeEOSHkLi
	xEZPvGg90039HPNnd7HD3b3+XisHFZo5dxratCaXyKSnpEridvKcQkCuCcxd3Th5F/pwhrffQwX
	aQiD2wt4VxK6oN2PHMOv9eIZl5QqP0AqH+bAtnvw4h5ufP3wlEcg+9nZAJ
X-Received: by 2002:a05:6512:1246:b0:5ae:b015:c11f with SMTP id 2adb3069b0e04-5b2b2f7623fmr1199425e87.5.1784898587655;
        Fri, 24 Jul 2026 06:09:47 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d4356dsm1478802e87.56.2026.07.24.06.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 06:09:47 -0700 (PDT)
Message-ID: <3673f7ac-4a86-4576-9a27-9e736a69c45f@linaro.org>
Date: Fri, 24 Jul 2026 16:09:39 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/17] media: i2c: os05b10: add register definitions
 and use them in init table
To: Tarang Raval <tarang.raval@siliconsignals.io>,
 sakari.ailus@linux.intel.com, mehdi.djait@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-4-tarang.raval@siliconsignals.io>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260718200912.16001-4-tarang.raval@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tarang.

On 7/18/26 23:08, Tarang Raval wrote:
> Define named register macros for OS05B10 and replace raw register
> addresses in the common initialization array with the new definitions.
> This improves readability and maintainability without changing
> functionality.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>   drivers/media/i2c/os05b10.c | 110 +++++++++++++++++++++++-------------
>   1 file changed, 70 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index 84621370d1da..96395cd7a2ca 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -38,6 +38,20 @@
>   #define OS05B10_MODE_STANDBY		0x00
>   #define OS05B10_MODE_STREAMING		0x01
>   
> +#define OS05B10_REG_PLL_CTRL_01		CCI_REG8(0x0301)
> +#define OS05B10_REG_PLL_CTRL_03		CCI_REG8(0x0303)
> +#define OS05B10_REG_PLL_CTRL_05		CCI_REG8(0x0305)
> +#define OS05B10_REG_PLL_CTRL_06		CCI_REG8(0x0306)
> +#define OS05B10_REG_PLL_CTRL_25		CCI_REG8(0x0325)

Here I see a potential to remove a few lines by announcing
a parameterised macro like

#define OS05B10_REG_PLL_CTRL(n)		CCI_REG8(0x0300 + (n))

> +
> +#define OS05B10_REG_MIPI_SC_CTRL	CCI_REG8(0x3016)
> +#define OS05B10_4_LANE_MODE		0x72
> +#define OS05B10_2_LANE_MODE		0x32
> +
> +#define OS05B10_REG_MIPI_SC_CTRL_1	CCI_REG8(0x3022)
> +#define OS05B10_10BIT_MODE		0x01
> +#define OS05B10_12BIT_MODE		0x61
> +
>   #define OS05B10_REG_EXPOSURE		CCI_REG24(0x3500)
>   #define OS05B10_EXPOSURE_MIN		2
>   #define OS05B10_EXPOSURE_STEP		1
> @@ -49,11 +63,41 @@
>   #define OS05B10_ANALOG_GAIN_STEP	1
>   #define OS05B10_ANALOG_GAIN_DEFAULT	0x80
>   
> +#define OS05B10_REG_DIGITAL_GAIN	CCI_REG16(0x350a)
> +#define OS05B10_DIGITAL_GAIN_MIN	0x400
> +#define OS05B10_DIGITAL_GAIN_MAX	0x3fff
> +#define OS05B10_DIGITAL_GAIN_STEP	1
> +#define OS05B10_DIGITAL_GAIN_DEFAULT	0x400

#define OS05B10_DIGITAL_GAIN_DEFAULT	OS05B10_DIGITAL_GAIN_MIN

Or just use OS05B10_DIGITAL_GAIN_MIN whenever default one is needed.

> +
> +#define OS05B10_REG_ANALOG_GAIN_SHORT	CCI_REG16(0x350c)
> +#define OS05B10_REG_DIGITAL_GAIN_SHORT	CCI_REG16(0x350e)
> +#define OS05B10_REG_EXPOSURE_SHORT	CCI_REG24(0x3510)
> +
> +#define OS05B10_REG_X_ADDR_START	CCI_REG16(0x3800)
> +#define OS05B10_REG_Y_ADDR_START	CCI_REG16(0x3802)
> +#define OS05B10_REG_X_ADDR_END		CCI_REG16(0x3804)
> +#define OS05B10_REG_Y_ADDR_END		CCI_REG16(0x3806)
> +#define OS05B10_REG_X_OUTPUT_SIZE	CCI_REG16(0x3808)
> +#define OS05B10_REG_Y_OUTPUT_SIZE	CCI_REG16(0x380a)
> +
>   #define OS05B10_REG_HTS			CCI_REG16(0x380c)
>   
>   #define OS05B10_REG_VTS			CCI_REG16(0x380e)
>   #define OS05B10_VTS_MAX			0x7fff
>   
> +#define OS05B10_REG_ISP_X_WIN		CCI_REG16(0x3810)
> +#define OS05B10_REG_ISP_Y_WIN		CCI_REG16(0x3812)
> +#define OS05B10_REG_X_INC_ODD		CCI_REG8(0x3814)
> +#define OS05B10_REG_X_INC_EVEN		CCI_REG8(0x3815)
> +#define OS05B10_REG_Y_INC_ODD		CCI_REG8(0x3816)
> +#define OS05B10_REG_Y_INC_EVEN		CCI_REG8(0x3817)
> +
> +#define OS05B10_REG_FORMAT1		CCI_REG8(0x3820)
> +#define OS05B10_MIRROR			BIT(3)
> +#define OS05B10_FLIP			GENMASK(5, 4)
> +
> +#define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
> +
>   #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
>   
>   static const struct v4l2_rect os05b10_native_area = {
> @@ -77,30 +121,25 @@ static const char * const os05b10_supply_name[] = {
>   };
>   
>   static const struct cci_reg_sequence os05b10_common_regs[] = {
> -	{ CCI_REG8(0x0301), 0x44 },
> -	{ CCI_REG8(0x0303), 0x02 },
> -	{ CCI_REG8(0x0305), 0x32 },
> -	{ CCI_REG8(0x0306), 0x00 },
> -	{ CCI_REG8(0x0325), 0x3b },
> +	{ OS05B10_REG_PLL_CTRL_01, 0x44 },
> +	{ OS05B10_REG_PLL_CTRL_03, 0x02 },
> +	{ OS05B10_REG_PLL_CTRL_05, 0x32 },
> +	{ OS05B10_REG_PLL_CTRL_06, 0x00 },
> +	{ OS05B10_REG_PLL_CTRL_25, 0x3b },
>   	{ CCI_REG8(0x3002), 0x21 },
> -	{ CCI_REG8(0x3016), 0x72 },
> +	{ OS05B10_REG_MIPI_SC_CTRL, 0x72 },

{ OS05B10_REG_MIPI_SC_CTRL, OS05B10_4_LANE_MODE },

>   	{ CCI_REG8(0x301e), 0xb4 },
>   	{ CCI_REG8(0x301f), 0xd0 },
>   	{ CCI_REG8(0x3021), 0x03 },
> -	{ CCI_REG8(0x3022), 0x01 },
> +	{ OS05B10_REG_MIPI_SC_CTRL_1, 0x01 },

{ OS05B10_REG_MIPI_SC_CTRL_1, OS05B10_10BIT_MODE },

>   	{ CCI_REG8(0x3107), 0xa1 },
>   	{ CCI_REG8(0x3108), 0x7d },
>   	{ CCI_REG8(0x3109), 0xfc },
>   	{ CCI_REG8(0x3503), 0x88 },
> -	{ CCI_REG8(0x350a), 0x04 },
> -	{ CCI_REG8(0x350b), 0x00 },
> -	{ CCI_REG8(0x350c), 0x00 },
> -	{ CCI_REG8(0x350d), 0x80 },
> -	{ CCI_REG8(0x350e), 0x04 },
> -	{ CCI_REG8(0x350f), 0x00 },
> -	{ CCI_REG8(0x3510), 0x00 },
> -	{ CCI_REG8(0x3511), 0x00 },
> -	{ CCI_REG8(0x3512), 0x20 },
> +	{ OS05B10_REG_DIGITAL_GAIN, 0x0400 },

{ OS05B10_REG_DIGITAL_GAIN, OS05B10_DIGITAL_GAIN_DEFAULT }, // or OS05B10_DIGITAL_GAIN_MIN

> +	{ OS05B10_REG_ANALOG_GAIN_SHORT, 0x0080 },
> +	{ OS05B10_REG_DIGITAL_GAIN_SHORT, OS05B10_DIGITAL_GAIN_DEFAULT },
> +	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
>   	{ CCI_REG8(0x3600), 0x4d },
>   	{ CCI_REG8(0x3601), 0x08 },
>   	{ CCI_REG8(0x3610), 0x87 },
> @@ -274,34 +313,25 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>   	{ CCI_REG8(0x37f5), 0x00 },
>   	{ CCI_REG8(0x37f6), 0x00 },
>   	{ CCI_REG8(0x37f7), 0x00 },
> -	{ CCI_REG8(0x3800), 0x01 },
> -	{ CCI_REG8(0x3801), 0x30 },
> -	{ CCI_REG8(0x3802), 0x00 },
> -	{ CCI_REG8(0x3803), 0x00 },
> -	{ CCI_REG8(0x3804), 0x0b },
> -	{ CCI_REG8(0x3805), 0x5f },
> -	{ CCI_REG8(0x3806), 0x07 },
> -	{ CCI_REG8(0x3807), 0xa7 },
> -	{ CCI_REG8(0x3808), 0x0a },
> -	{ CCI_REG8(0x3809), 0x20 },
> -	{ CCI_REG8(0x380a), 0x07 },
> -	{ CCI_REG8(0x380b), 0x98 },
> -	{ CCI_REG8(0x380c), 0x06 },
> -	{ CCI_REG8(0x380d), 0xd0 },
> -	{ CCI_REG8(0x3810), 0x00 },
> -	{ CCI_REG8(0x3811), 0x08 },
> -	{ CCI_REG8(0x3812), 0x00 },
> -	{ CCI_REG8(0x3813), 0x08 },
> -	{ CCI_REG8(0x3814), 0x01 },
> -	{ CCI_REG8(0x3815), 0x01 },
> -	{ CCI_REG8(0x3816), 0x01 },
> -	{ CCI_REG8(0x3817), 0x01 },
> +	{ OS05B10_REG_X_ADDR_START, 0x0130 },
> +	{ OS05B10_REG_Y_ADDR_START, 0x0000 },
> +	{ OS05B10_REG_X_ADDR_END, 0x0b5f },
> +	{ OS05B10_REG_Y_ADDR_END, 0x07a7 },
> +	{ OS05B10_REG_X_OUTPUT_SIZE, 0x0a20 },
> +	{ OS05B10_REG_Y_OUTPUT_SIZE, 0x0798 },
> +	{ OS05B10_REG_HTS, 0x06d0 },
> +	{ OS05B10_REG_ISP_X_WIN, 0x0008 },
> +	{ OS05B10_REG_ISP_Y_WIN, 0x0008 },
> +	{ OS05B10_REG_X_INC_ODD, 0x01 },
> +	{ OS05B10_REG_X_INC_EVEN, 0x01 },
> +	{ OS05B10_REG_Y_INC_ODD, 0x01 },
> +	{ OS05B10_REG_Y_INC_EVEN, 0x01 },
>   	{ CCI_REG8(0x3818), 0x00 },
>   	{ CCI_REG8(0x3819), 0x00 },
>   	{ CCI_REG8(0x381a), 0x00 },
>   	{ CCI_REG8(0x381b), 0x01 },
> -	{ CCI_REG8(0x3820), 0x88 },
> -	{ CCI_REG8(0x3821), 0x00 },
> +	{ OS05B10_REG_FORMAT1, 0x88 },
> +	{ OS05B10_REG_FORMAT2, 0x00 },
>   	{ CCI_REG8(0x3822), 0x12 },
>   	{ CCI_REG8(0x3823), 0x08 },
>   	{ CCI_REG8(0x3824), 0x00 },

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
