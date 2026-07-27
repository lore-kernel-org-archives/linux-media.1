Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877873DF008;
	Mon, 27 Jul 2026 08:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140803; cv=none; b=LTYQYyV0hgjWEHicx63rLOVNg47WtjOYzpnJEUu+YnmT8CGYiQiqZDiQAclJsE68j0q/GZ9YtByEG9ugzy+JgupimDB+k2REm4vD1bXSCb8VBS+y/Axe+Wzm84DiAUK2I0KnKjjrnMBawJlrRPH1rzTBfceZewhnTSrhrkE7hCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140803; c=relaxed/simple;
	bh=xDkqMegQDZBau84vfu7URo8g+G2La5zNgZMtKdqfXBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iKBiROvl+8+4oZkOCsmjfSbh/n1Rw/yPO7HFAtbWVj5k5feCcJ/raf0HbbuauGuqcYoLwTXRCPK79IrLTGbHyzyYIPIxboz7akXcVAaTheLC/FaBhsYMF7LGCM6nj7cymXSA2eSFw1HQX5FZYs/olxyfF+zfnBH5Zk09U248OLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GbDWYJZf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GbDWYJZf"
Received: from [192.168.1.102] (mob-5-90-50-102.net.vodafone.it [5.90.50.102])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F885A09;
	Mon, 27 Jul 2026 10:25:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785140736;
	bh=xDkqMegQDZBau84vfu7URo8g+G2La5zNgZMtKdqfXBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GbDWYJZfLlWz4IxyRafyq59gYq0qbCFEGCdZ2NgUZ7ZAAY+1btqxnlJ8TzU+YkQm+
	 ZzR+ghR3SHgkbyRvhzXRywIl51BoeMOoub4nAnMuOj1ljYsi3FPMlyShrFkV9yg5Vg
	 7XWBizD1TL6dvhJGlP9naapi5QbSyMFD51Go7jPc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 27 Jul 2026 10:26:28 +0200
Subject: [PATCH v9 1/2] dt-bindings: media: i2c: Add mira220 image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-mira220-v9-1-e869e7ec2040@ideasonboard.com>
References: <20260727-mira220-v9-0-e869e7ec2040@ideasonboard.com>
In-Reply-To: <20260727-mira220-v9-0-e869e7ec2040@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqZxY969ZCI+cksltYo1qT1a0sYGUfFdII/son8
 M3yBFFreu2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCamcWPQAKCRByNAaPFqFW
 PEjpEACj9kdWbTeax6YwZlKhCtWlx83e0teQxwCy91HB7qNV/0G4nOh561W+RIzVPzWLVqAfua/
 3xxtDNZuKEKEC8lVWkh44FXm7TWGrrzQDM95EVGihaelPVEnfKdwakmKYmkDBpCL95akpbXW7iW
 LFpFNiVlpIrnYNJTWTGO5s6q0DyKaoCOeXOeKhyFMonUkpDf9wLZ8X10pXT77WqvDsdCqnplUgj
 d7o2PBbGy7QjjOHbr4mv8ebDnWe46waTfUoYS/oOXopeKsHZ2rUPVwgy3Dy9Af6nNIQA4pxd6h1
 FAtix5pme0BtqhFcb45JJLqlU2TjWetu9gS8VQEsC2t8q4RBIgxVwIQFonUX6Ltg9VXk5UryLYC
 D2XbXof/zsT6cvedm+56OF316YLKPNACFSLlip2C0DyNFqqN0+o7nqwWT74/Sk5RM19uF9/G76F
 /uPqMgsFOgVPMmd7dof7xATdeqZFhVbdYVq40FKt6Zi3FDhjPMHy2aqUx4c0iR+pTNDnBqyuk69
 UR5ugMpGepUnD+tE3trmwm6tycQZp4flIBt91TdjVVh07+q4XSLdODKxiAVXgiumDCFn/3CUxA/
 faC3tT3fRE2EcrSQZLmNL99JOeW9eNEGvjxmRjoVYExOE2h3MDd0kAPM+Adydq6EMX3W/LZ4F8n
 5EXDERUgnI2m5gg==
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

