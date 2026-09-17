Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBC2524B0A
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 13:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651261; cv=none; b=DAAVyc+U7/gU6bi8ZLyySZlY0BQ7C1pV4IDatxJM0T6WmyV+mfsCVHw3bsZ0gby5heRO7NB9NhaidEHdp0FEd4cw49lByLzL366GZ74SfnSpW8J9P76Sa2ddD771Hopldy8FpQE2XNYdXloiMgnrVFLwmwYmnqV0VyA3pAgGdNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651261; c=relaxed/simple;
	bh=uJM7BGXeJT+G/ND2MTDSHeKy00Bn6fKYUNBryyaH4Nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjIxa9diJQ6EKEj7YS3hogOcGCYm+TvgPQYRQB3hu9vaPm5C8ADrwrSYwkQ2ICAA+LqTwrG9mnPTY3I3mS7wu56wtm+bztNoCJCYgIfs8gQQBELk+ceHrMa+Hm4eu0uC9PF9srUKa3qcNJCdd5+GfrMGr0f3Qu41nMq4Me03+Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=je16Y2Ol; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="je16Y2Ol"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f8694aeso54414166b.0
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 06:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651251; x=1790256051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7A8y0PtodD+XE1YDiEeSJNKCzKQKaeC1Yyv+IGxEerw=;
        b=je16Y2Olse7qkyjdi0j4+AYSjde1MiRuXRwq32jtNgWwlHId+yU8mmhOX5dR+k+ZH8
         qPgWDuMIArsK3BkFJSBPYCw8Pz0Gg6d4wKSKARfhtekWcpkaNFYUjcSAnAAUDvLDx9q4
         HR4noZAF3VqQ6sC+eldL8VR0CGScR8ueYWMQJr9ZMbpUs4tlkGzhGrfQgEBGQJ67m482
         W7v6UmmOngPacs7Dws2t38Vat8IrqvyIACrembumfKVUpdbH0+QY40K4RoELnN8yXU/h
         Odn5NrfcUJkSGk+lfdxvCCQUTP71k/qz25K9O90bR1niN+xOxSOLRyhAIPW3WtfQ3IXI
         UBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651251; x=1790256051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7A8y0PtodD+XE1YDiEeSJNKCzKQKaeC1Yyv+IGxEerw=;
        b=cw5NYdS68bK7h6tG5wCbxaZvUE2KPex3ZEVyFBPPOO4qP3y4hVxjKCREhhQaRlQ+Fj
         DLR/quNT4NCE34C9mGXzaxN8KKthcAnomHn26UgO3ncT4CnCPgDsyDaEmGUxFfnZ0T3P
         8CYpfgp+PwEEaKHxMk8NL8Yi+/qExDKl95qpDVxSPHnRN1Dw+5mURdSfCoS5rlRRVszf
         PWxl8ZjRXzQhZjJajwQIXsFBSDLWYKHPvJMFFmSSLESf6vn0/SaUmfoR50bA4WrxP6SY
         aNw2QYPgyZOUujNqDBoqa/Iux+T8JFy9AEWtC+DBrR2NSgI1gMqgHgQH2fstnNDgzslU
         HkyA==
X-Forwarded-Encrypted: i=1; AKwUvBw53NDWwjZBzfURpoFpDBN1XZXTizCL3SS+D3NiUxY3tjJ4lm9lVPwdHXW/Y6EXs40o5ogEVkuHR2Ao0A==@vger.kernel.org
X-Gm-Message-State: AFuF++n+WgX6HmJ5sLZ8fZaQEoePzYRSmBH1iiV+0nhYGSMxhRJjBXm0
	erdjsrd1xqcjKzErm7UWM3yApHeLPZeh8FDN9Cr0VYha589gSiEC0oVSlZ3eaNDEijc=
