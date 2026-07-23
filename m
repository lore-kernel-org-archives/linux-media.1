Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB7541D11C
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802706; cv=none; b=Zp5CG8iLMtOQtThzcOl2jJclulzP1uz8UxABY2ZQO/5QTz/oTpkvy4IZDweWrtXZQwxsc01FtO7QzBRkoT6WjV+pkDtFTa57qMCwM9qGgSdgEhpi+v9Aa1hvV+8KevTdf44sUnrTMZ0JjhZ6VMOYwca1r07oRC+ZeqRo4gYD8OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802706; c=relaxed/simple;
	bh=yujYhSKYK3yqqN/TLcpX6CDi6bkpCr45nFIRjjnCLNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mSQSpZ8L2WSJMK+Oa9Kq5A1T99iueSyFjaEteEyPOs563Q3sT2qGibHZD0Fcut5Qk/vExoM0b2Yqog/viit72JAamaz5erwxPrsRWtU+wvaCq9/pXREOSVtk6q+TZ+M8bvxjzoD7oCbvTHNq2/i9kBdUlelmEa9HDtE7dX7SFgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MeqGFKUF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awXsgIOl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MeqGFKUF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awXsgIOl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qbhK3606118
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZdVYKkoP+85K6jPLhl/MMZfDZ6EbFHZ0GvyaExASNh8=; b=MeqGFKUFnnp2Vrot
	9SCB5bv6/9f9bKsaGe+TZXtOqPsbu7TGV7Y/8jAjiajh44XHAH1xQRvAgG9Cy6a+
	Uzez9XD7mWH1/ckWPe0/4UxdlYA2HGeU7n60BAw32Muya++wjaD8E+Z6AlEZVLT+
	RxbGIvl8zBL1byfNhBjvoNoTTzqi3XEA5IDnSqZ6OGU2y+mpVA36lJaCp5Scwbtp
	6bu8gjrecrOetxxLtouAMg+N0QIhX1D1CcVuoguiYLHyEiaOmFVi6Z6lLbQm8nMv
	r6pLg+f3dn3WEY7cFN5QeyXHiFdgC4SVNgWRFjWBqEuhe3bKU1Dii8D08V9byTQp
	qvZHBg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qgtp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:31:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484b9fb055so1222863b3a.0
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 03:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784802697; x=1785407497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZdVYKkoP+85K6jPLhl/MMZfDZ6EbFHZ0GvyaExASNh8=;
        b=awXsgIOlFMxbYFL3QmUomMxyW4OvxFI8FTIAXpMRJGWiclmh+mKHECm/jMxNftfzSd
         b6E8EiaVu1ZQukPZdZzLocvXpOBjlCxTlb2Sy1pC15nT9DX9S1hi6YzrIAj/px8LS+M/
         BymNe2fLrF8yli72AC7QvCLaFjkqMKa1qQFfOVI/iRq/Cw1WobRu817O3tdvZmJaA/q9
         Z56Wtg2d+t4jzj0uFl0Y/Lzy8zidAq6+69/1ozm95M76CVc2BdQa30Th9h2PRoEm258L
         yzASYGknVk7t63bAdzIf1QZpH9y5bWwKRtGZhwn+rr2HlNPGdGkiwDb2uvBam2ZqNpVi
         M1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802697; x=1785407497;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZdVYKkoP+85K6jPLhl/MMZfDZ6EbFHZ0GvyaExASNh8=;
        b=obAz5xjpoQ/xwWQe4Uj6EzXjE0+wGLonEcXbgVpiHk8d3anqD+p0eVQV4tPLo4slAP
         SLE7joiEiYsvzBju23V8BmQfSf5xp/rZJoa3N4Q63yCZJ96qBww18N+GrN+6VSjdqgHP
         8omeghE6tPKKfQeoluZtvltbMSwgJPPR2aWk16+66Q2/vhhyW2A7NEbY4XzBeekVczwB
         7+dWy9zI9FFaIGIbofsJ/qfhLlQIPeOvIOG98lECvFrwkbLyCLtuVoaTOTEW12ChFXLG
         t5mR3FSSaoSymdcMlM6+qVEvV170CR3+Iue0b7Jvurcet7u7+STLHwd2qzHZ2gcHvr6I
         Ru5Q==
