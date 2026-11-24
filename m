Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502907;
	b=2YA3xQ/sPpcXSQ5CxC5lVJrZhnyeiAil2SHCXx+/4eSHFvl5NBSeQ7dtu2xJSSp6qSB3
	 +3PV+jZM+/xC6r4JHycsMUKMDUsWAqKHrfBvF+ZtGvhVGkiCSApgDsD5ObF0HEv75W3vJ
	 K9rTL8IDOhTc+Qp9xzlwNRjsom7CQkhMN2hrmzLpgPEoj6NExTSrW8MMrDpDvjEGG/cOd
	 ZPth2+n+U3SKpwQTggHG8LJKQ1RslhBbGtL2INeJ2lu+lu7znmKr02c0rJNQZfY7rMWUs
	 EMT/oxpO54OM0SQF0tlCdKg0kdsYuMeYUwFQb167ixs5AS3I31wREQ79jbOHB14SbyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502907;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iNQoPdF41jHcyVXt/zIh5Q6mYdg74sk6nBChj46cOzQ=;
	b=pEdq7m1Cu35uIhr+TY6dR8DLIn92MlgKd/RJgM8ctVFCNHNlnALH/8tH8QNWYvhC9xgO
	 ZRUKYJus2eyHbgPDQKEjGw4WxyeTJAsbS9rJ7KnwI8pH9Rjsvo9M+a4ZlM2VO6z7uQOsy
	 lSIZqehzmMK1bCz9mrm8WImZLoYz8b2E12YvO0aDS1jXecHpqAAfaq+nB+nZmnhVWeiBf
	 94WSgmTFn3nG9BX2gQD98SCalHDFTOIH5DXtfU/j0EfIi3tALGC1WmUHFShot2d78tCxA
	 v2PfyvS7lBd0S0Zs0yNbcA8UOyU7gYZat2Kbpa4gFBNoE//3FKwm7E0I+d4U4V/pmBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZiW+qKn1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LrcoWNmV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E7C606A32A
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 06:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40E7C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZiW+qKn1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LrcoWNmV
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5mJhD4136348
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 06:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNQoPdF41jHcyVXt/zIh5Q6mYdg74sk6nBChj46cOzQ=; b=ZiW+qKn14vtnE7kO
	MMxIua0092TS+b8gSn9oRuEvW5WdI4qO0phJ8mZiNytOm6vYDuIOui6d/GlPDnM+
	gs5+s7HpBBVSyjNcb7AuYX9ZFKMeOPM0FW1CRAKCbJ2n2B6/4q7wdJYz85rEbIQs
	FvVA7QA49v6lZkIkk5YvTw33UsvfVkBPu033USfWVSb0heJUr3KKzfrySkzY1Vq9
	vf/kl4ly7CIbHdyvfvmo4tQ+BN9e0ENaycUr2V52WRkd3+PE8eLIkHqT59KMIWfy
	T6Fq/pX64jUxR7tsqJGeCuuTuo5gvTcjzcjcI0SyRa4sKVlBXCjZPgeV1biOsc8F
	2IHU3w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpg6xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 06:48:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3869ab689c6so308317eec.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 22:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502905; x=1796107705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNQoPdF41jHcyVXt/zIh5Q6mYdg74sk6nBChj46cOzQ=;
        b=LrcoWNmVRESindKV0msCzLlE9d9XGSteqmNkKvIuFLKwnKjiXu7To3zq3hxVnz/hJR
         vd2M5PdspwixUOkQFlWioZnjkM/7JGbI4IKJ8Yo43IhX4FFaC/XCKj5PxCdMNYmBO4rS
         4uFMPtlp8QU5YQE2Ux3HGx6wJ3hlE/BWiSe00DgvLwkT3ehR6XKNTO74X0IdsypbCi43
         eXu6H83oA2umUDzrMHV0Q3hQ1oxwSWy5lN05uwbzHXPzRNxsAnXEemKggve7EewNVVk3
         a88Hxw1Dsu7nAALg9Hxkgm/RaUQlRAVf0g8gZYNxSoq7NWp4sSusMVNjg9jhsW2412YI
         NAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502905; x=1796107705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNQoPdF41jHcyVXt/zIh5Q6mYdg74sk6nBChj46cOzQ=;
        b=fcW4rzyFm/0Uq2EKaOq+9AGdIBgMab8Jhh18QmwwA9eMuR78MAfiU7/Ofd5/1kUAON
         ZB67dALAVkyqFPl2eCUOD9C3LmhM54iKNPpFA5N/6+LOGxB/BBP/QgbkpnANk0TsWJqV
         VHfYGEmNeaCdj/Hr1oh1/L50avSMOn/C+mRayxZq9ULqPPqZiGsb6Vsk+jYstNPiVHZ2
         1x4UB2Qf08g2RIBHwhhf3FXRvGZ0LpSVeEeF0pGXWT7OW7CnwgnYF+33om+ORavZrh01
         kCE2jKhPDAi5iiB16GehsotWN8A5SdFdIkh2Iw1JCuWQ7HTi3+YQyaKQL7WsEye0ycJF
         iCJw==
