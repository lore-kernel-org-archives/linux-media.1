Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E87139A045
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803494; cv=none; b=ZK0ZR49cXAn4Jn9ricUg9QUhIo5OEAhiPBJjwOKvb+mOfgpO09L2sSOQV242ik06XpFhtFlbljTsKveYXk+HxarLn2HRqfH7ucD2c5BgJInWoA5VmS8oUde+UKFY3B7zsoTyqVqxApoUI3QWhGLtKgADgNpekNQKupxcQmb+zQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803494; c=relaxed/simple;
	bh=yItWL3c+OS6k18uzUiRpkFbbNdNjokIgL9umHpO/PXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2BGjNr20zWfjtLGIyaYIOgVL0UTHCvZqGJe1H3XyWw090M85UHygnjiXUhSXxU3v76GfBl0Dww0Ke2Eu3R7Fb/M2L6b5Kf5+rLJWgXugLGNenq0aFg/QA/sUup1F5mLEEu6kzQHRvBiYLL9E8qO7dCZkYPZTnkraRxeuV8Dvjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkiV1L/u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAdTgbDe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkiV1L/u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAdTgbDe"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qedK3648898
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HNWzteKUJDDrezgHK2pPHptQNAYDHgVe9x2wwVDkaUI=; b=RkiV1L/ui0O03Dq3
	Mbqz1wRJDuCQ7IJKUywd7PgqochTtXxJCZrkWCIlWmm5wtUJnW36SIxjWHpVIwfH
	Jx8VSuVWZq2PG9rJ7nSk/Y0o7tbslhN4syj7bmcsCHuQHmxwQJTfPO7v95v64UBA
	5jX1k/wZQTsw3Af0H5NKGQAsnJLKNbRk/OAjN8UqXosXNxHX27UBiLXpoH2void8
	ZPHh10F0kd9nsum0MbSUI4ZZLrEXTEIdVZFMPie8y7qIM1hmkCt60n5ab3AFBJ5o
	BHj3tvFEWfg0R2U0g9F5hm6M+vctUhjYOP8yCCY3n7575o5AngKWOhBEE7SLGrPP
	xJEgxQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7jk79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:44:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb7049fa552so494785a12.2
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 03:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784803492; x=1785408292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNWzteKUJDDrezgHK2pPHptQNAYDHgVe9x2wwVDkaUI=;
        b=IAdTgbDeWzXzcckoi4VgyN2ZkG2dhAYmQZbRi0zpLe3tGUHbQCagqDjkZd1r/p7vX4
         3IJDnhjF2btYHi264htnnWWOEuhMbj1ddBVJ/QjUxvubJ1nQmFFA6oF7kD1qdekUOC2Y
         kpPPe4Y3YKifgQt4B78MVY+gToSUvSoYVdIUqidRscXNdGD6qxhsFJsnoF4sO6ubYiti
         KSMwu716Nuy+BE7/8sKjA6mKBsuIVyMXgYezJIkneA9+76hl8nYlzda3MJnX3iHLVuor
         PzB3b+zRDKzMCbemrOIVFHeI7bcLmgb6ZBieMZa+XRIic3AAjj7dj88Okp+/tV7Dlcm+
         hC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784803492; x=1785408292;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNWzteKUJDDrezgHK2pPHptQNAYDHgVe9x2wwVDkaUI=;
        b=UOnIsGC0g4rFPgxuGsFmoS9LuJy1JWTrWuTD2WRKbU9an0TexfDQ04zTbgp5OhGjhx
         dwRA1vFkSrxq9yroXJHBcbrG6gKkxLmDW7UNut/d8+g56EHO99tSoPIom9o8+rYsfQXq
         5/PEqj1Sq5btmq22SBiILOJ4SUE37nkU10zLATKgLYezDv12Q0HUCOen6NyxizvrrjLt
         lPXjp2qzyRA4z+6qmm880VZqUZ7qrTRoMZJeEKLkR+BHZJb4lJkb/6rYzsZ6eOMsduoH
         Tzh5VfvkSKA/tTO1pOipSylitouNnmjC/rnOqEZCGpxK5fZuZqvUzRiwPnKJtEanHnZU
         mp6w==
X-Forwarded-Encrypted: i=1; AHgh+RqUdyVV2F+nVkjHDLkdVGzwghPtZ6xmksOJSJ9tuONH0SJcCBCoikM5rX4B3whJGqibIThnuy07JVOXnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ91iq9mtpkH2JGFNRLRtOwmZdBoNN6VOpzRsuhqjSCbg5jNCs
	swic/eeoxfyyv2Mttk+8szAB2g0QLrlf1qYGOTXOun2uRF7V3qz5lgttaNbEeQhRWTv+b9u+G0e
	mVSsjzzL4K1i3XO6geIk1l9C64yeAxu/cKLPmjkh6bODjNr80GGi5kmmfyN2/NPNBRw==
