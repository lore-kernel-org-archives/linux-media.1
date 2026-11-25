Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608132;
	b=esLr0OststwRn99oB+9sgPN2gKfN7QGpqeWT7PgfvfoD/MExRrko8QJZFLmaYOwHwhe0
	 uoAcwjiLPWndUM8apR28VGqcVRQqZm6wvzPLXxPdSEMaUctdw1jgDRNS2fQYa27n1YbIs
	 EtoumPXQE2ugu5DdvpllxzbMODHyyPQ1fFdYCIYNXitaZFbH1+zbOZ3K183Rh2gAfBBCI
	 KWB7iXPI16GAHgW1/Hozc/rx9aikA1hd3ERDEFmvxanYPpbGH3dyC8OteHENySuAQiBeO
	 KA6jzQEdvWEt/5f+AZ8UvmnVXyhiwxytCOkSyESyYGS0E90eO2CLt5GGuWNIDX0m5ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608132;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i3jYSnSdn2u/GLu3Pa6dvx+oEPdp+Zst7Dskdp50SrE=;
	b=LsQbK8s6uaeLCkXPn0qg7KucDv+HLDFBlcT6EcsKBxobmnt/x6T9JBBy1CGHmJgSa5JZ
	 B1OnYtBhyw28ONJ59ScC0iCERBImrXFXtzvorHCBsHa45HYSo5Psafjxi/QEXgPxeWuyI
	 LrCTYXCINYBytPMcB4pQbSPtBA6MPbgTWpp/9Qsh+uDqso3Qt5enbIlfvnBEqKbI2fP/P
	 GZEPuBKPINV+jIXrZwytmN0FWM22Uj2Y3DFdvQTXD3GRbc8yFTIE+gHIJgRBGGi8uWVmQ
	 j0PHYXsZqQKljkUAn65He5oiaIo0DS0AzwbTUjz+VVlSndaB3kmD7+FcFvm3X94o2Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FWZlc+cD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XbHjhbtL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B575D606A332
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B575D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FWZlc+cD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XbHjhbtL
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APC26Jn416040
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i3jYSnSdn2u/GLu3Pa6dvx+oEPdp+Zst7Dskdp50SrE=; b=FWZlc+cDremacKft
	cqyuED4wIryfBVbpSPhjMFZ/b68Mrl3eIGreRGL6BWues1c67G/LjonhsTQi9Ojj
	pv1NENGBoJtxsViOjN6OWXfWH6BlHdzIQGTNmfyFu3xVhHUvYODgvFCfClQBwXV4
	+MKg2zUFO5uPTyydfqBixUp6WoluO9SjBG/r2feDeL/JV6+NNXF/BL7hL2eqPI19
	Wgs2v8cyhsnyzNJujss6cHH72c97N/bcIYIeCdYqxW6h9nvCLqPyb0ewOA8HskSB
	CfNAfEvJwLihiHbxVQMfuZ/Q2pGI8VvLc3/RF8BIvoM1BMGWnpnMBqSfVMVvRHDn
	IjQNww==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxr00x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:02:10 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-997cb8c122fso75757241.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 04:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795608129; x=1796212929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i3jYSnSdn2u/GLu3Pa6dvx+oEPdp+Zst7Dskdp50SrE=;
        b=XbHjhbtLJfJMCNTHQAZt3L5oqLHkmdq1b1dA+4GB9ujriHR8MzSDoHRlN0LnWTj9NZ
         BaukfZrnQ6d2Ixi6KqVboCJSMYD8LOp1TWFLmU2I2qZ2AVgGJOE4A7jHM5NB2oaj1owA
         FcrzrXyDxX9sga1/+9I0o5B0+nG93tnpnznZAYZ6zAE8CI2C03/aFwTL+K2Ya6GFLwr/
         M5rAu+D4sNsr863b4glNaoj0cN6i10rp5dxWn0QYB1ciL/9ydfUiKxdlCxgqCjtZuG3d
         jmZfeok/HKLSImfqy9ZnmbKhQrbVk1a3bFyG9M0d5tXRvz8O3VyFbxpTtQUNThp9PCxv
         uT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608129; x=1796212929;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3jYSnSdn2u/GLu3Pa6dvx+oEPdp+Zst7Dskdp50SrE=;
        b=r+o9HJ2vX823K6zrZIvsinKpZCH/g5p7yU74wSgRlfLb7NIpdAKVaE2zzGKX2RszGQ
         /wqxMIkYQaSinHQNaTYFt5KUrxKSckgFk3is9C5cI234WZZhyfEO34hUd4z5wVUlXfwf
         IyGOadFTsKU35rNZp3Zo0UpGjkt11P4P2khs7S4o18sT+sH6AW3H1lDqC2OZRKv0jwSr
         aVAhKwgm68F4tZ9TncEzROZsv234tKlwdjqbwNDXom6NY2JWL1iBmjWliHJGj8FA5a9F
         ebdCOhevYAn0Eq7vjibmq1VFzE4oTy/Nf7CMmXhhO2rOh9ef6lVk1pIjJ6IdL5SCy/XD
         /XKg==
X-Forwarded-Encrypted: i=1; AL+hErHWbiRS7EuytWethlFr5v0NdG9jIA19Q0befk+V2+YQ7+eZn71ixwhgFZjUcdV+Jf3of/QJG0SUkJ8aNg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8xjXFiNUS1Gt3ZyHQhEw1R3W12qxM0iFgAXDUrVJB55VHagpKP
	hEUqyc5qu+sacct9LtINZFVBiBIDBWWUeA6DSr44IcFoXtOylNtI03XOFUKmVY2jNR59H60qGRi
	PVm8VaT0x7Nh7JBqf+2br3v6At2qUsaW4WDIv3ETLOgTBMpMl1kIt1rrRIAdAJk0zoQ==
