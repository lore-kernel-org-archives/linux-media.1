Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099706;
	b=KLrv1UYmBN5nGajolNjzkmbpB61MbMKqpzbRBDx7LaiH1j5c2tVTIILypwtFODX5a5Bo
	 vE1/h1nbz9A3thFe+e7QCtmFcIIpUd8cclelfroh4EhGb6Y28oYI+kACiMDG2s/LgEwI3
	 6V2AL4rJ+Iy0KlhSKFvvaJvX2EKdamFdbRMDvDpRjNnhTl/RgX/pXoDmzL4/wokSDIiqJ
	 4ZUBw+8d8BIhZi0j9io+vBxJ+kSoPJbUZMELtpsykyGcnZKrx4qvJ7zscpJlQ+RIalbfY
	 i6Y5Rs+RkZWH/YGYvJH6Z0A2J0mLimzB4YmD/v7JS1XawWsQUaw09CUcW92nKC+MvpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099706;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tRucvQt5o49jG1TwiHHjvTf2I1AR63Jc3hAhI3GDX5Q=;
	b=s7cA36MQ8EfhTs+inzyR3Vzn5EqQxmrGjiLPSAsNYjbRDchavAHSwyKdsfURKMT4daCm
	 vrkgS+g19he9wWNviM92wCkWGeOdEs080YNJJOOZBAnMXfYOlPFogWp5mhN2enpMZDxo9
	 HzCZgYVwptISj5Of46RGrbzUn+9WiTVsczdM8S7Y9tDVTj3N/9yUNHxgqv3orXD35kD2a
	 iqOii0GALc1Ug7CvhJd7QqIJD4tYVJHBpRcZuj5yd572y7V9zU2OXtgzaG1i7ou1YHgOu
	 abCyFPAyjjhZ+whTsIhMVc4nTGb3h87wZn17ghjZiuFHm8wSQpY+5SD0w6ASUnHYLCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dC26IiSe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hxRIPlB4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA64606A31A
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA64606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dC26IiSe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hxRIPlB4
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeKfF1427452
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tRucvQt5o49jG1TwiHHjvTf2I1AR63Jc3hAhI3GDX5Q=; b=dC26IiSeUN59GFJo
	RQx8oyqKnkOoM5IaASm3NFGndcZBXQvyMcM3uKDSxqjVbTNnDEb3ssNNdiAF3Frn
	An/0XYKg5r2a53M1+gWpBXgKmmXv6hOA9UrY/lLXWWZuNszv8KsNBkMq+jC8jVfG
	VvSDqQobri9ti/7TgmT2vkkK9su3XGGziJ3o0Me4cG9I7PyuK2EsCpYc6Gd+zW5i
	3lwcWKa6c2dJL+ZbzcKMy1fztEha12NosOv4mCnNrlziXsUSaPXxjtyBLTwM6IN8
	apARx7ayk4qAUvQjKEBp0acX0+ZT006B33M87ANpr9JqzI7TtnA14Ni3Tj1Dwyf9
	/l9Osw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmb9m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:15:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53568f05f8bso12939551cf.3
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 04:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099703; x=1793704503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tRucvQt5o49jG1TwiHHjvTf2I1AR63Jc3hAhI3GDX5Q=;
        b=hxRIPlB4ILbHz1FGjyCwyTmUK1dgF+HADps5LknqZEWj7FzsbzCzGMNP6f+Hm9ukKC
         bIVmLUUT7Bb3v1sjjZi7ge15evIuMilO44zx0YxisacVoe7DIBfEvdd0A6A4X0321KC8
         MpW+qXmkIi4o9LoQl5e16sb/tMHbB7L7T6NFwuK83AXM4l4cdBpYAYLY9T1k9JLIyVlb
         hxaRrcO/kOtaifMQ7WpRnMK77KilqoIwMipRaviBowppj32JxtSJWtCEBW5O8FtaqlxZ
         HKDba2xO6gEqIa2gcid6z1wem9JaSsIEIoOcJk3Qc2fyOb/M+qcWZm+lWQhOYnFz/dGz
         CjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099703; x=1793704503;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tRucvQt5o49jG1TwiHHjvTf2I1AR63Jc3hAhI3GDX5Q=;
        b=MEo2pegjmflkb6n4EQzLhvo9XuKPqGG9+MrtmCoYe3jBOdF0TaIotImcWjBxLm8adD
         qoVQz4MJ2egREEx0gGgjlfzhVznLkc3n1p0ROdXfIoaRdiWWS9d02OJeERGcPahrPVeh
         j64qKVVOiar/Gt4pjDpmZgvSjaGWyzfFf4so0ik+wf1UCHfiWVnSuce5XggRMjHEkwwx
         uSJNbNpL1KLlje6k+htYAF4bZddU3HCE9RyqBSVJDCOYs7IidA+OeKginpSdh69ZeYaj
         Jp+kOOqzlil9vo1asmUO9OmhQ+o2xa69qIlGRYK2HDXfHQjkgWvqW7k9lEmUjUALujb+
         EMdw==
X-Forwarded-Encrypted: i=1; AKwUvBx7knbwhdykwPpv5n49da+r5T2/lBM0D3n4CAnUtCJwh5dWGcOlour+r0xSU7bSyEJ1p5UVhaLAtwtZdA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJX9j7aZVt3+Wh/TFZuSvJMFCZwM+xC81FFr26vBKyEdEK94Veq
	jM//6nGDJ31U4wayKpkT0rEXH6sM1qq6k/HzPkx82H9/H3LIFX6mxY/zbLfaYKqfjn+sT0R3S2t
	E6SNnoVN8txU7gJpNvDWOThE3SghCJ7NOinR+Wn6yO2smqW8kqI4NoDD81cedeXuJzg==
