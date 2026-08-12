Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FFE3368A9
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 23:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577969; cv=none; b=ffEItCkT6O2jiQDfCUQuSKK6YTMOscbY3clQYeuaQMSiMxN6UUdVa7CVVRXlFRV9LxSKsRsuyZFGd5iLGhP5Y5iDdWoymJ7ypyyhPwxjV3YAwp0deo/gqjKRCHC8qVdyKWJlFpG2+2RpDjfa0IHZqrFvRh0/LgpXjY0XpeAQ4oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577969; c=relaxed/simple;
	bh=93mIPBwo4xARi8bLSP2Ps85ndMzk+eFJTkulba9lNII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=B3JnX/IZ6CIFNBi66sS1wgK7CTP9x05KBTpcor5Nuz2dFB98hy4QOk0T8amE/YMQImFhnT8JvbV5g4i7ugabFRzKPlaGy+uWpLF6ulRBxQI589kJqIeFswkmygLMenglQE60KTab4Oue4dKSM/oz3/RKqBsLIf6nsbEZmvwxWAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MoE6YAzG; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoE6YAzG"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38f57e312ecso348049a91.1
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 16:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786577967; x=1787182767; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cY6XjQ7GhfOCdiXCjnF7Z4QVw3em6QUhOXkQiEkOmAY=;
        b=MoE6YAzG0ZlyTUe3XDPmQQ+LzeVi/OntfB5bPWFpzHYQBrjtsqqddxyjeP1LxAAy3N
         /QexmGf1YpK17chrux6a+cm6DnkVJ9BZBeIhU06UCx4cdaFQwwpMNQ/Jh+57J6yE01rf
         g73EW9UjkM2MqY2LhgR/ly0+zs4Xrk3lqFYPust9JI1ycECTNa0rlGz2iqGSGIPtowpJ
         LdZQmSLmfLo+5GdYjF0Z2J0hJ+kCuhQWLigw2ORGIXrQBNb97usYmLUlk+5DT/V2w3zk
         i+GxllVJsljydRJyDYR0DApAzIawaeeQNN4Vr1JyRHdsL7K1Y+M15S0TcaQWUbIzhF9Z
         pwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577967; x=1787182767;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cY6XjQ7GhfOCdiXCjnF7Z4QVw3em6QUhOXkQiEkOmAY=;
        b=pKTa1kf4xEi0HbVuPhfsb5/8Jc0dik99RVDC06LVduk846CvHPGjycVKuOdwUzSeo6
         2JlrEI4cFvM+9rB7k+clgedc2KsFZrbpkFaxFyJ2zsYkeH0IGUXJIHmI2HOPPFCgSTEp
         e8MlMpXLxUPmfCPISN4d1K3IVxGS1Iyh5csQ+S3CZWqIpszCXS8QAavr9oklBhAk67/B
         92FLYXVAEKkC6HffIwCRKVf2kx5h7pUsL26IziPDKI/Yzo6qYJn2zCjFW6Ni2f2JenNs
         A6H39e6jwf/JaUf0Mae+EP4cwwzcibU6AysuzL3+BAcyKU5Akvln0Ae3A2t7c0nkRJQS
         J/bQ==
X-Gm-Message-State: AOJu0YxPZQk3wtcASK+e4EohinwSMocQOhpTZzpjA/MnQCzb3E2B7jUO
	oEcj4pfqxcKU3ISLCjFrnbblR0H8y2ZCytzgu1/XjTapWFLHNMnnvmmR
X-Gm-Gg: AR+sD10Ob4B9Bv2dt70RT+5B+pPBT8273vxrFojN6Cj4O4AgD9t6Xa0JbUDzHmtXwX0
	Dvrc+PC/jEna6W5lDY0yW0vSmoWbV2knBdgDx3f6e9GfqLoYzWi+xMQ+x1tkbfRakFLcf0rcGvP
	jKxJtJeFX1+iGnA0jCCV7AqhCco2/q6PK8YB2o+GD1qPRyWHm51IGcqQMo2MXyHqUJRcHkXBtsM
	utSKNnUGduyaOeP0KYd1+Wtas2STcE6gDDKlULIs/8ASQw8EqcvNn0t5m2KNaRqvTleuSwnt9u2
	vNRBSprLdrgPtOqM6F6dG2WsDlsN4prWXaVmcMDPCnkx3SWyUSUAxzbxTMN9BRcfWj3Nxm5t64l
	EemYDqOmftb/GXHoMOBf+fa7yTXBQub09+BrCQKwJu6ce8GD0iF+NfFABMMBgy3fdrIQqqcr0pZ
	u8L11jVqtVSq0otlB9s11Ipcrcv2oa/i8SMVRS0fKW99DwnuW5evy+eNpxYmXmZnzqEtNwiPDxQ
	YL3C6Nf
