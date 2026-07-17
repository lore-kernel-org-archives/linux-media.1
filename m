Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55133C2790
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276504; cv=none; b=ZAU0j208c5AS+TWEju6Gm54o6ymWZK00om/xZUx+ptZOwUBsVC25ZjrEnP+Xty37+7ZB0U8PdkulHy83fYVMIJ/e+bMBO3kzCWM5gzZHd52+GJTHBfqJN13ueLlC/aO6RHBBRuebePQFoWntrPzT88x3rV9RjEb++lM9DoIk190=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276504; c=relaxed/simple;
	bh=fME/LCiZC/sav3GnIeE7dz+duAizMr9XsOt4ejFKXd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ugo6m+b0DYm8nQLIBdqNf9FcjxEFclxgA5qTddrM22FL118dHBkMAIRRtCof8HgVkoruEh2L8u5jZWOi41ENXHU4Kj9XRUHNOftRaTesPGu+wK+eTh7cM++ETgt63aTDkRoQwu08kng623aigQX+ajQm36NI4Mn0s0fZtLXliM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+do+sw4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9l3PMq+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+do+sw4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9l3PMq+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cWN8979894
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	goo2Gv/gNn2QUTqWSOVrRxik7y5wqdwN+qsTbQTcFnY=; b=N+do+sw4iUTePjgo
	iAvaDs/89cD1pmez8XBq+83L3M+kVnmSJ+4ag+eL7wwzLzwZNIBd080WKu5DqG5r
	MmtPj5HQ+NA3pXQdet7u5Rf398LqG+9C6RLnzG2geTBZCMe2MyMUBi4kgAoFGAoR
	bXPE3/NHZcDItgTdBrastPPwYSLEY4v4sA+pIkyQWXvjcGwAvohTEQTOe4PgYNtG
	F2AhqTjsIWHwZbFdr12jceD4TDOjah/0vUNfajCbhnos0+RbgLgnb2x7Unf844Tf
	ax6RBUgxzan0aZD1bY4pTVNAZGYcAXkCJ4/9P4bCvFxVQR7ZT/QfZQTJ4qqYfeyc
	xoGRnA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9grcs0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:21:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee894b3d8so75446715ad.2
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 01:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784276496; x=1784881296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=goo2Gv/gNn2QUTqWSOVrRxik7y5wqdwN+qsTbQTcFnY=;
        b=B9l3PMq+/xmwF/mDDHRv27cK2JMYBNitzMj+flw8bMPazus0dqb8HoRLQGgdoaQGV4
         K775+o/6vM2Guq5J10fi1SP0vNNPstF7dv0bOzcr66E/tgAI85EmtBsVRhfA3qHAYogj
         cg/FqWhqA1Tf64lY5zRYLqPhXcA89R+bK4FdpRE41L3iqbyKhXZkhRb2bnO3/Idn4UB0
         zT7kSOz7gK0YKRKYvBpjgdWn8yobXgE5iKYvZGf+s2tQV0c1s/KJDTObHjVBuaZUzNaM
         n7E/GwwX/jyoNteq7QamxQwJodbHxR6ttRty1Dl5VS5YBPdn9kfgd9IukCxlDIb13Bg1
         Yn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784276496; x=1784881296;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=goo2Gv/gNn2QUTqWSOVrRxik7y5wqdwN+qsTbQTcFnY=;
        b=rL3Q0sQ+rHuxj3oM3ihg1j3Z9dKdIqT/Uqt5NpaSBtNXFLgJ02EieKYAb+IXDh039F
         d+IoZMkTZGyTIkxbhl8RM2bYfXZizE0Eh2x4G65ig3xR1Nnmiic/eflytr1/i1qNMxBt
         wkbjEYQq9AvW0aVEU9VFnvoSKFi5qYOgTtr83R3nIPZbYinrC799C7djcOr8MkrmH4di
         rFY2hPaBW6RAFsE1vjDIwpq2InclkV35YvTlKJwS6D/oNMuxOlkR5yrA5Q7JfXmi7djg
         OaCPPVWexkfwWHjJjq+4/1glKqpy8p4re8gKH9W/LRVO/soaZ8gW2ILld2mJKrk8FAKG
         k1Og==
X-Gm-Message-State: AOJu0YyCzfA0ct5XfItB8f8S4x4aVo7zKmntiQbYmT1g2mLsmpmRQs11
	4AdqajobCGPDkI7zlUeaiWTUayDTdQbeEYbRtMjzqfiKs0paJcVkG9Tv0hLh1Be+W5yjDKzK+bV
	fnTqQYoKOGIb/AAge2QlHaf4bm1CnrPlqrMxfz9Lk6sF86hvaYYDePbnZ0b+Mit2+4w==
