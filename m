Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8554538E5C8;
	Mon, 21 Sep 2026 19:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018716; cv=none; b=o3gLUX+oDjbK/yRbUmecK8zOLP0MQsrapenKUOmoMCiagrab3VhM3SiaN/LQduLbJvD7dX7Itv5TBL7gy+kEenGLyJlau7DOH3tFBqPOLvp5N1pfi8EU+ApLL87Ptff++R2Tf+9/W5ZYAXK9YbsW2XqJKAaibu00BFWIKkDEF/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018716; c=relaxed/simple;
	bh=CWeNmB1G1T4FfpPmAdc0PU7vtCSMJKCzRLRTwINH16Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k+iAU9nKGPjo6BCPjmGc7aV7Mqd50rnVUEx08HQcwCtaym2vOREXnOHs5t9Tuv8jvnqNyLfJ+xxhcxp1biOR2ydzF0222fbU44gwV8//EFjZMl1gAufluWA6y2PKOJ/dAjWck1vC+aqAq6tapc0mUnC9RVosXANo1766xDfZBIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=h3Yo7OJe; arc=none smtp.client-ip=79.135.106.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="h3Yo7OJe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790018706; x=1790277906;
	bh=6F7ov9WbdmIaBdnwxxwpg5631cX3gWx45dosU+Bspgk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=h3Yo7OJeBXsUB87v97+cUT9iTEcaRcLLdlp7QY/3zN1VMYgJhvL/oahkowp+Oz7X+
	 jQf+Lp70EBfECzxpAom3n261o1DXT5Z5DZmXoNiC7/5tK4bwmmE95JyzBdnmYLOL2D
	 udp8AFgRRFjn3q5P0JTtFoHZ4Llb8X+u7WNS6AGPGawpz4M3g0YX+fc1JSuQPCM7iw
	 +yJNlTu1zApvDqxkjr7Harg8E2YBCQjTz2QxIxjHDlcwPx4moNIP5gXaOiBeynhsMh
	 z39GQXf5ZxRjGT5H3IuRlU7HfpwXGsnO9AdWhRgy0KnK7IjpsssRn3Lu3tAVGB7i2M
	 Ngsl6CKD1rpVQ==
Date: Mon, 21 Sep 2026 19:25:01 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: media: Add Sony IMX681
Message-ID: <20260921192450.21811-2-lsa.uz@pm.me>
In-Reply-To: <20260921192450.21811-1-lsa.uz@pm.me>
References: <20260921192450.21811-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 35bd21bade49e26084294d7add24e24a4642068e
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Sony IMX681 is a CMOS image sensor used as the user-facing camera on
several Microsoft Surface devices. It operates from analog 2.8 V, digital
1.05 V and interface 1.8 V supplies, is programmable over I2C, and outputs
10-bit Bayer data over a two-lane MIPI CSI-2 D-PHY interface.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/media/i2c/sony,imx681.yaml       | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx681=
.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml b=
/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
new file mode 100644
index 0000000000..6d2e4ddcee
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx681.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX681 CMOS Image Sensor
+
+maintainers:
+  - Andre Gilerson <andre.gilerson@gmail.com>
+
+description:
+  The Sony IMX681 is a CMOS active pixel image sensor with a square pixel
+  array, used as the user-facing camera on several Microsoft Surface devic=
es.
+  It operates from analog 2.8 V, digital 1.05 V and interface 1.8 V suppli=
es,
+  is programmable over I2C, and outputs 10-bit Bayer data over a two-lane
+  MIPI CSI-2 D-PHY interface.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: sony,imx681
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Input clock (19.2 MHz)
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply (2.8 V)
+
+  dvdd-supply:
+    description: Digital power supply (1.05 V)
+
+  dovdd-supply:
+    description: Interface power supply (1.8 V)
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO, active low
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
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
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        camera-sensor@10 {
+            compatible =3D "sony,imx681";
+            reg =3D <0x10>;
+            clocks =3D <&clock_cam>;
+            avdd-supply =3D <&vcc2v8_cam>;
+            dvdd-supply =3D <&vcc1v05_cam>;
+            dovdd-supply =3D <&vcc1v8_cam>;
+            reset-gpios =3D <&gpio 4 GPIO_ACTIVE_LOW>;
+            orientation =3D <0>;
+            rotation =3D <0>;
+
+            port {
+                imx681_ep: endpoint {
+                    data-lanes =3D <1 2>;
+                    link-frequencies =3D /bits/ 64 <969600000>;
+                    remote-endpoint =3D <&csi_in>;
+                };
+            };
+        };
+    };
+...
--=20
2.54.0 (Apple Git-157)


