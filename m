Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044AF396B8C
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 18:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787251104; cv=none; b=ucIbff9NTaKWeCNHm7S3BptOpH+0bLMxG3fy9wNf8rSAJGgQzZbS5GOpZGOlSePOwLduXEdypj7SxrOfmlIax87G3AWqklvcGdlo9OeE5wkP8lbkUlwKzs969hmeyDGd/7Do/o9jwoOj4NHWeQgPjXbRpCZqdckVooiqdVZYysg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787251104; c=relaxed/simple;
	bh=cEF4bRKLrqqiBUyb62B212F6bXgMFPyo3HDQScv7ZBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=teJZsoho6e+UaeLKZ/GmhIgj+z2fzwxxhl8XcxkZ4ppP0cZ2xDsDDDAY/yhyBFR4BuwVCQTZ9YbIGvB3JkN69vbhSuSWBf+NNDUZ+YstNSFNw+s4DNa0buumBNM43NsieoUnHPOo9nfXmjflgyexgRwKsmB7dmYrY603qY5+Dqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYhddFJj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEhyYoIL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYhddFJj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEhyYoIL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIIvwZ571549
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 18:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kmzYg3MbcxJTU7gon1FozBvw0txqHCaP3JpjklH/fhg=; b=lYhddFJjckQqcBWt
	1JhSuihi4y+N+Fh+Ml6JcyO3+ILkOf1Dyt1hwM+QDbon0YINHUjuhgCoL8EOaY39
	LM1a7xCL4JyGEazHqcIyGa6jvEDtaYqgussMlx6rqLG1oorBw7QAsV5+ClCqDJhT
	xvPqh1NvVngcWtHQyb5v/phUrzUzOYi3NimM06n5YoLBvtfPQ2LsWOJ/axQuUnFl
	06RlSxNOem2RBwB/Vy4JpIYzriTS1Yx8KPu8XBdtzlBPUlyUn2XAJp0Kk7YHS3ym
	d7UOdWE/89rwAcX6ht3B3d5cJItb8qzSY/bI0Y1VuuIQzpz47GZX57JBxKN3z2qr
	vWNzkg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgcam0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 18:38:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494cce712so14771485a.3
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 11:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787251100; x=1787855900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmzYg3MbcxJTU7gon1FozBvw0txqHCaP3JpjklH/fhg=;
        b=QEhyYoILMJrNAt71OZrYbBLVMK7EvtkP94SB/f/Ht/ODywqJyyRlgQWIBT7v7pHNXh
         eoZ8Q/f6KySQBahjQhgDnBilFIfcg44EcEUhNWLFhAaXACZ+9XVy9E5BEmUQEU5poGPh
         Ajt/ewzRkQ/2RG7LjruZ7lqctHIE3qs11QPwoowtKfhM940oGQqEWSlLNDGgBTOapvh2
         q3xs93bxQIdFhHT/E1ORGYzW7iQ4QVrH6XZoD9WD2J29auP5DIroVix9Gzp+9mHlYZWN
         9uHhMZblauI6nX4PBPb1F6kw1mmOtl4LqsEZLe368UpymGyPHITbDlzLh6AoxZaZPpPe
         dvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787251100; x=1787855900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kmzYg3MbcxJTU7gon1FozBvw0txqHCaP3JpjklH/fhg=;
        b=rnbBqbAY+VTNg2+YsOGqH4H8WL1a2ABPpSn7eKtwhrjhZ3uNJdNU7L2oE1CR3cw35n
         MEp2sUtFWjL/YpoHAtlSQUP7gQ17/Gp933h+oOUF5AacUKOSnMHRQDvXEJriExHeMMqY
         XqtBeAsOiJbQBlkoFpbCV52dx2Ah4egQe9CECqwtuoOveWaMxMKW1xz0OlTWiYvWRfkx
         T6cd+g8LtN4VZFmSlHuWtYDnsQI9fmwXmd71sUuuHmxfXULwkMTb5VMVtHBZRCV1h1+s
         Z8ymyEQ9lhwjQMy7po3EfGuJQHC7Pm0EdtTRW+3w+u0ZHCyzzShsbH8Eh8o//shXlJMf
         b12g==
