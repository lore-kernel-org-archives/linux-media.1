Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792782479;
	b=IXhySoKBSPHMLMZXJJMv5CXypkO1Wpx+uGrEhmAu/TdWyzSZVnOBLlYSvbH7nhlPxe55
	 esQXF5XEfv6nksaVTXQA9md0C4tjXZbTTQbhq9Ea2xt0TCTs6oWb44+MKItDfgGZbvKzy
	 lg7fQe0k1MVP7raxpgy/TBBhZH8583k0boNWfvuqC5mqf+4gu5nNHvye0z0Jm1JD4/7N8
	 Y76asXbMrduoXiAlfpNmrmLPaL1NRiZeBATNXcweLBbAhFHjaRJ+az4W0n4VcQXaMuudA
	 3eevr2OTkzwC8KpPC+qCioUDd4T1I4qbHuwHOkEraobX2P/6YNZgLdqun4rzfZ5BBDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792782479;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/BDsE7KYZUbeCjSRjXDmRvAJvYjOJm6pC727IV5UA0w=;
	b=yLxeMSt30aNcLKaV6RNAsH6xiho+cgkFordIxB4jfbwu1zIIwlbAOcPNuqTXH/v6Db+U
	 gYRLY6lAxWtqfyEjCTa3pf4wo4aEl6GZDaI7mzQ56Fx9JmSDDlNmtLmQpy1IK2DG/lw2o
	 +J4ED+xjCzjnw0qbQMTYpuoKFBxzbCstU3b+Ni/q5s0DyIOQvkBdNiiLCwfATXnuE7Cmc
	 7KPMcX//E8JF9z3+fzb8f/kDMZQ1YLmQocoWy23jbDB3xgoMImIbvv8iXezYWpk6sNNLx
	 euQVDCYsbJd6RH7QQNintLIAzKbN9SYkuQTmnPRJ7houIsGo8uZSIU/sf9hDqizaeYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6CsSf4h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZXc5h1S;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89DE606A31A
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 19:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B89DE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6CsSf4h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZXc5h1S
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NIZglS3047901
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 19:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/BDsE7KYZUbeCjSRjXDmRvAJvYjOJm6pC727IV5UA0w=; b=O6CsSf4h0VM8cbRJ
	xJb4HXkxlxWe3aajA3C8W5033KaRZdEmntURB1fXkMix/w+ouxAXIbiLR3Vwfp4A
	u1MCxQhFNN+Qr5Zoo9EBieLi+KTdhCbRb3XZGbS8DuuDFoLGQ4P29lvBXxxpwhKr
	QKpwak5wQZ2YtZvEeBZblx+yrT3cBKNNTNgtF7fviUa+PdOgkyHIrxmrVLFN/Eca
	61yRzak3tryYrz5+JAv8noDIKBW+hoauKvnL0u5pGXgUy5MXuWHErgriu9PCu72Y
	uy2SL5BFSluJWmZn7B63km8VaGQKqZTu8XzRy215z8Fuf0psn5s1PiSCsXaTTkXf
	ztQNKw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcrug5cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 19:07:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9195c59ac8cso2918346d6.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 12:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792782472; x=1793387272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BDsE7KYZUbeCjSRjXDmRvAJvYjOJm6pC727IV5UA0w=;
        b=bZXc5h1SUL8TtWIRo5+J0V+WcTGMvccxNzlUor6mLq0AjpwvDlAv5IgytDYHMsZT+g
         37rVOO5j0f7WbI9v4G8Upbb3w6AurS/kgfThZV2NgJ+E+vKjLM1V/1eAsuIpE6cm4uia
         cw2sVrEvcxtkfCOu758PHSFLvHE7fzw1Rx7WzsSEGW6MxZTEXU/7U1tWno4edSEHIGO2
         pw6C03wuYucinlyzn0qvtj/AQzVYr1eQDHX7T5Xel7K9QD8oXclZtvDQcxc6X0bT4J3h
         0l+MZPkzuADqmmUgeEnsh6RlVtmzHkjFnzpQqWRuEhHpo4Wmpkyqd3sDK80s2sWgjkuV
         P/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792782472; x=1793387272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/BDsE7KYZUbeCjSRjXDmRvAJvYjOJm6pC727IV5UA0w=;
        b=v4Z7kV4hJtALVNnmHUUx8ouXgwi5b2eiOK6iu7QM5pdODaf+zJgMWThddDGoymjoB7
         KBxUBa0IDlld+QQ+CpSbjxBG26ZagP6JHx8fzRTYzsgavyuaFEmZl2KgjOHSwWNt1iPX
         8Vc9mtFvoBhr7lSdn5ovapJ3Dma83bCzcUflB/cFKsUyx7mShns+m0POXF1GnvNtCNte
         j5FLaFFXU7deqp9FdXgwJ9Ly10WS8nm/eKneoKt0b/8bppo71pSxEaJpSD2dNzdppBou
         o61xW753i3SqluoJ9yypmzlmnFiTINdyjWJKNwTKVnQhGx2+IR+M7jrVoSIPIYpvMP1W
         75Ng==
