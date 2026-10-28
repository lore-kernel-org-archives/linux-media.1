Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201382;
	b=kjXjZP10LHvwhzFGURIoRpR4Z7LPhtnTl0cfVSHgiXdLbd6iGH4fHYP9fxOnRcHY6tH2
	 UCkPBJ9mRAjNfIKw05AMfEIZMyEDm9seM6HqIsdmrsDZUGKhP5iGe8wsV6o85OJb7PVa9
	 lmNTwRiXObZPSdvqiDsY5MpqArOC2MFqo7/CXZHP7CZrX7iKRCcgzOR5ihrshoFN3F6PY
	 MDLYpUD5Y+phUZqnl6rS79kUTpiR8we1sPsDxm0Gw13RmU7eaTlEkqUI+TrsGA+6D/jX+
	 Zq39YLFYMLgUnwwXLDp8cc5mjmSd42hyatHAIuWwBYHMcEBdnb9Dn8irLxvdrpEb+kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201382;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iQrl8WknYAEfdiOkOet54umzUF0swLaPr/vomAPeW8U=;
	b=eMcFFYbiIP7S1TAS3pJA21tHLIxFW3pN35IKay1l1U/EA2/3iohtJN7DyWH3Sd/6AcOE
	 fQI9z7lJOvsxkyL9ZWBNyeH9Gm/BoGwoOABQevzvjEb42G3U8SsU46FxD7jKGVLL8X1YP
	 HAEzHE1LruABo9jq+PhfLQ/5zPoiYBKkUyJNmbmDYrZcPjY2Jdd/JSFalqN+zn/Hct6M5
	 FzCiuB/jMPXcjZTo5xPzrr7y1e/nryh2Va7oGmhXW4IgvH2LoYt3/aj5xXT8SdE2K2vOo
	 HUKbmkVMN7nxZ6gQg9U3JsYBUSzwaDC9DULtsY2jrKtOgI4Rh2B2YVc4+yv2D2wGgNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gDLvL3Vz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzOzSm4z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39D4606A31C
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B39D4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gDLvL3Vz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzOzSm4z
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAENU2001647
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iQrl8WknYAEfdiOkOet54umz
	UF0swLaPr/vomAPeW8U=; b=gDLvL3VzhU5Bp5i7n7BerrWt7HmdtMRSMLDxihoA
	TT6qp7GW1PWTHZef3cBSY0Z4eqcJ+t2gSfqS9mXCG2ckezUJnBDiq9jyXD2bfyIz
	8PRSq8dFkSNcktui6PoAs6YH+55J6BFZzSEYKNqRe5JvEnKzQxHpLzYfyNIhyhXE
	TYNNnVvbn22KxAnjZ9l/EdNuzyMj8tix5hVi5aM9TKZd1dMp2BQS7+8129xAN/Ah
	G/6o17oOEq+PQQLyz45NxcgdyMXr09p2NGMVeW4rcSYeo5LX4zjogvcn+huo6B3d
	5/UH2Wj+ARLhCQmA13p+AoiUWJ+hy9aahD1PiG37Q9PYsQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7sngx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:29:40 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990ca9607c3so594858241.1
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201380; x=1793806180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQrl8WknYAEfdiOkOet54umzUF0swLaPr/vomAPeW8U=;
        b=PzOzSm4zirVaMUoRZn9LPhXWBzaxk8JIbbRTGFFDfnLyohbulCN/vFt7sTUQJFie4k
         NtedxWAwaJL7S+NRdC+aDf9ZUiio4uzN9LVMZjcTiZiGImlsvi39EROvIWFKcROuQ6zE
         1HKaXyaaOWpfRiWZmf3j116YgAzwC108KjQ519srF4pYDfl/ah+1T5V7uHPd4/WhDTET
         Kz3GOWIw5LVeFJgtRQKp+Ljy6WRE9GbtHgp/Z4ZZ8IoOmyaRk8jqVi7mSlp+EjwoSFBH
         nSQa3ib0staDSBmy3uE1xLVyK9LtLnhFeFKa+FU7QOrUrHGXThUmU2s0gUxYUsBI31ub
         H++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201380; x=1793806180;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQrl8WknYAEfdiOkOet54umzUF0swLaPr/vomAPeW8U=;
        b=KYX7YmlfmOIGr6YV41vGI4aGxiO9UkgFZxzeWtc7Ogv1ypkPNqtLVf4ZMvDeITaz8m
         Jltr163GbNvaCB9qnnwjp72ZYSUJ8a+Mop1uK23ij67+bPUTo6hWL6s6wXmbTdWEnzkP
         0M6asQjMNi+XTPbosVCJscyOmJjFh1YcxrEHP5KGsy9lxnJg3EmUaLtzez0LBugKOLTf
         su04LUBH7DHjqlG6ehaekqf8BWC46Br8hpMbj2zm0f4/3fcvrXv2+xEh9j56mLs3AcAs
         2F1pVjLAoNYp7uBK6y/cYsHhOWzFRJMlTr0ctOfop27h7HwMmz8KUMXy2GrIXem2Nkui
         XxBA==
