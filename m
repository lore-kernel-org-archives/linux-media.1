Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010019;
	b=M0yskEs2zxWaVbyM99wpsJtnOmwGcas3pVHxsIAGRwyfr8ksxOh0lv8v36hvHmJCpovc
	 8tw28Sj8sr1TPh6xXMLLepldld288/iJ5WKXkOir4QJttFV3rmBVWKa1DLcG4n/2FaVdM
	 88jJTwCVDAxdftq3yCjTPGlSPevGabMw3zhon7uAlk/n1KixPmAr1zDIhw1ZHBNHPIf0e
	 /WISXJ3oBE5hlUnNwaFRpLhHMPCIHCE2w/e4wJ/MFcjDPrgBlEzO3dIT+eMAw52yPnKZw
	 NL5sfTl+OtsU3Pk8kPGc/VdDeHpZ9lIpdAXpDU4oifUY5qeE+zOC+zr63OhoLUeaiYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010019;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7FDKcPmUfm8pKhwk0XQXsdGdq3ble75jjcxbCWLT98U=;
	b=HhEBhhU+nxMvFpCM2332p786C6NQpJ4BpmGtBKhDrS/MeD0Z3IXnYTmZMeMTSkmNdPWO
	 L4g5NCtmKXzL0+46zvK6tLPRPB5J2MHd60U8aDq+0oNzdNiibi5ZDl/KKivxEmhOF/EDH
	 Q07gjk7oh/xHkFtVy5XnoUUWqkTjvu1K2201Ao3+8EKwnBmqnyTWFWsCbsyU07Jxrcohv
	 ovfoTWrKdoFTvO+SMCGraIj3W+Zlx0jlUn7IXx00+X/eLg/9t1DXEDK2pv9v/aWtZnBxl
	 DraomOOXNxdMIVoyzsoJAYIV53VhIogZUyC2sx1Y/OxsDJc67q6V9XulJ/hpqMLf6+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WBa5R6DO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eo7kzBOn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE59160A2610
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE59160A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WBa5R6DO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eo7kzBOn
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4auSZ2255122
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7FDKcPmUfm8pKhwk0XQXsdGdq3ble75jjcxbCWLT98U=; b=WBa5R6DOTbjnjhg6
	oR+yaDocepQyyKbFvCO8gL6By+UFGT9Xohprkgdmh7jPeGBhZAFyjKNzaOkuOypT
	ygzkq3W3+P2AB2eBq0ri/8gOaObnxIJZbgBCgl7T4MBG7s6FV7bY0VSnSZwv4NF5
	binG9KB7KqKnNomvsStayo0oaocFxa7jCR/BVD064JVSxlhcVi8cKS7vvnu6EY4b
	GSN0Ee60XYevX2wC0LUHkZQfp40FkLpgI0o0Sc4KPoXwqP332NqnWvsKeTPSH/8/
	WX6l2wAtYXEdbplrkbwhypaNUQBMopXZofmInDGYDmvKKslYj1LcLb9bEiebykoC
	v9AuwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3nve0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:20:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f322ef7d3so639180985a.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 03:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010017; x=1793614817; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FDKcPmUfm8pKhwk0XQXsdGdq3ble75jjcxbCWLT98U=;
        b=Eo7kzBOnfE9nj63lRNDeCCx/2zXQFBWATqVXNDJtVg8QO6LhuD77GnKlHOK5qR7+FW
         zEnJLaXV/a+ZY4Icw+89xbU8kL+VE/m0ekQPMs5EqdZrHWtTg0eKU5CsT1ttJkSc9FEq
         vgzsACxbydYauiPvBIs/ckmV/cyDCtrHGwWyqAFCNBiTS+pg/5DvxTc7WA1gxFAQrW9q
         LuBYohScr4/tNL5jtR+rJw1lrUNsDgOqVsLLvU5NpvALrYefxpAAT7PtSZrtbU42I6Id
         3uoF5IF8LKT1UZtcln7W9ObN/ANLHh3ftaIHR2RW33xII/o/FlvfAajCjHettkpma48D
         uy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010017; x=1793614817;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7FDKcPmUfm8pKhwk0XQXsdGdq3ble75jjcxbCWLT98U=;
        b=o2gBFcJtpAV3Gsx9a3pj0Sz31FYdW24FJam0KJv6oPxlFeWQk5ZEtW0IJjO4EEUfTU
         gbVOLcbDkm61mgS4miFFC+8aYteIu1zw4AGDwapbjFMYCM9IajbnnRrBB73rtKS12Jdp
         Nl1fAshD7qtgHX88SeAq3+jX7MN2RY1BBvWhDXDcGhpgd0zyeDoTxaakKnOc/shAsyBm
         2uUqDDJ1aUqkPXX41VzVFS6bHs9jttmAHtJAm5tkUjuxLhXx5qKDOWieuEFkllI56kus
         ae6Ev6Gih5kjv5cPukQZfM/FZbVzNmplJBS76sqCXV+8p+HNY51Sr+nHShRAfPwiMZ7h
         +gKg==
X-Forwarded-Encrypted: i=1; AKwUvBxZKk+zaBH2wwcKiPxEpiggCDAxo7uLP4rSfFB3uJsiVKYs4zgZXY3Vu0/eGeG8Ycv0CSOB15gFFt458g==@vger.kernel.org
X-Gm-Message-State: AFq9FYL6bvpf8BMF8H3juQLGzHk5jhyM6qC2gRHL6vCEn9RQ9bmf4KgO
	avBXL2DUw5lNfpgoPq2U+XficNGO1Osj8BEVj9kRS8NH+7XftcOr65TjG4uyP0n62RJiuokDtPd
	NqCIDUfrM7N2n2EiL3acyMK54rDwQ1aaXOnl9iViLt0NK1a5zQOr9XEbIHDV6oamtdw==
