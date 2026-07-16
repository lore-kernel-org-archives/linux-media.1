Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56360311C15
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 21:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784239003; cv=none; b=RQsxYqs0nmiXiOals2A44BXSrviri5KSEYCGgjGv2UrUppC69rwz+8c0/YbaKuVtmkAKrXuPBAA2ramLeU/h0mknew6vJXl5u6hfUaALl3hS01eqJ/40HMQLuR889QBm7y45NBKTwbfwp8JDFe0SgT6nVwwlKO6jqXsPjZxlWBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784239003; c=relaxed/simple;
	bh=pgwja98KWhc4kw4st286JvtOAxBEC2rPbK87Xm7Jnq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVt8b6h00QXv+ZOEmPRJtaoI9PMW2WW2xuxyK+4Y1YoXnACZg/mDLsJKvizk480j2AoNGtkrs6hoWgLN/t8+SQVlgva9pgBQO+oABWc63BLkYtYjnTl9p0m4XDGGFFNuc+u4qT5RoZW1XAiZPXo849k0C0AcjJr2fcau/qhJTxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABPJPRsn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VStQB8hW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABPJPRsn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VStQB8hW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GJob0P3933347
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 21:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EP9xHmxax1m7OrYGlm9544i1gZkpkIm81tp/BHiXlz8=; b=ABPJPRsnwpOyhFHL
	R/k1R3GohXG/YkPWnts7f4tXFdKtCFpsZS6XHVBOzL4C2KvVTc+uosRZ/Ly6Clpb
	5vdH0R6uayp6VLKe7rODNZ1lP7v6L8T5nFFhXRSyzIez27PgsevDm/3S349lRDn5
	rhpPRlluvoHfEqtwFiSvKo5EA6TTrLk8xYOz4U8BOKtVKMvva6OSuHI5KODWMpnO
	uCzEInW8u7yoJgbab+2Q5dq5MSx45maoO1jlcCNNYmEJtAXkU1JRhLSZ+3jw5ThE
	wtuBXU358ANBx7LYMQVhbVWxjKTi8RxDZIbEFAF8IX6Crr6Pv6KcnVx9GUuZDdkg
	Njz0Nw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf3mrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 21:56:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8487cca4d10so1434024b3a.2
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 14:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784239001; x=1784843801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EP9xHmxax1m7OrYGlm9544i1gZkpkIm81tp/BHiXlz8=;
        b=VStQB8hWQl3NODrLQwg5TcPNNFtaZuhw4HF8T/8nS7uJHDpZV0CRgrpe2re4ai0U9Z
         INssC7tMCLiFc8MReLIeMv1zE+s27wtH4xDCgDrm/URReyX5GsnDcRJMuhPoxbOMmY+N
         69WoLfRC21DEI32K2GGkdkQH0QS2azunYYfiUGJE54iwBZUzlF8hSAfHgRPVnzG39bQG
         udaUiEWf7U2IvyLlyzoPmvQxIqq+MHSthBkvFSVEnC2YhqpSS971lLjc3FVXbWeFCkBy
         0q5B4sKShjH+eplcVvxygJD5e3aaqJuYeRr5plLtvUkMYFaPNm84qoKL1VhesGHZvIwm
         TDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784239001; x=1784843801;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EP9xHmxax1m7OrYGlm9544i1gZkpkIm81tp/BHiXlz8=;
        b=oZ8oTxA9aFVX5g1/iNKFSb1LGs67f6O1tyHDKv1j6Kbv3zY5EPNHxlkA8q0O5sFmOb
         zizYgo/bFnrBP2dO6VZw61KEBrXocZ7lRp4C+skk+kvAMjEFcdbu/GijadqOTuouZrPQ
         pG76QIvXUQczHhliR09rsdT3yLPyi0m9ggWjfsUlasluyfbZr9gpB1bzca95sNwDLXI2
         WIeEJ+f06GsqX7uVmjTSA3M4Z5O4UyJEv0QTzhjqzuZGbGLicKr9FaGouvG5+8KCBB2s
         AE1JoR03n8ePww7+3hSDCVRdUFE9qRZJbIWd5WKjzgJ1urEQ6skG3tn94qGT+Xm7ASt7
         fA/A==
