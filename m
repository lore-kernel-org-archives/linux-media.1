Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677650;
	b=tnIiBH88CYek/52UOPf3JfyNMaRVJ1eByMadzLUfkMzNbQR+QSkh9H5XEq+rbFacnJad
	 nb+BSM8W+CO0tN3XTjG3fFuRivpuhMsovuwUDmtF877I2oNLpoRX+Krod5M2m3l8fzHcT
	 lOiFhXKnfKDgzfK/AdGInplvvtqWqDz3zmYeF9aPpZPF8v/dsXHLeWwfScHYd6q9f5wKW
	 RsfnBUXOke64htMcamQL13iU029NqDxCAXR0J4Z1Y9KPXyttSYwOXMzqYK3dglebx2owm
	 nzzHhv+P7nJwIfk+4RV0AgKdg9ojRwjPVhp6sSJlypSi6Sw25uN5kVUpYh/MEULEvIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677650;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B8lOtp1BdpmGa0OILsXSUegZLR5YKdtZyQNfiWMkzLM=;
	b=unu3q1tsV1xS5jySoDytYGE/yvXw+o4uE6H7VLaz3AFpuNkVXxrph5IBVCNNKw7erZck
	 QCWQpZzDnXh+snwr9nxgUM9soy4b7ej60rg9H9lGDl+enZEBY4e+j35Leu0B1yY/lnn/R
	 DDoFoVQFL+N+AzD2eiUaPkbLbL91RuTpq+9kQzaanC4THfgxO40UKHba5h4DSNOh4f7M8
	 BqvEA2x5eGgC7IvJP17EQv1RiMylsBsid9H5Pw4Agapd6ITBKOccb1OD2yp0WDlC2e6Ke
	 pvFaXqxxTk3ALIiEvsZINZi3UTIVf5iVtK8R+/Mm9XhEqw6MlYH7pvQdUrCtYoX5+3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ktFS6dZf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RS0QiWUe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F423A606A31C
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 07:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F423A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ktFS6dZf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RS0QiWUe
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7ArSA2885418
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 07:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B8lOtp1BdpmGa0OILsXSUegZLR5YKdtZyQNfiWMkzLM=; b=ktFS6dZfEQRV8iwD
	pCPK2b5ReA0KEaeK4PirTy4H13Rjn43NnL/7NrfBqS+Ukka9pRyzSmCsUU4yuKrz
	m+OPOLhT2JuVM/KyoTxnZsLEYZ0aS1XBeSB0sLH749jiKiuCJVZKIC+5ETzHMq7U
	01AH4eoTlCgnfOXE1UaI+OcNuwruZhKt+tTHfC43oWuJ8r0ZsKwvHYVopDrVeeJR
	zow6GtiCeqa3m0UQF2JfcD7ZutUxliX1YzBKVzAGot0gPN8mHJvpfMs6jbcwcNUr
	0uC2QEuARqf6KYipyIkVMxVcPIO9mZojyGKcQPdIkiG/qTjEoKNBv4lOVwQCNbnB
	tS1L/w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rg8aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 07:20:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so1135284985a.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 23:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795677648; x=1796282448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B8lOtp1BdpmGa0OILsXSUegZLR5YKdtZyQNfiWMkzLM=;
        b=RS0QiWUelppbMgyNiij49gbeQMNxmD+A75f7rmUoUmx/DVhKBZzcwB6swFOuVQhNlv
         SfgxYY84QcT2ujMZMJfoLMfb/aPahyydPUzZWo8r69ZOjLvpACEtvM0D/YwksqxTsjjg
         Befz4CtDWN7o62lfdotsHoB/MqIXpFdcglVSaXdPkxaduuIj/gqlFyOm4z9sVymz99gb
         YNZwdWwpAiarYttVYVjz1CapnFmTJkB6uB469Ad0RmxMwUypn63tzrXSwDMjZX4shdSn
         960lw9fJYM6Ls7D58CzW89D0dULlPTjthZVZ+x9wjoXh5f/EzyZK427MO3psqy+7YjZG
         B/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677648; x=1796282448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8lOtp1BdpmGa0OILsXSUegZLR5YKdtZyQNfiWMkzLM=;
        b=sEtISUlD9HSRW4ek/yNGqD0k5GFLlaQAK7pMPHLeb0nWcWfiJaxWBqhRmT1MI3n0Fm
         VTCjw4PV2leqGBxlz12T/1LxHUMxop5wylpchA0smG/tSMlf+GiROpe/U8lu+HKyDvXv
         DaL8TrsqGlNZ5GW1Rb6D2+0dER/B0DWSo1S+b9J/fifxmaYJqr0BfLY3NpI8nL/aP3v5
         vEe8K4IE4loLqbbE1x3ESKAfKgn6udyEq0JMd4bx6eLsSI42Uas5x/cfs8V3kVfKccZC
         IHq4k6RMOQTbiahmJO01tMMaLjDGB9tDuGsZCeGvIA8KYod2ONDLUztelh31WCoL6o0k
         rxfQ==
X-Gm-Message-State: APuU4Z94Zggqg11cZ0fOQ3maMIqRA6ugPVM0+ihp/hCHKvJGD0MMncnz
	4Vf3cXebsKeSp990WWrXcUYPN/sDdgznHpYDRjA1zRczuMAwb9SnNOm948Tb3Q/WxwWa7bZP02/
	3IupsnquFw0MzXk6+Q80Hm8gjHzv4PiwhayWopjbi5dbYU4cFHCkL6deShGf68Yn1Uw==
