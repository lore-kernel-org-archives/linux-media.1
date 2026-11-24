Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489878;
	b=4YrHdNDGyN++yaq4fveiD0PSYL3jQOldCx84crphINbs+TOWEGXDbwhmwopiw4VTue/u
	 qq7a1i7o1xXVcx4LlkuC/m7c8qD9rxUShpybmdhitUrlbT1EjulCD9v5lPUlBvBDd3YPc
	 8V3iFbBopFiYQmIiETEnDw7EOhZamoAFOJn+txgiAHxTl2cqr3b+qi28oSpeRglj2xE3q
	 7cjVYsrYJFbbNYoeSXFB6FMAjM+in97R6LE2C7jfKEavE83Y9L0sB1mYMzjfRQlDWum4Q
	 U2/mqdUHEzyU9VhhPp4DwFgxwP4Bi6sE/HpcJN3N8R8rlGDPtA+F8/PoKybEiILAb6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Z5VeJnwz4/sm28InEjRBuwn7cnvfk5WFes1/QC4jAFw=;
	b=i6NtyS8aKddW7zseD+C4SHrsY7zB88yxw7DrmncACCFWseA0OovI+NYjzZjzwjgjYdqm
	 esMFrbMI/B4O/pFLt2Yt0ci8L35lecyV5G5j6IRPZSUKOIlWUce2S6AXXj5uFb0+k8ObJ
	 WVg8X9vYuMPm0l54+bumwVyCVO6hGXVEuBqZ/HTjdvdgZt60F8X5EsHx5Wzcg3c2jcTU3
	 7ydO7kGUZPQk8L8mBLWpiNX1vhEDPixb4QCwbA11uX+SsFPPgbRqd69vF4qgQKwo5adii
	 9NMrrqXHvIPyQINQBF+VkmmfvfZhc0Eu1j1z5zfzOFzYudje0F3p/80FG0oHGa3ogQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WWOd9wlx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ikjs1Wl3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF70606A31E
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 03:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF70606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WWOd9wlx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ikjs1Wl3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k3V03701186
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 03:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z5VeJnwz4/sm28InEjRBuwn7cnvfk5WFes1/QC4jAFw=; b=WWOd9wlx+nGqB0d8
	7Uhr1RJvZCNKrfDecfAFW68iEq8eEppevbasIdWBuCOHSXpISC5Ubho4n6ZgeiWC
	jKCm72zywG+/3bXFRvEFhe4g2MvS8ndgiQTaMSFFdfZqHg+IDr1xv0RKN65Tcpt4
	Q8BmVjSMgTpkk6a1kiI6UksXe1TW9gEBQri4PSSXsAan18xUsxmXPBxlazGnQ38c
	uWZ65pDjnmU24N6xWUIzVxN8YjR266Fbw36ht/aDgS5ck68h4/Fk+JrnUr/w+r6i
	NcBUxMNqNE6REs3880Al7zGI4HhRdj7A8SEmPh6L0vnKQ/Jehxvi/vROlE+3cRxh
	zxFvvQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky0c3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 03:11:17 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b45597c7so4579412c88.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 19:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795489876; x=1796094676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5VeJnwz4/sm28InEjRBuwn7cnvfk5WFes1/QC4jAFw=;
        b=Ikjs1Wl3lfyXpwtAEA3LeX6fWGUpS33OMr3vVUp2PdzK+NtLs97ZBF15il+P5c53Z6
         4n2tnQKTlKZZaXr7W6W7lIPwgKqmW0dN7y6FW9/tqo8r5ZLO2hO6SfXA06gJnMInSe5Q
         2g5uzIMAYsbMtfQSl5ndWdcMLxXjG/35t9gO0xANAh7zE0V/925icKFfg+xNWeF9LbHf
         nv9jar9tYKlXzxO0/ojXBjdIlcdT7sJqWzydtnclRh6YXAdacUslpDtj0NeJ+BhNiNr7
         XcBZMcg0RyOa+mU1NOsPcAnRxcnWHWMcBjDliFORKIU3qzJKnBKN5z341xzNQAWBT+td
         cbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795489876; x=1796094676;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5VeJnwz4/sm28InEjRBuwn7cnvfk5WFes1/QC4jAFw=;
        b=aXGYARJdQRCw5EYPqThIfyyZoQrD7iz32ielPPtBkNlaznE1KRpJhfBi91K8jj0MtU
         z0YrYlPRf8GnyUW/vyvos/bZ2KZlGeTxL9a6MR1P1jiZVwjAK8okmrSgC/4z0gHa3bzO
         yzlAzHSoDJQOs9fEHtCUMKpoqeeR83IKdbDxn9N+2KwoJ07D058ecW4FHMlgfgAFVFW/
         jIpItYkD8capW+GERQA3zfQki845hCquD5mT7KlzPhWBp/XDp0fL0a44vyGLJlhmfsp0
         gkgn0E8EM8S8wht2BKyj7V88QR7wCGgVKju70FZBPS49i2BsvcpMBzRFe1U5Llhq8lCw
         owlQ==
