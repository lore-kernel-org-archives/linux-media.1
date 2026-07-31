Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9683CB568
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486274; cv=none; b=WfyNl9s55fHxfcvAv6R/gL8wrF9zSRQCRN4UY3Ayq/4lTLzhvuRPWkm//0ZWJhmp9ax8ZVTHTTZ0by3knyv0B6gQa1vMAadQ83nKmEV2pa04cx/YKRFT5RYaWE81GJsoPryQtSfa9EEqYpUfcfPaiLaqCat9K+aC78335qL1bXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486274; c=relaxed/simple;
	bh=tZ6wcj1R/7T6ikjhyiGVXOIeTMRdFJS8++6PntsJuug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cbidM3nuHcTUeJkfe/kza3Mme1EIjUpXQQ2XLJKrlMOMing9T8pJlY1yzsDH728BIeyierbdM/asGU5CDwJ7HmV2gBde0CpCWbDXVir3VmMZySl/JIEF/X08fSvPVWIE7JthEBulmmIJoJYqCIuuRwG65DwCWw1LBWfUVLyJhQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UWORjrLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S5z82HG4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UWORjrLn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S5z82HG4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8BrAk3336520
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tfhVrR1XwzbRp56jy68NgRK5yU4D4Jc9JJLcVAiXFzE=; b=UWORjrLnvLDQEMRQ
	2SfhQgqbKwcF+gfv+l/hWvPIZE7VRQEBEOyFMK81ce0QbOBABMJ7L0JHkylEGPJY
	2rr682LuZg02RdkWuRS2+s9tHHBpR+WdD0j/3353PqzlsD5nOCw0EE+ZF+hTw0B/
	+5yJQ85GlPRQJSmq0GKYGn9VXnU+0PceLLKQwMZYRuBxiryBP4k8jRjKbixaWM5Y
	9QmyBv1pn3wvEU7Q0qixvlb0mkG8iuV+ODijGj7w4jXMJ+v3P22h1rKd+giSyYuR
	gExKpNayUDopwynCNxOq8DCUd8Y6JC/uQuLWzfTDXlqYHS8YEv0lOaHxi+76W2Vx
	qN1leg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frr0181e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:24:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8fc92c5373bso8338356d6.1
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 01:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785486262; x=1786091062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tfhVrR1XwzbRp56jy68NgRK5yU4D4Jc9JJLcVAiXFzE=;
        b=S5z82HG4fpDMcCFkJpizaeIWDj6bu1SA7kljLszKHPtN+fQ8AnXTkcIBWHUbhWrw8Z
         T5KyGppwgQJflDuXR6oesDsAw1aXo+/FVbQ8UBidv4SAuwu7pS56oExCT5iUL8MUkbQm
         kun+Mj8MqMtb8NgT+ozOGIxYxrJ30Q6lDruNAEnpM/5atBPcy2frdt9TdWO7C+8kb0cZ
         EchMALislLDMq7ZZoZlqGoXh4iWg7DxgaMjkRUI43gA6gQd1TXGS6fY4uVHR+t7SIZXZ
         6kPH2777N8HD9+67zvuOD0W9mBakZSFfvShX4rWMXwqrsTNJwSz5Kh8Rwo+r0aTMKxOE
         uuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785486262; x=1786091062;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfhVrR1XwzbRp56jy68NgRK5yU4D4Jc9JJLcVAiXFzE=;
        b=VrCU/Y7S1+gOqc4yV3osGiCxXBfnXliO0cQLkaHVLviV8OiT55+uGG4gbEmri956dn
         rSwI+Hwh0125ogJ+VrmCzmCO46YxcscAh2WuCfpAeKPJlwG/3Ihc5cy8TbwRJoeXgrE7
         ssD08NLUw0qqaddjSRfjs1wB4Qxj5ENg7JNM6Mzp7gQyUbj2t36VT+0M7YL5ZberXsPp
         TuzRkY4a2j5mIkoRyDn5RuNZATBBz2uOfajXW1muQnBCOqjmBPL9xrXdr0u+KQUstjO0
         6SAvjz26NitScG3KOtOFphJDbWho4SQBmhKkLKGnW1hBvW9msnZSJF6g2EhlJiu3HfcM
         WCgw==