X-Gm-Message-State: AOJu0YxgqLQomxi5mlD95gCsT+TsD+p28sykRiGXUUQZC3ZGfOhWu0MJ
	iykfF7L61UaelrqIMuJd6QMSFuIke9VtmeyCVufR2SsZmKMcDweaSQHaHiXNUeURUU/BOgoSHIy
	LcqAiY2ecloB70h6JXovUxrht3v8cccmyq34Erq3JWW3ac4mEjNTHR+ZRlEDh1hx4uw==
X-Gm-Gg: AR+sD10aMsKk8AqGqVR4LThE6xiaWtBWrFrGD8y+FDxbua8sKFaw2mhMayxExQnX08b
	NzSTZQ2zB6U2DWGZqXnIMRAWPX/Mf4Aq21FCNVaQtO6r3eO8OF4knCYaqvLrcZSfwQ5fMUz/XL9
	9Yij8ZRAhTlpQVHFjVmWvSM2eqR+GszlVgtKpT173Wr76pQ6yxzEVegPMXqx+/rq4QTkKweHnuS
	3Cq3qBlyXtjtFJzMVh1sPcRER4wmxVQ6kbUk2VT8X2bjHBBK5ryVquGgUaT7GOH4jEled2Zwcak
	HV+Tfa76MkzgCMFk9pemNO/g9tl2HUGadHFZJDyHySIG+weDcFnffiKfdTMi2/FaLYbKEfDxY0I
	u0FXLo/kSEsxdsbTOQWJmir2dPy4TMe1R
X-Received: by 2002:a05:620a:2983:b0:937:260b:4d8c with SMTP id af79cd13be357-937395747cemr6357285a.33.1787251099928;
        Thu, 20 Aug 2026 11:38:19 -0700 (PDT)
X-Received: by 2002:a05:620a:2983:b0:937:260b:4d8c with SMTP id af79cd13be357-937395747cemr6353785a.33.1787251099403;
        Thu, 20 Aug 2026 11:38:19 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b90d297esm525945e9.2.2026.08.20.11.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 11:38:18 -0700 (PDT)
Message-ID: <8997090d-1749-42cd-b9ae-b9c42f9e263d@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 21:38:16 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-3-atanas.filipov@oss.qualcomm.com>
 <vz6a2qugu7kkci3fcdkd236axr3ur33ghrgoopbrz3isueml45@b4frwo4l2hfh>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <vz6a2qugu7kkci3fcdkd236axr3ur33ghrgoopbrz3isueml45@b4frwo4l2hfh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a87499d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=SSmOFEACAAAA:8 a=EUspDBNiAAAA:8 a=hVmRQhEflVXrj2loCmwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: dMZR2reMHmXUbtexDjOcS3d0FZ8x4oFm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0MCBTYWx0ZWRfX2mjauMxwnl0K
 kC5VnAPH5uI2LWjWvIwR750A7FrirRrUQg4o15Qm0FoxAh/aImr/O884aNyHSOZrpiuhrDMeFxV
 xE5ZNdEI3QNajw0qCvrT/2Kc10mavBQmySSNmXnRPWritfR/w4ykJwbHAO4/29dbfAzUqJ5iaQs
 Jj/ea7eRbhcSq3tWO3qd/5+JNMj9AtEQKZWZbnai6oGWP748LETmQf31daDxNLZPlLilVL885xG
 aTdQi3JsFq8+B2TNuhIbrv2ZLLAZjrRem4ZLvgyV+ql5e0gDhMEi/36HbE43a/tjLWnvGfeF13D
 gB7ftMpM5E87dLUSQyGGz8NSAmgKHqWbu0HmZkTUc1azxzESOiaP8FfjKeUdSlMM8yOkRT8P0CU
 CouGDK7+llLzb3lBQbmPmTqt9pIUyq3zAHSx4dMftXRrn+idCAdg6Ce8Efha4j3OERsrMezwxz7
 d8y5aqEQCXJAreepuVA==
