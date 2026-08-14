Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614A53AE1A3
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 09:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701005; cv=none; b=QFR//DJkht5wn9Zt3TQOcd02YmMoIuQDti2teyzJCcXHiyAscYQ1/FUGAGBlISdkgVxl/a2gnoB9XQbjWOhJhj4+LGxJR3tyhqSPOklpK+DfvtKU1CxnwBrDTYmjuOeGVh7aaiiRMrm0SkevUxTgMMS6HgXGCLr/PEnYXMpyQ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701005; c=relaxed/simple;
	bh=bbuQsLL8tNbhWQV7ZzutwSkYT7CQTJBHS2BgGEjkN+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDyfgWf+aFNO4IUmKSTbWIe6x42epES/7dxD+39weEzWUQm5AatxQSXJbC1cXEysaVw5sdJvgcar8sNeyow0aQftVRfuHorVLjVSUCAM4wyWXGFZrafF6ThnHsnsG486EtAdTdlU8iir61ZiZIxeX77k5TQ1zb9FL6voa27M/wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOBIQGjm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6FTqVic; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOBIQGjm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6FTqVic"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E9BmUG1224258
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 09:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bbuQsLL8tNbhWQV7ZzutwSkYT7CQTJBHS2BgGEjkN+c=; b=XOBIQGjm4V9isW3l
	VDkpseqsgGD2+cB+YnNpYmbW4TQ4ODlfHtk2vfDuHPycgr4Aezv76Y1fKN38bIZF
	UywzS4RnJ3A5RTScghTyCICdQIB3zGEmDTpmAWrACd+L/PSDL+SBQd55RE+B/5oO
	OVZVwU78ddrE3UL57ZfftmCFRMjbxkCDGST2CDz8g+N5WH6CdnQhNNTPZb2rZPY+
	7OafYnNF4Q92gavDv8Kl3dZVTZyFpslWSC7Xbvgd5WFo7qHluhk8n7Ln9qv0HgAP
	yrIkTYqsFC3ThGZeKsjMPJ/5AxIrtlWEcsVHNHNmqXv5t2hWaqNiSPjxlTor/ZTA
	EHaY/g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g206384p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 09:50:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb92868263so529434a12.2
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 02:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786701000; x=1787305800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbuQsLL8tNbhWQV7ZzutwSkYT7CQTJBHS2BgGEjkN+c=;
        b=F6FTqVicCAheKUYaH4Iwd7IU8nlJ4eRS9TL53o/y/BqDtmJmEvFUyhLl1S5NnOvfcG
         NEnf464IBWciP1Gigs/bb79NwVlSViAoYMiJM0GxRPpWKY2N/oaazb9VttgXfftwa6rF
         f+EGV9vAKAemWvwIi1SE4tbfa300qu4T8as1ojfHMr+JHLkHVUehncUDkRfG7rG5wgEp
         vap1whjgLcqFiStecZiL15JilMiMJf6Gl/PqbLkCa8/nsPpOnn3tmUSvwLcDosqajEFf
         ou1HIPfhZSVbStGzRFkUbBbvaQbzdKRn5i7zZegThbA/rVMRtBbiqMVzgUjstHb9yVkW
         xp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786701000; x=1787305800;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbuQsLL8tNbhWQV7ZzutwSkYT7CQTJBHS2BgGEjkN+c=;
        b=rf1jkRS6u0aQVVPpcEXFFeaUjsFSAIxIE8ATJ1I+tllUR6HSTATxg5PykBzcpf4efM
         xAQ353nUXOd2J7vA6wyGI5ERMmVPi0fBgHKGOEljM+rq/O49xfVdiTPmHZrDu5hq8NBW
         Xa7VISniVddxsLENivXohG8ZSk1SrloSUG2yWjOm9g9IIfSwEylBl8VzGorON2hu8bSY
         JQMzg8Bc06qMWsXPwh8ENrStIMLJxDUgQ5KWPXSFE+ptDq9MN3kIH5DRauFZpzQoYLrY
         Gtmz/TphsP88j/cmtxUCN6++RupyBllNjnPpFPBtTfFU8gWqxjQ1wtfNrCssOv6omnN7
         U6aw==
