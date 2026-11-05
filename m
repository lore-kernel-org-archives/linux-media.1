Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793856755;
	b=CvFQ/JbUeLQ6raDNkglMmZ0Xz1LdnmYcQXeiEdm5NOISw8BC3jk9IUimzIF4k6R8Zgvt
	 DcmwkpURDEZjAsFuXkQdxv2E+atAJI10YZTiPIHVMJulY1ZTsd+eNSbCiLyZ6LeHWUx8X
	 p/ZoExXf0KAnsRgDnmKWwVHselQvVhRzL1L42kLk2RP5Z2uc+5+pLuwXwBNk8wD6tL0Xt
	 QN1DesGAi8kjf4Z0OOzfKJWiEV2kJ4xkvtpndIbevLorgHCx4NlvTwjxC8KH8USCVJ6Fy
	 ICnG1hlmjPVkpJrXC9eYSAUdNkBtdclZY4eAwDhLk7CQXhxF5BqqFn7Z6hiJkXVKOmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793856755;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bW86C95W2VUa3TTtLDIwP6qoN9L9lbkIZbVnklP859U=;
	b=SH60AQHzjnQShJp/8S7zT4wfnUmr0bsxntjdNobPhr6iTaBrSS4bo8ZEWD66KuK++Zwy
	 z60PPskXSuU9JNVDW2drt3yvJfVBUlNuZaM6wXVc+gosCR872ZtqpdyHg8//onMEA8Oya
	 QFecNFhHCdeQ3xdf+yOnw3q/7ZQNsGTBnCvkHVhIgxIhfqFXeFMUz9iaH/km92QmnSeq5
	 8sDhXHBd/YWF4Drp5WJyoC7/cSYce9/SmT3gJTZJsCHRQwuWBI3v1FlXrUNDfuUJ5B/37
	 iE+lyiH6Lg8X/Zy7i9MdN5MULA3cHlBkWt7roN8V25ySPKbfUtR+0ESHBDDAP36xyEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ATiem9ng;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kNliE1pm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76A2606A31B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 05:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E76A2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ATiem9ng;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kNliE1pm
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50p6Mf3443498
	for <linux-media@vger.kernel.org>; Thu, 5 Nov 2026 05:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bW86C95W2VUa3TTtLDIwP6qoN9L9lbkIZbVnklP859U=; b=ATiem9ngPBFH6YEx
	TGjK/0BlMdYHEm/YHjSx8kFRH1vADGx+4lat/4D4RrG/lJCx7Vv6TsB5uIl1ztZY
	vvbYEaovUAyzEncLlZCUgzwYiLrRN8y1CZ3bi+nyha1dyBmLkZAUxg+rVGVBtRpB
	GDK093OwvevmdK1sbO0vgEGi+WMZtSKuLZe28ekdSamKDvTeBghnEquf/LiK07lu
	Jt9rVj4/6XjALxkU+fLGSEvfT2v3A8r9dNOVcKV6v6zG8/8GOFCJAdViI97QhjOG
	3pGfniZiocs2nudTu5Zhs1MdyuelEPZ1jy2Mn8pjp/ZTjIo2WstNWBJfgQkKkKNu
	1TEPxQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn3y77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 05:32:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05bfa6af5so1383727b3a.2
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 21:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793856748; x=1794461548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bW86C95W2VUa3TTtLDIwP6qoN9L9lbkIZbVnklP859U=;
        b=kNliE1pmKLwz2WykxnqDvlJMJlzO0eUpA8/xPUmNS59RENLsPDBOu0+ZDg9ltqNVrD
         VVWnIa90/HnXMqNXoxkDDeLLaklAV1iitzu2ZcQOVNMMbSBOxGdnN0JZcr0bHLabKcZ/
         6wV5hGbNVdw1uWfBe4l+TCbJm16ymAnlhaZbHIuUu30jzqePCMPLYbfn649qpb6gJo8f
         q7/cJ+xHaTnp4RYdT1kOFl+sTwSi+VkWi8Vao90Sr/30MHpf6bWBM9bwyWGYEq+QdFbZ
         +bHhTGexU2zFXjb7oPRVwkc48gyAJD02TIn/CXfKvrpDdzUUz95yyzilabl4XBV6C1a2
         M1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793856748; x=1794461548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bW86C95W2VUa3TTtLDIwP6qoN9L9lbkIZbVnklP859U=;
        b=j3hnoHn9vZUFSuPbudT3eXKaAioLdlfDCTvkMsfYfD012zOShoY4DxIXO0EPmotfbo
         d78vZE4Kzi5m7N2orrQiD5BlALrIaX3JH8l6zRSgBRmiYR7sddYfJ4gpbv4E3bnNy5cd
         nx+ZPMXHCft5nrifVf92mq0wQ/WWu+4Ba7y2c94l/mPhgbCueq9h8rjV/BsN54sQSEKv
         lwwa9IzdobUXtAgqFT711OcVcFYtORkV2aqcRb5MPK5IhKbYBMqBLJN8H9VNv603xaUS
         EsT7ioltHxNUFSN0Ny9wFkgBC1qCaOA0DVXclOc+w2M8aAyWM5gXVAhqTCPu96f5iYby
         gO3A==
