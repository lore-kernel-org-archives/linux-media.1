Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C7A381E8C;
	Sat,  1 Aug 2026 14:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785594745; cv=none; b=DWk7sYYR+Gi+5tfemVXOkHYbprpixUYZiXHtCgwW4NyCdCa5R2P9CjZziAkLdQGV6SBHa5kn5p1JIL7n44l5wrBmjS0DWg+R2676TEQOfqpDKmDNW87U0j6lP6WO9CrKj31wZU7VjnXH9uGYVG7B2UNVYlm9dKtmTv/vknTKOyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785594745; c=relaxed/simple;
	bh=UDdcboDBEVlfo4N+cqtFjEzTajfx/2j499qxUd6mUPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1nXosB6Jaa4V1cydAqNmKmTbyEVJrI4OLnmuR5Hb7V6p1G3qW6BN1hOgZGxpgMxYI4GHYqo9tuTRxtxsjTr4Jj2pYGoHZ24gpSV/E+FmL8VhwEA2jIZeuFZs8VFFi9yvkyQiok+1kZsSOVNKCFxhczBR03grdSebmCIUEgkF24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=R8msythe; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=VtcAK16P; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="R8msythe";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="VtcAK16P"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1785594697; bh=125F0r2YxQ1fPS62jY91PTQ
	NKceWNC5vl5XI4l9Q9V4=; b=R8msytheN0oHoLIM+foqT5rZolp8LuhTCHmedpZyl+gB6Hgfln
	hvmDfEidGiMmBrgPa7yGvXxudsaUZsxpjzdb5SQObkp9R64E7F18qstms1lG+a/oA57vlpbu3a2
	m3rtvApbvP8LP/Io4Au/cE6rLjj8oLqEZnMTpBiPKCzzLUvg6lLf0CYYOWJDIl8AnWxM21+PGQX
	wuWZgDsWCjQxhMGEzRD83duaExSWLVCeV95dc4fVCKl19uxLE8rvbAaI6l/xOZQ2w9jRYBoH88n
	dFrtBET66YxEId8ClyYOhVcasSMBSIB7pk89/rZCtkEsLTmdxS/TtH24mCbDdOevPWQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1785594697; bh=125F0r2YxQ1fPS62jY91PTQ
	NKceWNC5vl5XI4l9Q9V4=; b=VtcAK16P05nZ9s55eqy2pwX5QxUjhSxhvxqRRpdthSdq8NyoAP
	dfYnqpfe3ZLtQe9VcF55bu8cvzQ7Vg0zWMAQ==;
From: Danila Tikhonov <danila@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Eugene Lepshy <fekz115@gmail.com>,
	Vasiliy Doylov <neko@altlinux.org>,
	Achill Gilgenast <achill@achill.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Danila Tikhonov <danila@mainlining.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sm7325-nothing-spacewar: Add ultra wide camera support
Date: Sat,  1 Aug 2026 17:31:25 +0300
Message-ID: <20260801143125.267054-3-danila@mainlining.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801143125.267054-1-danila@mainlining.org>
References: <20260801143125.267054-1-danila@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add and configure the necessary nodes to enable the ultra wide camera
(Samsung S5KJN1), connected to CSIPHY 2.

Signed-off-by: Danila Tikhonov <danila@mainlining.org>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |  7 +++
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts | 47 ++++++++++++++++++-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f74fa66f1a67..96bb354dad8f 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5851,6 +5851,13 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 175>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio66";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cam_mclk3_default: cam-mclk3-default-state {
 				pins = "gpio67";
 				function = "cam_mclk";
diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index a6ba19cb60fd..c36e3274f783 100644
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
+		port@2 {
+			csiphy2_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				remote-endpoint = <&camera_s5kjn1_ep>;
+			};
+		};
+	};
+};
+
 &cci0 {
 	/*
 	 * cci0_i2c1 bus is unused and GPIO 71&72 are repurposed.
@@ -860,7 +878,34 @@ &cci1 {
 
 &cci1_i2c0 {
 	/* actuator (For Ultra Wide sensor) @ 0xc */
-	/* D-PHY samsung,s5kjn1 (Ultra Wide) @ 0x2d */
+
+	camu_s5kjn1: camera@2d {
+		compatible = "samsung,s5kjn1";
+		reg = <0x2d>;
+
+		vdda-supply = <&vreg_camu_vana_2p8>;
+		vddd-supply = <&vreg_camu_vdig_1p1>;
+		vddio-supply = <&vreg_cam_vio_1p8>;
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		reset-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk2_default>;
+		pinctrl-names = "default";
+
+		orientation = <1>; /* Rear facing */
+		rotation = <90>;
+
+		port {
+			camera_s5kjn1_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <700000000>;
+				remote-endpoint = <&csiphy2_ep>;
+			};
+		};
+	};
 
 	camu_gt24p128e: eeprom@51 {
 		compatible = "giantec,gt24p128e",
-- 
2.55.0

