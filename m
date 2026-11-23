Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437406;
	b=fpzgKa0dEZeFj7iPahjTPy6tzBLsfzygqHY3On93krxba8loinEeNruWockcjK83WIkT
	 DgDhd/yI54ooCU/hbA+rW40SXveEGM+HIlcLFFDB+sN5CgvSx6if96Rn8fTIOL+z2nYuH
	 DvFp39i8vGGUpXKOdDrqHp0VbOSz0hvFgqk9PcEIx0vJQo8OBbAYd/caLAfbfd/A7d26/
	 31CWdmvypwgHU+U5yknHwKVu+u4NvebGeLAyVGU9hBOV4U71rM/uFDCYULS2oY0GhXKbt
	 Q3TFsSLzGxd+X1dbzu0kp2vPYbIyaC3M6cAaFmIV3yTpJ3AkYkN+utuSNsw09c/xeaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZZRwBHNibaWlFnpiuuEMtUB0YA/t47H+l2X5jKIQ1Dw=;
	b=VJp7ch6cicbGx+vYHijjI39YVKkq0AaPJCtxZ1eVM2swHfUo82mC2fD5o1VKJo49rHjm
	 AVgOqJ8zDvUDuNHLEG0rq6Cz3dRntwV8pbOyU5zMYWTyVmEnJZ3nr6YRBk0oQOtUqhjbw
	 JTwZAfXYl8JOQdxzJBTeFc+caD+r2p3U70lIkRcLH388QGVgg4TnIBDtSfpYwZ6IKwhfV
	 KAc0GhP6Duhv6oCKlvmPmoEwLSjJPYSJE3V3PTb+cIq9UExG7KyvNbSfrnWtC4FDsOsO7
	 4vEudqU6dzBG7nBHz8cCZsUGvKKYMfapa1/eHa31QiS8J7Ruo7Qw3eXD5VJ4k9+zghw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=atlI4xhW;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F616606A6BC
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 12:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F616606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=atlI4xhW
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3869b68caecso4154000eec.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 04:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437406; x=1796042206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZRwBHNibaWlFnpiuuEMtUB0YA/t47H+l2X5jKIQ1Dw=;
        b=atlI4xhWUQnHPQ9nkYx3mQO8Swph4K/bleOIqj2B5EWCD+vbxo7zUlwusUjhC8SBMI
         74SAW8d+AsGsQPS49KlhZ3wmObfzg3i8k6bjnLML1v3xvmi93htAIrRa3G5Mt47kUkbg
         8WPcf+BlbVDglyiG/AoRiiYZEv/QbipWZYqJLn/H5MvLp3vLv/WGzFZS8cZZUREwIitt
         q0EFaL7AhpJcMNbXN/xAKAu5BF0Ucd6YxQBsWhUGBV0e0YZUYNlHBOa0Xb/jU4GhT689
         kH9CLaUi8j8aRI+IOBYW7nODAPcyglZclBG0+lvwv1k4+VVdcc2GJXQFBiHF+2emdk/p
         nl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437406; x=1796042206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZZRwBHNibaWlFnpiuuEMtUB0YA/t47H+l2X5jKIQ1Dw=;
        b=T6XCQSINt9XWNCKg9E33WKu2IJMWPzwrzNLLbgKJh5rmZSakzqTgNbh1GL38jb28Kb
         xM9DZ+7S/a97J5u5kV3x6Lv2GTb+mdcest3YDuZ96RDOCEnhMAWh34Q2ttkV5Cdr2SIW
         G2gqc4L5gf+uMlRIJXhhzDAezjKn/LFLejcuQRmAxQAECONXmkMBEXTaBy3lYtcRpFv/
         349ad5cjAQyzhsYgoywv957vVvgWXC+yzeH9D9wCEyPZFxNkiSVMXLH4xdri10TFeR8/
         h8YXVp2EoboWKdZlpvl1MeJdWUlBIjSoNnWNkgRDuvHhEfayYIfe3/w1Bbh7+yNnNh5W
         zJWg==
X-Forwarded-Encrypted: i=1; AL+hErH+Q8Hc3P1iHYIjXuXhHBSbKpw5pvB+IwMVinRaKjbzoPyT3riBTswYXHRJFj+Zzjcc20rpNphseIqxGA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8rC5Ck/NDaoZ4hA/EiS6qkUXS7u/FPx1tfjEy/G6FSCQsPl9w6
	zwu9y5MRdM8d9q4OabtXnwpKS9BTlUJPWiOy20KM8HsWV7N2zhi4dSoYwZla3uLT8cQ=
