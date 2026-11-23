Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795396914;
	b=DFi8xgMvxnPdQOwpPq0n/okqLMN70/T+WIIzYQ99fmLFLEQl/2wwcax4UD8u/87Mg5qj
	 qD4q5vW8urznimbA5muHDVJnohjSFOmCK8uAisez3aHVc++IzACLi3aSHB0dtiPaKJ/x+
	 iwuX/pRGVWBJxYoeb/zEdE4HfRmua8iXKw61vPGJ0DH/4Ta97Udxaidcx4zNCDM/Sd77i
	 N+OfH+OzYpKPM4xfZaZo+1pTifZntv8KBEYP3kbDNtjCythfIGglVxVoxPLDSL6CUWAMA
	 /KAWI4cZXgE2TYkQjd9jexiTMszRYLC1NO9PPjtAmxh0r9X13L80JTTMVzr6LLc7+MA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396914;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nJu2NNuYTEULSW5riysMo5NbTDgqpis/Y7tsuXDcHJ8=;
	b=4GKAnpFLP+OYn2802XCleB1gz+pblqRNDnkUalOkt2l2dKhMK0mD0k/R6JlZcqKMDFfA
	 Yyp5z0DtQl/dRkqOWLoGJPi3gE7tYM6wG2Eai2JedJpGlgoLNykkQFhOqAb0KhKsr/0fS
	 7JaCDSMXqb5dRxGJ20RxGmX6SnEj9ehoNs1FsIOa3XQcx+eElhv+EEGpFOmDL2l4Z6Qgn
	 zHtBm0pRUFrh36MHLRn4p48pSB2urXsv/Kks5n6f68cX3nY2e5weJmNF967vYUqJMSFNu
	 AnTh1ba5u93LMD1qG8xul6J854USvmfAhZZ3ILlFlRKiL2WyfwiT4uxIK+rKQYd5WQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Do8t4uGC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BA2606A335;
	Mon, 23 Nov 2026 01:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Do8t4uGC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795396914;
	b=YgbaMxl5ightBqgeb2/Dyhgkb0OYrREgB9D7tAGj3XfoshO8phMMSscM0yuzDVc1Kdp4
	 Tg/ZYzcy/v8XVO0FTHcSMrz6gHM3lxt8hzItH//qRJxJe+gszCcJEIwdRprk9WIiEqOON
	 QJjibET3o2EkNQJautpjUqZ+1s2euaXU9Hvoq9effrpj7goBJtol++Ab0JJBa5E0UTYiH
	 sgPzOLfTzpY1c/yJcjHZl9jDUUwrt+C9LMxiev46FDeGl8RI2fpNBbJUI1f7VSzyNevNp
	 cwMm4UDrNjM2I+9NH0g8n8A8R2IO3dSkoRx6VZW3j7GCh+jXBa2Jov+8y/Pn63TWaTg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795396914;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nJu2NNuYTEULSW5riysMo5NbTDgqpis/Y7tsuXDcHJ8=;
	b=Qy8+4VHhZkmPw9/rj7nTBujcVMLeWK6DOvIWUIj86y7nbZkQgiMXo8iWBM5a6lfBZep5
	 VMqW/E2xJIj5QbPFU1+kVl5m1pCObFdDm6Y6AW4CUr6kqc69h7QsApx/mhRUvgeJh80i/
	 Dun/QcNRwPkD1X0bxeuklYQpOgw6IhN51N8M6CwWeY620PKv6JnGpNfFPev0HggAZdf8h
	 zKZqXh9S1Foev8w9ODOVJnoHpWD2V9oTx/xShCCVMp/BvaI/d4yKpNnOOmQ1g4cFKDYHQ
	 egMPHa+mrxvWfKgKAnKmSNDU34OYdEpqXj3pgWPiR/jpltTmv7n9WSX2LvjwN9dRp7w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 889351F000CA;
	Mon, 23 Nov 2026 01:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795396914;
	bh=nJu2NNuYTEULSW5riysMo5NbTDgqpis/Y7tsuXDcHJ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Do8t4uGCs3hSpxMbkklO+v0L2bQ5dKK7CSq4aE7LtDAbJd/LFB559bBmaDdI9obz2
	 BXOvdRKoWhe7XSx5RzgMruFRqswi3wErwB21CPWALZaf2cHn2QEk6WIVGHSNnyM9qz
	 M8nQUENuME3Z+L9MFYvSFeBwRTEA3YtOlRsO9/41ZtWDB2amwpsEOkNyk0HSbgmlsX
	 z9SO2GU4fmuFK+h+CARzAuPz1XIs9sCkKhE9Vmi1s9Q5Xrljq5G/HgMasOHdPWfOyA
	 6ICkuk1i5jdS/T1ts9Ai6QsMjyY1otzAlp0LyrEgXAaGMFejnIdqBCrmsKZtCzoKbI
	 xGrG7sqIDsGAA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 149B14C2BC;
	Mon, 23 Nov 2026 01:21:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 23 Nov 2026 02:21:48 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sdm845-oneplus: Enable front and
 back camera
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
Message-Id: <20261123-op6-upstream-cameras-v1-3-234fb3b7bb18@ixit.cz>
References: <20261123-op6-upstream-cameras-v1-0-234fb3b7bb18@ixit.cz>
In-Reply-To: <20261123-op6-upstream-cameras-v1-0-234fb3b7bb18@ixit.cz>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8366; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=vioKixhUcBrwwUTgGKdctZDr3XqKcyo5CZdW0NlSvjI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrA5UvJrRVM3REvUFYaKzBnOFxLcevvLq8grDRj
 M1GP3jtwK+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawOVLwAKCRBgAj/E00kg
 cgpGD/44GKgcdCRaD1DZKWalH+uHCn2hy86fK3Vnro7d6NGQJMJ48JIdoLQTO/ThAFX83QFGeK0
 tbTAK8RHzvoOkWy8oTerirZjeak7W1HXHh9kVFk+vz+ikUG4f6/KHIMnpkO2hiscX1HhdQmi2/c
 vo01zVS+hax37F4acHBDomMQImYOnFajiSTogt72SEZGifackT+VMXR3sC5kMKzaGRvfldNrl5f
 KFiivchLFksdcEuTYyD4PrNq24Pk1OAv9F/hvIFjip9IhNJPTUgtNguaRsUYZPZtvR4pDF4Zbzt
 hao+kz0hkNxPZcE8kVCe+gZkM42e4sMLeLZoGLbFdqdNKE5bCNzVSbmPZFG3j8kNvh11746en3i
 YWnMW4CQWxgGDuORde6/oR95sHONbRUZ63qBz3IiW/Xc18x9DT4vc6Z3kAZZWi7F58VMjLVIPoD
 vXMWo9RtwyuTpmyZyte5K8gvPH0pnr9zs6mBV1TXI4lFEOvEnVgTU48U7drHKIVFa4tdlP/CPE9
 QR2ZEpnsI2p+ExjALvkchdUVTFC/RXW3pBYUV4oLVJ2h6fkkOLEM8N5zTB97y1T3VfDNTNZ957z
 MfcJbGilaHmnfjCla41mvAz6Nl60Jkhv7v508UFpxsbLPUy/HrKvGZXU5QlIbB6Jxyge+U6i2rY
 09u/6l91Ehqy2cw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

