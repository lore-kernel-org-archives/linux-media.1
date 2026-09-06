Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BC54457C4
	for <linux-media@vger.kernel.org>; Sun,  6 Sep 2026 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704486; cv=none; b=ad/QRVkY9XwL/RlJ85vzt5js6SpXqqrU86752Sf66wfjsqiUDRP2Kvs/kYFSyxrIhy9zYt2RcsJ2bseQOHdJPjZ+7xmlRYCVNXV1R6iZhhJlR973du9u8SA9e7Fnb+56Vo1BksWRdYbrgsMW4OUumV/3yEvPHl09I3xAD6K7otg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704486; c=relaxed/simple;
	bh=T3eCxqMEeLwX423LxUJKnOfgBKSe3waR1F04b0ppdB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pOxw2thaPkibdvF638wJr3LH9sLDOeOe3/1kWZhAAtW4WCnY3eYWHJqmRwFggEYSIRSzQy7yFfXw+reeiNCM30W6mbE6AZ/NueGx/FJMeH+mepY+G/+VD1mEsaHLwilcqzUD1E5PTDj0NLgj8g9r4Pu3WDO7yz1V6Nh6Ywsm7fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qeNi0mAP; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qeNi0mAP"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1779179f8f.1
        for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 07:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704469; x=1789309269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UV/xxFOLjb67oe6b124gprVUysFfmBCGWhquo3HhkBM=;
        b=qeNi0mAPulgLZvFvSDLTOJRyVHuPdJWv4BEUMe5t06uNhdPwtcijEo8HXp5Nm80q1K
         G+A5mD3Hd0Nw2tvAuGAwGDg74Oodwiy5H+XHauVLmsASZj6LvaW8HhFqaRaUmbheNNpS
         A3w/rRbZQ7iKiQgKqj6knguAyKEC0Iqb2Ptf2nVfQQQMcctbSsFgzkgLRqImJWFUe0mj
         zOhojdJm22NH1V6CiCsVCSqxbhTpetzNibpxGG7nw8mnSvZ2OpZEvhs3wCwlPcrikxOL
         sIMA8OHUl1Hv+2/kIq4+j/79JYF5TaDIf124MgFQ6SJzpP3dT11eK9ahthyorS/II3eS
         Y75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704469; x=1789309269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UV/xxFOLjb67oe6b124gprVUysFfmBCGWhquo3HhkBM=;
        b=d7ucp0OQz9vnsBY4BhCqUxh6PvdyYHh1EmFZJx0D9A27UHQ496iJS4EfvJhwRmdPku
         b7Gw2G3cv0wr/sVfxI1y6coaV+c0jpyOgvtNb8wJGLcxRirEqEJ5DD6aXrN7BkejVmfK
         TVTHHaQKbhGcAan62L34IBSLf69zitllD1FKTOPN3TT+6EGv6OFTfQevbUDdvO6EBNOD
         TqkIolAFrFCVnTOjkym83G1ztFs12KmwtJjC7qFYQQKQ0dF3vO22loLQVbxQgrgHnCN2
         yWBhLurVfIaDSBBOpnUa1FZOYJs/7DnCiGqYmp/QPLxuqdTZkO5RV9kKgWHOfHvwQypL
         HQWg==
X-Forwarded-Encrypted: i=1; AKwUvBwYyRel1pyAO6uDrcIhrjm8v68cdp4MqGDXxo+hznlrEK8eC3Ry/EWSrKU8H+8ofMB7Js9kzcmFVfD/Aw==@vger.kernel.org
X-Gm-Message-State: AFuF++k99GQ8gjplWziGw9OkjhWrp2d23cz55JG+7U1fTqQzdBam26IS
	wutUbRRddJQuVLnl7oL/6JH08CAjSil/7B/XsTf/IELoELSP0irr0Se2Ly7bNsibNFPcRerekrd
	udjCCi24=
