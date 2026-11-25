Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634488;
	b=kple4jMVNszP4nqKz/NEfBeVPw1HMbGHJ/XBcVDBMZJ2+ul9VjnHXUl9e8hFvN9giSnZ
	 cLi8GJBo8Die01OKUAHeRa91rnGNJh2XQrTqnwfyFdsd7vhpA0ZZqpgCs42Nxb39/FI55
	 RX/XziUJCTr0fHyBkZVFuxmH+vGFlOiF6ZJO55XMI6feuuLv2lb+HntJ4IiVfgnsbKdAm
	 2vzzX/0ytjZzbLXbclaNfgSl5m4hTIVDyO7TbC60O1SS1OYpTY/rzbDy2F+MHNWWV7u60
	 kNJi35hAW7m9L5JEP8pDcsv7X1AnCORDcVQOXX04dEP+/zvOGnEyzsGK8qlY6IT/gdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xH5JYY52XRBNO6YBobG7pjVoK4p4OwjsP6nrSUPc0dI=;
	b=XcsHjEew0jWUGR8EmTh/YD95v3VpL93gCak541ykLN7UV+LbJoeDm/52gFkwACVmd4pU
	 12elLkLZ4vmbTE+hC4d9nYxH3SA9rrrOKWkFxq6pzp7CcBGviL0NSGGscqn9hJQ9Y8RIM
	 zPzW+RT3TnlJ8Jq0GMHEI8U+TJlARig8/qP86nKbonYpjivtmg18FA61GmaH20Zy4eK3W
	 5qyA65f11hCf0u50jaNIs7r07hZpV3eOQHpFHN7Mu3W/G/VY5FPnuxd2O7XnHtLURnm53
	 DPXNZkbB5HYPXMjZOhgLgEo1rcytrWc6GdUQ2NWlPvT2HwtlCcti59HQXy/vks/k6eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TWdl1cId;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=giagDJrE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714B2606A329
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 714B2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TWdl1cId;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=giagDJrE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJB1hU1358012
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xH5JYY52XRBNO6YBobG7pjVoK4p4OwjsP6nrSUPc0dI=; b=TWdl1cId2a42XQUe
	kDf8SZ2meEmjQQK0knfI4DFzfQwLqHjIZLue7em7qeuV8PlTXDdgceQ/RkfHgTRD
	BITqp70VRHVHJsHJz+47HnyOOnHrmKXscMXpbd5rEh1c99aucKSuEvY+HRE5H5G/
	WekBMHGythfjZv+0jDNJR8Xbl03YPxcYOhAb7kwoN3Ek+5wQ8z8g0A1rRSIF8k8g
	teY9UOUpKtPxLz33okWwOZrOYooicU7KzjArJGW5jO1uFcAddMNfj5RhJDns+FTz
	eGlyMmGGF7XE4JRVGuGHm/wgpLwkOExcnY8S9CYdTqERMTHxqacQghqIWaBUoic3
	u+sgrg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxsqjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:21:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9496ff065bcso839180085a.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795634485; x=1796239285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xH5JYY52XRBNO6YBobG7pjVoK4p4OwjsP6nrSUPc0dI=;
        b=giagDJrEDjQeKnb4uPdUya3zKSs/B+QXMPngKgKyGtO2qGUAjn6zMPW2YSQnoZT374
         08x+SzdxkGoupALrlngnXqOCKVqV/WeRa8DLZSJoYz/pAc0EaZ19hA32MQ4v94vjlNuE
         RqXow1dxpZfuxGbfqtDpIoTIJDDFTHQNofTmGPCMc1msigKPyKknMEaQcCB7tzQvbH5l
         mEdBPE9YN/i3LyARNkhOJqH3JTTC0zahgeXqDPPf6pDLBcxKS50XqS3jLU2fyjojwc7t
         DkQjFf0Ay3yK14OtWpFs6c4PyotwaT/42XkOZlUiPWpBNSGsZ5agzlAgpxE8bfMDp89i
         m1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634485; x=1796239285;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xH5JYY52XRBNO6YBobG7pjVoK4p4OwjsP6nrSUPc0dI=;
        b=EHvzEGS2bsrHeeneP8/M8UeUvZYxZk/PpWT4FfGIDql3Ct0+m6Q/GVV4N1o94KYlf/
         6b7NPa4b3y7ExWWkCUgmrmJmDmrJ9uRn1AkU3o2f/MtHTv1QzuFSmceij5zPcAQC8Z1t
         3xiUtNkKnSFQ76FycQ7BIx1vfmGt12L4zU/Hz6VvbGiXbNcWqGP8xWSGOI6paie+32zF
         Z80OxsbwHhcgsBaXarQ4vqI7H/Yrx0DtNxbihLkf9y11wxvtN0s9dPWwkUteG0dgfnme
         TwP8UNZVELJcRZaiHTOBa5P3jEx/W88/QNuQ9v+7uaM4upLQiV6hCbAJwjVdzQc4x0a5
         fbCA==
