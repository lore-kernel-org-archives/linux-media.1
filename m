Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E9B3CB56B;
	Mon, 20 Jul 2026 07:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534294; cv=none; b=r3gQcVHHHm0uvvZwTcUwmQ7n+SBeTyjXI3mhVCK2Fcl7XaLs214iR1PM3scZjQc2iTR0DAFUuH+AFinZ/aajPHcyh76qz069p5Fu6Gikn5e8dDGGdiOk7gPtoiVP5E+2syNVVXS1ep4wiDP4214x8OUyQQfT9dJ8Vhjser5A2bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534294; c=relaxed/simple;
	bh=G2yxFOBpQ+JCJHMTSTPetaVwiKrCyJR/w9nrQlyVoU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ClzHzpb6SEjP/APWTpX1WYJHB9ZLb/HVfbDprYB8Iorn2zmLZhddIIsJQMPAuzdrXYruNVN9KbcZQrs/YUxpPERgCRiPQaAKqSgGDZbLzvMzdxe76rGuauKhT/r5LPgCh84gQ2V2dWWKtfrL6pmTKFkVkDRpUJiUhdGxNgApBds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T0Pl+xeZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T0Pl+xeZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5670CC2BCFA;
	Mon, 20 Jul 2026 07:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784534294;
	bh=G2yxFOBpQ+JCJHMTSTPetaVwiKrCyJR/w9nrQlyVoU4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=T0Pl+xeZ0VV4Uc/h6z9O4dYfuJOMsF6iARGacEOtd6MqNDb1AiyWiVd40XLmoaAIT
	 5OX83F8JpAJn4/0TFV4Cdrw8f/jzYa5alFGkpA7348bHnPN/L3JxF81OvSZ8+qd4Ol
	 GP4n7lU7lm9CS8OOxOgVnOFFj1Pv89kmQ2/RhPt0nNLJo9nOzoUlIKE0p1tT+jKCmS
	 X4o4j0ojaq5VpI4wTSvyKCNuKbHX4IapQHfmdDbvxZv4pDCdnTe+vpcvaTELDeFv+s
	 TpoIFzMgRXlLSR5QedeMTCP94NqcJZg9wWpy5CkX9EaNH75qGK7KBiuuL3Olv/IGv6
	 cp11zatFBkxJA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38187C44515;
	Mon, 20 Jul 2026 07:58:14 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Mon, 20 Jul 2026 15:57:45 +0800
Subject: [PATCH 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDMI bridge
 binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-upstream-it6625-it6626-v1-1-475912f74459@ite.com.tw>
References: <20260720-upstream-it6625-it6626-v1-0-475912f74459@ite.com.tw>
In-Reply-To: <20260720-upstream-it6625-it6626-v1-0-475912f74459@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784534292; l=4507;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=TgUK29xa4PLHdV7P12kCLFxGXqu6/KC37cpD25EBY9Q=;
 b=7tXQZjA5TqKx4VQKHZKLHpVg4y/y0GafWExVD82VG2Y4S4bqCEHMp6lyCEZeTCCzrvRKcdAqp
 XZ09exKSs25BBjLZEa7g4oRSFnGOPeHj0V5iUl6hW/hjnP0aTUGdMOc
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

Document the devicetree binding for the ITE IT6625/IT6626 HDMI to
MIPI CSI-2 bridge. The device exposes three graph ports: port@0
(MIPI0) and port@1 (MIPI1) are the two selectable CSI-2 D-PHY/C-PHY
outputs, and port@2 is the HDMI connector input. Only port@0 is
required, since a board only needs to wire up as many of the bridge's
outputs as it actually uses.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 .../devicetree/bindings/media/i2c/ite,it6625.yaml  | 136 +++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..102af5dcb380b0ad2462c376e5a87b22d7296f14
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
@@ -0,0 +1,136 @@
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
+  expose one HDMI input port and two selectable CSI-2 output ports. The
+  bridge can operate in split mode or clone mode.
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
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: HDMI connector input port
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+    required:
+      - port@0
+required:
+  - compatible
+  - reg
+  - ports
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


