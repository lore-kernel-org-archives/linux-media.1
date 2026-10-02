Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3B543149D
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 16:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957008; cv=none; b=mDsw+C42DW4E641Ntx6IY0r20H6myWK/nXl5faCG4qU+4LUEij9J/dletKArdKIO39ejjURg9LTpz6rZW6aHjtX5zDoxohT+fRKcozXeiF5ioG+elO1s3rHMDTDx5OcQhjvbXxjeG4N5lxicuUXcT9OxOzHFB1WDkDhNzDnK39I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957008; c=relaxed/simple;
	bh=5R2WG2zuzdSzT5XoOv8B9SYH83ZjxW6UiJ7HMT+qpyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SF3QACtyCE609k4sD4T7FQHSK0qVw3zvN5RNAp/b0KZNr9HgeCgSvokBnhbVGJe+Udv9qhU5i9eMb66x0Ufz+U8vpxL6XMJR4y6sSLKmNnMD1OyyHMrDGQZ0Xg9KM52ThJ+ZVKOKOpzFVjUA1CwNenHGcVlzAx+TvaDrGOS2jnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eltp8QJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EtFdsch1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eltp8QJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EtFdsch1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGmGG2823045
	for <linux-media@vger.kernel.org>; Fri, 2 Oct 2026 16:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nH3qF1j8aNiagObAJdwRA6oD
	RFUOLGKyMVWPWNBWPpY=; b=Eltp8QJEnKJpzba1zGil6Wiz7FPCbDadNsdwwTIH
	mqTqa6060VTkMipW2uMOLWOeEM3t5hCSod86knNT8P6E/6Dah5zGzqLVFMwJ1Adk
	llPGw+mBah7kBsfPjblrukQ2ZGL5i1KTdvGbu3ZNpzN4w/mgAQt0X8qj8RkU9MYX
	FtWMAGssCoWv4LCw1DWhpYO2ZO6PVCW2Cf6kZ/cYqapL2KcauXPD91QA0Lfbnr0W
	dED236+MR/c1hyCM777wbJTaH28BBHnrraifZ49eM+Gwk39R++qE+EbPcpI/OvkB
	EHwarEfoURdGxyNPwU68idzDZ9uEUTfOYBNjjxbgNuTm9A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h26bp26fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 16:03:26 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf1e774404so523677137.0
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 09:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790957005; x=1791561805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nH3qF1j8aNiagObAJdwRA6oDRFUOLGKyMVWPWNBWPpY=;
        b=EtFdsch1d23t3doGl2+lEjazn10Ct1ob7kg46RZsM0ndZ/uXhmaT0Yn2Rz33pCRIT/
         LN/5MQL/M+B1h13QiaCJcwNlW32xRBg6oqJtUpXSm5IDKsHFRlAe5iOMGkQuJTNLtxu9
         guMhrKj0Dw+cFnhNGS99yJ+oy0y7DdwEAenYJs19eZu98O76vM97+8gAWCLOyo9hoDSk
         AtbxrkENJAsC2wVa4pAI4YYfmrQSCXNs7ebsOvFJctwSlyTeuzQu0y7rzVZdQUnjCDUR
         NGWnxB1pYWLNxfhTpTYaWiPEisgRLHQBvj4MUXqQZeWiZxc6UmRE03P4ZhVQUDFEmqis
         QxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957005; x=1791561805;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nH3qF1j8aNiagObAJdwRA6oDRFUOLGKyMVWPWNBWPpY=;
        b=x/fSQ9FhP7B8omuqswgFiXhVd6j8TX6ARk1bGDrj0iGkMcQSC69+GiF0ujv6WnocdO
         kV755MWRNsvFIcMrNcPw6va8rCxlSL3ax8Z1XRAWMMvVp434V2ynZVmQ06i6Eo/t2EGu
         rFlUwHWpxFwsMvUWWbu3onmn+wT/InEThPag4taQCI4pDCCd999ZvSOrKFQMspeYzW8u
         abNrOFcDXhSo5JUUaWsNkePID6HyspnWtgXIA3bwlRqtYoJX0eMWIlSyEj5xVLzbknry
         qhJr1lwhtVttssh9a0vPaoEdEhtG5+C64Brt15drprCUmkZQr0vzwAgFsC863m7RhcG0
         5EHQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6SaPgs3a4J4avt3Pvw2fbyhMHYJyvwXBll65vCN21kJzpuse1a894ibqiQLRhwVvSPVEKCu3QMxa0hA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLTNXKWRSgqjiU9J/9gwkV4MCDGbaXQSwUMlYxFAuowLvYsuSoK
	X29AiuZI9i/nIPj5RLyO5Gf7CcVOzyS6y6uVFjO56Y0y8kP/C68itv9uO+roIZyx9cc/dIj7Lqm
	/H6j+WpEWnAhZ2UqTD68N+CPJvXT7u44fpHv5VBcK1TBbqBLWRObdrzWvd/eGB1fw6Q==
