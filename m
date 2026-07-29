Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9B847A865
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 12:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327670; cv=none; b=TdlrnFDUzrLRjieIalWQgWun8L4k8Deqemr8gcu7EJm4Y2BoWP8+q+sPYX0z6F0XXLvHF0fwNq2dhbZ9RBeng1bI4Zb725QVUJz3wAq/JXJjayoTvQqYW2yWiAWRekq+bOYHgy4qQq/IhjPzuXYAsw2Q5IZ4UlHhvUJtvR2N3Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327670; c=relaxed/simple;
	bh=ZtcaL6QuzTdO1mo/regAXILXVX98ZdiaHF6vmeAsTXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z3Ck2kqFXbd20l1vLaYhGQJK9aR4fT4jLSYNZBn4x0an3Su3t0yb264rQpJM0LBxWk4wsjGJkiF55haIgo285xynNc+3xcHezj8PVi4fJbhBKrjsTPxezIbiugk/0czV5kdbGsUainitGtmS7RIN64z/RbiaNzZiEX3mp1RV4lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGb1DLyq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jy6Hj1we; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGb1DLyq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jy6Hj1we"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBXXpE1218126
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 12:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SeM2xcHhZitweZ+bwJX8AXEasPFrzj/T75so9QyUzag=; b=PGb1DLyqzrUhk4Un
	56irEINRb8qA3XKWJTWoJ4heXrwUxBcc3XZ78rnDiKJHXj1c9Ff5rxih3V7rPku2
	lxKtOdKUJ/ARrHsOoo+7DKW1BtsOWGqjZDLQ3TqChvihdN7P7VxqJpfqjH06LGK9
	N6zCHJt3N4k5EOwMPyKtPKGMvLJyQWWPGbHvCTx8apbaRHyqHRNVtknGxZEfK0f7
	J6Wl2B4qC0azD9QRzR/eiPoYoxARKzlSanLASq9wYx7Tvt/zuRxSHqj1VH9o5LR6
	q5VjUTgo6V4F4PQZx4j9ZWi24kNJK+8JDvh7qisYPheDUhOzf8Yvlzks9GNbB20q
	+Z6rSw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrj0687-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 12:21:06 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-74ab6065f97so15008137.2
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 05:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785327665; x=1785932465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SeM2xcHhZitweZ+bwJX8AXEasPFrzj/T75so9QyUzag=;
        b=jy6Hj1weowSGxNo5Z8KcVvQkP47q/QBcE3tB+oSjIAKWuO0NMAAIj/sg9ivMj4OoTy
         9R6QxqeNZguYyRzo94mwD6afRCQyPxFnrirlfSSuW/eYJeb/O1lrOxHDdIq4Offs1muZ
         MRMi/m5nRriJtGP32Ee3xM02HQr2Ygs58Qtu7OmzqIkuLpHnicae8CYUA/H/olUXNN4H
         EvTnj8L1Dx40x6KiL4rV5HLgxd3x6jzF+pFYPLT+F8hEC1WCMeDAVmvTajtVQ+FOguZP
         drsqc93qp8iUOkQcBYmrDFOD07OTy2KZw34ZAWCBm4a65QRK3rusZGirQX6ZPqFpaRvA
         JhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327665; x=1785932465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SeM2xcHhZitweZ+bwJX8AXEasPFrzj/T75so9QyUzag=;
        b=R1P5RW5CYjV5F/qokta9b5UuLEzjtaBZZN3lVBKUHefTivdqzG0Az1H4a1vkM1q88+
         28A7Doox/P2SO5JucEi/2AgAVaxJU8OTSVYsUlv3PBSk9Pvfaw2tCHif+zTgQUTqh1Um
         ivbtke5VXsrAbHM7jPhhpQaXWd5QvBXEJx/0Ilt+kah//grlb2aVKYQ8uAEnR0PZAZwr
         Uha4kOzmQudq1kPC3B6PLR7DJ8m1qac4KXbH3II5hDTheqwddFib4xmoja4Iu2tVw8Y8
         cCcrjh6VTCd+Wgdtg1H4nhVHLxR78W03WOPoebowm+88zjq/7bN7viYAy1nuZdtvObok
         LdBQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtbIv49redHFGDqam4u/aS2VbdzaYl1PSbmfxr3UYO9dOpLk4mylO9Nk2FBPaW7ftEglw29udnAitGfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YydvnQ/LIXCtqhBJ0ceKogGKZ2Dj1JIsU8ekDV52ximzjWspVzy
	SMVNdBEMuLz8ajdQgIdqAt0tw7nZnzxI8C46VAgUtk+2gOKkxDEBALLcR7PBkOYn9PSOxFSGl2/
	EJyOILuCJrBDo3ahWqzzkyXZbRRHrQ2kRLwWhP2CK6nIDxkSshgbKVKEMh0QRyKkdag==
