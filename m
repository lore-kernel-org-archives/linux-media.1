Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1F642379E
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 10:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785235724; cv=none; b=i/beyH2FfynEDwrsnQgzLWKZ/wCixLLpwWMUWdLAl+IH2p/i28lp0Bl4ngo1AlMGCg3EEDb5d0y6fXAe2EpFUUm47m0eiMjRuOuypDZDX+U1+QKmHxfL8Tt8EHUJuLBirV7JYMypPCoYXss/h+TyPcs8N/FMTHlHny3p2EUTIl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785235724; c=relaxed/simple;
	bh=+2VXiGMIOCH2pmyuRHa2hoo5DBgV4E80jSEKqltfTVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMBWOZSRtN+vqFmn20ilt7nsNIbE1XiVKDEwslRjjLRLlSmIJQEsr+14OnS7YwzfTrURK6xuCTZfNI2XjP25ZcL/1zTsjOryVs2pRDzUj3HwxPsD4U8+xMbA0IAhjyAg5jfwiWtbq6pjYSNBW9mrvVih16etO0fPOK6SrBK3Nr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rb3RRpvN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGcYkXDA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rb3RRpvN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGcYkXDA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SAgce92043747
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 10:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mYrJRtpE/M58oknn6w6g6s4C
	5iZ5GXjvqTFr0fKnh8g=; b=Rb3RRpvNDCVmZgKAWDSILLWRAEltX43yQo8Ftzdh
	F4DPobVjgY/XhDNK9SmMEpx2id0sctqiUSNakZV8T0ptJO5SrHGhg4LJn5mJLxM0
	GvhQVSo6EOoIiHzB0cV9zf7M098wGYb2w/l6b6ZAMWT2zsgyxyYmUi+NtZOQ9T9E
	tSADJ9gP0qALRepBxvRL5unRcZcv7aVSZvtwHdp1j/E8J3GWWqONVqgUBsmyuAZN
	92ftSV6Uvl7WwSoXx5nibWv0/H/32z38G+tQjCwwA7H400BAA21UZ8Qr8w0ToNxr
	WyheF9UfznuzcRxnrsFFhEzTzJ2xIcawzreNt11gf/dH5w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpptts5m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 10:48:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5276aa86d00so45073711cf.2
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 03:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785235722; x=1785840522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mYrJRtpE/M58oknn6w6g6s4C5iZ5GXjvqTFr0fKnh8g=;
        b=GGcYkXDAjR2TFp0HV8t82BmaikYoh8w3kKbixL2HpVoyuLx9jp20hEmhj0v6AnbOa9
         /PRLGKJNUIbfWLyiqClwo/DfUiyxvl0zb6jsuB9yH5UwfOv4rlda/WThSgVlUl7XUeDs
         FUxDrO+hFrIh1BR1xZs7ACPUdC+esulpXNQYjNpbsq3FLnZa/pb02TnYCfWshzblBIoD
         xPCtn5urtO14T+K6wXbDuQgW2SvKXGNsAAuRRrESA0c9Zzbwkjhht2/SbivISFKcH8+/
         d0i2BaCMlVT/b3VwJRM53Uw/ZzKhLXiSBIxNmdf/0uCVPpFkHtkkaOM4Lcnd9fUCTFn2
         Ubxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785235722; x=1785840522;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYrJRtpE/M58oknn6w6g6s4C5iZ5GXjvqTFr0fKnh8g=;
        b=MPuSzvcbIAwLXRa189kzvlCuYMsgXW7zKuRL2Jh9RbZb2O9cFvak1xrTGnnsJn4V1M
         NBD+iLRaaYoZC9twYQpP3rn3nLwDHK8DqucOcnVVa3gH+5qkgR0fSwkvFFU6D+3WRDEV
         ppe/8Bn58FW4H5rLU8A5XxL5MAJ3P0nhLhO3GqnjHPk0QtOjHHyY/vOFkx9D0RUz13se
         0D8/diAnXvMmyxqM5LoCY/ms65SXsNlJk5UgE+F8w9/tgz580BCCPixBF2fbBf2UIZvn
         jWNZVlozakbV+as7VeA23YuSTjk+nrv2/ToRCwytpkhGpd9xpgVxRRZMT73FK+u6VLZB
         //bQ==
X-Forwarded-Encrypted: i=1; AHgh+RpRXSPA8Neu/ryJdDM1AHO7mopEcFnQkBi6WvpbFnh5RzECe4bjfspvSU8OG4yH/D/BThwr00kZEvQNAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2HnMKUakk4eVl/a8MthEgYc4RxO0eMRmictIAYsaij7hE77a8
	qunxDy3ISDGY9Os3xjYcwHh4MWYzZKhSgBdZ6kpATOcqBTi2vN/gJ7xXIvXMGfkftXwSQZkmiD0
	TGoOovcltkRhL/cgwSyeKsLDv/Ro4NNFaQ++hKzIUTDzqy6QvknDYOB41Nn0+ukgP2g==