X-Gm-Message-State: AOJu0YwBroBSDf/PeeBicLDJu2rVnqxGnz2VQ4yqp2Ni5ZdWRiQEHlQS
	UGNhPx1WE/eflVN34SMAj+9smGzZ9NjSVXbzyCPJzCVxFnLS9HcrHTLqsg8sNabs+vvtQd9b7ck
	p3nVl4V4ZcTc3hwXHOVY/fgCjgFg2uFiwH6GL7t1XshAsmFSBEpOCBpCI3sP7LszXBw==
X-Gm-Gg: AfdE7cmZwTfg+ggjvg/1XzKldpGBfCJasPSTzZcJA7+LyQflnslhULmERikskGVL9ry
	upnWtk3xj1u4rH55fbHQLfy2H0zvzLebcpD/o50qe84ZsOBbwv2KTzSWXPiIkYKH72GkPHsOZDA
	eFZD8ZtlbGeLIRs8Hdw+NpGY8k/Jkjw3gmaQQ122y0RQWTt5dyuJu6AUrSQHaOyybcjcSBJ3Cn5
	JoUpY2jKBDqEcF0nsoXbikq5C9gJiRyj4SpYiQ+ERxIFGgMwQlw9g7/tGu3df3+JEgf1N2zFbef
	se3HNRThp34mvQlYGCm0cJw/cf50bmdnJhod7/jorwABbAmnSXMA+RQ2qvYyiswvrJXU5OJv07Z
	i+GwvuaCjw/cyA0c+vV/CyOhguc0hD20Bwd87S/Mk473VK8VvW/xQrkhHbHe1Ips=
X-Received: by 2002:a05:6a20:1602:b0:3c3:5e14:461b with SMTP id adf61e73a8af0-3c35e14490dmr9133878637.5.1784239000636;
        Thu, 16 Jul 2026 14:56:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:1602:b0:3c3:5e14:461b with SMTP id adf61e73a8af0-3c35e14490dmr9133854637.5.1784239000150;
        Thu, 16 Jul 2026 14:56:40 -0700 (PDT)
Received: from [10.110.18.204] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd429cee1sm22342867c88.6.2026.07.16.14.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 14:56:39 -0700 (PDT)
Message-ID: <c1527228-f2ae-4e1a-a0ee-edab987bb0c1@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 14:56:38 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: v4l2-core: Add support for video encoder
 ROI control
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260714-enc_roi_enable-v2-0-63683f9dbcef@oss.qualcomm.com>
 <20260714-enc_roi_enable-v2-2-63683f9dbcef@oss.qualcomm.com>
 <1ef14047-f385-4163-ad9d-414702f45695@kernel.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <1ef14047-f385-4163-ad9d-414702f45695@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LSuYESZfuLsQTgdFUCPQfx9ppGB0372e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDIyMyBTYWx0ZWRfX69Mk3/EUkeJL
 nWM0qHVH0JPk8Gx2p8ox3aYgBNsnVTk1FPTgtfb6Rij6PSOPC4AX1L6kbIzynXTfft40S8fXU8g
 El1s8Modalo2mr0EgiSWd5bvuFQakEiOV0/GDfY9YjR2kiZHEuZPFbCN3mavsLFJ7ijAN+xdjGO
 R0A+1st17zb3fXwbDLZWjPJGtBy8nuP8pM5Ds2fL3S1xpG1EjT/5E3xoZUezxeoCLpMyjqRCGoC
 MTBC2IwHNtqE/G+13PMXKg8B4CnCa/KTQwGNLcNCoGRYK5cETfbCKCBrbzSAsFnyrGpjMtRw6kB
 YvWfRU6jqg9khfAdsAaSInc+W6HMola4pHlg8ui/BuchKsKl2B1uFxpno3+Kfswx73eUL6F0N/q
 GDMU91l5tYE/BIlwhOL6psLaHJgNul4uQA7mxqgpUok/r0G3yYw235i93dz58VfvgBVtwA3a40I
 3yxDHFksuEPwltDz3iQ==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a595399 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=DhWgoFBMIlCVeNEoBtYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: LSuYESZfuLsQTgdFUCPQfx9ppGB0372e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDIyMyBTYWx0ZWRfX+pzmMXC/Iz6M
 9qQHzWQI18DJhZcRsnpJHrLfd3ZBHJw6oe1ZOpZTkeyC03O/b2EEeqCYQD28pZkM6Zok0hNSj3l
 /e8lECHBWb6xA/g5s2juq40g1RFQz0A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_07,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160223


