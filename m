Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612891;
	b=XWUe9yK/Ac6smrUXArQJ4QMp/bVCcFJgyTRUqhsJNZddtxvfi/7tOlUcjIM+kLUE188h
	 gD/PzcLOgvYtZ9HwGSwrcX9BtbwEWIcUUYqIJ0y5wNWhNi1T1Hl71DMfTitfe0U+wv/z9
	 GGe9MLyCy03SnI2nzxFigHE7vJZC0xEq1Muzne1DeweGCqpmCA9/njwUoNNo5J/4+DV0B
	 yCQQXGk+VBE+vj3fC64N9KCrLMBUIF9i9XnRytd0vFasYtg2lZMdfIv3qLYPxp9nTpxXB
	 Gy/6xMrFhMPD4IWZQ2gqQgb0vyoyMmFjPcvDRyChYaH97Wlljy+imT6wMsjkrFiPPUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bZO8S47yAZzPRZIjGfd7EOC+0a47KkXc3My8VRvZEho=;
	b=ucnv19u4Ri+FMuSct/+OMNz2gEwqO1WIx8VXWK5gi5jy+t/U7WkyLfoGCEjSq0zfgQ3q
	 i7D+BU3hXwXSycE57fzBz0XP7QsWQehJwSTVuY/i8YM9INZ4+H4I9hwN7PdIKpSQGmEbX
	 g+ODQtlSyOa7lh61/PlgpAwf7ZCuoTz6uqicbxpNFuK6VOIzu7BQYCwRwhtQ5C0v2lBJ1
	 nGhVZAOvwiT2DB4dgqGVoskXzZQYgD8GaMnmoMav65A1+zK1PHST5DM27ipdBkQ1CDJTH
	 BX9qmHtuHWH04arMUzRsTcCDT1Z4G+/uZhn8V5TdHu9VSdvqS6cn3XMT5TxFMoqBjsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QVp6mueg;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558EC606A323
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 558EC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QVp6mueg
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ad3ef75223so3854791fa.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612889; x=1796217689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bZO8S47yAZzPRZIjGfd7EOC+0a47KkXc3My8VRvZEho=;
        b=QVp6muegU5Z6It5m9kYa3Srv4/OZjR98s3uEzmj17g4dG+5YeQ2V/jvzYt7ybUimHl
         diaFpnHrB/Tr2sVTUON782bU6HLeiVyg3zxH3CGn78hp7vQSzl/JVSB715MCEfNLGfGP
         SLOFssV5STRwm3FmAYX4GkFbKWGkG8wEOhbWSq0HmnByA+DTYLgwE+3wdIGQCA3/GBvh
         h1TljZ/Ue7hx6ZWc9frUBXHyPQuEdZtIBuWTduUkRvfF3zTJMd/WCXbBqkFTsHwcnAyV
         6SxiDJrbdz5PwuucLh+6q7M361R8DlTuKSxqhwn3Bzlryhm2rjhltIsdBHKteTfbLz7+
         S1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612889; x=1796217689;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZO8S47yAZzPRZIjGfd7EOC+0a47KkXc3My8VRvZEho=;
        b=oDYs2uiUUwWQhYoiRz3dEmyt8vFMHUGQjcHnQAs45ihaKe4WXBr64+yEsyrZqKYFsV
         K78N2kwj1YPqVGsTdf/9Db/jqYL412P4Fdw8lvNEUHBHi0iSdLONGmmS8U7zg/abZSQq
         +aHEZPSAF9xo8NZXPfFLEii5BztXI9KxmCY997G2NabCH8SJiI/49jKiyZsjoVKKKwUR
         EU3/NE24iMo/WqQsnHcwmIqS9RP1SgjMtEy7qQMw2tjtLU/1clVtjlmwp78PcIXYMwA7
         QUzN6a7NaE64N6vSbB6ukdr8d8dOOUOQD6xiPoOc6eYCW9QOPo4SPBuS1J/M4nsawg2/
         ycJw==
X-Forwarded-Encrypted: i=1; AL+hErFWitg51R2/Y6zV7+qXe42nsj9F52dah4lPU5Fu0OcUy8j7LZXSPJOF9LFztyV6p4GM2+UBvsp1R4zQcw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ii2VR/TAao5jvpi02kG4ykL2XjYei4MesdWiw728Sjw89K77r
	vNZjDexBPR/XDGgDDrfE/vSTyKlRiaEwMy9mOacOLU5HA3HTk+CRmzxG+YWDhbLiY98=
