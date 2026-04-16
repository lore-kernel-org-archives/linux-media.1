Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB373E2750
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352653; cv=none; b=Qf/vUk5ID3RxLhjnKxmYUlDICXhmhPZG8fXMEiZOHZrIpsryNMDNL6vuxKW/sNpznW2mVBN7CI3PVznWdpiyCTdnN0Q95qU18a2+GRA87KEVf6Ucu1k3vtGpO5xOzML5JwPNrJp/bQbhJsbRGwP/Pe/vrARIM2FejR+BTyX/MP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352653; c=relaxed/simple;
	bh=OoDxQ6JnCdkvOIF3hQyinUzkThw8zBb3mtjvgZ2UdeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ImNZt+gOoIUi755Pc+rY7hzX7CtqvEjV3LwhLFaxpeS+NYcU9SwaGZtSlKCOFtGRft2XaSD3egi3kY2EzZvujTLe2CgOnrUfO4fXsZnIifkom8JCSmTtdvzY1pzpVSa+HP65+xQTHP238tuE+3pPD9fvacu5G3LJT+vLzLD9oIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cyiw650j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFa7woHw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cyiw650j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFa7woHw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GBp6AR1668258
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 15:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	alGNKkLw21+BrqlqmkPplSlaervhuZpi/jOw7KRz/LE=; b=Cyiw650jP1GvuZns
	XT2bm1qDSlwzCTgSyeUxpj0iSWM+xmATXjOEN2tq5YX6sDQvk3ccCsjWRhy7Jkxl
	dPo1WhG9TnHjt0o8vvLE42SY5m7WkyTaOnckdFWmfZLlYj24x4VJOuoWgi5UHWly
	NkXJactehdyih9M4G7hZOH0RImh4lJo5XvGSyEtkzShm6y5wX5Qq33Y/wmeKoHo3
	mEc96UxRtKC86B7yd8M9XLRwTpDCKbglUKXctifyp4/jj579uauva1oyzrtPrUbi
	EbSVnJLCkK8kSstuTyY8YTRbG/Y+aR6JsSyJoTKICn2cqkK3xNWTxtN/XmOJnjDg
	HrEuDQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtd91wq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 15:17:25 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6826de8e284so1466150eaf.0
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 08:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776352644; x=1776957444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alGNKkLw21+BrqlqmkPplSlaervhuZpi/jOw7KRz/LE=;
        b=MFa7woHwYGxeFHnhCebOngApdmzxgicc4v3jXPQyhwoKayqhWL9ON7I09tiIukrjF1
         JlVC3rkno9sQFab03s4AlgpkCYlgifmTimdK6aemjSzk6XM3tTKPkBEv12eReJX7YzR/
         wRBP5tTxLVjxfZlde9M0d2VmWD2PNnWYfZI7kRtXOa2KanupoC+SZw1y7lKDtbqOvj6g
         ESZzI8hem6CBjRKdblXO/Hnw+syec1p3dvga4MVcFEfkqc2VvpFbuYtcgTH3YdmXOKnO
         beM1Qq3/toeTseRA17IY5M7Vcr33DJddBs09SV1ndI4zcnRsBAC0j8moexzM4yNw+sX9
         mbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352644; x=1776957444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alGNKkLw21+BrqlqmkPplSlaervhuZpi/jOw7KRz/LE=;
        b=oQ6gms+kIQ9dAyRV0UoUEnZLVBCncr0TXNpgpToZ7mLkMVYURc70YIGmEFFL+HSBA+
         KfVgCyHiy5ECcLl1LzU73eQVxJP+cG+VJWat2r7zcJ9xVA+Ea5G5L5V17ovhkLW1VGmA
         MSXVBIZT05By8msoGXpcyqytfEXjVGS+u7f7ptmwgBfFU3VQtD0DOr812Rov+tdofIxC
         UGeZtUOKoV7B8MCcYzPlYOI29uZUHCFhIhCTLhw7E6bAEG9Q3JNNrtJ/ENc/Ulu6MyVU
         N5OUCQkzreg8fGPdGI58BDBFiUbaoaykVcZayWBb0IpU05dbWNOYyeKWAwwYbIPArxpr
         2B+w==
