Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916F83A963D
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 10:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786703119; cv=none; b=kj5g2sUrf/7mbw+Waa7x2CDO429Ch0ycyeVdE7gXnKGICQUF9Mxfr0HxwfA2y+UX912eNoZYkBFqdveKPJLu7BMFq00k4UmfOZAhIwfntpHrLrvBXnHIOfTeXlKW3vuubUqHfXdlt2ErJBCMNjh3yNPdT6G6XDFX3SPlrz+ua1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786703119; c=relaxed/simple;
	bh=kVtqC5vjqVMxDhomAfCYddXbUgXY2gPiwPy5iyBGIfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G82k2VUTmgAE1BcENQtRvDYE+EJiAqM50DN0i2a4fZridFrkibRfyuIzSmyjwxdZccUMXS6yJf3RxWVEYe5D/dMZ8v5hsZwmEpkGBJfAv93wZLZhHRML1eiOnQDJoLZ/brPIwJkwNHvAkvHzP4sOWeVuY+W8BCabpGI4qUVzurc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZkfNNOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jmrl12PN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZkfNNOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jmrl12PN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E9rEcS2460294
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 10:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kVtqC5vjqVMxDhomAfCYddXbUgXY2gPiwPy5iyBGIfQ=; b=FZkfNNODPdU/uhdf
	PXbCOQB4Y6xM2Iq7seSPco/DlOqzmDMf9vG1gc26c7kf2YZFOw3zKlPt7R3pkn6C
	C3qZFlnKLo+oUQ9Pyl5BocMf6FdDB7KhlSjqx4GgUX9l5MFXbUO2qWUZs5juWUSP
	fuwdN5hWpzDe3bnEUMK3VLoMmRnnA+RP9xRx4F/Rjmq6Vx/bjwTHqazTTNtfKBdo
	u6I4XH5lTlzQKktSTeKmJQLQ+eFDVZcamHFHvyijqT1p/zA+2OC+I2VEvBMzsyA6
	yJFM3SWP1hIKkAHrALpmswu95V33Ax5DMqxcXVB1rNtHiK5HWo86WQaORPhm17jz
	x72R/A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20sj03dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 10:25:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84f0d3ab2f4so586653b3a.1
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 03:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786703102; x=1787307902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kVtqC5vjqVMxDhomAfCYddXbUgXY2gPiwPy5iyBGIfQ=;
        b=jmrl12PNoXmfNfktykMPozAaBavghhfEJ+xcmdAItaJlH2zaTaNlbQ9sti7RWlou8Y
         Ho82Mtx1+DJ/roaCm4sTfZl8gxGmqIfXmy2KsmmbijiFbBjroU223k1NIba9dKJpRGiv
         IzPr0YZJ74Tkx+TfVKrOEXj6Hxqsh5wj8/JB4Pgoyo7qTo/ubj5CsRqNpFeQ2InSVS7v
         EK52G6e/gp7d05VgrgYL6v+c/Xgkse03RBbi1vEHrukJmjJ+Fg7uqb0FFejxruiU0sD0
         +3YXVeeHm/XaQCLdOTYoOluf4N81nLq0Mwp2Mp5wtNVyTO5dwcAHS1tfnmwbXog9q7ba
         9IBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786703102; x=1787307902;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVtqC5vjqVMxDhomAfCYddXbUgXY2gPiwPy5iyBGIfQ=;
        b=dZKtyw/AuGoChAzO2wlz9FOVlN73jVtkN6jOVmVxsvMZRm2uYKAm4eA/loyfaiFW4I
         jUPP4ZGboPzHIRlYVk1p+ikL9yzd1AuBEAwfcuLoSZbmIsL8/x8Cr6d3xgCsQSohxeOp
         ozxNPrR+WQlTAtMkcy0DWX1qePv+WXlb1+CjlCeq6i9QS4M2f7ChN5G9cVrXPSix7GP9
         d594XWkbBBccPAXnR4LC044eZ1mj/kmYN9uso/WeWqSjVcQ8XfqLaDzyA8q1F1llExhi
         3YVOR2KL0O60DC9q5A2V3ZnlQMqgXR+aiOVPZxzaeDVhKZdpF3s20MCCJsXhyYqAXrwt
         VsMQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmGBy7vQaFIC2mkjyQqjWvVoEq39/uEUpFpnWAf+lmJ5bHhgZfJDpJe5+RfmtpnSAX9y80gAaeljVAdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp3fCO5/oTZJ8IIKgSWCUVKKfH+Y4URC9PTcfEqLVxs7cDoXXL
	4sRv1rnfJnQmBjrGpgfzdgeqlDJ7z01aW/bTwO8vIgtGU5hP+Gp86SbqfgbnQXlxvMRPY/GtJ5T
	SVIPkvClShdIH+f0In+L2vMTQ3LhuoSlg0y+Mo3HKnfac339QJCdWV9XwjtdDV0vmSg==
