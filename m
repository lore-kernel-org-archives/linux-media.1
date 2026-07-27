Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90625288B1;
	Mon, 27 Jul 2026 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785142635; cv=none; b=oeeegqep1VFT9hQao/FfkDdAkTWcuGDoG/uEyhfMHC+dxePv5uWuENTz4EdXdV1pXgumhjo1pxooU5P18Y+fMwfwTsw8peDFVg/yJXMQf4owBy+9/pZL/DHGIfyoo9rAQv0haK1vgRE+LEewdP+CEwLZ8GlpqUqY4hTz+D2yFes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785142635; c=relaxed/simple;
	bh=xDkqMegQDZBau84vfu7URo8g+G2La5zNgZMtKdqfXBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vf0LGC8JDxLdD/7vE3nz/rOzhoU6Adfgyl5R/CfwE17zmNOllWJukBjzfcTNcglUqv8Muk0Lh4T039oeufYajWhDUIkZueBEcDOJyqnJykLivPTOzXHrD/Zj24Y8j9/8ivSsDHTWuuXmu9NN3LHIQzBgXGG61QGIw+EJrscoSlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Cly8b9O4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Cly8b9O4"
Received: from [192.168.1.102] (mob-5-90-50-102.net.vodafone.it [5.90.50.102])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 502D2A09;
	Mon, 27 Jul 2026 10:56:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785142568;
	bh=xDkqMegQDZBau84vfu7URo8g+G2La5zNgZMtKdqfXBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Cly8b9O4AH1gqkryGpRoX7V+7aw+LLSjL01qt09Jx6Dy5OPGA09XS4x/BXkz/lZs4
	 yv21YGs866Dam/96F3CCM6fDp/VUSpZbnE5ssREYcRKCe6dGqNes0LXPmXOmnaMxoR
	 JyRLZRcgR+3FmBJUYdMJB6kJq0HfxeIOddO1sVEk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 27 Jul 2026 10:56:30 +0200
Subject: [PATCH v10 1/2] dt-bindings: media: i2c: Add mira220 image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-mira220-v10-1-8825794e6095@ideasonboard.com>
References: <20260727-mira220-v10-0-8825794e6095@ideasonboard.com>
In-Reply-To: <20260727-mira220-v10-0-8825794e6095@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=48fHvd/p2nHDDBg9t3PFew0xNa3S1MhNtsEXKgTSvRA=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqZx1lQHrBEVCuQnKabuexTzNTlQ4DlalRo/nQH
 TcV1agvdsOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCamcdZQAKCRByNAaPFqFW
 POzaD/9FhaIdoYvJcO7KDu2Hl92Y5yObS0dpAHKAxtHDGe4F2GJefhGclccAVEIaaIFt7vEd9Y8
 SFmx62OLRk4MnO7asYAlDcdgepvt6SGtCgzxIsEoN7Yaci67PX5Yu7BBtrUplOgRkB9BqjYZW/1
 uLTz/cGLHMgf4PwagmYupaDE7L5BTHU1F4M5WZrElkSnnOxIqAmAZkjCA+I7peBcPDfyL96buhf
 J/d7IIxpyoRaJJSh6F6m2IcVYDQl4/VdT9dTod1ZF/1z0ATTLrmhGTuCfyt+5epoIAQIBR863zJ
 KacWcvFYuW7/fp1yVxMIZROJz4i/FzLDpopDlXr5t1r/KLT6T/e0FVCwDbhr0tfbuqbR67OFISy
 Zi+CGMknRq863a9V8o/slSJnQSJndrdSnFELxTw9ufeQKGX5by9aQBMw61rMHvp2oQpqtUsWYlY
 VCs1Ym5b1h+/IeDMxYpM1BA371yYSB4I7Am5iXDa+UtDXMFymFGtEL71owgxwZtvdYZLZzklx/a
 gzHLVjlPIGsIzbsAmsJGFIImxhyXxS6ceWBmJEBT7sfyMMqO/3baBHq+cfGCN0xuVF/ILVWd4o8
 +XnKvZKrIfz6cFj+hnr/mM8k4Ik3fC9Sm8JC6zbeiKpwFed96tvYN020oHYDauCVAZmxZFaiOxl
 DRtu8xtM4lSniFA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Philippe Baetens <philippebaetens@gmail.com>

Add bindings for the AMSOSRAM Mira220 image sensor.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

---
v8->v9:
- Make link-frequencies required

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
 .../devicetree/bindings/media/i2c/ams,mira220.yaml | 102 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
new file mode 100644
index 000000000000..fa6fec0072ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
@@ -0,0 +1,102 @@
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
+          - link-frequencies
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

