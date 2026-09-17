Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68807526A9F
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 13:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651251; cv=none; b=q9nySQG8pU8eZ1t24AjCD9aEoIffYaqIKnkV09YE5WtKbJCkdY8EaZ4vk9Cizsq4Hm83eRjgubLdgKWF0KklKFH2CaI/jR4nNjONkXy9RaPM/Iqh3mGRU5/Rc6ROrvdG+oouzzaf407EsAcnq66S+R8xq7N9rMFRzjpcov2xWcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651251; c=relaxed/simple;
	bh=YgtfdbfvI2vm4fPS/2wJh4nA9PTv9/WiG64BLoG52ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D8a50DYxdfcJeOcvwgyfnCm3Hw6NPCWz0h+xwUhYyj1yYgtgBlDcMiLbCEyYBOudkmAjiVf+L97hqZ163rV9JBdrvZAR+SMRK8ZwgvsgdZ4e+Q2IXPWr0wJnTMLdjEWQvLokxxDVn5qebJbIZfud2uSf3dEqGxtxFJUui8TdEx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K/WqY6OP; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/WqY6OP"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa22408406so1315630a12.3
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 06:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651244; x=1790256044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7X6WiA80d/4eIvf7W7LLXIYdtHYrja0ac8aRvgmZ77k=;
        b=K/WqY6OPXtCjlJkaJrQLII6Oe3BeSpwFA4l4VulP1+TsnbUSwi4oxDUdYFEGNiH+9K
         LyCKPtNSJRXcdErHqr7ycNraPi0v4nuPw7S+Mx6XIN4w6aTnre53GF38rMF6mByGUBDS
         fnVSW4BOUHVEXayrK7V4O8Y+ikXqx5h4GH6ZvnMrvLoHcwU6ps3LtV0Kxxd6wIGreDB9
         jMwuA63osoq2p/M2vW6eF8Q3O3o6M+xyq0ugg9+JdIRMtYaKAhZ4rX3ipKdqi+m3chiq
         v5qEY691aJ0kPO6XVG3aJkKcuiuLNhSIfGWrKamBFk2HQiLNevdol7vojrj6wD3gJYiu
         0z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651244; x=1790256044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7X6WiA80d/4eIvf7W7LLXIYdtHYrja0ac8aRvgmZ77k=;
        b=evSIm5XsXeoJJvKjw0y0ymn1xxi7Jgqr+joCEOHlVU6KMZ1NrHDKLuBat2JzDoxMUp
         4veu8aPADzEvrxILn6Q9ZKhMt+PLJEiR3xF4/iNLODw5pjxOKKYdLRcqFdo45ZLm/snC
         0sSfzM1Fl1RXJzi0Si1vbyoH1Nj9l6ZyK90tjRZBA6ymIcexxfeDcebH/dODlywfK/9t
         kmY1AcnNN0mgxeUBkmAnn9+pCdzMQgdLrkyRRja3FvtO3OfV9eMAKgOI059SLOuSph6m
         9DnYBU2KpC+hxkns/jAl7X5QryydlXrlojnRNncJY7VqO9vxwkIXoHYZ2Kduy2tClGi+
         75jg==
X-Forwarded-Encrypted: i=1; AKwUvBwPcBz9wKprAYUd84dyohKFAU+9916mpcZClXfPUKFXkMkx5Mxxf+PVTwFP88k9rYQG5vxjaNYxVxPV1w==@vger.kernel.org
X-Gm-Message-State: AFuF++l5UqmVLQ+R5bdlt5G38dGbEioswoesPJfxt6qVYIMG0wG9qWGn
	vxClr3GApyqLJFQQR9/5o58x1Zl8HdWa1029vUDwsG2sa5WDthWFbdzf8GFmHJKYV/DwB8iAGy4
	y5X0UBEg=