X-Gm-Gg: AR+sD10ZEJ4EUU7dX5eR5d0gx5M1FNJFMuuMzgPibjQTwEeE/OT7X55NSlA56n0Xw/O
	15TMGcLw9PGpB1Tr7X8vlHROwvduFDkIMBuTlfrqbs/RrYZQSYKLkYUlE1YleC0VJcrxjzE1hU7
	FCCOB1iy1pdhsoKVkhutJQrX3EsrgHJbijFHWVE4t0P35Lx1kcp26ttaPQnrnGZE2l0ArfsA00S
	fCcpX+Kr8NtWtX72GYEBOdeg0KjgcuebcsQUZn2Mk4mvISefEJicNJJk3+08Ga5whVdJmY1+fHB
	0WHY/ZTqbwKQ4E07AdVeWlY46anGJleHl1JCVUn16heECXGxFKQ1OGrwqG4IQBx56Uhi1stsZ0J
	Sjomj2FGW60VhvSyAQFxC5uDeRb2B6/oHwv4CcbLq9k2XHJynjQQBdYlOTb3lQzB2U+9Ond/I0U
	ZSSVdil95XYFvxXA==
X-Received: by 2002:a05:622a:412:b0:51a:8c9b:64a1 with SMTP id d75a77b69052e-529d7169f3amr14419961cf.69.1785235721534;
        Tue, 28 Jul 2026 03:48:41 -0700 (PDT)
X-Received: by 2002:a05:622a:412:b0:51a:8c9b:64a1 with SMTP id d75a77b69052e-529d7169f3amr14419721cf.69.1785235721070;
        Tue, 28 Jul 2026 03:48:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1f9721sm1917162e87.76.2026.07.28.03.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:48:40 -0700 (PDT)
Date: Tue, 28 Jul 2026 13:48:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v13 3/5] media: qcom: camss: Add support for PHY API
 devices
Message-ID: <jy2gc6ojh3sh2araz67vdk4jo6wsmx4xamgl6hjfuqpdphxxjr@aykdzj6ewhm6>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5NCBTYWx0ZWRfX5V7MwWbPzE72
 rspEgT58Z7kgHcUpa1ytPfIUE8/st24CnPsT4Uu4END5rvwBKlCmVo4KOg7HbWyOVrH5zftmHrn
 16B1m7FsLtgGbDQetwogeBz/pwjx2lA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5NCBTYWx0ZWRfX30YLRvM6fBVL
 NGUGAL3ozXiAv6Luio2NrM2pauhkL1QG0oqqzNIVk0ux7qllOYVU9YDPVrEOl0TyzztDIJi5sVa
 gnBeaTSIQJVrPrCWRdi3SSm5oz7biCzM16Nv568eVb2EGwe5wb1LN0suZtKKKXY2pqQmOAN2TBe
 KcewfNJYnW1tvIu9g60bViXrbX8TMWYSFcc2E0PD2XclYX8uVPnxFI+cP2TGImHPS/TA0B3OMp5
 Zz2n/lRHA7LRw/SAB/DHrj4Rq7UAugu2lelS5hpZ0u/QE8JKVlUyhM8JOAByVR8OjIvU6Bn66F9
 kUGRP3+Nl4wWwGrU0hbGA6LAPgmJWCtw6SOvxp5oQVBtaSukM9K2kcB2HybrlpzPUIYk1Vub5Z1
 xzlAnRqvJf/wL18JVRofharDAv0gzlXg3/3nN2arDJcKxHXy/RxTjVwgv9sQAc2fAvAlr5jGoVQ
 A+qrOH5vcJuUtioUBew==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a68890a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=SmOWCKbkXSXCNfC1NdcA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ST-qCUD7nGA5TwD-go0wotnUmvdmEj5g
X-Proofpoint-ORIG-GUID: ST-qCUD7nGA5TwD-go0wotnUmvdmEj5g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280094

On Tue, Jul 28, 2026 at 10:35:34AM +0100, Bryan O'Donoghue wrote:
> Add the ability to use a PHY pointer which interacts with the standard PHY
> API.
> 
> In the first instance the code will try to use the new PHY interface. If no
> PHYs are present in the DT then the legacy method will be attempted.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/Kconfig        |   1 +
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 177 +++++++++++++++++++++--
>  drivers/media/platform/qcom/camss/camss-csiphy.h |  11 +-
>  drivers/media/platform/qcom/camss/camss.c        | 104 +++++++++++--
>  drivers/media/platform/qcom/camss/camss.h        |   1 +
>  5 files changed, 263 insertions(+), 31 deletions(-)
> 

This is nice
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

.

-- 
With best wishes
Dmitry