X-Forwarded-Encrypted: i=1; AKwUvBxWBMHt4g/kHSvuCh/dQGsFEF9yKATTTFlHrfgNQWP2KokKU83eu8CPmLXmnx1KriKjoskt5/bbQjfoqw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL9vlnzOIXgPDimr0ZYifh3WFx2JWdZpkcX4ZTs4TKWH8WmyMzo
	MQydPHr+EjHOv7kB3Gghu4IL0j0cUC1pnJY7SHPCSHRCS4/dcHdNgNLu8bLqW3yrXrI3xS+NQ3y
	BQG9Jcj1hq7no8ByMXo20hNEnw7+fWc5Q3aqxkgkdV3Byofxlvn77uPdP+WsxwM/SRQ==
X-Gm-Gg: AYBFou3TC+EDucFDBN1Ta8la2mwNx20FzFprCz+9T3QQFp55yCi5hz+CgQQhGOFzmA6
	AJ2nNRqri2nW9TQ7LvUhqEURb0ox4BVfAxfx9t5g5LJu43ajWhoWPVfe9/Wtp7TQs5jVeHNyEbJ
	shNFuno88ky9rM/cxFjcqlk4tEI7gRYSgm2J0R2Th6ii4GFlXoEa8B9lbCwq6t4boPIqjKNnEdL
	IQMTfvbcU5RxGkbM12qjtmZEpVhY9GKOkrqhIQeqDKv5rKEAafAM9ev7eYxyz/WkK1csIBZTIjL
	729lBeo5XEcKaD24HXLaR6tfDBdRnXbyJVHYINlW2CkVWhe3huKZJesIYt2u/UdKtgc6HtQ7z2U
	5F+5sa60m6BFaOiq4j8RtOHcQMOKIadJT4X0Zq+0=
X-Received: by 2002:a05:620a:2a09:b0:93f:2def:5cd5 with SMTP id af79cd13be357-93f6f9b34e2mr577865485a.51.1792782471653;
        Fri, 23 Oct 2026 12:07:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2a09:b0:93f:2def:5cd5 with SMTP id af79cd13be357-93f6f9b34e2mr577859685a.51.1792782471128;
        Fri, 23 Oct 2026 12:07:51 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37c883sm1397603f8f.7.2026.10.23.12.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 12:07:50 -0700 (PDT)
Message-ID: <07f884f2-bf92-4264-a289-d40fda9508e3@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 22:07:47 +0300
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
Subject: Re: [PATCH 1/4] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
 <20261023152857.2859767-2-atanas.filipov@oss.qualcomm.com>
 <CAFEp6-2tC+uFJSG8xOhQdrhfCqoDuhm6q0rYc6cROoUG_r1vtQ@mail.gmail.com>
 <dc87be81-0fcb-46ea-b9cc-42866cca074e@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <dc87be81-0fcb-46ea-b9cc-42866cca074e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA3NSBTYWx0ZWRfX7N0UNLueID9L
 86Mdpc0jf5RRqfOTmgX6kaTLSd+JJqbpfNgeCpUj/Vdn9EfHvzk8dX3TACkeBlN5fQxzCGvfe+i
 r3IrgUtYb0wKbRV43KQkOFaL3O7aZJ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA3NSBTYWx0ZWRfX+dPLs8T9GKq2
 Dd+lXjYBXwI2gj2t11c2EwVnfyKLqK4tczCN6Vt4ZbnFM59L/YXHX+DcQswjgahUQ6xl62BDyfi
 GRFkJOUR5bw14bFZIASprFskLWoY5ngNdie1DAIU0cavVtQ2iHrNJZQ0N720QdHCp/KHNukHUQr
 N8XgBVL6lc6cgdVgK5LXl/iAxVB+I6eIiSHFnIPTmNJhi6pXEHAhs/LezDoqHo5epVMA8hVLyoD
 8U3ORZbFY8zIbz9CzLXIB1UKU3quRznd6DphlKfcSUrjFbtiWRki/cAFaAIYbcEH8vDjr5WDQoD
 gE8Wn8G+JJzSpl+qihqWFQ/PNTecxTEABqfj0/N7jOj2cqgZj8ZP+PGotjXssY+U+a/g6bYPKec
 evPaT6k+2+19ii8+tTcdn+buUpeqMOlUFU2pLD9/JA5tKBYU06CI9obXqcip4xHzfVvitWkMIvr
 Q0T2LmbibCagXjqzWYg==
