Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636420;
	b=cywTIF33UezYKCwbSt/ZKo4hhVofvcBTY2u6LrFOTUb2jsNOJAUeZZQeoGgtqh0XVapw
	 +zsIFo/b5zO8bzgfe/kLzWo/b1CAx9dopnnInViTy9j4PpsMe0YZtf+a4io4vg22oGuQG
	 EwPHHwSH+xWi882gpGj5zmI44FXvWGE5uikM/lhTjHYrkest3zpE/5/qnPFvFCBEf5KgP
	 XhJKHnf7YOKkHygUWLno5HmD4YdwIDoEghU9q4uuTkB6jF5Mc6NFL9zg97RNO5ZEBo8e6
	 Ms2vJaBuvLWiHJg2nQZrniwdpHDIIi1Nwhh9O/tApj4Gp5kNncxRrujeIClXPjIv4fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T4h6udOShVfm5Skl+8fK8uoR+CnF1fXrPKaCyYP37/s=;
	b=kdH2PQSMwb2rTNvgn9Weu5ZpMkw5Kf16zqVEVQSfLZISronJEVn3mgoo+l3K3GSLVTDp
	 0UjKwSxkQQkhlK7xcLzppTOMbmncGnGm0M92zfXq4cfztoC/NWQiJeUc8SS/KIYshHw1C
	 ydiNLFVlXajJChHSEfNDphvyrC+tudNK2caQsc8BTm+2yPk88OlXr1KNmp6uyoBzQPH6s
	 kT4hled2pN9fkxa/wVfTkYBdaIAQGLbDH/Tp4aMA8GDfaY5A48MECcEwDwp6lTBqr0su4
	 IpqX47DM1uoTxHzbnnt/rj76pPplNO82GeSwkao7sAfzuwQIpQ43dwk2SlCFsPT5iZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuE4dLxY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a8xLqxgA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757ED606A323
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 757ED606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuE4dLxY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a8xLqxgA
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJB8Zc1794613
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T4h6udOShVfm5Skl+8fK8uoR+CnF1fXrPKaCyYP37/s=; b=fuE4dLxYGz9NVJ11
	m0Zcx8cKaW1C4HNJsHyDQbRzxxebG7hh4voXad+rhip8JY57fVzRWLkCi+ypzuK+
	JLJxOjwTHPbO5lyJzH0RFcHnQkBDbKNM5LnxXXUjQAnR7uJjWvUHDHTgncjBrC14
	5Gh6XKzDWfbDgiktisrK+kWURDoq/JDHBAhmk9af+kLnG/Ilnfk5oUM3AmmNLLT7
	sNBP1jD5KgoQDp16XFsJTHIE+Gpuv2WT7G0i379fbgo2ueSHYFD+GXrWxQc56Iwr
	5Od4DVMCkdO9jrqMyW3ZSUl/+TLcfj5FBepx3FUuMDVbtvv8WTN5pZysxwqRg4eB
	GvT8aQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnthgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:53:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so1220846785a.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795636417; x=1796241217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4h6udOShVfm5Skl+8fK8uoR+CnF1fXrPKaCyYP37/s=;
        b=a8xLqxgAeWOmovJdsDkLaVHVG6uI+r6CdJWHPswBiApvKWCEZuL+lOI8JmO4yD5wPm
         VrBRhV7jfhpeBfDv9IUhsmOUShIwG1veamZo8uQhD6awbk8oPHt0goVKT8OBF57hLoaT
         FY/X8c1DQrBumLw2T7yK1zB7Ed5RmjJJRSR/U5NAv3nX8TbW+S+VpHMrK26sMmIaU/ho
         LRxbmgzuTUMXp0/oJwvKbc5ivQbvzxugOEbNWd19EUyruaAaxhmn5mzBYDzUqMmwcUNV
         5nQ/PWvppi5pZJxSyK80YVByKmMaNVtnBplJbU4+RrfoskwInror02eoXl7CD9OwabbO
         Xr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636417; x=1796241217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T4h6udOShVfm5Skl+8fK8uoR+CnF1fXrPKaCyYP37/s=;
        b=nxybrPyCeYLaA0uOa+rIprFm7echFfi0YFQfAffdWo4rtXuRtepicjetWiGaew6KUt
         UgZQ8z/2T2UyoleXsh/Wf6aXKAUTdNsgpWEejRLNdgAwa2fBrH3BVM2z+S6tIgYnqA/F
         iFnajZfC1OVLUAnCUnF14SL3FP1MI+PqyS7pl96ovjg1XIicPD+7K/pTzjsdJT1nSNVs
         lmUV3M8Pv+FrUA14IhQWkok4BqAP/ofkDgckdutsuF5A8jSiXeDetk8W1tvcq1yNoPKV
         LVEWJALgXNka9216+NsjrtapIpIZ+iUDQhlA2KvdSUA2EnDHyf2sBsisb8DpSWUVVfhE
         6usQ==