X-Forwarded-Encrypted: i=1; AKwUvBzqgjdBPHflRBOHcEifyvdTBYCfX+aCiI6kSm8Qi4lfAfKVcMQFzNzgGgcNyBKOyA2XJe3lfPgF9pNU+Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJYYaEqmZGY1wp+Rg7e5cutoMJV+y91CWUe3/tuqbQpxxdYCVhR
	B7tjT37SrMS69imLcmsZdyv4D4tgVCjXtg6Q3UVo9S+yJXECFWLpiMq4h9DP6Eh2DED3hVlht8f
	NrfUHOjwTlfa1MtneoeksUGWhg5ewgGnS5429wcVh56Dgh/ayUagWaInhW0/eV+mhHQ==
X-Gm-Gg: AYBFou2GVMDzSxcPuHk/66aZlcfwTFSpjhdJfxgwl8GA5OCSGJ95RPF++HC1Wj02Nwa
	bKcPaz+c1haY98zOmeZ53aM/rnHmBo0r9zD5mXpuUAoqix/yHjm1t7wAKlzW/gSplJCqSdJH3RZ
	X5ydzgaGFqRYM3t4dMjDXaAB1vK8+9JxohdSLRaXrH/08NWaMozWLYvI6W5zZFtvGDVJMLrivTP
	A8sGyvLGu4pc42OTgnzNOC9BVtcCksWuy1q9j1YWnprg4EndRkxAleYPbFX7wZqKbNF/g86eQ5w
	FB3ftUNq5nbi5/jKrfYNEycEyN8E6SwIF0aWPHb/2RYIthRWkNj6NvF97D9lfOAJTgusRean7ur
	11elGSG8AU598dlqYjvPj13CLKRQ/WhKLoBvVPVDZ6R0Sz+yvmg8qPKMXAUT0LLbodw==
X-Received: by 2002:a05:6102:4b13:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d03a434b91mr1474840137.8.1793201379864;
        Wed, 28 Oct 2026 08:29:39 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d03a434b91mr1474799137.8.1793201379230;
        Wed, 28 Oct 2026 08:29:39 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92de010bcsm50884345e9.0.2026.10.28.08.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:29:38 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:29:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v23 15/15] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
Message-ID: <s42v57ohmpj55nsmfiae7ornwkh3wtxx6c6gc2c4nd4rlw32xm@xhyhyni73g63>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae214e4 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WWpD2f5wiKzpAssyet0A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pji6qfOdnDGfpNR2XknsKIaeLVlPWzGq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX4nVLUuECu8kV
 RGpU5okRDpirxvNZ8XTzqx8nSiK1StYynar6jvfg/w4YnH8MVRtGqGQnIvOaVJTNgJFwAg3ABqH
 pHSFWlwQg/NZ8DSOhaowouLuhzI1Hfw=
X-Proofpoint-ORIG-GUID: pji6qfOdnDGfpNR2XknsKIaeLVlPWzGq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX/QKby+5rqMi0
 +fOBMkYBoiQ8+6OF93snRFQdAazAFs+/5kiGFZE6O84uec/DqJGm/qX0c6G8AClQKnILc2ioK48
 /Wr9Y65sAE9O64btSoROJm08K7Ja7mmUn0o27PgghQClqwvltWFMPkmSxIOeHiTv/TZdldc5plm
 byBPcyIcjJzVy9cMQZ1ysBVPeJQxkWeHNuVYTC8BGjj2o8h9SiDggDh9Hmt3qOuqi3Z631VpHTl
 NgRCy+RrHI9eneyG51+sgp40VuTOI657TCf8hw8KLXOy7bmrx+0pGC7XSHGl5kmmP5FYjimGQ7x
 ANY1O6WkWAR5sk4zENf1FEg1jvbL0Sk1ZRMtjikp6ClXteQ6lkGp5djMcNOvGZ2Ec/WF1uyVfDc
 3RjcXblKXsGQan7HB1eGjU7+QGnK1QuxBYa8YlOMqlMv8C4dgu8C8QuKZd9Rs8gZvHWixM/tlot
 Gp88xQjiaDwMllhUWEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 08:20:49, Hangxiang Ma wrote:
> Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.
> 
> The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
> DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
> lane mode on a rework camera module.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
