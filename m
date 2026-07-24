Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF34D38888C
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 11:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784892638; cv=none; b=DJFPYH+AV/sGrX3o7kqt3AmsX/N6WI7/UxNienHpF8VyOzg2P5IW02c/EpT7CkblsNFwQpUOXpnWy4tEQz7cD2R/dKMJmYwszjrqRqWSrWJJt2UwuwjZR6yduyC1HAK9ESMtKMpsMV/lXrnkM77zHRo9pzQBBp2nHkLv9FUPZQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784892638; c=relaxed/simple;
	bh=v9CE0NZgeV5DlI/DjX5s89yBEYtQGbY9EDY4vDxz7xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4OQYfcCTWL7122OA0iVh9czBwNP5fvaaGOnhp67lTHTWKGbj3DcclMHZ8+xI4Tfhz1TqPDlUaLkTP/7BlbwBN/YLC9oj2fJJclRnqQJKDTPU45ol06tqor68zfCnIvLGY5xnVz2qVRUHTYjaFqbxAWH1LM+mK0qdY08kayrWfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzYsxphn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QJNl4c+b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AzYsxphn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QJNl4c+b"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADvjN2916976
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 11:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ifhK8jF0fZ9P81kr75lgN2ov
	xxuOE8Gi3gW8iorSRjM=; b=AzYsxphnwEvoFrjj2ct2dVpTyT4wuylQpTaRYmk9
	YwYg6Y2GF7tVOo39jVowCMUiobRWJ/NOoqfl0r5uCU9w7hRysnfmN30Vi+hGIjNE
	Qp14rhVgwsUu2v6jVlo6bJ4Htd9c/L1VdD4Nkao5Ep75EfH9nrso9KUtrNqSkn7T
	fRenBAkO8Ql3W397zwOCke9LdDKe/WfcKi/ZvvsEu+AMzLoZlZbhe8OfTyruRc6U
	eOI8qlgT8zUfjmLnQajcrftnlz98Np+ysoCxK59j7r5EDmcLbQWIvAwsc45xGifn
	DMq6efJCE4u2nWodMALhfjOLi2mft+PW2cvNL0PjgLKQKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vky7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 11:30:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bec738909so4657281cf.1
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784892634; x=1785497434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifhK8jF0fZ9P81kr75lgN2ovxxuOE8Gi3gW8iorSRjM=;
        b=QJNl4c+biHvGXI+8z4ugszdg+GquPl8ljyucdpQtdSzkKaaTno5KJD0RT5ZZTMbSJN
         4ssjIuNWfjRMW+XsGiAwVqf9BnvmS0RJ2xRb/xjxlzoq7R6WfTazKK1tj2vYKIj45rTc
         EySN+NdGYkvAoTx/+dxcxPD0Hr9F2lENjFtu+rVJ81zZNI9l6P5+xCpqkKFWFIhiHVKp
         h4G/RbYbBYIe8CQ8PgxpTRLFype5xUeG8HTmMcF/JkdNGKpo+lWmJqAHGa6Y2eKHgvip
         5UnF//yElHtKo/tWi7SxVcE8lI1wBs8D7EFiew6vLhIxZmlNyuuru9BkO/CxRzWsytLw
         VQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784892634; x=1785497434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifhK8jF0fZ9P81kr75lgN2ovxxuOE8Gi3gW8iorSRjM=;
        b=EJA/ga/VjGPTdh7sXgMVSY5mbF2QEq9HoBe0gOZPQlsyEkqceTYltYYqwOIZqMPrSI
         KDgiymBwyB7joCrbdYVMzURcJsmXWcME5E6f6n6uo0BFJLiEsoblwLB3bO6rdlZ2tqpS
         /NPkyMst+SQR3D2+9HNP7U9fltH0shUpcglfGRUEloJUs8JG/FEWIHKf15VYMhvXW4DD
         Sxd0ezHJ40vZnItHArJ7ai/aN1z5EyBnCCaFBttOdFq6Vs0LRqGexgtF5dKW0S9b1MIB
         XsbLZlvnKEEssAonWPZEs6Wz6Xsp7WHkC6WTxZDx3jv7Lby5LflpsLbm2uaAnRNooN1O
         5mpA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/PtoTFIjhY+cRs61f/bRIrymqrVbl9QPIUPmiMw2rGhhiJ02J4KVyzTDtkgJMwLRFjEdWgd/znTsrDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7+jj9RE2n4I1TNBSTdwAHL2SALT9kjsgqFtQUWV227MyeU2Hw
	ZfRUJ4eqvW2iRAlVDuH+kuicdQ2Z1iO5O1KlPXFaQ9joyHIPtd1PCr4/sP8gzRuiytzJzqP4+n3
	wOEBZ7AodJoSRXj07zKSmU9lZC1zOk46/x2AOhtOXoSBK+QdXaFXyLYsDfjaupTQAPoM3UcXNeg
	==