X-Gm-Gg: AR+sD12Plrzg9Rn2aq/LUX+ie8KNQYlLlXJhHjDM/1zcLiFlbzBqd98tno4wDnSVS6i
	6JJNnbc5XSX4c2PYvTgAIx7P3n1XT0mAmbsseKXENGsAXCrIr5Elz3u4ia7lTShOGTyKQyZgawM
	w3dlbaxt5unq2A9YZXUw5Uy3BJtqEynbrzLV5FpwNXSjEx7u7sm68aMSMtWP96VmdSswBkXpkkQ
	zgJXI+SIcWZskKKXOAiopjWJT1K7ctAZhytUNqwoJieZUNTZTZowOU0aJ+ohFtTnE+9e+oOir+m
	kMOY97b2m/rqACiHkS0BceWFPLhjfi8eraRuPaLqShKWUsIEawcb9H9PftCH61WBCl9tmczZZUa
	PgNoqSGjef/+CRMjeUU3fZTaa0ThhMQ5QyA==
X-Received: by 2002:a05:6a21:6b16:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3c44afceac0mr2620906637.11.1784803492047;
        Thu, 23 Jul 2026 03:44:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b16:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3c44afceac0mr2620870637.11.1784803491586;
        Thu, 23 Jul 2026 03:44:51 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314a4206878sm294902eec.10.2026.07.23.03.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 03:44:51 -0700 (PDT)
Message-ID: <048506d0-7dac-43f1-a50b-f9f4c1d125a1@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:14:45 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: media: qcom,venus-common: Add IOMMU
 IOVA reservation region
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
 <5nIoqMekE2B3CTU4TIlUJxoI3Exckc2sUM9RmZBqboEOvgmkdrhKlRX3-FiMOiYFCWXwzO5pii52NJ6epuy1Fw==@protonmail.internalid>
 <20260722-shikra_vpu-v5-1-3d80babd4672@oss.qualcomm.com>
 <557377b0-7a21-45b6-b62c-d3b34a6a29f4@linaro.org>
 <67c78d88-92b8-44b9-bbcc-6f53f6c60ef9@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <67c78d88-92b8-44b9-bbcc-6f53f6c60ef9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qKMV-oLQgkoO70g9bGXeKpEwTe5cawAm
X-Proofpoint-ORIG-GUID: qKMV-oLQgkoO70g9bGXeKpEwTe5cawAm
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a61f0a4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=JQ8ddJNmfgoLVfyDzDgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfX4cDh3KaMgtkA
 YIYzDb5IRRus9Eiw0ATuMiKX5754tSeNtrOlaYvj5a8UkbjsGwsEnen7MxmwFfMuOLeA5dWPHsV
 hN3qjoxeY5Ir8xXRbQGUtQKkKm6Lb44=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfXxTxW0LB2ggDw
 raIrQYQG/LlvY+6KyykJvJhVrky43kcEKvHTBQlZyozC/kZuvJXoopcfVsPThiwxUQQSfFgqdJy
 hEu0JnN8I3u5x3d4hnuoVJZuV8r1BzgdMRQqMFkdALijFbTXj//SCJCUcBG479I3JYyaNkal6Tu
 JS4Jw8E6Ew/bODYy7kPuDCIf3tz1ksSjiqTGh3arpEJilMXcGDT6+2+OtpuWVw+iiRAgll/8Ecg
 Z9fGmXxaLqb9CdCaBOX0VOcoQp6/dRa99xd30Uef8MqME5l52VXSB1NVbNylEgyLd6SBZZoU7sP
 15hvY4cUuxCFTD4keluPQQjN8pV0XHTq7sZLg739ScdsAg7waymBSgBF8FoQKM/+4OFlbIq2Jpw
 gwl7RiqRG6EDafQgehzfKvt0uxp6AVDe+uAsI1D5Bb/ToaDwWV/4i6sl94hBnFKHovBK0/X7ewp
 XZFFTNNU4oRgTbka4iA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230104


On 7/23/2026 2:36 PM, Konrad Dybcio wrote:
> On 7/23/26 12:03 AM, Bryan O'Donoghue wrote:
>> On 22/07/2026 14:41, Vikash Garodia wrote:
>>> Update the memory-region property to support two regions:
>>> 1. Firmware-loaded codec carveout (existing)
>>> 2. IOMMU IOVA reservation region (new)
>>>
>>> The IOMMU IOVA reservation region is required to restrict usage of
>>> specific IOVA memory range. For example, VPU restricts usage of 600MB
>>> for specific streams, which could otherwise lead to device crash. This
>>> change allows platforms to define separate memory regions for codec
>>> carveout and IOVA restrictions.
>>> This schema update supports existing DTS having single memory-region,
>>> thereby allowing gradual migration of DTS to support two memory region.
>>>
>>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>> ---
>>
>> I'm not mega-happy with this pattern being used - I prefer the pixel pixel_cb sub-node model you've proposed yourself.
>>
>> OTOH you're the maintainer so its really up to you how you want to arbitrate this - the 600MB constraint will work even if its not pretty or the best thing (tm).
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Doesn't this cause the same limitation that the initial patch
> by Daniel (all HW contexts can't access 0-600MiB anymore)?

Yes, it does, but for cases, like Shikra, which have single streams 
(with SMRs), there is no additional benefit in going with sub nodes in 
such case.

Regards,
Vikash

> 
> Konrad