X-Gm-Gg: AfdE7cmNCKsqw0/R9Ut1zssMGk9zQI0B0tTQONxm0WesnRO2+O1BgMb5FX1GIpSzrZW
	nZLuTcEbFyn8/XTDDkjgTi8DAJ+R18WXgRh9WgA8oDffPCALiOY61SU+hEBOSNuaeaTorAe8v34
	Pr2Bwnbwg78CT8JGAwuo+1d4U5U6ZbWXC1Qa8JWv/8RjjKWS1tJMQRo6l19Sz+2lZiq8KQ2hPmT
	/mHLRnmTpndPouOxzMBWV+ETIUpHmXMiK7IvJ6uAAlk2Zg64tpFYelG3YsTKHwO057S104cPHQW
	CDW1B/9snpt/ua3hQ/o0fCynQwujNhdaquyEvib9dOdYWRSlbGRoohhc+EZWp/NcmiGDzQgVakF
	JtcYzktLiq+Q926HhFnEdcu8MWpM=
X-Received: by 2002:a17:902:f68e:b0:2c9:97a7:3278 with SMTP id d9443c01a7336-2cf349fff0fmr17893235ad.41.1784276496115;
        Fri, 17 Jul 2026 01:21:36 -0700 (PDT)
X-Received: by 2002:a17:902:f68e:b0:2c9:97a7:3278 with SMTP id d9443c01a7336-2cf349fff0fmr17892675ad.41.1784276495488;
        Fri, 17 Jul 2026 01:21:35 -0700 (PDT)
Received: from [10.218.25.31] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347166e6sm6471405ad.59.2026.07.17.01.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 01:21:34 -0700 (PDT)
Message-ID: <4f7bc381-364e-40a2-b627-9388982fcf80@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:51:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add support for multi_slice in iris encoder
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260428-iris_multi_slice-v1-1-92c327619ebf@oss.qualcomm.com>
 <766404b0-2252-47e0-b728-be9985067569@oss.qualcomm.com>
Content-Language: en-US
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
In-Reply-To: <766404b0-2252-47e0-b728-be9985067569@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4MiBTYWx0ZWRfX5OnjbH0z7Oih
 Td8K9BZzk717GjCmyZCNc7WVZa8jb/SYVxqMQjNn5milnqMrRhBvWQVNtc18bQblGyEeOFujipi
 jHlgJi7HAQs6GR73GHEJmYythmSfYVk=
X-Proofpoint-ORIG-GUID: gfOw8mbYHblVYYQvjbLnBho02M3P5DwC
X-Proofpoint-GUID: gfOw8mbYHblVYYQvjbLnBho02M3P5DwC
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a59e611 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xUXiaszbzMrqdo01gOUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4MiBTYWx0ZWRfX5bR6TjrK9EkM
 lC2qlUv/O40PSk5MOk8F9706VciXANaZZNKuRr753IAbKZ4VKcGoZX4SoGW6FQjd7q5cGQdlKtz
 zSJz8e2KeTijPOpPb46hzC6KTrmbu4Rvkl0yjL5zkNHEiIo/2Hl2pffFMCb0mLpVd15a62sa2B0
 KEgv8MoIGtoxpw6BEbtjGmIl4B0R9UljuzUnfYkwiXyPu189Be5kmEKKTt1+mXhj5euMW3QZrBd
 UGUgoy8rlm/dgL/kUX1etYT8+xUvekj+6Ea4YG+pjDHL6vKNwI4fOKYDMyP5YG8xk+roko2v1kM
 /9ELi6JSGnJxazGUOvBgu0cW/nxZ9f8S2T14/177bWQP+6qoO9xUkfPEqjg6TkoMmenoMy14KfA
 F+ZB6WOygiFSqK32ihXqFSxIb2t06u1b+3m+avPgHU0my7UU8yqf8CzBkhxcOr/YKzj/me7/tbE
 qOyJk+o4nJpBv0T54Ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170082



