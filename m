Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621D748F016
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767073; cv=none; b=RXc9XQrYzWqHXg4gJ+ssuPSj+zIcgpmhPJ1qNlk0RrUH6idHzu49MANo7bS3Q2JxaAoCd1ETP1T5ub/1LeI/VWw2XIjj6BoOSEdgyNxQPXZN5pN0F3lMjYmduBHMv1JzRdVukmBqmJ6qD4fK9w2UDAAmUTUhqVT7NjR+OHk6ZxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767073; c=relaxed/simple;
	bh=nVli7s7SIG9R8Ak8hDj233cUyczfZaKTWK1A6eda47Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B7t1GMJ8AjVjEF0LtR2e1T2PeYBnffeSV+n9uWWBNYQt0F5GqrzEIvxkRbIMEsWXJVeXujdBO/LsptpLRAJQUQwpQTlR2nHIK0rKjcNiuK81IhBvrYYFQnlI/bqfYXWIzdEHr08Ksz1+YoOcmiTxIBZFRELF1M2BgENFFTOHAbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=on+Amdzh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y51V/9w0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="on+Amdzh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y51V/9w0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7au5319187
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 11:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jN1MJymaRVBcVG6FKC724CFrGIYLlKb1UrrRV1ot6zc=; b=on+AmdzhiABp4AVN
	jlvqS8amDfM2NaX3SIIGVQW3fAGlyaI7+iZrcM60b+77ycX+JEi4k7SWTf48cOux
	lcrxtIeSUtGLKV2lHpEVhwXfJTYBfjiI5YDHzeK1VisBmqwh6Y6RjFSTBxTB6uBe
	KBspyxMzrO0LfQZhE3SOJyrAr7cwZwPD9TaSraeb+H8ggWhE9A78FMQ66lvHiWIO
	QaaEIaN4I/VgRwnwnSZIuz4vfGQPCPpeEvEYmguwYjFCcMF6WfpU24pn2zKTlmOK
	ZSWD3GW43+kb/NMGJorv8BInNiw87hG97x4XY/LBorbyHSJtzRkoKDKn9Gc9y0z8
	ek+jhw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0mfabc5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 11:17:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530d522a20dso14518841cf.0
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 04:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790767069; x=1791371869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jN1MJymaRVBcVG6FKC724CFrGIYLlKb1UrrRV1ot6zc=;
        b=Y51V/9w0GsEm6AiGZCnaUD23jiXNlB+S3N5lkk5YvyaZpGAcP8eWyH8TU9i11YGI6X
         Zpy8E70ei4IIe3GDPLC2ynn818KgRTw6oYDAjkRBHkWBrSFBLTASODymmXsD1iddk2OG
         qiSz8DI1u3Bh9whLAvfb5KBVqEX3BrNMnp++c2AS6GaaLoqedChEltVTqJ6EsziW3yQ0
         L6Bd8Z0BXa3sYIOzp43by9skMjq3wUBabsYOk/TS8vGoa74SSN4RfDQmBh4b9V48gAU/
         +KHvThnnToNoUXfov+kD8uVInpem5LReWMlCsv9unwwFSuJHIGEbWg2DxU9mdvsQhbRz
         UDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767069; x=1791371869;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jN1MJymaRVBcVG6FKC724CFrGIYLlKb1UrrRV1ot6zc=;
        b=1Bv+/be4MhJptFhi85G4WgctiRR91986KxrEhlvMfk5uXSTnY3OiSrgNOUVANVcToL
         Wha52tOVOg25ujoJu2f/BGunVMRoHYY00rN8RDuB6rOKVfXEDrBxa/z6m4j/UAEpUyWd
         jhk8Hrssq0BdZH7N8Thql6llVg/RmE8JufKH3LjQ6ep9TcXgGApXZXmwijaXgVQkwPGk
         Qduk7CyIhESnnTGR/dwXjpJ/26/j32kMh1pyIsDHR98hob++5YY3FUCanKAoIrwKIrAP
         PP4t3aXsshfSaoy4ggeh9NSNZAWUFkUL0CWjhvOOmKJRLHKMDVATz/usdZarr74Cy0zq
         gHKw==
