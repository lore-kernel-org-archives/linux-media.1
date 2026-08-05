Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793F5429CD3;
	Wed,  5 Aug 2026 19:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785959712; cv=none; b=QcbQM36hMvwIkx5EkaPNB34BO0EWmLd70MGgnFiPAIVZ5cLiVim/VPywBlTDOJPweqBx1jalwPvclziQ5tb2mrCLNt6OmuMNzXNe+uAEwK+nZ7EQlEVaS2ciP4TzL01Qr8CLiSDAG9NEWp1Gbo7yVGYMAzfIAAgT0WlTKTNMapc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785959712; c=relaxed/simple;
	bh=4vqU0sKhpd2cHpT4Lxu26NnBdLD4y2ehzn2oQCksO+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rgRFsbOcp3nzF+PIMZMHoGJDHdXGKuWpMLzSVSh5rmxwysFUUbE1D9mxmfguYNLIXYSlVyygBXL9vfoFhmp0r7zStjABkBS/S7UzabuA5DYTahbx1lI9c8pwJT5pbDFXWvz0uRyOBrT1x94Cs1++lnrh6GoNEMT53DJE86VXjg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=E6hNdPso; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=pvOANcts; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="E6hNdPso";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="pvOANcts"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1785959693; bh=CaUT5za+xlw7XVD5v1CLX8U
	QXoGEYMhrTRTb+I8jBsc=; b=E6hNdPso1YgdMxI+j5zFMi0z/j4BBBJOp+rgsMCE7FH2Fesbpn
	0xMWBLMR1t8aVKL3dfdMl/NhqUISMumaBlAthE4sgN9VhWyFyL/TIXvzJ85eN4nA08dwgNX7Wud
	XhVucn6hAKBTWiha1LKlnsAxLdWrwdlV1S+uwq6XO8Gj92IeGOZ401X8kL7cKLWGfSGWSmSykAO
	mDcz0nt7k1KzqcvPv5vKdx1amiyTRIgAf/lMU/dAcwROgjTwkurY3Xhzle4rz019npUJ1RyvOls
	XWffrIRXy2cg6WYPf/esphOjn1dZ1ucwCu8QZKO11VZry7gYVmbl1KIbUvtHh58M6Zw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1785959693; bh=CaUT5za+xlw7XVD5v1CLX8U
	QXoGEYMhrTRTb+I8jBsc=; b=pvOANctsEf72cxKGB66cm5SbbfvK6hJFzlw/x/7Y+tV8qba4eh
	l7uZUYwatNu9JC9QlMj4LbnPhdRClL/YWUAQ==;
From: Danila Tikhonov <danila@mainlining.org>
Date: Wed, 05 Aug 2026 22:54:27 +0300
Subject: [PATCH 4/4] arm64: dts: qcom: sm7325-nothing-spacewar: Add front
 camera support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-imx471-v1-4-7be79f539ed8@mainlining.org>
References: <20260805-imx471-v1-0-7be79f539ed8@mainlining.org>
In-Reply-To: <20260805-imx471-v1-0-7be79f539ed8@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kate Hsuan <hpa@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, 
 Vasiliy Doylov <neko@altlinux.org>, Achill Gilgenast <achill@achill.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Danila Tikhonov <danila@mainlining.org>
X-Mailer: b4 0.15.2

Add and configure the necessary nodes to enable the front camera
(Sony IMX471), connected to CSIPHY 0.

Signed-off-by: Danila Tikhonov <danila@mainlining.org>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  7 ++++
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts      | 46 +++++++++++++++++++++-
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f2da3706d5c8..9a66e65b2271 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5852,6 +5852,13 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 175>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio64";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cam_mclk3_default: cam-mclk3-default-state {
 				pins = "gpio67";
 				function = "cam_mclk";
diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index 7db9ae1c3cef..272c56328686 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/iio/qcom,spmi-adc7-pm8350b.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
@@ -831,6 +832,23 @@ vreg_bob: bob {
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			csiphy0_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				remote-endpoint = <&camera_imx471_ep>;
+			};
+		};
+	};
+};
+
 &cci0 {
 	/*
 	 * cci0_i2c1 bus is unused and GPIO 71&72 are repurposed.
@@ -843,7 +861,33 @@ &cci0 {
 };
 
 &cci0_i2c0 {
-	/* D-PHY sony,imx471 (Front) @ 0x1a */
+	camf_imx471: camera@1a {
+		compatible = "sony,imx471";
+		reg = <0x1a>;
+
+		vana-supply = <&vreg_camf_vana_2p8>;
+		vdig-supply = <&vreg_camf_vdig_1p1>;
+		vif-supply = <&vreg_cam_vio_1p8>;
+
+		clocks = <&camcc CAM_CC_MCLK0_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK0_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		reset-gpios = <&tlmm 20 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk0_default>;
+		pinctrl-names = "default";
+
+		orientation = <0>; /* Front facing */
+		rotation = <270>;
+
+		port {
+			camera_imx471_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <200000000>;
+				remote-endpoint = <&csiphy0_ep>;
+			};
+		};
+	};
 
 	camf_p24c64f: eeprom@52 {
 		compatible = "puya,p24c64f",

-- 
2.55.0

