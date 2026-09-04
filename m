Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F367499F0D
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519418; cv=none; b=OLkZrFCbWfjnRBCXKMK0GFGBz0753DVkq/PNUAmfTEtkB1nrBCyB6kXfG/u/ne9fYkVvHiH6zG4qVbw4R+/hkbHr7BElgogYfvEM5iva8u/mBq32yvYUahX55fph7nps58Fo/8zca/RFsgVqu51nWJC2vyJx68yBTubKuD0Y1KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519418; c=relaxed/simple;
	bh=NMhZn0BoD1UHK6ZaOEKU5cQs8wKpN4y32BkJvUz3vh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hswr/bHR2D0nmV5lxMJcyDmKNUNQ6LMyj8UQVABfShFoT170bjXflTbWr+zG+eo8jjLrIDXF09AGNqk+2eS52XOyFCn3/mLx5TZe+AA1JF5Nik8gbJZDkCrxt6ew6PmIs6DEq1OkMdybuPLKYKHPV1/dSMvpvt8aEiBYp8x8Zf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KCshFS4l; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KCshFS4l"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b9320423cso9472285e9.0
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 03:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519413; x=1789124213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wyFY805KMBehSuFIyGcvV1tmaxdg5eRo3geZTZwgV0o=;
        b=KCshFS4lCVDPlIO1fhO5yIdcnhF4Uf0gqUjeeO91ZQCJWB5NOrJmUBrmExjjVRvJbw
         bMzBsV2K12ClFQWLUPo3maHSDF8L91wcMfs0Mg4zImXnbRseqbWAHRQGPKFYY0K6AftM
         qznRUC2g7UYFWt3a1cv4fi9f/aIH6Z4sy7PPSA5maMQIvDjdZw5EKc8UW8vmXyi9otsZ
         zHK5JF6Rjde5o2Ajejdn7tJ7UUt6GHQIropHK0LgLhI/fSDBqHETZ7gCPESNjSyWTzts
         oOgLP4hy/shwkscaVnUiftJEAkfVaKwIaO/tjdx3ldPioXTf2nJScwD5cACmY6qYqC+1
         4KmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519413; x=1789124213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wyFY805KMBehSuFIyGcvV1tmaxdg5eRo3geZTZwgV0o=;
        b=ElJxdKByKE+SY7OncolRzTb6vUsxQ6e5OKDFvOPup5KxcKn0CKda90xroXlbANt3ct
         P6OBgBQ1DJzUgmFmTEzolZbk9kxPk7dQ2cbPWcb4oXAqS5ztzZHAok4boh4QMkaE77uo
         t5IJIKz7DrzcBkBRjz9gcl0F8yLP3CAPQbz1aVKCXrhcM3gFmB3nQtcFiMXjQj7Og5Pu
         BRRc8Ta9kx58Jbn/Cgsyod8n5ut/wSZq5cETHk5/4Q0zdKJBB9QOLfiwj01fD0Iqaoov
         3Ozlug6M9rO7g5p6xMLFBLFZMfWXijArUBQbvw8PWpXM+sbRcZPulgyYItEQla64b/jr
         an7w==
X-Forwarded-Encrypted: i=1; AKwUvBxls64lGEii4Uc3rFbfbsxf/oq4tGe/3kdnYuTDV30v3I7fPOQoAIdndfRQL1nwvKleHQlJKMBgLA3iHA==@vger.kernel.org
X-Gm-Message-State: AFuF++nz/DuRD8nMeGp8qBK2LQlS/ALD7hPwWGQhZqoiJ/Tcq1KaRkvf
	0MsSYgGdRtitgCI1u5luvkA2mva376fDui/Zs4+ypAxNpIbRUXtJfey8HTYYzViffn8=