X-Received: by 2002:a17:90b:2ec7:b0:38f:aa76:88b with SMTP id 98e67ed59e1d1-393233744femr603535a91.4.1786577966833;
        Wed, 12 Aug 2026 16:39:26 -0700 (PDT)
Received: from [10.219.45.252] ([2409:40c2:504e:6b:b46f:70e9:d340:f24c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412d8a9dadsm1928114c88.2.2026.08.12.16.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:39:26 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 13 Aug 2026 05:09:08 +0530
Subject: [PATCH v2] media: dt-bindings: ti,da850-vpif: Convert to dt-schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-ti-da850-vpif-v2-1-80ba62ca53d0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMSw6DIBSF4a2YO+5teFTBjrqPxgER0JtUMWBIG
 8PeS513+J/kfAckF8kluDcHRJcpUVhriEsD42zWySHZ2iCY6JjmEndCa3TLMG/kkfVCaWW4kqq
 H+tmi8/Q+vedQe6a0h/g5+cx/6z8pc+QoVOstk52UN/6YFkOv6xgWGEopX2HmCjyqAAAA
X-Change-ID: 20260813-ti-da850-vpif-092787a17379
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786577957; l=7744;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=93mIPBwo4xARi8bLSP2Ps85ndMzk+eFJTkulba9lNII=;
 b=afEBhoAr2ih/gKzMV7BUlTLA4+Da3Jtel+wW+PQ53gtCt0X+5sfHjZLSNBqJwKXKrOYLBwTTN
 z3GosKWog6hBpjcEcFA4FDiSgqQMkrqAOEguKVhfQHgcdnTq8ANoNgk
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the Texas Instruments DA850/AM18x Video Port Interface (VPIF)
device tree binding from text format to YAML dt-schema.
Add power-domains property missing from text.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Removed old text binding that wasn't removed in v1
- Link to v1: https://lore.kernel.org/r/20260813-ti-da850-vpif-v1-1-275fd0363341@gmail.com
---
 .../devicetree/bindings/media/ti,da850-vpif.txt    | 106 -------------
 .../devicetree/bindings/media/ti,da850-vpif.yaml   | 168 +++++++++++++++++++++
 2 files changed, 168 insertions(+), 106 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/ti,da850-vpif.txt b/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
deleted file mode 100644
index e47c7ccc57f1..000000000000
--- a/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
+++ /dev/null
@@ -1,106 +0,0 @@
-Texas Instruments VPIF
-----------------------
-
-The TI Video Port InterFace (VPIF) is the primary component for video
-capture and display on the DA850/AM18x family of TI DaVinci/Sitara
-SoCs.
-
-TI Document reference: SPRUH82C, Chapter 35
-http://www.ti.com/lit/pdf/spruh82
-
-Required properties:
-- compatible: must be "ti,da850-vpif"
-- reg: physical base address and length of the registers set for the device;
-- interrupts: should contain IRQ line for the VPIF
-
-Video Capture:
-
-VPIF has a 16-bit parallel bus input, supporting 2 8-bit channels or a
-single 16-bit channel. It should contain one or two port child nodes
-with child 'endpoint' node. If there are two ports then port@0 must
-describe the input and port@1 output channels. Please refer to the
-bindings defined in
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Example using 2 8-bit input channels, one of which is connected to an
-I2C-connected TVP5147 decoder:
-
-	vpif: vpif@217000 {
-		compatible = "ti,da850-vpif";
-		reg = <0x217000 0x1000>;
-		interrupts = <92>;
-
-		port@0 {
-			vpif_input_ch0: endpoint@0 {
-				reg = <0>;
-				bus-width = <8>;
-				remote-endpoint = <&composite_in>;
-			};
-
-			vpif_input_ch1: endpoint@1 {
-				reg = <1>;
-				bus-width = <8>;
-				data-shift = <8>;
-			};
-		};
-
-		port@1 {
-			vpif_output_ch0: endpoint {
-				bus-width = <8>;
-				remote-endpoint = <&composite_out>;
-			};
-		};
-	};
-
-[ ... ]
-
-&i2c0 {
-
-	tvp5147@5d {
-		compatible = "ti,tvp5147";
-		reg = <0x5d>;
-
-		port {
-			composite_in: endpoint {
-				hsync-active = <1>;
-				vsync-active = <1>;
-				pclk-sample = <0>;
-
-				/* VPIF channel 0 (lower 8-bits) */
-				remote-endpoint = <&vpif_input_ch0>;
-				bus-width = <8>;
-			};
-		};
-	};
-
-	adv7343@2a {
-		compatible = "adi,adv7343";
-		reg = <0x2a>;
-
-		port {
-			composite_out: endpoint {
-				adi,dac-enable = <1 1 1>;
-				adi,sd-dac-enable = <1>;
-
-				remote-endpoint = <&vpif_output_ch0>;
-				bus-width = <8>;
-			};
-		};
-	};
-};
-
-
-Alternatively, an example when the bus is configured as a single
-16-bit input (e.g. for raw-capture mode):
-
-	vpif: vpif@217000 {
-		compatible = "ti,da850-vpif";
-		reg = <0x217000 0x1000>;
-		interrupts = <92>;
-
-		port {
-			vpif_ch0: endpoint {
-				  bus-width = <16>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/media/ti,da850-vpif.yaml b/Documentation/devicetree/bindings/media/ti,da850-vpif.yaml
new file mode 100644
index 000000000000..77de70be807a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti,da850-vpif.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/ti,da850-vpif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DA850/AM18x Video Port Interface (VPIF)
+
+maintainers:
+  - Lad, Prabhakar <prabhakar.csengg@gmail.com>
+
+description:
+  The Video Port Interface (VPIF) is the primary component for video capture
+  and display on the DA850/AM18x family of TI DaVinci/Sitara SoCs.
+
+  TI Document reference:- SPRUH82C, Chapter 35
+  https://www.ti.com/lit/pdf/spruh82
+
+properties:
+  compatible:
+    const: ti,da850-vpif
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description:
+      VPIF port when the bus is configured as a single 16-bit input
+
+    properties:
+      endpoint:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-width:
+            enum: [8, 16]
+
+patternProperties:
+  ^port@[0-1]$:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description:
+      VPIF has a 16-bit parallel bus input, supporting 2 8-bit channels or a
+      single 16-bit channel. It should contain one or two port child nodes
+      with child 'endpoint' node. If there are two ports then port@0 must
+      describe the input and port@1 output channels.
+
+    properties:
+      endpoint:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-width:
+            enum: [8, 16]
+
+      endpoint@0:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+        description:
+          First 8-bit channel using the lower data lines [7:0].
+
+        properties:
+          bus-width:
+            const: 8
+
+          data-shift:
+            const: 0
+
+      endpoint@1:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+        description:
+          Second 8-bit channel using the upper data lines [15:8].
+
+        properties:
+          bus-width:
+            const: 8
+
+          data-shift:
+            const: 8
+
+    anyOf:
+      - properties:
+          endpoint@0: false
+          endpoint@1: false
+      - properties:
+          endpoint: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+oneOf:
+  - properties:
+      port@0: false
+      port@1: false
+  - properties:
+      port: false
+
+additionalProperties: false
+
+examples:
+  - |
+    vpif@217000 {
+        compatible = "ti,da850-vpif";
+        reg = <0x217000 0x1000>;
+        interrupts = <92>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            vpif_input_ch0: endpoint@0 {
+                reg = <0>;
+                bus-width = <8>;
+                remote-endpoint = <&composite_in>;
+            };
+
+            vpif_input_ch1: endpoint@1 {
+                reg = <1>;
+                bus-width = <8>;
+                data-shift = <8>;
+            };
+        };
+
+        port@1 {
+            reg = <1>;
+
+            vpif_output_ch0: endpoint {
+                bus-width = <8>;
+                remote-endpoint = <&composite_out>;
+            };
+        };
+    };
+
+  - |
+    vpif@217000 {
+        compatible = "ti,da850-vpif";
+        reg = <0x217000 0x1000>;
+        interrupts = <92>;
+
+        port {
+            vpif_ch0: endpoint {
+                bus-width = <16>;
+            };
+        };
+    };

---
base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
change-id: 20260813-ti-da850-vpif-092787a17379

Best regards,
-- 
Bhargav

