Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F06D3B4EBC
	for <linux-media@vger.kernel.org>; Mon,  3 Aug 2026 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785746556; cv=none; b=rMUwSpGneUIbw2GlhQpqlSr1yshBq/ZRZppDPN4lt07ogAQm6uj4NwSCHpWNut74d2PxJ6Vv+uTL+mX5ymBi9ELcS0p+hdf4allac+Ysp37DIovlIuGfTzz/ER3J1ZSg/m4ll/9Cu1ENilhyKjQDJB5FP659GP1vtWn3PghAnLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785746556; c=relaxed/simple;
	bh=eJiLOnIfouABShFqiKpOk5xTqFaqmHzOBe1KOVsQHmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kq05YVhq1vhZdgPuTiebd+R2wd5qnWhiB+KSgxqi5sWGy5N6Oi5ljC9lCsIuFEJMiXMCj/pWSTzk4vc4RcTJh13fFeiErYp1sdVsALIlTuCcSXsAh2Zc7mGtuPraPewhqQDY7ItxOJt5O6a3yqZ5spjmBizr5d5buHTyIdY0p8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JI1xzTDB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O++2M3mp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JI1xzTDB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O++2M3mp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6737b6xJ2211125
	for <linux-media@vger.kernel.org>; Mon, 3 Aug 2026 08:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bj1w2NGt2dKOWcMPanWNDNV3sf91k4mIDG8ZGBNjgS0=; b=JI1xzTDBA1h6y8Gh
	kvHK1boUTReNF8SwsOtprhrJuAITsqOrCXQ4e31AH2lT/qbV8zV1Q7jnV3g9t5/E
	WTU1tu0EW21rBkYIueRa5Vjf1Y95gpLkGZLJCTrueghJAe2VmCm0gvMBeYh8joiK
	ncXZ/T0eEg9c6RfjECN1t51j22TXow2vIKpP88Zkv7llCirCi1qi5tjFfCxFLYh5
	fZUsShqgZjPPQ0yscn4d1UVatV7fxda+BnbpOCPMdSpJHE/P/G3oyhAoywN3rM15
	jnp4+rgkZbT0siiR+/CSO3StfOIROvCzH32kcdBLCj4JhPPQzSHF62/GcRkS0UiE
	4wQqVQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftdmx9rdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 08:42:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a3514f912so5756969b3a.3
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 01:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785746554; x=1786351354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bj1w2NGt2dKOWcMPanWNDNV3sf91k4mIDG8ZGBNjgS0=;
        b=O++2M3mp8hAcOc+T9pF+m8xHLkBF354XC6wjfdtdpY21pdHRWlRsqk94FW5DSs6er1
         qakr0JyKotSDBITPTq8hoCLgcq0G0AEKjCma+bjRJcKb+a9WjUtxAYDwZmoiSNu8CYtu
         GCunPow0A2++3LErHhtclmDFfbn4WE2CqJiz7C0gid6Ils4B+kgcoQW6WirTS0sOaUgc
         HXmtgVxuRpKK5Rn6FtxraYfOA9skKDIwwzyEgT9qk0ebWHJbqrmlkfA3Bpcqk211GcIS
         593HJzt4XNmLmqpARweOXGXfKOsQB22A1y7uWMvBSuZXMrQRl9h5MiQULyqOQE84SRLP
         JIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785746554; x=1786351354;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bj1w2NGt2dKOWcMPanWNDNV3sf91k4mIDG8ZGBNjgS0=;
        b=M1mnUzWk8Xgf0DxHSZZMJ5txJ7KOcipCasFIPKqEPqdtgZ9bOEWcuQ3dPxOsI4kPJW
         N9vco/5DwMCFR6oOpx/+HFnFA8oTGWKXXkFdxN10e9959u4lZd86irrzdQM7p0EZcr13
         lxTJM3DWXlCA6QmkTP6VJJ7jXOXdqSXVdQCUNfRG6Z+bVpYWa8VVMZNAH0QQMMk6Sjp3
         hQFPF4wT3FdpdpFs8Y3IWH2UGeQM9LWWnwM6zqCn90DnI8AC6LCvmsRgddIX7Psri7MW
         FFd01/4bB+d1qq5DJf1YGCT9pTjrUYRUG3UQ32ealYHJli6KurzGcnDI9KJtws/uBccy
         bTFQ==
X-Forwarded-Encrypted: i=1; AHgh+RrB1fRUj5bfp8hMocaGsPci2FErObL4pvUe0aOF1xcAiRKkRXXWGOYZdyQTi+5NDgZyzV5X3mS61my8Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcLK1KYVQ2Hu/BRidFU5IF/4UI1lxvN/N/HV8f6nrb/hOG8Mla
	kB8k4Dok9gP1o8m8l5wIkoC1e0zMN46EmjvsEvr9rgiNCoPKdL1XHEY+T5XN/oyNiMcGF7zG7oz
	Vi7/iWYwOTxDvFYX2DDXYTtRF48iuYF+vxRACtk6SlXZCaI6nFEmE7dRc7zP88xxfzQ==
