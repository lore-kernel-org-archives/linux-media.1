Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C540B495044
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519428; cv=none; b=r1kz7g9rUokUuRvNjCqpwJsExEwww0ISUSW5znHcNAlwHbXuCeiIp8w1bMcnmLLnZSLWL+5rw0ChJKnSGqQZUuHjCicWPP09zohoxtldcsac9Hj2XyTCxY5MQZWvK4Ljg2DFVDacSykVaStsIiY3S7A/hlvLH4vY52AE6Va4FbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519428; c=relaxed/simple;
	bh=bZrLMcImBykx3oRRK3HVVood6l6S2lGXu7LQOJWI3H4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HvMHN1aByHsc5QrpzC5qE+OTXq7Jjo4w7VGE2HaD5s0lrVCGgAJ/b8kHHo3tu9hHwAjQsPHJf6C44AZDEZ2XNy3TBqa5KMwoF34QjB6BpmSbXrGQda6PCohYd0K1gOHMTK0fsvUwVIQriTYSnuM//cbqn8gIcf1mCAUixDzPdhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QQX16WaB; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QQX16WaB"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-484362f5c4aso1032792f8f.3
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 03:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519422; x=1789124222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9q3cb1HRmrEaFH2Sno52PzoSLUWQfgcsQ5S1xcRpY88=;
        b=QQX16WaBqriZdh16HOIdkxn0IFyirjh/3tPEGTyJu11h0c0gcUnFe5sWw1QCZ/xIUn
         12E9JJjJeU5bnWxOTrL83USINWZkXM1Dpifx3GGPUX0ERV5kZpf6K74IpMG3mtye6hIg
         MYMZJSj7vZ8g5zr+nr80xHuCOCXVM1nrXkp+e5y23JWSUtQt5gTDpqbFdX86A8HG6NTH
         TeffFfUjjcqO1+mG7mQ1c79CJArwO8/PE4ayQs/jm0eYObPti9q+T7TYvudd50YahjO+
         tdVA9LT9edX247AXQo088TrPfIp3w07avx/yQDNxOYt76ar0fsefshGsptIzJhuWmmnG
         trcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519422; x=1789124222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9q3cb1HRmrEaFH2Sno52PzoSLUWQfgcsQ5S1xcRpY88=;
        b=f2OSELzzFIgjWsgveGG3VJILk/VXvvy3DsYlAKLAb1fTU72XE9NPmD1pxBTbOG1RQy
         u54ThIk9ooTWPEYogroakBV/C2zjDkvNFWN3XU6gJQuFT67HBVl2QlHhLoaJ1hzvz/LX
         Yh0C1UvYYYJEY4DRgA8bsCngsFDyJJxIeZERxmyJx8NW4SaK3E0nEygiOyeZaBarMmbz
         bi2gKMoNWOkYPV/rGz6OHHtN6dpG8KyRbgjbNi96aFEAR/pktUhC6xJ29KbzPHX/IsUL
         DoBlMmknqT0nGaYyQ95lG4iy3NRAnRFsbO0ZZftLUqGdW1nYu+A9YXv+N0zQwmyejW1z
         +V6g==
X-Forwarded-Encrypted: i=1; AKwUvBycoyS9iN0JOL/9Ec75zBHSd5QdZKMNdU8lmmTWqDqfQAcovQQFh1ApC/aZbzw0a3Zuq3hRAutAO+TVWQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mkfHNHQxwzJwDlG6TbA3kFaLPBWx6nXNfXoYgRMCb3tKIXzq2c
	DepXYRwhXx2bwlDTw6Xv5WMD8gbNh30bqGKEIWeu4zOr3Kp2RtHZ9WE6LcG3aaaG8d4=
