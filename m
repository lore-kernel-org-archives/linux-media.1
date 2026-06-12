Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3415B397329
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 07:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250564; cv=none; b=jInaIvAc6Q7dyBZgAcv4017bODT7RhngO8KmThRdOs0EBa3A+8x6VWK0LwcHP8nBwq64RZZZKD/lDUIeEM0lqYJgaihG32rFzynjj9N8qwju30MmoG8sQFmn9k6d1RUAFREmp7YRqBKXXIuxB/ZbT5R2PRpR3J2sdCyI7LBwlwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250564; c=relaxed/simple;
	bh=oSClFw1N6Pzc5mrZzt83o6RTRpl1h132KUxpmGTz/i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3TQcy52N0P9nWOs+sgi34qz2n9fcD2/CMkoiNEEXgLMTBSFyg1HL7Ot0Bh4kNRSOuFAQCeN8vZFp4x5E9zHFq0/kS87pVfdpjkE4EfGis4dtEJg4pxYlwKJQPbyvc3N/RcM4Ydmdvr64rBggmkew43+5FaGNa55SLM8gvYjbZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFsBO8at; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SjFV5NwR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFsBO8at";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SjFV5NwR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39OmT940310
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 07:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4AA/oGx5sqKMDcm3WaPRz10s2TG42Ep0EEBjqj7wU8=; b=ZFsBO8atIgbiQHfi
	CmpJ7BufwbkUat8DmbBUny5rzWMpaaHG9SJkuDKjGTWN9fz8I+175yEdfvVNOl3J
	Zk7S52nxRpHgRe+utf+b87quHTG2oqrVyN75D53aVcvfdPUZDHKuRr3I1jG7OBLT
	efj44OHpnd8rdUBXye49gqmLO3Z2sfW2AC7fIIjkans3ftM+BdMxt2eiY4TVCzBp
	v4raRXmY4P31oK1ejEjDo6bS7M9dONpj/jXTHKAXw4veQKi6i9G+1whZKm3wKkxS
	XwgEhRRINkPdx57os3waUm87m9TovNncbVDwSh/F1D0gdHRb9MyRg1xxw7UTPs/e
	yGqimw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014k355-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 07:49:22 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963aef8124fso257384241.1
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 00:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250561; x=1781855361; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4AA/oGx5sqKMDcm3WaPRz10s2TG42Ep0EEBjqj7wU8=;
        b=SjFV5NwRtOtTsbxM6IJr3ehgW1KzkT0A8qZsLC/Tw7vDHcLIk9Fb5XR4V1wTbai7Pe
         GbNGD3Zq1HlAwidHqj3mhPt27M+A7ooLkOHxkar1hm0bBgmvKoi0OjF2v5fGteqSveHQ
         Dg6TguXIAHx7ayv7to2QdFfJLKA29jdZV81hKFlBRPgfIOEfKWr4xAp+5l8bbJjK8ACV
         XiHACFHwwQluHtjcn9l+fyoIecsQ09GHSCP/BwQ5SSdR7X//ZrjfUEM6ckn1ZXk9wB38
         ZXlPjRSw25mAW/3T0peqitmVPawDkFsFUKMkPtkXhWrZnNoRoCamlZAWN2EJfmfqVIUG
         ZKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250561; x=1781855361;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4AA/oGx5sqKMDcm3WaPRz10s2TG42Ep0EEBjqj7wU8=;
        b=FjoQEoKOA3RbSSw08B0XNLTPrWbqJG9j/15cg+vGnzsCYywNTWkD/h1V8bjfISS46I
         DbirpN3PUR6lzTmyevMIlK0fe73feTuGpL/bIWTwA0wgkBaqJEGOOO/H6yywoI/xGef9
         Dar9lc2kufzYL0olmDzM2Z5LXNx6OjiYJuAAVIKezBbs2hO/86D+IQyFNFPMeonC4m3n
         33qzJrfl/Ni5teagG+dzLcn89bDQw+pZoA4QVBpWnJ0kCQcpBRPU5K0zhvhx4eAHuDmA
         0D6h8Axycr2sW1K20+RpJGPj15ORxBRAirTp9aXYLtB+6ku7X12OXxlvR6+pNMTSCGFS
         ae7g==
X-Forwarded-Encrypted: i=1; AFNElJ/2GaveeycI4krTzk2i7obHW4yNbOSHDhB83NBV5OdGeqNFxhDX3Pq2InVZwLdBdkov6ep/zUY0+/+2rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6H429IzAo8LfiheUlPuKS+sWwy5uZkA5Hc+NSkvcAByzK5eol
	QbKCIrV2rGq+QnfBIY5aH7wkgTfHtOZP9LUvN6F3VPo7XDYs417cc8JbcIAFZ87kMbvqzr2aZHi
	A8HDX3ThNjRL2mR/h5KpOG7vjV1SuTsuOTFfY0njQxbxc9bl/ktfXJZGfOC8v48ahQA==
X-Gm-Gg: Acq92OFx9ejwqGKqNzRWktxoIAksHPNS/Us+iIgQAKDAntYUhTsTZeAp2m0unUunjiO
	aL7CLZggm5sRqoK+aGtcjE1f4LRhy8CRCjef5MbwWNqdBebXA0jF1j6KIBU9uK4Y+cIPs8H4cq/
	5boqOMuOy7eDct+KWJV2pCafrb3SYcQDW2U2k2ilx/9zsuXbI365uAKfejsuuRm/+PXasO3AGbY
	Zfa2+Bm+4Mc75O4wWUrtlKUMY4+mRlEv79jtRDF35Z84GG5h9QfyTrEdnGmOzJGVJagZHGoHo17
	67yP8eY88tijAyd5871sU3/GFfLr91L4ZEmCy4iB2v4IF9sXS2kyo1QSeMr8K5py32UR/MGt3vI
	3ONmUqjT32THm1PFlbVOJ4i32+UC2mfGbUx9zJad/UaKGqz/oS0xVfU6MhJMpyBCbuL10gV7wyq
	wGCrpGM9cNxjWPFlu/WLBbc//RaXWn6m9c5fE=
