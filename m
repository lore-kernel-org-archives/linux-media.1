Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B0E55D87F
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957791; cv=none; b=fOpZA9f/C7WGn+vO7/gL/XakeeNOQZFVLFry1vSPORtJt/JjeNI7ueS3PxuKHh6NJeXwXjnyCVhTgpVwSLzBpwqggu8D0orsKogXtwuZhIY0lFOF6gqWphiSDI8woHUV59HF4ClU92ONeKuXmx2LeTggjEJjS0iUj/DeHWzjumk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957791; c=relaxed/simple;
	bh=mzTZ/S7+IJMli97Pl3huO2xHKYlikMJEbLwPxRSRxlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MPUPq9fzH8xM6WND4HvUABWT60dDtNZpSAx4UUvd1BWQoJnd0ETXBAyHu4BkoYTDhYK7ratPP8fJ39LBDfIQ0tOhRAIG7whCnZOaMERmAyh+8abm5NJ1+EO5nyGYYsLisOOUng4fzcj/vz6xDw5ABz+8I2nXAOZUUYrM8CUARVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=klN1P6bb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F++XpuLN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="klN1P6bb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F++XpuLN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUJoU2019503
	for <linux-media@vger.kernel.org>; Wed, 9 Sep 2026 12:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I4h5BXcebG+P+PaqL01o6HAlbOlizJ6FcqLSIe5pdf4=; b=klN1P6bbHCPgPlve
	NnwHMq3xl3dQD5vMbBxlHuf2TFWL91G5renrlOXpc33xRUn+HtAXFRdVcLqCSWwh
	Z/MFSGwQF6nKrTjqTR6wBO4OUTeesnETVnqZWZ8ocsCG9OCLynhSHIZ5yYjC28SM
	UWi+Yo9Ye6HjBotQHrUb7TrBuH3hrkJhld5M0xy5dX7F6tNYcwVuuYsJxa5HJKFK
	fAZZPFTPBtXPojBkxIkCrVltGgEQjBjkxpofzSk6hbLA68KO4888N01/QGRmr3LD
	qqY1YPYBAYQGwBTfVbiRI3EIGPE+7NqsiZ4B+M2sYwPNkfOc9+lhd0qqCdhaFHot
	YfYWSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x8cbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 12:43:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93495488976so73745085a.3
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 05:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957788; x=1789562588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4h5BXcebG+P+PaqL01o6HAlbOlizJ6FcqLSIe5pdf4=;
        b=F++XpuLNWRsHLHVLzNlwj1NU6oFi9Xmzi0OuX77PXglFpBigtBuPwqYCvoTxrXDSmm
         Mzd6w8FNfbT+hxaXteEfI2HuPjPTZPCElNg0QilD0RVaVix9x2R4Cotvmy31UKyBItdS
         2gBhWjalHUuOVHvX2OJjYwR/Crhs9YnpWeCVpCTITh3UUSDKfq1GlIgSJjMWGDkQGrMl
         2YiDVf8mFPwCk0vBfSJxcR90TaafqJ3vd7eZ335NCJBfYQhbYJYSipJl7sJUJqBchMKP
         UO20s3g5eqNTL+uz0jBGJ3enxHDA8HZJLYp2YXlzfVAqd7vQ7S4u52QhNhtgwv2rmD8N
         pROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957788; x=1789562588;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4h5BXcebG+P+PaqL01o6HAlbOlizJ6FcqLSIe5pdf4=;
        b=bAm0BeEdlCrPNPcpLeVk8yG6P2KW/ILER3KFzd6bR76v/x3KCh90s6I3L9hQ2pnGjn
         DyQWaOx4Gx0v532yGQeOPHYut/s6agR8VV5hgsGedns7ZY2daNsVPORrlPSF2k/4JyfW
         u3YKpSXRyigPz404wNDCC96x6igKRUFw2iBVUcztDqp0xdWVfhxLKDF6zOe0hAGtw5ER
         dK40mSp0wJKLb2juIJKVKUwZove/rI5d7GkEWDr+L5e2RCQ0K+GYqtYH94RjW00W+7tK
         gHempCDdFH0qdd37kB1uvPjy48PsyWSCFxYGBmy8cHtyD1vSbupq9DCLNRRIzpajFclm
         Im8w==
X-Forwarded-Encrypted: i=1; AKwUvBzJVM2tGCW4nCgOn/rOKy20lDe10nI9BTM7OlrO3b9mYjlgDkE0NYjMbPYdWpFILe+FWVSo+ehH7lP55Q==@vger.kernel.org
X-Gm-Message-State: AFuF++lHoHNmGwbSs5lHGwJFI0Uh632se1qrOKluIWxIHyEFPYUpGNE7
	aKi8jrJVholfEHrMPr3jrch+zz1SOMngcLBTgZFmwlsh3YDspm8apk/TZrf7xpbjhXc73Kqrwen
	0jRsxKOYC4zOwr4ZRHw2d+i2VG/v2S29uiOlozQoZnbLLyNG6+dYB5o3VYkqsO+PqEA==
