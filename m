Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7AA39C631
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 08:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857109; cv=none; b=vDf5QrQz4IzQjnFHa9k3u/p5SCgFyqs+6LKEpMgCF3ZmWGCEmNkjOl1OLHNqzNPHKkTFfmLXYXEFNGc8bZ+ktA/OQK0Nr+pRFfwY9UL/fW8devWgRE1wyWGToU/NdMjYLeJrVMXpnXhd/iPLj8G4H1BL5DKJf4wdWWpl9/FNyKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857109; c=relaxed/simple;
	bh=rqQzBkXLE1s3C9fDauqcJQsG/1ffI62DmHui3HpO/0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tePONtW0cbaHEQ2zzbu14+7OFxeNjieTyalTmyxqc/V8oXgjoBbV3hILlzuW+TiozYswcP18RIXhZeFNplkSvwVk/2jz37g5+mjBxGeoKH4scZiNh1wvjuS72iFApmmQBFePR2wikk5dmI6nWc1xCgpGm/GFD0Ye9SlXV2d2KAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqLGz+Tw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KB3V2MNv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kqLGz+Tw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KB3V2MNv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M17H2979294
	for <linux-media@vger.kernel.org>; Tue, 8 Sep 2026 08:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ub4569bRPlpOHYa78WABwl6Ou9bAMihTjUsTBS73P6w=; b=kqLGz+TwQMzOjLKa
	ulg1wd0+6WRqw9I2yLN8Cx/GeMqcY/unL0U6eYe2ge1X6HySWplgTgqYlJen88Cj
	5Qpyf1T/b05cs+mFFPAJleKMR7/U5DJ3j4onKe1y6Xq5FNgcpUljlSUY8m+afler
	MUu3mqv7IbG9nD8mC3OtFBOs7LAGkXStthIwcqMpGr1WIq4+LSv/onKlo4HAyqlV
	nw6LLt1FLilemW3Jaggw5+lvdqaMEMFCcymOtXbBUMvJF8FBaHEOwGfKHBBlbDaU
	+DCZJ6LVztiGZtho6HCkVvLnFESIMwik/5+ZFcGcQ2gCyBuugY3z7hVV6bds3MEL
	wCmL2Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuykbyuu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 08 Sep 2026 08:45:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fc0097865so114798781cf.2
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2026 01:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788857107; x=1789461907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ub4569bRPlpOHYa78WABwl6Ou9bAMihTjUsTBS73P6w=;
        b=KB3V2MNvPVeQ+8HxKqYuERyoAT9jO2DRxgTvhNiDMsEwMqQEQ+dqgUx4dDdhV3mHKq
         cyeSRnbls0Tt8ZuCsRgj03spm8vJjdDdvHtFR4sm3vwEp2fngo0tmwLE2D0gZMb8Ao+c
         2EOLEq1vJubGAyzj5IedtszJUlaftNLoO5xqb7//jm7joXjMKYYEUEWgkHcRAPxvxTKa
         1vSFvkttJ1WlmuWqfX8sZhgnPG1JY9Tukthfvxt/U/h9UAi3qCYtBtxfiVeZe/lP3Oua
         F891VUYc9L1pEs2L/J2IZfxoLYHmu5bUcBruDS3gkmK5ALnZJ3XAPMWwec9R0KPVopdz
         IWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857107; x=1789461907;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ub4569bRPlpOHYa78WABwl6Ou9bAMihTjUsTBS73P6w=;
        b=YWWGdcM6yOzFrSaFQkF/sRy1n1muERFt0yKxi7vJlCHO9UrJISSF8tfIx3ijpeIBGP
         agYKGanB69G7B4ZvvPujUQEiLwkS2D/mYD8Sw3d79MPU+1+RkP/LrDqosQXfL4bTlVMg
         CzjTGo3SwqPIFHJKeuqaZ3nm1ocRinwzd2mWocsr5ujiU5bhkVj6bl7jEZuuKW4C7M5g
         00LeheI0hRlJRoAVfiTUbtMO/dCCFlLiuZoF1AoudWkEoR+4uv5MLn36rXedw40cz41f
         lgtiLFwIAK3sa5YCEf9cbEQzLz6XtBg/PxBLFjVbuS/DpwEAqoWTUePYmKq0CKwVxWQg
         EFqg==
X-Forwarded-Encrypted: i=1; AKwUvBybacsw6FKAdcgwAvS1SGb+BhZHASLaXoxsw95DaTQi0AQuV5Q+DfjHbvIW8MnHvwDZg8xHEM1sAsjgHg==@vger.kernel.org
X-Gm-Message-State: AFuF++mZnD2uYqxCeDi9e48dZxM6gD7VTxdaUrCXMoJSWdYeM1xKbKRG
	j2J8NgYXl9AMk3o3G/StAovxEoMVjui9eOpIjOjhCnGo5N+zFhsmUF1+o5s4UW3NxXlDrifLmjf
	JXv3++Jccrc00/SMJBnZDjmYnziRWSm+gwKiPddPg+xZetpgJoH3zsS8rSVF5tQaWdw==