X-Forwarded-Encrypted: i=1; AHgh+RouCBrs6ippKbhGKdTsImqhyY7ifp2uDH81QhGeURjdGk0MJEq/JpCw5ljUzMtrf7HCIgVzyZPQmsSFjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZj4z072qqtH4iZhViIOmQYK4xFv13pWnRXaF319VfVTxOZDLL
	wCMDmsBV7J3o+rezdYnmtpI4gPJEBD0TG4vEpqALleoWaZKFB45seDZ2tEmoe3iwnKH1/G8Uqka
	XkKuR1rnY8BtKvVD6aO85ZFgZicFx4p3q1c9BQzx5Glzp5Hxp7QV5B4N/VQITq1FxBA==
X-Gm-Gg: AR+sD12YrR0BbkhkYGMd69bB8fnJTKpkUPu1XtdrqrNDkm7UoXk3h8Q0M0/YDeu43fk
	9a/TSR9jIA/4OhcWG0tiYbzNgi8lzBWliuYLT+wxA0AgY1d48L+H0bbvRGGmlCFIoqtjS1kxisu
	pLASPhVC73wll4DZLOm24awHI0HsS7mcALE92NJ9uutED1NoikURJsSbgqVFZMOgA+XV1SL+F/5
	/16mLpYdG3Gf1e2Y1mS6FTDZNH1CbLKix+3223fxYaq3UvkaK7WtcgN5VH3z+oXHUtFnYuxfGtt
	cIqCyQoFvOsh+Xg/w3+YWYatvvxYnG9+bTJwMoeYNGL0A/PaBogujv2Md7RcqBa4ChHmWBi7uwF
	kJN9TwRQ4zwjqLldz9xDZpE37st33knvG
X-Received: by 2002:a05:6a20:9f93:b0:3bd:3800:7538 with SMTP id adf61e73a8af0-3cc71de3f87mr4852492637.33.1786701000059;
        Fri, 14 Aug 2026 02:50:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f93:b0:3bd:3800:7538 with SMTP id adf61e73a8af0-3cc71de3f87mr4852449637.33.1786700999644;
        Fri, 14 Aug 2026 02:49:59 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd9fd3sm2621667eec.4.2026.08.14.02.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 02:49:59 -0700 (PDT)
Message-ID: <e287e538-135a-4eb7-1b21-55b475c844e0@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 15:19:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc7280: Add dma-coherent property
 into venus node
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260801-iris-fixes-dma-pseq-fint-v1-0-aba0cb22f6ab@oss.qualcomm.com>
 <20260801-iris-fixes-dma-pseq-fint-v1-2-aba0cb22f6ab@oss.qualcomm.com>
 <20260813-frisky-augmented-crow-fd5d3d@quoll>
 <4b34e718-0878-25cc-a5bd-0d8858df5133@oss.qualcomm.com>
 <30195e14-0dcb-476d-af0d-f85ee57e2aa5@kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <30195e14-0dcb-476d-af0d-f85ee57e2aa5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA3NCBTYWx0ZWRfX0ULtzYbUIN/K
 jmQRBn1GWjHQJWqJgPDCe6cL1pdsGYdQIJznAJh5zHdXHKTrzsFsuFNXY1X5FPm18Ml/8pg6ZX1
 c2WZZaMCGPJ5vSXoAe8BQqv5HjJvSAU=