X-Gm-Gg: AR+sD11VL6u98hqG1CkRbtL+qGLuzygpb6UYCo2cSfxrVFbYrrVk0J7zcxMU6lftdod
	CXx4CfbCjsNvmhxWR0uxJS+DJhx1lb5ynqb3zHI+m8DFiUM2IzMnPDmj4GbZS4yxfmGl0BFDSf1
	+c9aCVyMXVp4WNW2lndoaHTzSmM3dBFtQt9hzH4sb+c7T3KAXwLOIGaqoMxcsmeiRlLgo2eHZ7n
	7Gz03roLNTC1AAYdZh94t0yO6pv17jyz+90WlILMU81K/NlFrdRTcqZU1I8hcb7Kl6ydNpbN5US
	MBZWcbXtynyG7srqKmKts3SMN2cAKLJ6X0yeBKLegRPniLf86vlzi4tdbHBYbshm/psx69TzfVO
	Ba2r2nA1iW0mFilh8OvO+WGqnu+AA2+9u
X-Received: by 2002:a05:6a20:6f04:b0:3bf:6e72:68f9 with SMTP id adf61e73a8af0-3cc720e1af9mr5407860637.38.1786703102003;
        Fri, 14 Aug 2026 03:25:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f04:b0:3bf:6e72:68f9 with SMTP id adf61e73a8af0-3cc720e1af9mr5407807637.38.1786703101528;
        Fri, 14 Aug 2026 03:25:01 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e1568sm3161720eec.11.2026.08.14.03.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 03:25:01 -0700 (PDT)
Message-ID: <c03354d1-843c-af24-0e7b-a4c0cfb8e001@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 15:54:52 +0530
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
 <e287e538-135a-4eb7-1b21-55b475c844e0@oss.qualcomm.com>
 <26a880b2-5f37-43be-ae8b-2c0c27c777a1@kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <26a880b2-5f37-43be-ae8b-2c0c27c777a1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA3OCBTYWx0ZWRfXzZ5MjDw14B8b
 4Gxl7ERFKySSs7amHzU3nVmuX5Uayn3np72BJTsh4zjLSiLmDfcmqxdLsw1//KDUQppmfgbMjMj
 BHGCxWSX5tXTRik7CC5Cad9ggWlO+iri6PHQDHCfqT6M97NIUgSxUZuvYUoLYXfhKaCkx09u0Pz
 6sC/2Gb7Klgtr1ZtX2e5BahEA9+Wc6IzAvRRJgVUCrcjTv60EalT9RCxZjnGMC/CkfWT0IEgABz
 cOXvxRFMcX8yLuptS6FA/Y3DO7Thh+InhBKo8PgF9br9zlFzmQsCAISR8AqlS36olcIT6AbnCnz
 k3q6aGcolQOgB+e/LBxcAuYrHr8Ae2dNVggMYIySVPKeOKgcnTxE4tLV5elFbUOnNtmYsQlHNY/
 mHFDvzrgi5PtyDBK5pYc1H6dFYMQwlZvqIRKUNPYPtxhI1hYogc48pRXtilOnAQQcF7OzGr8H+l
 kVy0ubaO32tmGiro+cw==