X-Proofpoint-GUID: dMZR2reMHmXUbtexDjOcS3d0FZ8x4oFm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0MCBTYWx0ZWRfX8BgfVD1ZJ2Wf
 lqkhxIJBakV3VMNbq8GVaiYb+bPhTVEd5fpG9FVhd+UeQ27TJYbiErsMHHgRpQW+zkJC5Y1aidY
 U+zeJYDd7FjfD0s8MA7mNMsu7uz00/s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200140

On 7/30/2026 6:57 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 30, 2026 at 06:05:23PM +0300, Atanas Filipov wrote:
>> Add a Qualcomm JPEG encoder driver implemented on top of the
>> V4L2 mem2mem framework.
>>
>> The driver wires vb2 queue handling, format negotiation, JPEG header
>> handling, interrupt-driven job completion, and runtime PM/clock/ICC
>> integration for the standalone JPEG encode hardware block.
>>
>> This series targets SM8250 (Kona) platforms.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
> 
>> +static int qcom_jpeg_clk_on(struct qcom_jenc_dev *jenc)
>> +{
>> +	struct dev_pm_opp *opp;
>> +	int rc;
>> +
>> +	rc = clk_bulk_prepare_enable(jenc->num_clks, jenc->clks);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* setup the OPP according to the calculated optimal frequency */
>> +	opp = dev_pm_opp_find_freq_ceil_indexed(jenc->dev, &jenc->opt_freq, JPEG_OPP_CORE_IDX);
> 
> clk_bulk_prepare_enable starts ticking on a certain freq. Why does it
> happen _before_ setting the performance points (including voltage rails)
> which those clocks require?
> 
>> +	if (IS_ERR(opp)) {
>> +		rc = PTR_ERR(opp);
>> +		goto err_clk_disable;
>> +	}
>> +
>> +	rc = dev_pm_opp_set_opp(jenc->dev, opp);
>> +	dev_pm_opp_put(opp);
>> +	if (rc)
>> +		goto err_clk_disable;
>> +
>> +	return 0;
>> +
>> +err_clk_disable:
>> +	clk_bulk_disable_unprepare(jenc->num_clks, jenc->clks);
>> +
>> +	return rc;
>> +}
>> +
>> +static void qcom_jpeg_clk_off(struct qcom_jenc_dev *jenc)
>> +{
>> +	dev_pm_opp_set_opp(jenc->dev, NULL);
>> +	clk_bulk_disable_unprepare(jenc->num_clks, jenc->clks);
>> +	jenc->opt_freq = jenc->max_freq;
>> +}
>> +
> 
> [...]
> 
>> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
>> new file mode 100644
>> index 000000000000..c9959518c64d
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
>> @@ -0,0 +1,331 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/errno.h>
>> +#include <linux/string.h>
>> +
>> +#include <media/jpeg.h>
>> +#include <media/v4l2-jpeg.h>
>> +
>> +#include "qcom_jenc_dev.h"
>> +#include "qcom_jenc_hdr.h"
>> +
>> +/*
>> + * The elements defined in this header are specified
>> + * in the ITU-T T.81 / JPEG specification.
>> + *
>> + * https://www.w3.org/Graphics/JPEG/itu-t81.pdf
>> + */
>> +
>> +#define JFIF_HEADER_WIDTH_OFFS		0x07
>> +#define JFIF_HEADER_HEIGHT_OFFS		0x05
> 
> And you've ignored feedback here. PLEASE move all standard-related
> defines and code to the common helpers. Are there any other drivers
> which construct JPEG files manually? If not, you are lucky and you can
> just push you code. If they are, find a way to unify the codebase.
> 
> At the very least, it would make you split this commit into at least
> two, making them more readable.
> 
>> +#define JFIF_APP0_LENGTH_HI		0x00
>> +#define JFIF_APP0_LENGTH_LO		0x10
>> +#define JFIF_IDENT_TERM		0x00
>> +#define JFIF_VERSION_MAJOR		0x01
>> +#define JFIF_VERSION_MINOR		0x01
>> +#define JFIF_DENSITY_HI			0x00
>> +#define JFIF_DENSITY_LO			0x01
>> +#define JFIF_THUMBNAIL_SIZE		0x00
>> +
>> +#define JPEG_SEG_LEN_HI			0x00
>> +#define JPEG_LEN_DQT_LUMA_LO		0x43
>> +#define JPEG_LEN_DQT_CHROMA_LO		0x43
>> +#define JPEG_LEN_SOF0_MONO_LO		0x0b
>> +#define JPEG_LEN_SOF0_COLOR_LO		0x11
>> +#define JPEG_LEN_DHT_MONO_LO		0xd2
>> +#define JPEG_LEN_DHT_COLOR_HI		0x01
>> +#define JPEG_LEN_DHT_COLOR_LO		0xa2
>> +#define JPEG_LEN_SOS_MONO_LO		0x08
>> +#define JPEG_LEN_SOS_COLOR_LO		0x0c
>> +
> 
> [...]
> 
>> +
>> +static inline u32 jpeg_io_read(struct qcom_jenc_dev *jenc, u32 offset)
>> +{
>> +	return readl(jenc->jpeg_base + offset);
>> +}
> 
> Ugh.
> 
>> +
>> +static inline void jpeg_io_write(struct qcom_jenc_dev *jenc, u32 offset, u32 value)
>> +{
>> +	writel(value, jenc->jpeg_base + offset);
>> +}
>> +
>> +/*
>> + * Runtime bitfield helpers (for non-constant masks).
> 
> Why are the masks non-constant? They typically are, for register access.
> Use FIELD_GET and FIELD_PREP.
> 
>> + *
>> + * Requirements:
>> + *  - mask must be non-zero
>> + *  - mask must be contiguous (e.g. 0x7u << n)
>> + */
>> +
>> +static inline u32 jpeg_bits_get(u32 mask, u32 val)
>> +{
>> +	/* __ffs(0) is undefined; fail-safe on invalid masks. */
>> +	if (WARN_ON_ONCE(!mask))
>> +		return 0;
>> +
>> +	return (val & mask) >> __ffs(mask);
>> +}
>> +
>> +static inline u32 jpeg_bits_set(u32 mask, u32 val)
>> +{
>> +	/* __ffs(0) is undefined; fail-safe on invalid masks. */
>> +	if (WARN_ON_ONCE(!mask))
>> +		return 0;
>> +
>> +	return (val << __ffs(mask)) & mask;
>> +}
>> +
>> +static inline u32 jpeg_rd_bits(struct qcom_jenc_dev *jenc, u32 offs, u32 mask)
>> +{
>> +	u32 reg = jpeg_io_read(jenc, offs);
>> +
>> +	return jpeg_bits_get(mask, reg);
>> +}
>> +
>> +/*
>> + * Read-modify-write (for R/W registers)
>> + */
>> +static inline void jpeg_rw_bits(struct qcom_jenc_dev *jenc, u32 offs, u32 mask, u32 val)
>> +{
>> +	u32 reg = jpeg_io_read(jenc, offs);
>> +
>> +	reg &= ~mask;
>> +	reg |= jpeg_bits_set(mask, val);
>> +
>> +	jpeg_io_write(jenc, offs, reg);
> 
> And if you switch to regmap, you'd have gotten a nice function for this
> too.
> 
>> +}
>> +
>> +/*
>> + * Write-only variant (for write only registers)
>> + */
>> +static inline void jpeg_wo_bits(struct qcom_jenc_dev *jenc, u32 offs, u32 mask, u32 val)
>> +{
>> +	jpeg_io_write(jenc, offs, jpeg_bits_set(mask, val));
> 
> Ugh.
> 
>> +}
>> +
>> +
> 
> [...]
> 
>> +const struct qcom_jpeg_hw_ops qcom_jpeg_default_ops = {
>> +	.hw_get_cap	= op_jpeg_get_hw_caps,
>> +	.hw_acquire	= op_jpeg_acquire,
>> +	.hw_release	= op_jpeg_release,
>> +	.hw_prepare	= op_jpeg_prepare,
>> +	.get_queue	= op_jpeg_get_buff_queue,
>> +	.queue_setup	= op_jpeg_queue_setup,
>> +	.src_fmt_update	= op_jpeg_src_fmt_update,
>> +	.buf_prepare	= op_jpeg_buffer_prepare,
>> +	.process_exec	= op_jpeg_process_exec,
>> +	.hw_irq_top	= op_jpeg_irq_top,
>> +	.hw_irq_bot	= op_jpeg_irq_bot
> 
> Function names should start with qcom_jpeg_
> 
>> +};
>> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
>> new file mode 100644
>> index 000000000000..5a64e33a28b0
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
>> @@ -0,0 +1,52 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef QCOM_JENC_OPS_H
>> +#define QCOM_JENC_OPS_H
>> +
>> +#include <linux/device.h>
>> +#include <linux/types.h>
>> +#include <media/videobuf2-core.h>
>> +
>> +#include "qcom_jenc_dev.h"
>> +
>> +/*
>> + * JENC encoder hardware operations.
>> + */
>> +struct qcom_jpeg_hw_ops {
>> +	void (*hw_get_cap)
>> +		(struct qcom_jenc_dev *jenc_dev, u32 *hw_caps);
>> +
>> +	int (*hw_acquire)
>> +		(struct jenc_context *ectx, struct vb2_queue *queue);
>> +
>> +	int (*hw_release)
>> +		(struct jenc_context *ectx, struct vb2_queue *queue);
>> +
>> +	int (*hw_prepare)
>> +		(struct qcom_jenc_dev *jenc);
>> +
>> +	struct qcom_jenc_queue * (*get_queue)
>> +		(struct jenc_context *ectx, enum qcom_enc_qid id);
>> +
>> +	int (*queue_setup)
>> +		(struct jenc_context *ectx, enum qcom_enc_qid id);
>> +
>> +	int (*src_fmt_update)
>> +		(struct jenc_context *ectx, u32 old_fourcc, u32 new_fourcc);
>> +
>> +	int (*buf_prepare)
>> +		(struct jenc_context *ectx, struct vb2_buffer *vb2);
>> +
>> +	int (*process_exec)
>> +		(struct qcom_jenc_dev *jenc, struct jenc_context *ectx, struct vb2_buffer *vb2);
>> +
>> +	irqreturn_t (*hw_irq_top)(int irq_num, void *data);
>> +	irqreturn_t (*hw_irq_bot)(int irq_num, void *data);
> 
> How many non-default platforms do you support? Zero?
> 
> Drop the call table.
> 
>> +};
>> +
>> +extern const struct qcom_jpeg_hw_ops qcom_jpeg_default_ops;
>> +
>> +#endif /* QCOM_JENC_OPS_H */
>> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
>> new file mode 100644
>> index 000000000000..ebf69128cc2b
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
>> @@ -0,0 +1,410 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef QCOM_JENC_V420_HW_INFO_H
>> +#define QCOM_JENC_V420_HW_INFO_H
>> +
>> +#include "qcom_jenc_defs.h"
>> +
>> +#define JPEG_V420_HW_VER_STEP_POS 0
>> +#define JPEG_V420_HW_VER_STEP_MSK \
>> +	(0xffffu << JPEG_V420_HW_VER_STEP_POS)
> 
> No need to define _POS. Use GENMASK to define bitfields.
> 
>> +
>> +#define JPEG_V420_HW_VER_MINOR_POS 16
>> +#define JPEG_V420_HW_VER_MINOR_MSK \
>> +	(0x0fffu << JPEG_V420_HW_VER_MINOR_POS)
>> +
>> +#define JPEG_V420_HW_VER_MAJOR_POS 28
>> +#define JPEG_V420_HW_VER_MAJOR_MSK \
>> +	(0xfu << JPEG_V420_HW_VER_MAJOR_POS)
>> +
>> +#define JPEG_V420_HW_CAP_ENCODE_MSK BIT_U32(0)
>> +#define JPEG_V420_HW_CAP_DECODE_MSK BIT_U32(1)
>> +
>> +#define JPEG_V420_HW_CAP_UPSCALE_POS 4
>> +#define JPEG_V420_HW_CAP_UPSCALE_MSK \
>> +	(0x7u << JPEG_V420_HW_CAP_UPSCALE_POS)
>> +
>> +#define JPEG_V420_HW_CAP_DOWNSCALE_POS 8
>> +#define JPEG_V420_HW_CAP_DOWNSCALE_MSK \
>> +	(0x7u << JPEG_V420_HW_CAP_DOWNSCALE_POS)
>> +
>> +#define JPEG_V420_RST_CMD_FE_RESET_MSK			BIT_U32(0)
> 
> What is wrong with the standard BIT()?
> 