X-Gm-Message-State: AOJu0Yz/Flpqor7UsJuOyWhM0nKx+S2l35O7nHJ3K38VAFJPRZO3+xRM
	UCZ1dHW2kYgDdq6bE5rayM8GwNeuCWtDCzbeAnZFicbvq8pi81LvKjctgrbY1LZGDDWcprMO0CI
	KLNN2IjbUAiFYdKvgq4FWliN0G7Gr6WefYaTbRbYJ9IRKvWJZj7VtQL1CybWvtJfeQA==
X-Gm-Gg: AR+sD11RO53X979xoAcfOmSVA2TzP/Xfj/QHyyBgJxegtBh/Op2lRznyRjuHtJIhF4C
	FxVCoFQPo6Qe7TtNG/KFFJebQK8e1fpghETtrUBeJ5AxUd7jG/8rr9gO9awKEnMt1Td1cfwQmiZ
	oMtYl5bgTlP350juFOzZ/uZZo2smrDg+c8or72Twx3Gd3d24cajRUowEl+daE6J+I0A+66pYW9O
	JzOT+2QYnV62FaCpxRE1ksm6I95eWSnL+WIKj4r0fCICweSmzYHVv7GXV1isLESpyAFQv4eaQ+D
	UqdC6QnZ9YcIEMqZJfeDMVgrubwPd1digsg2oUviQnE2cmiyxHK5MgRCLFo1V3dZ3tDGjnaKt+w
	b0mpm2DVjyORw6W7DAFZZaooDF3w=
X-Received: by 2002:a05:6a00:4ac6:b0:848:2f77:e2d8 with SMTP id d2e1a72fcca58-84e2c226092mr2945920b3a.65.1784802696995;
        Thu, 23 Jul 2026 03:31:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:4ac6:b0:848:2f77:e2d8 with SMTP id d2e1a72fcca58-84e2c226092mr2945879b3a.65.1784802696415;
        Thu, 23 Jul 2026 03:31:36 -0700 (PDT)
Received: from [10.218.25.31] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a9967sm2509143a12.25.2026.07.23.03.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 03:31:35 -0700 (PDT)
Message-ID: <fbcb67b9-8713-46e2-809b-9b1a212f7b21@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:01:32 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: iris: add support for multi_slice in iris
 encoder
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260721-iris_multi_slice-v3-0-adc61a687e7e@oss.qualcomm.com>
 <20260721-iris_multi_slice-v3-2-adc61a687e7e@oss.qualcomm.com>
 <330f7704-728e-4671-a9bf-fdf0a5c0f7dd@oss.qualcomm.com>