X-Gm-Message-State: APuU4Z8X2oa8UjP3dTSjnJFfYM0maD5IPsqeyLfQKhq6Rz24m+7gmVUl
	MvCrSQo8GnKvS4kl0BlxkAFd0BGfxAyUJZqUp8ob+GBEGsz+pYBJHp3WuvAuC4kHNbdD3bjKXHc
	5sG18tC0enHSAnQVaYM8oCfr7WJA2omi/bEGxDVYgu9tmCY6DcFqF52CaGKAxttwqsw==
X-Gm-Gg: AZFdTZdQSKFvs1IW1N6U2T63kIAmADUR5X9Rr5SiOeT4AFNuvMQyIU8CT4icQseJs1S
	uo4h2LO4ZSKy5quW0pKNZhPf6OpKOa7foxBb9itrAWCFLj2lbiSUCLH50DH4V1HCNZbVqQVE9X9
	5jIX9FqJixqfImTvgsZzXvMA1tYpO1X5bB4Fbx22krW5eEKA7RY4avBO/I25t/sLX6v00XsvSWh
	D5x+1qjF3cqQWXeAUCMF8ZBRDrpg/3NT0OjsK1k9/jlYp6mQM5E7mo+xaOoyOPpWRo2JHMh8I5F
	lmLtEjYdaYI+k1E4u18iEwiG0eo2vAax19zrNIv4SXPsCFtyfdZFc6GG/kvLnlXvSefjh30/pRP
	uw+/i7McJzJriqwUPpjAYrDzY9OySR7TnJpFajP0HzJpF93LDPEzUiEFaEwUP1bTyDSOYlMriqz
	9lKtXpoLeq2Q==
X-Received: by 2002:a05:7023:a5b:10b0:147:d430:7322 with SMTP id a92af1059eb24-1b556850746mr19969285c88.1.1795502904893;
        Mon, 23 Nov 2026 22:48:24 -0800 (PST)
X-Received: by 2002:a05:7023:a5b:10b0:147:d430:7322 with SMTP id a92af1059eb24-1b556850746mr19969230c88.1.1795502904030;
        Mon, 23 Nov 2026 22:48:24 -0800 (PST)
