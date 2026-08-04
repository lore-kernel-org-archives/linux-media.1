Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EAE33C192
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 05:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785822824; cv=none; b=OmwhWFtN+uRO/Lv7mY3f7YQvlWkhKrLzTi+pAPlx1WUnNJsBLIhqDM0hIFQA7X/HWeYydjS+mqq4PbuHGYJLMFXezqhUSQsdkX8ksRc8TzkG90n+aOjo3z2/cXiM7Eode9uu3ffJWKYiWAxGssqzEY/8A5DbxGd+YDQY7Xw5RGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785822824; c=relaxed/simple;
	bh=XHhRSY392rtrvUELujY9/kChO0yvbVq7TZgifM1PdNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IJb3byTfA4qGTA7l9jxU/p30i3kj4x0jkMwKtiTheRwEBisZuPuoicVMTEjY6QoVtVE9HA2xFUrWEruY/U/wqD/GOpoemMT8FAxZ3KXrzLPYv2Pmxxd8WBIXO9CcADSFdQe1ZQ8yudGaDe8tSraYf+lCXpwCOxVb6vvY9yTNn8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HhxY3CQz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CG2O3PSz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhxY3CQz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CG2O3PSz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67419B9V2266675
	for <linux-media@vger.kernel.org>; Tue, 4 Aug 2026 05:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVkEubtXJ/aIwylNUUOiffEXZNJ7zMtUCnZ/SjA9/fg=; b=HhxY3CQzD8hxVRs4
	lifhLPphRAD36mbWupu6dazsOZ7Ytpl/+H8PdOBwBxd+Cx4fEOgbD/n+HZH1w00G
	FEbrF0cffO6+mMckAEmLT3VlI6s2leQ6w7Icwl+4RC8QAlnIch2i65vrfXDGpDna
	fSVPe21RhTZWhWeP+PjRVyYJzIXt/V5JOjFb71hT33OAWFGq+eINpH/tqa4K+Jbi
	rKNObHB4pkpy0AaTttfp6bMWKLJj9Mz+9tND3QhQD6QDYjigk/80miZtx0T13OFC
	detbvx7T5bGSneLtgHypLmLXApAe6r+jtTqMKo+0Qh2z4x3uC0fNIU/88ezp2zr2
	8ffmCg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty5samsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 05:53:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-526da7e3c9dso37371471cf.1
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 22:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785822820; x=1786427620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVkEubtXJ/aIwylNUUOiffEXZNJ7zMtUCnZ/SjA9/fg=;
        b=CG2O3PSzUgB23a2Anff9j4av1jsNvdH7bY+kyR0ypbuSpIxbyCZ1PCMyLQzAF0rm10
         b4og8+A0AUWjEby/Qn0snV1GJnBiduYg0PKrGtOROvV5NacaFVPzbFeSiBQgxBD9s6ae
         ioX7dDjYVEB5PtNBUBt97BFHISGFTWj7ha1URlt2F5XLTW73J0DHDengUQarbkRcpGXx
         fHggbYYhAHPocbvsvCf1ryXxhT5uO9em94OTVvyoKX7tfXlTLm8ugkh5X5kzSIug3A1a
         dGGdZ8O7+rJ8VJwX+ZImdMBcPGLv+A4dqp+Ohpie6W2+8C2EAwPcmGKDiZn1ud9NSWpZ
         ZtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785822820; x=1786427620;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVkEubtXJ/aIwylNUUOiffEXZNJ7zMtUCnZ/SjA9/fg=;
        b=Y5NeXrhW/Dd5hMmQ6IZRjAQJq1cPFCvoGA5LG5rEPkiHZYAQNJkJnobls3bf3AnD2g
         2MkY+xcyHL65fTB/L1gBQnSnMSDiL3I2K4bmctVdvWM6SdSplskmWiYku99RRXChZwnK
         Fbt62nbzMaqyxdY4O2vudZwmIttgzSzeV8T/+F743DK0nZvyV8WO/XJ2dAxL662rBmpq
         Rd4U0kthcNTEOyCat6Qip5LQTK8vixXabkaF+54WDwwUzF5RDRHBy9e8rUB9Bl/4j0BX
         4OlPLGF6IZbK8w4zXbY2/078tH5wYfVeF/oczNnJ+keMtxkMgBZZ0rUMIANNzTFu0anP
         +b4w==
