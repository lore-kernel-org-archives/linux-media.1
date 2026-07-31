Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A275A3E92B9
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785499043; cv=none; b=UNiHu8SFwkq5mcr4EYcEYxC+l12oKUOd0JSzR6wscRhoTOjCJ6RFS/9DCdMxvuz/wwGE74igwHXMOcnaLEEO7adLXUKbdFwddtjSVIlnlLpskOI6bOXI0F4DpSgPG3eEAPwoZoulUk/uWRNUkD6VC17o/eekxyQSJZRgpKAlmjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785499043; c=relaxed/simple;
	bh=ZnB2FFOBQAnKdY5X0U5hfyBPVaTsPQG5cj8N5CJIEb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khdy9ykj07TQfhvZgc5G7KXSc36Q6rc89ddxhiZZoyNNhZcCorp80qK/rpm2Nh4L0j+ejjVqgp6LLgcSo5Mis23teurIsFP6T7rMQMTfzLUnpxp6j5aTzbb2Q/bMRqySAaq+VkhdVN9+65yFDbsHj0q/dOsXK3cbKFaR3nZjmbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoMLCh3X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/NW3GAm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MoMLCh3X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/NW3GAm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBjd9M4054639
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zDipCuRdQmTnMgrCpEz7aL9Ok5U27Xe86RdflVqnW1k=; b=MoMLCh3XGwuaSq8g
	jYNdWuFkRi7ZBLFMmxXW+ofa+YxhUSxplTKk+g/xXbcOdkSSQtjCbSSHk8v0wXcM
	w3e11oVIur61UIqkNK4XgRIIAXQRTa3wt5P3pVDbh8jxsK1mU1khgnyjJRKcNpzf
	KHjtXPQCrXRxMfO8ZiVkst3xTJLGKy1roOdQbBHtcAJY/BAmeLNmmkfNvGZmyTkD
	6hVSokkGViBF6hs+dKcaRvx4Tqld8ejuvi85PUhI4AoDO29+hRKQV8jAuKqVrR+J
	IPPJilPz/vSVOpB0kGGpPCw+/iyf+WeNg3XaGAHdxxe3z2g49BcRvN0VZg4h4QDe
	Nh2M3w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru48016n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:57:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so8962731cf.2
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 04:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785499039; x=1786103839; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDipCuRdQmTnMgrCpEz7aL9Ok5U27Xe86RdflVqnW1k=;
        b=b/NW3GAmZkVt9vLkAgLmkkrGbSxQdFAweGTFE1n8bnILOVpP1seJQL6Nsw62/5nygD
         0mCmNATYxerFNuQDG+akaPwH4SzPPQo/n6G7Z4G3YrEc6m0n/dcWHnmbnv6nAxnessuU
         xOcHCz0TXQesS5urLlh/Q2mtDDJd+2IOCjiw3yDJWrv7KAY2QnMyBuZW3ui4bEaTAZ24
         A88v/m8vURYjemVlatKMD3uNKxTVdC9MsNtD2rV2dRQD43Y0BptImMreqOsB2u3ZhC64
         fVODwMLap60nIlWvPn3mlDYLGMvVBytfMZnkMprtQw8LdPFHokI0e0053nn4DiFFbfUw
         +Kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785499039; x=1786103839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zDipCuRdQmTnMgrCpEz7aL9Ok5U27Xe86RdflVqnW1k=;
        b=XCPu4BsXWuhUt/2TgasfWXv4dR5qKqMnuxNJmtCKZlj6Vu4zlU2BRi7rvgJfk9p/Nj
         +chbmgjM/RIDsbd+EfWNkm2EmX/1jVFQJ0WlZL3JzvWzvX8lPpV/5xsBdAod5a8nXQB2
         wYA0wdrzrhAjBBoH62gkmbgzNELzA6VilGZ7087AACrQMLgDkb8RBkgRLr/BwqHWapuu
         Ga4voD5zwmNso9GF06elr1QlsqNRL+S0cLXR8KFABXTi7isdhr80+DxTulNHfFZlpbUs
         LYrw6k2DSuYw5ixrbTJuj09fsCs89zwS1UiQA1dSZQwMAibOUOGJi9239XcR0wg63RWR
         s7IA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1gTkSJFMJRgE0wWdu2P/dZfv+XcfouG65/CS1BjssrgmebYgrJ403EqaWVyuhyKrCeka5i7YAu863Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ZFWzmVNPK6duhWT/NfRpnuaDEgyE+N5roJs9lbkcYmFRvxYk
	LZcJJ9n2exCbOaORvuB+3rCTzmWSKos5aCnhFbK7B/nSy+GMSSpzlcpZICLnb9I/bAbK7pMEGtY
	SKSs1vVbYGG5sfCFYt/jvTbUakb3fk+A8B7KkTTUNss9IDeh0Xp7Lryo+sohJDcnPpg==
