Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671674;
	b=xQbtNCy31N47fhLsNh9MPbgaAC1LJV+pXSFok7YNO9ePrpEpkEyXLrgUV/RJl+niHZbC
	 RW4apV0gNKkmSUob5nZg4Oo2QmuruHiY1J4az4xiWeGi6lgGsQyb0uYB2QH72QAvXa+q0
	 okxjeIB3nOutrpuGugT/TzQ54HdQ78rON7VVs9KVPTA7dRfsuDcYM0k3jwm5q3+NVeye5
	 gT+3Lajm+y5x7mNXaH5dtHOTTfv6slsBJkCieW8faXTtyiq1NjG7+zyk8UgRUYBDs6eJO
	 2xM1y01xzVw4NIXT09dGfnJ8C1o9sUEjbcRpkNmPihKhIsw1HFgH0RPjy1QSRip9uBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KaIkBumHdEKKdnazl1dkdI7RsBJJnknjh5eFZLYyAK8=;
	b=LcbfUFt3Zc+f+o5i88vSOMQkTGref9uQGT/5qodnJg13xLLjBj28iTdFVpA/A33MB2br
	 wMDsdUhglb+e0PYi+9WrO1OTSC95AJZQQutfkN6WrSR+MZj4ALdWPOQS+irdbwTLV2hKv
	 /NB92bIpwWfPzTfDVD0IGq8yH0GerRZray6W8ujZVhjh+ZZd1cvDj5ky8ApaqBMYzCAUk
	 Jwzl0QGj0hWyFe8tujSzHIrPaaLXBmktiQXMoEOxwEEavt+1GVwivW3+D9vFlgs47qYAx
	 awtlipxK93wOnHe0H6DDIig0Mp9Up6nrfa19iGkQCpfhUFAVn0mf5aVPw/4LmDv1kNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHbdAQM2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gYkI/hat";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B268E606A32D
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 05:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B268E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHbdAQM2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gYkI/hat
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36WjW1647604
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 05:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KaIkBumHdEKKdnazl1dkdI7RsBJJnknjh5eFZLYyAK8=; b=XHbdAQM24AiJSbus
	R9doTO40p6club4sn6vQEj4a9nZB7tEZwXJl7ZBUiVq3KVrTin0EEyYqyLTMBix2
	FUoNg2y48oSp/+ujhKn7jSWN5sqKGucDTXffGKMfVPmYfWg6pLsu024bNiT9QOc2
	aSyNbANF+QMDFSMGO4C1jkUa7CzSFkXefKO5QgLidvf74XOHFitpLl/QUUl9HAJV
	J1LoFcK2AyM1YX6fPvMLkwlYTHVHJpc0Ak0jRlQqPIUAmKrgZejygEi65NObCmrM
	VFm5Ijgon/b8GdyxEhPMXUDPJsv0XgGzFnHR6bzzmrWLcxlMaNDxaIsWy4hoamU6
	MRttcQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahtvsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 05:41:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd65070d3feso3611376a12.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 21:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795671672; x=1796276472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KaIkBumHdEKKdnazl1dkdI7RsBJJnknjh5eFZLYyAK8=;
        b=gYkI/hatiBmPXLGsPcbb3jeDbEFgaUC4qtveRJrp2bSNR45Hir5JVjCAVZlx2z7vlt
         7Kv3sW6Qlzh0+cER/Rs1RXj6c33h85FPPGq2MUgTEv7CzdPRlaQ3F/THNgxk09gSMer5
         UEIwNu2vsP+74DApaddlDeM3P++L0bR7C4Nly4h7njB06zeA9R9nIgWB9joEyDAajdHI
         KM4gtxwhHofkTkPJAw5D4YO71ruDmXusDUzwcDaSufiDgWUH0sek1P5b9aKw+RrYRfhr
         iLDY8INI+JvolOItUZr/qXDR9tlqZk4N2pgAZ5Ak/zvCLSjNHerWxF5rn3uP77hcsxXx
         XB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671672; x=1796276472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaIkBumHdEKKdnazl1dkdI7RsBJJnknjh5eFZLYyAK8=;
        b=TiW2uOAw6HJT93RKW6CLAp5tQNvqN1BhzZpK75ao8iRr/7gf8EjxF5FgtgKAuJHKhv
         4BKBNeBR3T0pUeVRDBhzV+qMAhFa1IJnr7kIvoCT8CRFCZdMmuTFcsxUl2HiZXyUNuJk
         OpkNLRnQmHVQRnPAJpbpZUy3W2PeXWjPqE6EpFKdIuMe9/n7fqmH89LVjlGC1pUF1Hn+
         KtqCFY5RbevFVL/Zpy07cQSl+29WjmJV+G9X99t9NNqWZduWgK1kzU6HnxtuUJxcb2df
         DVUBM2hmU6IVei8HZz7n8MbLjb52eWQNbncs9WTRvHeNHYJrktomNVxD3LTAaD6dgHCN
         ih8w==
