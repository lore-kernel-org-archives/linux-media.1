Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD2F3346B4
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 05:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785475651; cv=none; b=okkjyv9RQV+H0qCX2qVI/38EhIPVhS6EUwHMtQcSMgzXI/sIuOUATS5H6nb1h2SNn64l1P8d8bskiw9hjDuiOQiWRJyZlHWeCmwc3GiZVdiQzeofkZxF7AiEdSKXw+/XujQZQQNTpzChmSDrFdNsdCHzQmbQK221PB8E9N35K7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785475651; c=relaxed/simple;
	bh=wMJ3xQGJXV7bZq82amQNntL3Rd4I7Rp3ZWh+Mll8cuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dtilffmFXnlDB6455wDybJ71mU4bCcFxM8gcI0WRCxfdWmw2FwJFnl8NTk7ix2Wl5cQGyVsTfOMGlmmLV0ZpCKX+xty+NMEC74coZY8i03xXvyzyG3W/4YwN8kuhcIWqLLG0qrLSFcLuMvSJZjkmblop/ss2WBlpI8CnmXYqWS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=moVu9eI3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQuM+BQ3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="moVu9eI3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQuM+BQ3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5FBQH2844817
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 05:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lqVX/RPwnow+8A1vtIvSpCnxQwfN3TRAdDLdw44pbw=; b=moVu9eI3VlVszSVD
	k4eykvEMHkNnGj77hMBLokwFrErP4X6MsVRq9TzlMCEmsIpp3yirgiiz3pmNoKg/
	ondc1ADCtFj7df5uJKtZN08GfU4Yx1/ZPHQJZKmb1nh0f7FINCXZ51knMJN0RAnt
	j8Qee+Y3erIebr+PzLpIheIfDfIhrHbHMXuSIcqvEKNYy30PnCphau6jnLVSBVrl
	qt+I53ZbR11S5AF22ScHHyY8BDmirjYBBIJXx5HtQRp9shXW+B95jZNo/XngE2OQ
	NKzCSY8W83xJDMlhRlqo0X6kGCAv5dEC4qk3ltB82Das5AwcSOPZWknIxjFwR5Cz
	wVTOMg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frnd6g16u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 05:27:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so763450a12.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 22:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785475649; x=1786080449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+lqVX/RPwnow+8A1vtIvSpCnxQwfN3TRAdDLdw44pbw=;
        b=OQuM+BQ3o11gFc/XCAsBl5dpeI7gWUN6NFZ1p7LVERzqyg0URfY//7EakRIcXollWp
         Fy6ge2DkDyXOuAKnmJaojMmAJkn2u909fM27y5o5+mX24MGwfwLLielR3lPHbvQw5YuK
         +8UoV+wtIwEchPb4Fk8zrSadM3DAUt8piG05NMGlWSbm1fkcogsHadEuiXfXZSHvezIj
         /yIovR0cGWZmO8zx8i5gJsWSTPAnmt4QxsyRNJP/eqk2IquenzhK/PcEZxuJCqAsEWSR
         e3QSfd49XlS12OAWcXdDOtYPjv3P7/1uVWWOKr+UiKQ/sHE7jSYAi9+osHk4wtV0Isi3
         SSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785475649; x=1786080449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+lqVX/RPwnow+8A1vtIvSpCnxQwfN3TRAdDLdw44pbw=;
        b=CyShvepm71z3DS8Opm/95IKifozh8EHUxVLoyvXkdszOF7+XH3Ig6r0VTN/Y54+f/G
         BBpoSmpbBDcgqZRxvW+MgMtYUPh2eoXwvHg2nZBoynuVqP8kAC/QupR8P+nrP/9pZI4u
         qIrTvn7It7ddc4EBP/krZn+3GBqmJQXIrOc97+MO2Nhc5zbsuVcSK3FsP93N5s9rcjip
         u3ZHlX64tv+wh29DKDcL7mT3H58Oh2B+Vds3VTV3k4kkID0Nq1ah4vU1WlJAMjPLz802
         CH76M6/8Vu8yGucOY1Rbri6XhjhISmny/4XHAl8FFqRUH6LJ2Fk7EKrYfjEk9nS5wlj6
         I67Q==
X-Gm-Message-State: AOJu0YwZ2m4rZywE1pO4LXINNPFyYme1WwieUek/vRzWigi/gSh91Boe
	FN7uOnrFNOjYXo0/B26hL+UWF6uaLu6QLHwX09CNxh4rg232LFEhHnB2U8Y7HDWIqJt0e+nxWcm
	eiRQgyLhzI8+2xtf9+9x9lM4HIFxoTi9C329zOmp17Jz45yscdAG61uxappo6Vu/BqQ==