OnePlus 6 and 6T now support one back and front camera using generic MIPI
CCS driver.

 - Sony IMX376k (rear)
 - Sony IMX371 (front)

Based on work of Robert Oscilowski.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 243 ++++++++++++++++++++-
 1 file changed, 241 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 1df09da3c4d71..92317f23bdd15 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -3,18 +3,21 @@
  * SDM845 OnePlus 6(T) (enchilada / fajita) common device tree source
  *
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  */
 
 /dts-v1/;
 
 #include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/clock/qcom,camcc-sdm845.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interface-devices.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
 
 #include "sdm845.dtsi"
 #include "sdm845-wcd9340.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
@@ -262,16 +265,68 @@ vreg_pmu_ch0: ldo3 {
 				regulator-name = "vreg_pmu_ch0";
 			};
 
 			vreg_pmu_ch1: ldo4 {
 				regulator-name = "vreg_pmu_ch1";
 			};
 		};
 	};
+
+	front_cam_vdig: front-cam-vdig-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "front_cam_vdig";
+
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+
+		gpio = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_s3a_1p35>;
+	};
+
+	front_cam_vana: front-cam-vana-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "front_cam_vana";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpio = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_bob>;
+	};
+
+	sub_cam_vana: sub-cam-vana-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "sub_cam_vana";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpio = <&tlmm 78 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_bob>;
+	};
+
+	sub_cam_vdig: sub-cam-vdig-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "sub_cam_vdig";
+
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+
+		gpio = <&tlmm 79 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_s3a_1p35>;
+	};
 };
 
 &adsp_pas {
 	firmware-name = "qcom/sdm845/OnePlus/enchilada/adsp.mbn";
 
 	status = "okay";
 };
 