On 6/26/2026 5:58 PM, Vikash Garodia wrote:
> 
> On 4/28/2026 12:44 PM, Sachin Kumar Garg wrote:
>> Add multi-slice encoding support with MAX_MB and MAX_BYTES modes.
>>
>> Clients can enable slice mode using V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
>> control and configure slice size via 
>> V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
>> or V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES controls.
>>
>> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
>> ---
>> This series adds the support for multi slice feature in the
> 
> series ?
> 
>> Qualcomm Iris driver.
>>
>> Multi-slice mode allows encoding a single frame into multiple slices,
>> which can improve error resilience and enable parallel processing.
>> The feature supports two slice modes:
>> - MAX_MB mode: Slices are created based on macroblock count, controlled
>>    via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
>> - MAX_BYTES mode: Slices are created based on byte size, controlled via
>>    V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES
>>
>> Clients can enable slice mode using the
>> V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE control.
>>
>> This series adds multi-slice support for HFI Gen2 targets (SM8550 and 
>> later).
>> Support for HFI Gen1 targets will be added in a follow-up series.
>>
>> This Patch has been verified with GST level.
> 
> specify the platform tested.>

Hi Vikash, updated the platform tested list in v2 posting.

>> Command used:
>> gst-launch-1.0 -v videotestsrc ! video/x-raw,format=NV12, \
>> width=1280,height=720,framerate=30/1 ! v4l2h264enc output-io-mode=4 |
>> capture-io-mode=4 extra-controls="controls,video_bitrate_mode=1, \
>> slice_partitioning_method=1,number_of_mbs_in_a_slice=460;" \
>> ! filesink location=/opt/test_enc.h264
>> ---
>>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 89 ++++++++++++ 
>> ++++++++++
>>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
>>   .../platform/qcom/iris/iris_platform_common.h      |  3 +
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 31 ++++++++
>>   5 files changed, 126 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/ 
>> media/platform/qcom/iris/iris_ctrls.c
>> index 3cec957580f5..52b92241e7f0 100644
>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> @@ -13,6 +13,15 @@
>>   #define CABAC_MAX_BITRATE 160000000
>>   #define CAVLC_MAX_BITRATE 220000000
>> +#define MAX_SLICES_PER_FRAME 10
> 
> can you reconfirm this if this is indeed limited to 10 ?
> 

Hi Vikash, This has been replaced with a
per-platform capability (max_slices_per_frame), currently set to 128.

