Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C22030D3FE
	for <linux-media@vger.kernel.org>; Mon,  3 Aug 2026 15:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772637; cv=none; b=emaD+6pCW9D0zTLHlmDPz6IBFcIoZnGF58C3ecLrOOJIdHyl5yeQYVR+7+io/zMlVtFkk2uQzALCaRTut1EC9oHGgUbMWG2IWTcBrL6TBeq0jq+8zJQaAP5l7VrSFrBToe7hJhaGyLZjaXCXEkXoZ1zrBCGaa7pBigzmTV/UwXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772637; c=relaxed/simple;
	bh=MelotB0svcJUYJ5z4p2APylL+WbXDWXDLxYKckoGGNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AAJjilcpwXxpTwVBHDkVzjJpYycq3TtHzn+h18nqQM2SUILz03ApiHPVeTKfgimeK/63I3lDQvoq6UOJspK7VndGN2DvSzIHqEgOXn25iLjTWFl/0uo4tnDBfzpjL/i8AkZhD/OU9p/Z73hFcwxtfymmKrGWnEBFJk8X45pEhb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fh34Qljt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kcZR7Gt5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fh34Qljt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kcZR7Gt5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673FJNNB2172318
	for <linux-media@vger.kernel.org>; Mon, 3 Aug 2026 15:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iTUnwBfCrGAlFePM3Z5/4tp5hh4dSab+LVlaWAeGrOU=; b=fh34QljtWXBEylYv
	EPaZMq71DzEXF84QVz2eK+Jhf1YyOLbUQMYBfQWhk7b9u7LexTrM4gCnDMmqArnK
	e6i4IDnAhcI2yRQgL6YTCsX6hxBK4Cbu7hdr6+AKnBZ5tljhw9cEMzn1Ey3HisSs
	PBoeDn4Th33jjB1GsX9fWuKnRLCM8Ih3N0M12aHI+ode1bQk2CP6HtfrrEaaV4fe
	wt0ohDDk4pWJNE5/hiQmxNflzELPnA78xfyfZ5bu8PLvQq5ZaBD5n/YxfUDCJv4O
	NJbDNSdRwnof1esUYfCiBo/6u2LFfBm4DlEYmfzTcKoP/O7QY5RwOQ37mQq1fOq6
	VaXDGA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftwhdr52q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 15:57:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0f0a0760so72730661cf.2
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 08:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785772634; x=1786377434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTUnwBfCrGAlFePM3Z5/4tp5hh4dSab+LVlaWAeGrOU=;
        b=kcZR7Gt5ho2Fv09qkRnpNukGVsJHIf/ucCbbxnKh4RRm9qKrRGk3AtTBHXivOKE55a
         Dkn1UjBfR+XM9t2D7KQ315OBCA4+G6SK3NhSownvuxjGbvWKV6LBRORDVslUkLA+Gjrz
         HYbhfN4aCNatcFmVrw3ZN8Ttp9KfeRa60UaryebZbozqC2nRBZpQYvJ8DcIaXj+OWCX6
         U1gE1dgrf2efCIUt+rjNVkgx1cFNXKWe2WpMWcdrTkRYB6Ut/6/LHt97TAc2XYmkP0OF
         YTXHMQhquvhssELOxk74mLaP3M/FqC+ZzkCUOyJbFrqb49ZO3fyOxGO7R1NC9QWyYbRi
         WAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772634; x=1786377434;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTUnwBfCrGAlFePM3Z5/4tp5hh4dSab+LVlaWAeGrOU=;
        b=q1f781xWp88zMiay3wInzpvZMo0BJUuxhNMFy3agmgufEW2SYNgcmxW1esUl1e+HfG
         Sqao+iPLWSpa5tMufwBDgkbEdoTq8kJr9KwSoi4Ren5RNZIilgvn4Ugp9FRKZlsqBY0O
         DiwkPT8oLJAE9q6iGnxzGsfuSovgdpVZ6xjbE6rj0/Lk0rU4NAs3ZU1qBTOHZBpvWSIT
         4VMwLsm+A78YAxOmS988pyt5zqw2FAR2Nhfk59JvTbyV2c0q4UEnz164BwkKBcJoqEf0
         jubqSIJz7JlkdLIx66lmBueJbvL+IBAa9Vp5Ehgh+tyo+StMwASeWoVVKPu0IdAYyOSq
         aU3Q==
X-Gm-Message-State: AOJu0YyeeWk8l1Z+FSjYPsy5Uue5oKaNmAtOjzG+jrhB5litWugJaBnX
	37d4G3WTfIhcJMamHcCFgOT4/Qe4eoeakUr+oupQntsTI+/j0SZnHDtJh3oTBaGV2xIw1hGRgQy
	Yp5JxpSgbrmwjD1RZzLuLn5iXOQOAxcq5jDQRt6PiblrQfhZuBgs1dO3eYHpReV1Vgg==
X-Gm-Gg: AR+sD12nxNJhMTv4Ha2Ton5v127uUD3yC795bWBJRKT/kTLDkR8vBuYlq0KlkS85bXq
	lbUeHi47OB1K0RVN4p/eH2pnaoFH4U3cWKcrw7UPevWOJv7zUSKBHbQDCpE4sv/Q4F/KpRX0nKA
	IbH0FXecxbLUVUb8hOQHoz/C6C2opMHAr49H7dcgHL2EFfSS0fTBhwhva4tBhmll0iZoFfknyPc
	so4BCpZ48vAuwe3e/FZwM1K8FWlqoyWjapeFhYdbdHdCpllvbHLlt0jiJHVz1unF+0KSBqZOWTc
	+1xQBVCE27hw20l4+KfwGyPH5yYaRthUOsomENwGmOedNE4HPu/uN0TCH/5EM7kHhyX/6h3zws4
	+5VcEo5rJNtx2C71jlP/W7Pz4AwTOfCQqSTQLSqeXgaBrQv9PaQ9x0Bx/JvMKZ78tW5mxhQa2
