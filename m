Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C96A32FA30;
	Wed, 22 Jul 2026 03:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784691866; cv=none; b=ce20KLQ3XN48jRksvn1E63oSmbpkiWzj5Uu+UvoHnSt/ZltjCUmmSpuQ++xKEG7M4MQXJtIgynuy/sjrzgPi0OpjHlCNOEOi2lFVmzI42eaUcIZgTgw3b+I4pj9JC9JlgnInnY1G59LDh+URocxz6fqL2V7wjozKlNMzaJq57+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784691866; c=relaxed/simple;
	bh=6jZuXCs//MAG/pPQwohjL+eKR+HuWv2epDrppzv10Ds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i3QkpI1zNT/jRXf3zlA/mg5m/27BC60d8ib2EticKYZrN96UnuvLgLKM8azQYYElpQJA/JDdLJK/y80qJIFdq1y8MtCVqM2zR8Z6KRSE+2EIlqtcMOieanyhjdS9+PdztKsZ6ttfQtv3zgJa3Iyf7KvZX4HgxndbkiX7so3HQKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+M+31xM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+M+31xM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E798C2BCF6;
	Wed, 22 Jul 2026 03:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784691865;
	bh=6jZuXCs//MAG/pPQwohjL+eKR+HuWv2epDrppzv10Ds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l+M+31xMrpnZewFtbZMzQPNomSWYBuV1IkgzPfM4giJpA0xxbQjki0FcNrfEwaUcQ
	 J6bpYNRv4kJQjbWfoQIeM3IFiBlIfaXKRxAKyk8W0jGLRVvWDDzC4NYMEwJpmLAqtM
	 1sstpxqepKefEzo49gJMVC8fYyGoPTWdMBHmI0/dXovAahUeRfPGWMBDMRip+A4Eco
	 YP88Jus4jdOhtV6CbUxwdNjCSiFtpgtC0rUA+X4yMODi94YYxfDTdmxUk1U4kaPCqH
	 vMwsZijXTKlc30lvyXWWF2qPGWUyJPxbXcLLoOY/T2NPxbYaEiHp2qd1w8gjSeoIar
	 SaIK9oFuMzK6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE8EC44512;
	Wed, 22 Jul 2026 03:44:25 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 22 Jul 2026 11:44:23 +0800
Subject: [PATCH v3 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDMI
 bridge binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-upstream-it6625-it6626-v3-1-947e50f01764@ite.com.tw>
References: <20260722-upstream-it6625-it6626-v3-0-947e50f01764@ite.com.tw>
In-Reply-To: <20260722-upstream-it6625-it6626-v3-0-947e50f01764@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784691864; l=5568;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=/hRjCCYaHmvj4NTHDjOLBX69462fSxeQ2v4jfyVy5lA=;
 b=ccNdKPMoilwh3U+0xd3FUPWQ8oRWhZeHp3wNPVnJSFIHNDG8PKpejiYXsz5K1vowhILI+LFqb
 9/kmVqMQ587CwlnUwyX4OCnovDU/ZEcvSNY3YyVBMXYEFilPi0X1wtt
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
 .../devicetree/bindings/media/i2c/ite,it6625.yaml  | 159 +++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9bc5584b48880ce1d0796ca3ab35d4d334732f72
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
@@ -0,0 +1,159 @@
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


