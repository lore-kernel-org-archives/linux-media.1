Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870313;
	b=dvoK5CeSLklIj7i+mLUD4EDq8NRtTNYnh9Vh1GwTsFxYGVdgpfva0nvHWs8MzrzYrozs
	 b3NOPyryJSBqmyST+4MVTjcTPEfiOuhZAUo9QGrg3avIjBbCCDsoa12Qa85BJV86qRbuc
	 D+y1Z7bJ53jHxTY+FDrTpCQ+ecUHwxVutfy3CohFDErd4ZYE7kyZ/9cneDkd70u/nH6Td
	 9vx8vCSLmAUEQSmuzELH2NskM0zCPlLqpRgSFLBut1a1qZVs3TLD4siPM49gzs8C4+wh/
	 iEtf2z24zjfggK2qAO182NoP8BjJzfSfZwudFRxL/aybu9+wkTpaHHDhEXAMG9X90eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870313;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Nu5Ld/1F/rbxABcDcq4NdZ7MxtKaTOVEMQnSf6SHCkY=;
	b=NYjxahIzfe6dhMPbMQT+JqQdzlo/zPqtvRAvJeCHrQkeHB4OXxQ6nkCLBVCDEhwDitB2
	 hs32gfoEQiaJTHLneUcDNxrVaBiIj4gcJwiKUDG474i0iN1ddFGenR9drr7z+I4lcOcg0
	 d+i4wHJwTIHnDVMJk7sZIC88nuYxkpl3hx/gniXPPrBrWTCxDUV+o8N4RbMzXT5aXi2LK
	 dSaLoUks1WNSGzaMHpWU6iGJbIZDeGgr7GO7ZbylNAN/fSLoS6gl1QfrnWjcNktv41VzG
	 EB33n8Jtr5T/F8KgnITl0XL8l+/lzQSBq1enGKwd9AfbRy9w24W7XCXWacTrZKD29BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EiZLXGt1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyQWOc3p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887FA606A333
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 09:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 887FA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EiZLXGt1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyQWOc3p
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UK6R1018042
	for <linux-media@vger.kernel.org>; Thu, 5 Nov 2026 09:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nu5Ld/1F/rbxABcDcq4NdZ7MxtKaTOVEMQnSf6SHCkY=; b=EiZLXGt1hJ/xxiV/
	sN1+jAlyHPZbyj2AacOxHz1eean0ky98SRnWvdsCNvEgq5ta4v0sP14YT+Y23/oA
	E7l72eTm+TibUI+BrqviZ8lDF4CiKLUH7dTIGqDOUHYd3C+u9tPwI/PBvUanKPTq
	oQykZpwTANZXI0r9kbNkDHzm+W3sx8IsvZCjN9+gKbOfzdVTss2VlrlsvVEEYbBq
	TA39MNHm3DnLtaBGky4aE1sCA8LWGjW95z1XlA9PVc4uFU5uHwUfUU/ToESV4OsL
	Pt6Rhl2W+/WcZLBmNKrxg/ktw8yszXDGgBiveW3kJKEPj9uEWzd/Q9floDSh+UjW
	A7tO2A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bnm92j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 09:18:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso2103067eec.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 01:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793870312; x=1794475112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nu5Ld/1F/rbxABcDcq4NdZ7MxtKaTOVEMQnSf6SHCkY=;
        b=UyQWOc3pZn/33nOWjgNlnzJ9xMl1aZoosvW9ZXEBkwZwlUJkvhLNT90vFh1rd9DqlW
         cBT5jFjnI2pVWLNbqOTDcPhTlsBeQT9LR3L0kh5VBtdB7exSXZV5ej9QdrmsCX+7tlIz
         F1Gdxjja3iKjAWQG2iF2U8WV3w8f5W/K5dNigQDARkbvAVDp65gKh3OYDIekRqcNuFat
         mqHlA0rHm/pU49008grbjG8PEt4eL3rJ/3Zjvb4Ho2GGg1zOIMhEEV5r2F4drxf0/A7J
         gHBIjawPPxSrnbSrOE+Ixpdl1RB4g4PZynD/CTGfHN5etFG/UgxzjO1eYBJVXb6Ghw0E
         ScUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870312; x=1794475112;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nu5Ld/1F/rbxABcDcq4NdZ7MxtKaTOVEMQnSf6SHCkY=;
        b=NX4kzGeEf2DaFrsqQF/Ot/LoJ320Ypp95qMR+4JolBLFJ0l/9NQFXXqTEGJnemeUFo
         ChqoBLncnWnd+RHeaglxZQ0qDX03SCTyxWk7Id0Og1kH2EqgdQGOXu+AblR5ngivNBIa
         OT2Oudai1OFXf+UDopa3eLFhxkmYhCTo8DkIfNG+075KJpwsDwO4ZahOGTArkAezAH8o
         T3n8f9sFFcdnbPuO93/MOyFzlAXg0QuzFvFdBC00q2FFqXOduSgQdjnPvAV52noG/Ptc
         Tr493o+lRsl0X4T4bl3UCiH6ptwZoLbpbweafrLWJsa5RMP6bODKHOfFh9UNbaeP6ijE
         iCZA==
X-Forwarded-Encrypted: i=1; AKwUvByZGif6bhJYmpXyPxXnJjwUJB3Dj1KmZjGeghINvpYM5iAG8ZeHvoY4YkM2VH9YAeH3rKjfa5FKYnDWZw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8DlPsZ3E85EpngweduVq2qvyblbP2ZQ+LLjna1BFNtOPBkYbyY
	N2/vfmdX6Eu+yowSKBUf2aTv6engjpXIhqkZsh4jEEN/0NCcxfBrVrdkscekb6lWEP2uZ69msYE
	oecY9a6ZK4UlYTnhuV8UPCai4hlxEhxW24NILaAcitALHrXeu+2tzLR8e/inCBwwvOA==
