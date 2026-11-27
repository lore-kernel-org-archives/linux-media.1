Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789690;
	b=OabFjbD9yAxmZHgjToMcq0mt4G2flU7QcyCid4vEzhUgcaVawW32U+Sy6WUA/64OJCjJ
	 /sN+O6Zxejenw4iHu8BjpWBg76hk0Sz/EldkU6rsp6ngj5aKNY5HpIubIe66RNBtwiaqD
	 opaXUuHYPXbGF9M2mLYY/81f+VQRgIEmNUys2qaztMZ0kux7ekWSXg5jXbUmc2ZjOTZz4
	 f9UdZWPo8U4OLPG4KcZZ3Q0Ay6aOR6FXgvZX3OeaMh4/cgQfOdMRKBJoufpTs0xsv0zE0
	 QV88ncesT9Fl8b9YYcRSFv03cPDXUiy1VD+Q6QMZpOQp2IUxZnNgEcIRV+FtXb7zzXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789690;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=eNDAKmWBMBom2uIQL1isHMFGSo0cF5fsLQJ0HPlQgx0=;
	b=JtZMazDPae/0XEguXUTiePsSPb3S4VDCq9doMZx8s3TdESlIn1ObCoJuDtwhHLUhSsnp
	 Shot9mvzRT9/yd3cuEuzyVyORfZmFF8+9FVs8Tjf6/Q7l3K4gZfYHtCxYle7beLY4Qnls
	 /hzvxgRv6AHlXC1t0mFy/Ova0coMP3TxDI1a+aKryj5fkQHlVcC8secw+j/e0dvB1NrQs
	 lEbKp+X8dkN6l2lKvquiEip4esRc4t5Bd2XzkDW0sik1dm/LuBaKilu4IVBrkRzJ+1yQj
	 qHLSo8BE116n+tsL5FjOmQolFXjXSli919xO/Y/7+S23sYPCS1yx6ePV02eAcoJX2wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EYMISTsH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF94606A681;
	Fri, 27 Nov 2026 14:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EYMISTsH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1311F00931;
	Fri, 27 Nov 2026 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789690;
	bh=eNDAKmWBMBom2uIQL1isHMFGSo0cF5fsLQJ0HPlQgx0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EYMISTsHBPGMX4rQ0XPL8a7Re9ID2hxljSRfYcbvJnqmn0h8/r8fBvxnwccsUt62m
	 CPZzlA4/O80gqs7MW3e03hckifvR2ACjwhOs9JiXlwtc05HOwfKKuE8VnrsfC3yJg/
	 miNCaeQA4GGPtJ6TuMfyRH23tad+9WvbJjTFkD6NqDoBflgFDD7CrgCzxlOrFzEoL5
	 Y2wqhBIsifTnG4lE/WZSobAc5WMjmARA8XPZMjZR4vG1EJ/xleBYdD+y8P6fe7fiEK
	 b8MSe9iDc1DRrbMirRBHf5G0kdT2ctll9EWijTJTPhuWyGeQxQ+WNNP7dBDxQ/biYn
	 x1AXd5nkHxRIA==
From: bod@kernel.org
Date: Fri, 27 Nov 2026 15:27:28 +0100
Subject: [PATCH v8 09/10] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add ov02c10 RGB sensor on CSIPHY4
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
Message-Id: <20261127-x1e-camss-csi2-phy-dtsi-v8-9-2793b8e5138c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2760; i=bod@kernel.org;
 h=from:subject:message-id; bh=zhtsOBpDqOqkkbz7fF8J0Hw2MW4vs/SlMrWaOqlcaWs=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCZNTzCBsWXHeWTCb8XONLSEj/T6EAmch/gXxp
 JuuWl7Ou2CJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawmTUwAKCRAicTuzoY3I
 Ov5aD/wMGZ+53fIaqRUTx/E4BCI2nkjVS2Amfm5rThppPTMZ8EbGFR7OL/RmTmij+EsykxylBwx
 9pr3thZWetDT4h9UmOXLgSKkwvJPoBuCfHKYGDXMiI6C42uAGjvDIgeOoezM8a4yolngWmnXOL9
 ULVERgEqzbrkc1SfeGfUZmHPvOtxTS4Um03ihRqutbvXGlxN8auC8mJsi5MGfD8eDpJaBVR85j2
 WB7zpFx5Hm3R5dqTNkNigz1i3l/l+oOs0B1OVmpsm1i7IIgoPBTZxefBbvsOkAVjHpi2TsaJ6Nu
 KliV3Ookh9VbAMkBNAiTIt7bdyg98jxoZ7odYPP4vvkILuBtY2i/9F4rW+Kx9GGvsW7pqJE/Okk
 vKY8Gw48478IAe/TZ/HRcrFoSOUR5BsI+19bEMTxD/Z+6oukmCvvYXP+3/oeTUYJ5v30napGAiL
 J6voSiG3/1D4RLVX5h8Og6lRU8iXp3D3AhCt1flN0UcNkQ332Ory0E9oOFacYBGXwQyGoz+Pswh
 ShoG3MWU5EX3gHWjPGTmij2iIntuiG45Z46+KqLwODc/GDK5H0vymbSHIBnO9M1N+t6AUtpAxuZ
 lwVpGUpfc9pQB7N05pj4x/3ddwK2ANXgpj7WmbtNjldbW7MBs0qE05pD9sTHwWSa5X/dTm9KmU2
 XDQ57Ti0OdOkS8w==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add in the RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index a1629b0824e01..68864a294b2d8 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -7,6 +7,8 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa.dtsi"
@@ -863,6 +865,71 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn";
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
+		avdd-supply = <&vreg_l7b_2p8>;
+		dvdd-supply = <&vreg_l1m_1p2>;
+		dovdd-supply = <&vreg_l3m_1p8>;
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
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1448,6 +1515,22 @@ &tlmm {
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

