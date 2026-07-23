Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90CE43B3C5
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802990; cv=none; b=awdzjYtTYKUE3fi185NhceXFdg1We0yUEr6aYTzdsLs+veNjKNEOTRsW3NSu7/dqKMgvpOWH6LHZcWzDPxLWTKdOwNiYwVbpZYQApmqy0C8xOtzOkeliGVU6A82v2sLGqs8dksSDGRzACy3kudOEpIGbcXsBiC0z7XLwYmToAug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802990; c=relaxed/simple;
	bh=y5qoMU8Plv/qJ+DGaSaEWiuWyV2WGbtvMLTUzlU5Rko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rIHLkAaITenuXWbLANNjKyI8xh0x7mh3/caFTd7aspb9KavV2guG+44A7d6aiBAPWuZd5I+Ct1+8eMa3+tXkXARAmTCoZHp+xEToGNFRy4HOKMbMNIov3+WjS4Qdpk8HGa0twekfVnoiwWHPWFYZ8zSvhsgGKWB/zCQoVmi9prQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKOOfrW6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MPHOo8G7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKOOfrW6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MPHOo8G7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8r84s3671647
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8bXNiDzJKS+O8RtIxfJvk28Q/736rLVrJ27qCekjzr8=; b=eKOOfrW6UH7mWuL7
	4nnbYDR3A8MgWCNOVGTu61028VIhm9Z8zCuCBpMN8IvV5t2BIMpOlDinZLeQCNiD
	Yy3CFtNtcvSslBoiBmTak9GCRiLeoPC9XuQXux9n9zjE7xfaaFcVqiq+Rivwyte4
	WGC90U/JYJjx6pJgXJSNYqlcUGdZEVx2bM9b/wCgwuedqlLCyJ09LeERhf8cDyGV
	3YJE8Xbs4g53HNI2UNglrc/vjlNihoZe7+sK2fbhHhMkSL3k0dA0zg6UMjlDx8Em
	K9ltjDIkAvkiX32vHIeS6zAhriBSZd1QWZTyDd6OtzN24NfkmkwjGYuYlErXeTMt
	f+TWGw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc2rv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:36:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso10988975ad.0
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 03:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784802983; x=1785407783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8bXNiDzJKS+O8RtIxfJvk28Q/736rLVrJ27qCekjzr8=;
        b=MPHOo8G7MednRb62GzPt2oeiMrXm13V9LJYqY6+QBBm15UuVYTbcsHDO2wxzg5Drjg
         xFk3CZP5qDmdSvvpZ1vH2bcDWkHQDaur7T+kpFS2LVAq0LRXFcXkz/avemMK3LPD3tZI
         FhFtpkIiF64kz/0wINOYoK5c9amHpQIo8cSUVZ8zuTqnqDaps3JQf49mOdkgl4Og4BXa
         i5rhrdTvvZMzq30n9QJOnUJ8S1hStE2m1/6bd3m/nRde90pnbF8SDNZtb2CeTb91rhzX
         zrE0F0xgUiXcyFPxKLrg++zbB+tzeqEy4Irf55dipT80nv/ooeez7GFcUT1PHoIfcn17
         O0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802983; x=1785407783;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bXNiDzJKS+O8RtIxfJvk28Q/736rLVrJ27qCekjzr8=;
        b=EDxCAXX5cC+b7kxEw+a9DdF6HuczJG6fkptVGsRftzHHHGo67o8CCZTbWJXtC8SBMt
         omj+TN1gm6O4xwvOgaJR3qrHdGxaKJOHgWSEllgr2dVTh4O4Ct5DCD3br1gul0tEyzBv
         Etm3V2/3X71D7dNauV+9AzQPYYXg8opAG4Z3Xy+KVk5NWpgDmzjcW7LagstFQAPmixxB
         FRwTFTsYUQJGloE/h3eMANKSGciluj0CZz4IMb72y0F1rwO3d4cJip9DZUTBV/G4KSzk
         kmkHyE/30uODj4KveLi6A4enZ44MY6PMv1UDx4ufG+texJJs+p6WzIN+f6wCiSqK7IfI
         7XeQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUNTxryeAzTq/lsYeOIZ++DhQDw0Ta9CGQptH6GTXWrcC/yfAAf65Ixw2MqzkKpoD77JHju8lPFwofkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Hoi3cwjmgZ8ru0vtrSeMhZt2Q/AB8SGdIMIZJ+wWySv9Xgpl
	Uy+aH7y+/NzQm/GbYgSCNNeCpiNmf/dczsnFj/DC4v+daI+wYjnbwVZgQ5dr3EvWjyWlkB0xtVR
	K4MZv1fHVFByrdAJ2cGfzoAQOkzVBWdcv5vmC/au4WO0Tva3FOeD8DjMg3nxNWY+lTg==