X-Gm-Gg: AYBFou0Udq8kk1g0eHXn113+e/SgFhSOcrD4OKOL5JaslzAvAhQh9fnLULQ2tHQHBN+
	T5O0UIc6boMIOTf9AbGlaY0nJWlAZMXE7veMnqDgN7A/U7rErkI4mETlmnxgQh0yGPR2tXPCZVW
	A1EQ+gLM8q5qcbh0K9tUaGh6N7fj/4+6xC3XSt1x6PLX++015WcIPPuORCi4JXs0gILCOuyyN6z
	zZ2FNvK2J0nr4rkj2/Ibcpc0XP08XCok4jQgJGikwTqMQHFXxUHfhQttpnMV7f9VqNvffmQQs+9
	0s8oe4H0hDmgVEZOsccbaqZhD9t1okGdcvStm1oqGJgOVYc/GRbgy0VtsgQ6HN93sUTeauamU7h
	ZZYG66Gleebqzz1EMrTrurMxqdjfCasK9RPOHZqmYWq31DAKNu8tDVTLlY/6nLfX//1R0YMOKzR
	o=
X-Received: by 2002:a05:701b:4594:10b0:1b2:559b:67ed with SMTP id a92af1059eb24-1b2559b698fmr593808c88.26.1793870311823;
        Thu, 05 Nov 2026 01:18:31 -0800 (PST)
X-Received: by 2002:a05:701b:4594:10b0:1b2:559b:67ed with SMTP id a92af1059eb24-1b2559b698fmr593784c88.26.1793870311273;
        Thu, 05 Nov 2026 01:18:31 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm18261870c88.15.2026.11.05.01.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:18:30 -0800 (PST)
Message-ID: <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 14:48:25 +0530
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
 <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
 <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfXz8wSzBsJuFBk
 appq1qMHgH0lNeZoSdAWVhoTW3Zx8CDpXRxeoWYeB87ZliEGrSOthJOx5d6uPnsvXnsGzSWrEnS
 vlgGU6I75OkkAhbbPjqzuBZEW9kS9N330ykjRionsjBmf1AiRvHrJJoUPcj3lCgT8lmorYPADJy
 P6m+hmvtqOi+kHef+97ZoZey7SCu00Q0qwJiJCXzkt9PARiLVTgQIhuRO7vP+q/8UmDl9qmVn6g
 yo1mUyDYzPSAZUC/0ocwuo23pyL3tObkeqJ4rZGd1mUw8TX+npplgsQKyBpNn9+Kxf17zG+EPaT
 10a/UKaXUIgsQ7RhAlW06471sS1s1TODqsyTLozgR2YxVtr9pi6DrcPPLuevc2SB+IOznfamf96
 glUZoaoEESwKCPHDHwUue6oE/c/D83OWl5Wp6jBCNSD3ARIYc9xf+jfNxOsenB2Nu/b3ovBr+IF
 P1YMDz406lL4Mm5Yjcw==
X-Authority-Analysis: v=2.4 cv=KLLPn1Fo c=1 sm=1 tr=0 ts=6aec49e8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Ck8ZG94lijjEDa-JwdwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: r7UUtLDpTOEBeVeITy--r9uLY5Rkcaav
X-Proofpoint-GUID: r7UUtLDpTOEBeVeITy--r9uLY5Rkcaav
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfXzIPnwdXK5yB9
 XNJtybXQJEUZe2lpoM5Az6HtsBFuB2R4W04VFTbCHgG5QJOyzzZPIUBo4nJjv5z1OIqQrO9KLDn
 sVKj1ahGy4FHW1k7eDoCR1RevL122fk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050036



On 05-11-2026 13:03, Krzysztof Kozlowski wrote:
>>> What is the problem exactly you are solving?
>>>
>> The problem is that CSIPHY4 is connected to CAMSS interface 4, so the
>> graph should describe it as port@4, not port@2.
> Nothing like this is explained in commit msg.
> 
I will update commit message to explain it better.

>> The previous port@3 description only worked through the X1E80100 resource
>> table indirection:
>>
>>   port@3 -> csiphy_res[3] -> .csiphy.id = 4 -> CSID selects CSIPHY4
>>
>> New standalone PHY path:
>>   port@4 -> no csiphy_res[] lookup -> port number is id 4 -> CSID selects CSIPHY4
> Then this breaks existing users, no? Anyway, what stops you from having
> there proper mapping?
> 
No existing upstream user should break here; this is still part of the Glymur
CAMSS enablement.

This follows the earlier discussion that CSIPHY4 should use the
CAMSS-side interface index as its graph port number:

https://lore.kernel.org/all/CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+gBT67AdQ@mail.gmail.com/

> Did you find any existing practice of numbering ports logical numbering
> in this device, but some other logic coming from datasheet? Where?
> 

Glymur has only CSIPHY0, CSIPHY1 and CSIPHY4; CSIPHY2 and CSIPHY3 are not
present on the SoC. 

Using port@2 for CSIPHY4 would require a Glymur-specific port-to-CSIPHY mapping.
port@4 describes the CAMSS input directly and avoids introducing separate logical
numbering for Glymur.

-- 
Regards,
Nihal Kumar Gupta