X-Forwarded-Encrypted: i=1; AL+hErGRwxWgvh20fRH3eScejIuA5E0Vebf5mC3fq2W8jjaDXKcCqz8YY02iZO+DhOCfJ7Ucb7c9gsIv95hIEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9+tbaekOk8xSH4bUTPAK8sqHLMRflb8qotzb9WSvQyC3g0LvH3
	/r3AaDEjoLiL6FL3jy2XszpsEJL+6c7KMoxqq7cwPp19alE/rlArmbU7NlM70+fNSrCxvPDc/Ho
	ceQ98l0DqIAazx3rtLOYqKICWN+lkTOK9flBAR8qAUKPwxGSqukNEO35Rm4Mko0n/8Q==
X-Gm-Gg: AZFdTZf6O2PswrNcYf2fKFkCtM1Yvss9GS5geqoZXKvs4C0+SVPZdsU+/66Bb/3Svst
	b5psbrtlpe464XUbk1NTts1oxPC9VgJnGgEcB/itH+j2YB3dZqy0KFLQ2TT/JSDBBpC2mQ4kZKd
	2uR11OoQO+tdPJ3SGUG9jZG5ZO6r24M+NXbWiVMuZSnnC1WsO+BGtwsaWtyvBijvgrOFfH3kE+E
	RUUDXjJSBZEAm7A43NSV2T14Eq7QAk9t6h8yPttyM/43mAWqmzG1y8tsytM1DAbbFtj07AiFrPY
	4Uw6s173cgQD/0MmLxzWyzBgH6rC2Uovy0Rrjw9r8Qo5JipCQKb3R3JVL+6bn4atQgSssnq+4re
	EQb2cra78++VpajaAGFUZyr72Vo/u7wjMWzDpZEPUideMiR1hGhuQ54EpQi6RlZNAYZsuZHVT4V
	aN
X-Received: by 2002:a17:90b:4490:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b41c7bbef0mr12554572a91.1.1795671672154;
        Wed, 25 Nov 2026 21:41:12 -0800 (PST)
X-Received: by 2002:a17:90b:4490:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b41c7bbef0mr12554548a91.1.1795671671671;
        Wed, 25 Nov 2026 21:41:11 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm33365160a91.14.2026.11.25.21.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:41:11 -0800 (PST)
Message-ID: <238a552a-ca4b-4997-aecb-fdaa278ca1c4@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:11:04 +0530
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
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
To: bod@kernel.org, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
 <179561294019.462348.12092000419789488599.b4-reply@b4>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <179561294019.462348.12092000419789488599.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6QA8kUof6WoIfVbWpwBIeaXe7WKvs7qd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfXyDJqcRQj+0r8
 FF6F/JmEeonEOkD2uCipHqfjleMcrW+D1kHhPvlOJjAASjDUJOH2ox7o/g8qHx0j4gpOWP9gvKg
 fYvK8hCUzq04Wvwqq6eEfVMIZ1C3Sb8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX5Maz689hzvUB
 UkHalo/TCDqInlqWnByxv/UtCSogmbvDLNXNpNjf6Xrwa5rFIyEU/l/XD5xiWbywaXhdkUYDusG
 VZ/5JEGfCjZTEAO5IKSZVhLKGN5K82GgwAyHH5T/PBwzNgr5rfPb/cO0+lEFL4TuwFUvHPztcmS
 MyMTPdeGa/3EOsHMssfIFtQJO25e0xwVWkr0Ujqly5SWZe+iw0oPhitxYK2qMweTmGvDqiKcS1K
 Ps43yhfMLDAH7St8K+fjwrpLqbe0ocAanwaRh9PJAt41kLwGSkQ2ntYSy4kGdy30hflWgCMzWLC
 xlrtaFygL41UoHax60dJVFqpAjvIipd9lOFYFQ/yo1u/4A8LMwhSIsjEAhWmnC49EIpJIG/6gCP
 Wo6Ru4sgMaRpQO8WnsdfRwYQXpFUMwk0aKVZMO9rrxdF8jjh8WK8APChf4f5oGaGYzXkk0UF1tU
 XkAVZ84i4gZJuUPwIBw==
X-Proofpoint-ORIG-GUID: 6QA8kUof6WoIfVbWpwBIeaXe7WKvs7qd
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07c678 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=CZpgSDYph55k4HqUXiUA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260021

Hi Bryan, Vladimir,

On 25-11-2026 18:52, bod@kernel.org wrote:
>> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> @@ -16,7 +16,11 @@ description:
>>  
>>  properties:
>>    compatible:
>> -    const: qcom,x1e80100-csi2-phy
>> +    oneOf:
>> +      - const: qcom,x1e80100-csi2-phy
>> +      - items:
>> +          - const: qcom,glymur-csi2-phy
>> +          - const: qcom,x1e80100-csi2-phy
>>  
>>    reg:
>>      maxItems: 1
>>
>> -- 
>> 2.34.1
>>
>>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

This series is already present in the mainline tree:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml

I am not sure why it appeared in your review queue again.
Can you please review the follow-up changes instead?

https://lore.kernel.org/all/20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com/
-- 
Regards,
Nihal Kumar Gupta