X-Gm-Gg: AR+sD13AswLmh3oUEUGpGITFHYQZ4qeeOD0HYdO5iUH/CZ3Oag5aKbSbVcuCAZ2HHQx
	TPPHnJ14Y6aRgPFvarmO8mR6zjKhgX10wykbjVgVetJCbrOWEzdk+ZgsxgCg00Xf9QnLWp9LfpR
	iaEJW7IHAsmTHbODBYOvHeeiXmOVy0Q9WZ0UwuUWAOAnJBgaSotAgwKcD9sFUGG7BVOFHZwK0gu
	qoJnkwodu1xp6HRvdLoFBe34cry9M/hr+9VMhAWjrjxS+xU26oqdH6Yacu5Whb9YNjHZ211LQd5
	DIwqsHcbUaLB/XJH4GqtRdK/7gJc4rCTwT1GZ334qv9i7178J1/o/Xcct5McUVhgKHpbynxdmuR
	Ok6aQxjL3Lv71KhVK8106gSd2hss=
X-Received: by 2002:a17:903:1104:b0:2ca:d172:7228 with SMTP id d9443c01a7336-2cfa6b7d4b5mr32262955ad.11.1784802983539;
        Thu, 23 Jul 2026 03:36:23 -0700 (PDT)
X-Received: by 2002:a17:903:1104:b0:2ca:d172:7228 with SMTP id d9443c01a7336-2cfa6b7d4b5mr32262755ad.11.1784802983091;
        Thu, 23 Jul 2026 03:36:23 -0700 (PDT)
Received: from [10.218.25.31] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa2f83sm31382035ad.1.2026.07.23.03.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 03:36:22 -0700 (PDT)
Message-ID: <4c671695-4266-47e6-acb5-04cf4f690d6c@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:06:18 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: iris: force stage 1 work mode for CBR RC on
 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260721-iris_multi_slice-v3-0-adc61a687e7e@oss.qualcomm.com>
 <20260721-iris_multi_slice-v3-1-adc61a687e7e@oss.qualcomm.com>
 <2pksblzjw3juu4dvi2vzvyeyawbka77f5lpc3e4t5cjghowujp@rdqzk5vwnobe>
Content-Language: en-US
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
In-Reply-To: <2pksblzjw3juu4dvi2vzvyeyawbka77f5lpc3e4t5cjghowujp@rdqzk5vwnobe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -unYfg2StvU67emFmYhmixPBRRVeRrdP
X-Proofpoint-GUID: -unYfg2StvU67emFmYhmixPBRRVeRrdP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfXzaWtaXPEo3cF
 DvwsnMkvQd7rxZMk4/Tf84tUKhg97IOlUm2kyYUeHKgFWn+4yPIefnyOgk3CQso+DjwDxq4X0dN
 HgKR1JesZ7utinwVn7h8pW1aFN081pE=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a61eea8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pKpYRV-URZkG9pN1C6IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfX7RDMwgAKuCO+
 N6YfO5Pa0BxUEYwsdVPvI2lVq/Uz5sQiqnC3kE/TFEfU5yzwQVkKWp+jE2zmFNtJ48HTnozhtXZ
 k6MMKZ/lve9+TdgUHroS/0+yPxq+RBThTZoLNgA3dWWeKZfwTrm+iQ+WNCubm25qQt4ZYxQ7cmC
 Ho94FwHdmHlgvfC2vu6xwwzjbxv2v52Gg6GG+Cfb0VJRNEb0MyKGw9t/iO459xJD/EONYbxC8qI
 eYtraaxIfV1o2okm/JTdwJs/2u99jq/ukOmmr3a77HVe/Y3IKEhCSs1MBuRmTUIMw3l+ULwRsto
 W6wo/zq9xpQyvwJS+Tv0o5EAshzXMxBkflGH4SJ6Ze1wiXjrwjyn/VMuU+pWqxJbzKKGN1unsDq
 nuATl4da9Ywlct9OzdE7l/qg4/YwXpalPcE7KOvLEDjzza3Onx5kViPlT0LcXHOa4rKsQapLQAT
 yNRDAxa6oP+0G4wXhvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230104



On 7/22/2026 3:17 AM, Dmitry Baryshkov wrote:
> On Tue, Jul 21, 2026 at 03:23:32PM +0530, Sachin Kumar Garg wrote:
>> iris_set_stage() currently always picks STAGE_2 for encoder sessions.
>> CBR rate control requires stage 1 operation, so force STAGE_1 when
>> BITRATE_MODE is set to CBR.
>>
>> The BITRATE_MODE fw_cap value is used instead of inst->hfi_rc_type
>> since STAGE precedes BITRATE_MODE in enum platform_inst_fw_cap_type,
>> so iris_set_properties() would still see the previous hfi_rc_type
>> when iris_set_stage() runs during initial config
>>
>> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_ctrls.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> index 10e33b8a73f6..d7cbf6c3614a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> @@ -519,8 +519,13 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>>   	if (inst->domain == DECODER) {
>>   		if (iris_res_is_less_than(width, height, 1280, 720))
>>   			work_mode = STAGE_1;
>> +	} else if (inst->domain == ENCODER) {
>> +		if (inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
>> +			work_mode = STAGE_1;
>>   	}
>>   
>> +	inst->fw_caps[cap_id].value = work_mode;
> 
> Separate commit, Fixes tag.
> 

Thanks, Dmitry. Agreed — this is fixed in v4: split into a separate 
patch ("cache work mode after computing it in iris_set_stage") with a 
fixes tag.

>> +
>>   	return hfi_ops->session_set_property(inst, hfi_id,
>>   					     HFI_HOST_FLAGS_NONE,
>>   					     iris_get_port_info(inst, cap_id),
>>
>> -- 
>> 2.34.1
>>
> 