X-Forwarded-Encrypted: i=1; AL+hErFlPVabE5AP9K0Qm+2iAXN/18nL7Z4mCReYviln1G9N3KUb918qxk2sEaa8W7TCKObxOuWFxldK7nCK+g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9MPND8bQ0KkpHvNUtqsEJBiv1jpviWqturcn1wPqyHEIwLgPvo
	Z+R2SxGXm35NgOWx3Q/0JWaCWE0Y55tYuSyPxbLez5V/7tWm9PZ02b18yfsM649RhW07B/iZSh1
	n42Yv9gUyCXdXvljTlCU4Srw7DD28QnY4L2DXKPnKf6ZMibV/BfkgP/l/Y4gNy27uvw==
X-Gm-Gg: AZFdTZf/845Y3Db2L8+hZvGqCiq1qWXl84CpP/ZrobvKJKP9lrGGWBlqlFPxqyK14mh
	7JS2+4dCUA+ctEDrp5+ce+bnNSu3rwGuyg6D86IdX8nYrq6v6e4wLhOvhe55CRFoR7qAVjfV2TW
	7MyuQi0ab+Lk7ew8dQda77ibCnFIlSVuaiv3RdOLY5iWMyI8cKMtM1N5lDzMN/XO04u8qLI30lS
	WvpxPIpNGKcrsGU2IT4Mb9Tk2kDTV3tx3P++SFsGY9F3AXqT/AtE2lrFbIf5L/PWex5Eo4ex5ad
	LeaxAusUVyOR5b15DxaLxROUB+ZKu1P/S2uMavOGPlSIJ5sSFbnMPLIlraQWsir9uQ0LloA9RlJ
	lLcwufF+0G+r691ThY0AzW0IMh006cFYqN+Ta0xbEuNh09CqITdNAK35i9VNIgLFOao7SVkBReV
	UZAh0ISqdRFQGH
X-Received: by 2002:a05:620a:45a2:b0:949:721a:184e with SMTP id af79cd13be357-949ba9cd23bmr3327757885a.36.1795636417524;
        Wed, 25 Nov 2026 11:53:37 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:949:721a:184e with SMTP id af79cd13be357-949ba9cd23bmr3327755485a.36.1795636417068;
        Wed, 25 Nov 2026 11:53:37 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm768484215e9.13.2026.11.25.11.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:53:36 -0800 (PST)
Message-ID: <1f16534b-6d41-47b0-93a5-9aaadfc9402c@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 21:53:35 +0200
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
 <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
 <CAFEp6-35qT9Ow8SOWWBxf75geq6s169+SPJmw27TnkkD3o0wow@mail.gmail.com>
 <ff986bbe-7cb6-4733-9f95-bf788f4f1f07@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <ff986bbe-7cb6-4733-9f95-bf788f4f1f07@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX1p60UVTbTxl0
 53IUucrMaOO8n1nesxXWsAEOOr79ipNDSRgLBQI77f+b/ay/VzWVRhEPCvNdqjvrV4wbWOHujHu
 nETdIL2UjLCutp+DL3fIZwX5Ldcp7oVWsjnyUc5YaYvknomcyNcCbZS1I/GUAN0GPp/sWmF+9w3
 qnIoYfXj+vBvxTfd4SEP3TS5B7FHcUUQuIQDbac+UjfNWmfWYCJ267h5P5esLZNj5323p7mYqGB
 NjDaiffuVOhaoSQGgIO8P72Exuun0lQVw2o5kYDL7WOnM8g1VsjXR74DlImaaFnlP4IpT79Wnvj
 MXVcdgX5e7i0vLqRmAM/zAzgAEGIkr1ipbJHwrRgNOSMSC7RmK4nlWxr4pumlHIJR0tsw9Q1s7a
 /I4hL15xQZOerB8nPv7plIYh++aBIsuM2D6fqYPRkhXqlmztjpEVP4nLYVE4rejf/iKzVNtJoRG
 zhg/BXutFsAsLjnmArw==
