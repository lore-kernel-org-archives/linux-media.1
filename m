Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CFA332EBB
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 05:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786685339; cv=none; b=BB8J0lwB9DqHGUobN2S+xdWs5pzc2TH8Y0hDJ81ZEQcE0sp8IKxsYgWOuYPlYNODEJaWFDjDTBLHQKQXbjERsbOhBKy82gVlcLdnZL5E2rYZ6Bu2xhepnuAe2BHVkJOBW8QFhUdMUXtxvZqJihcamskHRo4IypHewWPmu2XQsrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786685339; c=relaxed/simple;
	bh=fiIorYuwQdKLyxfc7Axbk7gZDVZKalA0vc4EHt8rVjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TXe9jIddkjLT3v7bPVXqUJieSkcvA2PtACV9Ewe/5CjmQcdZ3qEP7jhW0xsL8kxU+07zXYnHv0uEiOfRnjTSUiYo/ImB5Cz26sYHM/LsTzSCFQFlhE4TViscCFjDdtSvlURiUGmuEaWcaBFyx4Zyd9vR0O2dPhQ4dHdGQm+iH5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSzyXrxp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OV30ruE7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSzyXrxp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OV30ruE7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4iLGB292039
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 05:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ZJnLmavSs5ydP+8z3gvvG51/+kfclGe/xcvpERwJ1k=; b=bSzyXrxpV0p8faUS
	dNTRkPMIj2TNAsmu8WCTDu1z00AI82fUwyVKH8DfbsluFPQqCDeUJjZQLoweN6P4
	GTVjWcjmvfbdWEljbjOoVVXgCm3jgYBVEVNHuLgH/rxu+23rbrV5+/AynZh+9gDh
	NzpNj3xs81J6Mw/sHHb5kD0pF/WjeZDJodVz0TqdqZClQfprOqshVcD5prh3eLTV
	a6xJGVKDCZV9xbthL9ZlFo5NZ/LsBejzfQDKhd0Z1E+2R2fzOz4kgte+H4KORnna
	xO8lrkK9zRPt41Or/cBw+XVxiYiipm+zmWLrQMUFofHtjR0uHLVoqIUBvKfjgfiA
	xCDJRw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1v8pr4te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 05:28:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so1355303a91.2
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 22:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786685337; x=1787290137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZJnLmavSs5ydP+8z3gvvG51/+kfclGe/xcvpERwJ1k=;
        b=OV30ruE7sI1oVTHHuoJ4Rvg6cGXojNayCB2Es7qIO1fZGBMY+iPkGvqsO7LQJYHqC0
         b9uV9zwdWOlv+3aoFczcgzTJ6liS2PkkYQ2PBCrhSTMZX4egSbYnu1qCNkyu8sIQZz3o
         yiPaQDY56jn8JzwJfTUwBa5wWgENcwPRc8LlJvteuzYNgENgaBUW0twhlCsl+abL6Ow0
         JNJ7HbpTEUXbJ0h4RefqyKAudQbFngTHY2AhJs+hKN4L/iKkkKnBR1vzwImVQPLyh2QF
         T4SHB32f3K+qqBDgb8DcqRxorvFVPQ2jQpqNeXNFduP1EQAfwYtyEHllzVRQ/ms16mfD
         ExvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786685337; x=1787290137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZJnLmavSs5ydP+8z3gvvG51/+kfclGe/xcvpERwJ1k=;
        b=oKpgx7SIpyif/bG8pbQSu8zVpS8sv/VIuocOGBxqOwBYGyHkBB6VUBIfKs10Slr6R2
         XaCzmbXdhezbmfhdBQUlkSItZNAzhZD33fbPuyHKqAuIuKMZzGmaTGB+SD+FaFSxnR2O
         kw6hJGGLm2oWAj9Ehaq7clsWOMjkAOv9sIGjTMf6DAkO5FvuAfLLA5gBmUNWif3TBiAh
         xQZfp9K7vgS2xdwIDgPGrj5ziUyxPcSKEFX8Ndh6oAj6PyZz+QWJ5MHCgY3RV/pGIvWF
         1bho3c+wnzl5MjZsi1Ew6dkWMdvqDhcw0goAyWnrsbRdRvIARXcDnwyqtGpoMiHklwds
         Su3g==
X-Forwarded-Encrypted: i=1; AHgh+Rr0Ep57iasUEfEW1PjqbpNSUOxHR3zw6Yeskyr12FGpaHPmLeAbQnQwQHSil3UcLS3ACWARvZwxp8MIBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSeUll7dXby0TC1XA4asVufQU1umohxuJv7/gWslBtNWjp3MLd
	9+VNvmATTglj+MqJTnIN/zF/ZomlZQ+CRM69kjFYLhYHt4JKa/92OxjMn8pO3us46mBCW3duOne
	woXxdRc70OwcHV7waaArsphOzQHSTpElPWNvdypmXmTSmaPWIl8nXL4qvhDbys0Oasg==
