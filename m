Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827513D1CCA;
	Wed, 22 Jul 2026 07:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704576; cv=none; b=FHUXvf+8bTXG8EzuYYsiCSWZH0GPNrOUfpV67aweYQ3urp84oKSIx9FDdM6HOvZOmk0EiORn/08VUoFtIx5lGg47w9uLk2xwD3ZsCeoBYP0N59W0fOrh+t2xXL2NISb+dyTcInvE8gmap7xFqYDPyg4LINmSMzwl64jtDgsPx8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704576; c=relaxed/simple;
	bh=9WRhWd4Q+2/t2SfqLMXZOzlGRbHEA6GKTWU0iFk2KQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gXIv7ucDXtYKMjxm4AcqgzOSBG6sCKhpZkFlmggWBZqTdvfH2IPRyKofFtawkg+mQ5l6OHDSO4ww+4gxLbC/DJQhakdrVBvl+Lo4d4aPAKSji2XY6JxuO3XvLtygEfMDZeptr6dkqWz+Fo+EdaepXH0FHjqk0XlGpmA27hFrMdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vqGzF/tx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vqGzF/tx"
Received: from [192.168.1.106] (mob-5-90-61-61.net.vodafone.it [5.90.61.61])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 029FF14C6;
	Wed, 22 Jul 2026 09:15:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784704512;
	bh=9WRhWd4Q+2/t2SfqLMXZOzlGRbHEA6GKTWU0iFk2KQQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vqGzF/tx+Gp7+qJdSSs7kHuHr3iOxfYB0YArAaoznpLHgFzOF4fYc+GFM9qe3fSJs
	 7KwV0IxtqD3s7fb3vSuDGO7dGMfHZOIju1xY1vHywxIW7gJASA6dW8WBGailem836f
	 /k6uMRK7m2G2DQxRzAqlbpvV7hoz5UFYEurMifRQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Wed, 22 Jul 2026 09:15:55 +0200
Subject: [PATCH v6 1/2] dt-bindings: media: i2c: Add mira220 image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-mira220-v6-1-203e32c596de@ideasonboard.com>
References: <20260722-mira220-v6-0-203e32c596de@ideasonboard.com>
In-Reply-To: <20260722-mira220-v6-0-203e32c596de@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4214;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=j4GxF1JelDZMcOT6kWjSrGF4x0DHa3U5tBuYqRNh2fk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqYG45KYRwGHA7nvTZ2SQBG9n7OTs6l1Vw5ahnv
 cIwkWWqlHKJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCamBuOQAKCRByNAaPFqFW
 PFqLD/48GoghSgw7vCxxk+ABTA8FjDbI8zLUoNf5RyDsHnIks7A5fYraFq2F2r7Es/NxJGzQMRe
 ArBEAjIbK6WCV07zoIc1wvSr8FQPAiOuZtVfYD/iPkdtHE2jqZaTl5NEft4ORVxYYey/N+wgAHV
 x5roMEyNPfXY8wM5cESPmVQCtrLrrM55UIy0H4tRZcGDnT3MI3lUeVJH7WljIJxIYj49rNG1gWb
 l7nJJ8D5bqZ35IEdZcWgma60I3BDGeN5Az4xoKzCI3hqZSeRwA0/ggBGKtqUxyHbPRFsozAhjlt
 gWG4aaL5yVM3UrZ4wYgLmfhM1Yw8x4o69KcId21sv9xOKz1op6h/UOz7KKjMiB5mcQcHn7OD0Zy
 Mxx3abLj8+wbushX82PLMRLANmiI0gYdbgNpP2mZtq6/ZCdTSG6AzU+8UXjRJCH9b3rsJBa50Ad
 85w8BtNQkKhHFDJ9SN4cGRKacE2liSS+ZlUaYc4TAFufZ8qA1UuNFb4yyY/S63b2ohZ1tCxf5Uq
 Ri2Papsu58VIPLjMWKruQU3sLbbopU7XoDKcuAS3GGnnVZ6W6VqV1hUdc2Lt3HoeD2mcrlIyR+x
 J0ve5EULVCE79Muvi8HNhBijPqCyOIQ39IHw0vV4iyruf7zJEzXGFDsB6I/BCFfzp7bfmjIdcHM
 vDKMiC6pdToi9Ig==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Philippe Baetens <philippebaetens@gmail.com>

Add bindings for the AMSOSRAM Mira220 image sensor.

Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

---
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

