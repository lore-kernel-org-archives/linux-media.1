Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E436372EF0;
	Wed, 22 Jul 2026 07:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704813; cv=none; b=Sus2Zs/wwm2UyrmwGoELy99EQOkUgKiBDif3L1Lzyg8ek10/FS2rA4NqpkaKt4Vr+BBShwIZ4aFTZpHXD3t4GvUYxMzIl+8Oobg0L7kORg+144UU5Lx9QY9ChkorCOOEjN5+bSvqEczBOckEUdiDbg1c+q+yZf4tjB/v7bkH67U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704813; c=relaxed/simple;
	bh=my8+t8NDa1StfthZ96aoDEWf6pTvKBoyT1WvZNLDNM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n6UV1gYvkvVaJ/7V89Z33PR3etBLnuYp17KliJ/vwf2gJHslxdRLY3iP6mPfSJowRLRg6nim3EAVz3TaHtW3Q45LWOmZCCfPo3QAB/DNG7MrCQz71owJnft5fxXOqMo0wUcLA7U+Z53pOxMljjN7ZJ9cNtwZz1uPE8oVv1ojte0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFaP+9Ak; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFaP+9Ak"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4763CC19425;
	Wed, 22 Jul 2026 07:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784704813;
	bh=my8+t8NDa1StfthZ96aoDEWf6pTvKBoyT1WvZNLDNM8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NFaP+9Akir4PCt8yQ3rwDV/oLemXp2aiy5HwtZLQI3NnQSq2GiCOt3NUcdshy1orL
	 wFWxwn+uZ6t+OZvI2elOP1CQ6wSixV0Hz/KtVmRIfpca5zwCgr3RB9QEZ3Q9IplaZX
	 b03MU4EDx75r6ljmW0RUSA7o2kubwYO1bjQdyBGUB25f5JkziCOtUmdXEexI6BjPqO
	 ZDDQyDqTqen+OYCoAlO3NoFsDdvJGsthcKP5Vr4pxBh6PHOwEM6KuDDgSORsZhtygR
	 hMV7TKJISW2NzNPhp4srvQ3ZFLVtKy1ja5qkNZj+0NkvSPtUi5xuYp/89SoFdhd0uw
	 X/M8YJ7wskzQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29825C4451C;
	Wed, 22 Jul 2026 07:20:13 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 22 Jul 2026 15:20:11 +0800
Subject: [PATCH v4 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDMI
 bridge binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-upstream-it6625-it6626-v4-1-c03362eb55ca@ite.com.tw>
References: <20260722-upstream-it6625-it6626-v4-0-c03362eb55ca@ite.com.tw>
In-Reply-To: <20260722-upstream-it6625-it6626-v4-0-c03362eb55ca@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784704811; l=6978;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=kvmWSJ1bCMezEyl+3kGjHtMHI6toPCQNPCBbtrclasU=;
 b=Ai9dVwxy46NM9/BNy6+KY90vVkWf0djmUpd3ekqG1spxr+0rMF3E3np1BA8nYMkZDucZrP4KP
 zj5cVCs4h3HBqmoMa8ZoVnvT4wkmVqGTwXst+tjfPjl8nC2gp+fsqhA
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

Document the devicetree binding for the ITE IT6625/IT6626 HDMI to
MIPI CSI-2 bridge. The device exposes two graph ports: port@0
(MIPI0) and port@1 (MIPI1), the two selectable CSI-2 D-PHY/C-PHY
outputs. Only port@0 is required, since a board only needs to wire up
as many of the bridge's outputs as it actually uses.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Changes in v4:
- Drop port@2 (the HDMI connector input graph port) entirely: it
  added no constraints beyond graph.yaml's generic endpoint-base, and
  the driver doesn't use this graph port for anything schema-relevant,
  so there was nothing for a consumer devicetree to usefully validate
  against it. Found by the automated review of v3, which suggested
  adding it to `required` instead -- dropping it entirely was judged
  the better fix since the port carried no real constraints to begin
  with.
- Require bus-type on port@0/port@1 endpoints when compatible contains
  "ite,it6626": the driver defaults to D-PHY when bus-type is omitted,
  which is always correct for it6625 (D-PHY only) but would silently
  misconfigure an it6626 board actually wired for C-PHY. Also found by
  the automated review of v3.

One other v3 review finding was checked and is not being acted on:
- The plain `properties: { endpoint: {...} }` override used for each
  port technically doesn't reach graph.yaml's separate
  `patternProperties` matcher, so an `endpoint@0`-style node could in
  principle bypass the local data-lanes/bus-type constraints. This is
  the same convention already used by other single-endpoint-per-port
  bindings in-tree (e.g. thine,thp7312.yaml), not a defect unique to
  this binding.

Changes in v2:
- Restrict port@0/port@1 endpoint bus-type to D-PHY (4) only when
  compatible is "ite,it6625", via an allOf/if/then constraint. IT6625
  only supports MIPI CSI-2 D-PHY output; the schema previously allowed
  both C-PHY (1) and D-PHY (4) unconditionally, so a devicetree
  claiming "ite,it6625" with bus-type = C-PHY passed schema validation
  despite being invalid on that hardware. IT6626, which supports both
  PHY types, is unaffected. Found by the sashiko.dev automated review
  of v1.
---
 .../devicetree/bindings/media/i2c/ite,it6625.yaml  | 169 +++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fed732e4428ba0098b0a5580cfaf4b704af21a8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ite,it6625.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ITE IT6625/IT6626 HDMI to dual MIPI CSI-2 bridge
+
+maintainers:
+  - Hermes Wu <Hermes.wu@ite.com.tw>
+
+description: |-
+  The ITE IT6625 and IT6626 are HDMI to MIPI CSI-2 bridge devices.
+  IT6625 supports an HDMI 2.0 input and converts it to one or two D-PHY CSI
+  outputs, while IT6626 supports an HDMI 2.1 input and converts it to one or
+  two C/D-PHY CSI outputs. The bridges are programmable through I2C and
+  expose two selectable CSI-2 output ports. The bridge can operate in
+  split mode or clone mode.
+
+properties:
+  compatible:
+    enum:
+      - ite,it6625
+      - ite,it6626
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      GPIO connected to the active-low reset line.
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI-2 output port MIPI0
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+              clock-noncontinuous: true
+              link-frequencies: true
+
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI-2 output port MIPI1
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+              clock-noncontinuous: true
+              link-frequencies: true
+
+            required:
+              - data-lanes
+
+    required:
+      - port@0
+required:
+  - compatible
+  - reg
+  - ports
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ite,it6625
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              properties:
+                endpoint:
+                  properties:
+                    bus-type:
+                      const: 4
+            port@1:
+              properties:
+                endpoint:
+                  properties:
+                    bus-type:
+                      const: 4
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ite,it6626
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              properties:
+                endpoint:
+                  required:
+                    - bus-type
+            port@1:
+              properties:
+                endpoint:
+                  required:
+                    - bus-type
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      hdmi-bridge@4c {
+        compatible = "ite,it6625";
+        reg = <0x4c>;
+
+        reset-gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            csi_out0: endpoint {
+              remote-endpoint = <&csi2_rx0>;
+              bus-type = <4>; /* MEDIA_BUS_TYPE_CSI2_DPHY */
+              data-lanes = <1 2 3 4>;
+            };
+          };
+        };
+      };
+    };

-- 
2.34.1


