Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023764;
	b=y/4kKJT+XBQw6vH8Uu8A0/1BCqNXIJ5UH0JUYFRLJhJhGeAiBZUyWoTBT1/lZtp0qHhi
	 Tv9O3tIZhtThVU5eRGcjcEaevR6JfahpEdlMhwt7Jkc45A7peEHOViHSivpgAEFgL3sgx
	 y3VkwkV0s9GbzC+aIJpmeaf2KnPKyjkIifVqCc0N+lByHrYVBjlthvdzr/G614dorsxJ+
	 fvlc5M+pqcsgijP0fUeCulySz/9Jc0ZIkaN1wG/B92ikzDHiqsbHz2Ud0qxgKoQCMXMu+
	 zY5dtmZa6FRIoeCCxNXEdeAOrBT6xtyugRAQkhoRhlp9vhg0ihjq5MGfCF05tpU2N9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023764;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kjExBJFPJ8m4Vc88gOC9yuQ0s1tBLMjZRS5SoMRwaFI=;
	b=gNmyI4QDZ+u8FVxIXrtkjanPdQ3CquOBSFQPSVJWnuUgdO0tBg/v3sp+VcYAMfW4YgFD
	 op9u4ksoowxEU+CnEO2h0KxoQXQOSM75beOIn2GSqRVCBgfmYaoF1pIve+QQXlT0mcoL9
	 tKnm0AFngph27v6uKU1CuS5hej7PT+9DWE92n57SyB/jSh8OKz6V1ib6RJAI1PEXXJkYf
	 SRAfjNHPul46J37uEdxrnCezFvDzekhX+uQUFBH03fe5idI+1CfW/yWPLquNlLWfFwGwF
	 jPzst9yGuN2q/kQ+3bjdx73CY/sMMPWhKxxClTnyoTX4F0GHafWOk/snZYwf9eUTzhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aUcMW0tU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Owk7BbBn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B82C606A31D
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 14:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B82C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aUcMW0tU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Owk7BbBn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt1ND3562295
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 14:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjExBJFPJ8m4Vc88gOC9yuQ0s1tBLMjZRS5SoMRwaFI=; b=aUcMW0tUHWN8HD1W
	dpe1Bn6fpeQNb3U7MLe1+zdH/rGccWVqU+ga8nwyjOnD4at0YsDtHtIOmGUdA29o
	BUgmkfZ5bIn+xsqujuniL9U4ku9o2N+Z8u6HfFabm6Pa3f2AM05l+Q6fwvzFuAWf
	ZeQTNutR++4ilP/3IBmIN56q/LKITodwHih4/EIpBjgsX9fo1XP/iwN/DCNndISE
	M/JSu93FuyH7PQABjBC4beCuBMwVpvgSLFj3RZhFT1a8GHir6PNaqlKCjIkfdkO2
	gYRanFWHxQyqe83KBybbi7vLKFruTs3vVulAfWfYi3rrPgiBTPbh8SiCAwPC5n5P
	jqyCDA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s90xe8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 14:09:22 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eabddbb650so55942e0c.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 07:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793023762; x=1793628562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjExBJFPJ8m4Vc88gOC9yuQ0s1tBLMjZRS5SoMRwaFI=;
        b=Owk7BbBnazj/kmdfpqpodZNHpb+hi5whsWKvGo384vGRXqp0Po4sVkSwDdGN8wUe2r
         rMicgKiGMI4lHMM3fwEfg6+qMYyM+OnEd0QTnGEu77EtPIpQ3MMx/n0OmwcjT0ZlY2q4
         7pemx4QjXR01qIWB15jyoZyKHTbGsETyXymF9qhpxrN9Z61x/D9g5GcTO/fMKRFgDlZ7
         U9UdVZMMe4p5ugAXSJnaI25MGrV/C32ZMUa6xO1POug/uerYjM3CT1Dm0BXLDrOQ/ICh
         31D4pPM62EHLhro36vJ0Mr3Ao8LQaP1E5n5Og19VPH79y8K3bE4JAgOq19bKeLQJ5xjT
         FqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023762; x=1793628562;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjExBJFPJ8m4Vc88gOC9yuQ0s1tBLMjZRS5SoMRwaFI=;
        b=oNqlH0w0UDpXgZGrObK1TWfuJnD4pA4Eoj7YRtqDpV4NE1p+2Ln5OKH17JK2f55tb4
         QOsU5c3wd2Ui+rJgPTxrAONvuDyOBHgAcLxpQPAbAIYh5OxWwk3Pv0w5ZZjbje6m33PE
         NTvK6OfJu7bX92pdqfBk9OYCQtDnU32ao9xxMOhKgp2TB5kzd6wRL2/63Uy3x3AVTcA7
         1U1e6ThvRbbfwez8oV0vFHSJ5fwl6Bv30mowcG2EmCCOAoeQsMu5a6QHHMYcaKvYCvrk
         3OezJDK5poyNu0y7/c8ZKz/d7ckDUdIXV6dTUj7CfCK8aklYqvPY2Qp2mQL1bxOGK0/Q
         8FOw==
