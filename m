Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789671;
	b=448d7PkMR9q0hSXWjsbqu0j+mVitaSdXKC9n/eIR0m6pQ9+e8m6mvhmw7BBE/UUTMkyp
	 eP3Xm0ysX7YBHWSgli4RnVaVVrmX2b0OtvKSnmvyTKEOt6iO8ARVcpPM+T9VXhUYV+w6f
	 kvFmLNXZTbPcr3cEL4EQKrMf0l9Q/o0ZhQHSEM2058cVi955ALcHmjN8hFl1C5FdbPv9p
	 3acVe22mxu4RaTvmJ4WG/jJxpwC7w4BgJ/73Dx8Suyx2BDW0QNfm7O1AL7pPywALjEniA
	 qjzvAjtbdV0lBk9hIcWt9RphPMwgzUf9NexQ0sKZidpdIx6y/lY2YjMMUgSDSQIRIPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789671;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=MfCoLiXadgJqPzNFXHlwqjB24hzETelL3UnVk6vwlOg=;
	b=Xy+ADIBRIPNsjD49ONbPTztTtgT66cIPr3Gx5DphxFfFOOj9jo2jWtyNQ/yIxuMR2EqH
	 OR3zXSCsbyNvGQzWVAg8mujaKeJJXS8mskcgngx5p2CKgLhvXEDtvrus9pM08eRicKR7P
	 i/edWxNjSBxbmjkgoaalvxz2HL0V+l8Ci9jXbEubnvnlITJFc6GvK+QYKAuotlGCOq7AU
	 14e1IbhX0PfixilW/Ag0s6bXD6eIetFkxWFZ/QrwUgKzEV1d25cM0cy6jVrB8k5KuxqqQ
	 4xwCoWZNdVG3qgDnsjwYsZPkuWV7e2s6D66gmZAn0NywPls6ym1+eEzz5cQbqLqb4hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hk1rjp5x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF08D606A722;
	Fri, 27 Nov 2026 14:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hk1rjp5x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6963D1F00A18;
	Fri, 27 Nov 2026 14:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789671;
	bh=MfCoLiXadgJqPzNFXHlwqjB24hzETelL3UnVk6vwlOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hk1rjp5xJLOuKDeX739jqMwhyQweuW5vf5KAvHucHMdjIPHUt/d2kIusLPVQG/5IP
	 23CjudQQfEhFX029xLDWvx8y1OuQtEl7iORq37/7JWQsqzZe9kkZogl8k1cvbJdIsg
	 jCoUDGGfifFkcsNCr5DidkTmN3tEw3ji829J4z3HrepQHvsjnVuMDkivLS5Rsm64rO
	 iq72XX8vs7qCJ52mLVJkQX512r+CKkxqyxGbUu7Xbpqcij1G5uliHuG4Pgh/sjBVHP
	 qoLqnXf9rWGwCnOKHlOfsu6fspnEKb+7ld7kzJoPeQAPtir+MYwMfVfHFO3U+0DaFA
	 Q0FfeOY403SNg==
From: bod@kernel.org
Date: Fri, 27 Nov 2026 15:27:23 +0100
Subject: [PATCH v8 04/10] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-x1e-camss-csi2-phy-dtsi-v8-4-2793b8e5138c@kernel.org>
References: <20261127-x1e-camss-csi2-phy-dtsi-v8-0-2793b8e5138c@kernel.org>
In-Reply-To: <20261127-x1e-camss-csi2-phy-dtsi-v8-0-2793b8e5138c@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2749; i=bod@kernel.org;
 h=from:subject:message-id; bh=FmeXE5AVOP6/r38dOcWxTggRJfSwR/+biWJcD2TUTmM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCZNRKJI1s0BAUM+B/IbLj97Ujq9YK248zwefU
 eFu7GJbc3CJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawmTUQAKCRAicTuzoY3I
 OggfEACSxKG2uwBsNlYYy3+sDiv8kdaKjX1y1kc/oVwm6dvErbsO0Ge2/DnfleO0hqQr2ynIMyw
 W8+8KA3axWwANbGs611aZnFAM6VQuyWq0fKOMMag/6m62muYFHnxC+ONADz5kY1SQmCIuG/2Sjb
 xW1Xk00fOx+laqk0a8s5TKGhTF2wH7SGMyJliLTWpT4CTIxrMJhDiqt3dBYG7UE2p6kKB1u+1f5
 mkEBA5CuXzIckZOHmzA6/5T7RECm2jxlgtWloaIdnxdVsLQeTeBjA6ZeuITr8C+f8Fc59qI+1Ue
 LQzusVAXd3quX4SGiPZQz39t02QA+x3oYYOMCdycvV1m0svaZ3JkdGeFNHhH7H06+zvRKT41Z8K
 IYo1+hIFmdwPtv8OC4sCCre2LS1UmvyDWrhcE9Pf9lfJKcEjOBas9BZNz7YodLXCQ2rkq6+KrAz
 oNGOj4YpaC95XeJAauz+ZLJsQ82X2ux1i8ZiC8Pi+YQrTv00NbLO32G5olGNEJAO0B0q6BAGQP5
 y19LdB9XkmPsjzwioxZz+7qzdw9V742T+PXY79wKxkEdArEGDxSE/pwDMA4kDCSZhV0GVzuXYcr
 TCIxxwvExoqrKDpPMPRWZ8rVJQvudUdR+Whg80TEo7TTMS+BTkeDZSlbMijxuxrX12LJqf2oqJC
 AxdwdpmmUtubvtA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
connected to CSIPHY4 in four lane mode.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 82 ++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 71c819aa2d43c..5f66e23e694db 100644
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
 
@@ -1585,6 +1651,22 @@ &tlmm {
 			       <65 1>, /* EC reset */
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

