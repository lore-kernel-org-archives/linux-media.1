Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C39E17BB21
	for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 21:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495625; cv=none; b=eNTMB/w0vZXHgvEob3LUW0Paz21CoOGGEPuM157rEv6lfd5bQvjfcHF1abvwQyThNX0IoZjF13hfHxZo+Uhn61pU3xZFCm0VNr2JEZ6b0yLJ021oHGNwOeOAYKhmlCegS+eqP+L7SkqQp66YkigXvDXZ9GDxMncA0IEb4/qKiQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495625; c=relaxed/simple;
	bh=e07fAaUhpcUkCZZMoFfPX2XrQcVmO3HNNsorV6toWLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Hn36MqYOxpBHBcNbWFLFP5I0mYTCwdzPOx7P/AwGlXzvDmjTGYEEFJcw0IDodEa/3WYIiO37z4aFNzJqvdRF37fc1nOtEzoei2rVpVjurys6Lt/7FUi3KyswVyv4Uxtju4OvKt54JlODMDMLw4ZeMiawwVKHi9IaqJXH7hKE6zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daSuNbsZ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daSuNbsZ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc8311c6ddso12509715ad.0
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 14:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495623; x=1785100423; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gTIjnhiBERStWEwLazrFs+tWSWYBzp910us9UNmsjTU=;
        b=daSuNbsZWBrsz3He/O+BTgLI1xtaIIcISWVhd5cw7LetnYvD+SpeP5hUVMz6yijFHu
         xTCZSVHSsOrT9UcjT2z13GbUHhuVo1pusCpJOw5tr5/6VzYMD+KPVL6yj+ntdWk3Ql2z
         j3m54ALsRhCXUg4k+y6xzjiVa7wfriQ0fZrU+aQG7BXbjrN9B0OJpdQ0u7QpuaaouFjx
         wKvvnMNY8rNmapjSaXUOkemo0OxIjnl4Ewj8vqOndfsk9KFigcwceRBmb8F1wvpOZHF8
         trkXczvTkhpurDeBc5FQ4bF3b5lSaE1MyI11s4m+nNt0xzI5wdkSFAAr+m2dWeZX7otl
         1BPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495623; x=1785100423;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gTIjnhiBERStWEwLazrFs+tWSWYBzp910us9UNmsjTU=;
        b=eqbbD76XkR++JjKvfuUEqxhFnqVQpUc0chzqNEYsI9wJsOjJjawDywbzPon8Y1/GDY
         UJpL61fFqsVQ+9o9c9CpnOoUQZaOwIgQPuRCo3NJLRqaVAbEYLPO1MaDE+vhjLmn8RX1
         1e0Qlu6FaQjeYzlFg9bDhESo2R44NzXiD68MOfrmAexhsdLJSbWli5EwwjPBjigP/zZ1
         huj8hcpRQCDHSoqSi1kIftkYdLx859dG5e2MQNo+DYOCbQHsMNCagz719iczwv964fI0
         0UtlYH2cQsmndNy1MXq9xY5KDiykrWa8w6l4h6ZoCmge/j+AhedOpi9ZPEGcW8/tEOuo
         Z3Og==
X-Gm-Message-State: AOJu0YygsrgLBH0Y5KDOzMWvyOXKcr8Uvl/URMquqzUdW0WVipteKm1+
	7tAgBEk6//6Wx+uk/d2P0Gi20k2hMYBM7ERRbh8NO572+me0krBHCWa8
X-Gm-Gg: AfdE7cnLDiWheSw3/b+3021wLU+55XP/v5krQMKblUouKTY3IRsNKX/rQzfyLp0Qpe1
	gTxbJK6b/uyVUUsctlA1Fk6Q688TGXh8sHhx0Ky1AUxLZjYQqEdXLsgHZnh5BPUXvmAprJ+v6Ob
	ZQtUKb0Vq7RiJbXQh63Yu58f39StpnOMK+GO+5sks8m6U70bmdLAyRjXgUk9GkOyaKFRlhpw3HP
	ICpf/xo6FOQfkH8JtE+waCqW7EtlGyou+oTYPDLa1N/GwaDKFJ55sPG0yHK+VHKZohhN/rRS28l
	eUxiI+CXTj67INll41em4fFKcYEMNxC9nFxkkdnMzVCJ5PPj3W6OEAmNyFO1bI8xsbQuIWd/9g8
	S1ncphukkoLahTiflvB7axeh58OEf3ffp4/9//UKLS4ggDZ7wE3ZPkGk6LRvVZsRx6rSLK/CVrc
	b+Hp8nFPtul1nAc4U=
X-Received: by 2002:a17:902:fc47:b0:2cc:df15:91e2 with SMTP id d9443c01a7336-2cf34a3e692mr95258635ad.7.1784495623273;
        Sun, 19 Jul 2026 14:13:43 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5413:1bcb:522f:a9d1:353f:2e7f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fdcaefsm29001067eec.10.2026.07.19.14.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:42 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 20 Jul 2026 02:43:23 +0530
Subject: [PATCH] dt-bindings: media: ti,am437x-vpfe: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-ti-am437x-vpfe-v1-1-d4a260021b64@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMD3ZJM3cRcE2PzCt2ygrRUXXNjSwszwyRDY9PURCWgpoKi1LTMCrC
 B0bG1tQBGzChyYAAAAA==
