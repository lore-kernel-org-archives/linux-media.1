Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612796;
	b=Rj4AuqLqIQ1RKM40RnLEUKdQd5RhlT5wcYosB56ZL4Ezq0NgCRUdxS0Dc3q0dtFXogj/
	 Wa7tF0UF3dFwrYSixvx1twx9OmbfpmZuX1z9P3IZX3BeZ2kwRPpbenAg5G92+MyJpdYGr
	 V0jyossora3pn7UAuzRKYAhCDasiF8f3tYbWoyNfvpbreEDiRf+N8DfOq+hSV7bgTjjrA
	 NBS085X70baMGPq9n3Fp0z2zQ4bjtt0gQj3dsipJJGC37VeLzbmtU7NTX520kwS0MAop/
	 9HUWAV1oz9UzIFHX9z9Mrdp+K3T9vY0ynxc6nKTATi/C2sAoBmzRUxRmWHJKLgc9tgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Fl956CFnusiWXQc3uAwBS9T3Hg6fgxOgNH0XW3/nmQA=;
	b=IQXcFrrUYDnXc+E3RGd1xsePw6mmEJknGHu0CYTDBwabIHWR/VhVFy/3x60zgLmFuCSI
	 Wveak0hQIvPBQrJBUYqmjsl84BEtJIuRzifuYXVJnJYhCQBU668T5YPPobefxjXvfTvNk
	 PmAQLOv7g1ppGrWGw2b2iNtmLaBtCoHcCCe7En94yzt4FnjdwxmHbbgv/wWrWmRMoOyO/
	 VgswKgK5W8M9Dz0ldUlpykOQfznFxIGRzbLv9tZIYkzLogtOw0IOzv+jUpbVJ3BaB6PNW
	 jwCn5CnE229mjlOq5VWL/yMMv3lxbKun8AyIC/FyjSajCe+ublZTRfstRVFPlz6iP8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ILuQghNM;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDFD606A332
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CDFD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ILuQghNM
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c00c727a26so471764e87.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612792; x=1796217592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fl956CFnusiWXQc3uAwBS9T3Hg6fgxOgNH0XW3/nmQA=;
        b=ILuQghNMwvkL0bm9aeT569/Ym7SzQa4pqK08RYBZT4EzBUF2+k8lhxS/smdjZKhSRF
         JBy6h/wKV8UV4DUaR/eJqD4yozp3+S/GMh2WTs0aM1OXCyQ8KGS1MDCorERJ3bq133Hb
         jM01FDGQGFBWbrkxjCqI1geFLIiVRGznW5blhrWgcqluY9mjPoJ3gl5PrKe2pCdlSRXL
         K/+VqRmkWzjBKf6WJvM0ateaBp//iCaZVvpp3S8iK5xqH+Y9mmMYpXlgk1pm2D/cKUnC
         0TSfBL6fE6kGdixXJk8f710+rW4pyXpxPko7Fyi3naHt1zaynDac1j6LsrnJFYZD53hu
         Fk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612792; x=1796217592;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fl956CFnusiWXQc3uAwBS9T3Hg6fgxOgNH0XW3/nmQA=;
        b=1koXe6m3K6lF8t52J8BejIy6gbsTL+HYQFpD7WIXo7GDRSqddWCg+d1DTsip5TciOo
         XceNDsBi6+WhqWpc5u9oaXeKjUc3ofUTyLW6KwFMdUEVTYJHXaqskYqZ0nCfeVRIZv90
         v3oTkN0+FQDxRCN4TGZWiNAaPgeRtj0dQQPeKQOmpsrFjvuAmMIDBGF3mYKOWAVyscRr
         eex8co5LK3odBKCaFHWVdxbadBbUmrD0fQnwEiuleQdcSlUJyAI71hGeU7zlhE0toULt
         PivD6tpNlla+QrFLMujLMiXUAMoJvldosTKmeDNIO6TnBN/Fk/gQnDxgWFgw5090xrR+
         YHgg==
X-Forwarded-Encrypted: i=1; AL+hErEJ/JedLGkcw4GnrRkZ+ujWkWgKiGXbE0uwd2GX9bN4voepzxmbLYGNqtncJSGWZBgooUjBBBiPL0AFQg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/zeyLHotxU/TNk6L8Oy671VH1pzoUVFs/MpSFrIj+8wRL9NKts
	QwVdSVKW0mIYAA63Jq9DjY4UGU2akqTOUBOgSdgEBHCESVaVvU87qTpsMVvHDZjX600=