X-Gm-Gg: AYBFou0S+cXpTXJw98jPgdZ38HuXdGACl6h+GZ8Y5ymex/Lpm2F6iT+/Abbjuq/cpF5
	EWbOvxTEeO+AL7XeuJna++CTJzleMP3Fcm0C50axn3H08584GSeUbL48+R1KTMwW02x9Pv1pvDL
	5Gh3RJXr6jMxi9N0UnjSXUqN2POPgf1nCjIA2CKPdb1kWkQONIxoLCjNHEP1MVfZ7ycBwrCmIFx
	mA9CVp4yF/a2snbMU0YFmdSI0hc0rEsgJMkBDyWM/0+tA2M17Tyt2qIeqZoT5H3rl9QfpxKeFwh
	UDETDa2wHEHbo+yskg/LA5z5Jn0wtyzn2Y7fRgV6cBVJZN/lKlVibmHET+kBazuLOuHyCSIGw/u
	t8gFNoxQCC9hSmURrg4YGc469nD8yavsVZSod6t0ByyF2kts8ealfpcYgMUkjaigvxT5NGcg/bD
	P6vmM4lVXqEWgZzMEOzerq01/LqqAJDNRW18vr5uSz9lTVGqMYkmpn4AIkEXFABO1fX6g=
X-Received: by 2002:a17:907:3f9f:b0:c29:659e:2fd6 with SMTP id a640c23a62f3a-c29e520bf4amr509931466b.10.1789651243797;
        Thu, 17 Sep 2026 06:20:43 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm279681166b.42.2026.09.17.06.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:20:43 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 14:20:31 +0100
Subject: [PATCH v7 06/12] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-x1e-camss-csi2-phy-dtsi-v7-6-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2750;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=YgtfdbfvI2vm4fPS/2wJh4nA9PTv9/WiG64BLoG52ks=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq+kgfq0NDGHVXbwKnOpx4m7kB67C2vlo7hEXf
 CyWG4NFq4+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvpIAAKCRAicTuzoY3I
 Op3TD/0fWt+PnMX3kLvWKEDBkf9LjNXCN8oR3TbTb2VWC5ekRtMks45O+uWdu97njxmVSavWutX
 LUFqADXKEUPkQ+dFLzWmbSNZhle1lctNUC/T9m4MlqMaqWB4PsCAwJvdweqfoESStubfUuIk4uR
 sXVXbrSDu5ht2SR1HXt6UJ0mMg+Pq5uhyg4/iM1F3hhqVQTHWG5dovpaMxM74UA/vhzzVVaZ/Nr
 vsWNt1IUA/Mmdz9gyZtBNBHhOe2AtPkfhz+urboulZ2VtP7V8jim6yLsvaPtSXHBcjFVsRY+MrR
 D8Yi4TefrxQQ1M+jmcGsvVJaqNmFW66DfOcD73FvvbihX2Jz0gxR65+K6SxH2vS0wO1tjHJ/HYs
 kkDrqQD95f1t6Oehlxg+Gge113akryotO0CAxgXbq1m5qag1MG0xPXBTThRtYSGjEo8VdAeNGE+
 MhUhRJa+tHMS6ppeScCPxmsbxI1KwOvZAj9tsTaGLLAuPOTZtt1AfppJNWpXW2ml+8KB8rx+CfP
 GYAKFom5gJqflALr4BTh1xeDLj1uqR/qqHUKnI4cOMRfYZldlsNMSimBJ9fZdqKWOINEYm4DggM
 bbKHoZsHn5axwh6U5JltBErleKyHNfqjBor0K5zwotkUpzTDojAQJ0tybROWZ7SHLjzMUOMq6P1
 ygVpFQSaHpIweGA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
connected to CSIPHY4 in four lane mode.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 82 ++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 47cfda908c515..a98f5c5b623bc 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -6,6 +6,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -933,6 +935,70 @@ &gpu {
 	status = "okay";
 };
 
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy4_in_port {
+	camss_csiphy4_inep: endpoint {
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&csiphy4_out_ep>;
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov08x40";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_rgb_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <MEDIA_ORIENTATION_FRONT>;
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov08x40_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p9-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+};
+
+&csiphy4_in_port {
+	csiphy4_in_ep: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&ov08x40_out_ep>;
+	};
+};
+
+&csiphy4_out_port {
+	csiphy4_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy4_inep>;
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1563,6 +1629,22 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio237";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	ec_int_n_default: ec-int-n-state {
 		pins = "gpio66";
 		function = "gpio";

-- 
2.55.0

