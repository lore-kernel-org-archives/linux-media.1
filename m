Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808062;
	b=f34Vk215/vKznsdvXLXmBoTW0JlWUD4aQO1V145jAEpRMm7WEuOlXQKekpuI6IF3g/jy
	 C0WhLe7l8LcaiT3z8JJIN5SSXleLbtN6ej5yIDesH5MlZIiJbbP0dxD1/fZra0+wgND9w
	 esgijPLS2XmPBa9XfGUkUiUeOD2xHbgQpUEIEmNospvuWgnunTnWxpdwV7cAeUvBHU1fO
	 bBs/SLWJil5JTpmrAfU+ApCmDyn47jWiqwlHFGzLDeLBx69L+YtNkVsgYoH8LhGvyM+o5
	 YEBKFoRuD9X7f+3coYskPHeictFf9kYipLPtXRmsNT8TxC6dVoui8cCdbMBL7LB21Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808062;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T2+TPF55DbdT6gwJabH431isQTzz1ZSRcjhP+pQhvpA=;
	b=NOM7qOvpEekBfd3g1NanmLpu6JJlGv4rB8JgOLsaOWDe9BmQZCIL5X6VNbxM5nhvYOSp
	 zJkZFLD1tRFXloMLcL8KMzuSIA5OpPzcBmfO5GKiyWuUi32cpr8kuKPWHIsP4UBrpwL4I
	 76graeIerLN2dW0cnNNpWGSY/pV+qn956TRol1IYgV6SsUUn1FSF/Q49p2jC3RpbA0x3c
	 rJt+jcY4lcI+y8LOU1wQ1WK8ZCyyXwQOe+KzdHGDTGjOLh3P1etC7bw74mLftrmvkw3NQ
	 RzBWW06BbDmel4jiKd0NXalY/B6RAemm3Mkyznha1d4eZy8PBOUW9BI007nXMni2AFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z66ZL+Nq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQ3iSrt5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315A1606D80D
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 16:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 315A1606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z66ZL+Nq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQ3iSrt5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjCF6664814
	for <linux-media@vger.kernel.org>; Wed, 4 Nov 2026 16:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T2+TPF55DbdT6gwJabH431isQTzz1ZSRcjhP+pQhvpA=; b=Z66ZL+Nq33OF21Nq
	hNQa6hnYbWiydHBV8apu90US4rEkmWHkMro9EHjfuIOLaXSa1VneqduSmkkVtnrj
	ZAzkcaF/pmZL0DQ94206yApfGmt6WD/9x0oZww8GNZ8PVnM8jSIbnC4MNtSGtb/S
	ikh4DTZ9lNWbSbxZ7tPm/0lDQakQakb3nOtTSiPzl4sSJcp55y6dFPXxZnAPUxgq
	+GRhCRe5SCq2PtBQsztmlJDozcmlrKRxWBL5DXuH8OOhBk2yiNm1Rn7Bho/fbSgK
	k5Ig9wpWqssmRqzpsLZtWFxIYp2W7jxiA0RvuHJopnkBYgjR/4R1BBrzengOLmjK
	58Wbkw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb0as3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 16:00:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so1120309eec.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 08:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793808056; x=1794412856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2+TPF55DbdT6gwJabH431isQTzz1ZSRcjhP+pQhvpA=;
        b=FQ3iSrt5l+Gly3d/s9mW+b8J/QfiDHs1jFqxOmZkrtWARbbKQ1T0Xz7T+uycQacBty
         aIrjXK4cBHHA9BWZeP4gNlWDu75x3tdQpOwlwIGRpsJyYgzQHdKBCJJ07LezdEBDvrpj
         3g/r+5/NiUc9S/Ir2Y3Gq4E7LACvBcU1vXkanjL9KKLJGMnPfT4uap4XR3HBAGSax4MU
         RPDgLGfv++tYx6WYn7+Zx7G2KTqaFWsoEiNh6qgRuZavTGx/5DAMZGfC/iZliSVwme/O
         7hEXx5nsz+IJib5oxjKKjwwnnCzSF3RtGQbxom7m57DoEozNMtE+Ks3xoRt6bFJmAtWw
         E2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808056; x=1794412856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2+TPF55DbdT6gwJabH431isQTzz1ZSRcjhP+pQhvpA=;
        b=22fiT67ztzD/noI9dBL6dJjs0n5nVMcX9CzqiT1tKKc8IvZyKe3W/DKuLeiDQdRYSk
         ni0glGTnzq76UshGoI7oIaS+LfA5tpcPGmoOwbjnF4xOsIkXfqpXbHfJBa96xZlDTARY
         lrIwXAL13nM0RP3ExMEEdnT/vRRA4KzbZKDjMVF5qqUMMZioQ5CAe58Tkmi6/WR0+8qB
         JB9PiHwYXvI0s0MkpBlP7oHbdd/L8QpK5f9hH2cjQKTeflqzrCpD82feAzkoEbwWjEQm
         DRl4p7aCjlZTHQkdHcAgXmud1BKYOHCeo8O5pEcqlqKT9yYylOYPyHauAscTPNQXId7k
         MIkg==
