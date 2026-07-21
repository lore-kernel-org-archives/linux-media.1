Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3192A39A7EF;
	Tue, 21 Jul 2026 14:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643500; cv=none; b=YFc29eTZ1So01leuhauvM6dLmwopTPbm9WVA7dZ4G8jen520jfWrXkIvWoxYTCo5zA7ZPQkMXlUiE7aVydbm/esK4MdvdtZcLV2D5Q37bIfTwLrMbV2ICnSCv1mVUGmn3XyT0gESv5EB/G8bhWKr48Sqq7h6pAe7HFAMwNhrwlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643500; c=relaxed/simple;
	bh=AMUeu+naMLAgyWOHx+sfuWLMX0A2XAzno1k15AwJt6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=glWhaBZFaiTs4W4hFYSLUmFO7fOTqM6l6HHMPelIe6uJa+ktoJ6vRLI7j16KxkJ5aLM4AgvAy7TcDfZL8DhhHJbXg96miQzn/lLfBEcHJccYMOu94pBhNryoUTXLn28g60vZXADivxPHu4TdH3sNjuus4dMRhQt1m8DArxEPOow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v+wKOOLr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v+wKOOLr"
Received: from [192.168.1.106] (mob-5-90-63-152.net.vodafone.it [5.90.63.152])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6359E6DF;
	Tue, 21 Jul 2026 16:17:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784643437;
	bh=AMUeu+naMLAgyWOHx+sfuWLMX0A2XAzno1k15AwJt6Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=v+wKOOLrsJxuLod1+w01bS6rQ8JZxi8ATAibzqSyoTtVK4817Y0eESwqTHtSteqb9
	 pXnqZJ0CA78EPMRDzYAaMQ8L8kuOTNI9sl6/zHOyLj/KDJb+HcozcHz/jIDuNlagie
	 qAXHxNnYEhw8LacLsgV7OB9+QYDpYGGr+fQmLxpw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 21 Jul 2026 16:18:01 +0200
Subject: [PATCH v5 1/2] dt-bindings: media: i2c: Add mira220 image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-mira220-v5-1-533b0ad1065e@ideasonboard.com>
References: <20260721-mira220-v5-0-533b0ad1065e@ideasonboard.com>
In-Reply-To: <20260721-mira220-v5-0-533b0ad1065e@ideasonboard.com>
To: Philippe Baetens <philippebaetens@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4081;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=phHx/Sg5z0bpcQ/ikHhocAy4p+UuofV8KvAyV7XCzZg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqX3+lzrSC8qulbW6sUBzjsbB+vvmEr8EMGY9tT
 Rj+v8xuT5WJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCal9/pQAKCRByNAaPFqFW
 POzwD/4qqJwGM38IMNeJVT2uH4C0HCQzImDGGGitiATs7xziuE8eKZFL6ZlEz9tc8zt26wq1Ogi
 6tSi2dWFT3zVhJjTyWwLM+nz6FrGQnJFU+2U6LQUZW2qSZUMYgZn6mWfYI0eJeAHKLydvdX/Tl0
 yMGLNdtalFjGVxYhj/cJsbs5QRN+dwXJQ3sbokyMnwIEUl86B+YfPGmOh1iCObFMROOKsjuRHD8
 ZQ4X2Wkc0xdA4WK64xqm1A17stGZNt8Ub455SeZOEoKe7Us6dYdBn+GdL2Dqiv4cvtDYIxk97MB
 I0VwJyaZQrAWpZPBFmsCepkerMzKiv8zsVMXeqgaSBGr93OMC23PINkmWNJV5h5jPVasAAo/5Ba
 KysKLSpQvu5eUnu5L+j7CIMPPL+jESE5e+ZKOKDCgFk5OYUuww0a4r8dKi6rL3aTE1QtQi1JjUl
 XzQP1rTbqODkPqAicPeKRCsEVhdykyALJX7iX3YpJwMbBW6y8hQT0pWWhwn/2rM1bxFDkbvCgM7
 EQT1NlgFq5RtP06vlXpIKSdZmeA6VLMhTScCc346OIHxI96SJ7yfvMxFdJZR6Y7aGt5F0BBUhbs
 I7dwhZwPrYOwapaoJdIHFc14aHAAtqClPuKCixLOIh4vifNWbPhcPEY+B5TMhY6G42of7tz7p1t
 VGKRop6f8usR/3g==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Philippe Baetens <philippebaetens@gmail.com>

Add bindings for the AMSOSRAM Mira220 image sensor.

Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

---
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
index 000000000000..294211da8f2a
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
+additionalProperties: false
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