X-Change-ID: 20260720-ti-am437x-vpfe-739861b135ea
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Benoit Parrot <bparrot@ti.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784495615; l=5632;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=e07fAaUhpcUkCZZMoFfPX2XrQcVmO3HNNsorV6toWLU=;
 b=FOIB+Tzdra6V0I4I4j5p8/BaByrNUDmVBT1Wr7ToUbH+FRsHUTDGMZ6EsYLAp3fd4fSbdGGcS
 /LeofrkO9hbC82udhTCWOPEJ7GweHqaHirPOd/Tn/2wVimoFR3vQkqP
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments AM437x CAMERA Video Processing Front End
(VPFE) from legacy text to DT schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/media/ti,am437x-vpfe.yaml  | 93 ++++++++++++++++++++++
 .../devicetree/bindings/media/ti-am437x-vpfe.txt   | 61 --------------
 2 files changed, 93 insertions(+), 61 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/ti,am437x-vpfe.yaml b/Documentation/devicetree/bindings/media/ti,am437x-vpfe.yaml
new file mode 100644
index 000000000000..983e705ab1e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti,am437x-vpfe.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/ti,am437x-vpfe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments AM437x CAMERA Video Processing Front End (VPFE)
+
+maintainers:
+  - Benoit Parrot <bparrot@ti.com>
+  - Bhargav Joshi <j.bhargav.u@gmail.com>
+
+description:
+  The Video Processing Front End (VPFE) is a key component for image capture
+  applications. The capture module provides the system interface and the
+  processing capability to connect RAW image-sensor modules and video decoders
+  to the AM437x device.
+
+properties:
+  compatible:
+    const: ti,am437x-vpfe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description:
+      A single parallel input port connecting to an external image sensor or
+      video decoder. The VPFE supports only one input port per instance.
+
+    properties:
+      endpoint:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          ti,am437x-vpfe-interface:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3, 4]
+            description:
+              Selects the VPFE input interface type can be one of following
+                0 - Raw Bayer        (VPFE_RAW_BAYER)
+                1 - BT.656 8-bit     (VPFE_BT656)
+                2 - BT.656 10-bit    (VPFE_BT656_10BIT)
+                3 - YCbCr 8-bit sync (VPFE_YCBCR_SYNC_8)
+                4 - YCbCr 16-bit sync (VPFE_YCBCR_SYNC_16)
+
+          bus-width:
+            minimum: 8
+            maximum: 16
+
+        required:
+          - remote-endpoint
+          - ti,am437x-vpfe-interface
+          - bus-width
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    vpfe@48328000{
+        compatible = "ti,am437x-vpfe";
+        reg = <0x48328000 0x2000>;
+        interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+
+        pinctrl-names = "default", "sleep";
+        pinctrl-0 = <&vpfe_pins_default>;
+        pinctrl-1 = <&vpfe_pins_sleep>;
+
+        port {
+            vpfe0_ep: endpoint {
+                remote-endpoint = <&ov2659_1>;
+                ti,am437x-vpfe-interface = <0>;
+                bus-width = <8>;
+                hsync-active = <0>;
+                vsync-active = <0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/media/ti-am437x-vpfe.txt b/Documentation/devicetree/bindings/media/ti-am437x-vpfe.txt
deleted file mode 100644
index 3932e766553a..000000000000
--- a/Documentation/devicetree/bindings/media/ti-am437x-vpfe.txt
+++ /dev/null
@@ -1,61 +0,0 @@
-Texas Instruments AM437x CAMERA (VPFE)
---------------------------------------
-
-The Video Processing Front End (VPFE) is a key component for image capture
-applications. The capture module provides the system interface and the
-processing capability to connect RAW image-sensor modules and video decoders
-to the AM437x device.
-
-Required properties:
-- compatible: must be "ti,am437x-vpfe"
-- reg: physical base address and length of the registers set for the device;
-- interrupts: should contain IRQ line for the VPFE;
-- ti,am437x-vpfe-interface: can be one of the following,
-	0 - Raw Bayer Interface.
-	1 - 8 Bit BT656 Interface.
-	2 - 10 Bit BT656 Interface.
-	3 - YCbCr 8 Bit Interface.
-	4 - YCbCr 16 Bit Interface.
-
-VPFE supports a single port node with parallel bus. It should contain one
-'port' child node with child 'endpoint' node. Please refer to the bindings
-defined in Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Example:
-	vpfe: vpfe@f0034000 {
-		compatible = "ti,am437x-vpfe";
-		reg = <0x48328000 0x2000>;
-		interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
-
-		pinctrl-names = "default", "sleep";
-		pinctrl-0 = <&vpfe_pins_default>;
-		pinctrl-1 = <&vpfe_pins_sleep>;
-
-		port {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			vpfe0_ep: endpoint {
-				remote-endpoint = <&ov2659_1>;
-				ti,am437x-vpfe-interface = <0>;
-				bus-width = <8>;
-				hsync-active = <0>;
-				vsync-active = <0>;
-			};
-		};
-	};
-
-	i2c1: i2c@4802a000 {
-
-		ov2659@30 {
-			compatible = "ti,ov2659";
-			reg = <0x30>;
-
-			port {
-				ov2659_1: endpoint {
-					remote-endpoint = <&vpfe0_ep>;
-					bus-width = <8>;
-					mclk-frequency = <12000000>;
-				};
-			};
-	};

---
base-commit: c6859eed755df351a3978b33cb92365f9b3e8f06
change-id: 20260720-ti-am437x-vpfe-739861b135ea

Best regards,
-- 
Bhargav

