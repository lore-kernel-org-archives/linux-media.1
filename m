Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609997;
	b=wmtqojoCFTOkuRyH0qwdZSKHS9SRkG1mYNcPlshyrqqCYE0f63DJj4YtvXpTRf91cF4I
	 Zc6rGlDf6InaupFZwNiL4jTyoLEFtszzqs1Wxb3g9NCRUiplPS69ghV7xbQN4cOUd7LSc
	 gQ+vwuYIwha6LObaudSHL4PNcQxEtTkh+1m1fCSA631aQzTk3WXPd9jPWAEdLqrUV4u69
	 Ce2NdIdHtcGsHTQnBhqRYXeiloSLNQerdr6W+r2z4NTYdHZH7jMKOYA58zLCPMxB51vow
	 pO57xBIx/dR3Fmv/F0KvVtg3xE30Y2Oak7HkH5W8HnLwcq5NBe0Q/GrBKSUwK6ukUNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=u9UxTbIvHn2NymkmK6sTzYgQuFVw5L2GmRCY+f1oSYM=;
	b=2HXvrusGiF5a4UXIuFtsQC7T9IB0o+nhHFCjJ6GVKxhygjmdhqJQudNVnKAPtWFvUksQ
	 sH6jpw1foiSlY/vWM5mQ7nPWra1owf6y9rIAfCIDOR3pTny3zZu8Du5wGctxWWJ3PHyFq
	 YohclorW491/I81Q/Qgz3NR5q0SS7VKJXk+61lrZxFAssjy16mbGnlDBc7JqMWYz1ROwo
	 6pNwq0WYrHAnBiCp87hJOruK1VEAVU0DpSRKu56pmH28g607Qoe2EX/0lUbsUI72bdI8f
	 O7BszpYD6RshPzIKwXxlXPwvCPiQTuNGo4UMVQZkBlCIk389UU6veCoO8wX6IpncqxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qgf/rxEJ";
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629E1606A32C
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 629E1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qgf/rxEJ
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb684859cbso3303879a12.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 04:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609996; x=1796214796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9UxTbIvHn2NymkmK6sTzYgQuFVw5L2GmRCY+f1oSYM=;
        b=qgf/rxEJbxbQk0k4cDRQ2CUScsPmBOb32E8eV7SSGbTmDRbgYCKL+rs+qu6txu3x7S
         cjI9087SNrGDsqNfxE7Tww5wmtC89VG8WHBtct8fjTrDhGiSrgUzWq92HybFy66Q7+Mh
         7sLaY0t19HW9EWdOuhDlzCjKhu7VJeJZlX19RhOvEmTfIxy0YdZ0cg4oZddsm0G0wbyl
         I8wjsPiXsqdS4IV5HSPD2d9HiAm/91i+D31wPtwHpvD+wyjmVk5TOzZTRcB2sCf1BHI+
         IvmHh7ZTosiAVRfVsx+BQrfehi6Ert+W6ekLsS8rYMVaFjKWiLOh0/4JqEmJZn84vZy0
         5WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609996; x=1796214796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u9UxTbIvHn2NymkmK6sTzYgQuFVw5L2GmRCY+f1oSYM=;
        b=fAsilryUb0n0GxPGA9F1Os2+BLQUGmcqZvo86OuW7NnPXUQ/FY81BwKG1B49KM2My0
         W8aUYfJ6dw7P8+3/gWH+OBxeDX19WQqgWBq73S7VAPifzlAvbgVMPksTJIS/ceaR5GUP
         J8FkVORt4bvAzOJa7K1GCjEMPTA19iyqJDV8k0WhTKPRnbEzmRFBRNzX6u0+CgfD8ctw
         VE6IvyFyXAs3mvx3HocqUnsO66o0S3IUwWbDknDu9mI+bxkL/cb5k+1Ad6rb8Le9F36a
         HPoaZc9xINOJ1UjYF2YHGmmz85+HGGxeGFx30cdr7U0ioBKOqlLmLDNsVdohh0vzD+zy
         e9XQ==
X-Gm-Message-State: APuU4Z/R0LWAH1dJrljIEzM+NpLbCf/vM+YXijefcccVlY7onujh5Cnx
	YtXSqkwoAzAnu6sQaL0JG++EE0p7rm+hAgKJ59Wdjr4eqBgDJg+0H4KG
X-Gm-Gg: AZFdTZdEL7xWIdPZoetBKaXSHuHAdZcmLLLe+QOkOxNRrLkYrdtaoozK6PWPfgPbhrC
	/URBSzxSu3yxNRSEdb02W2giAXetJV7/yOb39C9bqw3ub0lMvtcG/b79wPo2Trg4MFyAigGFJp7
	OW5AjwleWpKkincFC5lDp4MZ2zygRI5gFzIivGAGWiWXMlx6U5p3/IJCa7JiAaycOMxwVt0T/Ia
	3UYpQQt3sYMTMYiNJuYkVcI89qkxO4Q54hgTDOrGYtRnhAydV9OxZ6S5WOUZWsOrYJfCHKCmi54
	14uURikjYpuFskjAwcl6QcGhVBVrxAsp8bL4Au5eR3z/EZ68PISFRgstIiatR1UTgchAzd275uP
	uIPLVOp7xi3rONToZdoynQb4lpDZFd96Wl9EP5f0VbcpQqj69RyX728vV1gt4HQrXpfAkGzQdT8
	ICeqAnqzfcPak17KY5pchUQX55XlXu0WUUCAwxV4lSZni9FwqTVHBcUpKfACfpICnjQJ/dDbMmC
	2bbIrjT8xdBwp4xjv35DF5buQheH6Jx++ut/iNd03CmK4T/x7rSYF8yif+j8wJl8hZkDeiZVLEK
	vm1lVBCKMjbjDjEAog0HzHkKCjpAFDwrtq3UzP7uR48lX5hypVHw5ws+UTJKm1ME7s0h
X-Received: by 2002:a17:90a:e7d0:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b41cb3276cmr17251989a91.60.1795609995742;
        Wed, 25 Nov 2026 04:33:15 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:33:15 -0800 (PST)
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
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Wed, 25 Nov 2026 19:31:46 +0700
Message-ID: <20261125123146.379057-8-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125123146.379057-1-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
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
index fccb9c4360ca..87db6b18d191 100644
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
@@ -154,6 +256,7 @@ &pmi8950_wled {
 };
 
 &rpm_requests {
+	vdd_l23-supply = <&pm8953_s3>;
 	regulators {
 		compatible = "qcom,rpm-pm8953-regulators";
 
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

