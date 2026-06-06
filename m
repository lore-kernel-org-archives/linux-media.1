Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC39302146;
	Sat,  6 Jun 2026 12:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749328; cv=none; b=ILlYeK0no47RXX5e8to3aSldZwHhSpkfC6E5F6NDes+JSRgr1VSZFRXIq1cmBPKtic3vqPYZpLrA0yfjJBK8JRD27Gn54ZoGTYdul/09tMYu7w6W9HA1cReMyAkoT7D8YWpFlAx1xJ8LblWyC+butv9zsC4F93n7mzuiQwdIGkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749328; c=relaxed/simple;
	bh=HiMPHrnLbVXFI/YtBsG2eDmStX1Q4eN6kCqyvhMDQFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hAPilBEQ2dI0XuY3wNTDzTj8KREQY7vDPuRJKZ0u+FEmyNd9hLGbyuNNsKFK1OVOthiFKGuGjG2AzxCtyVb8oj3g2y/Ifsdb2aXQjIPSy7jSBBK1jiAzVxzlRmACqKdMCOa4PQlWKQLSNtDbfMLS2ENLP6g07bvrpjMBQZNAlEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C09AmWf6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C09AmWf6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79158C2BCB9;
	Sat,  6 Jun 2026 12:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780749328;
	bh=HiMPHrnLbVXFI/YtBsG2eDmStX1Q4eN6kCqyvhMDQFQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=C09AmWf65WQm4Yp4VRf1kBmafDHw6ad609SSK5V1GzEyUk2TtjSbtM/d6Zf95+ME9
	 RxxSHYXF8Y4zl1vJHNOybN9WNHIe6bWuZu0X08HtjQz9IVaFNzt9vakEYRFOnWo/hE
	 JoQH3LNeFHFfKxW+krEixmg8bq5rQ8HzPk1rX1HnOLN0MPv6enq44VUBdzzmntWe+i
	 OStXEwXM7cHUWgU0xTwgzAi7YwacYDh6POE7wue2NkEnIzbyPb+twbgVdupbL7iRDz
	 ntPUB38gyPGYIqRyy0OdiXSn6b3GbQvu9Cv9X65anYSrCnqkgGvtVsk4NbUqThNj6+
	 GOaRcKCcrZMog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62437CD8C8C;
	Sat,  6 Jun 2026 12:35:28 +0000 (UTC)
From: Herman van Hazendonk via B4 Relay <devnull+github.com.herrie.org@kernel.org>
Date: Sat, 06 Jun 2026 14:35:27 +0200
Subject: [PATCH v5 1/2] dt-bindings: media: i2c: add aptina,mt9m113
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260606-submit-media-mt9m113-v5-1-2088c7358e11@herrie.org>
References: <20260606-submit-media-mt9m113-v5-0-2088c7358e11@herrie.org>
In-Reply-To: <20260606-submit-media-mt9m113-v5-0-2088c7358e11@herrie.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Herman van Hazendonk <github.com@herrie.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780749326; l=4154;
 i=github.com@herrie.org; s=20240417; h=from:subject:message-id;
 bh=4A9cg1j0DPHiAbho6PLcd9YrxAZyAPEE5WDFEqhZNps=;
 b=6tu+WX851QdGgxoZO4jCta+asSuAc6weT02haWp6c7VRJnYDnN7W4KlB3fgZ5roldrHohdCMR
 QGfI/HoGcWJAEsFsLp9+Qm+DaL5OriJUbmGGkYKuNi02c+yy1p/V3JN
X-Developer-Key: i=github.com@herrie.org; a=ed25519;
 pk=YYxdq8fb5O9vhkW3n2dCH044FPZZO5718v/du7fRhFw=
X-Endpoint-Received: by B4 Relay for github.com@herrie.org/20240417 with
 auth_id=809
X-Original-From: Herman van Hazendonk <github.com@herrie.org>
Reply-To: github.com@herrie.org

From: Herman van Hazendonk <github.com@herrie.org>

Add the binding for the Aptina (now ON Semiconductor) MT9M113 1.3
megapixel SoC image sensor with on-die ISP. The chip is used as the
front (user-facing) camera on the HP TouchPad tablet and connects
to the host SoC over MIPI CSI-2.

The binding describes the chip's i2c address, optional reset and
standby GPIOs, the per-supply regulators (VDD, VDD_IO, VDDA), the
external clock input, and the CSI-2 endpoint pads exposed via the
"port" subnode.

Assisted-by: Claude:claude-opus-4-7 Sashiko:claude-haiku-4-5
Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 .../bindings/media/i2c/aptina,mt9m113.yaml         | 122 +++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
new file mode 100644
index 000000000000..72b827c47b1d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/aptina,mt9m113.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aptina MT9M113 1.3 Megapixel CMOS Digital Image Sensor
+
+maintainers:
+  - Herman van Hazendonk <github.com@herrie.org>
+
+description:
+  The Aptina MT9M113 is a 1.3 Megapixel CMOS digital image sensor with
+  1280x1024 active pixels. It supports dual context operation
+  Context A (640x480 preview mode with binning) and Context B (1280x1024
+  capture mode). It is programmable through an I2C interface and outputs
+  image data over a 1-lane MIPI CSI-2 connection.
+
+properties:
+  compatible:
+    const: aptina,mt9m113
+
+  reg:
+    description: I2C device address
+    enum:
+      - 0x3c
+      - 0x48
+      - 0x5d
+
+  clocks:
+    description: EXTCLK clock signal (24 MHz typical)
+    maxItems: 1
+
+  vdd-supply:
+    description:
+      Core digital voltage supply, 1.8V
+
+  vddio-supply:
+    description:
+      I/O digital voltage supply, 1.8V or 2.8V
+
+  vaa-supply:
+    description:
+      Analog voltage supply, 2.8V
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the RESET_BAR pin, if any (active low). The MT9M113
+      has a single RESET_BAR pin.
+
+  powerdown-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the STANDBY/PWDN pin, if any (active high). When
+      asserted, the sensor enters low-power standby mode. The MT9M113 has
+      a single STANDBY/PWDN pin.
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
+          bus-type:
+            const: 4
+            description: MIPI CSI-2 D-PHY
+
+        required:
+          - bus-type
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vdd-supply
+  - vddio-supply
+  - vaa-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@3c {
+            compatible = "aptina,mt9m113";
+            reg = <0x3c>;
+
+            clocks = <&mmcc 48>;
+
+            reset-gpios = <&pm8058_gpio 29 GPIO_ACTIVE_LOW>;
+            powerdown-gpios = <&pm8058_gpio 30 GPIO_ACTIVE_HIGH>;
+
+            vddio-supply = <&pm8058_l15>;
+            vdd-supply = <&pm8058_l15>;
+            vaa-supply = <&pm8058_l14>;
+
+            port {
+                mt9m113_ep: endpoint {
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                    link-frequencies = /bits/ 64 <384000000>;
+                    remote-endpoint = <&csiphy1_ep>;
+                };
+            };
+        };
+    };
+...

-- 
2.43.0


