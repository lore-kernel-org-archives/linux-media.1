Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663831;
	b=t4EMU4lFRaF/U36eWH1EEhbZ3B1jX6tdY0l4FESz9k+Bt2goHW4Ps3GlXB/9DxW3GDWG
	 /iPiGfMmFpaUeX6TIRCL7M/dXm/2F8LOBRaa1FKpuJjZ4slCcBdoq3AbVgwygwfWM+BoU
	 qbrKVc5ZpoULVo44/uzE9uptLUodifMRsYelAh2cIzLQpGbPzobY+Wcz5wnAlkUtC6GEA
	 KOkjolQHD8ynbmo3uMWsk4wkv8MtYhnpjbsyLK3yilrKAxV3GOaRXlzE5F3/bjmugvPtH
	 P+ueoyFPFLuo8jiW0YKyRQonrNq+Y1tAnmnCxHu5dbvJ8cuKqV+9B6XVB8UxhYsz77g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fbKLGq9PyipegVYiZapN8cQvPdSHH8CKY+98Y1mqjhY=;
	b=10NS+KpCV7I7SPFer4lE4soZqMqgk2y6/L9nVEU4sSy6FgZQCEbM6qV+RhoT662yYtPl
	 rxXEIPqJlDay82aJosFvpIb/8OcdlZNL8qoilNW6i4RqpTme89Y/hL2qJNp+ynEINZLeJ
	 2zygdihleKwlGhXkZ/RvPLq9t3m3h/k5fqhHmNlqOyO/ZmMu9O1LtPnvQGfsULaV0gBO8
	 SBa3sU/Ko1Fuy4v2g7SoAr27inguShHVoYdjhLfTidxXHq/j8zaaiiqlHsRGzGMSnRPIm
	 o+seoWMynbyRGnnVdlbbfUxcuLTKqO9QB8sYZIuyzypm0gUfxLrSyRfw80cSdhL2QqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QU0Webh+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgTj8Oqw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4725C606A329
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 10:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4725C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QU0Webh+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgTj8Oqw
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA06dr3427093
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 10:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fbKLGq9PyipegVYiZapN8cQv
	PdSHH8CKY+98Y1mqjhY=; b=QU0Webh+X8+jU6IBgNvZcDg6N/kD+t0REZyXD2YJ
	/p8FBZJkvhj6GDn4hMzgSZi6ZbWPzC9vMwMKs2C49wFrrFP2NYZ7MFB7aPzKtPWT
	66jrEIPjbFE1CDIQVEtP1Ay4pyMP78zyFVMMkB8YBzuO9RspfMfXDJDmrkPV0XXn
	/tlxP45MqKFdV7qsLdPdj1ReD1ERCwx7GN09CLY6rqnG9YBbmmdg/2/fJgXuxQ+R
	SOYyNYFVNX0OkZCYZmbLfpSazF76pZHYe40fY6c2tiHuM55oNupzVihSLXEh1a1K
	3t7JecY5+WZ/Zz64JhTumhF8SrmyB0n8L8IoxzxFJTZ4JA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0gfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 10:10:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so505119885a.2
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792663828; x=1793268628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fbKLGq9PyipegVYiZapN8cQvPdSHH8CKY+98Y1mqjhY=;
        b=ZgTj8Oqw0sEmX39O7qy9Hq10+h5IK3LPcvh96YZ8ZEY1wrl6b2rAJJ0UQp61RDZFek
         4+yjGHSpn+ajCAs/DTTvGQ862USpln1qZkDMLmH1jmSdDz0FJ5YPHPtv6Rb/kLfmUSEO
         gO4zE0XbWGPk+QSEdTaidFZ0b3HY+VOGXdT/+FhTzAQZK8DsLjbfmSCdFx2wD7+xjDzJ
         pGUG+xsScGEQnj17i7biDTrf1mP1hEwBjEsSBtZ/jLUenZlwn2VxbVywZlaSRdAF3hGb
         iXeQ61EhsPGsD3+E3snLc8ACzXNeiLyJR4PDwlSf2hckDt9D2LDt3wsOF9ZzpFbo8eP+
         sKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792663828; x=1793268628;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fbKLGq9PyipegVYiZapN8cQvPdSHH8CKY+98Y1mqjhY=;
        b=X/XBUweJcjRu9xfGpMfb7ZlwluZqhRYO1882DeABvKqZeqSXbCmSCkf1/RslYUJhid
         24AkOnNlXK+f2q+FL2NvkQH4qVSV/LmvwXDJOw8ybJKzm7l/2elk5RraUK7l13f7moyD
         tNtxmlleGLiAR8Ks0bzBTp/ozrlr2M9VZIcHx2HTw07Dix6CkFyTK0ZGUR98rFrn2LUh
         kCOl7c1ybHBigmxQrINZkN2PW0K6oVezaTtktr9rhyLU7n9r4nuwxpH2VZI6hwlO4xmB
         P59h0ZUjrmJZ2bjURHCjkww4mVyVV5wb5MtuwJsJtrq4BgsYtRIepTZOwFZdjmYo0FzG
         FbgA==