X-Forwarded-Encrypted: i=1; AHgh+RqRlv/y/VWtkOV6PjYPm5M3wM9OGhgsZ/Q4DRAZX5wk+vkceUKGxNwWUejJkql7XHhZUaU0m/ub/c1isw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKSlB8hmkqSDtF5UlbGRaImlVHmtYc8iVViFOtYOyIbIb8mBkv
	3CJizzK5psvfnkN2Khw5KcGJkE+6B9DUQNQOPK/KvWxcbn/vUQ67lVHDLd6yFmsS6RH5rbwDKZW
	bqwXxCgMkZ9vPe2IOBAqgDxRlcHmkblBbRuhpBJWchDVeKphZ01Mwa2HqrNlEByNUkw==
X-Gm-Gg: AR+sD11BR5N1Zy+CVQDvWygchmrLUFtwQoT3/tNi2hvm+YKmCZtJNn3J5t+zz09FheD
	NjdR+iJIztblLsFq+qMe9dQwOfZ8Cbz7q5FPxXCTfmXZ/IJtP3U14tDEdsrUdDRWTch6ug6PXCH
	cK1Pmrd6J79Qg5O5AAT+8ulDS9oDBWkEKLhLGMnNoE+HPK6UYlAf/S83q0lLvc04ZeUMDe4M3xE
	5gH+pQQsRhe4sNC6zOx94CUcxr0JyJZhFtkfeXN4jFdzeffK2/2yI8nIrqVLzTVm72Dt3AcCTKV
	rPcTxoxkQ5F5yhXAn81v6uQ1y/1QUVMa84XgE3cE/m8y3UtXwVXE8D9JDxiehkPOwqvA0w4GlWU
	UNAUZMu+7fruCfnGihIV2yzJr4hfGoseJYpbRVAmtXxkTUHDlNFk1sh3r9BBZMmSidrnmrn7R
X-Received: by 2002:ac8:7f8e:0:b0:51b:ecbb:206f with SMTP id d75a77b69052e-52b567bff85mr228881491cf.32.1785822820036;
        Mon, 03 Aug 2026 22:53:40 -0700 (PDT)
X-Received: by 2002:ac8:7f8e:0:b0:51b:ecbb:206f with SMTP id d75a77b69052e-52b567bff85mr228881251cf.32.1785822819511;
        Mon, 03 Aug 2026 22:53:39 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c9bc0dsm606536066b.21.2026.08.03.22.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 22:53:38 -0700 (PDT)
Message-ID: <3c70019f-28a9-445c-b2be-fd61fd13be50@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 08:53:36 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-3-atanas.filipov@oss.qualcomm.com>
 <vz6a2qugu7kkci3fcdkd236axr3ur33ghrgoopbrz3isueml45@b4frwo4l2hfh>
 <3f40cde3-a4bd-424d-be42-60915c90e6c3@oss.qualcomm.com>
 <h7e5t6rqvrlogj4li4incr2pog57dfal23rqo326vi2cz4zpxl@m7orpk6dftty>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <h7e5t6rqvrlogj4li4incr2pog57dfal23rqo326vi2cz4zpxl@m7orpk6dftty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SPJykuvH c=1 sm=1 tr=0 ts=6a717e64 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=FfG2V8CkeicKY2sHuwMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: uHlPavi6sA0XXZ6h7dwqPYHkjvkECxCX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA0NCBTYWx0ZWRfXyxI7ihVqnEt1
 GHnRljXYA8xzAHuDhPavL67U3JZI2asOYmWEEL7oaDDUBQfzjh+CeXpuKlNJRNmYEoQLjark+6x
 yu6FAni+I0L4fPnEZQhSqboJjwfjMbKfFRPVOeRD3PQtNht9jfALVHU6ypdtYRxxWkUl7BWXZdh
 DrFR2eE9yE9b/Uy05R39BirgbLQizx1+ea11g95wwenK2euiAm9+H9vTBM2xopf+295ZZbDW5s0
 RXj+1eCyGn8/00CIhqJxKG0TN6ox4m7/wn612mGt5EPSc1JWy19Fb6DcsPC/u1v6UIN5KnKOEeK
 ZwaQV9FJDk0NmMvpPMFDfDV6X05dfJOtGA2f0lj4kF+6J/6kgVrSCVoO0sGOBKn4Pulae7nLWeJ
 K3+hl99ei1S167u+nBFeI8E1W3a1l8bxLa5GAxEOYGfo8uZOBSG0HKR1uBN0ecrYWqS7OIG56Zf
 BrvOhFmesluovZZwFmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA0NCBTYWx0ZWRfX7zSZNRWkCiKz
 BPX8OwNgU+n0gkVYsnZav9S3y+gxKUqx5BEC9gFjEoRyQrEgJJ7KBaSBwA0Eu7UAUjeLkN9QG7p
 rp1ZtSzUsJ0Ku5GOehA2QRYzT3pBT5w=
