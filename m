Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A463F4DC2;
	Wed, 20 May 2026 15:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290301; cv=none; b=XX2fjo4sjE2PbdTYgCeun2xgBQtgQWB82cLucJyTXmJ1IaWX8GjHf4Wd58hpLk+BV2av9MgckCS97DMm3lXWQEhmOGM/N5P5FosEkcl3zNRIzl55mFMFNZsZXe2e8DwFKp6QTBdXWrhW4PZ5j0gyGbKBbqqWZxbJxjpdW3R1NpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290301; c=relaxed/simple;
	bh=guUWYLFN67B9mhuvYOcx9LkAqALRrgfRZbMTdDdzeuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s7WIfB0yI6VHQqBIgJr7Enq4Y0kJ9e6L6OnQaO4K3S7WQnvZNcR4292tFJgAiXbmfttEWV/gdNSL10NSg2BiL+EQz12rDDMBmATsY1w4EzUa7toQzgM26oQvK8j7RGjaXX9hvKZ50B84WhXBuXrJ0MeMlpOw9jXKVJfU0r2JMkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XcYpuKFa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XcYpuKFa"
Received: from mail.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:ad48:920a:da6f:a034])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76C99104A;
	Wed, 20 May 2026 17:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779290284;
	bh=guUWYLFN67B9mhuvYOcx9LkAqALRrgfRZbMTdDdzeuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XcYpuKFaEOl3x2JZXqcPgtQwBujG3+12mQftY9FL6Sx2wWcUSFxSebDEhl0qJF0FD
	 Y6le3V6NkxzXGoPhZKvp6ItlHTwEP/RLtgGSmny1FxnXUwnQrRe9bmWt8keqClsS3K
	 Pql4Za8UvO3vAJJjxKk7EpS85/Pfh1HJF+F6AO24=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 20 May 2026 17:17:25 +0200
Subject: [PATCH v3 1/2] dt-bindings: media: i2c: Add Sony IMX678
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-imx678-v3-1-8b5f9676486e@ideasonboard.com>
References: <20260520-imx678-v3-0-8b5f9676486e@ideasonboard.com>
In-Reply-To: <20260520-imx678-v3-0-8b5f9676486e@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Lachlan Michael <Lachlan.Michael@sony.com>, 
 Ryuichi Tadano <Ryuichi.Tadano@sony.com>, 
 Kengo Hayasaka <Kengo.Hayasaka@sony.com>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5080;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=guUWYLFN67B9mhuvYOcx9LkAqALRrgfRZbMTdDdzeuA=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqDdCxOqkMQciIjjKSvqDlJrE9lDtdYhfc0eZgW
 rjaEJ4WXTeJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCag3QsQAKCRBD3pH5JJpx
 RY4zD/9QAtBamKaa3gM7O9iN0Zb+mSwqTk9GF4VrqupuRXr85zSrOFTHwRyqF+DJp7FsRfd4Fws
 H5qxGeRv440BdJrYcfIi0C2iQ/clJdB3sF+RE8FFzztWCuEkL5Q1QCS28GvGfDNDCDyvvpdPWYX
 /FDbFcp6FTCnJUHjgytizMQjQ/hmMR8EhRh1u5TafmIXMtNv1tspsVcfQLfi4nQ/EKMprXB9lAU
 JijXZ3K3ZsT3VJsLVAWjSFJq6QtXlQb/bovkhYsEQcThmzEkoTvKQ/7S5WMDP3IXQggAQ/qbi0j
 2BYqrfqZWiPQ3w+Ccd6tCZxh2poq0FMgjrD+2GWv12N+XuTJl7vXMnXdGmUE3pRL0f1BwEi7GU/
 hFwQsqO2P6tgxl8LQvUI/mFnh5825Bgm044LlefN+h+qjfdW02akYb7e7WMKOCE2KCDQhwdghOv
 8kLdCKSD6Xhoflu0qXCtrPBzHC+gk8raUzts8bC8UHPm+7r+1LSg8mTDq/nIU0XBUr93GK7tiUp
 nVJV0Q4nrEWoNBUN5zIlSSOnnU2HFlKn1CZKVMMxtPCVt9JUuoVV0MPwwjZLF+RSU5GgPqH3Gar
 Qt31FFYDKOGPy0ETa3BHBXMBqihEmZGRHQGrwGUjd4ECfqD0R3fLekAMzJ0Cj/7/Io6blY75ixk
 hnBacl4gV0eSqSA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Sony IMX678 is an 8.4 Megapixel (3856x2180) CMOS sensor, that can output
pixels over MIPI CSI-2 bus. Add bindings for it.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Use `reset-gpios`, mentioning the sensor XCLR acts like RESETN, instead of `xclr-gpios`
Changes in v2:
- Add per-variant compatibles for mono and colour, alongside the
  generic fallback, so the variant can be declared without powering
  the sensor at probe.
- Rename reset GPIO to xclr as that's what it's called in the
  datasheet, and how it behaves
- Reference the generic video interface devices schema and switch to
  unevaluatedProperties.
- Drop "link-frequencies: true"
- Drop the T: entry for media.git from MAINTAINERS.
---
 .../devicetree/bindings/media/i2c/sony,imx678.yaml | 129 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 135 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
new file mode 100644
index 000000000000..d85745ddbefd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Ideas on Board Oy
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX678 Sensor
+
+maintainers:
+  - Jai Luthra <jai.luthra@ideasonboard.com>
+
+description:
+  Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
+  image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    enum:
+      - sony,imx678
+      - sony,imx678-aamr
+      - sony,imx678-aaqr
+    description:
+      The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a mono
+      variant (IMX678-AAMR). An internal register can also help detect this at
+      runtime.
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: |
+      Input clock (INCK). Only the rates listed in the datasheet are supported:
+      13.5, 18, 24, 27, 36, 37.125, 72, and 74.25 MHz.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply (3.3V)
+
+  ovdd-supply:
+    description: Interface power supply (1.8V)
+
+  dvdd-supply:
+    description: Digital power supply (1.2V)
+
+  reset-gpios:
+    description: Sensor RESETN (XCLR) GPIO
+    maxItems: 1
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
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+                  - const: 5
+                  - const: 6
+                  - const: 7
+                  - const: 8
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
+  - ovdd-supply
+  - dvdd-supply
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
+        camera@1a {
+            compatible = "sony,imx678";
+            reg = <0x1a>;
+            clocks = <&imx678_clk>;
+
+            avdd-supply = <&camera_avdd_3v3>;
+            ovdd-supply = <&camera_ovdd_1v8>;
+            dvdd-supply = <&camera_dvdd_1v2>;
+
+            reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
+
+            port {
+                imx678: endpoint {
+                    remote-endpoint = <&cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <720000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..6b368345a771 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24911,6 +24911,12 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
 F:	drivers/media/i2c/imx415.c
 
+SONY IMX678 SENSOR DRIVER
+M:	Jai Luthra <jai.luthra@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>

-- 
2.54.0