@@ -405,16 +460,22 @@ vreg_l26a_1p2: ldo26 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l28a_3p0: ldo28 {
 			regulator-min-microvolt = <2856000>;
 			regulator-max-microvolt = <3008000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
+
+		cam_vio_1p8:
+		vreg_lvs1_1p8: lvs1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
 	};
 
 	regulators-1 {
 		compatible = "qcom,pmi8998-rpmh-regulators";
 		qcom,pmic-id = "b";
 
 		vdd-bob-supply = <&vph_pwr>;
 
@@ -437,32 +498,118 @@ regulators-2 {
 
 		vreg_s3c_0p6: smps3 {
 			regulator-min-microvolt = <600000>;
 			regulator-max-microvolt = <600000>;
 		};
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			csiphy1_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx376k_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+			csiphy2_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx371_ep>;
+			};
+		};
+	};
+};
+
 &cci {
 	status = "okay";
 };
 
 &cci_i2c0 {
-	/* front sony,imx371 @10 */
+	front_cam: camera@10 {
+		compatible = "sony,imx371", "mipi-ccs";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&front_cam_default &cam_mclk1_default>;
+		pinctrl-1 = <&front_cam_sleep &cam_mclk1_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		clocks = <&clock_camcc CAM_CC_MCLK1_CLK>;
+		assigned-clocks = <&clock_camcc CAM_CC_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		vana-supply = <&front_cam_vana>;
+		vcore-supply = <&front_cam_vdig>;
+		vio-supply = <&cam_vio_1p8>;
+
+		orientation = <MEDIA_ORIENTATION_FRONT>;
+		rotation = <90>;
+
+		port {
+			imx371_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <654000000>;
+				remote-endpoint = <&csiphy2_ep>;
+			};
+		};
+	};
 
 	/* rear sony,imx519 @1a */
 
 	/* rear onnn,lc898217xc @72 */
 };
 
 &cci_i2c1 {
 	/* sa,sa3103 @0d */
 
-	/* rear sony,imx376k @10 */
+	sub_cam: camera@10 {
+		compatible = "sony,imx376k", "mipi-ccs";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&sub_cam_default &cam_mclk2_default>;
+		pinctrl-1 = <&sub_cam_sleep &cam_mclk2_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		vana-supply = <&sub_cam_vana>;
+		vcore-supply = <&sub_cam_vdig>;
+		vio-supply = <&cam_vio_1p8>;
+
+		orientation = <MEDIA_ORIENTATION_BACK>;
+		rotation = <270>;
+
+		port {
+			imx376k_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <500000000>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
 
 	/* onnn,lc898217xc @74 */
 };
 
 &cdsp_pas {
 	firmware-name = "qcom/sdm845/OnePlus/enchilada/cdsp.mbn";
 
 	status = "okay";
@@ -956,16 +1103,108 @@ &usb_1_hsphy {
 	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
 	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
 	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
 };
 
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
+	sub_cam_default: sub-cam-default-state {
+		rst-pins {
+			pins = "gpio23";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		ana-pins {
+			pins = "gpio78";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		dig-pins {
+			pins = "gpio79";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
+
+	sub_cam_sleep: sub-cam-sleep-state {
+		rst-pins {
+			pins = "gpio23";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		ana-pins {
+			pins = "gpio78";
+			function = "gpio";
+			bias-pull-down;
+			drive-strength = <2>;
+		};
+
+		dig-pins {
+			pins = "gpio79";
+			function = "gpio";
+			bias-pull-down;
+			drive-strength = <2>;
+		};
+	};
+
+	front_cam_default: front-cam-default-state {
+		rst-pins {
+			pins = "gpio9";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		ana-pins {
+			pins = "gpio104";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		dig-pins {
+			pins = "gpio117";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
+
+	front_cam_sleep: front-cam-sleep-state {
+		rst-pins {
+			pins = "gpio9";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		ana-pins {
+			pins = "gpio104";
+			function = "gpio";
+			bias-pull-down;
+			drive-strength = <2>;
+		};
+
+		dig-pins {
+			pins = "gpio117";
+			function = "gpio";
+			bias-pull-down;
+			drive-strength = <2>;
+		};
+	};
+
 	hall_sensor_default: hall-sensor-default-state {
 		pins = "gpio124";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-disable;
 	};
 
 	panel_vci_default: vci-state {

-- 
2.55.0