X-Gm-Gg: AR+sD11sbUtjMxQiquXTeKsdAOxvUe5fVPzzZ3ZnLIp8bZozKy/bSNelJaLByHMy+YW
	xNdwaCsRLMtkTsU+wELI4KufJxSeyEWMVW9psVrtslNTBwcjTh26DU/INeqWi2o6YDtMRPWMTPb
	6XErNQ/sFTWQkqMj1bl7zu8+5cSAkXqa1n925kEMVKGpZkoPYlBa1EiIHxgahWz0gyaVc5leQJ8
	pMaFGCdZukfmuTz28levWqimGgo/vq3DUF43uS89ECDcTp21oqqR8vpgh42n2vHnNBSfmHowShj
	zEyS1Mgu3QHWF4qJC6HMEfFqPuzdi0uZLkCr2inIpTl722vC5Z1Veu8pclrtmwtS0mdt0E8C3I4
	0auMnRiUuPeZew+k0/30A7lQTUkOq78/nyA==
X-Received: by 2002:a05:6a21:180a:b0:3c3:c07b:5322 with SMTP id adf61e73a8af0-3c91b1f7b7emr521463637.34.1785475648639;
        Thu, 30 Jul 2026 22:27:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:180a:b0:3c3:c07b:5322 with SMTP id adf61e73a8af0-3c91b1f7b7emr521436637.34.1785475648179;
        Thu, 30 Jul 2026 22:27:28 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.255.44])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5c7sm1424781eec.5.2026.07.30.22.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 22:27:27 -0700 (PDT)
Message-ID: <5d8c7e51-1969-4b48-affc-94007d0f3295@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:57:20 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/19] media: iris: Add AR50LT core support and enable
 Agatti platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I8tVgtgg c=1 sm=1 tr=0 ts=6a6c3241 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=azT4Vr2vIDLY4WjjlbZISw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=9Z6RCAdTk4ZiZ6hpEs8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: -JaTDhARt2S0Y6-fG3VsX1FElu6sWXWD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzNCBTYWx0ZWRfX+KXDrukKp2bq
 NQsZf2lX2tQ0z8PYtUk1zLidcFhiEdvNoPuPAw8C3mEiGEcaed3AA7a19bd4WS8ozdKbTIIJr/+
 VgnTcCMmyrfhe914rBPfPI//ySAaAis=
X-Proofpoint-GUID: -JaTDhARt2S0Y6-fG3VsX1FElu6sWXWD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzNCBTYWx0ZWRfX3U390yRmn0rT
 sh/raPmIJpAbKzMu1hnTPc8U7V0gBolDlmF8tJEZgV/B+Nt22cBl6ljHnr2rI0UusLKMZKTC/xG
 iS2vNuUsj2x/pyn0MMTX9CYfqAxc8uSF9f0kSv9Z/rCLeIkheUqvkMXj/VEFTqa4NrfurQ1K2Jr
 Wm0obh0pUBlQ2+k1r0KelRS76loCEZ8e3vT87NMN9G3B9xJeR03Bl/kAZHQsTyAuFSVeraKxrvI
 ut7ZMwdtTAYa9/7XYMmFPoQD0zpjboIzD6PAh4bnQpKzNzpK6ASzlJlbcCBrIgujQ3sr7o5bUOF
 F+GRzLMsl29cTZ+bhhjQaiAQe/SPLsB0G1bCsSOTtJ1e/HRQ6RKkiOnhZc2FnioXeAvwSubHIZu
 BHAQSqiZ7Kyj2bNvFAwv6YOXG+b7OFvZQWUgcvNgTXYRypftb5qWMjqHbCDmH3iN9ep65Lz54Ir
 ArbHLJGiuPiygFLH/2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310034


On 7/31/2026 5:18 AM, Dmitry Baryshkov wrote:
> This series adds support for the AR50Lt VPU core to the iris driver and
> enables the Agatti SoC to use Gen2 firmware and HFI.
> 
> AR50Lt introduces a few platform-specific requirements that need to be
> handled in the iris core and VPU abstraction layer. To accommodate
> this, the series adds minimal hooks and updates needed to allow the
> firmware to operate correctly on AR50Lt without impacting existing
> supported platforms.
> 
> Additionally, the series wires up Agatti to use the Gen2 firmware and
> HFI path, aligning it with newer generations of supported Qualcomm
> video hardware.
>

<snip>
> ---
> Changes in v9:
> - Rebased on Bryan's tree, reverted the previous version of firmware
>    detection patch

I see that the dependent patch for dynamic sync frame is part of the 
tree as well, so would have been better to pick the 3rd patch as well in 
this series. 3rd part is now left out and #1/#2 are part of this series.

https://lore.kernel.org/all/5vmfrdc7skmo2e3holugnhryjkhwwhndbsrklpjp5dsxfujyvs@a64y4x6lb5mp/

Regards,
Vikash