Content-Language: en-US
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
In-Reply-To: <330f7704-728e-4671-a9bf-fdf0a5c0f7dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMyBTYWx0ZWRfX3t8DiXsZPp4w
 b91eNGxuMPD43qBeDUgShxYYlkohfdZCpjFeshrvKkuMMdmC6eEE4vt/fXItM4+saeEA1d5WVJ4
 ABctqzpHyQhg1x3QeRfGuhHSIQnPB28=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a61ed8f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gbC14J6bJ_QUZsjE_EUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: FS2e6UM98WaQGursdZwZzO6v_2CZLwMj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMyBTYWx0ZWRfXxkjTkBbtAuOw
 6K7yGXIjai7bkNwFcSZ+zpycxIWwFX8mtw4+PVRi+kxPR7hnTm88IpETLMsw0pDEdLEysc/i/8w
 xwopElVGg+NZUuIEZnjvwMNOYIpcBUaQ1wF1JENwONUXKu6MvhCc/bmQFUdNOZEnLJmefcnI/5E
 +W9JckYhlHPCnhWQj6arq1L9aqMzfOOOlN4ep7I78UY+Y2SvcHlL+jjoPeiNGUH0oNQKd1z98DY
 DwYjnggbEcvX5bwV3cq36zemtXXMnNFohxPtIB3ui2diM9zi40UgmWwRimlB6JqJ0bSsaKwTwVH
 BOLkEuBNQTZ9gyf8pqrPE1GUfDPcq+VDscFNITg+vG5iAwKHRxbC8hgVo4E+eKJVDuz4GoVJDds
 HAPJMnxHrYb4q0zsnIBCybkXW5HPWk8jG9DWy/XZB/Kjfumn2SP/vVoSogV0lWbe4Nkqi8ElYRr
 3BqWAWk0UH3a3uW660A==
X-Proofpoint-ORIG-GUID: FS2e6UM98WaQGursdZwZzO6v_2CZLwMj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230103



