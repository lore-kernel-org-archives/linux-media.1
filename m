Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F1E42EECE;
	Fri, 31 Jul 2026 15:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785511719; cv=none; b=LGVffm2u7ejj5AofsH/kmeUJipxQuITxnL+OvpvWCztu5CCgiien+aR/MFMlxod+lXcd3ZXa3i4/0FNLuvRQhVojUziaFyF53aorQfj6Kc9IXhMx05CeK5bnJYOcsy4gHhSzkYtAykxDTKdq3EkNNTRq1F4m+5aDrEY5x/2+97o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785511719; c=relaxed/simple;
	bh=F0Oq2cYdcmwK0BjecIYd9dG9y0ey8yYwtOIm6d9oHA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ShuGQEEWvOapDEEX/dIwJrWUZEjZRDpL6FP6c9gNUfwVJTUIdu8/1tFVOxAfJ5IWdm1hMtFehKiQAd9h9AiylM4g+9Ura/NJtOOkmyPGlKWvKloEG5LA2WX4YYZuP7JFbJclIEQchrnFVx/0Wwfp0jHDmP38ZS7fenp8G2K2QqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XqahWF1X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XqahWF1X"
Received: from [192.168.125.177] (mob-109-113-25-35.net.vodafone.it [109.113.25.35])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52858E91;
	Fri, 31 Jul 2026 17:27:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785511649;
	bh=F0Oq2cYdcmwK0BjecIYd9dG9y0ey8yYwtOIm6d9oHA8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XqahWF1XOVTDV7hUFkmFOggormWKXO/GlpdRPJUTpdElYu0g4ZEGa3fWcU2vH5q9S
	 +MuGwuFux0GiyrgBaiwe6MGKwLAxNzMcbiVixIlo+abO9ErpPS/OorhK6wx6wnUrSJ
	 OV7OxVf6laZKLzrvoFxPRR5dnDMGPN44xvF2Y6fI=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 31 Jul 2026 17:28:19 +0200
Subject: [PATCH v11 1/2] dt-bindings: media: i2c: Add mira220 image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-mira220-v11-1-1295fe17021d@ideasonboard.com>
References: <20260731-mira220-v11-0-1295fe17021d@ideasonboard.com>
In-Reply-To: <20260731-mira220-v11-0-1295fe17021d@ideasonboard.com>
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
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=vI/g6NlIiMrrUzR8TrdWRvUxM7soEHDha3oMdyHPwxM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqbL8hjXKrmCjtV5mT3Vd8Ox5uCpDQYhvv3JRCx
 jhdalF+VDOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCamy/IQAKCRByNAaPFqFW
 PGFcD/wK3hJD6zFN0JBqq38r+j9zzXT4rKLCYC7mA/qSpGeKlnXy/nXXQwl9uFFJc8vmgFhrE6l
 7Zep7KKfy40YCsEF76lr7SVpT/+Q2Mz9btSzhiZPLYSy6msz2VucO9YocI6Oj10nuz8gXlNaHyN
 +aNQDdspfv+zhqALaTk7So0O8IO7Ddv2+hg2znk6xN+LjgJ2TMOmV0Bb+sq3rnUKQj1ocObrbg8
 xCeBAiO5YlYAGvQNXhwSXO5CCfol4dX+Hed6L62bfva8JysBuf7RwCJev4hV3me5UALr08CiXHQ
 MV00pePxUt8SM7I06egKeaa98X8o3eEQxI/t0itxE0hKbQhEqrokpMPTbKPioF/wW6rehXlMQdQ
 3ZxBCdJWVaC7ZplG8sQeFF01hSch0K7GbBjRs6YBuufe3JnxM5pFdyzkChA+w0JH8zyVWn4ofn3
 zM3P9PpjWLq/nLlJ0qdztVO41QTsyBzKwgNCiFP9vHUIigzbiRyplDKqgFnvqO3kXLw2FEzsmFG
 oGhj7UlAL2kgW/9AUbEvRl2g+voWp+vOk9lHbLWZ98aP5Z+It19hLgVWeWbZ5OF26+eOfC8Duo/
 bwUO0uVAoPVS3eh6ingUHXbEHea1zBL8MHzwjlDnzLO0K/3GX1K15DSV4pI3EurPetg6GZehEWx
 l/a7D7vF0Fm2BKw==
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
index 3785b8c1de0a..9e8c605256aa 100644
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

