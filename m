Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD4B419FDC
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 23:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792191670; cv=none; b=hShYaGXLPBGg07Or18p498Qn3BV10mPh1CGhf8Lnf9ZXyYuW+7OWrM7briTly4Gyz70Op2WqrxMbZ9pm24IAP8p2Pu8mgqhrlg/3WKzP02YBGWg43SVduyVeXg4jDVYeZq+g+HIkcFNH1EeZqsm/Z1vX123ai+NdMVZB5u3wnYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792191670; c=relaxed/simple;
	bh=26MyuqKBD1rvC4sageY01F6HH+LzO7eyCztfnaDducM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lj1LXt9Evq8M4Xc27NTzH4qz3OyJhXszYv0WUdjXi3iKQs7mP8B/Rhh7eWDsatLPEJKX6DAIRpzqtnjZv9qMITr+FH9l+sca/Nqha1O5Rg7Gb7iLO7IFspssY12ARQfcR2MnbfkO96DL4aadSLOFqdCXjG/XR0DZ54+Ec3flpaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTVf1gGW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NaqEMEjd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTVf1gGW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NaqEMEjd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GJeiNo3725189
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 23:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WWC1d8BJwpBV3/iRJ+YBa4WQ32MzRevnJzVPMY4sTaU=; b=UTVf1gGWa+GItlIQ
	ACVvYvm+IZNgoj7qRWAdFuwLuPti9RkqP7k8VY3pRYv5dQbbNHvv+uOFh8FqFxSM
	9UjP0O59vp/vN4VH0ZBfvdHvzeOj6GUD82AttakGSRIDsxREB37eCd6fdFpZXSrw
	tTKoV08E4r1e4AlvmTc/+1sPx5c3u03ECQgsuPxw2UKIWAc1aEXj25wRtsVqEJCT
	H9fI8wXjhR88CPQorbgy0KtYn71FLpllCW9brQJ2BeXvsKRJ6rmVBDvSxiNhS21f
	BWz36RDwE/M2KrMaSq9DUvaW0iHCeRf0lnyHAM5HcpsfqcZW5A0r8yex/3ZL2HNA
	nBD/SQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbq451by1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 23:01:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35bfac489edso32295eec.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 16:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792191666; x=1792796466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WWC1d8BJwpBV3/iRJ+YBa4WQ32MzRevnJzVPMY4sTaU=;
        b=NaqEMEjdA40xUzqJFJt0cDep4KWCIHouNSCJbxEyYOZ3+LOF9Hjt6Fi5mMcASeEIMx
         qS8IeRuuCsiNvoudluKB5Of92Mml7xcsf9LEgsbp2G/i041n5+O0n08JgQF/nh7SZk/x
         GGZHpxIalWOjNuBXmQO/U12lv/WdE7DDmI5vVFKjrQm94et0wLnee/fZSXCDn1AFQ0Xe
         GYIfMUohycdrzf16MV2Ktc9U+72l2iIdMDDWMaRbX77KbFHrJ1KRBznCCyMcfbhQNIK4
         DZXfhlo3N9P0c3Qgc0dbperDIfFbfEefYTMkbcnWW11drFr6Qm52QO8DCjFUSMMRhWHP
         DlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792191666; x=1792796466;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWC1d8BJwpBV3/iRJ+YBa4WQ32MzRevnJzVPMY4sTaU=;
        b=bZhzuSNwXAov07pNEvpdAVy5g5rn/+5w7kSX2iBQsujqmWevj6Fv4G8Q77DUwoTZfU
         vjwCvkpXfhsbjnYmZUbJxInvmF78TNWZ0GIs6yA91gBNjO6o9W2nwk33VoPbVMYmBHAe
         vC3JQh4lCU5kpckUomfzejeTO5KNcvm55adm7Wll1v7+j/ba5d5f+RDXhlgfTKzaG1NH
         SGR5MmjxjfXeKS6FLsV5CsNPjWk4v7qV3uUtOZDbosscmEZ5p84q/I6VoGT3CAp93OLV
         I2N+cNSNDhVCK1HmIFRDNxgwUcKXLaEBVRXcRoa3sy2B/nk8Z/zOE0cSA7ofk6C1pc56
         BW4g==