X-Gm-Gg: AYBFou2z0lE/SivxdwehZn/w7BxdyNof6I3k/dpkbjbnGj+BHaYCzWBiadw5egKy97q
	8ApvHSY+5yvCF/JGc2bJ4w28qXHcm5usUmkzDsaSYhP9j7CYHZoUBxPZUSROJg5EeTpXKS7WuVA
	rg6cY3qon5mK54+1I9+fWTnCAHvTwVHJ8Q3LQUgb6M6VqKL4rjVRki35irZxi26jgfCePqZB0Hj
	yeoiQgsiDak897eDe/tBCTQ14VS79RLX6bCVWeig8R1CajlDhwSpUpcwMtLb4xqiiF8kUnmnnfl
	4OPEi/DERGwaHgUItJ6fOxfZq0CNLt+qO4QPFJVwkJsJFqh2OtxOQMwtDxD3vHCzSB4BefNipeO
	fMUqATQNAnPYtVgRekEL6RTXfoLeShtocXtaIvT2hWCUD0MA0n1vyi6BEpBq5sCWyr6Z5zrbJCv
	Nl9KPwh2MZfQY1
X-Received: by 2002:a05:620a:4002:b0:93e:910c:5fbd with SMTP id af79cd13be357-940ef9a6dabmr876603685a.63.1793010017135;
        Mon, 26 Oct 2026 03:20:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:93e:910c:5fbd with SMTP id af79cd13be357-940ef9a6dabmr876600685a.63.1793010016682;
        Mon, 26 Oct 2026 03:20:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a6ac6asm1437302e87.22.2026.10.26.03.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:20:15 -0700 (PDT)
Date: Mon, 26 Oct 2026 12:20:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 09/13] drm/msm/dcp: Register DCP display pipeline
Message-ID: <vd6e7jr4ciipj6ork5i36att6bamm4gpzxjdeqoqof3rdj2m4q@rtg7jop2bfwf>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-9-48aad0fe4f72@oss.qualcomm.com>
 <64603812-672f-43ba-9c5b-783d666d0ac0@kernel.org>
 <c7bdcdf2-1fa4-42a5-a89f-689e688af5ae@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7bdcdf2-1fa4-42a5-a89f-689e688af5ae@oss.qualcomm.com>
X-Proofpoint-GUID: CSGG3_2uYhso09GaIojmG7e1ARS0hBti
X-Proofpoint-ORIG-GUID: CSGG3_2uYhso09GaIojmG7e1ARS0hBti
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX/F9KWJkgpYE8
 qAp1q5y8mjSAgVtuBRg+KtOhDqb7RlZsh0kzjIJkKYHicm8wmWRmFFKUYyC2yaaQ1WwnfFWc0Y9
 T9+KUTN5T0VppZiyMXhfvulVeO58rY4=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf2962 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=XPLrJM8uNFvCFI0Cpc4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX9v43crHqQUov
 PkEdfDbsWHvMlxqHUu+X3ctNFIwkV1kPjUQTzCALTZBmS5FCvfhAzaTAaqhuVx9WbSBLlLLRKte
 4FoYUfcVC0cx8FHT9luystMT1pueqVmW7LhpYA8SlVJcdPpl5864AELwOQ0WdmCOnP3FdSl5BMv
 DmQdoImZPi/+TJvpCdF8Rf6yrOnf77t7EPt2Nlr8BHOamVJxhX0yOLfF5V6V1SCl32EywaezsVv
 AOMOzdWMasC3rxqikqsw3UvsFiL1zY3lvR6vqyQlw2QIhEA8tJCk8OJhQm30s+qUnCkjbU5IwQk
 Ea6OsGRoIN4FziDvtE8f1tgw3Ne6V0o9w4ynddow28lcDNRRFBca7zDYxsFUwzULvvZ42CddUUO
 mKRtfnTHZxqwlHOt6gaqLOukPdoVValz57W4FArooyNAkqN5C+6HRKLmLWa85p70iVAe6cKyWVR
 PI5M5kcYYUOUyaAgCfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260041

On Fri, Oct 23, 2026 at 01:42:43PM +0530, Jayant Shekhar wrote:
> 
> On 21-10-2026 17:35, Krzysztof Kozlowski wrote:
> > On 15/10/2026 09:38, Jayant Shekhar wrote:
> > > The DCP firmware exposes display resources through capabilities rather than
> > > through host-visible display registers. The MSM DRM backend therefore needs
> > > to build its KMS objects from the firmware capabilities and device-tree
> > > display graph.
> > > 
> > > Complete DCP KMS registration, including power and IOMMU integration,
> > > capability handling, display-graph parsing, and creation of DRM planes,
> > > CRTCs, encoders, bridges, and connectors.
> > > 
> > > Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > Assisted-by: LLM
> > 
> > Your tag is the last one.
> 
> Sure, but I notice there are checkpatch errors, should we keep this or
> remove?

Read the docs?

> 
>   ● env: :3: WARNING: Non-standard signature: Assisted-by:
>   ● env: :3: ERROR: Unrecognized email address: 'LLM'
> 
> > Best regards,
> > Krzysztof

-- 
With best wishes
Dmitry