X-Proofpoint-GUID: uHlPavi6sA0XXZ6h7dwqPYHkjvkECxCX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040044

Hi Dmitry,

On 8/3/2026 9:37 PM, Dmitry Baryshkov wrote:
> On Mon, Aug 03, 2026 at 06:57:09PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
>> Hi Dmitry, 
>>
>> On 7/30/2026 6:57 PM, Dmitry Baryshkov wrote:
>>> On Thu, Jul 30, 2026 at 06:05:23PM +0300, Atanas Filipov wrote:
>>>> Add a Qualcomm JPEG encoder driver implemented on top of the
>>>> V4L2 mem2mem framework.
>>>>
>>>> The driver wires vb2 queue handling, format negotiation, JPEG header
>>>> handling, interrupt-driven job completion, and runtime PM/clock/ICC
>>>> integration for the standalone JPEG encode hardware block.
>>>>
>>
>> <snip>
>>
>>>> + */
>>>> +
>>>> +#define JFIF_HEADER_WIDTH_OFFS		0x07
>>>> +#define JFIF_HEADER_HEIGHT_OFFS		0x05
>>>
>>> And you've ignored feedback here. PLEASE move all standard-related
>>> defines and code to the common helpers. Are there any other drivers
>>> which construct JPEG files manually? If not, you are lucky and you can
>>> just push you code. If they are, find a way to unify the codebase.
>>>
>>> At the very least, it would make you split this commit into at least
>>> two, making them more readable.
>>
>> Yes, this comment was incorporated, maybe partially, or it wasn't fully understood.
>> The helper is used for the quantization tables and wherever helpers are available, 
>> similar to other drivers: hantro_jpeg.c, e5010-jpeg-enc.c.
>>
>> The missing JFIF tags and additional helpers can certainly be added,
>> but is holding up the current driver just for that a reasonable ask? 
>> This discussion may continue for a long time — is it reasonable to wait that long?
> 
> From my point of view, yes. From your comment it feels like each driver
> having their own way of wriing JPEG framings.
> 
>>
>> I agree it would be good to have all other upstream JPEG encoder drivers move to shared helpers,
>> but the effort isn't uniform across them. 
>>
>> Five drivers — hantro_jpeg.c, mxc-jpeg.c, rcar_jpu.c, gspca/jpeg.h, and solo6x10-jpeg.h,
>> build a fixed byte-array template and patch width/height/table values at hardcoded offsets, 
>> so they could plausibly migrate to a shared builder with a similar shape to what we're proposing. 
> 
> Can we start with something as simple as this for our driver too?

Yes i agree we can add helpers, and qcom jpeg to be first driver to use them.

> 
> Then you can converge all these drivers to use those simple helpers
> (this should not require the actual hardware to test), then improve the
> helpers.

I don not fell confident to touch other platform drivers which i can not verify, but i think
that can be done as part of separate patchset after initial helpers are reviewed-merged.

