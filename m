Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787180;
	b=x8cR1VUlDSt3Js/PzT9l+aS2o1qxcWTV9HrP+3qnXjSgt+0gZGbG5ejBcZrXtSlvAFjs
	 et43hHPlrwFDLJK/8Y+SgXp6fUQDu5a6uqKrmaX/nwISj2Jwg6ZOqJ9mbYaFYJMSMZng9
	 MSccq+5lb8/tSALGObgtGbKl88F/gRPE/knPrshs6GxIZHSEfiBTOYHONHkX9WWO6t/jK
	 9gEJchRbXqzkuxbAn8837QSO4A+VglD+CDNvYR0eoMIUXE+mZYMCaAOUHopIC/PMF87TK
	 DRHjux82kdOswHXXBCky3A/TJtHro9jwXX0cMImIu+bPa/+t4bevfNfEAYIpG9f9gDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xR4yuXTQOAyEDilHAtowb56eXirOM8/fc1liK2FFiQk=;
	b=CZevFzMXAcje7GgXrLeBZW44LjzRfSuJq5KBz1QpTmfZ0eJRkhr4+qgIgr/iCz6b/FoP
	 mscAsltdR71MMd8fDhho8izZtDqvAK11hXySgFM8D6sXP7KZk8oLWzUOtITVCPuTp/M2E
	 jedAB+ZcYQ63nnObFoY2ipStSGLcnEnTWZOfdST5wA6rlp45/Amq80Rxe4qB88j4k4mJt
	 WVyn8atrS4Wayptek0rOINyKxzpFmdQx6wNTbxnTrfibj84+XhaqWo8IXwFOedjBwZwYP
	 x4EkTadXZtWiEfyOLdOOnEb2CXWc7BkhHsj3P7t+LRddtEXaRjPNNoXvjE6lY5muK3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AGAU9Liq;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D38F606A333
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D38F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AGAU9Liq
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f0621eec70so57203115ad.2
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 05:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787180; x=1796391980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xR4yuXTQOAyEDilHAtowb56eXirOM8/fc1liK2FFiQk=;
        b=AGAU9LiqypIjJWbA2RTVEHqWz5tvzMFqIsD8s1V5CDz+EW7FfM3OriPXCqsaoNZLgQ
         nqGFaMjS4ne/xpB5yy/LZzPc1VcmsSa0irm6uqtGhsWDLTs8bXCwRpSK1Gv+NiCbX1yj
         bi3khFFKtSsb9eaQ7bGRDEvTyImK0razii0vhPgaANtQwHbgXf8J9+0yklkltlc32nf2
         Sq6z5R+lQF0DYvJi7G7iwrQKd4irmMu06/LWJtdZWchrqPOtPbHPDoygyDLNUyc+t6LP
         4bCmzj8Rg3nk5ZvfJi2xUVwYnxm13ocBw5dvFeK9vnGsPNppJGPRoRFwt76RQOhVgll1
         EaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787180; x=1796391980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xR4yuXTQOAyEDilHAtowb56eXirOM8/fc1liK2FFiQk=;
        b=DvFrY/B5LQTS2VU7z7trclo3c4MKHM0nMncUpC155QAn+B1f98rEe6jvzf5BDoXzFP
         vVNL7o3it1MNngETxqUc+ncoDQLSeysoJaI/21LHqOt8gRiGFMAIkt3D7d6yOuDsM5Sg
         J/Gnk9GKXS2hS3Jiq0VQWf0sn1oSrcHkdrLIKs2Rxo+1c8V4LurTarc/DJyJuCA3rW2v
         LOcNK8e+HGqrvK+e04GSjQouBMlrfJDGbNwTqW9aT8LUJJvMYBbO1bDrFiGTqZlYSeyx
         /ZqL0Uy03FrpEUIlhLXQj7FLZLYps+bDHU89LIlMMCSPEEzU9W355aNNknagqikxYYUZ
         NTjw==
X-Gm-Message-State: APuU4Z/ByYRi6r3n3hV/6U6BTNVk5EmF+IHwDQ+J/2qD8dCI7qbOts0X
	BzilVDLXe4ESBYd8q3mGKDSasvYNw51KlaR/Kt7TEcuo6V0xzKPdEEbC