X-Gm-Message-State: AFq9FYLZrADh+lhlQc59mRiZzrCvKZhZJRNBwir680NvYUlpqRyp7bNI
	/4exg/irLCjzEp1XJivOppg8/oWJm4ky1oa4iDnhAl+puZAb4IytIDICem2HmiuexOWytppikog
	G3epXSTR8MXx4+kgMl1u5lunpwVF+izMSW2Bv72Dbjhu30+cxYFVEkZ4vqzKMUbvFNA==
X-Gm-Gg: AYBFou2LicuuU3wfjf81K5ZspVx5lUr1BUPRrGvG+gL699adrvkGQAbpE+qjI39pi60
	0CAcAhS0LHuusRBBJcqFS0khCMx5ZIb9NOTJwa5i4/Ao/+hZZfC5h+jbOvm1QQk6UprDl7pkaQp
	9Dx1O8f3UXIi43VtVxyAJ3gq5maoyFwx53yCnMfq3RwAPlPMpkuuRf0AdgQoXoUwhEc20b1X3Dr
	fkc5oNtCR3N9viMcGo9UlzbhxKYYXzfL31I977bbQQby61mbdQDVCdA3ianIYFHXX/KRHfAkOfL
	Z2homp0hDEovWLHpUl3UpCmZDjuv4isqUzdkyDt/TAluRs3Ou7zVLU0+0WklzKYSLmqAu1u/z3j
	NXofpBXr1PFJ399VsZbIDGFeiNudLgbQ+e0IbyrvscNo10euCvChK1FobfQb//ug=
X-Received: by 2002:a05:701b:208a:b0:146:ffa9:2117 with SMTP id a92af1059eb24-1850f9092cfmr2405958c88.1.1792191665835;
        Fri, 16 Oct 2026 16:01:05 -0700 (PDT)
X-Received: by 2002:a05:701b:208a:b0:146:ffa9:2117 with SMTP id a92af1059eb24-1850f9092cfmr2405816c88.1.1792191664148;
        Fri, 16 Oct 2026 16:01:04 -0700 (PDT)
Received: from [10.110.37.114] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c5cb39esm8933638c88.22.2026.10.16.16.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 16:01:02 -0700 (PDT)
Message-ID: <fbae45e1-f830-4269-83eb-98d4ccbbe4eb@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:00:42 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: Re: [PATCH v9 4/5] media: iris: Add HFI metadata buffer delivery
 support for Gen2 encoders
To: Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261005-enc_roi_enable-v9-0-831c24135cb1@oss.qualcomm.com>
 <inQVe3E9xQxUl97a9oxAvOjTb4IDzqhxOQqup3aHNw7U0PKfGHr7lWGM7jXu5bLR94PU88T5GRDR9txWtXBDRg==@protonmail.internalid>
 <20261005-enc_roi_enable-v9-4-831c24135cb1@oss.qualcomm.com>
 <27745be4-20de-4a00-95cf-27fde23f7e28@kernel.org>
 <7sfKTcUvYYlpgI4nGR07WZ7dipcv7fChRHcvfvrSEVwQdBcpSjwBCJihhgK_uKEkXDod_1hCPo7MgDV6ZyiNeA==@protonmail.internalid>
 <7639bce8-c259-429e-be91-512e3e2fda78@oss.qualcomm.com>
 <2f5df3cb-61b1-493c-b71a-17bfd35a9152@kernel.org>