X-Gm-Gg: AZFdTZf/BR5oQheG5Nz7yXXtYVpVyAHfvjr7DHnbXlZNKGjH6K6BbMOtwMj3aD3D3Ai
	Wo6LHx4X9JBuvHfDwMLvJLjzLw9ncI9fm+qyv8kuXNleMXzbOQc8XffPqSh4ZIdqUNCYE+yXagP
	hCZN8yds36MUjBuI9SkheJGmHlc+u9WNfo3R7KX2DOF0EaiGQkFKHD9FRjoyg8aQgaGMXV55PbL
	xtBYf1hndW2ehq6T30WGY8YvMzEy+VYuxhYDGIyIMDgF38EE0LMFY+qZH3X/Ja/kyW420IwpJ0E
	jhZiZcTUq9ydnb9lLZ5xRoSBIO3qfXxOIJsmeae30dwUodE2UkgzRNI6TL7d2B/Kankg1+ZDjPr
	u226RZKEblicjQ61fgFAFYr0AgKaKvwJFmeqzzCqVZbp2InAXy114G+HqdyCK8M94X7+rAelqwt
	4snVum3nzCa4rv3apGIQJEOq+Y+0UP2IDnTQv7fKcYWFosCnauKs3MTujfGpYp7pxmccXBsBbWW
	Q69Rn32A19HFJ6j1Wp8W6PzoAAhagxNv/WUZnMiW6pfpuLnCLJGSQdyywTZ+QuGaSyk5vrg9YYS
	XRpmSG2SZlVLiFVrb3bKSCPW6jca8Rgpu4hU/yTe5N/wcxlcxQeoUaHIAoEau3diyfY=
X-Received: by 2002:a05:693c:8209:b0:36a:4a68:84e5 with SMTP id 5a478bee46e88-3856f14bcfbmr12986753eec.8.1795437405845;
        Mon, 23 Nov 2026 04:36:45 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:36:45 -0800 (PST)
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
	linux-clk@vger.kernel.org
Subject: [PATCH v2 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 19:35:46 +0700
Message-ID: <20261123123546.152162-8-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
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

Enable the CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10
rear camera and Samsung S5K5E8 front camera on Xiaomi Mi A1 (tissot).

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
index fccb9c4360ca..5d4fd7f42042 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -308,6 +308,20 @@ ts_int_default: ts-int-default-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	cam_sensor_rear_default: cam-sensor-rear-default-state {
+		pins = "gpio33", "gpio39", "gpio62";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	cam_sensor_front_default: cam-sensor-front-default-state {
+		pins = "gpio129";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
 };
 
 &uart_0 {
@@ -325,3 +339,103 @@ &usb3_dwc3 {
 	/delete-property/ usb-role-switch;
 	dr_mode = "peripheral";
 };
+
+&camss {
+	status = "okay";
+	vdda-supply = <&pm8953_s3>;
+
+	ports {
+		port@0 {
+			reg = <0>;
+			csiphy0_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&rear_cam_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&cci0_default>,
+		    <&cci1_default>,
+		    <&camss_mclk0_default>,
+		    <&camss_mclk1_default>,
+		    <&camss_mclk2_default>;
+
+	status = "okay";
+};
+
+&cci_i2c0 {
+	camera-sensor@10 {
+		compatible = "ovti,ov12a10";
+		reg = <0x10>;
+		clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		pinctrl-0 = <&cam_sensor_rear_default>;
+		pinctrl-names = "default";
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pwdn-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+		vana-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+		avdd-supply = <&pm8953_l22>;
+		dvdd-supply = <&pm8953_l2>;
+		dovdd-supply = <&pm8953_l6>;
+		rotation = <270>;
+		orientation = <1>;
+		status = "okay";
+		port {
+			rear_cam_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy0_ep>;
+				link-frequencies = /bits/ 64 <216000000>;
+			};
+		};
+	};
+};
+
+&cci_i2c1 {
+	camera-sensor@2d {
+		compatible = "samsung,s5k5e8";
+		reg = <0x2d>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		pinctrl-0 = <&cam_sensor_front_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&pm8953_l22>;
+		dvdd-supply = <&pm8953_l23>;
+		dovdd-supply = <&pm8953_l6>;
+		rotation = <90>;
+		orientation = <0>;
+
+		status = "okay";
+
+		port {
+			front_cam_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&csiphy2_ep>;
+				link-frequencies = /bits/ 64 <418000000>;
+			};
+		};
+	};
+};
+
+&pm8953_l23 {
+	regulator-min-microvolt = <1200000>;
+};
+
+&pm8953_l2 {
+	regulator-min-microvolt = <1200000>;
+	regulator-max-microvolt = <1225000>;
+};
-- 
2.47.3

