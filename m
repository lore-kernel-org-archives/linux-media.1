Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA7E3BFAD4
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 17:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785519574; cv=none; b=G2XXbU0gN9wSLbDE8OYVuKp+R8Mf4WYcu+ROCtH1lxnPPqXFHzF6LX7MRfdmV+odn45oOOkO30CC9u9934TxRIU8ghS357uD8Wk4cfjB5cCp/8kCyl9BYVfQKXU3k3UO/NvBkeWQlc4U/N9q3KnpjX/z/Zl/JJ8ETitKnUXE66k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785519574; c=relaxed/simple;
	bh=xBnjbcfEInuD7wKHlSXA5W30KWw7QfpToPZZ3oihvOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pRDgnrm2YJ5uKxOuLnaloEbcoFOugGS4zoWd4/R24hwRdq+dfjX+NLlDOTahBHZRdrWlt4ba1VK6sz7bHoNYKeLtq/lGhqwttY2IfwvNV7tlODPr2aW/65Zln4osMa660Ms9H+Jlza1BQ/EogVh3LfLOpUCnQ5R7Hu8hSQ8LFNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JpFkRk7F; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JpFkRk7F"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b2a73d5fc3so139453e87.1
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 10:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785519569; x=1786124369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vN26vxm6o8zanEQNz46PhpMvu2bmYdDVwJynhP9O2Ag=;
        b=JpFkRk7FsV9Wvui6IFJqREAw1pqV/kXqEAosytqe2gRJ4Gj6qtzDfCHNlJb4xMkGwR
         2+fMpPEJrnclbKwyNMe99YXAYHk+266+pEHp1JbfUYzkZwDO0lOOxVPc5b2jquFGOtE2
         FYSY1xijEQpdsRVNUg/fldlAQWbj8bjmKHGwEyTJylcd9G21f653AyhI/BQRqEJdMo81
         tUgN6/blKoIBr7FmrHgt87IiJVkV2/AmvMuKV1opc+071HCBUtASXwaVzRSFXkQTX9Oa
         mKwr3JWGSIGcRgUV7ZRBPdFsiaLq8K39s1XuDmj2GYqlEd+5oCDOiCaLWOSxKtnnl+XM
         I30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785519569; x=1786124369;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vN26vxm6o8zanEQNz46PhpMvu2bmYdDVwJynhP9O2Ag=;
        b=sTX/nm7aDGE+YtHvecHZwn09bi61BhtkxT4qetaAZLeuppV6KTcFxgcTRzjh/gb+Zy
         4lbVZrR6Wgr6IdmewZTLMFUMefftYF7IhW4BtdIokp1SezeAXqhoiyMLl11oy4DxURdJ
         MTz1gO+X7y3jHm1CuCLSBN6a9Va6INGlHS8aCTiOPeFzqZPeZBdZC7izrYhpBfwKRyWh
         +Qx5fy2qf+eOFAzowKMWvjdqvgRw8wCqFo/DaQlcLBHLnp39eRcZRE7BYr7WQg/R+E2K
         K5x+S8mdvDuAJwIJVxn4+SCq77UcWOv0xLorN/yqST4pGWtwECCSFufcZJrdI/rjkIZN
         zhHA==
X-Gm-Message-State: AOJu0YzHQ0ceo3Mvc+Z6mkn+UZDF8ydGmWt+dN09/TjNXKC+ira3/Wju
	PmhYehxQBaAdkh+gS2WfXFHx/z/0pV2Lwb69jTUvTovfj4z1zN/yUVHkIjpnXTnOPo0=
X-Gm-Gg: AR+sD11xepq5yRnlPf5ezD9QoTJ6STZon66Jdyh8OH0857EEbNDtf+2DWMqPqmlkZRl
	52gNqjXwmPE89aEgkgT6viL0hAqhZHVoCD+VlT44fLfcDVCg4Qus9Jht24SqsnDFy/9gfo80IJ6
	zbPRCN+uxMkdf043ZEatAqHU8ehiLBN1Dz85lGkv+pw+VbjAFQyPQ1nTQb+ab5QE2sNVqe+7oAk
	FjcYFOPnF8lqq30k3leyLDV0nX1AWAk8UP87060xqQU5kAml15UIrx6+miE2MbDAuYUCIdV5tcE
	UIsBS3Pwrju+qJT4KkzYfFf4sv5OdUs5mNgjQGClrtPa9Ixzge7xIoSk7VRk36pnN2KvU2oTUBt
	AgSpAj3GMUbkYwkoiSp8Q/Cei6wlYfXGH8022t6nVt6g4jhPCDWZvVYlfefRqwiATT71RDfdlDf
	Bf+pGjfW4waD9uTAuSnLht2L7dDhcgep18vAsA+V6+jtkBwfUAEiJ3mK6Gj3D+OnvT4pbjILPl1
	KrfbJMxP+a4XVJ/uhzbKzrlb+ZJ5EiFaOl3N2ifGmJWuUtyeWXnZg==
X-Received: by 2002:a05:6512:39cf:b0:5b1:4fde:61a with SMTP id 2adb3069b0e04-5b2e4f50524mr160505e87.2.1785519568497;
        Fri, 31 Jul 2026 10:39:28 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cf68esm466117e87.34.2026.07.31.10.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 10:39:26 -0700 (PDT)
Message-ID: <2fcdea3f-8588-40b6-9686-52756dd19d26@linaro.org>
Date: Fri, 31 Jul 2026 20:39:25 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: Add Samsung S5KJN5 image sensor driver
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260724-sk5jn5-v2-0-871d3b9a2e47@oss.qualcomm.com>
 <20260724-sk5jn5-v2-2-871d3b9a2e47@oss.qualcomm.com>
 <2b5753f2-d5f4-4957-b865-f06b842af3de@linaro.org>
 <d5f579a7-b04b-4feb-8d6f-ae6e76e51f60@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <d5f579a7-b04b-4feb-8d6f-ae6e76e51f60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Wenmeng,