X-Gm-Gg: AYBFou1AInl0vsiJrw7U3ipH2lVW6PcXGh1S2CYbg1v4Xxpabb1SczbqnbLDpg2R/Fx
	kB/LOxwcUGedFcZIqYectKWpKyxd9pAqdbhiL85v96fEKEi1RKhX4tIx7ibYrodYX6JnECVTGf/
	7gcaF/rZaBUImKM6TG8SOXzUCteDcymxtQu5jgDOo9100eSYPZuTvmRYzE0UKytzt4sWgy7Vzq9
	QDgtSpu1zZ0TC4JvqwrKK647jF0tr1+b+v2y5zwpeZ34tHCVyiOLVyIDfWKeytNf7UPcZ/7G2RY
	HKtqImDPNmIXI9fiYDcRq6W/dOydzi6RKxoQfPI852feandWpfUvq+/745VSZObAwo3fCMzdctz
	6mjJ9viunSs/ACJQSNZ5522jDk9tikB96XL2quNfvfSzslejLjBPJldmET3+02t44GxF2ZvmmFZ
	C0o/B9MnsEQ2EuJh5D4yh9v103i0pIu19wk3JFNluXLubk06i5TDiMRtECvHhHsVo9RgzXu6mxd
	+YkGYQuU2U=
X-Received: by 2002:a05:6000:480a:b0:485:8e70:c826 with SMTP id ffacd0b85a97d-4858e70c8admr13201212f8f.32.1788704468849;
        Sun, 06 Sep 2026 07:21:08 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:21:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:57 +0100
Subject: [PATCH v6 12/13] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add ov02c10 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-12-067f2ecc4630@linaro.org>
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2957;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=T3eCxqMEeLwX423LxUJKnOfgBKSe3waR1F04b0ppdB4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbDTJqsj1FFeT/yfRBb5orsdJ90SBzEdVkSs
 UGzykaxMYiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12wwAKCRAicTuzoY3I
 OkVoD/9E2+yIeTEe3MqaK1z01nRoleTuJONPR0PMxBdKgzGfVkWXmLVqqOMv5TnF327QymV2MNR
 pFPWF+UkwEequ7Y2naGZ/mdB//5b1W2Tw+FjMNRq8GFObng8V1AQzjXBCCCmFQ2KmlcOyegkVbI
 tZBiNL04PNNwxsnVMNLtQFWUO4w4UfQyl0wi76XIIuTL9qeYSELxrE+fauDdzpmhs0iVFpPILCl
 Q23lY/PGl3ONqvJnuRdPcHLPtQIKtZEmoUJORlxm/mRtQl8Ds4sBg/mg3r7Evv1LNzuOyBaM0ky
 6yNca7O20bvO0IMNmCJ4bMK68/AUaOB5BKuJq5QxzxIngqU2So+vgsrtgRFpL9JOyghXpraup89
 6wqUx+RDJDSd/ab5cquQdxuqiI3U8ko1fjvAA1kz2ja2pUzEyu/RiwtGtUrAeOze6RZTFdjS4m0
 nITWrrulw2EoFpvQ6itud+/HWgE7nBWbwCnHp3AB4/xwyLj36Ug1TGxr8/X1QhdOZS2Ebs/mEhb
 gyTnHpUfKCb/rwTer83cajrAlXJPWpn2X82Vm7qmzL1rdyzjz8624uCIdPP1wWedEFdacOYFCEE
 SuQa7ZBRWfPybw0AwWQHr8AHRTOZCdPpFtQ9VH+zPLNzQ4ul5kol20m5fibaTbHMAAnfzBKK1EH
 A/LF20nlYLfhZiQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add in the RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index bcf3e2f610e66..8290f65f8a70a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa.dtsi"
@@ -863,6 +864,89 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn";
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
+				data-lanes = <1 2>;
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
+		orientation = <0>; /* front facing */
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
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csiphy4_in_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov02c10_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			csiphy4_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy4_inep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1410,6 +1494,22 @@ &tlmm {
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

