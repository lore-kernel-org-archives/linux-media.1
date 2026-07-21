Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2741B3B47DF
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 20:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784665861; cv=none; b=a+3ViTnl6TF44Gs4U7nRaHPj/JOpNmrVOiW7qM69+mJH6ScbKUt46+a9vP3qBXa0o/YIH6KV4FEaOV0QaKvY0wrICW7QmmN3eq4VpV9tuwYQixMTGhN63iGQaWg5+m4ZsoQY6rBAx1Nj2X4BQkcHbSnowlovebwgxwUcwQ4+esw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784665861; c=relaxed/simple;
	bh=lvPIUXGIpoD0xdJ4d2vEPOy2+3Mq17ewQ2XUHFf3Zi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4GcW7BLUKmODmhxuMllFbgt7Sy7zuDrhac731loMmp0aOty0fkDLKhSCW4fcFb3ZfMwPpamKj5snticBtDJF7DKm49IV7CuvUfc5iVGLNBGyTAuacb+5W3X5x+HZhVTaHbNjaHhQQBmKZeeHXKnOE/YwROnbahXZOtck50Eq20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EI+tEouW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpV8xgP5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EI+tEouW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bpV8xgP5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2iiZ2449271
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 20:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SLL2gsqOQk0Xx1WlAHNqCLgB
	9g8VgdqsEj7V08KM8Lc=; b=EI+tEouWg/NStJL4RRi64ESClVJDNwhYaric4Qi/
	spdRPssiK0vIAqHXh0YUfcDaYE8xrQ32zzx4fqzPG00WCrOmcKJZZbY0W/sjLeq7
	GMOlYwuPjHWB08pL7h8DMh+UwYTPU+Q9GtRz4T2JlqwujdbpMO8YZqr4pW2WjCv1
	MOmkZ/0+ixh5PqMqVG4OWBKDynnZ4rRnhnKMGxVgYopfzVg9Ad4IKI5dWnPFx0RX
	Fw+H9a3TyGXl8Zz3mOvNcKPbvBNnoglGpaBNf0Rui2G2UJyvB1O2sgP0rQEeORYT
	TXBl9t8Mi/A9556vJaIoJj5i1ztvb19vBvjTLzG6E+spUA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj68630p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 20:30:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ec3314f65fso237663926d6.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 13:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784665858; x=1785270658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SLL2gsqOQk0Xx1WlAHNqCLgB9g8VgdqsEj7V08KM8Lc=;
        b=bpV8xgP5Aql89LqV3Gj4ofQ6ttigX37IdrXLbax44spUI22+IgKLAC2OnYn1p0LNAg
         yW+oiBnEmussBpiXVKchUA2yjfZ/XCJrZgbqGguN+tkMMoxPI6uMG/m5flJLGSWsXCv8
         IIOCheyUBYHzbFqaFSFmPAseu6UV7rQc6XfE0BzFDdpWtTkZe2kHbCl0nTVOF5apW/A4
         4mETTnZUEkQeOCaa8I3kuqnitIWwVYxlfiArHwBk9gkOV2NPVCDAznUgfjcwkvVd3thm
         j4psHsBhZnkwtLkqWvPpZr9v+AyBpPN5YCbL/vhj6bicO2UvTUsqOTYKI1DaXcHLVoP6
         xI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784665858; x=1785270658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SLL2gsqOQk0Xx1WlAHNqCLgB9g8VgdqsEj7V08KM8Lc=;
        b=QDIQGuRV7pRdZ6B1sUCTc7XkGkaIJk4gB77j449pNk3dXbvpCivncPpjXvWjxA+hM3
         VVepc7Y6FcFgdP7hEKfOYH2Bd3LVpWfE+GRpyitDGMrFjcKTKeD619mgb+Hr7JlH+Apl
         59LNGfvyN23b2v+X0NDMYaEgYFnlzMmNFY4l2L+CwqrrzWCXJD8J2HdAc9B2IXyVGi82
         nT6U8/FQGGT96WcYnzTUIOd98X5CKIjGjyZBvw1uvvaCq0B/3rfVFA3lTP0fmrAruGOF
         Nocg1JuMU4OPntizkfGlf6zAw8Gt85EP/B98X6ecz8F3pSfUynR9zpq/+sQbtuWpWUUX
         HefA==
X-Forwarded-Encrypted: i=1; AHgh+Rrw8NHJnBy+u2zdnW2OJ+r/NL28Huk9Ows+bFZw4NsmdBlcsKYj633rz+snnwiqgLA6eUTOHmOI5KG+jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW6v0QFkqpXlJ8F8oQSmTChOY9a95vt1DReL/O+5X6JZr/ug8v
	rXNtZ5rxTy+1V3GeT2h3CjVrs4qK+YCT0T8QrODlTUo9S+tRxDI1iUHTH1H7fZg5PFYBFnU0zLM
	Rw/jVRtKsNWNmhXaBNxY2WC8+WF2TSHVo0wzU8MFQ3O4k+0pUv6J8l/7SgVHwDh2orA==
