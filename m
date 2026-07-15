Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4C7494A1F;
	Wed, 15 Jul 2026 17:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784136755; cv=none; b=IOGNrUub3y1JlP/PEQtUHZhYPUIRI5o/7hXt4UgmimQ6Gqo/EBIrRVxRr1SlRm4vNtM8dhBEUaHVXv1+g7ggvdmsaIHMaRvErwdsro/WQL1ey5EJoB5DCGt8ljkoWsjF/yO84NHydEfTokms/dK44rTm+CEK5iRgMi0YBRvLQsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784136755; c=relaxed/simple;
	bh=aOyv6JU5ODOfbzCm7KhjHyNHJtXbHzHFj9U5LTsBn10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TWuAINxEJAjd4tM52otkuFLhbVO2pht6OwXHnp0jeavjt4Xnee2B6TlWko6BhnwLyM8tJOUbru+GLIpa4swd3ir366Mi3lcMHe2HE7aDdXX4OgUQrAxwiQrRy9uSm22rghlIKk9mkjvN/s0wBc4y++OVg7qflC1Tyxy7QYZUJ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kBhXCUUD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kBhXCUUD"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 112FF12D6;
	Wed, 15 Jul 2026 19:31:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784136694;
	bh=aOyv6JU5ODOfbzCm7KhjHyNHJtXbHzHFj9U5LTsBn10=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kBhXCUUDxXmz0K1qxRx0enkQdE9NZkXMYGtvHOMLZ6DZX3dJYXDA7rpXMv9+2CEZn
	 +Zb3SqzCoIqBu4twSPcQ42flYwWqkAVUEM7cjzot4BqAAqQ39V09hzckTOOoUyXURl
	 HSy0Uxbr9N+0JbqWYMRTaramunGsIwWoTt+DFvo8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 15 Jul 2026 23:01:28 +0530
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add imx708 image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx708-v1-1-1f36f54e14d4@ideasonboard.com>
References: <20260715-imx708-v1-0-1f36f54e14d4@ideasonboard.com>
In-Reply-To: <20260715-imx708-v1-0-1f36f54e14d4@ideasonboard.com>
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
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4166;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=aOyv6JU5ODOfbzCm7KhjHyNHJtXbHzHFj9U5LTsBn10=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqV8QgzOpbydjf4OzaD06nqeLSjhx/E+zI6Fl4D
 jNWfgldfIyJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCalfEIAAKCRBD3pH5JJpx
 RR0REACCIrrO1nxYte4CbFmExU5wL8WDoX/ZcXKK9oxVkB80pJ5L6UrECJEd/kwXj14RZmGpK3s
 PDYk/KmnvK7hZCUdvMPywJVhKtUdZCuVNZfl5CdsQXALrQ6sETHrbPdEAxZZ5T6DsB1zrLxsAbx
 E67x6Oggvc9q9iHm9Ff+2LiKz2D6JUsDiqwBzZIq/avO4P9n/To8uX9sIzO+L5VeTpcf0MKyYeA
 D8u+pV96/WuRg1+r4eyCTvdYmCQzBpfnEGNtEABTvg+dUkXtnuBeGVv+062OX+zWhyMDucJ7ryE
 efMNuz6A7PbbPaBJstBrw0+sAMJNGa5s8R9+BIVe1/4LbUXL8HogALckIR9buqjOSdq46O19SNV
 LWDPrwS2RrCPc0GbF77py4KZMHbBQT4Rv7IFSCndUq5//ghOFoTwiPCSG7uBeMRO5sa2z2GSsjP
 7UngYoXAeLm3z9Jw9LTbqvGlM2fhHiF2DAR4U5+QQBiqVn44NESuofajx6cdNkn/+X0T4HNCRUg
 d8ybOU8V/s9A7tPpVQRJofLCoLZyYEbBv4WbjjSYCB4UUW2l1uoMxhRi/MxQhc9h+lPsajhqm/x
 UptZ+VBTNytqV8SmGWLljinLlalqo8ePEQghRchYX4szuJu9/IR4+ycZzoUFpM+QWC+eV2qIoZa
 2gSn1eeh/zfvuTQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Sony IMX708 is an 11.9 Megapixel CMOS sensor, that can output pixels
over MIPI CSI-2 bus. Add bindings for it.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 .../devicetree/bindings/media/i2c/sony,imx708.yaml | 120 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
new file mode 100644
index 000000000000..bc346730e1f3
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
+  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+  - Jai Luthra <jai.luthra@ideasonboard.com>
+
+description: |-
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
index febe918d6316..b0e3abfd88a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25269,6 +25269,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
 F:	drivers/media/i2c/imx678.c
 
+SONY IMX708 SENSOR DRIVER
+M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+M:	Jai Luthra <jai.luthra@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>

-- 
2.54.0