> 
>> The other two, e5010-jpeg-enc.c and coda-jpeg.c, use incremental byte-by-byte writers instead, 
>> so their migration would look quite different and isn't a drop-in fit for the same API.
> 
> Ok, these are more difficult cases.
> 
>>
>> Either way, we don't have access to most of these devices and can't verify the changes ourselves, 
>> so migrating them is not a simple effort to undertake as part of this series.
> 
> Which reads: "we already have 7 different implementations of JPEG
> framing / file format, can we add 8th?" The typical answer would be
> "no".

Yes i agree we will add helpers and be qcom jpeg as first driver uses those.

> 
>>
>>>
>>>> +#define JFIF_APP0_LENGTH_HI		0x00
>>>> +#define JFIF_APP0_LENGTH_LO		0x10
>>
>> <snip>
>>
>>>> +#include "qcom_jenc_dev.h"
>>>> +
>>>> +/*
>>>> + * JENC encoder hardware operations.
>>>> + */
>>>> +struct qcom_jpeg_hw_ops {
>>>> +	void (*hw_get_cap)
>>>> +		(struct qcom_jenc_dev *jenc_dev, u32 *hw_caps);
>>>> +
>>>> +	int (*hw_acquire)
>>>> +		(struct jenc_context *ectx, struct vb2_queue *queue);
>>>> +
>>>> +	int (*hw_release)
>>>> +		(struct jenc_context *ectx, struct vb2_queue *queue);
>>>> +
>>>> +	int (*hw_prepare)
>>>> +		(struct qcom_jenc_dev *jenc);
>>>> +
>>>> +	struct qcom_jenc_queue * (*get_queue)
>>>> +		(struct jenc_context *ectx, enum qcom_enc_qid id);
>>>> +
>>>> +	int (*queue_setup)
>>>> +		(struct jenc_context *ectx, enum qcom_enc_qid id);
>>>> +
>>>> +	int (*src_fmt_update)
>>>> +		(struct jenc_context *ectx, u32 old_fourcc, u32 new_fourcc);
>>>> +
>>>> +	int (*buf_prepare)
>>>> +		(struct jenc_context *ectx, struct vb2_buffer *vb2);
>>>> +
>>>> +	int (*process_exec)
>>>> +		(struct qcom_jenc_dev *jenc, struct jenc_context *ectx, struct vb2_buffer *vb2);
>>>> +
>>>> +	irqreturn_t (*hw_irq_top)(int irq_num, void *data);
>>>> +	irqreturn_t (*hw_irq_bot)(int irq_num, void *data);
>>>
>>> How many non-default platforms do you support? Zero?
>>>
>>> Drop the call table.
>>
>> There is plan to add support for more platforms, if the preference is to remove platform based ops now,
>> and introduce them when new platform is added i am ok with that. But will require more work now and
>> for the new platform...
> 
> Yes. When you add a platform, we (reviewers) can see, what exactly is
> required for that platform. For now, you are adding complexity for no
> added value.

Ok the ops will be dropped in next patchset.

~Gjorgji

> 
>>>> +
>>>> +/*
>>>> + * V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO - enable adaptive performance scaling.
>>>> + *
>>>> + * When set to 1 the driver selects the core clock OPP level based on the
>>>> + * encoded frame resolution and fps target. When set to 0 (default) the
>>>> + * driver always runs at NOMINAL (highest) OPP level.
>>>> + */
>>>> +#define V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO	(V4L2_CID_USER_QCOM_JENC_BASE + 0)
>>>> +
>>>> +/*
>>>> + * V4L2_CID_QCOM_JPEG_FPS_TARGET - target encode rate in frames per second.
>>>> + *
>>>> + * Used together with V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO to select the lowest
>>>> + * OPP level whose throughput is sufficient for the requested frame rate.
>>>> + * Has no effect when perf_level_auto is 0. Range: 1-240, default: 30.
>>>
>>> I assume 1-240 is only applicable to your driver.
>>>
>> I think we can drop those controls and use s_param on output(source) video node as it
>> was done for some of the other m2m drivers including OPE. Which make sense we tell the
>> the driver at what rate source buffers will be received, then the driver will choose op
>> level to satisfy that requirement.
> 
> Ok (if you say that there are other m2m drivers doing this).
> 