Content-Language: en-US
In-Reply-To: <2f5df3cb-61b1-493c-b71a-17bfd35a9152@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6GgzLif1ijJuza6zlkhn1oBuGIJ8tTZU
X-Proofpoint-GUID: 6GgzLif1ijJuza6zlkhn1oBuGIJ8tTZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5MSBTYWx0ZWRfX/CjSYbDGN73i
 EfksL1RRcaNyS6ohnFreyrJX9wQdyHZj2jc6uG7nrst5DgjzXHjtWVQIeWTws0POEkHY/yO98mh
 3YTx1B9jpqCQ5zjo1L5KLhBOV6GGZu5+2S0bLVrvqUvNJ2W6nAaM2Rnep59bMetmwoqLagKUaHj
 eF1pBqmZjINVjWrKLrrNym1SXPSVGYmvG5U0jmhWLaIojZwac0xWJXJiEEH4bHi+EiEjxKSBbF9
 sIIZEI2h5uX0Qng0cSj2TzKQO3ZhSis2zEZ7fMJjddwIwMKAxa5fR509OEe4kcD41W4H/cFi5w5
 yiODdhwOLmHI/Regzro09RFOIpi3IRzP3ZqL2QHu3xwgQrLjgagypM4cj/T0TrVzvIM6qY/6MBs
 tn0p6XqZjIJYMBrs3s48BZusiuWSq/4zF4vgidZRuh0ufm/Ui/cejysw+G45WCd1GWmS4w2Djvz
 0NsMaSvtm+00G4r0v3g==
X-Authority-Analysis: v=2.4 cv=e4GT2qp/ c=1 sm=1 tr=0 ts=6ad2acb3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GdIgj0O2Wmda6onnxHAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5MSBTYWx0ZWRfX6VAPrmQrA+R7
 qKSgBL3KfYnaNU+pFvFfbkRgWapceJWsbBtmudOgHmsNLcyT7HJJDz9wdztXOetFj7/6lnaxcWc
 z6GeilcLeyyKZvY1Zn3y2/jNKBmV9Oo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160091