X-Gm-Gg: AfdE7ckx8Zaa9EEzx855aQmWqvlRhpDPteV+1et2QUAqht1ijZDEt6E8UkkR0LsMjW3
	9JuHywQUUOfUk0wtDDXQ/M/OQgN/EI/kKeo0MNnYDHUbudPx8RJ1M5v/nwLuW+0yCQBqbCY1Uwi
	Lp+eiOM5hb4pA22YGOOff8K62LkefPSDyCCkuPZifBA0musMM3Uz2JHXVjRsMVoDTJp9DxQSWEU
	51ZVlCDhb0fWMN9/NjC7N1++7xgRtmdCOHjwimUujOcPAZShC7523tBgU1qqJPhlZiyIWRetwS/
	x4yjsGSJoQpHjTKnv4Ln8H4YmATm/Qsp77Gx5JHFgsFwUPkyP+Tw5On2Dh2FxTZCxzKGKPRExeT
	SqGzjaq7mF7J8XL/M0WyAludgkyhGj+tec1HtWjYcokcbqeWohEYIIdHSMEjo30qaqC7OojhgkO
	9KnGa7+OMRC19rhA==
X-Received: by 2002:a05:622a:1456:b0:51f:798:cf16 with SMTP id d75a77b69052e-5213e17e44bmr179982241cf.61.1784665858033;
        Tue, 21 Jul 2026 13:30:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1456:b0:51f:798:cf16 with SMTP id d75a77b69052e-5213e17e44bmr179981751cf.61.1784665857577;
        Tue, 21 Jul 2026 13:30:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c09esm108437e87.2.2026.07.21.13.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:30:56 -0700 (PDT)
Date: Tue, 21 Jul 2026 23:30:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v7 15/18] media: iris: Introduce buffer size calculations
 for AR50LT
Message-ID: <4yfgkaudmtwialwnne7ujx4ndfjvdn243l5mb3wz56ltqggln6@3ody6y5eyxfu>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-15-76af9dd4d1f6@oss.qualcomm.com>
 <b5c4f8d5-25c3-4e84-bba2-ab30e4e247ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5c4f8d5-25c3-4e84-bba2-ab30e4e247ab@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIxMSBTYWx0ZWRfX4CTmMz0hYOxX
 d6jPFcAKdq/Fp+QIf4ybdorIKJeYwea6KPseHvhTCj76gQh9Qv99N9GJi5EHOao2CVH1Rf+IpTs
 qFc8ixoFHpvAlUpxD3WXbX+LfzPmQio=
X-Proofpoint-ORIG-GUID: ILR1JobBNb-iTJVA1oO6XSWuizY5TPWi
X-Proofpoint-GUID: ILR1JobBNb-iTJVA1oO6XSWuizY5TPWi
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5fd702 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=_5KediVJeGQc1CAnrV0A:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIxMSBTYWx0ZWRfX+IopJMlZ+Pzo
 m3l7Rf9XQaBBRjG99U9p6Ha2OdJ52lLxpCOZj558eFK4YPbh1KJlTGHwdWHbxufbBfm/C85xgGt
 cN1wc4I9OwrE5sof4WbzH4DuITGUZg45SkGwjAZp+qB1IeueRgzAwMHzOwFtmhYSNKUchioMN2F
 VNLSdFvWNzXXxc/JKFBcShC4GuFeGu11J3ZQRZYDeDnm1UGacWHYYuGDMhDYtfjdbV/7gcNzlVQ
 rTGGoCZKF6QC2AbdD6AOlpafbo1zlMXSXDMcKAyGPRFnQyoN24nVrwhmieFreKSvNoPrpkj1H9l
 njMUoZi7kjet/e6b31k5yMrTN3VDLZCnaVPR4tt/YUhQLolzYhvi+Ljrjie1WIaJQLRtb3D5rB7
 DJNgRhge+fZgw4CKg4MjCHtbizzmeQzEdPifzQHyGr6dU2Ye/Uaxjhm2oLfjRWtPmpxEnb+o5Tf
 C6fX1i0JUEOLHuXNNqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210211

On Tue, Jul 21, 2026 at 09:00:11PM +0530, Vikash Garodia wrote:
> 
> On 7/9/2026 7:12 PM, Dmitry Baryshkov wrote:
> > From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > 
> > Introduces AR50LT  buffer size calculation for both encoder and
> > decoder. Reuse the buffer size calculation which are common, while
> > adding the AR50LT specific ones separately.
> > 
> > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 365 +++++++++++++++++++++
> >   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  37 +++
> >   2 files changed, 402 insertions(+)
> > 
> > +static inline
> > +u32 hfi_buffer_line_h265d_ar50lt(u32 frame_width, u32 frame_height)
> > +{
> > +	u32 size;
> > +
> > +	size = ALIGN(size_h265d_lb_fe_top_data_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) +
> > +		ALIGN(size_h265d_lb_fe_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> > +		ALIGN(size_h265d_lb_fe_left_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> > +		ALIGN(size_h265d_lb_se_left_ctrl_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) +
> > +		ALIGN(size_h265d_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> > +		ALIGN(size_h265d_lb_pe_top_data_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) +
> > +		ALIGN(size_h265d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT) +
> > +		ALIGN(size_h265d_lb_vsp_left(frame_width, frame_height), DMA_ALIGNMENT) +
> > +		ALIGN(size_h265d_lb_recon_dma_metadata_wr(frame_width, frame_height), DMA_ALIGNMENT) * 4 +
> 
> WARNING: line length of 106 exceeds 100 columns
> #312: FILE: drivers/media/platform/qcom/iris/iris_vpu_buffer.c:587:
> +               ALIGN(size_h265d_lb_recon_dma_metadata_wr(frame_width,
> frame_height), DMA_ALIGNMENT) * 4 +

I'd prefer to keep it for readability.

> 
> > +		ALIGN(size_h265d_qp(frame_width, frame_height), DMA_ALIGNMENT);
> > +
> > +	return ALIGN(size, DMA_ALIGNMENT);
> > +}
> > +

-- 
With best wishes
Dmitry