X-Gm-Gg: AZFdTZeJUyaB1LYjDsuVyrVuKMJcqYfNfeojGQ1x6rKBC31HP3zVgxAxZtDTI2WInFw
	NcsEiVm6SBbfElB3DDTt5sHc6bcvV3L0w9IrhnXYCWkP4tvKk9fmt3grOjTrBxO41LBkDPOUxhG
	D8dOIVEnyxBTxKoBPRDWnXPCqHOZEG2t50rjnTDTEYg0T0AL4qdEk7xOX8DmNSkKC181BhnF8Wn
	9AxIUN+s85z7g28sfSrkGkohGO3G0g4GcBy1ku4+r6UJlRiBDSeqziTJcgBBfOGj2Uh2LhgZEs6
	+pvwvwVJdqhXmnqBQ8lTflESGNo59ON8Edhj7fNC/ivcCujbLyenZa3wX/+7MOf06EpZVnlyq+W
	6xcobSQzAHikYuH2BBiTOLBhZZLqe94jWYlJacl+Rv6W8nSErx06Lhm4unPIN07MOCuGyYASTcg
	KOBazb+5Nf3Pi8+kVeuP44shYEE5gdTqnBvNHfvKHnDh8Xr99NSXR64cFS//7RpJYBU+PxlN5pb
	fc1ciIlVp6wJNt9hW7zwVkFGxNCyUuEb6xjyM5Qgc7Mnn0wf1doM2RMcK5nFJ939NQSjzGqCvL1
	5lgTFoCNzULkw/wLnDyyCXhBlDXiPrFJnbqY4eS9pJuTd25IWmIkfHz4Q+P/5OCUOoXhineIZ2l
	enq/xSQjFNOG6Wl6zZuCwuW2PqQg1
X-Received: by 2002:a05:6512:31c3:b0:5bf:e6a1:3115 with SMTP id 2adb3069b0e04-5c1bc76a33fmr7069607e87.2.1795612791602;
        Wed, 25 Nov 2026 05:19:51 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0177f7sm4448777e87.33.2026.11.25.05.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 05:19:51 -0800 (PST)
Message-ID: <c4c72389-2a8e-4278-8667-cdd4d8f72225@linaro.org>
Date: Wed, 25 Nov 2026 15:19:50 +0200
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 17/23] arm64: dts: qcom: sm8750-qrd: Enable S5KJN1
 camera sensor
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-17-8ff2a11835f6@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-17-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wenmeng.

On 11/14/26 13:29, Wenmeng Liu wrote:
> Enable CAMSS, CCI1 and CSIPHY3 on the SM8750 QRD board. The S5KJN1
> camera sensor is connected to CCI1 I2C bus 0, uses MCLK3 at 24 MHz and
> connects to CSIPHY3 over a 4-lane D-PHY link.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 72 +++++++++++++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> index 75927e1f7b9ab0316781c64dbcc82d3394c414f6..c92a1f3c47bd5cbae26854614682c3bc7daa0398 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> @@ -7,6 +7,7 @@
>   
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interfaces.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>   #include "sm8750.dtsi"
>   #include "pm8010.dtsi"
> @@ -858,6 +859,70 @@ vreg_l7n_3p3: ldo7 {
>   	};
>   };
>   
> +&camss {
> +	status = "okay";
> +};
> +
> +&camss_csiphy3_in_port {
> +	camss_csiphy3_inep: endpoint {
> +		data-lanes = <1 2 3 4>;
> +		remote-endpoint = <&csiphy3_out_ep>;
> +	};
> +};
> +
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c0 {
> +	camera@56 {
> +		compatible = "samsung,s5kjn1";
> +		reg = <0x56>;
> +
> +		reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_mclk3_default &cam3_reset_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK3_CLK>;
> +		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK3_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		vdda-supply = <&vreg_l4m_2p8>;
> +		vddd-supply = <&vreg_l2m_1p056>;
> +		vddio-supply = <&vreg_l5m_1p8>;
> +
> +		port {
> +			s5kjn1_out_ep: endpoint {
> +				data-lanes = <1 2 3 4>;

'data-lanes' property can be removed from here.

> +				link-frequencies = /bits/ 64 <700000000>;
> +				remote-endpoint = <&csiphy3_in_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&csiphy3 {
> +	vdda-0p9-supply = <&vreg_l1f_0p88>;
> +	vdda-1p2-supply = <&vreg_l3g_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&csiphy3_in_port {
> +	csiphy3_in_ep: endpoint {
> +		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +		clock-lanes = <0>;
> +		data-lanes = <1 2 3 4>;
> +		remote-endpoint = <&s5kjn1_out_ep>;
> +	};
> +};
> +
> +&csiphy3_out_port {
> +	csiphy3_out_ep: endpoint {
> +		remote-endpoint = <&camss_csiphy3_inep>;
> +	};
> +};
> +
>   &gpu {
>   	status = "okay";
>   };
> @@ -1081,6 +1146,13 @@ &tlmm {
>   	/* reserved for secure world */
>   	gpio-reserved-ranges = <36 4>, <74 1>;
>   
> +	cam3_reset_default: cam3-reset-default-state {
> +		pins = "gpio109";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>   	sdc2_card_det_n: sd-card-det-n-state {
>   		pins = "gpio55";
>   		function = "gpio";
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
