Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ECD47AF4C
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 22:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772230131; cv=none; b=tNBZSOdiP+cc3Bql5rGu+BLVNNG68yyJ6fXs5Tj+E4yXHwuuc5o13jvnNKWZ1jl5NZeGGLexICuLbekhwTcQqvVSOWgKmkwIQlwgjRhE9BxCxMkoQRSY271Cd6eNGREiuImma5T1nlS4kTI5u00kQ7MIP9I/Ij3X5Hx/TLToEnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772230131; c=relaxed/simple;
	bh=iNSxSIh+ll79sf4TNG2hK58H2dS4Xk6YssNMKaMP+fY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cB9BTHBL8xeX9oIk5ghY8jb5JuvJU8gpL1m/3PSE7Cxkog4ZqqG6IzKxiqzkyUcOoRQUTlN6fIEhmTOiuVo75NnQRPwsoHUBuNy92uU2kzmeGkH8dF/zORPBSkaRNCUf6zkMxvV+owwpOFoE3UtAiLgxM1AYGdp9oef1o0UIu3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WgbcI9S2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WgbcI9S2"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso21894715e9.3
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772230129; x=1772834929; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5jgh0ia5KAYwXdV6WzubAimlSgIWZXu7hr9crI9YEOI=;
        b=WgbcI9S2wbLLbpaGOETf5fJaqkGxJ04SN2tQQinMal6ImkiaKMD0ac8IDGENgh3/Is
         +CotPYn7+GkPGqz3ZouuCG1zhhnH77+Yk7wyAKdNpDxzK1aDpJlTBcZmesUnz5217uR4
         wc7mSb9DbJb74t7UHVA20HIlNwSmS3Y5rmqTZRPSbYfnsVQhow0T/HjKpBA3tg7QbAMd
         8vEyJjIm2EEryPXKg4ERpue180FrTr62Mn5k11pqDlQQ9S40Z9UJRDu0rWyZPy7vedE8
         aSQhBwb4mWQYXOrOhbuUouln0/nezPL5niRj0NErSwoD9kcpfBGJ33rVu/Ui9PFL5ABb
         p+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772230129; x=1772834929;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jgh0ia5KAYwXdV6WzubAimlSgIWZXu7hr9crI9YEOI=;
        b=tohIxyOUffZzlXL64pI2j6HHYr6e4AvnEgSXhe4oHjrVGBseOW+VpmtB66U+WIg3hV
         VjwTAvNuRyYZcjAhxUbVyBo3evMb1XtUMZ+6tXY7ReMdCkONcOM0+oYmK+IRhWd86ct6
         0SvgBgkDEHuvlU/PCnJdTAHwjxLqluayNoCJU348TvLF0KDBfos2dbb4uTjd59r/EhLy
         iP0iR4BupUheqh9KvlhElRLuxqzpozTIjSLtXNqJhmkszWjo11mbBGP+vVWXU7meR5PM
         IeaaJ5R5YGC5uQnRrP6oYYCd/1J0XnQfy5s1gDeg+fVQlCaoRjcXBmMKYDXc2hfwLnW3
         FAMA==
X-Forwarded-Encrypted: i=1; AJvYcCV9mTOLRn7+N+g7ljeOx3B334Wyf/R6W1aaUOPM+xYYseaVi2dgguxEA2+9JqiUyIKZsIJBTAzWRGCkTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVbi8J0kOOJqGnAY/E84v//kF0FM6Ta/lnu2H6WlbV0W5Mipam
	Z/yrDxlTwmPsuZQya4LVp9gxXVk6MYQnpBOK3fEmY4iBysGaBpOsWZRPxmmF7ybSiMI=
X-Gm-Gg: ATEYQzyPHnu7Zha3aSCDCXEr7vz75HRSGiyaV+CekrzCtiEj8jR/uqDRxWKwb40gBCF
	5DynCm/OrzOK9KFFmTDjSO2HWD+UKuojbkuKn9DD+gNGvMOrm5J58Aq0cKPsStTPjMRmdekKTkC
	fd2qdWftoORr2EesivVR9teo39OG+pqJtBD234mNr7Use7ffi+zm1OP94U7Rh5dwwUiybhMplvF
	vnYML6auMrBQg/fie1M9dyh4Mp6rpPHoIwarXhMRt+6lhdYPLPz6+vUrRWkbGuuez5vBcoiLB1R
	FWCNwfLFDYCIBRzftMeUoCyCDgFPDQFDme9uTJV5hMUoM1AiRxZSr/bRtJMmqOo4OyHeoEn4QDS
	bgrH0eGRyiaPsr9uklTbEnzkNpEi13+jv9IDy6Ewd+VhYxyitZOEiql3WuLCa8pYHeokEoccMOZ
	SqZhPH20nNBac4TUamBEtQlLObp9cpFQzG6Prk189wWLCnH4GAk8F/ozd5x6Y3gmbYshLvzT99j
	kU5tF6dd43nvBSkRHR+O1o2
