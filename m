Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432136;
	b=Lql/RRQwzy3uLjPiT948ohazFWNGAJfioexWk11xAP61W8D4YXfsq7qH2CXkZJZy1WBm
	 4zNuQO4vmbdN7IBuzuKSkUMPBs1PyJ+AnGE2+He9ATapuKhwYtzjQqLf/071UIbyhhLuX
	 lspYCndRF/2aEUz97AyfRKMkkOP8IBGBfmsbRe7Jk5BwJgFvYfFE+v0N46kB+dXJzEgj8
	 ne7/klW1MGQ/o3QAgEaTWUuzAgATgH+E44Aao8xlp6tQ4wJAcigx1eD8vcD0aB9jv8InA
	 EWYNusMJfRRqdxoNVvfUNqC1SIyW0Os2RzE1Sk9yKdU8zC5nCSypMJFxIzJ1T62E9OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xPfVHiYNEgedGdsEEXACtNCGn8S+xuE6Ru5ISfJrNXA=;
	b=4lQQjTZbiv0oQlHeh/mRgtFsnawCu9n9XV0EJ5/vQ5GdJncFUqayZWJC4uwKqWVLcGaX
	 MhpKRQJprdzehQZX7+7mRkq1MxEm5PlwI9LoEC6J2q0o0ny5Mvgz+s14PRiTKKkCct+IA
	 bVwweanZit7t1tvkKejvbQSzU8FnWWbgUbK+nxy1grfN5eoT7TEBor8KikZu9yJAlPytk
	 dVeBBCKKwvNc2ExkzwalJH4jbM6tVkn1FZuJmVS356/vs28zwA7utL1KuXNXG1ibZej+J
	 b8NxR944Kujy7RvWYuGB1I461rAS+UbQpwJWubySiSZWTKrbR4R9hdhc62fKSUQxpOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GV3Ox3m/";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752AA606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 752AA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GV3Ox3m/
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-170135e43c7so4340091c88.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 03:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432136; x=1796036936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPfVHiYNEgedGdsEEXACtNCGn8S+xuE6Ru5ISfJrNXA=;
        b=GV3Ox3m/nwlScDSi01EojkTUY3OAbqwZCcsZyEc3A2ODjDkx63iQHWMPBypXLaUTdt
         vYXuXfgTZWM4Wt45ElJVAx4k6HmH+ATHBmBKr04VQE0xixKP2pFKqCpHKvNTCjBNSEyI
         cd6fpPdiLLgaHK2kNST1nJi0tKTbw37CW9QXC8soarFdkCGcU3UicgTNAW0QCFHTFzHD
         p7XT7/rZOK09ZHvbQsm0WIlxgtwIyQ+Wzlcmo/ErjYanKDDJB5TujuSnj0gOfUhEvUsu
         L+236Z2ijkpTolk5xRoNNPEXp4ru1FCx1VqOnmwz/zaD688iFhL7Xqt/HWC4bNA+T0Mf
         zKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432136; x=1796036936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xPfVHiYNEgedGdsEEXACtNCGn8S+xuE6Ru5ISfJrNXA=;
        b=Lhs/KsmcjZHtNyOfGZ4eI8f51WHHqk6SNxAZagjDgyki1nmKDph9rMA9d2Xf/7T6yn
         T8S/lO5E4v4EOyV6Bg4XTUzfNfwOajjuNxsSU3MxDHXYMTNbq49Qt1slw+3uzEo9qZ10
         yExxCxg+k96y1Yj2kzkizBMye8/tFykHqF4sL/O2W5C53VNAxnsYRuCg5NpYJLMwl40L
         qEQgJCeCJSyt3nHR+EE+68KIm5LrHzmcBpf2fII8GBxQxQ+EoMnMV0RCr+DAaFQ/uv+u
         4iuRIdkqID1PVpwOUTSHLdkxCBuRWpDpkcJ8QVTDw+HlbfzEbFT6Ccv0YAwA79l35Lb9
         Y6Dg==
X-Forwarded-Encrypted: i=1; AL+hErElkooBOnmFTxhvAf6kgcoap+bpDrj+6MwENHy3nu2WZ3l02tmMYdHoyGkdlfoZRXuOf6wTyAG+KQ61+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8O+JPn89BNof3IO7Eb937dSxFplWcn3daL2lzRCpnIy5xQh1SM
	K5CxnuSGGxCRZ1acESaOAAg8fVqvlAp6jkvMo6moDsZbx6KN7MsLjtUKwSGkX28oh2Y=
X-Gm-Gg: AZFdTZfZaBBw05SQMJIXH9xEnEhHtok0MeQYIU5VsSLYOyUPhS0joASEyxL/afH2JKR
	/yPFaLSmt5lK+rjXVr0jkAeqNwDNLk9KQmgJ/n4mAcwarglrVwEQXX3JTNPGnmwK3ikck49ol+j
	vAq2FO/KYolBT8xCXVL0JS6ZqBXW84W0RPcgDtBF6xGSK58RX40hmWTZdQECyskdntSJgR/wFHC
	6Th9fz2bcdiKt6v5hYL/RvocaM+iiWo4Ra6VFYq9MbS42WXRrmK3QTwlN2O42gWTVJtfVOjlkSP
	387dsio2yUz0Vhx2/d5e7EcZ6wQg8j7QWmOza/oeot9yHqilyYE38dWiWl5dlZYD+ZJXnERmgE6
	y6vrau5vaO5MoPwD7ETrUfn+PCfFPgHyi7eAQSOqG1yZyrNN8D5jTd7vyXR9kBg19q1Illz8xgi
	AxVL58t96YlfVnybEIJQbLqJstfNgD4ytm76rqkeXQyj0RAI9z+jq+0tkOcwSd2aLKhhS8IUJfL
	P2ibLqu/+sbbX+fYW0/ttIgQX9uvpQLsyN9deQQOmnpxCFSoBnECmWHH+v8TYUVtq3G/k2S6r/B
	BdvgssCTQnjmaG/UJ/1QJ4Wv209yvNPT1MneY/zvX31Iew==
X-Received: by 2002:a05:701b:2704:b0:1b5:4f6d:8277 with SMTP id a92af1059eb24-1b5568e78b1mr11025822c88.26.1795432135606;
        Mon, 23 Nov 2026 03:08:55 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:55 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 18:08:05 +0700
Message-ID: <20261123110805.119610-7-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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
index 8ba7982fcd81..40a14301ee3f 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -271,6 +271,20 @@ headphones_amp_default: headphones-switch-default-state {
 		bias-disable;
 		output-low;
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
@@ -288,3 +302,103 @@ &wcd_codec {
 	qcom,mbhc-vthreshold-high = <91 259 488 488 488>;
 	qcom,mbhc-vthreshold-low = <91 259 488 488 488>;
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

