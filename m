Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609978;
	b=g8yM2NFuiNzcfrhgPBO3m+K3J6P7dbEgueCILD04cv7DyF8aVZf4y8mquUmMZJ3dzmVO
	 9JPbCrxnT+OjAzeUR2xLy5N+XJLQX98LBfYLwWyWdQKX87JVDoB54OlUY3pL+uKZPxDHi
	 Z3icneKbjrZroNZekibd7/SsK9rhuh4QbIn0kslL8l+SxDFQlmIXsAQGetPSxNUWtq7w9
	 MWoLy7FJe8es6xQtmD2FJYyv0Nwd2lFMlvPoPunfQtJrU5VK5QXP0dcZVCojZtPGuyBN3
	 hKYF0fK5bGkAop0stoBnr7kSSCZxzqcISrb+rOYxqOK9/4Fh6SG3CTPvfQG1pPLLJQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
	b=YXKovk6oVB9K+H5ye+R+kuWXecUKxLv3iUnFHp3sbf0yz5KHDY49hLmHlbAWw2GgCL/7
	 bya9BDoemWQ+z/x8He3SnpO/bsbu/3daqHtKKGtkKVHzfLFWzacH/CK5VdLhEmwoHzic8
	 uN55wD31u6rNd3JxbUDsh11VXywQC5f8mH090oRAzYXgFPGSzm4ym6xu0hOrKjlb57l9u
	 wVxrGIRSGcsoXu9uOrspO8PltFWX3wgGjOHpfk1eCA1OtXg4vGAbVitIH5Geh5EBXbxTc
	 jlg0TwSui3oTMdAiIGZaYZX0n39MrTsCyT1xVLAfX4r3RGn6TOVuE5fpxR1Wq6LLBcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFw0of7v;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2733E606A69F
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2733E606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFw0of7v
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso2252191a12.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 04:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609976; x=1796214776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
        b=wFw0of7vrl/UYupGvwc1d1CRi+/6e/EN7A7sYCP3nbhQDhcX/Y1skD7RavLyQeOkZw
         IRMp5I+hBjc3wKEyhhcFeN6Il1U2Q1C/yjWHMD2alXL1jLUOQFf/DRRnRX3NlbUrx06J
         OUa3C56ISoskjoQ0/6QwwM+nRHd6DOyx6RAJvdsq9zb8gcLroTfWl8PzYO3y0H88uml/
         i9bQVE2mVvsSALntek32xUwl/3q9uOxlPkxXWdzcM3Z1z4fNM6QAYC4qMxk5zu8oE9TH
         uQ6dNPA2xPxvyQCgdrt8xKa4xf3MiLGBV4z4pvCiblpHGsNDb1gBcXeUGm5a9ehwO4jl
         mi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609976; x=1796214776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
        b=mZIDO6bgNZIGX+Ow1GAqiQr3DizzTKMCAH5rv9Wu/IzxP3DOT9/mIwfOMApmHXKVw2
         VQs3v03Bs8bimlyPSUHDHE89ljC/hLsSVfj3y7piDC84xMdo6h47c9i1bwJuwF8VPAJe
         GGT3SVQYOJb8Z3F83sMjTFDgCtVLQM3cN/Zs2mN0F//U1dXZs3Ao72qMgKblaVktzve6
         cg7cyZPPjq7E45rf7ZVB55LbpJ0Z8lnR/yL+FVesE5jYkPRoFYxjSQyv5yvHB2LzbVka
         B7oMp8fSH7A2W2FlcP1IM5uy6nlHQiDxcCFL7f6P86cwicU0xzhHpX3KUTGDOu6jCpdY
         gyNg==
X-Gm-Message-State: APuU4Z//Pp35LRq1XSburHG8146NhJF5uZx9vjTp7YTUYQF7oOmIAlq+
	yf/yDfP6M5jX0JNFchtjPO4dH9B/gaIXws7hgpIKMiVcFPGwvRCM+TALRy1KctDdGwo=
X-Gm-Gg: AZFdTZecaI4+fLh66j0kC54fiXkTxNNf+SyRqBx+6DhS9J7YoXktTzWeMGgb3zrcMgm
	IyN3Si2z4q9jzquCdWvtQPBn3+hueps+cGO3ds9+ijSj4AQLrWD1Riv0+GbJjqOJxv32zVhHGMb
	9NzOAwGooq7IaJ95+CCFft4/qKfVMtm2EajY4b2+JWqjTjJVr1p0P7LtA3hdwnwIGoOVPhmh8p5
	w2ZH/WQSzlJcNj3GzNE3gTgUeOxLLDDLpoqRZNdkgr1MBdF7YnOzJA/h/jdTzq1AwSubht14uOc
	A9UgJL0HEbgc4yOqFCoVc0BopthgPvuqdBuhLIJQlOUW4xd+WcD7orSFO7rl53t0QwMZ/N2IT//
	dZ1DiFnD+Rl1v7dyBENWp3RgpL+dwznAG8CUxw+NFdOMo219cFqgSOkeURxjxbQDtBNR0VsUlZr
	gYFFFdBzRo9abHT8g+IdWHQy98s9jqfLLQfMVrh34b5k3AlJoNkfzY3orjZXMtdAWN4NMaQjkcz
	na3ldAo/gHJKi9m05UJi6LnXVkZNaOzKY+snKnTOZ7x04Jufad3Y5kGnJs1ceKEslSzJOrJjvvq
	xMqBpSKgyEV6m0Rks7L9CunXNxUQH9EJ66/0t426qqg2unae
X-Received: by 2002:a17:90a:ec88:b0:3b1:3e7a:6d8e with SMTP id 98e67ed59e1d1-3b41c8e0c73mr14764645a91.10.1795609976464;
        Wed, 25 Nov 2026 04:32:56 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:56 -0800 (PST)
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
Subject: [PATCH v4 4/7] media: dt-bindings: media: i2c: add OmniVision OV12A10
Date: Wed, 25 Nov 2026 19:31:43 +0700
Message-ID: <20261125123146.379057-5-hikmahgumelar@gmail.com>
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

