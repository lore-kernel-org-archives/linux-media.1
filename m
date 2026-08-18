Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9173845A6
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 07:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787036676; cv=none; b=IcocoWk3Mp+SnFDGhUwpyk0D3TCtT2Ercak1+AynwIApBqJjWwy0luQyAX8Q+RiuvzN19sW1UlvDCUcosq9p+rjXsOXrkcyDFv6UZIEJLP5xq4fUqsg07w8N0YOLAKIsUJSyZRgIQAyjcj79hA8vOB182xcYwnuLdB6xRz4jYWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787036676; c=relaxed/simple;
	bh=ThRsgajCuLLz7ale0e/tNKwOYjzS8xUMXExnnZBkfnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NekY+a8l9wLopJu44dOmFUHGBa64YQmXfM2hdkQ2EuV3LgHq8nKc0A98KjQCpoZax1WXZAxYRwVNDJHSwqjCGe/XHWJTTU6xRqQt8Z39KHu4z7shOhXha8Iok5nertuCAJhwZWPShELEHbfKlPZYb9/P46HHww+VwgCWSuA4BOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DyEexKNb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jz0ZNM1I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DyEexKNb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jz0ZNM1I"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I73SUo173139
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 07:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EwT+2J3bGB7Z6ksti2cShfP/
	roINGoif1NSZ5f9uv8Q=; b=DyEexKNbkjtaGslxttBMhkoil9u1z4EZBZ30A8DT
	7xUzf2DSfXbAYjL+ON7E3VzOyJVfxvfMHWjBwE9CS+uXkyqcDbojiAesOm8teIVu
	HyNUMkXY69YQTbM+UwvH8iFpeMNeH4fCqPZEtrgJ6GHUSZgtS3XTRsVy8zBTHxy/
	mT9Z9rrT5G+dUna4RJBMbe0nnpuBF35BoCkegG48PLBQD/xvXsRDOiZT/P9oPqtt
	rjFYkqQZGyDTj4iwSqyOQ7ncm9CQMxfDBDPJxg83c1FMDUuikHho8/mjROhRim66
	kdUAvxQkvSLN7mzfiRPn1f4ImZBEaXyRsHSxEsF41YIG6Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqts22d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 07:04:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so724835985a.0
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 00:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787036673; x=1787641473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EwT+2J3bGB7Z6ksti2cShfP/roINGoif1NSZ5f9uv8Q=;
        b=Jz0ZNM1Iwq9K0oFYgsTD6tlTCF9tLY9GXDSaK3GrOlD43mAIi2EKFFMdqJ7GhJsvPd
         E3oON7bTajC71u1UWCvqpUHS8Q0dcCkmnEwal1ALZ1VVdkJAvX9egGHHUlubtmGe6ENo
         0HetQMQzwW3o3O3wOo4NTR2bLESFum8rCdGNZyN8gofHK/5mcNe1v7QS0hLZxrUpDi4Z
         MNiHQ5Pv88rfDYigwvbE5faC9FzOBJf9DAWi8LtYZpHaOa6T8v0VMdOV9Bgdap1r5Jn5
         kmvBAaVhS5tFWc4bcC2BknRaaS4bJSU5rSHlTm0cxYjQhMYPPa20D6iyJgaL6ADGbi72
         EZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787036673; x=1787641473;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwT+2J3bGB7Z6ksti2cShfP/roINGoif1NSZ5f9uv8Q=;
        b=q8hXRP052RWznAPzmnnkm6q6eRPYjKhJyA3Vb+6pT1dNzTfZcjmaPGrReXEE67jMYX
         qEsUhs8T0SUlcQRy744HMB/IInf705NNynyE+pK+OdzFCcb8yWiFdDEt6aED52ZPkxX8
         1xa810fQ/6gOTujeow+S4rI/TB8/fEHXxyCKqe2rUyUhuBIEUyk83kksOpcgP6a8My6J
         l0e+mNYkhyFk6H35PIgqKNbxz+05pyq3loL6lHbkbHMa5F52RMbsrwhfglgd8MCRI7z7
         PUJ0oGja1lX3BBBHymO/ViIEUQvICsHUXojUt87Ikc9vb8y+tHbzv7LceLMNHCtPxckR
         ib5w==
X-Forwarded-Encrypted: i=1; AHgh+Rpm2VmJWoZSHYYLXtLyo1Q4kKnEyYfyyIHH/lfuyQ9zaKqMxItVN4MNGIru95fhf3b3gD7hZOXR2tHybw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5mY+7VnKAbAOUuM55KC+LGO3g11wOoSErz6vQ5osMHVkbEZzr
	S50vivDtoddDcis421yK053fQRVFhDaw85jgpiDqoZeh/73CR/2WNWw/eS06HNHQMTu50cSfth+
	r1Exu1zEdr4rvpRyMhNiKF6s41iVg10kj/aRXODzHTUeAQ0h0PJQaa6OYo9czXV7AgA==
