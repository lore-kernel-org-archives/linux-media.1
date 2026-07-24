Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935C23546FD;
	Fri, 24 Jul 2026 15:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784907435; cv=none; b=eD9sIJTe6bNxGw7fKLMUnYkI3B0TR/2K5aEka69fayyGcAa0lddp90X1mEM9odicr9affDjDJcc4uz5giIEEapYUAL1iYZpy4lcRNI8YlzZyLac2KHxqx+JtCyQDrUMOYz9YWSHORBpM4tX9NNtv5cMl8WWWzcVGjRtfc6xUgJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784907435; c=relaxed/simple;
	bh=JOL6+MUTtIG/TQyeu1UTGqTL8FXxVfQQYy8mRlBHY6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jiGl9Pdc86m3M7hf8uAIXT8eQI4+N+OAuKOaHPYLrRhXspUVnhhNMnr5FxB08NIntZ8HoIvOAUjOWvKUip7yB2Ed1LepZslasJ3LEsWPpOKRJ0W3Wq6z86/+mt4dHNq74HbKjMa9Tbugrr7Y6+ZfxmuOKV+935aiXbNmoh4Hb8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dUg0fW+j; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dUg0fW+j"
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 414FA73B;
	Fri, 24 Jul 2026 17:36:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784907369;
	bh=JOL6+MUTtIG/TQyeu1UTGqTL8FXxVfQQYy8mRlBHY6s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dUg0fW+jmlCMIeafMxRNeIwa607RV/7MJkj2rq1QTqrLZaDePuC9ot9yYpCCrGHkM
	 za4mIJK+HvbB1GQRU3eB/Alfb2wFzc09FCfGbdSX+p5i1aKKzqzgJqYFHTXXSnya/8
	 LUAajLfKhmH2KiXe745VXVGpVyaQUbIYfg/JXfcU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 24 Jul 2026 17:37:00 +0200
Subject: [PATCH v8 1/2] dt-bindings: media: i2c: Add mira220 image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-mira220-v8-1-d1899ab64709@ideasonboard.com>
References: <20260724-mira220-v8-0-d1899ab64709@ideasonboard.com>
In-Reply-To: <20260724-mira220-v8-0-d1899ab64709@ideasonboard.com>
To: Philippe Baetens <philippebaetens@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4297;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=7qVkN51rHFIciMJvA1Z8D53Z8lggwDO8fAruqf/OdbQ=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqY4alrUK3EAyCEjjFFaYqEQYZqYXU92h/z/ocw
 7FY7Zpj6PGJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCamOGpQAKCRByNAaPFqFW
 PCfYEACIC3ds+XLoKfEvol6LG8hNDfCHxlF+cvdBAROERwMCsdoIXs5+q9hvBKH0N4EvKBwZJcU
 Vb5XNDBVcXZPBwmx/yaJNmvdH2fjR8sk/sWGY2H4e3q9u6DWjDACz1Jn+J/k8j8gLoQTCYHmKkt
 DnYc+sEkgj4cJiegxRMyYX3D75KsxXYnnSZ6t7DrGiVkf27T+iCwoPa68wplvI7Q2u/gXfikpEN
 iNMeCJTQhD+1rw41ioxoioQXrr8XUxFCx+DY9ks2q3++vdtni7dh4FL+/U9LmMi6YtiU8yjo4x8
 8ebSKC4jyZcM4gfWt9xp5XJNTNf/0PWWAq1YHjenOZHMmFGdfpWenzEC7FeO02gi8pUpGd7gkHW
 I2PeMyGXVWkYUSP/cXjKVLK84LDzSu/uh/xfnWd3+Kbv8PWyVN2xY1jkBCc++miI9ElcUYDIEK4
 pqiDSjyQBX9ZaTxUIQDknKFx+aeDs3ka31uojqrfbZH58kQFDmZg+bJY2aGoIu+2xUa7sv6GmnP
 YZu+HBsI63NHamEKBqhobztclBKWVAUb3YGqBLXYuBFmzj2pHSFG3zkvN8/5gzXUczS/1SShTHU
 MQWt3MNZnK6zm7QwEygsjeq91SauPnAqj3OFdxMGDTvPuCUq3EcqZ4xv2LkB2xW+UVh/KdSOiYB
 XRUDB1TEkfI/RNw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Philippe Baetens <philippebaetens@gmail.com>

Add bindings for the AMSOSRAM Mira220 image sensor.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

---
v7->v8:
- Add Conor's tag

v5->v6:
- sashiko: use 'unevaluatedProperties: false' at the top level to allow
  properties from video-interface-devices.yaml

v4->v5:
- reflow description to 80 cols and drop |-
- remove 'reg' description
- remove 'anyOf' from data-lanes
- remove 'link-frequencies' from required properties
- remove 'clock-continuous: true' as we already allow all properties
  from 'video-interfaces.yaml'
- remove tabs from the example
---
 .../devicetree/bindings/media/i2c/ams,mira220.yaml | 101 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 108 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
new file mode 100644
index 000000000000..d113f7f81ffb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ams,mira220.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMS 2.2 MP NIR enhanced global shutter image sensor
+
+maintainers:
+  - Philippe Baetens <philippebaetens@gmail.com>
+
+description:
+  2.2 MP NIR enhanced global shutter image sensor designed for 2D and 3D
+  consumer and industrial machine vision applications. Due to its small size,
+  configurability and high sensitivity both in visual as well as NIR, the
+  Mira220 is well suited for 2D and 3D applications, which include Active Stereo
+  Vision, Structured Light Vision for Robotics and AR/VR.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ams,mira220
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  vdig-supply:
+    description:
+      Digital I/O voltage supply, 1.35 volts
+
+  vana-supply:
+    description:
+      Analog1 voltage supply, 2.8 volts
+
+  vddl-supply:
+    description:
+      Digital core voltage supply, 1.8 volts
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+    description:
+      Video output port
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
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vdig-supply
+  - vana-supply
+  - vddl-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mira220: camera-sensor@54 {
+            compatible = "ams,mira220";
+            reg = <0x54>;
+            clocks = <&cam1_clk>;
+            vana-supply = <&cam1_reg>;
+            vdig-supply = <&cam_dummy_reg>;
+            vddl-supply = <&cam_dummy_reg>;
+            port {
+                mira220_ep: endpoint {
+                    clock-lanes = <0>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <750000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index febe918d6316..55ac4ec433a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1430,6 +1430,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/light/ams,as73211.yaml
 F:	drivers/iio/light/as73211.c
 
+AMS MIRA220 DRIVER
+M:	Philippe Baetens <philippebaetens@gmail.com>
+M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
+
 AMT (Automatic Multicast Tunneling)
 M:	Taehee Yoo <ap420073@gmail.com>
 L:	netdev@vger.kernel.org

-- 
2.54.0