X-Gm-Gg: AR+sD106EkoPoIyIolksGE149GAqmVf5ebCT9LH3QRsEQ16mYaO/+h3D5TSUcLFFy7s
	wB69ehCHJhnoEIrSAbPPun/hOMLzuwmnwM3wWoaY4rzgq4+ccSmfwMRZ/LluFMUjoeqfpFXjj09
	9J2QwSEOC4yKdAcE4CETp4enNokk2w/bNp9WSrqKKLydVWiGGyRrdon/q5mOkg0LKNJYXmlVx9E
	LvP7r5FQD9wT+okPJFf8z5O6MSObL0XpYYAsWsvvuLS2stu1ddgPNdznOeK4TtB/z1E3ijiRs2+
	sTfwE7bahf+5GZ86azEe3GPyg224LB4batDRkyCTzpeAUSvMkmajDOORKMRZZtWLMmbGJvXQnjS
	Vvszrk9OLiu8bPMpcdKgA5h6rXz8=
X-Received: by 2002:a05:6a21:4606:b0:3c4:36ef:3dc9 with SMTP id adf61e73a8af0-3c92a737bedmr9299841637.17.1785746553571;
        Mon, 03 Aug 2026 01:42:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:4606:b0:3c4:36ef:3dc9 with SMTP id adf61e73a8af0-3c92a737bedmr9299811637.17.1785746553112;
        Mon, 03 Aug 2026 01:42:33 -0700 (PDT)
Received: from [10.218.25.31] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm31892240c88.1.2026.08.03.01.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 01:42:32 -0700 (PDT)
Message-ID: <77a40784-4629-453d-bd8c-a3d8c519800f@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 14:12:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: iris: add new rate control type MBR for encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260720-b4-add_sc7280_mbr-v2-1-a2a86f630f57@oss.qualcomm.com>
 <zlvbtffdpmqtwwhknvyz5f3f22gm23qsupg3qp7hagz7j7rhmk@7heecitj3plg>
Content-Language: en-US
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
In-Reply-To: <zlvbtffdpmqtwwhknvyz5f3f22gm23qsupg3qp7hagz7j7rhmk@7heecitj3plg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dxDJ_4lf8hH8516b5ht8nDQH2KKRRSOc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA3NiBTYWx0ZWRfX2uEwp13RjvLD
 kI9RcMM/k2Pkxhz9k0xLJ06PKipTs7+pQum7SC8wJYNMVjn9nkDg3bapcdmvH/Bnx52hIr7BC5o
 6k3UaV2ZwvVoxJDnYmS+KeIzVjP/dEXwWIm86CuYO50sPvZrNeCPf3+GpQnR6eEbVP3bQYMJ4G5
 dxfRyk3M4d366OfnK2XxAVee4RUqtucNAAKR6BsK4XMu1yHTIGPKRD5SMBIfqnzZ+cCFWUtgRJO
 tX6lwcx7r9Shktugk8t6zVcH+ZvwRqqHUpH9TBzyqlOG03TbNeolq0wlRwcj7IA2hSaBPD71L5/
 0Mb6q4zcsJYTaURUyfS4Pd7a3VTf6kIB/dZc9DCdoOkeSLRrHOTVOobpbNSuVWr3J0+C2VsdLiW
 0+Oa2uzza8xlbgkcVoNM1dXANMXMDV6lGC5d3p+3Z+n7bMte/dlkZ1P/5NJ9RdppeYh93gEGGfL
 sr1+FhUnLer91XKCNKg==
X-Proofpoint-ORIG-GUID: dxDJ_4lf8hH8516b5ht8nDQH2KKRRSOc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA3NiBTYWx0ZWRfX/M69cAhP+pzM
 WQL0GILIcr2Ar4MRJ5M3AYQ6BYH2oN+A5Ia/tqZoQVEmtb/xQZwN5wuAz/ovEJqklT6b+uYa5ur
 HqKwn/RK9eJxZtSHs4YqXVXWDEZ4NoY=
X-Authority-Analysis: v=2.4 cv=L7MtheT8 c=1 sm=1 tr=0 ts=6a70547a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-Qk0iqx7Yvh56L0afsAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030076