X-Authority-Analysis: v=2.4 cv=Ju5kP84C c=1 sm=1 tr=0 ts=6adbb088 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=j4AJ-kHJ1b0bUOn6I8UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: WwcAgIcxSSV4Pq7Gv7V64x59MJhcH8J0
X-Proofpoint-ORIG-GUID: WwcAgIcxSSV4Pq7Gv7V64x59MJhcH8J0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230075

Hi Atanas, Loic, All,

On 10/23/2026 6:50 PM, Atanas Filipov wrote:
> On 10/23/2026 6:45 PM, Loic Poulain wrote:
>> On Fri, Oct 23, 2026 at 5:29 PM Atanas Filipov
>> <atanas.filipov@oss.qualcomm.com> wrote:
>>>
>>> The VFE fails to power on when the pixel rate exceeds the highest rate
>>> listed for any of its clocks. The rate tables of the VFE clocks are
>>> independent and need not have the same number of levels, so a clock
>>> with a lower top rate than the VFE core clock, such as the SC7280
>>> camnoc_axi clock, makes the VFE reject pixel rates the core clock
>>> still supports.
>>>
>>> Clamp each clock to its highest listed rate instead, and warn that the
>>> pixel rate exceeds it when the clock lists more than one rate. Take the
>>> clamp into account when another line powers on an already running VFE,
>>> so that a clock running at its highest rate does not reject the
>>> request.
>>
>> IMO, this function has become a bit messy. We should split the core
>> clock selection into a dedicated helper, as it is directly tied to the
>> pixel rate. The AXI clock scaling/selection should be handled
>> separately, potentially through the interconnect (ICC) framework (when
>> available).
>>
>> Regards,
>> Loic
>>
> 
> I completely agree. I just don't want to mix the two issues, as 
> requested by the reviewers. IMO, if we can reach an agreement on the ICC 
> migration, that would be great.
> 
> Regards,
> Atanas
> 

There have been several discussions about this topic. 
I would like to summarize the background here and reopen the discussion
about the direction proposed by Atanas.

The issue initially came up with the JPEG encoder driver, which is
represented as a separate device. Dmitry identified that changing the
camnoc_ax clock from the JPEG driver conflicts with CAMSS.
I will not revisit the discussion about why JPEG is not part of CAMSS, 
as this has already been discussed extensively.

Currently, CAMSS is represented as a single device and drives the front-end
blocks that write data to memory, such as VFE, IFE, and TFE.

Depending on the hardware architecture, CAMSS may contain different number
of front-end blocks. Some camera subsystems also contain offline engines
like JPEG and OPE.
All these engines write data to memory through the internal CAMNOC and
share the camnoc_axi clock.

The relevant topology can be summarized as follows:

CAMSS device: Front end -> CAMNOC -> MNOC
OPE device: OPE -> CAMNOC -> MNOC
JPEG device: JPEG -> CAMNOC -> MNOC

An ICC path is already available for MNOC, and each device can vote on it.

CAMSS currently has two issues on this topic that need to be addressed.

1. Clock aggregation for concurrent streaming, As described in the cover
letter, CAMSS currently does not aggregate the clock requirements when
multiple front-end engines are streaming concurrently.

2. ICC bandwidth voting
The currently available MNOC ICC voting is implemented using max bandwidth
values. This can increase power consumption in single-camera use cases.
This is not included in this patchset.

Addressing the first issue depends, to some extent, on the direction we
choose for CAMNOC ICC support. Atanas has proposed two possible approaches.

1. [PATCH v2 0/3] Add Qualcomm CAMNOC ICC provider

The patchset adds an initial CAMNOC ICC provider with multiple ports, where
each port represents an engine client of the CAMNOC.

This allows a device such as CAMSS, which is represented as a single device,
to vote independently through different CAMNOC ports. The CAMNOC ICC provider
can then aggregate the votes and calculate the appropriate camnoc_axi clock
rate.

1. [PATCH v3 0/3] Use icc-clk for the SM8250 camera NoC AXI clock

The ICC framework, together with CAMCC support, can represent a clock as an
ICC provider. The implementation is relatively simple because it reuses the
existing infrastructure, the camnoc_axi clock only needs to be exposed as an
ICC provider.

The limitation of this approach is that a device such as CAMSS cannot vote for
each engine independently.

I think the patchset should be updated based on the approach we agree to use.
If there are other possible solutions, please share them here as well.

Apologies if this message is not perfectly structured. But i think is
understandable. 

~Gjorgji