X-Gm-Gg: AR+sD127FwITBI1+MQx0H7F1gSTUv7CubJ7R/7sADcGetaNfBBDNmUI4fDk5+7oHxQE
	vmlPo3MNQ+zHTt+X/PU5RN6xDAID+WS4A55wSCab06nSRNcg9hCCI7DLYO3kAtYSTQwXx1f0hey
	T6RcC6YfEV6aKgKtP9Yrr+Rqs4OfpDl6wL0ZCBszFpoKq8mmT8A/DpAFrBpEEb8cpnpkR4t6gut
	wDOd2crk8Uj83xR6JPlJUx22AMKAKLSPjZ4uW1GNF6vt8JvpEfG4K/uVPep7eXqKdUv/vmMRgwT
	d6PlhmBaUdXk4LsCXLhbKZhtFv+E3jWUGDgKWpjfdHet/NFGP4rq/b0QzQejRmasvYcv5vQwkzS
	TaDu9dOnQMtZDUotru9kWe4Sso/JHh3b/
X-Received: by 2002:a17:90b:48ce:b0:390:b41a:b92b with SMTP id 98e67ed59e1d1-3933b6d05c3mr4055279a91.4.1786685336949;
        Thu, 13 Aug 2026 22:28:56 -0700 (PDT)
X-Received: by 2002:a17:90b:48ce:b0:390:b41a:b92b with SMTP id 98e67ed59e1d1-3933b6d05c3mr4055235a91.4.1786685336542;
        Thu, 13 Aug 2026 22:28:56 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141388bd5a7sm6389114c88.15.2026.08.13.22.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 22:28:55 -0700 (PDT)
Message-ID: <46af20c8-1182-2db3-0099-63e27903a6f5@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 10:58:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] dt-bindings: media: qcom,sc7280-venus: Add
 dma-coherent property
To: Rob Herring <robh@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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
 <20260801-iris-fixes-dma-pseq-fint-v1-1-aba0cb22f6ab@oss.qualcomm.com>
 <20260811135103.GA2063083-robh@kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260811135103.GA2063083-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K4MS2SWI c=1 sm=1 tr=0 ts=6a7ea799 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EcCIuVCxoMd83uxLhvwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA0MCBTYWx0ZWRfXxl3570bfHLFy
 l7xvB4OldjGBczGNoekgLSwI3buCDZvxhy5VxTvQw6xG8jsoypa0BcJbDh4EijXJn2dyWdrKbQA
 gJ24O/3tkKNZ1ypftDsvy/LO8IpiHGa+f0Mn0tgJXdh/QYp1PnSqFeBZl9WdsFdzOQECJhN17Zs
 czM1fu3v1HCsjW5HARHZed/2cTqqlNSiPIjO757dkf4eGgLUo0Uv53KuJWsyCFicoQ1a/OYRiTb
 Do31IBWECxmsTvU6kv4rvp5Od/9Vb39sf8iTT6N/LvE0rCHVw8E+uWNFuqaMQpWTWpmZJUUN09q
 eqd3Fe7GBP8ePypgF2CaxOaCsDR/b5s4z7lZNW8xm51dKelwrG3lRrNnGSaxXd5f5v63McebUSr
 0ivq8dfyOwlwA/8w0VoN+1KGgkJ3AyCfRcnhS13/B7+Bq/ga/bKYGkNF+/YuU5MtE2zczEvbEAT
 dhWO3ov3EtFMiAekX5A==
X-Proofpoint-GUID: gFKPD6tvbRrjG-bwMyTx9IsV7kEW-LhC
X-Proofpoint-ORIG-GUID: gFKPD6tvbRrjG-bwMyTx9IsV7kEW-LhC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA0MCBTYWx0ZWRfX4nZaNyQrp+Dh
 lmNfQ4GpPGdpjFDT8NU7ZVb1tybTI+Byq9MsEB9IzPmAMfbFdA6b0Neoe/4z/5q2RsDpkCksfKl
 /hJxP1dmjzT/8TDEb1uGnEOTSdihaJ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140040


On 8/11/2026 7:21 PM, Rob Herring wrote:
> On Sat, Aug 01, 2026 at 01:07:27PM +0530, Vishnu Reddy wrote:
>> While testing with some higher resolution clips, the venus hardware
>> triggers a fault due to wrong input data being received. Corruption
>> was also observed in the captured output when the client dumped it
>> to a file.
>>
>> On debugging, this was traced to the venus node not declaring
>> dma-coherent. As a result, DMA buffers shared between the CPU and the
>> venus video hardware/controller are not guaranteed to be I/O coherent:
>> CPU writes to an input buffer can remain in CPU caches without being
>> visible to the video hardware when it reads the same buffer, so the
>> hardware receives input data that does not match what the CPU wrote.
>> Likewise, on the capture path, data written by the video hardware to
>> the output buffer may not be visible to the CPU, so the client reads
>> stale or partial data, resulting in corruption.
> The only side effect of 'dma-coherent' not being present should be doing 
> unnecessary cache flushes. It should still work. Maybe you are missing 
> some DMA API sync functions?

dma-coherent tells the kernel that this device DMA path is hardware-coherent,
so the SMMU maps its buffers as cacheable. That attribute is what causes the
coherent interconnect to snoop CPU cache lines on every VPU transaction, so
hardware keeps CPU caches and VPU visible memory in sync — which is why the
dma-coherent property lets us skip the unnecessary cache clean/invalidate.

If a device doesn't support I/O coherence, its buffers would instead be mapped
non-cacheable, no snooping would occur, and the driver would need explicit
dma_sync_*() calls at each transition. Venus on SC7280 does support I/O
coherence, so dma-coherent describes that existing hardware capability to
the DMA subsystem.

> Rob
>
