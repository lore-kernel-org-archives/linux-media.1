Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C699F443E44;
	Tue, 21 Jul 2026 22:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672201; cv=none; b=YyCOc9JuXNnd1awMK4Pjqp96YlPGEcLkR2Xx/APoZ5ea5j+eyVwbqtTaJPQqbqtTRJL+JiZiKM2we334c6QP66eMDgYwPVW43zk3EJHEVROWon6sMIj6LsW8v0MDoMOrB0EJcnaYw0na5ViEhOuyrzq18LMRoAaGXapLt3WQI4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672201; c=relaxed/simple;
	bh=WyzqSykE73WG2LXx72bjVhe31Vg614ZIpRj9HsbQAps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jVxG9iYnkwBiKAw11th782jlL7m4WUoK4No8N5y3KUa8U55aUOHhUGvPlPO1U8ndXsm0+B8zt3WcTu/DWq2Q6VC0cmliSkxRbsgyy8r3XEOXz6tbIt9b39hePdb0rsynMzRuZLwgmd+0TxBMFapiy+ZaajJ9MUk2RdhhkwpUbWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OL3RFqDT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OL3RFqDT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C047B1F00A3A;
	Tue, 21 Jul 2026 22:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784672200;
	bh=QDDAanHu/gGM/wyr/cAnZkKIwgBEHbVsJiB/kzlamE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OL3RFqDTsxNmkXykXwXAXs68iZvWSBGPBkX9k+rbywq/5L//BzK3k+w+0x/4jpNV8
	 m8h2gjd6PZPQWlz9/iQm4ru4ukwe9aE445iN0aJAo7M4DU/V1D0I+gNlnYf34dwhfl
	 kLuXZh8q3+JhSW0yfU5GiKbDFwfr19oE3pvEX88bBDoYPueDCIDAuWi5VLrGMFWhwq
	 qaE0AHQYWLAN09/bNWs4N1SawlHIDa3hU1v6cT8gsz5Rx5UIxlVvAhU2oEd3oENT1q
	 +qCE5mGUXoeU0rh2tb4NyS/ZylQhFuuQJjCT8mfK07RkCoMQHOSgAORcrNfipXsAc9
	 tr27uyujLQn5w==
Message-ID: <e6b1ee5c-da61-4334-9450-d9cb2e7c05ee@kernel.org>
Date: Tue, 21 Jul 2026 23:16:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/18] media: iris: Filter UBWC raw formats based on
 hardware capabilities
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-4-76af9dd4d1f6@oss.qualcomm.com>
 <5d213d08-8e00-4e7e-93ae-ba05f22f09e7@oss.qualcomm.com>
 <CAO9ioeW3y0ck2k3H2XK4W7z6YCFO6nuENN6=SmKxjQjNUNKWPw@mail.gmail.com>
 <pg_LiPVcP-SCcSrY6h5V1eEiD4KpYf-r_Ext8kFqdjKN6FAIqYP9AwoUTOs9THCufaMrDD3alFSp87FYRYHX6w==@protonmail.internalid>
 <2323abe7-ecd3-4504-8790-ef1a2dacec8f@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <2323abe7-ecd3-4504-8790-ef1a2dacec8f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/07/2026 17:23, Vikash Garodia wrote:
> 
> On 7/21/2026 8:34 PM, Dmitry Baryshkov wrote:
>> On Tue, 21 Jul 2026 at 17:08, Vikash Garodia
>> <vikash.garodia@oss.qualcomm.com> wrote:
>>>
>>>
>>> On 7/9/2026 7:11 PM, Dmitry Baryshkov wrote:
>>>> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>>
>>>> The raw formats supported by Iris were previously advertised
>>>> unconditionally, assuming UBWC support on all platforms. However, some
>>>> platforms do not support UBWC which results in incorrect format
>>>> capability exposure.
>>>>
>>>> Use the UBWC configuration provided by the platform to dynamically
>>>> filter raw formats at runtime. If UBWC is not supported, UBWC-based
>>>> formats are omitted from the advertised capability list, while linear
>>>> formats remain available.
>>>>
>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> ---
>>>>     drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
>>>>     drivers/media/platform/qcom/iris/iris_venc.c | 25 +++++++++++++++++++++----
>>>>     2 files changed, 43 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>>>> index 4c8bc7aac135..9fee5f28097d 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>>> @@ -3,6 +3,7 @@
>>>>      * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>      */
>>>>
>>>> +#include <linux/soc/qcom/ubwc.h>
>>>>     #include <media/v4l2-event.h>
>>>>     #include <media/v4l2-mem2mem.h>
>>>>
>>>> @@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
>>>>         V4L2_PIX_FMT_QC10C,
>>>>     };
>>>>
>>>> +static const u32 iris_vdec_formats_noubwc_cap[] = {
>>>> +     V4L2_PIX_FMT_NV12,
>>>> +     V4L2_PIX_FMT_P010,
>>>> +};
>>>> +
>>>>     static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>>>>     {
>>>> +     const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>>>>         unsigned int size, i;
>>>>         const u32 *fmt;
>>>>
>>>> @@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>>>>                 size = inst->core->iris_platform_data->inst_iris_fmts_size;
>>>>                 break;
>>>>         case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>>>> -             fmt = iris_vdec_formats_cap;
>>>> -             size = ARRAY_SIZE(iris_vdec_formats_cap);
>>>> +             if (ubwc->ubwc_enc_version) {
>>>
>>> Do you see a possibility that ubwc is enabled for a SOC while VPU
>>> hardware does not support UBWC. IP document for qcom,qcm2290 lists some
>>> UBWC configuration, while VPU does not support UBWC. Not sure at this
>>> point if other blocks indeed support UBWC for qcom,qcm2290.
>>
>> No, QCM2290 doesn't really support UBWC between the IP cores (as such
>> it has ubwc_enc_version = 0).
>> Currently the database defines a least common denominator for all IP
>> cores. If we ever get to a point where we want to define UBWC params
>> per the core, we will need to restructure the database.
>>
> 
> Ack.
> 
> 

Ack-by ?

---
bod