X-Gm-Message-State: AOJu0YywVINtbMK9b8HB277FmPryqJjoJ8WcbExESYO+x9aMKA4UIdIt
	kwx1yPAj6BTx2A/QtjBDPZnltxnvpUFPejU0YpYbZgIlCxgxU1CL+IwolTFIi3ouhDHBdi4G/qI
	RM5gxKQMYsgei8Wv9gTdZJJihlhJRiarywRCpHTUdxMPWNoUYrW523v2GkLYcxPz2QQ==
X-Gm-Gg: AeBDievspqEPyBWh8VVpVR4VMPzt5a8oxeDJcG0RlXF5zAhM0ywZW/2EVKdS76zxQP+
	ffOjw3s/kPgvYRm4HAEDqCiYYQkUfSDN6ioW6BJgDDtlJWtwWZMW5QbYtq6RiLFbSkG/pArxpjh
	0MJi0QGsiRhhtJm3aysU0kdY0lMo/6o2Ys6eihPsh7sJt5cNYRpQrMxTqtgVM+ygfu/rFwxEIoD
	nUgVcXPtl9Lo09HscYWfAsBjdZGLGT1Bh6KPcM+yZZ3q3kR5dWG+D6IeNri/Xwgb0tkZBqzMdvk
	Xte0lCqF1bw236hk7sRhIBkQQ4pOEhrxgEsxsWvsW1+dIEoFeuvjQ/rIn946kC4fN/+rLkKFBKb
	LnApGAXX6xD7hZBwZAUQ5fOf5QGqgE80gYUyTW8bkp1efGUpmfPvP94RYTIfxIfnSoQ6mmnF6Us
	gGz9F8AAzsCKF6qg==
X-Received: by 2002:a05:6808:2225:b0:459:f0c5:781d with SMTP id 5614622812f47-4798903ba3dmr901510b6e.5.1776352644398;
        Thu, 16 Apr 2026 08:17:24 -0700 (PDT)
X-Received: by 2002:a05:6808:2225:b0:459:f0c5:781d with SMTP id 5614622812f47-4798903ba3dmr901486b6e.5.1776352643869;
        Thu, 16 Apr 2026 08:17:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba299f51c01sm93170766b.4.2026.04.16.08.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:17:22 -0700 (PDT)
Message-ID: <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:17:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE0NCBTYWx0ZWRfXypzXdfcMJ2JI
 cBSQ30eS5vRD3RfUMvV1Ovm2Ivmp6AVfFytbvgMom44juSopohhOScDDXi91gR4aOAPsbWPJR1Y
 IqtIgF9jxmhcDknxsuyjG0K/EIz25xL3hF6x7lf745fuAVjZa+oFqgvcE4bXJDQsig5BEkpZgnE
 sMI9PGiiv6AyzqM3NIBycy4HkNOQDnMMUzrMpyhZamZtHzSOkCGU8OQiL85FurdkaF9RgsPvv7y
 36BduprTe2o7fIwVYKIkmFTnDwX+Q+XapX+h07g0DslhVx+fBzxRj1DkCaBq7m9Cr9PXqiujH3X
 KxzYShat8jenu0jee145b+rB6AaVgMSnpikK8eVgEkth2NnXH2Skr4yC8w8bCXWHTFP4d80X0OB
 3sY/QSSslNgjYtNUUu5FNm3tWBIqUC45k+q1MIH39gBerheBbqvaplsYPCP6DakXz9izo8AlFmJ
 SxmjDonLbj4Ltkw/UpA==
X-Authority-Analysis: v=2.4 cv=avuCzyZV c=1 sm=1 tr=0 ts=69e0fd85 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=sGea1UAM9DjOSmaL17QA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: C57rN8GGncnnX7J3lDnIcclGUb4q9bKt
X-Proofpoint-ORIG-GUID: C57rN8GGncnnX7J3lDnIcclGUb4q9bKt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160144

On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> index 90e966242720..231a3e9c1929 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> @@ -267,6 +267,14 @@ &usb_hs_phy {
>  	extcon = <&usb_id>;
>  };
>  
> +&venus {
> +	status = "okay";

You need a firmware path here

Konrad