X-Authority-Analysis: v=2.4 cv=Z/Hc2nRA c=1 sm=1 tr=0 ts=6a7ee4c9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=V9F15ByMrN-4acUeBR0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: mUQRupjBNMAjUyWRpZo3ete1hNtYYO47
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA3NCBTYWx0ZWRfX/1+ID/+8IXEM
 pn1/3UmBD1ACldpnUlUWi5LNX3cGEVXtLQA2nwui1qFncCf+idjt/EcKxu2g57wpewgvuFcRJls
 SEznCZ9SpS08Teb8wcM9Y3DP7va/r7kxAytToTJBj0xir2w7MQGbFHlmUoWCCz3s9wLVD1O5iwG
 QvzWF2ySgl/5NSdHAq7eXQ+ueKOmHg8RSXPc7royz/pO9okOYzbGK7oB4rtiYC99olinchYvr4k
 xy1SAbjgEdgeIl27EBEnuCBh/bECSPWc+BFtWjWJCcXPeG/wBfS9QaWauEwzfWHj3+p2iNjrSsz
 KThMIrfOdwtF3bVASCEKRQO93KO+hS3RdF4HpNW2oxRAp6xnL5YqMAyJwz/JbPcAX3eVkkVqgRJ
 WToNzgLpJsDp7/46aq/6vlJmXakYnvv1uddM+K4gT7ivaZckGkip9+VXjbbkLetMoEiAyVt4zdO
 V3CyeIhqUntC70oTS4w==
X-Proofpoint-GUID: mUQRupjBNMAjUyWRpZo3ete1hNtYYO47
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140074


On 8/14/2026 12:01 PM, Krzysztof Kozlowski wrote:
> On 14/08/2026 07:29, Vishnu Reddy wrote:
>> On 8/13/2026 2:49 PM, Krzysztof Kozlowski wrote:
>>> On Sat, Aug 01, 2026 at 01:07:28PM +0530, Vishnu Reddy wrote:
>>>> While testing with some higher resolution clips, the venus hardware
>>>> triggers a fault due to wrong input data being received. Corruption
>>>> was also observed in the captured output when the client dumped it
>>>> to a file.
>>>>
>>>> On debugging, this was traced to the venus node not declaring
>>>> dma-coherent. As a result, DMA buffers shared between the CPU and the
>>>> venus video hardware/controller are not guaranteed to be I/O coherent:
>>>> CPU writes to an input buffer can remain in CPU caches without being
>>>> visible to the video hardware when it reads the same buffer, so the
>>>> hardware receives input data that does not match what the CPU wrote.
>>>> Likewise, on the capture path, data written by the video hardware to
>>>> the output buffer may not be visible to the CPU, so the client reads
>>>> stale or partial data, resulting in corruption.
>>>>
>>>> Add the dma-coherent property to the venus node so that DMA buffers
>>>> shared between the CPU and the video hardware and controller remain
>>>> coherent.
>>>>
>>>> Fixes: 37613aee2179 ("arm64: dts: qcom: sc7280: Add venus DT node")
>>> Really does not look like a fix. How skipping a cache sync can fix
>>> anything exactly?
>> dma-coherent tells the kernel that this device DMA path is hardware-coherent,
>> so the SMMU maps its buffers as cacheable. That attribute is what causes the
>> coherent interconnect to snoop CPU cache lines on every VPU transaction, so
>> hardware keeps CPU caches and VPU-visible memory in sync — which is why the
>> dma-coherent property lets us skip the unnecessary cache clean/invalidate.
> You just repeated what I wrote. What for?
>
>> If a device doesn't support I/O coherence, its buffers would instead be mapped
>> non-cacheable, no snooping would occur, and the driver would need explicit
>> dma_sync_*() calls at each transition. Venus on SC7280 does support I/O
>> coherence, so dma-coherent describes that existing hardware capability to
>> the DMA subsystem.
> How does this anyhow explain your commit msg? Are you saying driver is
> buggy that it misses sync calls?

No, driver is not buggy here. dma-coherent flag is missed in the dt node.

> Best regards,
> Krzysztof
>
