Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13003EFD3D;
	Mon, 24 Aug 2026 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562269; cv=none; b=ULH2RGuDty756EJhrRpg5uKDO0L5EV0rYyj+q4K5GQh8QbXCYXQKtSxBhGZl3/sYxMC/ojKYBrqycCRliIcZg7XvwJEmRaDLUJGq1ZcoECDYwBMZQm9nav/Xrt0muGrE2J9qX6wTp+JbtxcJK2NFSHlhayDb8hjeSQCwctxAYyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562269; c=relaxed/simple;
	bh=Pr9PRcXxrY4vMU7McXPIAm/XoftYTkRCqHi6VjWvto4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PKy21yKHWOzuLrshUaWGMSkYUJzhYghE0mQnON/23HEtYKVcvkPuhrkne1siZUjawYbSaEa1H8nmZgz9iy3L/uhOmiyFIp2Brt+1tfpcbr62ZXXG1abLaC8eGg8CikU+SSxF4VpaX4pTMyUAaZYFaDbK3NA1VbPo65Ga0HiSQ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Tjdyzpvj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Tjdyzpvj"
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2400:2411:160:2f00:e616:f172:fe90:f1b5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CB9FC0F;
	Mon, 24 Aug 2026 11:02:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787562180;
	bh=Pr9PRcXxrY4vMU7McXPIAm/XoftYTkRCqHi6VjWvto4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tjdyzpvj+Lrg2nytgB9EfKgUZohwtKp/vU5bub1e87U7uf1uCkz5x9/QyEu2CjqLS
	 LKbpXuaj2a2CNS1mGS85s97SaIjDD/EHEplkTTMmAIwvQnBzu5LXdz13zTNA42nZoH
	 PiZ6FpAxjngweAvjmYRInnrV3wuUeGj5R15SkFXM=
From: Paul Elder <paul.elder@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	michael.riesch@collabora.com,
	xuhf@rock-chips.com,
	stefan.klug@ideasonboard.com,
	mehdi.djait@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 1/5] media: dt-bindings: Add rockchip rkisp2 bindings
Date: Mon, 24 Aug 2026 18:03:58 +0900
Message-ID: <20260824090406.3695880-2-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260824090406.3695880-1-paul.elder@ideasonboard.com>
References: <20260824090406.3695880-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the Rockchip rkisp2 bindings. This is meant to
support multiple versions of Rockchip ISPs going forward, including the
2.x series and 3.x series. The current version only adds the compatible
for the RK3588, which is a 3.0.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

---
No change in v2
---
 .../bindings/media/rockchip-isp2.yaml         | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip-isp2.yaml

diff --git a/Documentation/devicetree/bindings/media/rockchip-isp2.yaml b/Documentation/devicetree/bindings/media/rockchip-isp2.yaml
new file mode 100644
index 000000000000..3cc7eda4d376
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip-isp2.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip-isp2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip SoC Image Signal Processing unit v2
+
+maintainers:
+  - Paul Elder <paul.elder@ideasonboard.com>
+
+description: |
+  Rockchip ISP2 is the Camera interface for the Rockchip series of SoCs which
+  contains image processing, scaling, and compression functions.
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3588-isp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 2
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: isp_irq
+      - const: mi_irq
+
+  clocks:
+    minItems: 3
+    items:
+      - description: ISP AXI clock (aclk)
+      - description: ISP AHB clock (hclk)
+      - description: ISP core clock (isp)
+      # for rk3588
+      - description: ISP core clock (marvin)
+      - description: ISP core clock (vicap)
+
+  clock-names:
+    minItems: 3
+    items:
+      - const: aclk
+      - const: hclk
+      - const: clk_core
+      # for rk3588
+      - const: clk_core_marvin
+      - const: clk_core_vicap
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    items:
+      - description: ISP power domain
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: connection point for VICAP in inline mode
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3588-isp
+    then:
+      properties:
+        clocks:
+          minItems: 5
+        clock-names:
+          minItems: 5
+
+additionalProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3588-power.h>
+
+    parent0: parent {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp0: isp@fdcb0000 {
+            compatible = "rockchip,rk3588-isp";
+            reg = <0x0 0xfdcb0000 0x0 0x7f00>;
+            interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>;
+            interrupt-names = "isp_irq", "mi_irq";
+            clocks = <&cru ACLK_ISP0>, <&cru HCLK_ISP0>,
+                     <&cru CLK_ISP0_CORE>, <&cru CLK_ISP0_CORE_MARVIN>,
+                     <&cru CLK_ISP0_CORE_VICAP>;
+            clock-names = "aclk", "hclk", "clk_core",
+                        "clk_core_marvin", "clk_core_vicap";
+            power-domains = <&power RK3588_PD_VI>;
+            iommus = <&isp0_mmu>;
+        };
+    };
-- 
2.47.2