X-Received: by 2002:ac8:5a91:0:b0:51b:fde4:cd57 with SMTP id d75a77b69052e-52b56780cb5mr233763611cf.31.1785772633568;
        Mon, 03 Aug 2026 08:57:13 -0700 (PDT)
X-Received: by 2002:ac8:5a91:0:b0:51b:fde4:cd57 with SMTP id d75a77b69052e-52b56780cb5mr233762891cf.31.1785772632982;
        Mon, 03 Aug 2026 08:57:12 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd450d71bsm546878366b.46.2026.08.03.08.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 08:57:12 -0700 (PDT)
Message-ID: <3f40cde3-a4bd-424d-be42-60915c90e6c3@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 18:57:09 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-3-atanas.filipov@oss.qualcomm.com>
 <vz6a2qugu7kkci3fcdkd236axr3ur33ghrgoopbrz3isueml45@b4frwo4l2hfh>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <vz6a2qugu7kkci3fcdkd236axr3ur33ghrgoopbrz3isueml45@b4frwo4l2hfh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Zf4t8MVA c=1 sm=1 tr=0 ts=6a70ba5a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=w18evlqGJRJg4lcxsJQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: bYvootIKvSpOsnsbXOASbIzt6q-Vusht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE0MyBTYWx0ZWRfX//q/0ofu5446
 k0tsJkkT7ofHoapUxtc+AhMJaZXnEi7HZmIwWhTrjJx5tIiXnlyL0+Nonil3MyEpFyZNWDnkcBA
 9nlRdN/nMEb9EENjr9FYFX++phHJmumci+tPlJG165FBPGfzu+EgruiiyMdp1ldG2R4SJOkRxyV
 LJOjrcRspA/6XYD42naKX+teVfb75P19xnkzqowfrP+iWGPEstH/bN5oMdQenDssIVwyViJGWoZ
 OisBW1zPMQn9pt7WZCrTdQjIDLM6+verA4FCnWLEPoMCrrHUVJ6ucHkcM7SBVa/mCFWeKAH3DKA
 vgGDv9Wx6Tg+RPcDGudJrAvoMB0vHCprXCFzvt9UQs01ONvhlyOw3V7TFgr/2SRhn1qLpA+ClNW
 4iP77PO71P7arO0olp6z+pkpxtMCFFXw8Z3/UEZ3B3oo8q6G8HvU6qKPVrZRfVrF4jv7g91lJv5
 s45TJ6gl205c/HsMSKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE0MyBTYWx0ZWRfX75Vr4UQ4LnDN
 u7U8ihlOXnOFwmGvvp7e/0hik0/w3e9nPM+KWc+JLYvrDbiBHtFONySVaXIKEJiOFYLNbAw+WW+
 4FaMqB0H40LDPZFHCUZ1Uaa9kiwhRQo=
X-Proofpoint-GUID: bYvootIKvSpOsnsbXOASbIzt6q-Vusht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030143

Hi Dmitry, 

On 7/30/2026 6:57 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 30, 2026 at 06:05:23PM +0300, Atanas Filipov wrote:
>> Add a Qualcomm JPEG encoder driver implemented on top of the
>> V4L2 mem2mem framework.
>>
>> The driver wires vb2 queue handling, format negotiation, JPEG header
>> handling, interrupt-driven job completion, and runtime PM/clock/ICC
>> integration for the standalone JPEG encode hardware block.
>>

<snip>

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

Yes, this comment was incorporated, maybe partially, or it wasn't fully understood.
The helper is used for the quantization tables and wherever helpers are available, 
similar to other drivers: hantro_jpeg.c, e5010-jpeg-enc.c.

The missing JFIF tags and additional helpers can certainly be added,
but is holding up the current driver just for that a reasonable ask? 
This discussion may continue for a long time — is it reasonable to wait that long?

I agree it would be good to have all other upstream JPEG encoder drivers move to shared helpers,
but the effort isn't uniform across them. 

Five drivers — hantro_jpeg.c, mxc-jpeg.c, rcar_jpu.c, gspca/jpeg.h, and solo6x10-jpeg.h,
build a fixed byte-array template and patch width/height/table values at hardcoded offsets, 
so they could plausibly migrate to a shared builder with a similar shape to what we're proposing. 
The other two, e5010-jpeg-enc.c and coda-jpeg.c, use incremental byte-by-byte writers instead, 
so their migration would look quite different and isn't a drop-in fit for the same API.

Either way, we don't have access to most of these devices and can't verify the changes ourselves, 
so migrating them is not a simple effort to undertake as part of this series.

> 
>> +#define JFIF_APP0_LENGTH_HI		0x00
>> +#define JFIF_APP0_LENGTH_LO		0x10

<snip>

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

There is plan to add support for more platforms, if the preference is to remove platform based ops now,
and introduce them when new platform is added i am ok with that. But will require more work now and
for the new platform...


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

<snip>

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
I think we can drop those controls and use s_param on output(source) video node as it
was done for some of the other m2m drivers including OPE. Which make sense we tell the
the driver at what rate source buffers will be received, then the driver will choose op
level to satisfy that requirement.

Regards,
~Gjorgji