X-Gm-Message-State: AOJu0Yxfq1PJuPoUyrricVdhZtmzDFxukKf/Jz79Qtnv04oh5rEe8jPR
	zZrTWQ0zXz2bnzPP3C9O4qmnOmGYmerZR0qyiFZykWT8bvhSVK9JemraDqImUi5LwJNmALONHXf
	NAVWLKkPDjKn2nOUCXw5F6GMQBnf42TMWW2Ike/Gse+tkzpWamxvT9JUVufkZRnFT1Q==
X-Gm-Gg: AR+sD12vYsHbidiIEkOQ3Y+u5ZH78axegLzUfYl4XvOmE3BoMfcmV88wlW25CLX49Xt
	tS6rMQps2xaJ/HKC5mdCLhvOvhIg45RHUlBZ8hPiFhMA7MrKoectVw/i7UjBtTH5tt14hCaHRjz
	TBTyOfDZb1GLeIEb6SzKWpcu6oziSqwTtNm7UHsnj5fPmSelcY11+55PPOHE6gQPSdKwfcg078v
	BVJmI3/0ogYXChBels43bahFrC92rLVAkUUoCBIzP+NRmduEUiljHzc6k9foLkw3gWd39cec+EU
	Rmz6WDTqhRe1TOy+z6dA9EDegmklmd+HE56WzS/mbpuYY444vG3JdDIBemRFc1hzNWz/QiqZTuj
	xuizYCNGuCkrUdnS8NmMG5ReRXzOIVuN1LV4ZI8A+wXG+WlRb8uh3CrwuZuehCK7i
X-Received: by 2002:a05:6214:5d04:b0:8f3:9d85:405b with SMTP id 6a1803df08f44-908421b4b9emr17416826d6.16.1785486261824;
        Fri, 31 Jul 2026 01:24:21 -0700 (PDT)
X-Received: by 2002:a05:6214:5d04:b0:8f3:9d85:405b with SMTP id 6a1803df08f44-908421b4b9emr17416506d6.16.1785486261404;
        Fri, 31 Jul 2026 01:24:21 -0700 (PDT)
Received: from [10.111.175.212] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908435eab41sm5401746d6.34.2026.07.31.01.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:24:20 -0700 (PDT)
Message-ID: <d5f579a7-b04b-4feb-8d6f-ae6e76e51f60@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:24:15 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: Add Samsung S5KJN5 image sensor driver
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260724-sk5jn5-v2-0-871d3b9a2e47@oss.qualcomm.com>
 <20260724-sk5jn5-v2-2-871d3b9a2e47@oss.qualcomm.com>
 <2b5753f2-d5f4-4957-b865-f06b842af3de@linaro.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <2b5753f2-d5f4-4957-b865-f06b842af3de@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xg_ut-Ks-zgyzp18qGQOgevOn3FWbpCf
X-Authority-Analysis: v=2.4 cv=BZboFLt2 c=1 sm=1 tr=0 ts=6a6c5bb6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=z7GYzWamlFIOCxjLmCIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1OSBTYWx0ZWRfXxuecR9vQ4A2q
 d8M8BlJSBpy9roMucRW+2rsU96RolmE9ggDu4CeeIa8/H+naZbJNgFnnsUfS9koYfeFc/RwWIWX
 XLDTPuge3Aqg8wvyZjnt6RF2PEeWDrPkHQYAqBZ/9X2SCoKoh8Ex1ixPjerRLGHnkm597lp9thj
 FNYDjcxM91fsuPs9TMJvIhMxMbV1nzNACNKJbCFsVwUXkMxIq+iQMUzI0ZW5LM3bWuk5vOSFACx
 RsVex0DFKHtM3f+JUgToC2v8D0uiU3KmsoYm4WQuzy+EEiyts0aynUIER4mqff1E4mTvMenAvbk
 dOE5e6CS1f/wukNNTMe3uB1uYlehnXLOcIyFbEO5JrE8ks5CTLerA8MYFn+F3uj2q7J+dAXpnMB
 hZ5wz55KwEZAM26ybaajidpJKnVIc6KF0h8HGDW3VsffDpHvsKnO/XC1zad7UL80HBb9rnu/mwy
 8iS+2ZRRiE3zhuZxN8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1OSBTYWx0ZWRfX9o9c1kc5+THE
 GdwGs1mstM2nmNTQ3YviK3mRMPjA1BIUi+/9Ezr9jY/kyfbiRo1w+NQV5zkycth07CT6qeyYIaC
 TWHbKdF8QgW0uKNBXKShe933iLhQC3w=
X-Proofpoint-GUID: xg_ut-Ks-zgyzp18qGQOgevOn3FWbpCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310059