X-Gm-Gg: AR+sD11bXLnqBdUKMS5tZPB3Wj/68haz8rX4bD3BP8LvIhFYm1zaJ3Na0CncrrVQUPW
	wMQGGLegJDbZZRL4cK/ImWtjIqnjzTlWvzNsswrV6aJgw/rpJ+ntD19z2iGomEITLGSAWXx42ZK
	BQvrVWU2hIEK/0CQgnGWFoNtFo0WN49OhfhMOJbcUNkXVtkpJ7zbtJHehMjZQT1m4QgPwnvdcgF
	uV7+hB5hL/tGPE3T+sfwaGdn0S4dYMXQdQFZekXQoTdVrL97yntjmxRHqfVgrHYomnAZVT0S41l
	DXunssf4JXRiU5a281eFcFIr30EF8lKoZTanJ4unPfslALA2HDAAGxHD08Q1OerXuMK/P9QAJ3H
	4wZ63NUu2Xw0Znrm1vOoZdV2cgQK6TqTdK6WKK9CJP0OvaxkjK32Ze0hnzR/FS97XEbApaR3Wen
	qp9LG+IPFJJSf8xQ==
X-Received: by 2002:a05:622a:4896:b0:51c:19af:6341 with SMTP id d75a77b69052e-52b4b06032emr23454231cf.36.1785499039196;
        Fri, 31 Jul 2026 04:57:19 -0700 (PDT)
X-Received: by 2002:a05:622a:4896:b0:51c:19af:6341 with SMTP id d75a77b69052e-52b4b06032emr23453791cf.36.1785499038705;
        Fri, 31 Jul 2026 04:57:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cbee2sm264238e87.29.2026.07.31.04.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:57:17 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:57:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Message-ID: <tsxthwcohhrmwvgzg54drdrfu6tzjeszvpsvkpstocxqr2smkf@j3w5qeo4t5y5>
References: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
 <20260721-shikra_vpu-v4-1-6dc5a8999b73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-shikra_vpu-v4-1-6dc5a8999b73@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IJsyzAvG c=1 sm=1 tr=0 ts=6a6c8d9f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=rTYBJUTfbzVes0h8czsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5MSBTYWx0ZWRfX6VR10LCLns19
 kpLNZVswM36xvcwt/EvBF2ZgecSYs8oDZWH6aOqNzUPXOnquLL/Kb8HKKp6SEt8ar4dKM9cNutg
 gk3V3qh3Rx2VEklzHPXCxgqfumsl37c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5MSBTYWx0ZWRfX5VNPrGlBM2Pw
 VrBEYNFt3W0xrx5rtoNpvSKPpiQ9/bI7wRx/mVzL2/o/uskS2kRVIPH6reOOgc9bLWRKkOLAPIU
 Omxit4xV9tQVziZ1Q34P04xZ3pdeXAbxCvqdqT/jU34Tj2g5yot5retcJWny/nO4nmFvANhVa0d
 5Qe3mSX7SLaTJEAtoXd9AvfuxtwNarZEilCV3rHAJGLDwf0+V7HiN2zrF+mIFXLKBR31rQQvTEj
 uUVTL+7/8YxgThCz5+0FIPBVIf0J8Ljl9iIXTXR77rUMDpGrIlwwIkshNoE9LDX5YwUb6Wl3eGt
 2f1mTQWg0iDV6L06zQ0cZ164TuS5nTGTJRE/y/iuV/bgp4aXkGY785Fwd0JB92NL6/cdrt7dgIg
 +Sqg6IOYeeT8wahWGdVjZxDPldkdP4FrXqFNgxm4NBo35ap9H88ycnX0nx3g+ZOmR4hurrf6fi7
 KK1GRxOzQpLYl0eXWWA==
X-Proofpoint-GUID: bsBANOs4Oz_EHqDG8hiIE_wmevjaqboq
X-Proofpoint-ORIG-GUID: bsBANOs4Oz_EHqDG8hiIE_wmevjaqboq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310091

On Tue, Jul 21, 2026 at 11:02:25PM +0530, Vikash Garodia wrote:
> Document the iris video accelerator used on shikra platforms by adding
> the qcom,shikra-iris compatible.
> 
> Although QCM2290 and shikra share the same video hardware and overall
> integration, their SMMU programming differs. QCM2290 exposes separate
> stream IDs for the video hardware and the Xtensa path, requiring two
> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
> equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
> and Xtensa isolation requirements, such SMR masking is not applicable on
> QCM2290 platforms.

This means that there are still two different streams, one for pixel and
one for non-pixel data. Stop using the mask and describe them
separately. One will go to the pixel node, another will go to the
non-pixel node. As you wrote, the hardware is the same as QCM2290, which
has two separate streams.

> Since shikra uses the same video hardware as QCM2290 and shares the same
> programming model and capabilities, it is added as a fallback compatible
> to qcom,qcm2290-venus, with conditional handling to allow either one or
> two IOMMU entries.
> Common schema is updated to accommodate the iova restriction of 600MB.
> VPU restricts usage of 600MB for specific streams, which could otherwise
> lead to device crash.
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

-- 
With best wishes
Dmitry