On 7/31/26 11:24, Wenmeng Liu wrote:
> 
> Hi Vladimir,
> On 7/25/2026 3:22 PM, Vladimir Zapolskiy wrote:
>> Hi Wenmeng.
>>
>> On 7/24/26 12:50, Wenmeng Liu wrote:
>>> Add a V4L2 sub-device driver for the Samsung S5KJN5, a 50 MP GBRG 10-bit
>>
>> I believe "GBRG" detalization here will be incorrect, if you consider image
>> flips or odd crops.
>>
>>> RAW MIPI CSI-2 image sensor. The driver supports the 4096x3072 mode and
>>> exposes the standard controls (exposure, gain, vblank/hblank, test
>>> pattern).
>>>
>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>> ---
>>>    MAINTAINERS                |    1 +
>>>    drivers/media/i2c/Kconfig  |   11 +
>>>    drivers/media/i2c/Makefile |    1 +
>>>    drivers/media/i2c/s5kjn5.c | 2835 ++++++++++++++++++++++++++++++++++
>>> ++++++++++
>>>    4 files changed, 2848 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index
>>> 244c7ed5872aa0972a7b055d7e0b19d530820a08..6f6edae5de13efc0cda6c91ab8c9a40bfe2cbff9 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -24195,6 +24195,7 @@ M:    Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>    L:    linux-media@vger.kernel.org
>>>    S:    Supported
>>>    F:    Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
>>> +F:    drivers/media/i2c/s5kjn5.c
>>>    SAMSUNG S5P Security SubSystem (SSS) DRIVER
>>>    M:    Krzysztof Kozlowski <krzk@kernel.org>
>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>> index
>>> 7ffccba897ae5637bd0cb913e1e04f9c7d0c89f5..06b5dbc32cab328df8d10da04d91a708bff6fdda 100644
>>> --- a/drivers/media/i2c/Kconfig
>>> +++ b/drivers/media/i2c/Kconfig
>>> @@ -824,6 +824,17 @@ config VIDEO_S5KJN1
>>>          To compile this driver as a module, choose M here: the
>>>          module will be called s5kjn1.
>>> +config VIDEO_S5KJN5
>>> +    tristate "Samsung S5KJN5 sensor support"
>>> +    depends on GPIOLIB
>>> +    select V4L2_CCI_I2C
>>> +    help
>>> +      This is a V4L2 sensor driver for Samsung S5KJN5 50MP GBRG
>>
>> Same comment as above, I believe "GBRG" should be either removed or
>> generalized to "Bayer" or "raw".
>>
>>> +      10-bit RAW MIPI CSI-2 camera sensor.
>>> +
>>> +      To compile this driver as a module, choose M here: the
>>> +      module will be called s5kjn5.
>>> +
>>>    config VIDEO_T4KA3
>>>        tristate "Toshiba T4KA3 sensor support"
>>>        depends on ACPI || COMPILE_TEST
>>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>>> index
>>> d04bd5724552e88fc2ad39f9bbaf9b4ce1763939..45019ce20a6c34c8139b8247b6904c3abb1a8fe7 100644
>>> --- a/drivers/media/i2c/Makefile
>>> +++ b/drivers/media/i2c/Makefile
>>> @@ -133,6 +133,7 @@ obj-$(CONFIG_VIDEO_S5K3M5) += s5k3m5.o
>>>    obj-$(CONFIG_VIDEO_S5K5BAF) += s5k5baf.o
>>>    obj-$(CONFIG_VIDEO_S5K6A3) += s5k6a3.o
>>>    obj-$(CONFIG_VIDEO_S5KJN1) += s5kjn1.o
>>> +obj-$(CONFIG_VIDEO_S5KJN5) += s5kjn5.o
>>>    obj-$(CONFIG_VIDEO_SAA6588) += saa6588.o
>>>    obj-$(CONFIG_VIDEO_SAA6752HS) += saa6752hs.o
>>>    obj-$(CONFIG_VIDEO_SAA7110) += saa7110.o
>>> diff --git a/drivers/media/i2c/s5kjn5.c b/drivers/media/i2c/s5kjn5.c
>>> new file mode 100644
>>> index
>>> 0000000000000000000000000000000000000000..865db808aabcf7d910acbdab8126b9fa308ef875
>>> --- /dev/null
>>> +++ b/drivers/media/i2c/s5kjn5.c
>>> @@ -0,0 +1,2835 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Samsung S5KJN5 50 MP GBRG 10-bit RAW MIPI CSI-2 sensor driver
>>
>> Same comment as above.
>>
>>> + *
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/gpio/consumer.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/module.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/regulator/consumer.h>
>>> +#include <media/v4l2-cci.h>
>>> +#include <media/v4l2-ctrls.h>
>>> +#include <media/v4l2-device.h>
>>
>> Let me ask, which interface or declaration from media/v4l2-ctrls.h
>> is used in the driver? I have a feeling that it's unused.
>>
> 
> It is required. The driver call many interfaces form it, like
> v4l2_ctrl_new_int_menu/__v4l2_ctrl_handler_setup...

my bad, I stopped at media/v4l2-device.h above, and my question is about
this media/v4l2-device.h header actually, can you please double check,
if the driver uses anything from that header or not?

I wrongly copied a definitely used media/v4l2-ctrls.h to my question,
it was not my intention, sorry.

> And thanks a lot for the review. ACK for the rest, and I'll address them
> in the next revision.
> 

Thank you! I will try my best to review the driver without a great delay.

-- 
Best wishes,
Vladimir