X-Gm-Gg: AR+sD12ClrhZCoyhSASoqF7EYeCwBSVlG46J8DvANQTRCedqQ07vbVI1rC0o3Z8X8++
	jBWSw5TVojSPlwr/zsW4hVRyVYVmVljCbX/T4eykzm9gFkfhcikQNEnpqcDmVeRHwVGpa65Idpw
	6+NDuUk1khOeKycrmHQ73h7sPsucd56r/fmXjzRtEAJqu6YLpyoIYw7Pa1E7n2S3TKY++4975uj
	SMrh2CkNaZk8/UZMwq7GKVSFYdnh/b4ZDE9+kg+mLbtF+e5R4ao3YAyTKcl3rLu4PF2BAE+9N5z
	EQHn16Zyl8VHytS+114v+wv/GWvNLB3heNFOdkbuelGK/SJ3+VDCuh8SZjKVv90v5IcDOi1JBpD
	SVO8PYF5MB9erbXFhqU+EOaAEXXYRzeFVZO5MV1OIbr5CsECh+cdxpdBH1g1NQLRCLbbGNZg9xR
	4u7zigbKBG2JQb
X-Received: by 2002:a05:620a:1d04:b0:92e:e7e0:ea45 with SMTP id af79cd13be357-936d2345575mr3266877785a.47.1787036673080;
        Tue, 18 Aug 2026 00:04:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1d04:b0:92e:e7e0:ea45 with SMTP id af79cd13be357-936d2345575mr3266874385a.47.1787036672695;
        Tue, 18 Aug 2026 00:04:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46d00b86esm978056e87.63.2026.08.18.00.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 00:04:31 -0700 (PDT)
Date: Tue, 18 Aug 2026 10:04:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] media: venus: Fix iova allocation from restrict
 region
Message-ID: <hzu33hharafxhfdnr5tr23ti2tmtjhls3iwbvmtfllwcv232m5@nvxemt5ijf4n>
References: <20260812-reserve_iova_in_driver-v1-0-ed62f801275c@oss.qualcomm.com>
 <20260812-reserve_iova_in_driver-v1-2-ed62f801275c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-reserve_iova_in_driver-v1-2-ed62f801275c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA1MSBTYWx0ZWRfX5MmwMiW4CX1e
 aBkFZPyA2dksgtUy3VyMh1jcJaXBSY0l0OWVrbT7tROCluxvs5UyPg1ofYF1p+xA5mK5p3w7mXX
 VoNnHZQMhVdYvDk8DMwHfNmu3P/RMXs=
X-Proofpoint-ORIG-GUID: bqlJ-kSJHbBvfhvr44-H_V_ybyG8k4Er
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a840401 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=4BULcDCo1EIeXDFKsSoA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: bqlJ-kSJHbBvfhvr44-H_V_ybyG8k4Er
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA1MSBTYWx0ZWRfX4Hq6DEkcYghD
 /YpM70+aJk8vsX7GZkIYgNDTmh7UR8pTyzORmuPBB+nrO9UCp+GdSFH9j4sjtvgGObuDzKbhkpx
 Fdmb5GtqJTFkzFtF70WwjnQbRFbzAh38ON6lDghesLSHHFa7apHAu0uKJrbg66T0bYXG11yPgxO
 FuRuZJn6cQ/sgKRceS0D4IqxO1HP92pndFisa5LRDOCnSrHiDgh8A6ZrV9cL8u2wHXuw+pLBcCU
 9VviXBy2sHT+vj1eTA+y2ZaDCduEx/VdErMKpOFua79dY4YTH0qIMVmSzxZO2s2JjQmy2rQR5hz
 VQuYOZF3Gwic0Y0JHjwsYX/Y4H2CDIEWYDwZYUXlpYy/flWOHsHLdD9HSL0zcriL9vjoChiykRd
 7P+kXmdpgTKA1SrQ0bpBphlJ3jhZ+sDPKFAnYIm7WtKNRnEq34xSTCrXd+qqhD+daM5FamB79dC
 9wv7taECohroCQ6du1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180051

On Wed, Aug 12, 2026 at 04:25:59PM +0530, Vishnu Reddy wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+

Does this split apply to all generations of Venus? We support MSM8916,
for example. There has been work to enable MSM8974.

-- 
With best wishes
Dmitry