X-Gm-Gg: AZFdTZfLrto+0N8ZLTwkE2xiN0dt39ybdad9rIyvf/DX6t0MyQYTJaktOQaYyfst4LT
	wwHJoLbB/0+Fl012hBaQsiPL/Zn86DxOFBF04Hr6LToOb4jjBQXl25bBI1nyEwsEAFElI7WQhYT
	YaI1xy/kF6O909jhVjYd7lXi8+HyxLKOk/8qHYEp9ceSPLjDK946DnaZkj8eBM0MXFc3YPMVSwb
	8KW3uOeiArY0pxOMMKlO/xJ0+d5qzERp9kRSsS00i2Iui8Mz1mV12oJpAKr3m7VPg8plXbCEpbH
	2NLibCthVUF4xOqKSb4NaOfBVCZbgNuLxN2fJFXZpgwxvmgq43N6TRa/FxVcIXwlct5zqmEEsI6
	f7F0uL4FR5hIaxcvG/IEMKWyW4D+mDOjuseQ2/LTPLQGpM4JTAgisROlvuVohT3rcBB0K8/n9wJ
	PcBQ6Jxf6YBSbsuw==
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3781890585a.36.1795677648080;
        Wed, 25 Nov 2026 23:20:48 -0800 (PST)
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3781888585a.36.1795677647635;
        Wed, 25 Nov 2026 23:20:47 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1072165065e9.4.2026.11.25.23.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:20:46 -0800 (PST)
Message-ID: <c23eaaea-9e18-467a-a6ae-d0f7fe6a0b76@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:20:45 +0200
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
Subject: Re: [PATCH v2 0/12] media: qcom: camss: add V4L2 subdev streams API
 support
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
        Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ravi@ebytelogic.com
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261126060317.3696384-1-hitesh@ebytelogic.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261126060317.3696384-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfX9E2n8pBx3Qd6
 4v3ne6cfo7nJmqFsYsd1cH5s4ehkUygbAqNH8Ecd5R6cSTx2c7hs68WpYhPvUqb5CDnjFSllIen
 3hv4Op8/UG7grII0ReAEp5Jc77h70AcWTLX8m4AyMVatVE9vgO7BYGZ9js/EYQWoWpMSIVJAXIV
 FKTTgVOXb80pDRVbpHeKmh8o3zAb1mzfwLECJocKuWMvwVxQ9pUyUaGxC3D/2hA/S7Cz0yWJ9/R
 K8YuW9PD7QAnXA7kVAYJMP4iK6GAyHufKKLiHIg877+XOitwwpGv0VRKqrJWkVz3xYLnj8k3jCW
 5TEvXwOF+UrcTGA7r9H7NgHvj28qX+rDI83z3X89S2k430Kct+GjZOp9ucSNqnXb9WPNmdMsTHe
 099mlOvUDjX+/Ach6Yapj1yu63W18jUQ0hxs1hCOxpXDUQjFMLXsV+/xFQD2oEnTnuW8irfZtlx
 UzT2e/s+8yVN152zpDQ==
X-Proofpoint-GUID: LcappHU0IxptM7EPdrAR6TA6mfx9wp89
X-Proofpoint-ORIG-GUID: LcappHU0IxptM7EPdrAR6TA6mfx9wp89
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfX+A8SXWKSwZse
 deTugu3gDaiiKHAgeVT60HTSgnRNaTtd+dE6D1ZSMtzktXhOGSoH5OSrMuq2s8b5Ff36V+Q2uiH
 +rT6ABK0IKAmotROvXPzyU5O6Hkdm/0=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b07ddd1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ZovgdgjKAAAA:8 a=3CJxYAzqzxzRwvciriIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260027

Hi Hitesh,

On 11/26/2026 8:03 AM, Hitesh Patel wrote:
> Hi Gjorgji,
> 
> Thanks for folding in the SC7280 patch.
> 
> Ran this on SC7280 with two GMSL2 cameras, so real sensors rather than the
> TPG. All twelve applied with plain git apply, built without errors.
> 
> Tested-by: Hitesh Patel <hitesh@ebytelogic.com>
> 
> RB3 Gen 2 core kit, QCS6490, MAX9296A with two MAX9295A serializers.
> qcom-next at v7.4-rc3 (7.4.0-rc3-01389-g1843874b4356), your frame sync
> dependency plus patches 1 and 2 of Bryan's routing series underneath. Two
> local camss fixes on top that aren't upstream yet - link frequency from
> the CSI-2 transmitter, and the source to CSIPHY link made per endpoint -
> I'll post those on their own.
> 
> One camera per deserializer output:
> 
>   imx900 -> max9296a sink 0, route 0/0->2/0, src pad 2
>          -> csiphy4 -> csid1 -> vfe1_rdi0
>   ar0234 -> max9296a sink 1, route 1/0->3/0, src pad 3
>          -> csiphy3 -> csid0 -> vfe0_rdi0
> 
>   imx900 SRGGB10 2048x1536, 10 frames -> 39321600 bytes
>   ar0234 SGRBG10 1280x960,  10 frames -> 15360000 bytes
> 
> Also narrowed the CSID routing from the default 0/0 to all four source
> pads down to 0/0->2/0 alone; capture moved to RDI1 and streamed fine.
> dmesg clean.
> 
> One stream per output, so nothing here covers two VCs sharing an output.
> 1/12 is gen3 and SC7280 is gen2. No SM8250 or SA8775P board for 10/12 and
> 11/12.
> 
> Saw you'll resend. Send it and I'll re-run the same captures.

Thanks for testing this, RESEND are same patch set just my sender
name/email is fixed.  I dont think you need to run the test again.

~Gjorgji

> 
> Hitesh