X-Gm-Gg: AYBFou3VWYlUNOYzi7vwy98ca2HzzZ9mKg/BinS9imLufdwmpV0WG7tzjxDTr6ALp6p
	1HfofvKcoRikXSuiD7ZP1YRfb/wJux1joKk2kpFt04wi9fsEUHyXbxWnC5P2LRmgTHCNvGRfPnK
	NU2DgP60HAWOfKOgJChGg2The+TC1r326gVmQrU6masyRYyu+a+BJfW81oRVUvGkUKrBz/GHGvo
	FZ+wvXPo+E+ul8b3EXDy4S00wqGfNqwhoNMYywVHlwtTnnL/SkioIKVd1ymbI9Nue59LqYEpzsn
	ob9fyMsKnrkwk+tuKs2MSsYPYIIc4A4I0vCZTJsOsXPQLNMMItIjGKvY6Jd/SacCrINIuDHaJEn
	Bf/Qacjn4MJH2iDc7MpLXfoQFa6yx+KuCKesjmGDj95sbb83Cd1PsYzrNB/uVUvo=
X-Received: by 2002:a05:622a:1f0d:b0:51c:1a46:9148 with SMTP id d75a77b69052e-530549ce605mr345338061cf.34.1788857106780;
        Tue, 08 Sep 2026 01:45:06 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0d:b0:51c:1a46:9148 with SMTP id d75a77b69052e-530549ce605mr345336831cf.34.1788857105476;
        Tue, 08 Sep 2026 01:45:05 -0700 (PDT)
Received: from [10.38.244.120] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305413ce9dsm107174381cf.11.2026.09.08.01.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:45:04 -0700 (PDT)
Message-ID: <82b7c6f2-a45a-44b5-919e-ea448a3387f6@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 16:44:56 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/13] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
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
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-3-067f2ecc4630@linaro.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-3-067f2ecc4630@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5MSBTYWx0ZWRfX13OP5lBi3Cic
 d3Wo/HaOc8SmoTMl7Vxz5RQeIeV+LmH6LeOcMD8ydwMwu0ILNhmqHU2pbLHLlltd4jk2+tKPrAX
 tiN2QC3h6nN1TdvXlAmIRTjx7u3gS64=
X-Proofpoint-GUID: _h1ltdUaFbAolqjqNCOHS4i9X8KUSH13
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9fcb13 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=72T5t8mROkFztkF13RwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _h1ltdUaFbAolqjqNCOHS4i9X8KUSH13
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5MSBTYWx0ZWRfXx7F6z6Yuul0O
 xDODu+c9mBzUJ0wJIG6mZK6JJM6JWGpHJWutM7uDIn3yXeevpDGTp/uFdMXVMJutym+iZ//1oRr
 F9tfBaEOZCLcq2DqTICECdOQfJaKR/XtTBOA4wSyiLlA7ZKM4lR5CD1SwpdiuvfV/Rt6JcHYJMU
 G2kRax2wjZ8VCe7dhD1abv4EIEZpNoNIqNpXVj7mv4vlruOe5c5QQzjgStMciKUmHFrmHldU35R
 0OgEbdrNUOMPVEelOh5Arfu5dsp+g0PJolIIyh0uH7MZHHwnwzstz4zBjEEYLuW/5MHRrrJckSq
 1nSCEcXAWHIQmv5daiNQY09koT0x0cdptQhgPNwiZJH1xNGc/JFK1mRgeu5jMAdicrAMrN9Tiss
 IqkLE9fjX01lepPHGiw2KuxoFKcNWIgmZlRff4v8hv/shFLhO1gWhkQCPIfEo4g4xfC1gXTthUP
 3ta4aiyUttIhHJ+8jCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080091



On 9/6/2026 10:20 PM, Bryan O'Donoghue wrote:
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 4ba751a65142b..9a8d6f020a391 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -6,6 +6,7 @@
>   #include <dt-bindings/clock/qcom,rpmh.h>
>   #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
>   #include <dt-bindings/clock/qcom,sm8450-videocc.h>
> +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
> @@ -5550,6 +5551,22 @@ videocc: clock-controller@aaf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,x1e80100-camcc";
> +			reg = <0 0x0ade0000 0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		mdss: display-subsystem@ae00000 {
>   			compatible = "qcom,x1e80100-mdss";
>   			reg = <0 0x0ae00000 0 0x1000>;
> 

Hi Bryan,

The latest code already includes this change, so please drop it in the 
next version.

Thanks,
Wenmeng