X-Gm-Gg: AYBFou2CieM8uN+iVULSN6EKts37TQHAIwnpfplSySULnY4vaOD2RPer9Wtd33LnORK
	PpQWtStXULKQCRHKSBj2JfJO1i3EV9QydhzSCo7DNzUgD6Z58/ncJho49QbveLuZpPPm3qZ+yqg
	4rPFdaOAG9MZsB++Q/HFKN/hnXCmgjwJD13stDXAT99y2p/mVvwfw2Yi7KPhuUgRPYxOZpbjU+3
	RcRzsb+BIXSXpm9kCalyVeCkWUgRPDjKWu6CbIhMOz5VnlmkAyBWDeyB+PFFjWhH+VHtaPpURy4
	N6EI6NbY09wbS6g4ixU+SbD3GHvcjLGOW4U8JKWwdPXXTcUK7ibbpHSpf8K2228pby/77hQPkRC
	76950S6P5yf2y+WWdiMF+iA==
X-Received: by 2002:a05:620a:8a0f:b0:940:f21a:eb64 with SMTP id af79cd13be357-940f21aef09mr1112253585a.5.1793099702670;
        Tue, 27 Oct 2026 04:15:02 -0700 (PDT)
X-Received: by 2002:a05:620a:8a0f:b0:940:f21a:eb64 with SMTP id af79cd13be357-940f21aef09mr1112248085a.5.1793099702115;
        Tue, 27 Oct 2026 04:15:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e99a2sm436376166b.24.2026.10.27.04.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:15:01 -0700 (PDT)
Message-ID: <c935cf4b-04de-438d-9049-7126fd82521a@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:14:58 +0100
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
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sm8450: Add CAMSS device tree node
To: Vladimir Zapolskiy <vz@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20261023163057.775917-1-vz@kernel.org>
 <20261023163057.775917-5-vz@kernel.org>
 <CAFEp6-03Kqxya74Cd+hgueZ0D4xAcYNOx_R1sNqdMu2JrMBynw@mail.gmail.com>
 <378094fb-5f7f-42c6-a91f-158e2083a6cb@kernel.org>
 <CAFEp6-3XTotgkOKRACGLT91wUw30CgFB=44RtHnXfA6cOF7bVA@mail.gmail.com>
 <0d25a732-ccd5-4a7b-9809-93e67899b4e7@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0d25a732-ccd5-4a7b-9809-93e67899b4e7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX1rAPLFlM13HZ
 1WqiiiTZJWf7I2r8vTwSJlothp0Gvlapu/d2KlpUmPmr3Is0ToWIEJD9Ltl+6s8hXNhRQs11148
 owJ21b4EF++waUDWjSdSMMYR+UEg1PE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfXw3+Red9obSU+
 xEIDmB0wI/D9ghsxAeqwK9gyO2eiTE6uobzubS32je4m3sqTmdYyDeDdmvn2qZxqInWibKjgjR6
 Zb1QnanKtMIhSsjhv9CHY5VbpnMfkiyaWAq1fEBRZA3MouFguOiRlVcftBMpfMVHiijdhupIdtB
 3j1Iet3/AzruSpXrqquIpElbZ5N5cK7nFOdCQhc/MePS9SgzuFYVbD5aWpzFfHzuMD/GUJjkNfi
 3yXMTjbFqIL/EOq4JCdGaCY9IVIBcR72wTYQoI1SkGYfCmU4QQJqtrr6CJNIGDLs1MfiZ7vfUTR
 ChM6fgPbd8567h38VBBY+YbKnyBq5nT8y00RWmXG5qoUEGVRIFqFknoYOwzErRVqixw3FCflG2g
 djrkz84V/6dpqLpwlnTZvxNEiddeUYPYKu/jDYwOhifpXiB6OkAVDQDhxc19+xJgR4dy7yNae3O
 RtVU9HaJd0dQRFPA1uA==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae087b9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=VFv3GnuNtnl0mo3CAFAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: J1jbGZdll6QFxGHZx4csxra22DtxSbKe
X-Proofpoint-GUID: J1jbGZdll6QFxGHZx4csxra22DtxSbKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270044

On 10/27/26 10:54 AM, Vladimir Zapolskiy wrote:
> On 10/27/26 11:07, Loic Poulain wrote:
>> On Mon, Oct 26, 2026 at 11:39 PM Vladimir Zapolskiy <vz@kernel.org> wrote:

[...]

>>>> Is there a camss "top" register to describe here? e.g. to retrieve the
>>>> CAMSS hardware version.
>>>
>>> I'm not aware of anything like that. What is "CAMSS hardware version"?
>>>
>>> CAMSS embraces various blocks, there are CSID and VFE, full and lite
>>> IPs, and all these components do export their versions individually.
>>
>> I mean, CAMSS usually has a top-level register block (often top or
>> cpas_top) that contains the Titan/Spectra version information, along
>> with various global configuration and mux registers.
> 
> On SM8450 there is "cpas_top" register <0xac13000 0x1000> (not in the
> series), I believe you reference to it.
> 
> Is CPAS a natural part of CAMSS? Can it be modelled differently, e.g.
> as a separate device/driver, like it was done with JPEG or CSIPHY?

"CPAS_TOP" is for all intents and purposes the same as "CAMSS_TOP".
CPAS is essentially a wrapper for "things in camss that aren't
subdevices=PHYs/IFEs/etc."

Konrad