X-Gm-Gg: AZFdTZdW95gr8LZp01qoOJ4uzZPtETFWwBe0xi8xN0+V+37FBs3GCMyrmo67Yrb3NqP
	+CAHIsI6MGkkjMeR29YYO5fVVgeJzE0dUZaSphsu1fH1JHDNA7CP+8EKKp+fsKV1rVUO9MqvwkZ
	MbBW6TmL0i3XkockWO5+uzauXfKbrDhqlBxvAsp5kwVGMUoyqi9GbXhf5OJR1d5Y6EAfrT9QTB2
	ob//ByX0fTJlse4NhcWby4K6au1JmpTCMJCVq/S796x6EIBDl+NtgHFHC0s/yV6hl5yQsHewWjw
	x3CKLEJumqb+pm8hf99i2nHNO7nZGslSDGZmcUks48BWhkqfGpHdxe6VJcIvsF7k1Si4s6g0AUq
	Kod+x46o73/HKEdCZzisn5+VB+2uE7jO0RmtC572vNBQxRPQORZwxe9NZWwrwtjQs1Wf44q4=
X-Received: by 2002:ac5:c00a:0:20b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ee8af8d7bfmr11581600e0c.5.1795608127969;
        Wed, 25 Nov 2026 04:02:07 -0800 (PST)
X-Received: by 2002:ac5:c00a:0:20b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ee8af8d7bfmr11581553e0c.5.1795608127342;
        Wed, 25 Nov 2026 04:02:07 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acff65bsm648949266b.4.2026.11.25.04.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:02:06 -0800 (PST)
Message-ID: <e1b4fff2-d7f2-4647-bacc-df55343031ea@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 13:02:02 +0100
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
Subject: Re: [PATCH v5 3/3] phy: qcom-mipi-csi2: Add Hawi support
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
References: <20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com>
 <20261125-hawi-maili-camss-v5-3-1483b7f68dce@oss.qualcomm.com>
 <15cde6af-0b9f-4a0f-9d21-4e5ca9107a67@oss.qualcomm.com>
 <e93eee16-df8d-4d49-ae56-3e6ba9c31167@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e93eee16-df8d-4d49-ae56-3e6ba9c31167@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 77PhSwANCM2L8M0Xtlm1KiSTKZf8wqD3
X-Proofpoint-ORIG-GUID: 77PhSwANCM2L8M0Xtlm1KiSTKZf8wqD3
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b06ce42 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=yOYrsbgnHfbpD3x4ck8A:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfXzh/x4mFo+Fnt
 pcWKO2+vJqr+XgXald3XZjNTmMJ8xrPlYcRA/gcUG8FQMdMyqqH+fKha4YE4Rt4Ta4LDk03pGCH
 78sw7lMQ1qhbw8FzD3I2FRCW0+YOpmuO3MWZinTulQ2pEsLhk0sgMhleVOQYMRc2SifBtmwRS42
 FFlS+0DSndSRnN8ukJPZFvfLG6SnR2NV4LPXDjMXIpbD27X8ag4gVwoNOnxp3+Vc1LZBdFsPwjJ
 JjpX7x5pQGiloob9sFNqPkbsezTdjZbG0XEy6fQUnifjp88zf9tzLYa6hEZwTLcmiGY0arBoJ3f
 0FCRP2+QIV/4KRCjXnQlYWzygj733CqM6+BdTFglQ0kRip5vIDlL2KzGp0w9AiIwd93tUZcGpjs
 uykKB4ZPg8ld+PwLiCrSfdjYdhG1/RJR80e7quv3AcmpRCUIp9cfq0h4l/QjhnkMPZfg/ZBmo6z
 fijDB+jierqdPetudog==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX++99qqQoBIDc
 iDBXQdbc+wilmtlO657raV/lUyLgcjsnfXEEtnJNsLAPpvXVzDeca/kHnAqHpvelurfYxhDsfH4
 pZOibWh2On0+3WErveCTM/rhvhDsmSI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250047

On 11/25/26 1:00 PM, Nihal Kumar Gupta wrote:
> Hi Konrad,
> 
> On 25-11-2026 16:23, Konrad Dybcio wrote:
>>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>>> index ed40934d67eaeba0c6ac7ac75324ac6292fe7d9e..5d91303e0df2e8c5bca3ea8fa2bb831429a8f1ff 100644
>>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>>> @@ -162,6 +162,126 @@ mipi_csi2phy_lane_regs lane_regs_x1e80100[] = {
>>>  	{.reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
>>>  };
>>>  
>>> +/* 2nm 2PH 2p5Gbps 4 lane DPHY mode, Kaanapali table with data-lane CTRL0 0x8c */
>> nit: 2ph and DPHY are synonymous, if you rename the struct to something
>> like lane_regs_hawi_dphy, we no longer need this comment.
> ACK
> 
>>
>> As for the override, if its meaning is well-known (the difference is bit1
>> being set or not), we can add some sort of a booelan override instead of
>> duplicating the table, maybe
> This is not a boolean difference. Bit 7 enables PGM delay in both
> values. The difference is the programmed delay value:
> X1E uses 0x0e, Hawi uses 0x0c.
> 
> Since this may vary with other PHY tuning values, I would keep the
> SoC-specific table.

OK that works 

Konrad