Received: from [192.168.1.210] ([76.33.11.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm30769428c88.0.2026.11.23.22.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 22:48:23 -0800 (PST)
Message-ID: <9298f3a5-223a-4f10-9775-1f7432938443@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:48:21 -0800
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: iris: add mahua platform data and enable
 qcom,mahua-iris
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
 <20261113-mahua_iris_enable-v1-3-b7107e1cbcaa@oss.qualcomm.com>
 <9ef9d2d6-5e49-d46a-286c-fa29e83f481a@oss.qualcomm.com>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <9ef9d2d6-5e49-d46a-286c-fa29e83f481a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX5XaGBnO5Hlth
 2WXeZcl8Leose7N+AY4bYbKpp5wNnfcwJ+QuB89vAkn4XLGOPuo6MENlFdygvsLH5/Z4Rdv8odd
 Fy7ZmzhwRDEvudlXAShJRc8cYtNwoDgYQshqUhsR65R8b05sYYWRlDvMziHRok0KCi/HHYC2iJU
 lCX4sbLiX63va3Wwe+Z9o57E5+vshAI2kbF4RgiF+CjwUZeyVxTRews/ExB4kkoyAloimD0O2NH
 zvP6xM3YBwkcdV3Yulk1Njnw2CM+KkcThT6jZDLqO/Gu9XPPI1CWxgsTcKeS2aBdCoX0lGKz4lI
 BNZeMIv2TunYrd5LljfZRLREEsJIrDCWp91FqsVrB847sZnTM7lXxtwDHvtCKxWJL7uB23P1BZi
 X3Ab1Yw2Q5wXN/SNsET0aAfuDgsn8w2+VQxwy+A0z1bfTH0+MMQSWkAclFtPiVWqpMT4IlCxD3k
 a8PoSMKnialw2ft8gXw==
X-Proofpoint-GUID: D69Ra6CRFe0Yyx2TsJhQvf7WTHbZ3rS4
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b05333a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=yYUYPLL3N79xqptAUcuwSw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TyWfFpP1NEjc3mOn3dcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX/tNPYa2sMafX
 BvGXi7cyJzdw+6T+7r/u/r8brLstbKP+dl+XY5skcC2AU4n/0ke7gkQ/YdtfiytIdHFNR3ebE34
 q5KTBA8a5N2DkW6IBLM1FXW84/EK8LE=
X-Proofpoint-ORIG-GUID: D69Ra6CRFe0Yyx2TsJhQvf7WTHbZ3rS4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240026


On 11/17/2026 2:29 AM, Vishnu Reddy wrote:
> On 11/14/2026 8:39 AM, Deepa Guthyappa Madivalara wrote:
>> Add qcom,mahua-iris compatible to initialize the hardware
>> and necessary Mahua platform data describing the needed clock
>> resets and powerdomain tables only for one core, vcodec0.
>> Most of the data is leveraged from Glymur as they are the same
>> Iris variant. Firmware, vpu ops, buffer sizes are the same as for
>> Glymur.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/Makefile          |  1 +
>>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>   .../media/platform/qcom/iris/iris_platform_mahua.c | 44 ++++++++++++++++++++++
>>   .../media/platform/qcom/iris/iris_platform_mahua.h | 14 +++++++
>>   .../media/platform/qcom/iris/iris_platform_vpu3x.c | 34 +++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 10 +++++
>>   7 files changed, 108 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
>> index 48570da56aa052577e05ead12bd26df090d97454..6c187d25980eabcd1c789b132e2f0bffa62fc805 100644
>> --- a/drivers/media/platform/qcom/iris/Makefile
>> +++ b/drivers/media/platform/qcom/iris/Makefile
>> @@ -13,6 +13,7 @@ qcom-iris-objs += iris_buffer.o \
>>                iris_hfi_gen2_response.o \
>>                iris_hfi_queue.o \
>>                iris_platform_glymur.o \
>> +             iris_platform_mahua.o \
>>                iris_platform_vpu2.o \
>>                iris_platform_vpu3x.o \
>>                iris_power.o \
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 1024a2fd75a3ae2b7e194e583b91ec5f16e2773a..817b8a9e2712e7f1e335dbb8600dc033670c5cfa 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -58,6 +58,7 @@ extern const struct iris_firmware_data iris_hfi_gen1_data;
>>   extern const struct iris_firmware_data iris_hfi_gen2_data;
>>   extern const struct iris_firmware_data iris_hfi_milos_data;
>>   
>> +extern const struct iris_platform_data mahua_data;
>>   extern const struct iris_platform_data glymur_data;
>>   extern const struct iris_platform_data milos_data;
>>   extern const struct iris_platform_data qcs8300_data;
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_mahua.c b/drivers/media/platform/qcom/iris/iris_platform_mahua.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..14b085426ac29cf69824d1d0da142c026266a0bb
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_mahua.c
>> @@ -0,0 +1,44 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include "iris_core.h"
>> +#include "iris_platform_common.h"
>> +
>> +const struct iris_power_domain_data iris_mahua_ctrl_data = {
>> +	.pd_names = (const char *[]) {
>> +		"venus",
>> +	},
>> +	.pd_cnt = 1,
>> +	.clk_names = (const char *[]) {
>> +		"core_iface", "core_freerun", "core",
>> +	},
>> +	.clk_cnt = 3,
>> +};
>> +
>> +const struct iris_power_domain_data iris_mahua_vcodec_data[] = {
>> +	{
>> +		.pd_names = (const char *[]) {
>> +			"vcodec0",
>> +		},
>> +		.pd_cnt = 1,
>> +		.clk_names = (const char *[]) {
>> +			"vcodec0_iface", "vcodec0_core_freerun", "vcodec0_core",
>> +		},
>> +		.clk_cnt = 3,
>> +	},
>> +};
>> +
>> +const char * const iris_mahua_clk_reset_table[] = {
>> +	"core_bus",
>> +	"vcodec0_bus",
>> +	"core",
>> +	"vcodec0_core",
>> +};
>> +
>> +const char * const iris_mahua_opp_clk_table[] = {
>> +	"vcodec0_core",
>> +	"core",
>> +	NULL,
>> +};
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_mahua.h b/drivers/media/platform/qcom/iris/iris_platform_mahua.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..fa30f33c5b03b515fa57e52a1b7413406cf5823e
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_mahua.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef __IRIS_PLATFORM_MAHUA_H__
>> +#define __IRIS_PLATFORM_MAHUA_H__
>> +
>> +extern const struct iris_power_domain_data iris_mahua_ctrl_data;
>> +extern const struct iris_power_domain_data iris_mahua_vcodec_data[1];
>> +extern const char * const iris_mahua_clk_reset_table[4];
>> +extern const char * const iris_mahua_opp_clk_table[2];
>> +
>> +#endif /* __IRIS_PLATFORM_MAHUA_H__ */
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
>> index aa03f86d19453a2f3b314d13b7137827d6939a49..0fe485b360d2a9271392f6e5a397211ed94cf99a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
>> @@ -13,6 +13,7 @@
>>   #include "iris_vpu_common.h"
>>   
>>   #include "iris_platform_glymur.h"
>> +#include "iris_platform_mahua.h"
>>   #include "iris_platform_qcs8300.h"
>>   #include "iris_platform_sm8550.h"
>>   #include "iris_platform_sm8650.h"
>> @@ -90,6 +91,39 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
>>   	},
>>   };
>>   
>> +/*
>> + * Shares most of Glymur data except, num_cores
>> + */
>> +
>> +const struct iris_platform_data mahua_data = {
>> +	.firmware_desc_gen2 = &iris_vpu36_p4_s7_gen2_desc,
>> +	.vpu_ops = &iris_vpu36_ops,
>> +	.icc_tbl = iris_icc_info_vpu3x,
>> +	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
>> +	.clk_rst_tbl = iris_mahua_clk_reset_table,
>> +	.clk_rst_tbl_size = ARRAY_SIZE(iris_mahua_clk_reset_table),
>> +	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
>> +	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
>> +	.ctrl_data = &iris_mahua_ctrl_data,
>> +	.vcodec_data = iris_mahua_vcodec_data,
>> +	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
>> +	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
>> +	.opp_clk_tbl = iris_mahua_opp_clk_table,
>> +	/* Upper bound of DMA address range */
>> +	.dma_mask = 0xffe00000 - 1,
>> +	.inst_iris_fmts = iris_fmts_vpu3x_dec,
>> +	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
>> +	.inst_caps = &platform_inst_cap_sm8550,
>> +	.slice_caps = &iris_vpu2_vpu3x_slice_caps,
>> +	.tz_cp_config_data = iris_glymur_tz_cp_config,
>> +	.tz_cp_config_data_size = ARRAY_SIZE(iris_glymur_tz_cp_config),
>> +	.num_vpp_pipe = 4,
>> +	.max_session_count = 16,
>> +	.num_cores = 1,
>> +	.max_core_mbpf = NUM_MBS_8K * 2,
>> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
>> +};
>> +
>>   const struct iris_platform_data glymur_data = {
>>   	.firmware_desc_gen2 = &iris_vpu36_p4_s7_gen2_desc,
>>   	.vpu_ops = &iris_vpu36_ops,
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 411ef7ef8dae957fae1ca47131e84244e3306ba6..cf2e92f440351e7b0aaf19c4c71db90d8a2deee7 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -550,6 +550,10 @@ static const struct dev_pm_ops iris_pm_ops = {
>>   };
>>   
>>   static const struct of_device_id iris_dt_match[] = {
>> +	{
>> +		.compatible = "qcom,mahua-iris",
>> +		.data = &mahua_data,
>> +	},
> iris_dt_match[] appears to be maintained in alphabetical order. Please move
> qcom,mahua-iris to the appropriate position to preserve the ordering.
>
>>   	{
>>   		.compatible = "qcom,glymur-iris",
>>   		.data = &glymur_data,
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> index 375defbb959424df5a6b0033af6e267187f97333..e981c8f93318c5afd5ead162e00690a0c6054edf 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> @@ -365,6 +365,16 @@ static int iris_vpu36_check_core_load(struct iris_inst *inst, bool mbpf)
>>   	new_load = mbpf ? iris_get_mbpf(inst) : iris_get_mbps(inst);
>>   
>>   	select_core0 = core0_load + new_load <= max_load && core0_session_cnt < max_session_cnt;
>> +
>> +	if (platform_data->num_cores == 1) {
>> +		if (select_core0) {
>> +			inst->core_id = IRIS_VCODEC0;
>> +			return 0;
>> +		}
>> +
>> +		return -ENOMEM;
>> +	}
>> +
>>   	select_core1 = core1_load + new_load <= max_load && core1_session_cnt < max_session_cnt;
>>   
>>   	if (select_core0 && select_core1)
Updated in v2