X-Gm-Gg: AR+sD12eYipOXk7Epnmq6N04XfA3icLTXn+6uDRH+LYFS4mHJ/bO2dKLZsDfiWqTrkD
	+soNh3qedp78YjMHVVcJZ2T4KRl0Z1JfkPrqjSGDmhVtSbrQDfoC/XSSKPgPBq2GvXZfFhBreVj
	MvgfsFWybECnLAQfMTtA9eG1ToXyKplXEGXLmmzX90+9rUyyVSlaqjIb8HluqVTDRace8/QYqwJ
	GUpYkh8uprRrbFyPkRa2ps+e1OG+Wlvf8XoQ9PSTOFgH+HpW2XLRIPZjVfva3qlDB/K/eQiqHts
	1/anI6200WiK//MfOSNeYQwCbPWmgD+SBGd8QRE2Oo4Gn/v/kHq5Vb7vVhA2cHlgO8IDDFbmYfn
	pGs7SvCVq+wdUv7amfo+9Y8Bq
X-Received: by 2002:a05:6102:3591:b0:745:17b0:10d5 with SMTP id ada2fe7eead31-754a1ba976amr1346975137.3.1785327665392;
        Wed, 29 Jul 2026 05:21:05 -0700 (PDT)
X-Received: by 2002:a05:6102:3591:b0:745:17b0:10d5 with SMTP id ada2fe7eead31-754a1ba976amr1346972137.3.1785327664972;
        Wed, 29 Jul 2026 05:21:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f8f981705sm53136666b.9.2026.07.29.05.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:21:04 -0700 (PDT)
Message-ID: <c3131fcd-c2ff-47e2-a8eb-858456b88ed9@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:21:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: media: qcom,venus-common: Add IOMMU
 IOVA reservation region
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
 <048506d0-7dac-43f1-a50b-f9f4c1d125a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <048506d0-7dac-43f1-a50b-f9f4c1d125a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RJOD2Yi+ c=1 sm=1 tr=0 ts=6a69f032 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ablQDHkhG-Ar-HdMcfIA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: vJHYq76AGnWyhWXfII0Jzb7LXTlpjZ2r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMiBTYWx0ZWRfXzGFZ6v1MxyZ4
 hW6NNQhXtLaED3WQWeuK9Gct3KOf6RfcHZL335G5DpU4o2hhHtWZFNNGqCUavSST4lTkc5emLZ+
 2uYAABaPNKQLwHIHBjqGAyoXy/KFbrxqZX7kDQij/wt9K1wKGMXCIkVghl3VGhaN1zQZyurMs3M
 n8RTSOWqO2BVID1rR1Lpsd9P761Q+L24puowaccNqtA2TfYqNhfwwXlxVrCytDM3x/Lhbl55ug0
 HYzzy2P5ymPW7wcXdku8DzgHunftDVI0iQwPWYB9czteqgJqH6uFSXVxl1eVlWt1mKqItMbUAjt
 f8SbLy8IfBNHKGP1Vw3d2ycdFHIkk6uGIaNtTbXUwu1z1slwF6bCxrTKFsApGyOm6c8rIvMzTVD
 aZJj5gHMUSPnShoS95KVpW63kHIK/6qwQijMZ/fGYJvcV6+uXwB2j4s10TqwOSMei9gyzA7OMhk
 Bg5MzP+vrOv+7vrxG/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMiBTYWx0ZWRfX5HdvkpruOrm7
 9oQdVD9FostL4+etyG+UWFOKI/nDDXr3Gup92PEvQD/Ud15FTgr4NMxiYpNQmb/Zus13Cku/zvP
 qFk95MJXMhKgT4tDyTD+mNkPCoToPRQ=
X-Proofpoint-GUID: vJHYq76AGnWyhWXfII0Jzb7LXTlpjZ2r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290102

On 7/23/26 12:44 PM, Vikash Garodia wrote:
> 
> On 7/23/2026 2:36 PM, Konrad Dybcio wrote:
>> On 7/23/26 12:03 AM, Bryan O'Donoghue wrote:
>>> On 22/07/2026 14:41, Vikash Garodia wrote:
>>>> Update the memory-region property to support two regions:
>>>> 1. Firmware-loaded codec carveout (existing)
>>>> 2. IOMMU IOVA reservation region (new)
>>>>
>>>> The IOMMU IOVA reservation region is required to restrict usage of
>>>> specific IOVA memory range. For example, VPU restricts usage of 600MB
>>>> for specific streams, which could otherwise lead to device crash. This
>>>> change allows platforms to define separate memory regions for codec
>>>> carveout and IOVA restrictions.
>>>> This schema update supports existing DTS having single memory-region,
>>>> thereby allowing gradual migration of DTS to support two memory region.
>>>>
>>>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>
>>> I'm not mega-happy with this pattern being used - I prefer the pixel pixel_cb sub-node model you've proposed yourself.
>>>
>>> OTOH you're the maintainer so its really up to you how you want to arbitrate this - the 600MB constraint will work even if its not pretty or the best thing (tm).
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> Doesn't this cause the same limitation that the initial patch
>> by Daniel (all HW contexts can't access 0-600MiB anymore)?
> 
> Yes, it does, but for cases, like Shikra, which have single streams (with SMRs), there is no additional benefit in going with sub nodes in such case.

Please note that somewhere, I was under the impression all venus
impls suffer from that

Konrad
