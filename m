Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711593;
	b=1JkyXvtGXpQIxGCmoU9aDts7IJnEUjg9qsWVL1KxoawaW3tvP/De9uraqAwITIq6AsWm
	 x5fifVjgadj6B46870Jw9/qAT4Rfgd2kNAvukqVXJDo4d+awtcU6tQU5OKuiAR2ywPvFi
	 q3JeNGWEc6IWfGusLaaIMxS4g880yoLEfjVa9xgD4U/hHw6Gl5JCpGAgD4953tM6RdMfa
	 RujgEiiceZzrUjr7t/ymLu3rUkU7iMT6ji8WeeyxTUCZJ1AgfRafDnw3JVycG4RB8lvxO
	 nxb/diuYw1Fb6wy0raNJHbBscn33Oh1gJBsKkEi4iEBiSy2zk+mL12sO+5PNqgeLHYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hyiAUjHvt1+X14T3/fDOxmZz5s9mlmOYVmjPV+rb6qk=;
	b=ChZHLtDkdJo3dE++L26jsxWD9EV4/PLG5ylVevWxmTLkl5dLzc6AJ+E18NKWNJpqCpG2
	 Um0ZaewiqZct/6BeIlFlW2UGIYm4jch8s44e9QvDqSOkDUU+EEzcFUOUj0oYdBerRC94z
	 qiiaz2EmqXcgT8v9Sc+Bu93zyqy19d0IxQnGEHgyCpFKJ7hB04AiJm3py60d/xMTh/ZaE
	 5mkLKnXR6z3caDwjeLzSOBKaPl4EkV3TH1fUh3pKGOMwfdDcClcimGRA2T4jap6gvFdmd
	 JveLMQS5m3mrRQNyGgXgd1iWhZAGHte6pghN6NvLhJV0wwFdqy/Fwe+UVqQAwh57+Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YnCsvjoK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GyZH96eC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E1F606A331
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 13:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E1F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YnCsvjoK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GyZH96eC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClK2K3923081
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 13:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyiAUjHvt1+X14T3/fDOxmZz5s9mlmOYVmjPV+rb6qk=; b=YnCsvjoKOg41w2fy
	NCc1D3VtRcD7lTaZmWWlydx7PxtmO5zPxPFaQaBnfKZZHDCyjmUlApeSfrwTT37f
	mqLXYYjTQvHaw5IDogbFKmc/xp6eVvJNmZqwkVreAxbv5VLeRO9Sh41s2DMyBfJE
	gJVxiXtx/ec5uxAiFH8D0mQMF4KVWvvWVitATB/8N/rjlo3SNWyQX/pHZRWua3A2
	4wUsyvY8KYgJls1pjaEFl32RB2XbACdETG/aEyQOO7Y4l+4QkXutE8VZ6iu1ac9K
	GHskR6yICmAMB+yP5yRQXz0RDH4rQCq7bTGSlxmNSI2ibwggUozxeawzVvO8zBQ1
	uHFLpQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76da8kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 13:13:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so420789785a.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 05:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793711592; x=1794316392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hyiAUjHvt1+X14T3/fDOxmZz5s9mlmOYVmjPV+rb6qk=;
        b=GyZH96eCTgaAbcQ/PZM92t5m8rbsF7QRu6Zcf8iu3O+OU8heoP8jA8ZHj1tFRqm0k0
         lsXU54WBSsNHy8cmWA/JFrBjVuKOGuFC/dcgnLDiHs+H3dIXB3rad46uzZbl0vPsN1Xj
         hodfDL3qRgaKlG9YfGxbJcerbC12CtEfn2omMFOZcMAVUjawhEjMqkpjFHeq2GPNT3Ma
         9YN4v/V3Ye7W/mn+rADwUEmf9CedJPG1ym4WgXTpfTLIlk3pzBGMSo1sJ5E9xLinlTqH
         AYacMzUNtkPXkrGrhqQdjlDAu9sEf9dgwUWMpUtwVCMnAtiCx+MhLLnNUEg7d99Tnt+y
         5IgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711592; x=1794316392;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hyiAUjHvt1+X14T3/fDOxmZz5s9mlmOYVmjPV+rb6qk=;
        b=WMo8yqnjMUOI+CLUP8Zyhcqi33tBScEBRvBa6RZsXkCbAg9eWTnb2e15FczXhHspmC
         TcBf0N9JbCW8twg2yaS1t4mni2pSEUpwO8kPLtMUXCobuWQgYWodY5H9gmf+Dk7FTvR9
         vvxvJP3xC93QsXr5RUFLvJYyBpUH/B4jCgVJsqd8lhEPouc7/sNzxhS/qx5/vW9920hz
         SV/kgAwCpPlGPMxKHI4I+augXRjQdS4fby/abFZy/j2xG7ZirTPpZq9YvjpzVyTM4CJT
         p/6RFtT+ZEoV89z/XOpGEJatrxpS+H+taBxyF/7kIwoJHLoO6QqbR8MJZMpfu6uW3W8Z
         Fvcg==
