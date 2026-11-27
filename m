Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789694;
	b=YJIPOtJoR1z0Gf4EDzpouyfcYzTBcJnPm3XSEV9Auh6aLs6EHX0+R6BhR8eMW87QBDoL
	 E14zfHcl3Ly1yc6IJ32f2pqtK3uubtPK4zxZx5fpBo21mxGFiGCznpt0Z5rILGJ0l5/g6
	 yhKH23LB/R+7DKU621kGHit+1zU/FQg2pmqQCmIVvJQ6BoTx3tNN3Z8rYhq5W9PO6LVGQ
	 ZjbiEJdfub+O+i4M04jNfnuSerimxd+jjuJfj5bMFB8lTkmigYAhix+Iiw6EUjNwfUc+D
	 8H+jTV84O4Z56WbwBXh5YZt/gPrxTcm+ERpUyTzQFXmqPofIgKyj+pJRg5iJo1NOW/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789694;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Qwdrq3KdkzeRvzo11sl/856q/G6aieTye+HXcnEcwAY=;
	b=GgLo6MoLFODse5UeAsCgeX4Yv7bMvh4pdPgJyjvVhA3IyNi62avn7butk1Aniy+9QiL0
	 XpTXzA5NOFBndGy3NPJsXIO1Eg0cysPEbPFcKhgErwFCXhFQUB2zo/Zu/BpjnL15A3F6V
	 scdw07H8B1TjAkgRRKuPqa5pSTANbV8uVF34RA+W2FB7L6UDaTGLPKWNd7UtlMEiOscLW
	 prMJH4eSgC6QN1VmT7H60zzeNb1T0vaQ7osPzipMTvQxLOxoefoDEl6hoIr9RcIIUjSHi
	 EcCLJzSJhHMxOQKdkApWm+PSdsS3oC9GTv5bvGapS6occqOHL/tJaC9CmZgvS6j3vKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JWvWvwMP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A33606EF0C;
	Fri, 27 Nov 2026 14:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JWvWvwMP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9BEB1F01831;
	Fri, 27 Nov 2026 14:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789693;
	bh=Qwdrq3KdkzeRvzo11sl/856q/G6aieTye+HXcnEcwAY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JWvWvwMP7aRree4I2a+9GkkXBKF/2haeavqNz3NL0a7knOQYi7hcDffwcyebRpRtt
	 icYrfjxvfRnrEL3B/UhdMuG7pzR95KEPj7zIOhJYRch+BwN42lHUri0o5yw1MxDsU/
	 rhm9FivVdEoSgCbTDoed767OJiVVYzDrdniJHuwPtc44k4bWcu7e53ZzeU7fzhcVss
	 fyCHPPj5ud76ZIUHc27lt/fhlq/CmJ5CDvK9il0as6C3igPc1xiOnWvHudAmWNtvwz
	 whhkjI+XdXUBM/2gNjFmsviINE7mez3m4tH3tIlpNuEswsZP1tnULdI36s7snwOmZc
	 WRHQkoJqbBsyA==
From: bod@kernel.org
Date: Fri, 27 Nov 2026 15:27:29 +0100
Subject: [PATCH v8 10/10] arm64: dts: qcom: x1e80100-dell-inspiron14-7441:
 Switch on CAMSS RGB sensor
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
Message-Id: <20261127-x1e-camss-csi2-phy-dtsi-v8-10-2793b8e5138c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2261; i=bod@kernel.org;
 h=from:subject:message-id; bh=/8TPTsz6r4pFAeMqcuTVTexJOmcDS7Vd03UFjrwqrX4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCZNTUgLbQSMpfFzDy5NHbxuOPSVlqa76uD9gy
 ebwM0y1ddeJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawmTUwAKCRAicTuzoY3I
 OgSdEACzsRRdZuKGRt1Ptdv5hKx/OwjOvXpZvhRLtd3v76A1+WCeE0Yytk8OCg1HKp4YW0iN/sQ
 wPi7n+ClWix/vWz8JQiQKjaxZGMV8WNW03uAT9cjG11CHYY4gfIFHJoxhvUKlxqjuXQd4DabUlz
 tg7zbAD5+r55DN6uIIBc8YaiqNS66fU/x/eLzjELxKYQsa7eaEdC4lN6n50vl4+1kPwDDsAAoC3
 hG24vgfQsG/xfJCSEOV1Amzo//g1Z84VFp//hEQGcoTATYF1rXZp1ud2f62ClPbilGFww+l0CxF
 CPgXH9yPlqZYoklP/08WDHc/5Fg2rpiEgWD3NCbhMF1WqbuwE4ExrP2YGV4fUmEROXcXME/2pbS
 +judRD4waBEv0SqcBzlZGLs2TZKQo0aqErYBCi8STOGzlOjKtXjEsam352EtwhV9qUXe4y20T6t
 iJ2koeJ9UNr4S5aPSRoCBHFiKU3sUVt4SYAmxeGS59TonpDIQwL8u6teoTEX3uIOP8UHR6PWkOG
 b0YV65RtNIz/rdwiQ13LfsFbsS6hie9pY8U98PBIkndVVztqkEBtmCSM/rvMjhXT4iMNh1dZC/X
 bKTk0iAibwFZEizj7b5RxtFU4ZCUuViDkP0IzDd/W1f6mUDCv+LCMsP4QPF3yjqQABj4sw/fzBh
 91S8M307/+qhL3w==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Inspiron14 has a ov02e10 sensor on CSIPHY4. Enable the list of dependencies
now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 67 +++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index f00feb3ca85c6..cdfe1c8b396c1 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -10,6 +10,8 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa-pmics.dtsi"
@@ -794,6 +796,71 @@ vreg_l3j_0p8: ldo3 {
 	};
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
+	camera@10 {
+		compatible = "ovti,ov02e10";
+		reg = <0x10>;
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
+		dvdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_cam_1p8>;
+
+		port {
+			ov02e10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <360000000>;
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
+		remote-endpoint = <&ov02e10_ep>;
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
 

-- 
2.55.0