X-Forwarded-Encrypted: i=1; AKwUvBzZwhSM6bIkgN5JIRN4x4jO7KNGoZ35B1W+mannR4j8HYaCVMzWeUwlYM9TKiJyusL01ZZ1Kqvxe4Nzwg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/c9BwDZHL15LJKBnOW13+DE4PTAk6twCBfV/n53I+Tuiok+eaD
	O/W3ZrKRGHY6QUbepCRqbnh9oV9DXBcUl2C5L9S79LdefHdj+p4vZbKSnJHRbEfteb4APmafQgn
	ccOVbELmQTW3g2QW/SMtmSJRRUWLs1QeuInLa+M8XRrrl6ARSW2KxWzhC51mZ10hBFhZswED4qQ
	==
X-Gm-Gg: AYBFou1tX1Cf88MsGucb9YdXBUX09h2sahq/6YSDwqV6Aq/ddzcFihhYNf0UVYbc1kd
	pkZDrDyoD7tuilH0nIURNULSqDCy3du7QALIVvB5bd9OHhcxHakpeh6RGIrrfbqYF6rocFd8YGP
	10aEJObanzo0t2NBI19lLFoptE1FSTzlVsmqcgdpr2DhAt8uY9UKw6MGwd0JocE/yhosC7j7LAE
	d8hzJcl39lTDVZEgm0mM7K8GOAHh4qmSU9cngyFEnIswr2rYDb4NY8q4JPozzfNda0G/fL063rB
	SedYv9iS3YoZoCXSffeWYwWrhaS0MFCIW7PI1+Zx+fuVkz4rJfEO+qp8JtTdCVnVwEa3LHnCTv9
	psSirvVUOrAw3l3OO8otZrjw2eRDDKxwJcd5sb+0tPP5eia7ZEFKtOnEGCpw2UetB2URB4NhDR+
	4=
X-Received: by 2002:a05:6a20:9e4e:b0:3e2:95fb:8d03 with SMTP id adf61e73a8af0-3e928a845f3mr13341115637.69.1793856747819;
        Wed, 04 Nov 2026 21:32:27 -0800 (PST)
X-Received: by 2002:a05:6a20:9e4e:b0:3e2:95fb:8d03 with SMTP id adf61e73a8af0-3e928a845f3mr13341084637.69.1793856747307;
        Wed, 04 Nov 2026 21:32:27 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b569495sm1577758b3a.37.2026.11.04.21.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 21:32:26 -0800 (PST)
Message-ID: <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 11:02:20 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll>
 <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAyMSBTYWx0ZWRfX7mbTdcBvEDS7
 X4lyeSn6qr29vk70Cp6pCssdbQEhxoEQglbPp1+FkmoI8RoYJnNQjWLrqjqC/N3V/AgQd7u+ubw
 K3OI1N1XoZH943CGsgbS6uc4JVrL/z9DqGrPBOtu0JuyAvBFPFPpbvRz9F1qQ8R0vznyCDJeRW2
 q5w8e0/umCXEQ1XfkkkUEQPen2nFND8LsfBVtkLIKAGzSszZeoPI0iJFuH1Pu/rKvJiDD3dxSDz
 jV1ZIjkWUiv3r2loTNmb0mR+MA4xBwqSL4puHzkXAmZ9f3oIM+9NfItuOevl93K1kgY9c1DLjV1
 6sstWwvy17+3GLXpX0U5BUDlUdGikVj6tlLirgRhb26zyMJS387zktPUtQT9MJMQnH9SMkNXK1W
 +xwyETIf+Hvcx2CGplPFa9gTeYrKvN6qO3jnR9dVgWS2tc1UCUTwoZgdUP3dtjvKfejCSBoLjn9
 xUl5QqTtHmqviz74rjA==
X-Proofpoint-GUID: BpruSV1noivXvlEmdA4DfC0ptdIcxlRo
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aec14ec cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=iBD9WU1rH6yjH3nr7zsA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAyMSBTYWx0ZWRfXxYs/BiJwQDQK
 GeLNNdduUjwmEgm94A/MSO6TiotkjXdjW95R9Tm98T24sLPyDpyxq0FMD8lDbdub1ImRbn1aj94
 bm0FVft4nbWQA2T5CM1Hbg0sKRuTpcA=
X-Proofpoint-ORIG-GUID: BpruSV1noivXvlEmdA4DfC0ptdIcxlRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050021



On 04-11-2026 21:42, Krzysztof Kozlowski wrote:
>>>> Glymur describes CSI2 PHYs as standalone nodes, but the CAMSS binding
>>>> still models CSIPHY4 as port@3 from the X1E80100 csiphy_res[] layout,
>>>> where entry 3 carried CSIPHY id 4.
>>> You also remove port 2 without explanation.
>>>
>>>
>>>> Describe the hardware connection directly by allowing ports 0, 1 and 4,
>>>> and using port@4 for CSIPHY4.
>>> All this is confusing, why do you introduce gaps? What is the reason?
>>> Your datasheet naming does not matter.
>> Glymur CAMSS has populated inputs for CSIPHY0, CSIPHY1 and CSIPHY4, so I
>> used a sparse pattern for those ports only.
> port@0 is CSIPHY0
> port@1 is CSIPHY1
> port@2 is CSIPHY4
> 
> What is the problem exactly you are solving?
> 

The problem is that CSIPHY4 is connected to CAMSS interface 4, so the
graph should describe it as port@4, not port@2.

The previous port@3 description only worked through the X1E80100 resource
table indirection:

  port@3 -> csiphy_res[3] -> .csiphy.id = 4 -> CSID selects CSIPHY4

New standalone PHY path:
  port@4 -> no csiphy_res[] lookup -> port number is id 4 -> CSID selects CSIPHY4

>> That is confusing for the schema. I will allow the continuous range
>> port@0 through port@4 and keep the example limited to the populated
>> Glymur ports.

-- 
Regards,
Nihal Kumar Gupta