X-Gm-Message-State: APuU4Z/XrJdeS8eaqF2ngd5RF/5GUHCjOaAYrgkLA2r2/y1A050Lj9f8
	2TT4wCXsbnz4uQAVGx4EVSkhL/l7rGzM711jtAbY05duxaNhCMO2q+v7lyDWjoX0KFuiHjVuTcw
	ws/pu/gDfweQ2YsajRJRfpI7w9i4LJgFeh2CyXImvF7CUe4QkobKubLTZt1HN/BjIGw==
X-Gm-Gg: AYBFou0MOcqObePKvcxo+vOeeLGNdUv3Iy+Mmq7trpRDp4YPXAz41VfoXA+DCodv2SE
	zZFYFP4rHUlav7MiO+ji/LJDTG1CtyTUBYRR1bEQi26+O2Klx2o8g5K1JXEg8706B0BPSqg8xZA
	wjdiD0+qV86sY+S5eXpx2iwbUrY8pya1DDV4GGIlZ/KnPABh8BN4VgwcG78yS7epbWd+6sM4cX/
	N5LlBq46nZJbRxUFZyPwn/aTQ5q83c+olpu0W8NaJAukK3c7sayK0Tu8ZY7q5qyB0FknCs3y2d1
	X2VFbrJgMfsu9DU0XZONs+y5m59xIg/sHxfXZ96/PkCt653zbhy6gTd8AE0xlZby2H8NIx3nGfc
	MbL7ZZZy46Kw7sf/2bCIcaOgF5IFYmnfLO1XMzKmeS2XCqjXmNHRk3/EjxVajqRjheRm2BjsX5l
	Hi3Ad2upEVaddk
X-Received: by 2002:a05:620a:6293:b0:93e:d5c1:da58 with SMTP id af79cd13be357-944217ce7d5mr2047385185a.79.1793711591420;
        Tue, 03 Nov 2026 05:13:11 -0800 (PST)
X-Received: by 2002:a05:620a:6293:b0:93e:d5c1:da58 with SMTP id af79cd13be357-944217ce7d5mr2047380085a.79.1793711590852;
        Tue, 03 Nov 2026 05:13:10 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a922c298sm50322075e9.9.2026.11.03.05.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:13:09 -0800 (PST)
Message-ID: <d3a7c0c2-f5dc-47da-8466-d0b77aae9b9b@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 15:13:08 +0200
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
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence
 tracking
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
 <MPrRsE5vvB26tbMAT443IrH7Zr_tyIPaFwvQfnZj5TJUaM5uN8MyHB6kU6Y7rW92Sy35A5GfNcv95YOt-4YUNw==@protonmail.internalid>
 <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
 <7f3e822e-3749-41c5-8390-e6d74b203927@kernel.org>
 <36008be9-2b25-4f04-995e-f90e2547f7f2@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <36008be9-2b25-4f04-995e-f90e2547f7f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae9dde8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Fj6EcmcQT-bn4kmwQ3wA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX/7rF7jPO9eFy
 AX7k09TEiforzs/bEmOzEIuLuhBu63Z83LkYPdfoYui1om+tNJh0LeqLSjPEaPG9Vw9Vh9ZjwCc
 GbXi9FfV/5qMatYmUrFOiylgKtqu0eA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX7+FGG2jF2Nro
 Y8ljzUGQ5aHuuaWXRdTDbZmgZden++P6AeVBUx0Z8/qb+yPVGQNLSkYkOgXhFc9pW6i9K0SkpiZ
 8FdohAtwm+AzKgrqD/Pv7wxFFenozGD5exH4wxQjTMTZRb+C5iIXHRfU7m8daTG/1vLXGYgdbt7
 EnKq4Y8KN1JO4l3cW7xFkm7gmhbpCzj1gpek3qN0bSbIJu5JIynSfMZybdPSI8atUrr/cjz9nBw
 AdfMXm2X4sEs5Pkij3zCRkjItxgc0ryigkv2/qscfvCJk2tisycYHMEKnGbKQCR/Rv8xVMJRkI1
 j0dtnJENOG0FDfBGg/pthRx5wJOWEAY8TmxJEvjiNQZGop5bx6TrA0Xlj/qWsHT4lk7V1UJuJXb
 Cn0tRuNueKrNN+3y98F5lPuqRmJXyHgmRrzGPdx78NgDoRZCorVlpiT/XjCLWJ5JHiE0BHCzdjY
 vI398qD0P04rKqgMU1w==