X-Proofpoint-ORIG-GUID: apAHi-VclxEeM8xHbP-fC9lS2oCzGVy-
X-Proofpoint-GUID: apAHi-VclxEeM8xHbP-fC9lS2oCzGVy-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX7I30rv8MfRX+
 NLz9tfNXJQgwth6zJFEDVkK6sIOP/fmV85y4u+4jHIYs8AL1nWrtJOcfHXXH8UvoEsMrgY+FmFx
 EjSjk5D/TWCNLZ9K8t9sw+X3vF5o1/I=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b073cc2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=f01HEBNA5GE-PTMuBaMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250079

Hi Loic, Vlad,

On 11/25/2026 9:39 PM, Vladimir Zapolskiy wrote:
> On 11/25/26 15:21, Loic Poulain wrote:
>> Hi Gjorgji,
>>
>> On Wed, Nov 25, 2026 at 1:29 PM Gjorgji Rosikopulos (Consultant)
>> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>>
>>> Hello,
>>>
>>> On 11/25/2026 12:19 PM, Loic Poulain wrote:
>>>> The timestamp reported to userspace for a V4L2 event is taken when the
>>>> event is queued, which for an event signalling a hardware occurrence is
>>>> only as good as the latency between the two. A CSI decoder able to latch
>>>> the start-of-frame against the system counter knows that time to within a
>>>> few microseconds, whereas the interrupt handler that gets to queue the
>>>> event can be hundreds of microseconds late and is not consistent about
>>>> it.
>>>>
>>>> Take the timestamp from the event when the driver filled it in, falling
>>>> back to the current time when the field is cleared. Drivers have had no
>>>> reason to set it so far, and every in-tree caller either uses a
>>>> designated initialiser or memsets the event, so the field reads as zero
>>>> everywhere today.
>>>>
>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>> ---
>>>>   drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
>>>>   include/media/v4l2-event.h           |  9 ++++++++-
>>>>   2 files changed, 26 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
>>>> index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d691ffd7853d9af714a 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-event.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-event.c
>>>> @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>>>>        wake_up_all(&fh->wait);
>>>>   }
>>>>
>>>> +/*
>>>> + * Hardware able to timestamp the event itself reports that time in the event,
>>>> + * which is more accurate than the moment the driver gets to queue it. Fall
>>>> + * back to the current time for the drivers that leave the field cleared.
>>>> + */
>>>> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
>>>> +{
>>>> +     struct timespec64 ts = {
>>>> +             .tv_sec = ev->timestamp.tv_sec,
>>>> +             .tv_nsec = ev->timestamp.tv_nsec,
>>>> +     };
>>>> +     u64 ns = timespec64_to_ns(&ts);
>>>> +
>>>> +     return ns ? ns : ktime_get_ns();
>>>> +}
>>>
>>> I think it makes sense to add an additional field for hardware-based timestamps.
>>> Converting the timestamp to the monotonic time domain introduces precision loss,
>>> so it's better to expose both to userspace and let userspace decide what to do with
>>> them.
>>
>> There is no loss of precision. The timestamp is actually more tightly
>> aligned with the actual event. So I don't see the point of having two
>> values, with one being less precise than the other.

One does not exclude the other, since there is a way for this platform
to convert to monotonic time maybe is not an issue, but i am sure that
there are platforms which has separate clock just for the camera hw and
maybe make sense to propagate that to userspace.
And if there is a hw block which can generate sync signal for other sensors on
using camera clock domain i think make sense the whole camera to operate on
that domain. But those are just assumptions no real usecase as of today
for this driver maybe.


> 
> The hardware produced timestamp may serve as another unique id associated
> with a data buffer, under the circumstances it might be helpful to receive
> and rely on this kind of information.

Yes this is another aspect which might be helpful.

~Gjorgji


> 