X-Forwarded-Encrypted: i=1; AKwUvBxqc8JYLwtZ0Ya1GA18NFDj/qAYFTa2MBKtUMXinAipTORS1doi87Yy3P1U8Xpk2p4/KqkJJ1xRetWrxQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK1O6DFDYJax2TGv8FtppNdaEYB7rzaGBEh52LSsPamle061mVY
	5uFtO5UzBVvgR2S9ueCsD6OkHWXM7diMazAa54I6tBwUduMUsqYzZfL9QXV0LiNe6HjMMRmF9eA
	sOQgLz4LP0HQzQH1Gk0WvIodj26/JXT8qHwj432demyozSUyYRNMBrCCe9s0PbYNeLA==
X-Gm-Gg: AYBFou1gSviybGcyMn8X8BnlljJwFQLXPE6F2vvBQTiLXEFotUjPWGjFlqXzht2Eb5y
	hbHmcXtn6bvDQcgCKYrO3H5QoPPCoGCU2XvxifIIBvF+GfFT8bcpXEJqnD8PnkSUtTRXUSPy+IS
	ZulzoW8uiGNStPeadYviujjQj5PvchwCkMNDITkNYJ8T1pRTLBtXFyX0mcVaVLz/hJrcP4DHpf+
	tvZIpZ4Ad8eVpuFdcJNCNG4iUxVq4vCoUzRdz+B2Oa68Cnfm2IRTCGUvzKsabfcsi2wOh/zNJZ/
	Y+2hrz+PTKAVvSAAS+aIiWnW7tqujLvA/QcnGvOM+B8w+VzCHpaWfqaJEGyzA78A8os9Iy72Go8
	cO1XRCfVOU1DhxQjkHbjESA==
X-Received: by 2002:ac5:c8af:0:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec232688d9mr2052713e0c.3.1793023762379;
        Mon, 26 Oct 2026 07:09:22 -0700 (PDT)
X-Received: by 2002:ac5:c8af:0:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec232688d9mr2052661e0c.3.1793023761845;
        Mon, 26 Oct 2026 07:09:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7b5d54sm321487466b.86.2026.10.26.07.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:09:20 -0700 (PDT)
Message-ID: <14fabb77-ab9e-454e-86fb-e5f8d0d686e6@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:09:17 +0100
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
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8450: Add description of pins
 with MCLK function
To: Vladimir Zapolskiy <vz@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20261023163057.775917-1-vz@kernel.org>
 <20261023163057.775917-6-vz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023163057.775917-6-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX89x2iePruMPb
 qcA3Iq9aYEEkf05DYSgPpeLixewlCNhFXAKeN4sH75fbuLACu4UNolZiTYK3sLIV0RASaA2ALsE
 KTvutBkG58VonhfBetXyH0vzNzK69O1ln6YXrqj01kn0VyEgfT77dltX8GvA0Yr1tuTiQvuhK2d
 hkA2nb7bztDBDb2Qrbi+jKvY7rtack2rJNhhHvjtRFjYpiGO5voVGoAgwNCXvETTewA8m6UMOhy
 b1ADRfFJTE/B4MlJvMi1Tv0LWX0Rb3bdf4fAGuHEkYxIg73E+/rjIWTOL2FZf1/Vn0bT3k/U/Qp
 kytePRnN2g/QDkjOEJA47f+Lgnz9RlVeXtGsYedI+ipcCHErffpakcmzB1fzz+qTgl7f9GLv9bN
 lkgMri245W2kmKiHMD1l/eAAY9Ot51AJSVtHrytlunMHBZO2EZIxSmQ85rj31J60B6ACpNOoXJG
 /RiSNEJ09uTJT936DLA==
X-Proofpoint-ORIG-GUID: eRAp_g6knEKmprZTHegmPvQKXyR-jbqO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfXwS9Z3oqxTNr7
 +3YzJCkZAlPXzNHblZOy2MNe39BTiCTGkmBCXvhs/TOkASbdeLiZNTCcKJZDBM04sX9EdV6xa5F
 JS65QJ8b6B0UJCRAog05Q7vka67LpKU=
X-Proofpoint-GUID: eRAp_g6knEKmprZTHegmPvQKXyR-jbqO
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf5f13 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=euT04gI7HyjAtzR6ms8A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260056

On 10/23/26 6:30 PM, Vladimir Zapolskiy wrote:
> Qualcomm Waipio SoC provides up to 8 MCLK signals on GPIOs 100 to 107,
> add the correspondent default and sleep pin configurations.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