>> +#define MAX_SLICES_FRAME_RATE 60
>> +#define MAX_MB_SLICE_WIDTH 4096
>> +#define MAX_MB_SLICE_HEIGHT 2160
>> +#define MAX_BYTES_SLICE_WIDTH 1920
>> +#define MAX_BYTES_SLICE_HEIGHT 1088
>> +#define MIN_HEVC_SLICE_WIDTH 384
>> +#define MIN_AVC_SLICE_WIDTH 192
>> +#define MIN_SLICE_HEIGHT 128
>>   static inline bool iris_valid_cap_id(enum platform_inst_fw_cap_type 
>> cap_id)
>>   {
>> @@ -112,6 +121,12 @@ static enum platform_inst_fw_cap_type 
>> iris_get_cap_id(u32 id)
>>           return IR_TYPE;
>>       case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
>>           return IR_PERIOD;
>> +    case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
>> +        return SLICE_MODE;
>> +    case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:
>> +        return SLICE_MAX_BYTES;
>> +    case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
>> +        return SLICE_MAX_MB;
>>       default:
>>           return INST_FW_CAP_MAX;
>>       }
>> @@ -213,6 +228,12 @@ static u32 iris_get_v4l2_id(enum 
>> platform_inst_fw_cap_type cap_id)
>>           return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE;
>>       case IR_PERIOD:
>>           return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD;
>> +    case SLICE_MODE:
>> +        return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE;
>> +    case SLICE_MAX_BYTES:
>> +        return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
>> +    case SLICE_MAX_MB:
>> +        return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
>>       default:
>>           return 0;
>>       }
>> @@ -996,6 +1017,74 @@ int iris_set_ir_period(struct iris_inst *inst, 
>> enum platform_inst_fw_cap_type ca
>>                            &ir_period, sizeof(u32));
>>   }
>> +int iris_set_slice_count(struct iris_inst *inst, enum 
>> platform_inst_fw_cap_type cap_id)
>> +{
>> +    const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> +    u32 slice_mode = inst->fw_caps[SLICE_MODE].value;
>> +    u32 bitrate = inst->fw_caps[BITRATE].value;
>> +    u32 rc_type = inst->fw_caps[BITRATE_MODE].value;
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
>> +    if (fps > MAX_SLICES_FRAME_RATE ||
>> +        (rc_type != HFI_RC_OFF && rc_type != HFI_RC_CBR_CFR &&
>> +        rc_type != HFI_RC_CBR_VFR)) {
>> +        dev_err(inst->core->dev, "slice unsupported, fps: %u, 
>> rc_type: %#x\n",
>> +            fps, rc_type);
>> +        return -EINVAL;
>> +    }
>> +
>> +    max_width = (slice_mode == 
>> V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
>> +            MAX_MB_SLICE_WIDTH : MAX_BYTES_SLICE_WIDTH;
>> +    max_height = (slice_mode == 
>> V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
>> +            MAX_MB_SLICE_HEIGHT : MAX_BYTES_SLICE_HEIGHT;
>> +    min_width = (inst->codec == V4L2_PIX_FMT_HEVC) ?
>> +            MIN_HEVC_SLICE_WIDTH : MIN_AVC_SLICE_WIDTH;
>> +    min_height = MIN_SLICE_HEIGHT;
> 
> All these values are made into common setter, if there is a SOC, which 
> supports different capabilities, these need to be redesigned. Can you 
> see on how to make this platform specific capabilities and then make the 
> checks generic to be used for all SOCs ?
> 

Hi Vikash, reworked as suggested. All the slice limits parameters
are now fields on struct platform_inst_caps (iris_platform_common.h),
populated per-SoC in platform files.

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
>> +        hfi_value = max(hfi_value, mbpf / MAX_SLICES_PER_FRAME);
>> +        if (inst->codec == V4L2_PIX_FMT_HEVC)
>> +            hfi_value = (hfi_value + 3) / 4;
>> +        hfi_id = inst->fw_caps[SLICE_MAX_MB].hfi_id;
>> +    } else if (slice_mode == 
>> V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
>> +        hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
>> +        if (rc_type != HFI_RC_OFF) {
>> +            max_avg_slicesize = ((bitrate / fps) / 8) / 
>> MAX_SLICES_PER_FRAME;
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
>>       const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/ 
>> media/platform/qcom/iris/iris_ctrls.h
>> index 9518803577bc..5280ee00d9a0 100644
>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
>> @@ -35,6 +35,7 @@ int iris_set_qp_range(struct iris_inst *inst, enum 
>> platform_inst_fw_cap_type cap
>>   int iris_set_rotation(struct iris_inst *inst, enum 
>> platform_inst_fw_cap_type cap_id);
>>   int iris_set_flip(struct iris_inst *inst, enum 
>> platform_inst_fw_cap_type cap_id);
>>   int iris_set_ir_period(struct iris_inst *inst, enum 
>> platform_inst_fw_cap_type cap_id);
>> +int iris_set_slice_count(struct iris_inst *inst, enum 
>> platform_inst_fw_cap_type cap_id);
>>   int iris_set_properties(struct iris_inst *inst, u32 plane);
>>   #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h 
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> index cecf771c55dd..8a27f246e114 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> @@ -71,6 +71,8 @@ enum hfi_rate_control {
>>   #define HFI_PROP_MIN_QP_PACKED            0x0300012f
>>   #define HFI_PROP_MAX_QP_PACKED            0x03000130
>>   #define HFI_PROP_IR_RANDOM_PERIOD        0x03000131
>> +#define HFI_PROP_MULTI_SLICE_MB_COUNT        0x03000132
>> +#define HFI_PROP_MULTI_SLICE_BYTES_COUNT    0x03000133
>>   #define HFI_PROP_TOTAL_BITRATE            0x0300013b
>>   #define HFI_PROP_MAX_GOP_FRAMES            0x03000146
>>   #define HFI_PROP_MAX_B_FRAMES            0x03000147
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h 
>> b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 5a489917580e..05962d8fbb25 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -159,6 +159,9 @@ enum platform_inst_fw_cap_type {
>>       VFLIP,
>>       IR_TYPE,
>>       IR_PERIOD,
>> +    SLICE_MODE,
>> +    SLICE_MAX_BYTES,
>> +    SLICE_MAX_MB,
>>       INST_FW_CAP_MAX,
>>   };
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/ 
>> drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index 5da90d47f9c6..191154a8ab8d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -18,6 +18,8 @@
>>   #define VIDEO_ARCH_LX 1
>>   #define BITRATE_MAX                245000000
>> +#define MAX_SLICE_MB_SIZE         \
>> +    (((4096 + 15) >> 4) * ((2304 + 15) >> 4))
> 
> Why is 2304 inconsistent with "MAX_MB_SLICE_HEIGHT 2160" ?
> 
> Regards,
> Vikash
> 

Hi Vikash, thanks for pointing out. I have fixed it in v2 posting.

Regards,
Sachin