X-Received: by 2002:a05:600c:4fc8:b0:480:4a90:1b00 with SMTP id 5b1f17b1804b1-483c9bead27mr64166715e9.20.1772230128544;
        Fri, 27 Feb 2026 14:08:48 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb987b0sm66574165e9.13.2026.02.27.14.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:08:48 -0800 (PST)
Message-ID: <2932da190f788d2a11f6743bd87b6ff4a61938ca.camel@linaro.org>
Subject: Re: [PATCH v8 17/18] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add ov02c10 RGB sensor on CSIPHY4
From: Christopher Obbard <christopher.obbard@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson	
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert
 Foss	 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho
 Chehab	 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue
 <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 27 Feb 2026 22:08:47 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-17-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-17-95517393bcb2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Bryan,

On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> Add in the RGB sensor on CSIPHY4.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

>  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 77 ++++++++++++++++=
++++++
>  1 file changed, 77 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/a=
rch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index f10dff1da7f8e..f3f4841ad2c83 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -7,6 +7,7 @@
> =20
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> =20
>  #include "hamoa.dtsi"
> @@ -856,6 +857,66 @@ &gpu_zap_shader {
>  	firmware-name =3D "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn";
>  };
> =20
> +&camss {
> +	status =3D "okay";
> +
> +	ports {
> +		/*
> +		 * port0 =3D> csiphy0
> +		 * port1 =3D> csiphy1
> +		 * port2 =3D> csiphy2
> +		 * port3 =3D> csiphy4
> +		 */
> +		port@3 {
> +			camss_csiphy4_inep0: endpoint@0 {
> +				clock-lanes =3D <7>;
> +				data-lanes =3D <0 1>;
> +				remote-endpoint =3D <&ov02c10_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	status =3D "okay";
> +};
> +
> +&cci1_i2c1 {
> +	camera@36 {
> +		compatible =3D "ovti,ov02c10";
> +		reg =3D <0x36>;
> +
> +		reset-gpios =3D <&tlmm 237 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&cam_rgb_default>;
> +
> +		clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clock-rates =3D <19200000>;
> +
> +		orientation =3D <0>; /* front facing */
> +
> +		avdd-supply =3D <&vreg_l7m_2p8>;
> +		dvdd-supply =3D <&vreg_l2m_1p2>;
> +		dovdd-supply =3D <&vreg_l4m_1p8>;
> +
> +		port {
> +			ov02c10_ep: endpoint {
> +				data-lanes =3D <1 2>;
> +				link-frequencies =3D /bits/ 64 <400000000>;
> +				remote-endpoint =3D <&camss_csiphy4_inep0>;
> +			};
> +		};
> +	};
> +};
> +
> +&csiphy4 {
> +	vdda-0p8-supply =3D <&vreg_l2c_0p8>;
> +	vdda-1p2-supply =3D <&vreg_l1c_1p2>;
> +
> +	status =3D "okay";
> +};
> +
>  &i2c0 {
>  	clock-frequency =3D <400000>;
> =20
> @@ -1403,6 +1464,22 @@ &tlmm {
>  			       <44 4>, /* SPI (TPM) */
>  			       <238 1>; /* UFS Reset */
> =20
> +	cam_rgb_default: cam-rgb-default-state {
> +		mclk-pins {
> +			pins =3D "gpio100";
> +			function =3D "cam_aon";
> +			drive-strength =3D <16>;
> +			bias-disable;
> +		};
> +
> +		reset-n-pins {
> +			pins =3D "gpio237";
> +			function =3D "gpio";
> +			drive-strength =3D <2>;
> +			bias-disable;
> +		};
> +	};
> +
>  	edp_reg_en: edp-reg-en-state {
>  		pins =3D "gpio70";
>  		function =3D "gpio";