On 7/21/2026 2:44 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 10:44:19PM +0530, Sachin Kumar Garg wrote:
>> Add support for the MBR rate-control mode on the encoder.
>> MBR has no corresponding V4L2-spec definition, it is exposed as a
>> Qualcomm IRIS vendor-specific control rather than a generic
>> bitrate-mode value.
>>
>> Reserve V4L2_CID_USER_QCOM_IRIS_BASE for Qualcomm IRIS driver
>> specific controls and add a new boolean control,
>> V4L2_CID_QCOM_MBR_RATE_CONTROL, to enable it. When set, the driver
>> programs the firmware with HFI_RATE_CONTROL_MBR, taking priority
>> over V4L2_CID_MPEG_VIDEO_BITRATE_MODE when both are client-set.
>>
>> MBR is currently supported only on sc7280. Rather than duplicating
>> the encoder capability table per platform, add a mbr_rc_supported
>> flag to struct iris_platform_data, and merge in a small
>> platform-specific capability table containing only the MBR cap for
>> platforms that support it.
>>
>> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
>> ---
>> This patch adds support for the MBR rate-control mode in the Iris driver.
>>
>> Changes in v2:
>> - Per upstream review feedback, convert MBR enablement from the
>>    generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR menu value to a new
>>    Qualcomm IRIS vendor-specific boolean control,
>>    V4L2_CID_QCOM_MBR_RATE_CONTROL.
>> - Drop the now-unneeded generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR
>>    enum, its "Maximum Bitrate" menu string, and its documentation
>>    (previously sent as a separate patch 1/2).
>> - Drop the separate inst_fw_cap_sc7280_enc[] table (a near-complete
>>    duplicate of inst_fw_cap_sm8250_enc[]); sc7280 now reuses the
>>    shared encoder cap table and layers in only the MBR-specific cap
>>    entry via the new mbr_rc_supported flag.
> 
> No. If we have capabiltiy arrays, please extend them. Does SM8250
> firmware support MBR mode? Is it supported by AR50LT firmware?
> 
> Another option is to rework other entries in the caps array. Describe
> logical platform flags (describing possible modes, profiles, etc.,
> etc.), generating V4L2 controls on the fly.
> 

SM8250 or AR50LT firmware does not implement HFI_RATE_CONTROL_MBR. This 
is sc7280-only enabled feature. sc7280 and sm8250 currently share same 
array (inst_fw_cap_sm8250_enc) via iris_hfi_gen1_data. Adding 
MBR_RATE_CONTROL there would register the control on sm8250 as well, 
which is wrong on its own. Also, every sm8250 stream-on would also 
invoke iris_set_mbr_rate_control() via .set() function and attempt to 
program a rate-control mode that firmware doesn't support.  That means 
some form of platform gating is required.
In the current change: mbr_rc_supported + a small overlay table keeps 
that gate in exactly one place (iris_session_init_caps()), rather than 
adding a platform check inside iris_set_properties()/iris_ctrls_init()'s 
generic loops. It's the same idea as other platform capability bits 
already in iris_platform_data (e.g. no_aon), applied to a cap-table 
entry instead of a runtime branch. Hence idea is not to duplicate the 
other ~25 shared gen1 encoder cap entries into per-SoC tables just to 
append one MBR entry to sc7280's copy.

>> - Link to v1: https://lore.kernel.org/linux-media/20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com/
>> ---
>>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 101 +++++++++++++++++----
>>   drivers/media/platform/qcom/iris/iris_ctrls.h      |   4 +
>>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
>>   .../platform/qcom/iris/iris_platform_common.h      |   2 +
>>   .../media/platform/qcom/iris/iris_platform_vpu2.c  |   1 +
>>   include/uapi/linux/v4l2-controls.h                 |   6 ++
>>   6 files changed, 98 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> index 10e33b8a73f6..0a979649663b 100644
>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> @@ -154,6 +154,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>>   		return LAYER4_BITRATE_HEVC;
>>   	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
>>   		return LAYER5_BITRATE_HEVC;
>> +	case V4L2_CID_QCOM_MBR_RATE_CONTROL:
>> +		return MBR_RATE_CONTROL;
>>   	default:
>>   		return INST_FW_CAP_MAX;
>>   	}
>> @@ -297,6 +299,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>>   		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
>>   	case LAYER5_BITRATE_HEVC:
>>   		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
>> +	case MBR_RATE_CONTROL:
>> +		return V4L2_CID_QCOM_MBR_RATE_CONTROL;
>>   	default:
>>   		return 0;
>>   	}
>> @@ -335,6 +339,17 @@ static const struct v4l2_ctrl_ops iris_ctrl_ops = {
>>   	.s_ctrl = iris_op_s_ctrl,
>>   };
>>   
>> +static const struct v4l2_ctrl_config iris_mbr_rate_control_ctrl_config = {
>> +	.ops = &iris_ctrl_ops,
>> +	.id = V4L2_CID_QCOM_MBR_RATE_CONTROL,
>> +	.name = "MBR Rate Control",
>> +	.type = V4L2_CTRL_TYPE_BOOLEAN,
>> +	.min = 0,
>> +	.max = 1,
>> +	.step = 1,
>> +	.def = 0,
> 
> How does this play with other rate control mechanisms? Will it allow
> user to select multiple?
> 

Both V4L2_CID_QCOM_MBR_RATE_CONTROL and V4L2_CID_MPEG_VIDEO_BITRATE_MODE 
can be set by the client — the control framework doesn't prevent it. At 
apply time, iris_set_bitrate_mode_gen1() checks whether MBR_RATE_CONTROL 
is client-set and enabled; if so, it takes priority and programs 
HFI_RATE_CONTROL_MBR, and BITRATE_MODE's value has no effect for that 
session. This is intentional and mentioned in the commit message.

>> +};
>> +
>>   int iris_ctrls_init(struct iris_inst *inst)
>>   {
>>   	struct platform_inst_fw_cap *cap = &inst->fw_caps[0];
> 

