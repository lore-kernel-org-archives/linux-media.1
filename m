Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADFE31E83D
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 15:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905419; cv=none; b=krAwjVGjCbktwu1fwYqAlRGG6xaLHoXSNA90Hh2ALrSxmnwircClLd1bYp5y3VY2GNBaBKRcxnrT1WkWC8b7qQ9RM5iWResattedI4j4Kw9effWlWgMchFjatzYz4XH+itKbBXStl1pneuvlW2V4eVp2/eRvVnixcdtXIR3e7Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905419; c=relaxed/simple;
	bh=AR8ld8XD/38w5MrYURYat7EqnABuYvI8nC43ZIxDCiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVJyQQnMSR2EyCHxK2Zwnwce6qtyswsRszRE/ZTOQo+U9ErxE9HIpT3xRkMtjgrGZa2UgLZdih2ffSsogjE8joDxZlEkO0dA5IY8pmmqm4J1ABX8V5oHQ6Pv9UCtJvlLCwMVvVdBNNNStcoCrkOHMzYIA9HhDvW+rsdVV/WNdFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LTqPCJIc; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LTqPCJIc"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb7ccb9f0so56010e87.0
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784905414; x=1785510214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=08Xcvy5ZHNOma1gRzeCr8NdculbpMQV6NvuXqJhWjx8=;
        b=LTqPCJIc7MF2vyh57RAZvMUxWtFTlEuMQEUNnTBAaV3gtd3kS/gfifdRFGR40JmJPB
         wAfdThJ0EYNZ8DP+7SNR3ipzR/Vqf9SI4zdJJh6WDwMdmtRc433rQ+OG0lx3vCVhPG8P
         iA0ensh3vvDTzz+r7epLZv3UlBoNS868i7E2jV71tRcC9+O3/jzJ0lx2Xm52vrfjtarT
         1KlqwkmGi5z99XTJKCCF0PXDhCd4YZsdQg85PobHQIoq0EaxvXxjStvdE3sBuLL/iw5x
         CD7OvmUTC7S08pTzSDuaCM12y9mhDl0eAjcsKujkCoDbSxfCr0otdnaWeKMt6RG/ebaG
         jBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905414; x=1785510214;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=08Xcvy5ZHNOma1gRzeCr8NdculbpMQV6NvuXqJhWjx8=;
        b=m4gvOxSPXP2bCLI6ERElYYdSPyL3e6WV+F/opRIDUWTC1K8HUm2PDW36pWm/JlE5El
         xqsodqdrXfI5N/xn4ZnQhTMW2rCvsu2XjAPZbdGbssXt+jW9LILRZoqsLNUYELiJDEzE
         yOqB7zyDqU9FAiR9AJ/SIEGVpIkM0R+YpVv3JFwmm7AZu5kylPPZ3c2CQzbAu96UtCPz
         kQr8E1543sb/aQgazv53rZ2AcGXcqvYoYWjDdQSKe0xRkDCARZhE111vCyvVE5nbPV2E
         gkRT6wBZZx3910uI6QhtIy0o5TqYUNASUrBXMKmFX1EO7TvfxrednPRVmgOIAHc7wzvb
         S8kQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3V/7nuUa/lPFK8CbiJrAK1Z8Dsj+7EvOCyiRLn3xPWklAIfIFNEdg+O+BHdxwlzq7Tjk+vt8Tt8iIzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIsMTbW+TL84hqWr6CuDq3LgrJQgHIYmMw1tWAGmkr0ivEzh/8
	xFN8A2KHLJYROanMJOOrArOi3GS7z3sLQ02HX8cW01lUsDi6jiratxyDvjjJcpZvauo=
X-Gm-Gg: AR+sD13Tq+8GmHnagLLomxmTLyCdz8RngmSWyTOUtQWXfofUuUoNgXfm/FPSCHilVEA
	1QSNquu6K1tKSIFh8U43R6yvpT5J3qb7qJJ3H1aqf0oCt4fBDdN5uV0cFmtzN4mfdXL6N39W4qd
	o4yKSWW21cd7N/1BPPpfwqqV9CYVk+ReRI78V+86ueWq+MSnZiWcxUNpvHRohxt0FKT/usRWEsz
	qyjPe41bcZFMSsflJtg8sYBA5Xt42UywU3sXDXSW+ZS/79B25+Ud9eUiqpqROozY8WElKlBhZHy
	kKcgSCrx8hXx5+cTJdi1frwbGy9B4N0oHKNuw69uexlgIO6Ilr/8CUKIQ7rjC+SycG3R6u0KgvN
	DJ5LUdQYS8YOMf1Gmn6tnSjiSmuf08uJpnXm0YxfwAHJXNEvLF+CoALG7E6JqsaEPFJOjiJq7HM
	yJ62tSWyrI3hAbxoAw7MUMquLcaVcKgnyVaqv6qX5BD7FvwgMO/+GlWSoX