X-Forwarded-Encrypted: i=1; AKwUvBwauIhzJPeqYYL0dkCrXQGnZFRy+5dypl1Dq5LsZrUFupwLQI/nUqLgQ7Pk4ALXpwWkWoHUd2Yb3IAuCg==@vger.kernel.org
X-Gm-Message-State: AFuF++njfdHbxuC8go0T6e88A+NYe7oZJRJE2mL6rWYy+tkx+YH4V+q4
	1QWFYZjVgePz7SuTSyel2n5ZiXLUKVRxjWO74BW1VSmDvjJL5BwSjRAY1ZAC5MKnh7/fgquLmWQ
	2eCptkcvEqzKnuwqwntmPJPMBtg6pnGkuLN0Bz3cCXiE8JNmv+rcEHVenMot62W2koA==
X-Gm-Gg: AYBFou33Zrabwb7oKqZVXr9j9avxcK1QM70XsgVVq7TaFqW9nBinmkszdkJ4MjsAlM7
	BDgCjTds1qxlm2Vx9xIRwTA9Okt4kohsFsIJgh/Q3uEf68jheD37O/lF3LYs4mmJh2+WSlH7FGX
	81ikSHJGeSIxUJfqbXu2tdcZNtGO01+/HXG26UjEtkb5MvsAJ2IvzjO1t6o+/YnJr0wnEyRcvLz
	dqwX07p3O69x1mcx91XjZxzvnrWxITtnLtM/kReI/uEf3YiCJ/rsNJp3YrKzWwZSpZTdB31LKlX
	MkKNVFGLm6lKVT9Cg+DStLefPl//Pu243psMxsXCsfpiEznCbtEj/6LSQumDBFD770xqML2PlBN
	OsnJI1L0OSDx4P9GYWb9Qng==
X-Received: by 2002:a05:620a:318d:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ca980197amr163468785a.4.1790767069541;
        Wed, 30 Sep 2026 04:17:49 -0700 (PDT)
X-Received: by 2002:a05:620a:318d:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ca980197amr163465285a.4.1790767069147;
        Wed, 30 Sep 2026 04:17:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f61b18sm51194166b.35.2026.09.30.04.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:17:48 -0700 (PDT)
Message-ID: <317c7e66-e4b8-419a-bd52-38430a9ed6e7@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:17:45 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: hawi: enable iris on mtp board
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
 <20260923-add_iris_for_hawi-v2-7-016ec3d24b79@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_hawi-v2-7-016ec3d24b79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX+6vKjRx8LIJs
 c9gJkxXuCJ9VBT1FBey8jXbrJQR5m4LOkotFXjRQPHxIMjEGaLut29r6W89OYy1Nh2XgS87T76S
 nHi/8OBZEMlSjV26BVxLzHuHhuHIMK3GqJAN/k9SvOPBXX4+jDpYRxHeQ1339V6iUf8+FPpQGlw
 23j6Bq4ON4Cjyh6ILPah27lOECPjer8D6rIpVkhu8jk7Ms6JdiIxCn+/3qRdgrb48dj3sMnsp9b
 /7pW8R75ZPwT4Hx28/Xv+U6hW0CzP8/Yzy4kcTN8p6n9jjbMNOmnx2ifPjWJ5k9XnBOprP6T6V5
 uc0tVphb7e3ITZuF40cpsvYpooss7J6Wl08ho6/R5XR4NZb235frutDP0wMth1bON3A3NjYG9C6
 6jgcxhNZlnKRG1ut83jkLOjT7eElzcUa+yzPZX7Xldd+/ynV7uvOk3oaVtapKFeo4x/yAvsN4FW
 pEVfGonmgkDShQ5rL3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX9TzSYd8fgf+K
 pps3idZVEVwnhrLAfGGJtR/KL/1ewdlqN+2t1Dsjpgcfg0CzGionE6WyrmEWCrrfoSmFfVWG86W
 HCWK0MEiOL14e+q5tMzCbR08EeeaS1A=
X-Authority-Analysis: v=2.4 cv=RZEFmFtv c=1 sm=1 tr=0 ts=6abcefde cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=AG5diU-uafisgQmFzkcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: vLb91QF4COG46nnBdLBd21MZM9bRbgWh
X-Proofpoint-ORIG-GUID: vLb91QF4COG46nnBdLBd21MZM9bRbgWh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300044

On 9/23/26 5:27 AM, Wangao Wang wrote:
> Enable the iris video codec on the hawi MTP reference board.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