X-Forwarded-Encrypted: i=1; AKwUvBxI7m+j6enTwW4E4ay9Kbi2Ii9HqcUvI1yoOw4rV4uXeqrqjzp4TitvBUa7QbKGAMASTNrhusUAW+kqjA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/CptsT8lsbLRNdnFx1MmHCvcyTOiaZMUQbJQ/V+UFPRjK7w73X
	0k66FEZxdF1QhAhWy3TdjA9PdA3bTFOnIbCqbI7EJUv6NJCn76EaK+VSwRxR40X7L9R+z71JSHq
	eH4izR3XgoOrufmKkfGQJZFp7qTL6j3YDYi9aj95wSbEo4IortAOukH3HwNBlubE7DA==
X-Gm-Gg: AYBFou2plT+s25FalKRQyPHJvyoRFQKShfmrA1Agm1npu+27yREr/vA+M2QxvF7t8LU
	TxKTOefzFe54SjgcbB1FGWFnMDm/gxKtJR3x/j5+G2LEcjYaUD+/v73uw4/iwHoKLMix6W/QvnQ
	NNsQP0DPCG2no1GLH4Nps0eM3oweIzyjwogxiRVJdTkKCrV8QqaKRiRWq6MCxgzfqhEzbK7zREv
	HmVzApVKqHbnQcySmTcbJEaVBrsNISfjRcjub/1eqLY79LpE9uAejktgxvBATYCa7G4eN1DRLfF
	yBmTqGzesRkXqW78YRwyk/Auj2lwsMEzSmjugAnAASPGwPDD9roCUDdg905PsLRv+OKEdiIlzD1
	s3KQlW+TFgx6y1COhUF2I7EF08UkR1WdBky2GEXY7WduAFE5+aUSFH1Z/onXUvfnDk9RZn+nfyM
	A=
X-Received: by 2002:a05:701b:4348:b0:143:6525:f9f6 with SMTP id a92af1059eb24-1ac5c369c74mr25241328c88.13.1793808055957;
        Wed, 04 Nov 2026 08:00:55 -0800 (PST)
X-Received: by 2002:a05:701b:4348:b0:143:6525:f9f6 with SMTP id a92af1059eb24-1ac5c369c74mr25241268c88.13.1793808055141;
        Wed, 04 Nov 2026 08:00:55 -0800 (PST)
Received: from [192.168.1.10] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm10164081c88.22.2026.11.04.08.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:00:54 -0800 (PST)
Message-ID: <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 21:30:46 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261104-real-nebulous-ostrich-017e92@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MyBTYWx0ZWRfX1AkGlWgq5MsJ
 TGG2UXWC30/kvv7lzBlt82rsqjWT982kTM7GGONzPQjZ1fvOB83rZf1tXvAnD/hAV7U98DlJiG4
 8Sd/5xK37DuBk6qLLCzOaeXMH/ky6Eg=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeb56b8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bxh7C7Fz_n5UA06wMvIA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: HNwiDQPHQclMbD2mHOfLB1Pytrufl22Q
X-Proofpoint-ORIG-GUID: HNwiDQPHQclMbD2mHOfLB1Pytrufl22Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MyBTYWx0ZWRfXzaAB5KfcpKKb
 pCHKxwr7mdX9EwqinuwYvgh7+CF4mxTFQczWy0PXUzem2LgEI7xx74UqbH8ppP4llmVw0GkMXPA
 CBKnzZURvuddbp6dQLbiHXRhgCovDWzRF7mbqNVh829w2SPdBjjTDlzY0ugElRzsO1lgnDVa5o4
 Qr81KiOA1y3k7FrDgB2zTLhhZQRkdvc/ZqlGm3CmJcuCjiaTHx7ZGbmiNOfJ1+N3Do0xFufjGe4
 U+7/vHxz98k+EG5ddfcPtr/n28mCkO0yxGKdn1Yj1zHkazRcFRBQbdJZW/rPRnl1O3yoScKsmdt
 FGyTirEky8sR1YXvRe6zLnIog95jE5cFOJ9XMwW1IS+vraVWNQ8pL18McWpoty2VanvZ8O1w2jG
 e07jK3FBXKKcyM/zdxZXrhIEPh4pAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040063



On 04-11-2026 19:22, Krzysztof Kozlowski wrote:
>> Glymur describes CSI2 PHYs as standalone nodes, but the CAMSS binding
>> still models CSIPHY4 as port@3 from the X1E80100 csiphy_res[] layout,
>> where entry 3 carried CSIPHY id 4.
> You also remove port 2 without explanation.
> 
> 
>> Describe the hardware connection directly by allowing ports 0, 1 and 4,
>> and using port@4 for CSIPHY4.
> All this is confusing, why do you introduce gaps? What is the reason?
> Your datasheet naming does not matter.

Glymur CAMSS has populated inputs for CSIPHY0, CSIPHY1 and CSIPHY4, so I
used a sparse pattern for those ports only.

That is confusing for the schema. I will allow the continuous range
port@0 through port@4 and keep the example limited to the populated
Glymur ports.

-- 
Regards,
Nihal Kumar Gupta