X-Received: by 2002:a05:6102:644b:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-71e88c54814mr544153137.13.1781250561323;
        Fri, 12 Jun 2026 00:49:21 -0700 (PDT)
X-Received: by 2002:a05:6102:644b:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-71e88c54814mr544139137.13.1781250560921;
        Fri, 12 Jun 2026 00:49:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c4aa1asm4324521fa.10.2026.06.12.00.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:49:18 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:49:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Message-ID: <q3sr74ncqnmzsjrd6jdbkpplxpnsnifhnvxsdplvogr2kf25p3@taadnzd2qrcu>
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <5YTsRTMAUGw0it3GAWHhKIh77_Hk823-xRJ4WxzQ-ENpdnC9-ttUvWhJI_CqFEetmFXcRel50GK_o2UMGzwZmg==@protonmail.internalid>
 <20260609-shikra_vpu-v1-1-3a32bb38b080@oss.qualcomm.com>
 <f793c665-ac99-4afe-a64b-bbd6d40044e5@kernel.org>
 <bc9a8075-db42-4de1-a3cc-4f6816681290@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc9a8075-db42-4de1-a3cc-4f6816681290@oss.qualcomm.com>
X-Proofpoint-GUID: wVKqQOcY4-M5OEVKgABR81rJeXY2Ym7v
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX2GXU5L3SP8al
 Mq2Ut1C4xD7Zc0ZARooe446cjXZKq0h1g5iBrgWPumn2Px1Ybbl87u+8CReX1Da82P1SRn8dtPu
 z+kq9rMCUtiuIOATmvHr1L1ta5sZIH0=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2bba02 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=yW9dRt1GCuxPZAtmE0gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX78mPs4vPkUea
 AU3Xr2tUeWkSdmnGbTMdu2J09KLILCcJGeq7qj0rXSOa6HnyhdyAeSypcbZnxIW3wcl0p/mozSC
 keUsTeGBLDEG9LUmcnqJgE4NWp2ho6YbZgcKm6yVK7RH9q973DvsAeeL155oZdZzCw4Pv5otwa2
 JiQY7YR4ylVxdxzpkQtf7UOU6khqc99tchUTY1nhQvlw1EuAt2SFeyNseONzl1ezP+9LS147CVR
 VPQpxbpgyxHnz7de9IDvx+m+pzcdoCfc6PaqHoi4p3QT32x5RTay1p0NC7s/ixK1TdJ5IdB+1Rs
 I62IJhl7wpQ52lzIj8mim8aHTDLL+BBDH5++3qVouepmvZHvlC40w83FbdQzXifHkdo/JTklLbe
 lTzoIul3kNmSnGmR1n9l382/OvutJz8iGsyAhEVNVCA12ujbGDKLf49HYXbI/mlYe03IL7yW1Tz
 iy6yXSsSFYjBOfjY5yQ==
X-Proofpoint-ORIG-GUID: wVKqQOcY4-M5OEVKgABR81rJeXY2Ym7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120069

On Wed, Jun 10, 2026 at 01:20:59PM +0530, Vikash Garodia wrote:
> 
> On 6/10/2026 2:07 AM, Bryan O'Donoghue wrote:
> > On 09/06/2026 17:15, Vikash Garodia wrote:
> > > Document the iris video accelerator used on shikra platforms by adding
> > > the qcom,shikra-iris compatible.
> > > 
> > > Although QCM2290 and shikra share the same video hardware and overall
> > > integration, their SMMU programming differs. QCM2290 exposes separate
> > > stream IDs for the video hardware and the Xtensa path, requiring two
> > > explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
> > > equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
> > > and Xtensa isolation requirements, such SMR masking is not applicable on
> > > QCM2290 platforms.
> > > Since shikra uses the same video hardware as QCM2290 and shares the same
> > > programming model and capabilities, it is added as a fallback compatible
> > > to qcom,qcm2290-venus, with conditional handling to allow either one or
> > > two IOMMU entries.
> > > 
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   .../bindings/media/qcom,qcm2290-venus.yaml           | 20
> > > ++++++++++ ++++++----
> > >   1 file changed, 16 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-
> > > venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-
> > > venus.yaml
> > > index 5977e7d0a71b4fb5681f1c2094439c251366f01f..895533b9756690d075fd7729e3f805c8e72ff0df
> > > 100644
> > > --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > > +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > > @@ -15,12 +15,27 @@ description:
> > > 
> > >   allOf:
> > >     - $ref: qcom,venus-common.yaml#
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: qcom,shikra-iris
> > 
> > Should this be "iris" in a venus yaml ?
> 
> given the vpu core was first enabled on venus and now it same core on a
> different SOC being enabled on iris. There are 2 ways to do this
> 1. Add the compat to existing schema which defines the binding for that core
> i.e existing patch
> 2. Write a new schema (or say duplicate it) with ...shikra-iris.yaml, but
> again, the shikra compat would fallback to "qcom,qcm2290-venus" compat.
> hence even iris yaml would then need to carry the venus *string*.
> 
> I followed the first option.

It is a correct approach. However the block should not be called Iris.
If I remember correctly, the core is still named Venus.


-- 
With best wishes
Dmitry