X-Gm-Message-State: APuU4Z8alXUHzFGJuTxNnJvUsdifihlza7UcNSN9ZPXV2eXHex7by2VQ
	SS/WygBVf/ClPnjLx4R69fXfkexs6EPufBFVC9bYizPwiN0+WzkHyaKDN2ODHkAmkb9rUjbOToT
	yFWgy7Ly3uFvVDBP2yRH4QtlFRCfBCsiZ5BpTJUENcfvzq3uU4Puv1i73V93qgAL1vg==
X-Gm-Gg: AZFdTZfKYhut4NgJ+nBrVO6VaQRInBr3CkFylwoFkB2F/tKpAxPHKz5Y9IDaWmzRVsn
	1lXeHbkbj8PpZdmg2OQQPFINDxfyE2v7YvC+BRVNSqoyXxmAPtNCu77TlvfJkRaO6prpFLEEIq0
	80lkBWkXjlJVfBaj1a5X+oJWpqROocW792BO+L8YqoGG3vd8aYABWXQhyK5wTLXaYxxj44eKdxo
	KBGL1r+I04y+nH3ttC02Q045fs+8/6daRa4Ts737+6aKLgKzUMN1jwAae0JdT+u0/1iQHOpZMt7
	H+RAZOk2ZN4lxUxHvgaHzEW4mis11UwBfliAVgSEglZXUs0jbXWZS/PHrhWxLOdikw4B9gP9Qjy
	+lVepKn46IA7pbZpNrJJSOUkKk5qpPNC4SWJbWaObL/sXfyWDViHBOyfr3oZ5h1P7GUsOKdELOV
	ofoPTB5AdMswVP
X-Received: by 2002:a05:620a:17aa:b0:949:9985:e097 with SMTP id af79cd13be357-949ba96becfmr3325538885a.15.1795634485575;
        Wed, 25 Nov 2026 11:21:25 -0800 (PST)
X-Received: by 2002:a05:620a:17aa:b0:949:9985:e097 with SMTP id af79cd13be357-949ba96becfmr3325533885a.15.1795634485006;
        Wed, 25 Nov 2026 11:21:25 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm538120815e9.15.2026.11.25.11.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:21:24 -0800 (PST)
Message-ID: <b630d0cc-0321-4fed-92b2-a1a67ecbb497@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 21:21:22 +0200
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
Subject: Re: [PATCH v2 1/7] media: v4l2-event: Allow drivers to provide the
 event timestamp
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
 <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
 <2bac2b46-a124-4f41-8a19-7dfe1c936caf@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <2bac2b46-a124-4f41-8a19-7dfe1c936caf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X0oBbpboz9ZTZocMX8Ds0ko-QmgTgoBl
