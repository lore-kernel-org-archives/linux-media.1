Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540089;
	b=GgsglQnzaj7aQecVPbR1lMKwhZnNNJsRrM3ol26udP5Qg0cub6y7Enj/tBnEXRJrjaq+
	 SdEgrvvq6PJV5x4BGRsH1yIyBDdA+hqVfDTUrCX5XcgoJ46pIcb7g7maLhhjI3eJSS3UP
	 I63/vfmRuWrYI+zlpRUPaOuqoG+KeikN3sN4Qh0w0gUwa8HtlUsJ+m+h3N3ysT54LqED2
	 ePz58RTsdS4tA/a3uLAzfzLjMddzsMuIDHd88tixSe3cWouNH0RrUoGNpHGolItxRycWV
	 +ZN7j4pLSXhdEk2pcB+SxK9BNIa5x4BmpPnXDsFg0AM26O8k7MQq8MXeDddT7lWcbZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540089;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=4cstgabnzyvQWcjW9OtSnLla0UEfMsg39zv/uimwWEw=;
	b=vclTBZt4SJCYc3+SahNv+lgGrTaquSs1KU9B+Rj9ctoqgkkQye8JELytlDtm1OViRuZm
	 2umWn9LlL7BSSaLS/HjhvYKkKnp+l3mHEBrU+AVeNUhB0Se32rVVuD60Ot6X+u+uSTLiy
	 tO9wQ6mbEXybNOjySDDZEZzcnEHpYNO59uYa8yj8LHAkrFjE5+6Khtes53VhEIJ36fYUm
	 WBel2hro29r8umxFc/cYyFH3asZUMhQ5/vRADkQ6uKHdI9AtEeT57ivKOWKwfgu5QN2Wm
	 Wa3YsswG1+uAdrxOlQ3bM22ahPyFNuw2eg8ilTlY27JwYQmVqiiVWBxW8FP3uZwiwBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AkywgZpa;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCC6606A69D;
	Tue, 24 Nov 2026 17:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BCC6606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AkywgZpa
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BED5016F2;
	Tue, 24 Nov 2026 09:08:05 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E206C3F763;
	Tue, 24 Nov 2026 09:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540088; bh=YFPFNBXhBD1CXPeK2Wq6Z/VUC4VhFtphR7lzgA1Ui78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AkywgZpapMGlKcqTq7iIcGD1bBfvTJ6KlTcC6ZdIc3Ksi7SfxSTnzkZISTGYvJh26
	 phJfE5CVO0p6Zrs/4P9IoWgqLxoU61Y99JWlniUmqcwObJvAcvohBNcVt12ehGVkel
	 +6tMNvOIrgHB314jZwXXuaTOEQ7jQCsmM0/dLilc=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:30 +0000
Subject: [PATCH 02/24] dt-bindings: media: Add bindings for Arm Mali-C720
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-initial-upstream-candidate-v1-2-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anthony McGivern <anthony.mcgivern@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <konstantin.babin@arm.com>, 
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com, 
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Anthony McGivern <Anthony.McGivern@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540078; l=3423;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=sgdFsuZ6uHTYokOroU8tJBLGEB1eDQ8iHNdg9OA06Fc=;
 b=PVdqOPaygsmysE/+LcUJtccmw6tfTlTpGOLFVyuW32hdKZizA+axQxuy6aDGiTr/O+2erHFLQ
 B+7mvbv4Sj0D0twl7cLkFf7lFZmC13M0MUqX3Kmp+vj/+POqjql6Ikf
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

From: Anthony McGivern <Anthony.McGivern@arm.com>

Add the device tree binding for the Arm Mali-C720 Image Signal
Processor.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 .../devicetree/bindings/media/arm,mali-c720.yaml   | 134 +++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/arm,mali-c720.yaml b/Documentation/devicetree/bindings/media/arm,mali-c720.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3bd261bcefbe371b7b4610afdde8e556b2a2ae22
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/arm,mali-c720.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/arm,mali-c720.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Mali-C720 Image Signal Processor
+
+maintainers:
+  - Anthony McGivern <anthony.mcgivern@arm.com>
+
+properties:
+  compatible:
+    const: arm,mali-c720
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: ISP main interrupt
+      - description: ISP fault interrupt
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: isp
+      - const: fault
+
+  iommus:
+    minItems: 1
+    maxItems: 3
+
+  clocks:
+    items:
+      - description: ISP main processing clock
+
+  clock-names:
+    items:
+      - const: vclk
+
+  resets:
+    items:
+      - description: ISP main processing clock domain reset
+
+  reset-names:
+    items:
+      - const: reset
+
+  memory-region:
+    maxItems: 1
+    description: Reserved memory pool for ISP DMA allocations.
+
+  power-domains:
+    description: Power domain containing the ISP.
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: Parallel video input ports.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port 0
+
+        properties:
+          reg:
+            const: 0
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port 1
+
+        properties:
+          reg:
+            const: 1
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port 2
+
+        properties:
+          reg:
+            const: 2
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port 3
+
+        properties:
+          reg:
+            const: 3
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    mali_c720: isp@400000 {
+      compatible = "arm,mali-c720";
+      reg = <0x400000 0x200000>;
+      clocks = <&clk 0>;
+      clock-names = "vclk";
+      resets = <&resets 0>;
+      reset-names = "reset";
+      memory-region = <&isp_reserved>;
+      interrupts = <0>;
+      interrupt-names = "isp";
+      power-domains = <&power 0>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          isp_in: endpoint {
+            remote-endpoint = <&csi2_rx_out>;
+          };
+        };
+      };
+    };
+...

-- 
2.55.0