X-Proofpoint-GUID: Xd1cNh-NIkW2Fw5EByiWvRZAGaT6_T6w
X-Proofpoint-ORIG-GUID: Xd1cNh-NIkW2Fw5EByiWvRZAGaT6_T6w
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA3OCBTYWx0ZWRfX9WsDIOmb+EB7
 Qo8bkSYhfsm7g6fhFEVYa64eB6w224g8tO5Dd/HCHwEVDyJZPLCzjHlaJjSAR/J5nlsYdq0Kqje
 ng76C4Kr/8biXwJbgVr2LAr2HxoFG1w=
X-Authority-Analysis: v=2.4 cv=cMTQdFeN c=1 sm=1 tr=0 ts=6a7eecfe cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=mqT1Idva8bgf30cmp0IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140078


On 8/14/2026 3:26 PM, Krzysztof Kozlowski wrote:
> On 14/08/2026 11:49, Vishnu Reddy wrote:
>> On 8/14/2026 12:01 PM, Krzysztof Kozlowski wrote:
>>> On 14/08/2026 07:29, Vishnu Reddy wrote:
>>>> On 8/13/2026 2:49 PM, Krzysztof Kozlowski wrote:
>>>>> On Sat, Aug 01, 2026 at 01:07:28PM +0530, Vishnu Reddy wrote:
>>>>>> While testing with some higher resolution clips, the venus hardware
>>>>>> triggers a fault due to wrong input data being received. Corruption
>>>>>> was also observed in the captured output when the client dumped it
>>>>>> to a file.
>>>>>>
>>>>>> On debugging, this was traced to the venus node not declaring
>>>>>> dma-coherent. As a result, DMA buffers shared between the CPU and the
>>>>>> venus video hardware/controller are not guaranteed to be I/O coherent:
>>>>>> CPU writes to an input buffer can remain in CPU caches without being
>>>>>> visible to the video hardware when it reads the same buffer, so the
>>>>>> hardware receives input data that does not match what the CPU wrote.
>>>>>> Likewise, on the capture path, data written by the video hardware to
>>>>>> the output buffer may not be visible to the CPU, so the client reads
>>>>>> stale or partial data, resulting in corruption.
>>>>>>
>>>>>> Add the dma-coherent property to the venus node so that DMA buffers
>>>>>> shared between the CPU and the video hardware and controller remain
>>>>>> coherent.
>>>>>>
>>>>>> Fixes: 37613aee2179 ("arm64: dts: qcom: sc7280: Add venus DT node")
>>>>> Really does not look like a fix. How skipping a cache sync can fix
>>>>> anything exactly?
>>>> dma-coherent tells the kernel that this device DMA path is hardware-coherent,
>>>> so the SMMU maps its buffers as cacheable. That attribute is what causes the
>>>> coherent interconnect to snoop CPU cache lines on every VPU transaction, so
>>>> hardware keeps CPU caches and VPU-visible memory in sync — which is why the
>>>> dma-coherent property lets us skip the unnecessary cache clean/invalidate.
>>> You just repeated what I wrote. What for?
>>>
>>>> If a device doesn't support I/O coherence, its buffers would instead be mapped
>>>> non-cacheable, no snooping would occur, and the driver would need explicit
>>>> dma_sync_*() calls at each transition. Venus on SC7280 does support I/O
>>>> coherence, so dma-coherent describes that existing hardware capability to
>>>> the DMA subsystem.
>>> How does this anyhow explain your commit msg? Are you saying driver is
>>> buggy that it misses sync calls?
>> No, driver is not buggy here. dma-coherent flag is missed in the dt node.
> Again, no... or explain why. Missing dma-coherent is not a fix, but
> rather optimisation, but you claimed it is a fix. Explain why.

Is the dma-coherent flag only for skipping cache sync?
I might be repeating here — it enables the hardware level snoop between CPU
caches and DMA memory. Without dma-coherent, the CPU cache and the memory
which VPU accesses aren't in sync at the hardware level, which is what
caused the corruption. So dma-coherent is the proper fix here, and that's
why I've mentioned it as a fix. Do you have any opinion on how you'd prefer
to handle this? Please share.

> Best regards,
> Krzysztof
>