On 7/15/2026 1:32 AM, Hans Verkuil wrote:
> On 14/07/2026 21:00, Deepa Guthyappa Madivalara wrote:
>> Add necessary support for controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
>> and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-ctrls-api.c  |  1 +
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c | 40 +++++++++++++++++++++++++++++--
>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c | 10 ++++++++
>>   include/media/v4l2-ctrls.h                |  3 ++-
>>   4 files changed, 51 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
>> index 93d8d4012d0f4fef004e417d0aee2ae44b1b30bd..7d41cfd7378baaa929d4da0266c45f731bb54285 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
>> @@ -980,6 +980,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
>>   	case V4L2_CTRL_TYPE_U8:
>>   	case V4L2_CTRL_TYPE_U16:
>>   	case V4L2_CTRL_TYPE_U32:
>> +	case V4L2_CTRL_TYPE_S8:
>>   		if (ctrl->is_array)
>>   			return -EINVAL;
>>   		ret = check_range(ctrl->type, min, max, step, def);
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> index ba047d7d86010bf0cf8f8fbf2dc343883d6bdae0..15b69dce0127e7c8546c2d23ae5458ace10301a0 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> @@ -287,6 +287,14 @@ static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
>>   			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
>>   		}
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		if (value) {
>> +			for (i = from_idx; i < tot_elems; i++)
>> +				ptr.p_s8[i] = value;
>> +		} else {
>> +			memset(ptr.p_s8 + from_idx, 0, elems * sizeof(s8));
>> +		}
>> +		break;
>>   	default:
>>   		for (i = from_idx; i < tot_elems; i++) {
>>   			switch (which) {
>> @@ -367,6 +375,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>>   	case V4L2_CTRL_TYPE_U32:
>>   		pr_cont("%u", (unsigned)*ptr.p_u32);
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		pr_cont("%d", *ptr.p_s8);
>> +		break;
>>   	case V4L2_CTRL_TYPE_AREA:
>>   		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
>>   		break;
>> @@ -481,6 +492,21 @@ EXPORT_SYMBOL(v4l2_ctrl_type_op_log);
>>   	0;							\
>>   })
>>   
>> +#define ROUND_TO_RANGE_SIGNED(val, offset_type, ctrl)			\
>> +({								\
>> +	offset_type offset;					\
>> +	if ((ctrl)->maximum >= 0 &&				\
>> +	    val >= (ctrl)->maximum - (s32)((ctrl)->step / 2))	\
>> +		val = (ctrl)->maximum;				\
>> +	else							\
>> +		val += (s32)((ctrl)->step / 2);			\
>> +	val = clamp_t(typeof(val), val,				\
>> +		      (ctrl)->minimum, (ctrl)->maximum);	\
>> +	offset = (val) - (ctrl)->minimum;			\
>> +	offset = (ctrl)->step * (offset / (s32)(ctrl)->step);	\
>> +	val = (ctrl)->minimum + offset;				\
>> +})
> Why is this new define needed? I think you can just use ROUND_TO_RANGE.
>
> Regards,
>
> 	Hans
> Agreed. Works the same for negative s8 values. I calculated this wrong way.
> Will revert the change in v3.
>> +
>>   /* Validate a new control */
>>   
>>   #define zero_padding(s) \
>> @@ -1365,6 +1391,8 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>   			return -EINVAL;
>>   		break;
>>   
>> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
>> +		break;
>>   	default:
>>   		return -EINVAL;
>>   	}
>> @@ -1378,6 +1406,7 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
>>   	size_t len;
>>   	u64 offset;
>>   	s64 val;
>> +	s32 tmp;
>>   
>>   	switch ((u32)ctrl->type) {
>>   	case V4L2_CTRL_TYPE_INTEGER:
>> @@ -1403,7 +1432,11 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
>>   		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
>>   	case V4L2_CTRL_TYPE_U32:
>>   		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
>> -
>> +	case V4L2_CTRL_TYPE_S8:
>> +		tmp = ptr.p_s8[idx];
>> +		ROUND_TO_RANGE_SIGNED(tmp, s32, ctrl);
>> +		ptr.p_s8[idx] = (s8)tmp;
>> +		return 0;
>>   	case V4L2_CTRL_TYPE_BOOLEAN:
>>   		ptr.p_s32[idx] = !!ptr.p_s32[idx];
>>   		return 0;
>> @@ -1556,6 +1589,7 @@ void cur_to_new(struct v4l2_ctrl *ctrl)
>>   		return;
>>   	if (ctrl->is_dyn_array)
>>   		ctrl->new_elems = ctrl->elems;
>> +
>>   	ptr_to_ptr(ctrl, ctrl->p_cur, ctrl->p_new, ctrl->new_elems);
>>   }
>>   
>> @@ -1998,6 +2032,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>   	case V4L2_CTRL_TYPE_U32:
>>   		elem_size = sizeof(u32);
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		elem_size = sizeof(s8);
>> +		break;
>>   	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
>>   		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
>>   		break;
>> @@ -2215,7 +2252,6 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>   
>>   	if (flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX) {
>>   		void *ptr = ctrl->p_def.p;
>> -
>>   		if (p_min.p_const) {
>>   			ptr += elem_size;
>>   			ctrl->p_min.p = ptr;
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> index e062f2088490470c42d6c579ff7675be454a29b0..8f895060799ea13443143edd398dfb97f4ba0085 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> @@ -974,6 +974,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>>   	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
>>   	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
>>   	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
>> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:		return "Encoder ROI MB Delta QP";
>> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:			return "Encoder ROI MB Size";
>>   
>>   	/* VPX controls */
>>   	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
>> @@ -1622,6 +1624,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>   	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
>>   		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
>>   		break;
>> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
>> +		*type = V4L2_CTRL_TYPE_S8;
>> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
>> +		*type = V4L2_CTRL_TYPE_U8;
>> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +		break;
>>   	default:
>>   		*type = V4L2_CTRL_TYPE_INTEGER;
>>   		break;
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index a1806ddbc797efa52e83cd3f685ef70d5b5483d2..9a68a3555e349f1e55aa01af5c10f08201d62bae 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -27,6 +27,7 @@ struct video_device;
>>   
>>   /**
>>    * union v4l2_ctrl_ptr - A pointer to a control value.
>> + * @p_s8:			Pointer to a 8-bit signed value.
>>    * @p_s32:			Pointer to a 32-bit signed value.
>>    * @p_s64:			Pointer to a 64-bit signed value.
>>    * @p_u8:			Pointer to a 8-bit unsigned value.
>> @@ -61,10 +62,10 @@ struct video_device;
>>    * @p_const:			Pointer to a constant compound value.
>>    */
>>   union v4l2_ctrl_ptr {
>> +	s8 *p_s8;
>>   	s32 *p_s32;
>>   	s64 *p_s64;
>>   	u8 *p_u8;
>> -	s8 *p_s8;
>>   	u16 *p_u16;
>>   	u32 *p_u32;
>>   	char *p_char;
>>