X-Gm-Gg: AYBFou0FtqciMe6UFe5MqzNhL5Pk3dQ46jXsj0W2+Cn2mFTqL13UpvtqSP2Biw8s1R9
	lXYo53PS+4S9QROF4RvTe6L662wrsHdX47W0kRQoJDD02oALeHpL30XqWd94Nbm/Kjw0WmevV0x
	bBZJzImay0p03NDab3d9m5LJj+xaEAirHlKzltwfdkWpZ/U+nTHNIIVFkRTDsun50Be1ZI7Op0X
	PTz+rl8fbwvF+N8c3xZEOpShnIvKYYKIsl82RdnX+OtUfKCcdxmoVYlyrMY2A2T6v0Kf9OZ5EgW
	5V+2WrMZaYdIihyuBGDxc9jRbBbrreU5P+qrtHAZl6TnCMXVs0LoFULYdMerkg0NNCXx6GHLq/5
	tDsfiI+SUOuMlSxU/T5X8zFRWSHsZ0gKEvNNVBZeY0QlXwfrdie5WDkF1Wn2qWsH23MssnmGr7V
	6hkv5XzilJ/sEs
X-Received: by 2002:a05:6102:d8e:b0:7b2:cd8c:2b1f with SMTP id ada2fe7eead31-7c0f2108082mr687165137.3.1790957005017;
        Fri, 02 Oct 2026 09:03:25 -0700 (PDT)
X-Received: by 2002:a05:6102:d8e:b0:7b2:cd8c:2b1f with SMTP id ada2fe7eead31-7c0f2108082mr687142137.3.1790957004479;
        Fri, 02 Oct 2026 09:03:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7bf157sm830664e87.83.2026.10.02.09.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:03:22 -0700 (PDT)
Date: Fri, 2 Oct 2026 19:03:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: hawi: enable iris on mtp board
Message-ID: <updpxvguckjxn3qp3xzu7e4xah7h6sodoufp5m57imtzjeo3mq@yrqxib3jbi55>
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
 <20260923-add_iris_for_hawi-v2-7-016ec3d24b79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-add_iris_for_hawi-v2-7-016ec3d24b79@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OMqyTiaB c=1 sm=1 tr=0 ts=6abfd5ce cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=AG5diU-uafisgQmFzkcA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 5hHIWRff5Lusv6gzf_Mb8EblX2GqkD5n
X-Proofpoint-ORIG-GUID: 5hHIWRff5Lusv6gzf_Mb8EblX2GqkD5n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MyBTYWx0ZWRfX3NN74WLqPFjM
 CwfSqfUncEf+5ShXfoNjEDEmOh3XJdigd3hQEtRItUD4o7yqn9QfXo9DWx0H3Ab4Dnid2GeTYov
 n0A7dS5qyHSkJA4Yxba70SRgajg0c0o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MyBTYWx0ZWRfX3BG9pFfI8ygF
 S3XZRSHXkpLcS7p/f+HM3r/U/f8SPPdu3ZAaZK0efnpQlzyVew6TsSaTdohEKLUOWLZbDM/aF2W
 5ZAMrsv8msXa9UcQWwGg/wbEVur5SYn2yutBMMNkNbKULOriyKypIOKazGWbHYslM2y1uKf/yfj
 v5STFOuVPHmqcF8WnHZg8r7Zbwd6e8BwieTXHhEydCxwB2cc8jDMkp5ghFnhjr5pkwk0Zh7f1Db
 KliG/92RI/R9BtG0dvgIRbf2JfffpEplW6pr5UrxVsLAidgnYcUwSTexvb4Ax1/h1hUhUOqkn+z
 weTemCsizY48PNLpLrjWnfBlMQfMLMLZ18GFcUsOfxpfxLPwOoSx32aMfKhoSv/r5aPl4bh4yG2
 rDKeQb5pRh3vtdMM7nBRbEOTO9GCXjv3f05FyhlEp6ImoMXgUYo31kh+xCzvEJTdIhH/iqERsu6
 h/RkIfHOCPf9xXwmyJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020063

On Wed, Sep 23, 2026 at 11:27:57AM +0800, Wangao Wang wrote:
> Enable the iris video codec on the hawi MTP reference board.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hawi-mtp.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
> index 7709582491f9d426886a6afced6d3706b629e620..9b8616221b9c0d227f2ec97363bd4c076d8dc247 100644
> --- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
> @@ -781,6 +781,10 @@ vreg_l7n_3p3: ldo7 {
>  	};
>  };
>  
> +&iris {
> +	status = "okay";

Please mention the firmware-name here. It might seem redundant, but it
will help userspace utils.

> +};
> +
>  &pcie0 {
>  	status = "okay";
>  };
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