X-Forwarded-Encrypted: i=1; AKwUvBwT0tAc011nqSO3weLynVL1aX1+pVEmcheeO4gtF8bEy0/a6NKvgxF4+CTptrP2D+CP8VDJj+aRoFzapg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKq7RsKStUi5tDX1WNbfnoPwLuGe3gITFfYHUS512Y3TvXmspka
	fLm1g/BVbsagEtJ+QYzZ7g25nNj9gBGTDB4Cu26tINPNVmiN9ZD5jrJzlHHenTdxJyATxbw3AGi
	eJYRzAJi7iuUucA39e6wfXdvZU0aryTtf72trh5c0+A7aZkRCEcqIIO5ZATX82k0yKA==
X-Gm-Gg: AYBFou1IoXIRoGjhJKP9jw23vBuM+LdNpdS7sqOksI8KvBCX93jDADqTtRBhf05CBNF
	S7zikgidUVZAkThxZtKNBpJa+OBAcOEvauFIsB8zhv1kSHJAx/fZxRqaO/rXlbv3mo/CCRf9tr4
	SUmikzELfcZT/I7hQdp88fpHHkCDIFy6eoUT63tX3klepTeVcLO4qK+wwaoBVXhibjYYo96VEpd
	AwlKwGzE/n44zqW6l1iYoqB6rYPMPNqVj3h5CJIoKogPbz0GZCJSNxP5agoddUjwUjO4fwQdNPC
	ULvu+HnFrKE9nXY8LhAIrc/x0H7feHT5ktjEiEmOig/bjoHCPYtW4jn6mJWsh5KIHbMEYUju7De
	ecc7PHM44Yi7KjfODcZs9GwkPNg/TY3NCgiKuxFAOdkT4pBI2tfqo41jDOrh5rv82HDkoLoqEBh
	VJUVBIWeUyR7Ci
X-Received: by 2002:a05:620a:688e:b0:93e:d364:c9fe with SMTP id af79cd13be357-93f57f5129emr848793785a.40.1792663828347;
        Thu, 22 Oct 2026 03:10:28 -0700 (PDT)
X-Received: by 2002:a05:620a:688e:b0:93e:d364:c9fe with SMTP id af79cd13be357-93f57f5129emr848789785a.40.1792663827828;
        Thu, 22 Oct 2026 03:10:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1244ee8sm1026945e87.84.2026.10.22.03.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:10:25 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:10:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
Message-ID: <325qovw4tt75qgk5uncamb4ca6ql5ulyivkgocumi3bwogmkwn@ijk62fhpxptb>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
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
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
X-Proofpoint-GUID: POBBbo9NbvUkK5CUb-fHzsuIG7b6byPK
X-Proofpoint-ORIG-GUID: POBBbo9NbvUkK5CUb-fHzsuIG7b6byPK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX2DWHYpX4is/O
 NeITnQTIGRQ/TZ9KzywOQo8y/5+HJf7kQv6w2i8LoMVOdoVUYnAJvEk4QO8bXeDkT5ehXxEopRz
 n/HJumwQlZVX6QkyaN7gsdKZuV55ei0=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9e115 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=AypnKj6NB4iKfuN-KaAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfXwFPeu9CEIA1e
 v9TKW4cmYUurOdJXmQy/YZAJyo3K/bnR3Y6Ww0m/FuU8tfTRWlqzQH6v04eVNDcJO67XVohUz1c
 hqkpkAyN0y1X297LftgQIzyk67Pj3KsdEPKD9/6NLXtcxqv5q4urVcg16p9JJC7aO0zBBZZw7BK
 2jbFPLADMdKscssk/RMkn79tiF09S0W3oVPpKAnxUgq0biA3gapzxa1ybcbSutyWbySXF2yort8
 RQNtRebq52x6WPBWJ05GbAw6yPhhuw4xaXLg9+qfR5f0ThNIc0VaLIbutZdlJsyMFJhqWaC23k3
 u/J/MU4qtrwVzM2tiKPWKHw/d9DPqtS3U4X1E8GuBlhrIcfwiMXbP4Zfg/pgjmyWSHUv1qoh77b
 bx138TssCUo844zP/qrF0KLp+ofp7Obv+fXTbua5ntndZHVmcbHHtF8DZuvE9RitAJAnpIeYVSL
 1Ryh2hSOoJ0Kmex0erQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220040

On Sat, Sep 26, 2026 at 12:04:03PM +0530, Vikash Garodia wrote:
> Reserving an IOVA address using "iommu-addresses" requires it to be
> placed in the reserved-memory node. But when "iommu-addresses" is the
> only property being described and there is no backing "reg" (i.e. no
> actual reserved system memory), it does not really belong under
> /reserved-memory. A device IOVA range is specific to its own address
> space, and does not describe the system physical memory to make it
> qualify under reserved-memory. Given this, place "iommu-addresses"
> inside reserved-memory only when it is paired with a "reg", otherwise,
> define it within the device own node. It was discussed here:
> https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> 
> Existing "iommu-addresses" property expects a phandle, which does
> not make sense when the property is defined within the device node.
> Introduce a new property, "iommu-ranges", to specify the device
> specific IOVA ranges when there is no backing "reg".
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/iommu/of_iommu.c | 128 ++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 121 insertions(+), 7 deletions(-)
> 
> +
> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
> +		if (pos->start > next) {
> +			region = iommu_alloc_resv_region(next, pos->start - next, prot,

As pointed out by Sashiko, this can overflow on 32-bit LPAE platforms.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

As a note, we'd need this patch for the upcoming Qualcomm DCP display
driver (posted a week ago).

-- 
With best wishes
Dmitry
