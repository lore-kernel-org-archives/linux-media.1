Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0119477E22;
	Fri,  7 Aug 2026 12:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107392; cv=none; b=lBiuWsJtknWPL5rKM/TCH2tLqmt7042iHo8WWcIE7vArPDY61WsZ/SmZil0m3MNq632XGwrEKCvcFu6tGM+CEYaeUpk1ODKo/EbAYESJJe2OKdTIhYJlwe6MzlXlQ1WPf3NYEBJpGxVGF+7xOrA8Fn62fHXVsFCTTtzYEd4czWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107392; c=relaxed/simple;
	bh=Oy+4CTzEIRCWVBFUKGel8hsUYWiiJUABik/my3g++MQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CW3NY3VwI8j0RsMiC3PT0Dsf1XZzGSrpqEtTaTuw23/ib7viEGDVOoaKeozFufrT2ivokFCeN9BCN6/6/sHH9Tru3uHZkHaEzseI4sztVs0ySuSu+VI8KOOKnBGgfRLSN2rRUk8NULBwMbzGjb7AUDciJv1ACCrWCDJADCi1fPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e8XcNdaF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e8XcNdaF"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:4f4:b619:ec54:a907:a006])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC67656D;
	Fri,  7 Aug 2026 14:54:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786107300;
	bh=Oy+4CTzEIRCWVBFUKGel8hsUYWiiJUABik/my3g++MQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e8XcNdaFjXtlBMhS7w/9ZszMm/rxiag3X6HmpzgN+Q2UJUWmjh+eeu1NDEGsk9rMY
	 tlS7DiPlB6fGBplQBmO58DeZg3Wm8palnWH+KX7KT2pnUOEiCAsyAq4kmH7eBAxfd7
	 LQXPoiMyQ6pEVw3CgC1yhvaX/fJzIwVlAgROFvwc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 07 Aug 2026 18:25:18 +0530
Subject: [PATCH v2 1/3] dt-bindings: media: i2c: Add imx708 image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-imx708-v2-1-7d3d7b57779d@ideasonboard.com>
References: <20260807-imx708-v2-0-7d3d7b57779d@ideasonboard.com>
In-Reply-To: <20260807-imx708-v2-0-7d3d7b57779d@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4424;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Oy+4CTzEIRCWVBFUKGel8hsUYWiiJUABik/my3g++MQ=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqddXdPWdy+MCmyqDhFxc9Dfzsy7+5o1cF+SyqL
 lkziVIYDNeJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCanXV3QAKCRBD3pH5JJpx
 Rb5REACyd/LRIdNwZ1NTseaBzGRm8D9V8z5GXnb3USQHj0b1A2WzMZSUoPOb231wLUBV2Bndj6Z
 28381AJiMUHEkFMCmR8OMNy/blWjkf+Z8UsWmGvQ8Vl0qOrIa7Tyt9B4Z+BlDRNuFrUnv1Ezmic
 ogZcYrWcLJ2p+jfBVQyCUhs757A8kyjROBjoHYXqBK4bcAXDuVGqunZ89NSIV18C8Wjp9VCJ5E8
 yboeOYMXsYWDI+/9Xf/hfsUf8GAHF8TiYWMtCWMmALh9DH0M73eaO1UI0h5cpdh8msLKSKISZsK
 cZ3v3jRl5cju61kdlAQmLGvPeWif3twSV/YxqQZN5XPL2VJ3k5Ypze0vcGCxm+Xp3hwcc0kbp/M
 ht1vESgAZWUsYATFF4Q8jMpieP9yY8oEcuDEYOY2fsCXiXRt7vKAVMKvd/lecFwv5swhQKpHq4K
 eZmB+3pKkicHMs/EnSDQyONISdeBURkDvdlZJgtoSCqfndbaMleJUCBL11oIApHvu64WyptwmJZ
 OAvuL0jDEpDk0y1XvVAOLOyJvjyD0kV45ysVky6758mZ1/a/K0xYNvfhkj02Rq0tUQMJFewVN6Z
 dev8Qz180UDUwxt4B79CuK8Wg+57li8RUQ92SNfBFKtPhEx1mwD57g8rRo6w5RwGzE5spf41c3Z
 wgNtHHyzJWWRsFw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Sony IMX708 is an 11.9 Megapixel CMOS sensor, that can output pixels
over MIPI CSI-2 bus. Add bindings for it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- Drop the |- before the description
- Add Dave as M:, and move kernel-list@raspberrypi.com as R:
- Add Krzysztof's R-by tag
---
 .../devicetree/bindings/media/i2c/sony,imx708.yaml | 120 +++++++++++++++++++++
 MAINTAINERS                                        |   8 ++
 2 files changed, 128 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
new file mode 100644
index 000000000000..e41b3ca53706
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx708.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX708 Sensor
+
+maintainers:
+  - Jai Luthra <jai.luthra@ideasonboard.com>
+  - Dave Stevenson <dave.stevenson@raspberrypi.com>
+
+description:
+  The Sony IMX708 is a 1/2.3-inch CMOS active pixel digital image sensor
+  with an active array size of 4608H x 2592V. It is programmable through
+  I2C interface. The I2C address is fixed to 0x1A as per sensor data sheet.
+  Image data is sent through MIPI CSI-2, which is configured as either 2 or
+  4 data lanes.
+
+properties:
+  compatible:
+    const: sony,imx708
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  vdig-supply:
+    description:
+      Digital I/O voltage supply, 1.1 volts
+
+  vana1-supply:
+    description:
+      Analog1 voltage supply, 2.8 volts
+
+  vana2-supply:
+    description:
+      Analog2 voltage supply, 1.8 volts
+
+  vddl-supply:
+    description:
+      Digital core voltage supply, 1.8 volts
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
+  - vdig-supply
+  - vana1-supply
+  - vana2-supply
+  - vddl-supply
+  - port
+
+additionalProperties: false
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
+            compatible = "sony,imx708";
+            reg = <0x1a>;
+
+            clocks = <&clk 90>;
+
+            vdig-supply = <&camera_vdig>;
+            vana1-supply = <&camera_vana1>;
+            vana2-supply = <&camera_vana2>;
+            vddl-supply = <&camera_vddl>;
+
+            reset-gpios = <&gpio 35 GPIO_ACTIVE_LOW>;
+
+            port {
+                imx708_ep: endpoint {
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <450000000>;
+                    remote-endpoint = <&csi_ep>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 3785b8c1de0a..9928f68175ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25281,6 +25281,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
 F:	drivers/media/i2c/imx678.c
 
+SONY IMX708 SENSOR DRIVER
+M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
+M:	Jai Luthra <jai.luthra@ideasonboard.com>
+R:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>

-- 
2.54.0