On 7/22/2026 11:31 AM, Vikash Garodia wrote:
> 
> On 7/21/2026 3:23 PM, Sachin Kumar Garg wrote:
>> Add multi-slice encoding support with MAX_MB and MAX_BYTES modes.
>>
>> Clients can enable slice mode using V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
>> control and configure slice size via 
>> V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
>> or V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES controls.
>>
>> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 82 ++++++++++++ 
>> ++++++++++
>>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 33 ++++++++-
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
>>   .../platform/qcom/iris/iris_platform_common.h      | 12 ++++
>>   .../platform/qcom/iris/iris_platform_qcs8300.h     |  9 +++
>>   .../platform/qcom/iris/iris_platform_sm8550.h      |  9 +++
>>   .../media/platform/qcom/iris/iris_platform_vpu2.c  |  9 +++
>>   8 files changed, 156 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/ 
>> media/platform/qcom/iris/iris_ctrls.c
>> index d7cbf6c3614a..36ccb9918921 100644
>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> @@ -154,6 +154,12 @@ static enum platform_inst_fw_cap_type 
>> iris_get_cap_id(u32 id)
>>           return LAYER4_BITRATE_HEVC;
>>       case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
>>           return LAYER5_BITRATE_HEVC;
>> +    case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
>> +        return SLICE_MODE;
>> +    case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:
>> +        return SLICE_MAX_BYTES;
>> +    case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
>> +        return SLICE_MAX_MB;
>>       default:
>>           return INST_FW_CAP_MAX;
>>       }
>> @@ -297,6 +303,12 @@ static u32 iris_get_v4l2_id(enum 
>> platform_inst_fw_cap_type cap_id)
>>           return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
>>       case LAYER5_BITRATE_HEVC:
>>           return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
>> +    case SLICE_MODE:
>> +        return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE;
>> +    case SLICE_MAX_BYTES:
>> +        return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
>> +    case SLICE_MAX_MB:
>> +        return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
>>       default:
>>           return 0;
>>       }
>> @@ -1482,6 +1494,76 @@ int iris_set_layer_bitrate(struct iris_inst 
>> *inst, enum platform_inst_fw_cap_typ
>>                            &bitrate, sizeof(u32));
>>   }
>> +int iris_set_slice_count(struct iris_inst *inst, enum 
>> platform_inst_fw_cap_type cap_id)
>> +{
>> +    const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
>> +    struct platform_inst_caps *caps = inst->core->iris_platform_data- 
>> >inst_caps;
>> +    u32 slice_mode = inst->fw_caps[SLICE_MODE].value;
>> +    u32 bitrate = inst->fw_caps[BITRATE].value;
>> +    u32 rc_type = inst->hfi_rc_type;
>> +    u32 fps = inst->frame_rate;
>> +    u32 output_width = inst->fmt_dst->fmt.pix_mp.width;
>> +    u32 output_height = inst->fmt_dst->fmt.pix_mp.height;
>> +    u32 mbpf = NUM_MBS_PER_FRAME(output_height, output_width);
>> +    u32 max_width, max_height, min_width, min_height;
>> +    u32 max_avg_slicesize, hfi_value, hfi_id;
>> +
>> +    if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE) {
>> +        dev_dbg(inst->core->dev, "slice mode is: %u, ignore setting 
>> to fw\n", slice_mode);
>> +        return 0;
>> +    }
>> +    if (!fps) {
>> +        dev_err(inst->core->dev, "Invalid frame rate %d\n", fps);
>> +        return -EINVAL;
>> +    }
>> +    if (fps > caps->max_slice_frame_rate ||
>> +        (rc_type != HFI_RC_OFF && rc_type != HFI_RC_CBR_CFR &&
>> +        rc_type != HFI_RC_CBR_VFR && rc_type != HFI_RC_VBR_CFR)) {
>> +        dev_err(inst->core->dev, "slice unsupported, fps: %u, 
>> rc_type: %#x\n",
>> +            fps, rc_type);
>> +        return -EINVAL;
>> +    }
>> +
>> +    max_width = (slice_mode == 
>> V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
>> +            caps->max_mb_slice_width : caps->max_bytes_slice_width;
>> +    max_height = (slice_mode == 
>> V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
>> +            caps->max_mb_slice_height : caps->max_bytes_slice_height;
>> +    min_width = (inst->codec == V4L2_PIX_FMT_HEVC) ?
>> +            caps->min_hevc_slice_width : caps->min_avc_slice_width;
>> +    min_height = caps->min_slice_height;
>> +
>> +    if (output_width < min_width || output_height < min_height ||
>> +        output_width > max_width || output_height > max_height) {
>> +        dev_err(inst->core->dev, "slice unsupported, codec: %#x wxh: 
>> [%dx%d]\n",
>> +            inst->codec, output_width, output_height);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) {
>> +        hfi_value = inst->fw_caps[SLICE_MAX_MB].value;
>> +        hfi_value = max(hfi_value, DIV_ROUND_UP(mbpf, caps- 
>> >max_slices_per_frame));
>> +        if (inst->codec == V4L2_PIX_FMT_HEVC)
>> +            hfi_value = (hfi_value + 3) / 4;
>> +        hfi_id = inst->fw_caps[SLICE_MAX_MB].hfi_id;
>> +    } else if (slice_mode == 
>> V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
>> +        hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
>> +        if (rc_type != HFI_RC_OFF) {
>> +            max_avg_slicesize = DIV_ROUND_UP((bitrate / fps) / 8,
>> +                             caps->max_slices_per_frame);
>> +            hfi_value = max(hfi_value, max_avg_slicesize);
>> +        }
>> +        hfi_id = inst->fw_caps[SLICE_MAX_BYTES].hfi_id;
>> +    } else {
>> +        return -EINVAL;
>> +    }
>> +
>> +    return hfi_ops->session_set_property(inst, hfi_id,
>> +                         HFI_HOST_FLAGS_NONE,
>> +                         iris_get_port_info(inst, cap_id),
>> +                         HFI_PAYLOAD_U32,
>> +                         &hfi_value, sizeof(u32));
>> +}
>> +
>>   int iris_set_properties(struct iris_inst *inst, u32 plane)
>>   {
>>       const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
>> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/ 
>> media/platform/qcom/iris/iris_ctrls.h
>> index 3c462ec9190b..5a73c7c49d36 100644
>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
>> @@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum 
>> platform_inst_fw_cap_type c
>>   int iris_set_layer_count_gen1(struct iris_inst *inst, enum 
>> platform_inst_fw_cap_type cap_id);
>>   int iris_set_layer_count_gen2(struct iris_inst *inst, enum 
>> platform_inst_fw_cap_type cap_id);
>>   int iris_set_layer_bitrate(struct iris_inst *inst, enum 
>> platform_inst_fw_cap_type cap_id);
>> +int iris_set_slice_count(struct iris_inst *inst, enum 
>> platform_inst_fw_cap_type cap_id);
>>   int iris_set_properties(struct iris_inst *inst, u32 plane);
>>   #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/ 
>> drivers/media/platform/qcom/iris/iris_hfi_gen2.c
>> index acc0ed8adda1..fcbebced05c3 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
>> @@ -12,6 +12,8 @@
>>   #define VIDEO_ARCH_LX 1
>>   #define BITRATE_MAX                245000000
>> +#define MAX_SLICE_MB_SIZE         \
>> +    (((4096 + 15) >> 4) * ((2160 + 15) >> 4))
>>   static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>>       {
>> @@ -937,7 +939,36 @@ static const struct platform_inst_fw_cap 
>> inst_fw_cap_sm8550_enc[] = {
>>           .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
>>               CAP_FLAG_DYNAMIC_ALLOWED,
>>           .set = iris_set_layer_bitrate,
>> -    }
>> +    },
>> +    {
>> +        .cap_id = SLICE_MODE,
>> +        .min = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
>> +        .max = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES,
>> +        .step_or_mask = BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE) |
>> +                    BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) |
>> +                    BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES),
>> +        .value = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
>> +        .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>> +        .set = iris_set_slice_count,
>> +    },
>> +    {
>> +        .cap_id = SLICE_MAX_BYTES,
>> +        .min = 512,
>> +        .max = BITRATE_MAX >> 3,
>> +        .step_or_mask = 1,
>> +        .value = 512,
>> +        .hfi_id = HFI_PROP_MULTI_SLICE_BYTES_COUNT,
>> +        .flags = CAP_FLAG_OUTPUT_PORT,
>> +    },
>> +    {
>> +        .cap_id = SLICE_MAX_MB,
>> +        .min = 1,
>> +        .max = MAX_SLICE_MB_SIZE,
>> +        .step_or_mask = 1,
>> +        .value = 1,
>> +        .hfi_id = HFI_PROP_MULTI_SLICE_MB_COUNT,
>> +        .flags = CAP_FLAG_OUTPUT_PORT,
>> +    },
>>   };
>>   static const u32 sm8550_vdec_input_config_params_default[] = {
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h 
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> index 776b21cd11b2..226894b99dcc 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> @@ -71,6 +71,8 @@ enum hfi_rate_control {
>>   #define HFI_PROP_MIN_QP_PACKED            0x0300012f
>>   #define HFI_PROP_MAX_QP_PACKED            0x03000130
>>   #define HFI_PROP_IR_RANDOM_PERIOD        0x03000131
>> +#define HFI_PROP_MULTI_SLICE_MB_COUNT        0x03000132
>> +#define HFI_PROP_MULTI_SLICE_BYTES_COUNT    0x03000133
>>   #define HFI_PROP_LTR_COUNT            0x03000134
>>   #define HFI_PROP_LTR_MARK            0x03000135
>>   #define HFI_PROP_LTR_USE            0x03000136
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h 
>> b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index c9256f2323dc..659d15166365 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -100,6 +100,15 @@ struct platform_inst_caps {
>>       u32 mb_cycles_fw_vpp;
>>       u32 max_frame_rate;
>>       u32 max_operating_rate;
>> +    u32 max_slices_per_frame;
>> +    u32 max_slice_frame_rate;
>> +    u32 max_mb_slice_width;
>> +    u32 max_mb_slice_height;
>> +    u32 max_bytes_slice_width;
>> +    u32 max_bytes_slice_height;
>> +    u32 min_hevc_slice_width;
>> +    u32 min_avc_slice_width;
>> +    u32 min_slice_height;
>>   };
>>   enum platform_inst_fw_cap_type {
>> @@ -183,6 +192,9 @@ enum platform_inst_fw_cap_type {
>>       LAYER3_BITRATE_HEVC,
>>       LAYER4_BITRATE_HEVC,
>>       LAYER5_BITRATE_HEVC,
>> +    SLICE_MODE,
>> +    SLICE_MAX_BYTES,
>> +    SLICE_MAX_MB,
>>       INST_FW_CAP_MAX,
>>   };
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h 
>> b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
>> index 3cfecae80d1e..764acf71c72b 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
>> @@ -17,6 +17,15 @@ static struct platform_inst_caps 
>> platform_inst_cap_qcs8300 = {
>>       .mb_cycles_fw_vpp = 44156,
>>       .max_frame_rate = MAXIMUM_FPS,
>>       .max_operating_rate = MAXIMUM_FPS,
>> +    .max_slices_per_frame = 128,
>> +    .max_slice_frame_rate = 60,
>> +    .max_mb_slice_width = 4096,
>> +    .max_mb_slice_height = 2160,
>> +    .max_bytes_slice_width = 1920,
>> +    .max_bytes_slice_height = 1088,
>> +    .min_hevc_slice_width = 384,
>> +    .min_avc_slice_width = 192,
>> +    .min_slice_height = 128,
>>   };
>>   #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h 
>> b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
>> index 3c9dae995bb2..ef87976c2360 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
>> @@ -25,6 +25,15 @@ static struct platform_inst_caps 
>> platform_inst_cap_sm8550 = {
>>       .mb_cycles_fw_vpp = 66234,
>>       .max_frame_rate = MAXIMUM_FPS,
>>       .max_operating_rate = MAXIMUM_FPS,
>> +    .max_slices_per_frame = 128,
>> +    .max_slice_frame_rate = 60,
>> +    .max_mb_slice_width = 4096,
>> +    .max_mb_slice_height = 2160,
>> +    .max_bytes_slice_width = 1920,
>> +    .max_bytes_slice_height = 1088,
>> +    .min_hevc_slice_width = 384,
>> +    .min_avc_slice_width = 192,
>> +    .min_slice_height = 128,
>>   };
>>   #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/ 
>> drivers/media/platform/qcom/iris/iris_platform_vpu2.c
>> index 6e06a32822bb..39720e7af889 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
>> @@ -44,6 +44,15 @@ static struct platform_inst_caps 
>> platform_inst_cap_vpu2 = {
>>       .mb_cycles_vpp = 200,
>>       .max_frame_rate = MAXIMUM_FPS,
>>       .max_operating_rate = MAXIMUM_FPS,
>> +    .max_slices_per_frame = 128,
>> +    .max_slice_frame_rate = 60,
>> +    .max_mb_slice_width = 4096,
>> +    .max_mb_slice_height = 2160,
>> +    .max_bytes_slice_width = 1920,
>> +    .max_bytes_slice_height = 1088,
>> +    .min_hevc_slice_width = 384,
>> +    .min_avc_slice_width = 192,
>> +    .min_slice_height = 128,
> 
> I do not see these values are changing for different SOC data here. 
> Would prefer to do the macro instead of inflating the platform struct.
> 
> Regards,
> Vikash
> 

Thanks for the review, Vikash.
Agreed these were duplicated. In v[4], I've introduced struct 
platform_inst_slice_caps and moved it to iris_platform_data (one level 
above platform_inst_caps), since all Gen2 targets share the same encoder 
capability table and slice limits. A single default_slice_caps_vpu3x 
instance is now referenced via .slice_caps from all Gen2 targets, 
instead of being duplicated per-target.
Used a shared struct pointer rather than a macro so a future chipset 
with different limits can point at its own instance without touching the 
others.

>>   };
>>   static const struct icc_info iris_icc_info_vpu2[] = {
>>
> 