X-Gm-Gg: AYBFou3Goedra/zVRzo4Bcgb8fm53N22adJGux+PIjnxdRnEcyHQR7dzLdktHr3A/dj
	5fnSilbWPnkwz3x4GLC6+7LlOvpMw40PuT5blsA3X2DsiWZwERkpBz6g5K7CPsHEl0JnwxckjoC
	oc+GSrPRHqK4QZZO5A3w7ucJ59Ehy1iFiAV5dOztT3am8cZP8Er3Hz1n7k5dlbDPHMsI1kyJxzd
	bc8Xo1hTpc1vto7OPEEUwnyBji1wkeNNu1o6cRHKmrCPtitwnBhcqKfcFvK6OItj3rAC8TBQmnW
	LnxMvZcsyKAJprU1+cW54M7Fnq1h1v9fukvgPtHHF9XEEvogp8v0+TVDVBXOXPsnuioPIt9ksyU
	gGVAzmpsVBQnxn3ixIh8oNL+D9XQF5pNv5RC3hr3Alyr6sfNid3lQZ7IiCIdI76UGecQY+rcHsy
	5ey7jANSiY3+SclRXaIpqbxVAlrGFaFtW/LG++g9Z9b0FkZJ8h1b7YNfX2hzz145Y/mNY8QSG3
X-Received: by 2002:a05:600c:8b09:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49cf823f57fmr88570735e9.10.1788519421540;
        Fri, 04 Sep 2026 03:57:01 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:57:01 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:45 +0100
Subject: [PATCH v5 13/13] arm64: dts: qcom: x1e80100-dell-inspiron14-7441:
 Switch on CAMSS RGB sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-13-dc81d85b599d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2454;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=bZrLMcImBykx3oRRK3HVVood6l6S2lGXu7LQOJWI3H4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPplgz/ddFP9fKrMGKohvRQDmaTVdX2mg+Bf
 g3Hivg2Xs2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj6QAKCRAicTuzoY3I
 OobQD/4666ZAH+ofmP2fKuH8xGv8qMu/HlOUaedLayTC8HzTkGVwrQ2nk9Xfz2DF/aQueH9Ry4+
 WBf270VS1yqP33BHAj9nd2/7JUXkwJxaNzGmxfnYgkLgojapETtpHcz5t9Eq7fKs/ZIfQTVmWbW
 gkPGaT9aSqQjyuTWZ7vzDvYG0lHtEaLjEYk47jxiR0AjnOajZnG0Ijm1zGLo/M4ysJ2hyAofkqE
 kZiRqOZd4887vucVlPpKlvJ4RztocTf3/k3rW28ecnyZgv6izXM6QDSaQiV8dZPsfIal+fV0tnr
 LgLPiT7508sz6s41G0DBpcgt9N/41eT6DGZ/t7WACT/R3E1n6XIwF7YPd3ogKp/xqeRrZIJ2vf8
 vZWPgctU3KAlf8Hj8U7JYoBAO41eChNnMrgGHdkJtQYekxTxKDKliqYGIwaoWcC06mRYjiNTPee
 /EPN0CqO+tdokiFNKWP3b/c1R4d2felcCwcJgxhpvvGNSwgVJye3brHv0PWiaXztimxrz6in9gZ
 WbxP1xRfIQ1po1XYTOrHyW1S5e/0oR5VUD0/ST5Il5W425MKYJA5hTzf78r/MueztXfZQL0mkSO
 TE30qyp0ra8hsvq7JNrsMRyx8FdgGtE7f6YPehqZhT9PD1S9OYUFwHEDX3nNt9yLB8jxwSKbqJQ
 d/PDTYQj2eqJKaQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Inspiron14 has a ov02e10 sensor on CSIPHY4. Enable the list of dependencies
now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 82 +++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index db291730130c7..e92414533d48f 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa-pmics.dtsi"
@@ -792,6 +793,87 @@ vreg_l3j_0p8: ldo3 {
 	};
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
+				data-lanes = <0 1>;
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
+		orientation = <0>; /* front facing */
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
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov02e10_ep>;
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
 

-- 
2.55.0