X-Gm-Gg: AZFdTZdigUkdbi52wFz+oobNNwSQRL/T6DToCK+FpAYt1tkWiDcpvrlqtK7JAkLpHEK
	Cb5EHoXgh4BiZ18OhaWhfCxCUz+joFVqYKrcYn66BnQZjC5f+QXHd/D5GB6AEUBI+Owq/yA06Ji
	OQds5e0WEeT3GtYnD6HXcft708cO49bRdRt1wsjZa+C9CZ+rEO3iJ6/oqVBj0UeSdkzdKQTkXeP
	Ooo+/PppdVypoF1TUDVihHn6SbS0q7lRBrDIEmc2CBcXM3i/0eRYvTfRUpu5/jYT+MWZHf6nkpz
	T0RRE3G+7c+Zhyi8dI1Jr2VAvfhbLcIH6zb/cgRuki7aOgPM1DqSW7nt+Tg/oDlHXkbGENVRh8j
	dZeCu7OQ1qmrMYS847Xp9torXswRzMMigUb2EczOjVDrYWKKAPMqZbzvmW4xiTBCb4l54S+RUWd
	4RSK+HmvEOJrtj68w3ZsmtRc3uT+NFxc1Qdc2e1YksnDSGuc+gKx1nKQgGQBawtt3sWZjsVtOl5
	y17x3O6CZo6b+v+PDZl7TV6a19ebO9ORxXRSyLUll3ylSc1vmz5QkJnK1nt4cPZ3xT6m2MA9k2B
	kngdXVZAPbJH224Ng1wfSiKsHwwrubnRF2PHinwyrWXq2m5ctWnJeD907gY7MP37ZD3V+bgx/1s
	XE9xoC3c=
X-Received: by 2002:a05:6512:4481:b0:5c0:ca1:46d3 with SMTP id 2adb3069b0e04-5c1bc7c5ee5mr4971577e87.5.1795612889486;
        Wed, 25 Nov 2026 05:21:29 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff8bd3sm4567229e87.27.2026.11.25.05.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 05:21:29 -0800 (PST)
Message-ID: <8dc492bc-2727-4448-855f-caf13d4b2bd6@linaro.org>
Date: Wed, 25 Nov 2026 15:21:28 +0200
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
Subject: Re: [PATCH v7 22/23] arm64: dts: qcom: eliza-mtp: Enable rear camera
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
 <20261114-add-support-for-camss-on-sm8750-v7-22-8ff2a11835f6@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-22-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/26 13:29, Wenmeng Liu wrote:
> Enable the rear camera on the Eliza MTP: a Samsung S5KJN1 on CCI1 I2C
> bus 0, connected to CSIPHY2 over four data lanes. The sensor takes MCLK2
> at 24 MHz, is powered from the PM8010 regulators added in the previous
> patch and is reset through GPIO125.
> 
> Also enable CAMSS, CSIPHY2 and CCI1.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/eliza-mtp.dts | 72 ++++++++++++++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> index af7450fa2020d29a4ce98eb958dabd0cd8c61860..cd14b44cf0aef33a7939075949916d054cd77659 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> @@ -6,6 +6,7 @@
>   /dts-v1/;
>   
>   #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/media/video-interfaces.h>
>   #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>   #include "eliza.dtsi"
> @@ -538,6 +539,70 @@ vreg_l7n: ldo7 {
>   	};
>   };
>   
> +&camss {
> +	status = "okay";
> +};
> +
> +&camss_csiphy2_in_port {
> +	camss_csiphy2_inep: endpoint {
> +		data-lanes = <1 2 3 4>;
> +		remote-endpoint = <&csiphy2_out_ep>;
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
> +		reset-gpios = <&tlmm 125 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_mclk2_default &cam2_reset_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
> +		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		vdda-supply = <&vreg_l4m>;
> +		vddd-supply = <&vreg_l2m>;
> +		vddio-supply = <&vreg_l5n>;
> +
> +		port {
> +			s5kjn1_out_ep: endpoint {
> +				data-lanes = <1 2 3 4>;

'data-lanes' property can be dropped from here.

> +				link-frequencies = /bits/ 64 <700000000>;
> +				remote-endpoint = <&csiphy2_in_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&csiphy2 {
> +	vdda-0p9-supply = <&vreg_l2b>;
> +	vdda-1p2-supply = <&vreg_l4b>;
> +
> +	status = "okay";
> +};
> +
> +&csiphy2_in_port {
> +	csiphy2_in_ep: endpoint {
> +		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +		clock-lanes = <0>;
> +		data-lanes = <1 2 3 4>;
> +		remote-endpoint = <&s5kjn1_out_ep>;
> +	};
> +};
> +
> +&csiphy2_out_port {
> +	csiphy2_out_ep: endpoint {
> +		remote-endpoint = <&camss_csiphy2_inep>;
> +	};
> +};
> +
>   &gpu {
>   	status = "okay";
>   };
> @@ -657,6 +722,13 @@ &tlmm {
>   			       <111 2>,  /* WCN UART1 */
>   			       <118 1>;  /* NFC Secure I/O */
>   
> +	cam2_reset_default: cam2-reset-default-state {
> +		pins = "gpio125";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>   	disp0_reset_n_active: disp0-reset-n-active-state {
>   		pins = "gpio12";
>   		function = "gpio";
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