On 10/8/2026 4:50 PM, Bryan O'Donoghue wrote:
> On 07/10/2026 22:40, Deepa Guthyappa Madivalara wrote:
>>
>> On 10/7/2026 1:58 AM, Bryan O'Donoghue wrote:
>>> On 05/10/2026 23:38, Deepa Guthyappa Madivalara wrote:
>>>> Add the infrastructure to deliver metadata buffers to the HFI firmware
>>>> on HFI Gen2 based encoders, used to carry per-frame ROI delta QP data.
>>>>
>>>> Metadata buffer structures (iris_buffer.h):
>>>> - Add metabuf_header and metapayload_header structs describing the
>>>>     metadata buffer layout as expected by the firmware.
>>>>     HFI defines (iris_hfi_gen2_defines.h):
>>>> - Add HFI_CMD_DELIVERY_MODE (0x0100000A).
>>>> - Add HFI_MODE_METADATA (0x00000004) to hfi_property_mode_type.
>>>>     HFI command side (iris_hfi_gen2_command.c):
>>>> - In iris_hfi_gen2_session_queue_buffer(), after queuing a RAW
>>>>     (input) buffer, check for an available BUF_ROIMB_DELTAQP metadata
>>>>     buffer and, if found, append a second HFI_CMD_BUFFER packet for
>>>>     the metadata buffer in the same command, tagged with the same
>>>>     buffer index.
>>>> - Add iris_hfi_gen2_subscribe_metadata_delivery(): sends
>>>>     HFI_CMD_DELIVERY_MODE with HFI_MODE_METADATA and HFI_PROP_ROI_INFO
>>>>     to instruct the firmware to expect metadata on the input port.
>>>>     HFI response side (iris_hfi_gen2_response.c):
>>>> - Add iris_hfi_gen2_handle_output_metadata_buffer(): locate the
>>>>     metadata buffer by device address and transition it from
>>>>     QUEUED to DEQUEUED so it can be reused.
>>>>
>>>> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Deepa Guthyappa Madivalara
>>>> <deepa.madivalara@oss.qualcomm.com>
>>>> ---
>>>>    drivers/media/platform/qcom/iris/iris_buffer.h     | 18 ++++++++++
>>>>    drivers/media/platform/qcom/iris/iris_ctrls.c      | 12 +++++++
>>>>    drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>>>>    drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
>>>>    .../platform/qcom/iris/iris_hfi_gen2_command.c     | 39
>>>> ++++++++++++++++++++++
>>>>    .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 ++
>>>>    .../platform/qcom/iris/iris_hfi_gen2_packet.c      |  6 ++--
>>>>    .../platform/qcom/iris/iris_hfi_gen2_packet.h      |  3 ++
>>>>    .../platform/qcom/iris/iris_hfi_gen2_response.c    | 27
>>>> +++++++++++++++
>>>>    drivers/media/platform/qcom/iris/iris_venc.c       |  4 +++
>>>>    10 files changed, 110 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h
>>>> b/drivers/media/platform/qcom/iris/iris_buffer.h
>>>> index
>>>> ab8e5d953101a786ade20540ee3c3ed226160cbe..ee2d24bb69c57220b0a735d9b4aae4434a33daf6 
>>>>
>>>> 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
>>>> @@ -107,6 +107,24 @@ struct iris_buffers {
>>>>        u32            size;
>>>>    };
>>>>
>>>> +/* Metadata buffer header */
>>>> +struct metabuf_header {
>>>> +    u32 count;
>>>> +    u32 size;
>>>> +    u32 version;
>>>> +    u32 reserved[5];
>>>> +};
>>>> +
>>>> +/* Metadata buffer payload header */
>>>> +struct metapayload_header {
>>>> +    u32 type;
>>>> +    u32 size;
>>>> +    u32 version;
>>>> +    u32 offset;
>>>> +    u32 flags;
>>>> +    u32 reserved[3];
>>>> +};
>>>> +
>>>>    int iris_get_buffer_size(struct iris_inst *inst, enum
>>>> iris_buffer_type buffer_type);
>>>>    void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
>>>>    int iris_create_internal_buffers(struct iris_inst *inst, u32 
>>>> plane);
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c
>>>> b/drivers/media/platform/qcom/iris/iris_ctrls.c
>>>> index
>>>> d97fe50d48860b0f26b71d328a704f3804b1d93d..cd5597b2cbb69f0608fb8f21bd813e11c1f97693 
>>>>
>>>> 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
>>>> @@ -1704,3 +1704,15 @@ int iris_set_properties(struct iris_inst
>>>> *inst, u32 plane)
>>>>
>>>>        return 0;
>>>>    }
>>>> +
>>>> +int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane)
>>>> +{
>>>> +    const struct iris_hfi_session_ops *hfi_ops = 
>>>> inst->hfi_session_ops;
>>>> +    int ret = 0;
>>>> +
>>>> +    /*subscribe to metadata delivery only if ROI is enabled */
>>>> +    if (!inst->fw_caps[ROI_PARAMS].p_array)
>>>> +        return ret;
>>>> +
>>>> +    return hfi_ops->session_subscribe_metadata_delivery(inst, plane);
>>>> +}
>>>
>>> What does ret do here ?
>>>
>>> Also is session_subscribe_metadata_delivery() guaranteed to be
>>> non-NULL ? I see it initialised once in this patch.
>>>
>> The idea is to subscribe to metadata delivery only if ROI is set. If not
>> firmware will
>> expect metadata buffers from driver. So ret will just help returning
>> from here without subscribing.
>> session_subscribe_metadata_delivery needs to be initialized only once
>> per instance if ROI is set.
>
> Right so Ted
>
> Just return 0 then, I mean its redundant right - you don't modify this 
> function in the next patch.
>
Updated in V10.
> But my real question is - what guarantee is there p_array and 
> session_subscribe_metadata_delivery are simlutaneously true. Certainly 
> looks like the firmware could declare a flag which could call a NULL 
> pointer derference @ session_subscribe_metadata_delivery.
>
Updated in V10. Interpreted the comment as - Driver should error out if 
ROI is set but platform does not support metadata delivery.
>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h
>>>> b/drivers/media/platform/qcom/iris/iris_ctrls.h
>>>> index
>>>> 08db807444203ef02f83008fc311cad20ea79f44..ef2c09485ad93719e4acc7f395899d7f67cb5b2d 
>>>>
>>>> 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
>>>> @@ -51,5 +51,6 @@ int iris_set_req_sync_frame(struct iris_inst *inst,
>>>> enum platform_inst_fw_cap_ty
>>>>    int iris_set_time_delta_based_rc(struct iris_inst *inst, enum
>>>> platform_inst_fw_cap_type cap_id);
>>>>    int iris_set_slice_count(struct iris_inst *inst, enum
>>>> platform_inst_fw_cap_type cap_id);
>>>>    int iris_set_properties(struct iris_inst *inst, u32 plane);
>>>> +int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane);
>>>>
>>>>    #endif
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h
>>>> b/drivers/media/platform/qcom/iris/iris_hfi_common.h
>>>> index
>>>> 16099f9a25b65e2e4556d54499e2c2a4cc4e22fc..79b276cc64f656c387dab5994d844bc9a9c9e624 
>>>>
>>>> 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
>>>> @@ -132,6 +132,7 @@ struct iris_hfi_session_ops {
>>>>        int (*session_drain)(struct iris_inst *inst, u32 plane);
>>>>        int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
>>>>        int (*session_close)(struct iris_inst *inst);
>>>> +    int (*session_subscribe_metadata_delivery)(struct iris_inst
>>>> *inst, u32 plane);
>>>>    };
>>>>
>>>>    struct hfi_subscription_params {
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>>> index
>>>> 388a36ff2b07b7bcd8db21d4345bc900356b4ec3..cf88dbe11e8e9faef826e661d8e9909fd7f16b94 
>>>>
>>>> 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>>> @@ -1307,6 +1307,24 @@ static void iris_hfi_gen2_get_buffer(u32
>>>> domain, struct iris_buffer *buffer,
>>>>        buf->timestamp = buffer->timestamp;
>>>>    }
>>>>
>>>> +static struct iris_buffer *iris_queue_metadata_buffers(struct
>>>> iris_inst *inst,
>>>> +                               enum iris_buffer_type buffer_type,
>>>> u32 index)
>>>> +{
>>>> +    struct iris_buffers *buffers = &inst->buffers[buffer_type];
>>>> +    struct iris_buffer *buffer = NULL;
>>>> +
>>>> +    if (list_empty(&buffers->list))
>>>> +        return NULL;
>>>> +
>>>> +    buffer = list_first_entry(&buffers->list, typeof(*buffer), list);
>>>> +    if ((buffer->attr & BUF_ATTR_QUEUED) || (buffer->attr &
>>>> BUF_ATTR_DEQUEUED))
>>>> +        return NULL;
>>>> +
>>>> +    buffer->index = index;
>>>> +
>>>> +    return buffer;
>>>> +}
>>>> +
>>>>    static int iris_hfi_gen2_session_queue_buffer(struct iris_inst
>>>> *inst, struct iris_buffer *buffer)
>>>>    {
>>>>        struct iris_inst_hfi_gen2 *inst_hfi_gen2 =
>>>> to_iris_inst_hfi_gen2(inst);
>>>> @@ -1359,6 +1377,26 @@ static int
>>>> iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
>>>>                        inst_hfi_gen2->packet->size);
>>>>    }
>>>>
>>>> +static int iris_hfi_gen2_subscribe_metadata_delivery(struct
>>>> iris_inst *inst, u32 plane)
>>>> +{
>>>> +    struct iris_inst_hfi_gen2 *inst_hfi_gen2 =
>>>> to_iris_inst_hfi_gen2(inst);
>>>> +    u32 port = iris_hfi_gen2_get_port(inst,
>>>> V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>>>> +    u32 payload[2] = {HFI_MODE_METADATA, HFI_PROP_ROI_INFO};
>>>> +
>>>> +    iris_hfi_gen2_packet_session_command(inst,
>>>> +                         HFI_CMD_DELIVERY_MODE,
>>>> +                         (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
>>>> +                          HFI_HOST_FLAGS_INTR_REQUIRED),
>>>> +                         port,
>>>> +                         inst->session_id,
>>>> +                         HFI_PAYLOAD_U32_ARRAY,
>>>> +                         &payload,
>>>> +                         sizeof(u32) * 2);
>>>> +
>>>> +    return iris_hfi_queue_cmd_write(inst->core, 
>>>> inst_hfi_gen2->packet,
>>>> +                    inst_hfi_gen2->packet->size);
>>>> +}
>>>> +
>>>>    static const struct iris_hfi_session_ops 
>>>> iris_hfi_gen2_session_ops = {
>>>>        .session_open = iris_hfi_gen2_session_open,
>>>>        .session_set_config_params =
>>>> iris_hfi_gen2_session_set_config_params,
>>>> @@ -1372,6 +1410,7 @@ static const struct iris_hfi_session_ops
>>>> iris_hfi_gen2_session_ops = {
>>>>        .session_drain = iris_hfi_gen2_session_drain,
>>>>        .session_resume_drain = iris_hfi_gen2_session_resume_drain,
>>>>        .session_close = iris_hfi_gen2_session_close,
>>>> +    .session_subscribe_metadata_delivery =
>>>> iris_hfi_gen2_subscribe_metadata_delivery,
>>>>    };
>>>>
>>>>    static struct iris_inst *iris_hfi_gen2_get_instance(void)
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>>>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>>>> index
>>>> 2394213d8272b53bf6a1cff9574dc93f6830fc8c..746d7c1aad52cd87c55a7ad71fcf9560881dfce6 
>>>>
>>>> 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>>>> @@ -20,6 +20,7 @@
>>>>    #define HFI_CMD_DRAIN                0x01000007
>>>>    #define HFI_CMD_RESUME                0x01000008
>>>>    #define HFI_CMD_BUFFER                0x01000009
>>>> +#define HFI_CMD_DELIVERY_MODE                0x0100000A
>>>>    #define HFI_CMD_SUBSCRIBE_MODE            0x0100000B
>>>>    #define HFI_CMD_SETTINGS_CHANGE            0x0100000C
>>>>    #define HFI_CMD_PAUSE                0x01000011
>>>> @@ -177,6 +178,7 @@ enum hfi_flip {
>>>>    enum hfi_property_mode_type {
>>>>        HFI_MODE_PORT_SETTINGS_CHANGE        = 0x00000001,
>>>>        HFI_MODE_PROPERTY            = 0x00000002,
>>>> +    HFI_MODE_METADATA            = 0x00000004,
>>>>    };
>>>>
>>>>    enum hfi_color_format {
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
>>>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
>>>> index
>>>> 6e04175eb904b494309a38eece41213600f93a88..655f4c2fcdd5b89624887807f4fa17a645fac803 
>>>>
>>>> 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
>>>> @@ -100,9 +100,9 @@ static void iris_hfi_gen2_create_header(struct
>>>> iris_hfi_header *hdr,
>>>>        hdr->num_packets = 0;
>>>>    }
>>>>
>>>> -static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr,
>>>> u32 pkt_type,
>>>> -                    u32 pkt_flags, u32 payload_type, u32 port,
>>>> -                    u32 packet_id, void *payload, u32 payload_size)
>>>> +void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32
>>>> pkt_type,
>>>> +                 u32 pkt_flags, u32 payload_type, u32 port,
>>>> +                 u32 packet_id, void *payload, u32 payload_size)
>>>>    {
>>>>        struct iris_hfi_packet *pkt = (struct iris_hfi_packet *)((u8
>>>> *)hdr + hdr->size);
>>>>        u32 pkt_size = sizeof(*pkt) + payload_size;
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
>>>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
>>>> index
>>>> 25b9582349ca1a0ce6efc0b146a3abb798485c45..613eb500609f745daebdcbdf9a25b85cb9465a79 
>>>>
>>>> 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
>>>> @@ -121,5 +121,8 @@ void iris_hfi_gen2_packet_session_property(struct
>>>> iris_inst *inst,
>>>>    void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct
>>>> iris_core *core,
>>>>                                   struct iris_hfi_header *hdr);
>>>>    void iris_hfi_gen2_packet_sys_pc_prep(struct iris_core *core,
>>>> struct iris_hfi_header *hdr);
>>>> +void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32
>>>> pkt_type,
>>>> +                 u32 pkt_flags, u32 payload_type, u32 port,
>>>> +                 u32 packet_id, void *payload, u32 payload_size);
>>>>
>>>>    #endif
>>>> diff --git
>>>> a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>>> index
>>>> f0782c4b1e6e88d06cb4bd18f0210c105ae2acf8..ea1fc96077fdce83db9c6a6c1f753ec7978b0673 
>>>>
>>>> 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>>> @@ -77,6 +77,7 @@ static bool
>>>> iris_hfi_gen2_is_valid_hfi_buffer_type(u32 buffer_type)
>>>>        case HFI_BUFFER_PERSIST:
>>>>        case HFI_BUFFER_VPSS:
>>>>        case HFI_BUFFER_PARTIAL_DATA:
>>>> +    case HFI_BUFFER_METADATA:
>>>>            return true;
>>>>        default:
>>>>            return false;
>>>> @@ -452,6 +453,30 @@ static int
>>>> iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
>>>>        return 0;
>>>>    }
>>>>
>>>> +static int iris_hfi_gen2_handle_output_metadata_buffer(struct
>>>> iris_inst *inst,
>>>> +                               struct iris_hfi_buffer *buffer)
>>>> +{
>>>> +    u32 buf_type = iris_hfi_gen2_buf_type_to_driver(inst,
>>>> HFI_BUFFER_METADATA);
>>>> +    struct iris_buffers *buffers = &inst->buffers[buf_type];
>>>> +    struct iris_buffer *buf, *iter;
>>>> +    bool found = false;
>>>> +
>>>> +    list_for_each_entry(iter, &buffers->list, list) {
>>>> +        if (iter->device_addr == buffer->base_address) {
>>>> +            found = true;
>>>> +            buf = iter;
>>>> +            break;
>>>> +        }
>>>> +    }
>>>> +    if (!found)
>>>> +        return -EINVAL;
>>>> +
>>>> +    buf->attr &= ~BUF_ATTR_QUEUED;
>>>> +    buf->attr |= BUF_ATTR_DEQUEUED;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    static int iris_hfi_gen2_handle_session_stop(struct iris_inst 
>>>> *inst,
>>>>                             struct iris_hfi_packet *pkt)
>>>>    {
>>>> @@ -499,6 +524,8 @@ static int
>>>> iris_hfi_gen2_handle_session_buffer(struct iris_inst *inst,
>>>>                return iris_hfi_gen2_handle_input_buffer(inst, buffer);
>>>>            else if (buffer->type == HFI_BUFFER_BITSTREAM)
>>>>                return iris_hfi_gen2_handle_output_buffer(inst, 
>>>> buffer);
>>>> +        else if (buffer->type == HFI_BUFFER_METADATA)
>>>> +            return iris_hfi_gen2_handle_output_metadata_buffer(inst,
>>>> buffer);
>>>>            else
>>>>                return
>>>> iris_hfi_gen2_handle_release_internal_buffer(inst, buffer);
>>>>        }
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c
>>>> b/drivers/media/platform/qcom/iris/iris_venc.c
>>>> index
>>>> 2f2c56bf9122c73e10e86815b1aa5fad99b0fb42..08353a8895b0e5d8769c2deb137a4fffcbc3108d 
>>>>
>>>> 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_venc.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
>>>> @@ -515,6 +515,10 @@ int iris_venc_streamon_output(struct iris_inst
>>>> *inst)
>>>>        if (ret)
>>>>            goto error;
>>>>
>>>> +    ret = iris_set_metadata_delivery(inst,
>>>> V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>>>> +    if (ret)
>>>> +        goto error;
>>>> +
>>>>        ret = iris_alloc_and_queue_persist_bufs(inst, BUF_ARP);
>>>>        if (ret)
>>>>            return ret;
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>
