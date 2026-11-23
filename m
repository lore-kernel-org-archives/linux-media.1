Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447731;
	b=RMkNbOVhlQugJpj1WGrEiDTuWrfOMhNH7Q9CMSFd6E6PHHJrkuLDdr2TP7/ZnM4bYNEV
	 6Jx1VoP7zZPMN0eGLWFk3RWM3etxehxWT3ppXi4yGrkM7GunIq6zFgNcFoZkNh6puEZUH
	 pWEzngUh7B7xd1KE0ecDXNt7ykuLNbk2ZodZSrlAgAlpc0Nnfy5qD4Haz9uFwLXzeiEPC
	 I+/IqjTiYSrAqb1dzkvP+u1bjny9po7fZn40LqfnPy/it6HtlqIcYKAg2njOExT070zPt
	 8e5FovxNks3Iww+hHNJcMNb9eBZM3K0aC+AvjinTbAsNHuB6UoUFHy8GZsEpc6vcbmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xjPkJu8X2nBBkbwoz/3Q9ZztknethPFV/hq8GuXmGeg=;
	b=LnnRG1Ly/2MKiz36SE36J03QlZNM08z2SocjU4LicisfHiHYNzChvqO26xb5cFAI6Db0
	 wRxp/cKlPB8iiSe0iu2vUVSxB2aYvuwlLOmnXa4llkzkjw9TRNEwf1O+zRxFU0p2DhZjJ
	 A/kiBruCb5Tr7cq1OEqd3D8soQzAcEgH6wh1/BUFdIYR392c11mH5dkrvG/WRSJBPKkbA
	 m/AHuVsCw+nyU79utcIbmrNg2SvntZ2p7lf9kvapPl5YqrmdO5AFv40YiEJYMesolYdNf
	 ugurF6fSB0JGkNFREuXT29FAR+bctjJqUi6vunNdc1hz3d27igFi6vBcPAo8k/F1/tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qaN8tz2s;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFDA606A321
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CFDA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qaN8tz2s
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38699cf08dfso3298779eec.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447730; x=1796052530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjPkJu8X2nBBkbwoz/3Q9ZztknethPFV/hq8GuXmGeg=;
        b=qaN8tz2s6QjWaNTQiTog+fsjkYaL/oPgbb/v7AnoTrd8bU0uoUSwKkNT8dzhR+i73u
         icf9jPTeOWH8XY+3QBmRu9W2BLgFcMzVH0jzRUTmx+5K480YeSVMjIMh6HMIEMLsuKjX
         luCitgg41QLf0IW5yF5mKQ2rtXhnDhkUtd1hM1xT84fobvegCRgTXbKlMwK0Ai5GlV9g
         9YRYCVwNlrXlDd8JsjOTLcLBpPZVBuznpXMjgSwx3qrxmUHZln8iwn54DRgbmz6Tt+jF
         IkErDcjC2ELpglQszvZhQ9f/WhdcIcZ0fw3024FJMxh3bATjPaEMfhnF7WPeDWxuJXz2
         tWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447730; x=1796052530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjPkJu8X2nBBkbwoz/3Q9ZztknethPFV/hq8GuXmGeg=;
        b=XUtwGGvlxlkgqEi73lMNeS8zKSBy6tKLfFRX2tBJNDtIycqtHxRvsi79vNZ5yXKGfV
         Kh70T69N99/9bkzGUzHW00kVqNZxySISGPdNyRiY3P7N5T4Zv0EFYEhWEBEfH/cZS4uJ
         yguTvrTADCMyr3PFb7JX5ZWzR/GChjDio1CYDnt89/Q7mGCOBJOGMgRXcLn5FHV6Q4vk
         YFOVizpxy6056+hvzKQ3VF010NRF3ToRUF4iK6Qyx2HvrzY7iF5SthPmnRyZESnVhQXK
         kRaFJPArym6aANMhjPZ7a2xTb/w90cM+jGdtxmKgIcBse+TNc9BP2JGC+bc+w6lJ1q5p
         F44A==
X-Forwarded-Encrypted: i=1; AL+hErHiRixQN46k3J24YiVr4MYoHC6EBGWNXpZMWu7SsmhLE3sc8LPznqNGsFjNEpWOEBuARooq6IsI0K5FFA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+OOuVKAUX7ZyN9LERefSEZlojNWBLgCxVIGBV5JjfCv2LxQ507
	iMX4iBxHQV6dZKWEUG50UfOXY5Cecd9+heuwWVRS9ssxtS2uqOy2CYVH
X-Gm-Gg: AZFdTZdQjPgUgXCJHtLypsaF9XaWUvwyhLwBlHZ/lU4FNmRBEn33YKzFDSyUiEXUjtG
	vdA95YzbI+LJJPmn8fRXf5WggVIYHMrgCXkpkDUmzwQIVMkQpEYV+NoOQsK+AsJIZMtKgginFXm
	vbflE9Iu8ZB77bDXmDea/XXJo4qudrIQtdK+pB+VgZ0aGATXhLprl6Al6SiyEz5xkRXg5DZ+R2l
	2fYKcyx74axa0tBgkqaw1unVX2VQyLX0WiT7/dwN4Y2t95OcPRRIokelEEN+UzUwBDHizWXZdhw
	Bf0dbd92AMJ2E+IHVyI/nEdN0Aj313l2haauYKf0pCg05cea2MzqMlBznHu8KND3Mmpk6liatJk
	ekpuLMqMBMXmGv7NfTObFWlomfllfjtXKsmhqM9knFf6uPS4sY1NYeESgpYsawXRc+fXkFf5djM
	x9mtyTOtFmfaxRDo4gJJlelWybYBR56KUcUmgAe+RfXOsPhDiiNFkksxxSuXtEdPgePBrce3Dty
	PVVF+JXExqfTz3hGcHw0wLVUasI/bQrsUjX7DPGR7Wipi5LtvzdfsNpoWUDX8lUW6jNY7qgb9Qu
	FuPGct5Kyk0Pr6V+fIkg854N1bebq5qVK8g3kz2N61wthQ==
X-Received: by 2002:a05:693c:42d9:b0:386:bc40:1508 with SMTP id 5a478bee46e88-386bc40185bmr455177eec.14.1795447729747;
        Mon, 23 Nov 2026 07:28:49 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:49 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 22:27:22 +0700
Message-ID: <20261123152722.168879-8-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123152722.168879-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
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

Enable CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10 rear and Samsung S5K5E8 front image sensors on the Xiaomi Mi A1.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
index fccb9c4360ca..e41cbd4d01b2 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -74,6 +74,104 @@ vph_pwr: vph-pwr-regulator {
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
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&rear_cam_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			csiphy2_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <1 2>;
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
@@ -302,6 +400,27 @@ gpio_hall_sensor_default: gpio-hall-sensor-state {
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