What's wrong with standart BIT_U32() when dealing with 32-bit registers? 
Or do you simply like requesting meaningless changes?!

>> +#define JPEG_V420_RST_CMD_WE_RESET_MSK			BIT_U32(1)
>> +#define JPEG_V420_RST_CMD_ENCODER_RESET_MSK		BIT_U32(4)
>> +#define JPEG_V420_RST_CMD_DECODER_RESET_MSK		BIT_U32(5)
>> +#define JPEG_V420_RST_CMD_BLOCK_FORMATTER_RST_MSK	BIT_U32(6)
>> +#define JPEG_V420_RST_CMD_SCALE_RESET_MSK		BIT_U32(7)
>> +#define JPEG_V420_RST_CMD_REGISTER_RESET_MSK		BIT_U32(13)
>> +#define JPEG_V420_RST_CMD_MISR_RESET_MSK		BIT_U32(16)
>> +#define JPEG_V420_RST_CMD_CORE_RESET_MSK		BIT_U32(17)
>> +#define JPEG_V420_RST_CMD_JPEG_V420_DOMAIN_RESET_MSK	BIT_U32(29)
>> +#define JPEG_V420_RST_CMD_RESET_BYPASS_MSK		BIT_U32(31)
>> +
> 
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index affec0ab4781..6408d3da29d4 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -234,6 +234,27 @@ enum v4l2_colorfx {
>>    */
>>   #define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1230)
>>   
>> +/* Qualcomm JPEG encoder controls */
>> +#define V4L2_CID_USER_QCOM_JENC_BASE		(V4L2_CID_USER_BASE + 0x1240)
> 
> Separate these to their own commit, making it easier for others to
> review uAPI additions. How are these being handled by the other drivers?
> 
>> +
>> +/*
>> + * V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO - enable adaptive performance scaling.
>> + *
>> + * When set to 1 the driver selects the core clock OPP level based on the
>> + * encoded frame resolution and fps target. When set to 0 (default) the
>> + * driver always runs at NOMINAL (highest) OPP level.
>> + */
>> +#define V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO	(V4L2_CID_USER_QCOM_JENC_BASE + 0)
>> +
>> +/*
>> + * V4L2_CID_QCOM_JPEG_FPS_TARGET - target encode rate in frames per second.
>> + *
>> + * Used together with V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO to select the lowest
>> + * OPP level whose throughput is sufficient for the requested frame rate.
>> + * Has no effect when perf_level_auto is 0. Range: 1-240, default: 30.
> 
> I assume 1-240 is only applicable to your driver.
> 
>> + */
>> +#define V4L2_CID_QCOM_JPEG_FPS_TARGET		(V4L2_CID_USER_QCOM_JENC_BASE + 1)
>> +
>>   /* MPEG-class control IDs */
>>   /* The MPEG controls are applicable to all codec controls
>>    * and the 'MPEG' part of the define is historical */
>> -- 
>> 2.34.1
>>
> 

