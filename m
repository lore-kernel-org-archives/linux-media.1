Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789678;
	b=PAb/i5T/sHTaFOa9GwlFSCWAu5UC1Dh3QI4dxPwq4B5m9Vpw/ACxSzFiXBBadsx3JJCF
	 vMdtfSsnWz3LvC6l82vv1gVtvaAOAiHXalzzntYEppYJF5AEliZ0/1IbeYF6Rp43+Ch0y
	 YEMn4OHILCkfdvVNiuSG+lHDf83J01MV+W//L5gQ3+hb9c1rYMXklZtBl/3x2MCsKW5pR
	 MH6PISeXUsatfdTiI2VQlCHequJCE3MPHZNqt67w2tEHGh46A6wqYLmCuc2vzQXNecN5a
	 uouP/XSRHcM14uqtUSBqxP7CT2gcVPzvOd8QbnNX0yHXs5hT6LWAAZN7DEn97REvCLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789678;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=YHl9cv3rT/5Tt0w871O2pgYVQpO09+K7/1aJz2UPCfc=;
	b=hv1vhktQBB84Rhe3i/EEnOtGWl9O5NCRUoJFqtvv2IzP9e68V5CKPd187H3+fsQzszis
	 0UZpj/bt0S9khCaorJxjHq8Ltd3+efF1dA+/PfCS2HWLSrQbhiIFiBIWHyR+SIyHxp/8v
	 vaVx31lS5xdvodB5spYd/MEPdPq+c40Yv8nybeR/FOOC9A4IaEEDP1BMEYHAHTeCMVWbL
	 IZkXaNWdrumPsOc9ltiV4eGZNvIMGI6+9yBzz+5+1TrRtJANooo9TDBt9JPqaS7cv/uFs
	 Hf7hjhKkIBbA4pJ1fQIAU1sXcpwx/qXW/3VnAZa3wxfHYTpmpvOhj8rDt+pUf+vgCIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hNYkM0fS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA516070BB3;
	Fri, 27 Nov 2026 14:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hNYkM0fS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFCE1F00937;
	Fri, 27 Nov 2026 14:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789678;
	bh=YHl9cv3rT/5Tt0w871O2pgYVQpO09+K7/1aJz2UPCfc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hNYkM0fSZszf5/SAg2tiSQdxRgZTMTlwBTEtWZmtnejxf+i4K5RyoANbOUCErpiju
	 FzbBZF40KLwGln0lm4o/tKTq38bEa1qQHvd7giUSl3UEmxvTwJfOkv3Bt4Ehvt58JW
	 i4pYA5bKh/nncC9zRr5opcIjDOXIQSeFwpn5ZOLFsFa8TXpd/N3iZ2uqFxXv7CzQcu
	 JW21di2frynbwzzTFgIkSp/y4f3CS0cA0H3lYoZNRZiVYdEVVnJYN+yNeeuIcg/hpn
	 CrFEmuoljppu8DxhmA0EbN2ZShh9CwJ9vNHRlt0RFGpZZGjZXDJZfV7P/spf80iONe
	 W1DuUHAPdCKaQ==
From: bod@kernel.org
Date: Fri, 27 Nov 2026 15:27:25 +0100
Subject: [PATCH v8 06/10] arm64: dts: qcom: x1e80100-t14s: Add on ov02c10
 RGB sensor on CSIPHY4
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
Message-Id: <20261127-x1e-camss-csi2-phy-dtsi-v8-6-2793b8e5138c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2795; i=bod@kernel.org;
 h=from:subject:message-id; bh=hP6jDtz3yoY9dMr3sM8rqKaXrcZx7gnbQ6S+Y0MTVlw=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCZNSbSy9bgJ8ju/z6LmEf15YZYo14kXgTjXIJ
 xdfSSplhcmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawmTUgAKCRAicTuzoY3I
 OtsUD/0e2jOhGskMGGwRKCEsoNFOInd7LOaOeyOkNXM4jfnjJz5Ou7xQPbdvGZAqaeceoMjJ/6l
 aDPAXWiOQsg1q92t8opHYQM3WgDRUv6y8GQnPCYmXMQdxnlcR6eLlgd0lSDz2TaaKcynmhDYjWA
 cbcupagLWXSsf8foCcy6rrts9JsNXFujr7p/ap2kB1QFjZmr9PbyMh1FYPukbp2VLPycQth9IBl
 9gaFq6qvP5hVnpOR57PEcInH06sjiX44Q3q/yly2j3qGSWc+izwyZyBsOm7bGb0Q3f7CsVFRdjv
 wWzjc7IubEerEu2W+2nYNn8UlLx7xQVAQ+i4jxZi1Jekxo8s6kDqNRoDUoKtkG0RJxuqZEzWabt
 n8E52Indj1TcC7P+jR9zpLe6d6MjGPdnwtHPmGAlidvnkA6aCGFBoET5Yggk3zQcwN2XUlYusnN
 6JXML/9xWzPaD+VWuCtMj2VD1lNzZxF5TqFK8Z8g18egYWEtJPcXmKPKQb8uPvzXpELG7SkVqBH
 n7pLuCdWOQGUXqqB5TH9c9iuL0DKytAkc5rOlm1tgyWZStFxBxYYszZ4BQlLohnAcw1m8qI09p9
 iFwo/BQvqyo4ETI09RiZD9sHy/r1fZabWtiiN3GByrBxbWl4GOV551KMWLkeLonfK6biyMLNxu1
 yAcjJt8JhK2QCSg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch on the ov02c10 RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index e239ce1e3fdc3..291fa61feb8e0 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -9,6 +9,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -948,6 +950,71 @@ vreg_l7m_2p8: ldo7 {
 
 };
 
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy4_in_port {
+	camss_csiphy4_inep: endpoint {
+		data-lanes = <1 2>;
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
+		compatible = "ovti,ov02c10";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <MEDIA_ORIENTATION_FRONT>;
+
+		avdd-supply = <&vreg_l7m_2p8>;
+		dvdd-supply = <&vreg_l2m_1p2>;
+		dovdd-supply = <&vreg_l4m_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
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
+		data-lanes = <1 2>;
+		remote-endpoint = <&ov02c10_ep>;
+	};
+};
+
+&csiphy4_out_port {
+	csiphy4_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy4_inep>;
+	};
+};
+
 &gpu {
 	status = "okay";
 };
@@ -1581,6 +1648,22 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
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

