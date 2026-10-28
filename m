Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201332;
	b=LHZNXq6wRuHszSTmlIgXS0sAYO+nqUe5RM4CxVPIwb8uQJzt2qhm4rLOvpzOu1OOYHyk
	 0WzVL6NnaJdXu34JlPW5hyiu11NwObbxsk+OgE46P6VoHo7bZbuU/FA5ZRk+9GgwplB7I
	 RThS5QgQMsHDL5gvk2bFN1h5CKCYbhJDXJFpjIxLKt0zdR/RejSoNEqksCiwlwQoCmqGC
	 OaYeA3WwE1Ay5Skc+nVtVx6SXF3n8hInExYM3HaMS1Wqxd/MQ9w+iThybUZwOYMXrIh1W
	 Enoc1pwGZ5gGHoN8PwZYRJm+l+Mn7SJB6BJdnIYhhwRhOVB0c06HAZGIxz6ZpBhJklg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vt+LWj4JTxLvmvfKCHSS+whi9VdAbkeinOtI411OZBc=;
	b=Vc2MhTqFWHBvH39Z/VgaeZN5lSE3gwpZPPhcsjvG3HKOsNZYKnXrTit1Xbc8HSdJ9rEN
	 SMpHvva4RX5FfdOsyuth+m3813UtPWKguAWX6Q/qvkAoQsKJvnopjI7sDz0kJm/xuhuiB
	 fRKYY6FOT56FjDYZ+ppYHTd8xAksWtbkAXne3Q3wnzx3aFi1VgKRoNqL6kLHWIvlK+G/H
	 Tg7XWEN+qjjH+CXR+6HKsyPWR6ofPpYs6WC9TBjIiYHqHgvCVV6le3a6MvHjOgsIFEMjm
	 DAvJfpNPY6E+tKG5t9Lb8t0WkYKJ2rMOd7itdD86J4wHdtGYAtC7CxhxXHuFZXNiy9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lS1rxH4g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYCADI2V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2D9606A320
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC2D9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lS1rxH4g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYCADI2V
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA3rT2568794
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vt+LWj4JTxLvmvfKCHSS+whi
	9VdAbkeinOtI411OZBc=; b=lS1rxH4gd8sa+mABPrYZM2XB4BKBJaRx5545SSpY
	9qvU8eTk8yRkisoa1vBwzUjS0DKYUC7ZbPmdW+U8oK/Jtwb20aV7bSGtI9NafViI
	hNoq4YalpC4qqgl8Va6coTYBmm0Z6hEPAG0ONkQOAuNzqsT/rcolJqvLb7ywJ0qV
	hYiReKE+glOqBl4W7Es6wpIKly6Y4Mh72klLHAKizGWjvBFrYTDBQyTln8Tbqst3
	7VVSVkKxy7afwQHsfICjmeMe38Lx2zI+js8MJhWWWCtuh/9oviygJRE0UyRXFBhk
	6lukfQp5woYMvlfh/6YmO6REeQensQ64ifs9mVYzoLJvFA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pv9q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:28:51 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0bad5ec1cso281606137.1
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201330; x=1793806130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vt+LWj4JTxLvmvfKCHSS+whi9VdAbkeinOtI411OZBc=;
        b=MYCADI2VqnH6blFMNO8Ahn2dr3fg59JUDBOe464BsrzKo+xwCsFR2y9OyBrq+Z+uAx
         dGL+UqvvSymPUJm6DulHh4mrycNLlUwPb0eNgnerQs21duxhQJwLBE2rZkQ/rTWbhTxh
         yEEHdbtzyuuMv/jzKCGXIY5ciHFJ2c3ovdzBzIwnqwwFwtZ6Wcc7Tbcnjcf7Ys2Dv/0K
         osYX6G8sft3auJuPXsbrtWpBJFCiv+XO9qfgoWoFYRulIRTBKa6oak76r1QfUhfKSZwg
         v5wzPkVgfY4T1Q6O4V5MI1LniM2Tz6wHlH4V1GjzYjsSxLw3Y0TR6cTvDMyjF6yw7sC0
         2A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201330; x=1793806130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vt+LWj4JTxLvmvfKCHSS+whi9VdAbkeinOtI411OZBc=;
        b=y6UhM/ZrSITdvo7wA2Wmx2bEF6Z3IG0PR5fVSnxQtmfXEch9KE6uHLY0dnZM7sRI9/
         iBepOTYhSFfZZIwq/pdhhPaoUvFNNJRLIsELI5Y1NwZ/o99AXMeU7APwjm7qTR1D0WKM
         +RdwPc5eWzf5eJSSm4BpXc3DP7Y44/RacwYD/5jzwUGHZA6QuHMT0+VUVgSFj/aQMqSf
         39i94xoROSUjqkJGvG9M3+P6/9DctraXnV98bjWCts0/7AiIfNug7qUonDqePDDOZHk1
         CEVldTDtA7TywDWSmFr1JywzQRAvr6Y4opP70NuMDWWRE0Cl/n8vnspJAgZF87RZI5jr
         FpkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEMhR2QbdSJJ6C+OVuJe7K36rUer3UOOWVoItlsTSVfGw4Uzb1hH0KauqMSakj6Tr07TANKLRj868FIA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKCwc8ccpREqDf3/PCEygkPI2AnIEqgcKtyb0nl3nB8CDqhxNPu
	B51jDRWhjRh0FkvlpIOgjmNQGezItglec+/4n+24K3mmMBGs49A1ddhq3JMAm9PIAO6DiPMT/nl
	8pN+o90BJxnI5pxp4c9Pg7NqCWdgFz45eedOiUhc8b96HNpuC6o9wP6qqbHEZGSAVHw==