X-Gm-Gg: AYBFou0JupndjDs5fB6ZulJHqMPbRgstF+3Ho2LhZ8NbqfLCjuo5SYJIJdR3UIt3Wd5
	A+1H2UMxQnLxlObIkRHtxaRuYrzVlGB6SUm7ewM3DIHu3/BDJ2MbNrZ16FW9RM1teSfmdTwk6aB
	DW3j2NBQ23rHLZTPhYIpIYhn6lTW4/hUJjdVFPwCR152isdlMWih/VUGJn6mWAUfjpcHxmIumue
	vNrEqFKJnEfkjZrGSzeCnxE1JtRg7X4cp4wgWP9K5moW2uM5aJM18z1csxgEjiLdj8/BL9BrdiJ
	+8QcPTHaL7fAIi4+9dJCbt5YfH8k9xXMup8XX5CSTpZvXLb7zy3DIofIwWEEU5+XJI/auaYOo96
	2GkKvmnX6GLFbaAFqcMA+Uh3gedAkYYm3tdpnTZ8GIyPQhba9Z8wdWfei5dRqnb4nZlneGyH4dL
	1w2qb+TbLZ7bF27NQkK32+VZXwz7CVUnTxXYny1Z2XsTki3pXYTBCGzPMi5aj7FRUvmhBm2UN4g
	nnoR4K3BG4=
X-Received: by 2002:a05:600c:3f12:b0:49c:c8de:96a9 with SMTP id 5b1f17b1804b1-49cf7fdd2dfmr79109205e9.2.1788519413202;
        Fri, 04 Sep 2026 03:56:53 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:52 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:39 +0100
Subject: [PATCH v5 07/13] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-7-dc81d85b599d@linaro.org>
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2939;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=NMhZn0BoD1UHK6ZaOEKU5cQs8wKpN4y32BkJvUz3vh8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPn8poMjwDSWgkdXBjtse7BrlsDKxOYOIpPW
 1CeFJAi+ReJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj5wAKCRAicTuzoY3I
 Oj6xEAC+8wCZ0VsspRmo4SB+ONuc2uieDs7ztlQVRCwXGsR+0m3PsmCktSEesi6+duoUvFccT7R
 ITkzpJdiLgl0Jjn1R67q6KuP3JKpsjDKOtquPcHs5qvwkC+Tcp/fJEonSjK8UtHjoCEMWDmfhW4
 d5ubwBd97xvwdL8P26uUQ7H5o7OpeDPIQxpdoAI1Pc/UP9PEnaBE+jW1gNAoV/xZN9+Cu1HAc+w
 VSuQWuguFrp33v83jfyb/zznS50djnbfshZ2BeBOoH5p+liYWmTYBzRPO1KY4MR/de2eWqs0zAn
 4eUAB408cK/XRM0xAjeF1JlbZT2BrSkBpS7h07zgO3i+JrN0H4582K4MeZq2I2g6YaGdZqvQJI9
 td8FYB6tUQ8XVHFMUr+HtPPqynYVEi3f3QVhu3S04in72ddD2yFJlcoevv2edZB9kKLgHh35Fme
 HOGJiEtuV0Mqf9STTDseHdQVRTHISt+MRVUiO6DIQ4JYZVzA8bdwH8CpJZfDe+skvprTdBL/ZU+
 YcvkmLL12nW5ALcd46OKv9NaOl9aY6M0TYsPMi3jMuinCK6Z8OwPIeMDQYJNSQWm/KS6uNuQjtU
 pf2p2uqU2Ff7bi/H11wf7SF9ne7YX2RP7sI9b7eHBixsGem/9lZT2mjSxPjKqlIaJ+Bxt/ZsMLN
 oqucsyX17tJD9ug==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
connected to CSIPHY4 in four lane mode.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 97 ++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 7b9a40a7b9a95..a87a1b56830b5 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -933,6 +934,86 @@ &gpu {
 	status = "okay";
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			camss_csiphy4_inep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy4_out_ep>;
+			};
+		};
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
+		orientation = <0>; /* front facing */
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
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			csiphy4_in_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&ov08x40_out_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			csiphy4_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy4_inep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1553,6 +1634,22 @@ &tlmm {
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
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.55.0