X-Received: by 2002:a05:6512:15a1:b0:5ae:c5b2:9cbd with SMTP id 2adb3069b0e04-5b2b7b17ca7mr532480e87.4.1784905413426;
        Fri, 24 Jul 2026 08:03:33 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f221739c1sm756201fa.6.2026.07.24.08.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 08:03:32 -0700 (PDT)
Message-ID: <39fcfa46-79a3-4ea8-b314-d59ed768e553@linaro.org>
Date: Fri, 24 Jul 2026 18:03:32 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/17] media: i2c: os05b10: add 12-bit RAW mode support
Content-Language: ru-RU
To: Tarang Raval <tarang.raval@siliconsignals.io>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "mehdi.djait@linux.intel.com" <mehdi.djait@linux.intel.com>
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-9-tarang.raval@siliconsignals.io>
 <f9ba3d84-2bda-40ec-8715-fa8d7ca2880b@linaro.org>
 <PN3P287MB18293F9ECF5CB92DEBB6C9E08BCF2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <PN3P287MB18293F9ECF5CB92DEBB6C9E08BCF2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/26 17:30, Tarang Raval wrote:
> Hi Vladimir,
> 
> Thanks for the review.
> 
>> On 7/18/26 23:08, Tarang Raval wrote:
>>> Expose a 12-bit Bayer output option in the OS05B10 V4L2 sub-device driver.
>>>
>>> Add a 12-bit mode table alongside the existing 10-bit mode, extend the
>>> enumerated mbus codes to include RAW12, and select the correct mode table
>>> based on the requested mbus format in enum_frame_size and stream enable.
>>>
>>> Also move OS05B10_REG_MIPI_SC_CTRL_1 programming out of the common register
>>> list and program it at stream-on depending on the selected mode bpp (10/12).
>>>
>>> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
>>> ---
>>>    drivers/media/i2c/os05b10.c | 112 ++++++++++++++++++++++++++++++------
>>>    1 file changed, 96 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
>>> index 4e177eacc815..e11a3c308299 100644
>>> --- a/drivers/media/i2c/os05b10.c
>>> +++ b/drivers/media/i2c/os05b10.c
>>> @@ -146,7 +146,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>>>        { CCI_REG8(0x301e), 0xb4 },
>>>        { CCI_REG8(0x301f), 0xd0 },
>>>        { CCI_REG8(0x3021), 0x03 },
>>> -     { OS05B10_REG_MIPI_SC_CTRL_1, 0x01 },
>>>        { CCI_REG8(0x3107), 0xa1 },
>>>        { CCI_REG8(0x3108), 0x7d },
>>>        { CCI_REG8(0x3109), 0xfc },
>>> @@ -500,6 +499,21 @@ struct os05b10_mode {
>>>        struct os05b10_reg_list reg_list;
>>>    };
>>>
>>> +static const struct os05b10_mode supported_modes_12bit[] = {
>>> +     {
>>> +             .width = 2592,
>>> +             .height = 1944,
>>> +             .vts = 2007,
>>> +             .hts = 1744,
>>
>> It's unusual to see .hts < .width and .vts < .height. Will is cause
>> errors in hblank/vblank computations in os05b10_set_framing_limits()?
> 
> Negative hblank is accepted by the framework, so no, I'm not seeing any
> errors from it.
> 

It could be so, but in os05b10_set_framing_limits() hblank/vblank types
are unsigned (and that's correct), so there is a likely unwanted
assigment of a negative value to an unsigned variable. It's better
to correct it.

> But you're right that it doesn't make logical/physical sense. I got a
> similar comment from Jai on patch 15/17 about this.
> 
> I'll update it accordingly, the datasheet doesn't have any information
> about the HTS register's unit/clock domain, so I'm doing some testing on
> hardware first and will update this once I have concrete numbers.
> 
>>> +             .exp = 1900,
>>> +             .bpp = 12,
>>> +             .reg_list = {
>>> +                     .num_of_regs = ARRAY_SIZE(mode_2592_1944_regs),
>>> +                     .regs = mode_2592_1944_regs,
>>> +             },
>>> +     },
>>> +};
>>> +
>>>    static const struct os05b10_mode supported_modes_10bit[] = {
>>>        {
>>>                .width = 2592,
>>> @@ -521,6 +535,7 @@ static const s64 link_frequencies[] = {
>>>
>>>    static const u32 os05b10_mbus_codes[] = {
>>>        MEDIA_BUS_FMT_SBGGR10_1X10,
>>> +     MEDIA_BUS_FMT_SBGGR12_1X12,
>>>    };
>>>
>>>    static const char * const os05b10_test_pattern_menu[] = {
>>> @@ -552,14 +567,20 @@ static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
>>>        return container_of_const(sd, struct os05b10, sd);
>>>    };
>>>
>>> -static u32 os05b10_get_format_code(struct os05b10 *os05b10)
>>> +static u32 os05b10_get_format_code(struct os05b10 *os05b10, u8 bpp)
>>>    {
>>> -     static const u32 codes[2][2] = {
>>> -             { MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
>>> -             { MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
>>> +     static const u32 codes[2][2][2] = {
>>> +             {       /* 10 bpp */
>>> +                     { MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10 },
>>> +                     { MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10 },
>>> +             },
>>> +             {       /* 12 bpp */
>>> +                     { MEDIA_BUS_FMT_SBGGR12_1X12, MEDIA_BUS_FMT_SGBRG12_1X12 },
>>> +                     { MEDIA_BUS_FMT_SGRBG12_1X12, MEDIA_BUS_FMT_SRGGB12_1X12 },
>>> +             },
>>>        };
>>>
>>> -     return codes[os05b10->vflip->val][os05b10->hflip->val];
>>> +     return codes[bpp == 12][os05b10->vflip->val][os05b10->hflip->val];
>>>    }
>>>
>>>    static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
>>> @@ -571,6 +592,34 @@ static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
>>>                            os05b10_tp_val[pattern], NULL);
>>>    }
>>>
>>> +static int get_mode_table(struct os05b10 *os05b10, unsigned int code,
>>> +                       const struct os05b10_mode **mode_list,
>>> +                       unsigned int *num_modes)
>>> +{
>>> +     switch (code) {
>>> +     case MEDIA_BUS_FMT_SBGGR12_1X12:
>>> +     case MEDIA_BUS_FMT_SGBRG12_1X12:
>>> +     case MEDIA_BUS_FMT_SGRBG12_1X12:
>>> +     case MEDIA_BUS_FMT_SRGGB12_1X12:
>>> +             *mode_list = supported_modes_12bit;
>>> +             *num_modes = ARRAY_SIZE(supported_modes_12bit);
>>> +             return 0;
>>> +
>>> +     case MEDIA_BUS_FMT_SBGGR10_1X10:
>>> +     case MEDIA_BUS_FMT_SGBRG10_1X10:
>>> +     case MEDIA_BUS_FMT_SGRBG10_1X10:
>>> +     case MEDIA_BUS_FMT_SRGGB10_1X10:
>>> +             *mode_list = supported_modes_10bit;
>>> +             *num_modes = ARRAY_SIZE(supported_modes_10bit);
>>> +             return 0;
>>> +
>>> +     default:
>>> +             dev_err(os05b10->dev,
>>> +                     "Unsupported media bus format: %#x\n", code);
>>> +             return -EINVAL;
>>> +     }
>>> +}
>>> +
>>>    static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
>>>    {
>>>        struct os05b10 *os05b10 = container_of_const(ctrl->handler,
>>> @@ -650,8 +699,8 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
>>>        if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
>>>                return -EINVAL;
>>>
>>> -     code->code = os05b10_get_format_code(os05b10);
>>> -
>>> +     code->code = os05b10_get_format_code(os05b10,
>>> +                                          (code->index == 1) ? 12 : 10);
>>
>> os05b10_mbus_codes[code->index] == MEDIA_BUS_FMT_SBGGR12_1X12 is more
>> verbose, but seems to be a better and more reliable check.
>>
>> Probably a simple inline function to get bpp from code->index can be added.
>>
>> Another option is to change the second argument of os05b10_get_format_code()
>> from bpp to just media bus format, so you can write
>>
>>       os05b10_get_format_code(os05b10, os05b10_mbus_codes[code->index]);
> 
> Okay, I will update the os05b10_get_format_code 2nd argument.
> 

Hopefully it's not a big disadvantage, a bit of complexity will be moved
to function body from the caller's side. Thank you!

-- 
Best wishes,
Vladimir