X-Gm-Gg: AZFdTZcfS0l6Pn3GrhfcG3tlHf1s9xrU7fOn4sM+myZ/f9XqiWgc9VLGH6CYKuBkNmH
	+eaDSS/RcT0OsnIOYgadS5EDnreaBCr0UWYTB1oW64GuIOtq2eTvpFjuh0x6+FuxHnhZ2OcuaLL
	WzE6qxiyMgqJ3Kxyy8FiecvJTetG6Fq0aUsv3nEmG9YJT4QYU1uLs632ngS6NBagVIU8OrGHMeS
	YAoj5HuDuZVrw8G7Txs8DgnEle+jq/8BE0kDup3pCERUFYAw0OuCdWoBQNbueXenu76p51edb+P
	pEU5mha4pvVLvRF3eCHUg++nMVg0anB01/Oqzz4tXqVCkdfDLli9t4UrtXYfDfnHon4uXtqTGG9
	P7cNGvi1kgN24Q6I+STbJu6uWEtNWmwujHCmKADVU2HEXdIq7fxENrUkbFOopqhv1dQrwfjwXow
	CdMletEtxVhFkWaW+k9s0mDfrRSc9gd3DYNOS/9y14Ah5WK9J78Kcp/DQPobTLrHFPETy7kbMhF
	78E3BSi7MxVbH1/m6xO/u2/J58YSkRuIoclOyi18gjMHhqifHl4t8jHYMoNoJ3rCYTXT2cmI1oB
	x+1SSzXMA1kMYYFei/BXABx/KWHUjaO4P41TYdJe6ZXw5ew=
X-Received: by 2002:a17:902:cccc:b0:2f0:d976:651d with SMTP id d9443c01a7336-2f0d9767d6amr88871745ad.14.1795787179570;
        Fri, 27 Nov 2026 05:46:19 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:46:19 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Fri, 27 Nov 2026 20:45:07 +0700
Message-ID: <20261127134507.125513-8-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10

rear and Samsung S5K5E8 front image sensors on the Xiaomi Mi A1.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
index fccb9c4360ca..d8db3567fd36 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -74,6 +74,108 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+	vreg_cam_avdd: regulator-cam-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam_avdd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&cam_vreg_avdd_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&camss {
+	vdda-supply = <&pm8953_s3>;
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			csiphy0_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&rear_cam_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			csiphy2_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&front_cam_ep>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c0 {
+	camera@10 {
+		compatible = "ovti,ov12a10";
+		reg = <0x10>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		assigned-clock-rates = <24000000>;
+		pinctrl-0 = <&cam_sensor_rear_default &camss_mclk0_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		powerdown-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&vreg_cam_avdd>;
+		dvdd-supply = <&pm8953_l2>;
+		dovdd-supply = <&pm8953_l6>;
+
+		rotation = <270>;
+		orientation = <1>;
+
+		port {
+			rear_cam_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <216000000>;
+				remote-endpoint = <&csiphy0_ep>;
+			};
+		};
+	};
+};
+
+&cci_i2c1 {
+	camera@2d {
+		compatible = "samsung,s5k5e8";
+		reg = <0x2d>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+		pinctrl-0 = <&cam_sensor_front_default &camss_mclk1_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&pm8953_l22>;
+		dvdd-supply = <&pm8953_l23>;
+		dovdd-supply = <&pm8953_l6>;
+
+		rotation = <90>;
+		orientation = <0>;
+
+		port {
+			front_cam_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <418000000>;
+				remote-endpoint = <&csiphy2_ep>;
+			};
+		};
+	};
 };
 
 &hsusb_phy {
@@ -169,6 +271,7 @@ regulators {
 		vdd_l4_l5_l6_l7_l16_l19-supply = <&pm8953_s4>;
 		vdd_l8_l11_l12_l13_l14_l15-supply = <&vph_pwr>;
 		vdd_l9_l10_l17_l18_l22-supply = <&vph_pwr>;
+		vdd_l23-supply = <&pm8953_s3>;
 
 		pm8953_s1: s1 {
 			regulator-min-microvolt = <870000>;
@@ -302,6 +405,27 @@ gpio_hall_sensor_default: gpio-hall-sensor-state {
 		bias-pull-up;
 	};
 
+	cam_sensor_front_default: cam-sensor-front-default-state {
+		pins = "gpio129";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_sensor_rear_default: cam-sensor-rear-default-state {
+		pins = "gpio33", "gpio39";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_vreg_avdd_default: cam-vreg-avdd-default-state {
+		pins = "gpio62";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	ts_int_default: ts-int-default-state {
 		pins = "gpio65";
 		function = "gpio";
-- 
2.47.3