X-Proofpoint-GUID: xrrHm2s4k2uTu7wtIm4r5qjjm8RPPm_y
X-Proofpoint-ORIG-GUID: xrrHm2s4k2uTu7wtIm4r5qjjm8RPPm_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030052



On 11/3/2026 2:30 PM, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Bryan,
> 
> On 11/3/2026 2:19 PM, Bryan O'Donoghue wrote:
>> On 03/11/2026 07:11, Gjorgji Rosikopulos (Consultant) wrote:
>>>> +
>>>> +void csid_sof_event(struct csid_device *csid, unsigned int id)
>>>> +{
>>>> +	struct v4l2_event event = {
>>>> +		.type = V4L2_EVENT_FRAME_SYNC,
>>>> +		.id = id,
>>>> +		.u.frame_sync.frame_sequence =
>>>> +			atomic_inc_return(&csid->sof_seq[id]),
>>>> +	};
>>> On first look this was looking strange because the id is used for the
>>> control id events not for frame sync. But on second thought it may make
>>> sense, but the question is how the userspace should interpret those ids?
>>> As of today userspace does not have any info for the VC and csid internal
>>> pipelines (so called lines). So with the current state of the code
>>> the id is VC which makes sense becouse the SOF/EOF packets are recieved
>>> based on VC. So i am thinking of two options:
>>
>> The id is not the VC its the CSID:id/port/line-number. VCs don't change 
>> what this means; its the SOF event as seen by the CSI decoder - inside 
>> of which there may be multiple VC:DT combos.
>>
>> This is also the case for PIX which is just another CSID 
>> port/id/line-number.
>>
>>>
>>> 1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-device
>>>     and will be well known to userspace for which line is reported.
>>>
>>> 2. Add and propose extension of videodev2 documentation that
>>>     id of frame_sync event types represents SOF per virtual channel.
>>>
>>> Personally i votoe for (1) because it will well fit with stream-api
>>> support and usespace will have clear understanding of the SOF to which
>>> stream belongs.
>>
>> You know from the media graph which CSID drives which VFE:output so it 
>> is 100% possible to know which CSID:SOF relates to which VFE always. 
>> CSID::SOF is a hardware description of what the CSID decoder sees. I 
>> don't support mis-reporting it as a VFE event TBH.
> 
> Yes i know that, but does the userpsace developer knows based on the API and
> documentation provided? Or he needs to ask the linux media?
> 
> We have some kind of id which is mapped to line and that is known just
> by the driver, if you can point other drivers using id for frame sync
> events will be helpfull. 
> 
> 
>>
>> More than that though, there is in-fact a VFE specific SOF/EOF and EPOCH 
>> event but these require the CSID feeding a frame into the VFE pipeline 
>> and the VFE moving through its own state-machine to process that frame.
>>
>> So they are separate signals and separate logical events representing 
>> different things with different timings in hardware, meaning different 
>> things to userspace.
> 
> Well that make sense i agree that it make sense to be part of the csid
> but it should be documented somewhere, maybe proper thing to do is update
> the comment in videodev2.h and update the documentation for camss driver.

Just an proposal if it is decided the id to be used, it make sense to contain
stream_id. Then userspace based on the stream routing can map SOF
for the stream of interest. But the API for retrieving stream_id is still
experimental and i am not sure if will be well accepted.

> 
>>
>> CSID:SOF is the thing you want to trigger off of if you are for example 
>> trying to align an IMU timestamp, not VFE SOF.
>>
>> Feel free to propose VFE:SOF/EOF if it makes sense for VCs - I don't 
>> think I have a clear picture of what you want to do there - interested 
>> though.
> 
> I am not proposing that, but from the current state of the code each line is mapped
> to different VC (before multistream patches). So this means as of today, id can
> be mapped to VC. Anyway my point is to either document or open discussion for
> "id" field in v4l2_event structure when event type is V4L2_EVENT_FRAME_SYNC. If
> not document for me it looks like some kind of a workaround just for our own driver.
> 
> ~Gjorgji
> 
>>
>> ---
>> bod
> 