X-Gm-Gg: AR+sD12EncP7FyFSw2qDxe4ja9HwHqIjfCLxQPXDOPFw/fPoz8tKgXGx6aIZdPlowzQ
	EmV0n+iI6li/5S3M5HqH8ygHmH0flUohnNGEg+XwWVATeq25Osj6uXZa/qFPXz2pujaKYZ4s+ol
	cA0A5yuLUTT6xEb9MDhLbCcAEDD/sfWf9yF62WoxAzAcgShzv9AWVkf3c3t5C0VXibmhvTL0ht6
	OGQNYOe2MHEOjm2HeU4/duhHpuetS3GNTAj8eV5219nXIE1CF6yUSrhmBoz+uODzKRqJgGa5In5
	SMUWawnBaEZX+fs0KLWlRQk/8xOsbR10+wsOqb3A4jCeX9+Pa2E/nCmMMEqmQ7BSsi05bjTatRN
	qVqsOnrqYO1wKJNbbuom78Jn7u5sYew8PJpKIO8SMRZ3KKX3cP0QES/qNnrukIeUNudmExzZ4/s
	9QbpScYWLTy+KGXg==
X-Received: by 2002:a05:622a:1350:b0:51c:83ee:e42e with SMTP id d75a77b69052e-5283dffc205mr65522901cf.77.1784892633954;
        Fri, 24 Jul 2026 04:30:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1350:b0:51c:83ee:e42e with SMTP id d75a77b69052e-5283dffc205mr65522211cf.77.1784892633423;
        Fri, 24 Jul 2026 04:30:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c9f8sm1459645e87.14.2026.07.24.04.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 04:30:31 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:30:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add
 glymur video codec
Message-ID: <frmpjyrk3epa26oebskil52sony6k672a5mkcamviiz3vdjlj5@eenvztuikja5>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwNCBTYWx0ZWRfX4QXp55WhR+mT
 YrtfhIio+nSRfynE/CjO+ULdqcRfyYAVOsqCckRJlLX/H+x+1L+VaCWfM/iQ4HiIQlbYPJwxK1b
 QtsO41+4D8wdnJNl09u6a1gGYCnnX3w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwNCBTYWx0ZWRfX0bIi0XWIzk4p
 b1WtrfvUqOUHUWXjltXUlQy6LX+HNv0a/7JvaaRCDTwhiORKmRyUoIx7aoVWOr2PK31Xc7V0Wz5
 44lSPpUUH2o1d7X7R0GK/IzANnroWitEESyVrRJFBDSSFpKPnzvMZgrVwUZe6XtYEWqG7j6LPoF
 kbB+lu5iONl1eGKDdcJ8q3Y5NJW77hfVnDiSXCrds8qe0GnnEc+WXhQRyVHdg5UYpHg14lCm66M
 wUZQPTW2mft/0rsb/VM+2+r9zIkjMs4Phoj7PnTFpm/zWokyGS+bqwBNzQ+YHHwNPifVx47Nu0z
 Vy37Kvuh53r3x8X9xKNhNnj9lkD/TidZJeFqQZS1ebQIX+vptyoIPA12JW4xnd51mhTUwslOXpC
 lalnA/E4cXhEzZOZhsqyGFZ32jaB16dyy394fNBCSmNUevm3cS4D3ARwzr5BFrdddDa0PQad639
 aw4ekfAlbcpwbKGhWxg==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a634cda cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=l6FLTy858EcHa7FfVjsA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 6LbpNExQ5-482WBozR-Yi8EzyJWlj6OA
X-Proofpoint-ORIG-GUID: 6LbpNExQ5-482WBozR-Yi8EzyJWlj6OA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240104

On Wed, Jul 15, 2026 at 07:39:55PM +0530, Vishnu Reddy wrote:
> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
> is a new generation of video IP that introduces a dual-core architecture.
> The second core brings its own power domain, clocks, and reset lines,
> requiring additional power domains and clocks in the power sequence.
> The current maxItems constraints for clocks and power-domains in the
> common venus schema were sized for platforms available at the time of
> authoring. The glymur platform introduces a dual core architecture
> that requires more clocks and power domains, exceeding these limits.
> Raise maxItems for clocks, clock-names, power-domains and
> power-domain-names to accommodate the glymur platform.
> The glymur platform-specific schema have fixed constraints for these
> properties, so the common schema only acts as an upper bound.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,glymur-iris.yaml           | 255 +++++++++++++++++++++
>  .../bindings/media/qcom,venus-common.yaml          |   8 +-
>  2 files changed, 259 insertions(+), 4 deletions(-)
> 
> +
> +  firmware:

video-firmware. Please follow the prior art that existed for venus.

> +    type: object
> +    description:
> +      Context bank for the VPU firmware processing domain.
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +    additionalProperties: false
> +

-- 
With best wishes
Dmitry