X-Gm-Gg: AYBFou3hzBRM1i1ttVwMhxkGpuQdvUjYXnfMVklHbPgpWpWFzsBFH42m5cdFT2lYfwc
	YvoUAhoXF5tivCIyb/vF7bwrt0GZMlCQYHwBYaY2V95sDsduvc6qgT6I40BBekNFUeiKiKPZtd5
	p0DTUKuA3yN9SoRLmXPqelrK/xAVQQZLba5xWWLiEVWr2wxuNJ1TqCxco2HVAo7cT/yXwohPACm
	tgrJeVbXy6go0hDwFdNmpG3ZxQMH86azr92LS0O8eMDfUlWyT41BsXbILnJQ8aDMliO47aP4pQ9
	8XJj6yXmeal151Tj2uTlL2TZ4TUrNxv8O+8Pxra2Q5vmHX5S7rp9RKSTw+lI3Tvd0+N4Sib3LJ2
	r6h1GTXj3mxVH0niknEss1fvULyS9W9prRJIaInz+LulOoCv8YGrJ+/Xp3nPJ4lMsIN8I3r8FiF
	m78Pl/qSSLRTXSBFn7crX30S45QV8hwavJmwm6E+B8Tm4FGVtSlmXy8LksnRQG5rioLjzf4jcSu
	Z89xH4sdQ==
X-Received: by 2002:a17:907:1c03:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c29f547f5bcmr274468666b.18.1789651251145;
        Thu, 17 Sep 2026 06:20:51 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm279681166b.42.2026.09.17.06.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:20:50 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 14:20:37 +0100
Subject: [PATCH v7 12/12] arm64: dts: qcom: x1e80100-dell-inspiron14-7441:
 Switch on CAMSS RGB sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-x1e-camss-csi2-phy-dtsi-v7-12-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2261;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=uJM7BGXeJT+G/ND2MTDSHeKy00Bn6fKYUNBryyaH4Nc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq+kiuy5mv/8gX1LgUPhuqyZak69Jcip4ALECm
 ZpIEZY4pCKJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvpIgAKCRAicTuzoY3I
 OvJPD/0aceGatfeTbqdHWRQd3PbHL33pJaC0uczcfw8BwufebB2Mtq051mVZ185gOKKOaADJ2lv
 po2CPfU2pjYFLMRFvrLWf5ZTU4HL9G7FN5GOACEYzXOm8YdAkU/O1OmWOCf9iGxNQwTp2VIAakn
 eJcSWAjK0d1cMzGDvN0iivnDiQj1LD8z+vXCStay/7r9RLa0HeFRHNjOVW69hZXM2ePACilWvmg
 CleYmwJ5zG2RFuDCcavzpM39TlS13736s5Iz5/bBkZOf9ZZs1/1KvPOFUGgw6KnD4HL0GLDzrfW
 9YKtXlzqYbZwATokKtPhU8D4bJDztf74l7ava6gVA/PqUIwQSMPqxZksIJfsjZ+gEs/HG9foPzx
 08WNHaJ9ay+1tgvYDE0o5Zpwnda3EaAYjPOsX5irE/RBqv5H0r40h2HD4PFILK6sqvgsHgZHc8u
 T5FHO+jio6CvqkuL/DSiUuCzQGZMm5n9yP4RRv+iyRiLCSxTNIj26+P0sbtz5xQxxudPaZI95Xm
 lejkgeXgpbzs2jKw4SdVAVgtAvRfP6zVrIf56LHOoewGt5w1jvc3vz2EqvnxLL//HkSisRUAvzx
 rmYS6l8ehoNUVMf7rW4iSQldmfppbqGAP3wwla79xCebXfLvE9mc3Uk/sEGWfqWX/7me+fL8SMy
 5EiwJI3W7uCrXlQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Inspiron14 has a ov02e10 sensor on CSIPHY4. Enable the list of dependencies
now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 67 +++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index 4cda708455d84..5a3bf4eb4ef68 100644
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