X-Gm-Gg: AYBFou19uwFfvMQFDW2dLubosMqXCmYWNzL0acjayeRf0IxEnE86pa6Y4wGMvCSCBvW
	8WyoAldxEZg+yi04DrBRkivmPz6HnDdQPDqXwB+M+WWsjphcTz6m6sMpcmZ25vd6GWoR80QUCBQ
	Nrzhy/9xaR83R2aQMU84HqJ1VSkffq0J9pYwBY2F8Xy58lcDrtQ3E4S1qLOsLBglrm+kQJJgYtF
	Mtnp3/6ih2BygabmYgYDgbAniRxeIsrxYWr+cgZSRsGTyfSAb2a8PddQu07rGCH6j05nWjaPiQV
	HpFBd90dRm2fXXklikckOfeXBsA5hcZp+SJNV2VJDLPqzMkheUkP26OMTLq+xEZtFTfVgvoeSlh
	1N5nJWDeJGhMNIddGxtr82g==
X-Received: by 2002:a05:620a:43a3:b0:939:b8da:1242 with SMTP id af79cd13be357-939b8da136dmr1186916585a.0.1788957788124;
        Wed, 09 Sep 2026 05:43:08 -0700 (PDT)
X-Received: by 2002:a05:620a:43a3:b0:939:b8da:1242 with SMTP id af79cd13be357-939b8da136dmr1186912585a.0.1788957787673;
        Wed, 09 Sep 2026 05:43:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68e9679sm6609508a12.20.2026.09.09.05.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:43:06 -0700 (PDT)
Message-ID: <2f950735-91ef-4e43-a5e3-1375585dc43d@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:43:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/13] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-7-067f2ecc4630@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-7-067f2ecc4630@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfXzK57mGt5Spu4
 JcEoHZhigj7sw5SLsGw9uGBt03B171wfwxP+sit9bjs+kKEqz+moXI3lE0CLEvCxUvZiLXdYzOs
 gOvwkRyHTHJZTcNbns2tzE4GOtVTH0M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfX5KGkKLalZKkm
 dvWNw5XnGDwvPQpg/GNRq9Y5yWIMIankH3vNSpuDVo+pG48QQjaBxCHKPlw5n1/FhQcjaCu6Puj
 IQEHiUXKmd8Vh/0cCRb9y9n+w1VQN5B7X1ZZa34ElFESfhrd0P7RIna+lSX7VEMVHsGrj8cWeVs
 0wQxBgb4MDlSx45dZHXOltScTzlZQPx51zNJwwQcLwB2TV12OTH+ulLeovM2tUzCJh4c0pUV7OU
 1c8fXFqomEKsRAPoMUhQqzpPc/6a6INkJnYN5cV+PQ/q5/rcw8Hn9WV/FoC33pwEqDB8yxcMMzL
 a3WF4wqZslaQJxOo/l5lafevbBaCY/Da0Ghv80l0MU3GYKiifmhW2eShBNIlYRxyN9qM2Vqi5OP
 UEykzhgUsvhgG62ldGfn0VOO47eBBDXQsd7wFhZ+dt+DyD5pNLlmbgWn/n/8Ee/ZJfQmPGtjMSN
 8XftDgILqyzQTh3WQrg==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa1545d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=cUeywdAnc2UWe6fb0OEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jV-A4W91gjDEgLvyebYHlQ8Z1nqWnpfb
X-Proofpoint-GUID: jV-A4W91gjDEgLvyebYHlQ8Z1nqWnpfb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090142

On 9/6/26 4:20 PM, Bryan O'Donoghue wrote:
> Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
> connected to CSIPHY4 in four lane mode.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---


[...]

> +&camss {
> +	status = "okay";
> +
> +	ports {
> +		/*
> +		 * port0 => csiphy0
> +		 * port1 => csiphy1
> +		 * port2 => csiphy2
> +		 * port3 => csiphy4
> +		 */
> +		port@3 {
> +			camss_csiphy4_inep: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy4_out_ep>;
> +			};
> +		};

This port should be defined in the SoC DTSI

[...]


> +&cci1_i2c1 {
> +	camera@36 {
> +		compatible = "ovti,ov08x40";
> +		reg = <0x36>;
> +
> +		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_rgb_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		orientation = <0>; /* front facing */

include/dt-bindings/media/video-interface-devices.h
MEDIA_ORIENTATION_FRONT

[...]

> +&csiphy4 {
> +	vdda-0p9-supply = <&vreg_l2c_0p8>;
> +	vdda-1p2-supply = <&vreg_l1c_1p2>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			csiphy4_in_ep: endpoint {
> +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				clock-lanes = <0>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&ov08x40_out_ep>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			csiphy4_out_ep: endpoint {
> +				remote-endpoint = <&camss_csiphy4_inep>;
> +			};
> +		};

Likewise, define in SoC DTSI and only override necessary properties

Konrad