Hi Vladimir,
On 7/25/2026 3:22 PM, Vladimir Zapolskiy wrote:
> Hi Wenmeng.
> 
> On 7/24/26 12:50, Wenmeng Liu wrote:
>> Add a V4L2 sub-device driver for the Samsung S5KJN5, a 50 MP GBRG 10-bit
> 
> I believe "GBRG" detalization here will be incorrect, if you consider image
> flips or odd crops.
> 
>> RAW MIPI CSI-2 image sensor. The driver supports the 4096x3072 mode and
>> exposes the standard controls (exposure, gain, vblank/hblank, test
>> pattern).
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                |    1 +
>>   drivers/media/i2c/Kconfig  |   11 +
>>   drivers/media/i2c/Makefile |    1 +
>>   drivers/media/i2c/s5kjn5.c | 2835 ++++++++++++++++++++++++++++++++++ 
>> ++++++++++
>>   4 files changed, 2848 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 
>> 244c7ed5872aa0972a7b055d7e0b19d530820a08..6f6edae5de13efc0cda6c91ab8c9a40bfe2cbff9 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -24195,6 +24195,7 @@ M:    Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>   L:    linux-media@vger.kernel.org
>>   S:    Supported
>>   F:    Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
>> +F:    drivers/media/i2c/s5kjn5.c
>>   SAMSUNG S5P Security SubSystem (SSS) DRIVER
>>   M:    Krzysztof Kozlowski <krzk@kernel.org>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 
>> 7ffccba897ae5637bd0cb913e1e04f9c7d0c89f5..06b5dbc32cab328df8d10da04d91a708bff6fdda 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -824,6 +824,17 @@ config VIDEO_S5KJN1
>>         To compile this driver as a module, choose M here: the
>>         module will be called s5kjn1.
>> +config VIDEO_S5KJN5
>> +    tristate "Samsung S5KJN5 sensor support"
>> +    depends on GPIOLIB
>> +    select V4L2_CCI_I2C
>> +    help
>> +      This is a V4L2 sensor driver for Samsung S5KJN5 50MP GBRG
> 
> Same comment as above, I believe "GBRG" should be either removed or
> generalized to "Bayer" or "raw".
> 
>> +      10-bit RAW MIPI CSI-2 camera sensor.
>> +
>> +      To compile this driver as a module, choose M here: the
>> +      module will be called s5kjn5.
>> +
>>   config VIDEO_T4KA3
>>       tristate "Toshiba T4KA3 sensor support"
>>       depends on ACPI || COMPILE_TEST
>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>> index 
>> d04bd5724552e88fc2ad39f9bbaf9b4ce1763939..45019ce20a6c34c8139b8247b6904c3abb1a8fe7 100644
>> --- a/drivers/media/i2c/Makefile
>> +++ b/drivers/media/i2c/Makefile
>> @@ -133,6 +133,7 @@ obj-$(CONFIG_VIDEO_S5K3M5) += s5k3m5.o
>>   obj-$(CONFIG_VIDEO_S5K5BAF) += s5k5baf.o
>>   obj-$(CONFIG_VIDEO_S5K6A3) += s5k6a3.o
>>   obj-$(CONFIG_VIDEO_S5KJN1) += s5kjn1.o
>> +obj-$(CONFIG_VIDEO_S5KJN5) += s5kjn5.o
>>   obj-$(CONFIG_VIDEO_SAA6588) += saa6588.o
>>   obj-$(CONFIG_VIDEO_SAA6752HS) += saa6752hs.o
>>   obj-$(CONFIG_VIDEO_SAA7110) += saa7110.o
>> diff --git a/drivers/media/i2c/s5kjn5.c b/drivers/media/i2c/s5kjn5.c
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..865db808aabcf7d910acbdab8126b9fa308ef875
>> --- /dev/null
>> +++ b/drivers/media/i2c/s5kjn5.c
>> @@ -0,0 +1,2835 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Samsung S5KJN5 50 MP GBRG 10-bit RAW MIPI CSI-2 sensor driver
> 
> Same comment as above.
> 
>> + *
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <media/v4l2-cci.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
> 
> Let me ask, which interface or declaration from media/v4l2-ctrls.h
> is used in the driver? I have a feeling that it's unused.
> 

It is required. The driver call many interfaces form it, like 
v4l2_ctrl_new_int_menu/__v4l2_ctrl_handler_setup...

And thanks a lot for the review. ACK for the rest, and I'll address them 
in the next revision.

Thanks,
Wenmeng