X-Proofpoint-ORIG-GUID: X0oBbpboz9ZTZocMX8Ds0ko-QmgTgoBl
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b073536 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Nknuy2CBTID-iPg2oFgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3NyBTYWx0ZWRfX3CjV11340Plq
 NaHUAo6CKSOs5IrWMOPd1kzNmTAmcAcDRt3/h6TJxe6cxXFppouzT2tm4BpKf6YqzSEG+cdPy+J
 fbRiti4eSJAMmY9tTqnJrVeWqb76KNgMe5KbAMqpiBfd7pDRVfEO+aUG6rqYBergzp0Y2v8NgaB
 ZaMNu/euaciTeGu0HAfNdGhJ/jdnqMcJx+s+M2g213CjwyGV9uMuF6O7ARJo2YZtXkptlYn8f0/
 58SMD9PZrzsseksIdP7oaqVoIB3yyTfANnHIQKVGp8Jl7I7M1nHRJcWoO8JoNvFscjL/VO/8jjz
 yPrg3GvqDZgRm7X4NWUt9tAaHZfLVMTpJhQmtGoRTLZsUCKZqazLYFSk9gMLZVr6Nq4EmZAIAym
 fwfhN02ucabSmJDPfbno6EQ6J/Dlonqk5whx1pyHRdRkBqqPT9OTYsIBPiJ4gzEVqhma2FaJZbh
 KNwtBhqaw56v/kvYGMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3NyBTYWx0ZWRfX37mh+gowagvD
 1SejRd8ue/dSoiasjE1lyGG9VgxtaonJOnuocnMnENmjGQ4d+SATDub4FR7XgSAY1aekng3eHfU
 krUQb8remuuGcPKXvABeit1geFMihFI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250077



On 11/25/2026 2:58 PM, Vladimir Zapolskiy wrote:
> On 11/25/26 14:29, Gjorgji Rosikopulos (Consultant) wrote:
>> Hello,
>>
>> On 11/25/2026 12:19 PM, Loic Poulain wrote:
>>> The timestamp reported to userspace for a V4L2 event is taken when the
>>> event is queued, which for an event signalling a hardware occurrence is
>>> only as good as the latency between the two. A CSI decoder able to latch
>>> the start-of-frame against the system counter knows that time to within a
>>> few microseconds, whereas the interrupt handler that gets to queue the
>>> event can be hundreds of microseconds late and is not consistent about
>>> it.
>>>
>>> Take the timestamp from the event when the driver filled it in, falling
>>> back to the current time when the field is cleared. Drivers have had no
>>> reason to set it so far, and every in-tree caller either uses a
>>> designated initialiser or memsets the event, so the field reads as zero
>>> everywhere today.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---
>>>   drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
>>>   include/media/v4l2-event.h           |  9 ++++++++-
>>>   2 files changed, 26 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
>>> index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d691ffd7853d9af714a 100644
>>> --- a/drivers/media/v4l2-core/v4l2-event.c
>>> +++ b/drivers/media/v4l2-core/v4l2-event.c
>>> @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>>>   	wake_up_all(&fh->wait);
>>>   }
>>>   
>>> +/*
>>> + * Hardware able to timestamp the event itself reports that time in the event,
>>> + * which is more accurate than the moment the driver gets to queue it. Fall
>>> + * back to the current time for the drivers that leave the field cleared.
>>> + */
>>> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
>>> +{
>>> +	struct timespec64 ts = {
>>> +		.tv_sec = ev->timestamp.tv_sec,
>>> +		.tv_nsec = ev->timestamp.tv_nsec,
>>> +	};
>>> +	u64 ns = timespec64_to_ns(&ts);
>>> +
>>> +	return ns ? ns : ktime_get_ns();
>>> +}
>>
>> I think it makes sense to add an additional field for hardware-based timestamps.
>> Converting the timestamp to the monotonic time domain introduces precision loss,
>> so it's better to expose both to userspace and let userspace decide what to do with
>> them.
>>
> 
> I support this.

Although it seems there is a way to get the timestamp from the same clock source
introduced in following change, and convert to monotonic i still think the hw_timestamp
propagated to userspace is nice to have. But not blocker for the series.

~Gjorgji

> 