X-Forwarded-Encrypted: i=1; AL+hErE4KrKyTNBP6050s6/NbJ8RNsB3coEjNKniIKuT1EplydUdzj6eTxwNGP6hAoBe8jXbk5S68lNfNqmobw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/4mWJiQtMFIcy6qdKR3HAIYgVLmP93vV6wYeW0L8Bj33Muik1o
	NalB/X/ahMqsbEm9QIf+lkhoPkvSINlI6TXFQKzmHm8Cx6KhnDNQEmAR0kZF84qshtj/vPIvDIt
	I9y+bIVHaq+0OxLOjgqhOozrp4jBL14hdZhlNoncqKF4uRkrYfNWDL6iwETpiefHiKQ==
X-Gm-Gg: AZFdTZd2KfJFQsJ17/H8/DxqV9YvCQgxPRYeJrpcprQgJ5o6H+9Dy9Km80MNBB4ahCx
	yDk14Te/i3O9EjUZAnu4Zg7M423GJkls1i7vK1Al7kPQLlH901QyWvsojOOALIYHG9OqzF3R0cR
	wqo/B44bAi6RNCc5URhvckdle3KNyiZXUMDuQfb7kFcGE9NB15y4/RrYKI31i/sAvhjOtFOSSkr
	tFS+ybuwtLROY5Dl9WSh0frGsf6HYzo3/Bxxx2NNxdBmMd4qGtcXf0H1dP0mvm3vGjAnWEqpqLA
	k3hexKulLfAm2rA6wzJGr/uYcBzAirwV9fKum9AzhqC5DhWVIDwZe4EH6OiKrSYElcpBWS663Cg
	5zl8/QiWJo8TovMC2rXFrC7CB74x+lme4mxSWMq03l/ku33qVXVpBWZofnJyhKJ7EQO7qsJcaeJ
	3XV0Mn
X-Received: by 2002:a05:701b:204b:10b0:1af:2ba7:e44b with SMTP id a92af1059eb24-1b5567a6142mr15576905c88.3.1795489876311;
        Mon, 23 Nov 2026 19:11:16 -0800 (PST)
X-Received: by 2002:a05:701b:204b:10b0:1af:2ba7:e44b with SMTP id a92af1059eb24-1b5567a6142mr15576868c88.3.1795489875573;
        Mon, 23 Nov 2026 19:11:15 -0800 (PST)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm24383285c88.11.2026.11.23.19.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:11:15 -0800 (PST)
Message-ID: <0596e698-a599-1f83-a39a-146b52569575@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 08:41:08 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] media: iris: Skip redundant HFI_PROP_TIER updates
Content-Language: en-US
To: bod@kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
 <20261031-fix_dec_seek-v1-2-cfedf0c267ee@oss.qualcomm.com>
 <179501803041.2846709.479596500645471046.b4-reply@b4>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <179501803041.2846709.479596500645471046.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b050055 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=ZEpBKAdWhQgix3oRGUgA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: oR3S7QssFCU1qy4TKE4WBWe4PGYHj0f4
X-Proofpoint-ORIG-GUID: oR3S7QssFCU1qy4TKE4WBWe4PGYHj0f4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX4RfSxOpNi8BF
 XnjQidfaKXqAZlqYI4mNaJQjX9ozb4rrxuRZqZg1oWcROzP+dggtSYoMhAJXaPzSDowfF/NP83h
 Xakz/z2PoGacTACg6dUVPB5leGonbyA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX7T2zLUd9r66w
 fL7UOeOaTsmy4F/ma43Ta/dIeL9hC8Bcht6BBD6UwIfO081kUa3ATdRDfuP14roMOnNCDC+cHD+
 Q7woEqVDhGOemyvmzZdrk0oDKsf4bUr+Ux48FkvleuQlmUL8PmLxN0S6ZcTVgKA0/2N/rXlmqHK
 WJkHahGhIMUhIB0dOFlJdqJKZkLpR1yP6qrtudUHnu3iIOK9EHEDZRrVdwFoWGz/MXJsoWX+Bg3
 tniS0F0NWbu+DSjvIfgxS+yNkseUizftaOSd1ykKmZ4vL0YxFmXuUC2TVq9B1pNHvTj8sXki/X2
 4nGIYRbp4lAqpgqGBqOYSnnRwHbDBgDG/FrR8n30gxORwE+LJuL3QX5z7Xk/Is6lKGyondxZcNC
 C4Msx4XAc8CIedTDcnZRwbOhAZdehNuI21QDDbLasmlYYKrXNpCN4PJGA/vqO0ge/fkZ+nNRtfx
 9r3H6J6gnCBbvIPOOeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240011


On 11/18/2026 9:37 PM, bod@kernel.org wrote:
> On 2026-10-31 01:49 +0530, Vishnu Reddy wrote:
>> HFI_PROP_TIER is already programmed by iris_hfi_gen2_set_tier(), which
>> selects TIER or TIER_AV1 based on the active codec. The TIER and TIER_AV1
>> caps also define a .set callback. As a result, iris_set_properties()
>> programs HFI_PROP_TIER again through the generic cap path.
>>
>> The generic property loop sets TIER first and TIER_AV1 last. For non AV1
>> codecs, the TIER_AV1 property is programmed after the correct tier value
>> and overrides it. Remove the .set callbacks from both caps. This ensures
>> HFI_PROP_TIER is programmed only once with the value for the active codec.
> I think this commit log should list where and how these settings can be
> applied three times ? and what the sequence is exactly which leads to the
> invalid setting.
>
> It's not enomrously obvious reading the log and then the code how that
> happens and which one is so obviously wrong.

Ack, will update the commit description.

> ---
> bod
>
>
