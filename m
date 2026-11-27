Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787156;
	b=eVb+qGAt1IA1IiH1QtpIMDQ5r/OMNibq6dIR/phxi28Fvz9RaoBXN8qymPt3nahtIysM
	 I/XXxtbFVcyRvYEhL45yOZjYbrUAiOVyV9yIIhbLbm5976vF7vm+s7AdM55TDXiOekZA4
	 gPIstqqm3ZVId+o0B39totGzqcZ6waUDpS/tyNk6TSPi8SNF/XLQ0m1d7jfY/9mtzgorM
	 YVsRgDJ1Zp2XOs/4Qjc2HmBoMOf0aixdJsAD98XxcBz+aFFz/KT155v0phiJC7Cee3hEB
	 HxKzNFU+Vu5ljdvN5QcW+NJ1c0CJHnXooedYXcROYKhHte3KYUcNGHTeimIgiNlDysw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
	b=BWKuNtyy9PfyypTgKgSY2pimmswV4RTV8uqIzODw39i97Ylt6e3rXen67qwhADQ8+i+A
	 crl1u5fn+VE5uVvO0KBFY+7TJFY8yu8QZncxXEaP/ph6PyxK+4pGtt6KNGjEKh0XiEndS
	 V0e/owpws0vW8Kcbkhn8DCWoQq7sQWRG5P5UEMNvGuX5Rt+PqtAUgawzRU9mDrskp2e67
	 klyiQdxmcBs3cl5OZtKVJr9sC01k0RHbfLhG0v2OvA2XADziZmHDYONdjrRmne7wPI0HT
	 ++xJjIQer29XiEfYxSXpzif4jrssPrLhPniJ2mp9jQTJr6b3ovGFpP6EqAAhAMBjsbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7bbcdEA;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F107606A326
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F107606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7bbcdEA
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f0464dd6b6so49926755ad.1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 05:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787155; x=1796391955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
        b=D7bbcdEAeE+MD1H9f/KFWjA1H0YHRcfugdEdaeaMX53BmxslbpOMfjMmcwOCT/CP4D
         t+lnzPTOsvEXQ2Q7ISIaj+E5yfcHPKhPGQiry2RCrntqhZbmL/6Vle/D+EH2+yH6s5am
         wGPpbc9db1bpOsHn6av5rYEiLdkf13qUxzTcycRzoD7zQezgjozlhhVDHeYMLoR/9HhO
         5h7L68EZbURFnZy/JazppYXdbp6uuIxO94o3KD0Ro0TxOaPrIPO9MfZh0rI0m8/9nASS
         Zr5OH1OxEOKb8sJcJ3ln5EwXap/ryFpk/erP/s9fU3MQBUxfelY0/7KAnBiV0C3dCqff
         Oz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787155; x=1796391955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
        b=JmDySstxs5nXIPFZckhm9AFpvQ2JCBHUEDkiG2m256z/TZ2vjXgQ7o+V4PrhMDbzFu
         gJmIM643AZl+k3q3j+N+j7Ah9D1jVB9EwtCp0mCA/puDD6DsRMYA6hrKE4Tstds4HTZp
         Jy78KJwDl3bRqps1auGO5yopylp1UDF1HcM64iv5AdnSd+gkuzzFPvOeHNKm036fH4ky
         OsUZ3FfFJDSSI6A/8JIfmxjb5JoECLFRjyCg6R+SxDEKtTLQA2ysJb+1iWxIOeXqQzF/
         oXhvrxsm+eLOfUE/DrzBUosSvoKdGSLDEF45eAEatvuh7FbITBe+XEF+QBw/cu+IwwKS
         Xhng==
X-Gm-Message-State: APuU4Z+j6QhzjgfIf02KBPEuiX/06BZCkR5HOKJ1lSXGiiiJrGxlrcHv
	yr9cjCT0Kk9taCpPd6Ufq2c6S3jc+TKtDlJetQ3QSzpU+Y+MrKsJG/eY
X-Gm-Gg: AZFdTZexpeR4luIJDlOnda3HNEopI5Wd2Qm6R3DqxtwPtFj4GZ2EnT2heI7zuzo6eNC
	1j0UjtT0GXrX4lbZGRZl3XSSaCYTLlHCevRiB+RZL0AAfZypfxwupSS9pHyGRVC4zBpplQP2Pas
	S94yZWntwtBScgyHtd23aIGhgQUlVRLVvH3RRmFbkj49KElo9/xqApbQjifv8Ghmth+oAEaaZcV
	ra9ccew+5y9T+s2MYZRxF3bg+QqqoGh6kyXhI0YQ/tBvERNjxxc4LmE4ZYYW4VQLxvFdxpLKscF
	0+xLfeqqBk1vDkNx0+G7qlmVK6+PW9CShHPvFbXE+SVwO9gYOHEi/ImHcwk2m/gGrxi4SJ3U1t3
	LIaXxx661QfpBsPsRePyKRA8K+XVYRfXjsnPtyG4JLDzLPxC5GoA07oukbJZwKJMENIygtSjA5Y
	1cf3ZzPf0kGikbKQo5a3G4UnJdfBTrJDB87otYmctI3IgH8W+lfS8XOJ7c6PLN6lD+KBtX5ZAQd
	6BTo4Q5DfhoSvP8GvVkWLGCsey/3uEaCjO4cemZkb+bfHisVDeSNQrg/40ws+ld74BDIOvgwiGh
	iUZAW4ej91dlFcMTZd7Jvf2D3dEIKFsHppt3IWld8VhKLg==
X-Received: by 2002:a17:902:db08:b0:2ef:dff3:47e7 with SMTP id d9443c01a7336-2f03f170f5amr261112775ad.33.1795787155319;
        Fri, 27 Nov 2026 05:45:55 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:45:54 -0800 (PST)
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
Subject: [PATCH v5 4/7] media: dt-bindings: media: i2c: add OmniVision OV12A10
Date: Fri, 27 Nov 2026 20:45:04 +0700
Message-ID: <20261127134507.125513-5-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the OmniVision OV12A10 12-megapixel

MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/ovti,ov12a10.yaml      | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
new file mode 100644
index 000000000000..f27c304843ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov12a10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV12A10 1/2.8-inch 12Mp CMOS Image Sensor
+
+maintainers:
+  - Hikmah Gumelar <hikmahgumelar@gmail.com>
+
+description:
+  OmniVision OV12A10 is a 1/2.8-inch 12-megapixel CMOS active-pixel digital
+  image sensor with a 4-lane MIPI CSI-2 interface and I2C control bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov12a10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  reset-gpios:
+    description: Active-low reset GPIO.
+    maxItems: 1
+
+  powerdown-gpios:
+    description: Active-low power-down GPIO.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply (2.8V).
+
+  dvdd-supply:
+    description: Digital core power supply (1.2V).
+
+  dovdd-supply:
+    description: Digital I/O power supply (1.8V).
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dvdd-supply
+  - dovdd-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@10 {
+            compatible = "ovti,ov12a10";
+            reg = <0x10>;
+            clocks = <&camss_mclk0>;
+            reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+            powerdown-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&vreg_cam_avdd>;
+            dvdd-supply = <&pm8953_l2>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <1 2 3 4>;
+                    remote-endpoint = <&csiphy0_ep>;
+                    link-frequencies = /bits/ 64 <216000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