X-Gm-Gg: AYBFou1N36dyIQmWT8F3nTHj3kb+SXPc7fMtEi5i9lHhFc137IIimMEOENPAWe0PupL
	K3LDHupma+AJnSEsac945H809fODR7dNbuuEXQEn1VG+s1c0lDcziuSjG4TOy3gd21k6ZNfROxp
	eHKHWjq/HYf4jL37uNg++VlCmayGiZnc2uwabNGMiQD6ZcUcD48ao7lfuS8zc/F260LlN5MM+hF
	tEpSXhUBVU78SxF/t/yuPihRVJzLD4XsuqZZ7g0oqcdF3gbcThnYRgj/O3A9o/lRSW84yT7tHbR
	+jn4EZkg3gbVw7nD4oicVIzkDcEMz7mPdD9761rSchgxAM/NgDwN25By0nh1ejoJqXMw/F99M71
	njA1A83ggG8wivlauRXEqcGPZPHRnYlxtwC7nQthdHB1yDoqH8XY3aMf+dsDO39cQRg==
X-Received: by 2002:a05:6102:3ed4:b0:7cc:285d:4df8 with SMTP id ada2fe7eead31-7d03a574a3cmr1443085137.12.1793201330018;
        Wed, 28 Oct 2026 08:28:50 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed4:b0:7cc:285d:4df8 with SMTP id ada2fe7eead31-7d03a574a3cmr1443045137.12.1793201329366;
        Wed, 28 Oct 2026 08:28:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdf9bdsm27880107f8f.55.2026.10.28.08.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:28:48 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:28:46 +0200
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
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v23 13/15] arm64: dts: qcom: kaanapali: Add CCI
 controller nodes
Message-ID: <qnxjvwd7phkvxe2gft53i5utnddjfkjyljvisx5wfd2epqh774@4jxv7jqlubs3>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-13-95f250b18612@oss.qualcomm.com>
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
In-Reply-To: <20261028-kaanapali-camss-v23-13-95f250b18612@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tY6Zgh1C_SdkCv3XaLeElZyfsviC9EGP
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae214b3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ew9RC34E4BSkZ0FC_vUA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXxJgVeG/mMflM
 kOCyqLIUkUa2k8osD4g8ya0Cz89sBe3QJJr1paVDQJRaNgHlEfjMfEktDPpnL9RHrs8DyCyP2t+
 B1vo+vA0zJTvNO9ke+GKponKZhzp3PaRMQa3wjQaCFcymI2xKRGzYkrxwIBr8pgEa5UP5Y4zkJX
 vhAg5bwmIMSL58xkI9r3/MNb0oQcVvrMUBnyXwPV6r0z2kzCNDsI1Udjm4Dz7ooNJ1opUqMMHJx
 qbS9EjjOJ9go6g+enfqzMq6MS17whew9ev8HyZ1+9oEtuLlUDgpJFuvUPGprRBWnOkPf5W3Mv8h
 +bwcVxG9JFEmPBxnKUxOUVPS6TmlZXkYFBAE/cRWvdn0lff5c2rfqfGRZNfpu73izUR9knR6LgD
 tl/pd6UWYD5MsNmWaNHuJsT5Dz/QQVxsOYR/BBMqsW8zxbPqesXHe8TFSmycoBAJkJfbbNfJ9tZ
 DA8f801OFl2fEUZbO5Q==
X-Proofpoint-GUID: tY6Zgh1C_SdkCv3XaLeElZyfsviC9EGP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX35gFMA96pc0R
 DTEALjwJpW/HuXbSBiJK3ESKa040cvEHEoJPSFo4ELZjxUJFnWplzYsTHahdf4ANyhc4XDByGcY
 u69U8HcmxYGfKSG1CdizMg3j/qxNbCU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 08:20:47, Hangxiang Ma wrote:
> Add the three Camera Control Interface (CCI) controllers present on the
> Kaanapali SoC. Each controller provides two I2C hosts used for camera
> sensor control, so define the controller nodes and their pinctrl states.
> 
> The first bus has two CCI bus master pinouts:
> cci_i2c_sda0 = gpio109
> cci_i2c_scl0 = gpio110
> 
> cci_i2c_sda1 = gpio111
> cci_i2c_scl1 = gpio112
> 
> The second bus has two CCI bus master pinouts:
> cci_i2c_sda3 = gpio113
> cci_i2c_scl3 = gpio114
> 
> cci_i2c_sda4 = gpio107
> cci_i2c_scl4 = gpio160
> 
> The third bus has two CCI bus master pinouts:
> cci_i2c_sda5 = gpio108
> cci_i2c_scl5 = gpio149
> 
> cci_i2c_sda6 = gpio115
> cci_i2c_scl6 = gpio116
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
