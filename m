Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADDD4FD7A9
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 15:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783334; cv=none; b=IjBit6/GqriEtQiphyOthsciNxCDiicYvdTah1WPe9R7dIR23OvYm0jOVefhkrZYXrPT2HvwHHTuHjS8PfEaBQZFzYMOXSupOfGw++AevqlZCDVVj0eB3Q3sikjCVeTXjSKUywUSLBvZIQ7O490q1T07Sg0tBZa7b0TF/EGGSNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783334; c=relaxed/simple;
	bh=8hfxOJPdIcGIvY3nw8uhTRifk/anp+VB7FLMnAUGf+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KgzJ/YXepswlpANZizxhJDj0Rlu9eFo5ygm8r3NM74qGzwgh624i1dWleEB/Iwv2xgskyDwBjj7X788M9f8EfNTBTL5EGk5S1O5t2Cl9tzCAlyU6+2dZ6u5NY0lVRPbRqGOu1/5FMzIezG565Y4esut+XAlS0fq+wmH1yx2eUH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=CxgbuzVq; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="CxgbuzVq"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-39569e136f9so2101153a91.0
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 08:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790783327; x=1791388127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RylIL5PtKoKSEB6fKFx6teI8foZIXlgeBAHnwrC12eE=;
        b=CxgbuzVqN+Y4M5f2tpA/yl7A06dm0Bc54u7wRoz+3gQEn9aZeApecSqU6M1Q3L11ph
         1KyB7CYRDZKaUKeCTRs9mR7LdDnP8Th2Ng2iOZcKkkSvUM03okOgNxeDrbjcyaa39Fcb
         M+2qEjc9Q5xyZR5/xct9c4s5nk7MHAn2pQ+RrkWXQjLoO6J+a48GV4GPBSyjIg+8R94I
         MSBDv6D7GmKeeElAuVsNiXW+vfBklh8uqMHOkY4GmzGKtCDouiQPKJzvLoQyp4mFyWzN
         PWAZYpFFC+4BggM0NU9AHtaEJ6VA+p2ZeYeXSZgS8mg26qs5qe1wfevL4qy1xwvgW40O
         pR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783327; x=1791388127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RylIL5PtKoKSEB6fKFx6teI8foZIXlgeBAHnwrC12eE=;
        b=JtEC9DZqFPO9xSuDRUWT6psgBEqArdxa8f2iSLUeVCHrCLQEkxCvl9ojcPfEcpxSLZ
         NIe/GMcGs4FE6IUHumjCj5RTtiuzbJOt1A13jSDRpkEjNCo90byfpuj/gTf9cQvHwxnf
         NFkCLrzOSY4g29d8OLj4jUGKcJkznIOBX6wQ0IO6QBUBiZz/0WR4xoAKEONYrY4hf8c+
         JQcsC39ODLv2eXe1mHLP1UDugQTujzyRjgFWJ0UKi9XFRWn9XgYvLC26Vm2NesJdLKnj
         z579ubtIxNSccjSgQ417u2lacMC7uSUxO0/WJXJf62TppTAHzksKfmsqzI8DXDKx1ZLf
         1Hiw==
X-Forwarded-Encrypted: i=1; AKwUvBzLaT+CcMwPJyTS3pvhzdw1qcHAv2tDiFHeUcCeKIfVDgUdXA7ACaKeFVz+4QQebP1JhP+t24Us7Wt9HQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJQE/C+MkUFHy7qv4ufO593nht+2+YIJCb/iN4D3UsuLLALzWrs
	GXL0a8+n1oDU1+zVzYn9b6iFog6o3GleSMkA6TOWpd8fqT1y7RKHvaSAdLw63cJINFZpaIQdvcK
	6xgxdwpIqJVDzxvM4
X-Gm-Gg: AYBFou0gjS2My3a1MzOYHP82Y3ekEyCMWl3A0kkVnT1ydoeiSdKlhNWS2f+dJ2GoIyz
	4vgbyf5O3S1u+ngDvTPK8ViguvtOJIns/vUSrDfN73Q6yPN3uLLjmvl2mYF9VvyZQ/To2ky+ZD9
	0xL6ZJ0SqafAJuA40AKcGQa5A8r/i8fW8kE8CNFqLH7DB8gfavdUrjAcOUAlVvxo2C/FddoLiQL
	R5Idqa5e/Qfp+wIESe7qNeSZGiw9UVovAiREbc9+bofoNKxMBsIt1lJvWtakfmu5FTp2aqDUHfo
	vcL/8yoKOFqu61IicMLdGrX47hdU/melPtANATJqR85OcbQGsEZsZZAkOOPeQAhVYnR0O0xEvu/
	F90GwOrDajOrsGGiipuL/UmmDWqDM2Hd0waTzTG2x4HD443t8wlUfY2XOGDqnAX2ALw74qrFkKL
	E/9WWSA1Ny9d6Hp3zk0CcJ/nNrdgTKdFubXbNE7q8+E8znXzsk5uhxRh25Qty8FfJSZqIJTdJvu
	0XXCdfE
X-Received: by 2002:a17:90b:2888:b0:3a2:b465:fb8a with SMTP id 98e67ed59e1d1-3a4d1ddc911mr1860992a91.67.1790783327152;
        Wed, 30 Sep 2026 08:48:47 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ee4d0af2sm308136a91.2.2026.09.30.08.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:48:46 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: media: Add Allwinner D1 CSIC
Date: Wed, 30 Sep 2026 22:48:33 +0700
Message-Id: <20260930154835.402684-2-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the camera interface (CSIC) of the Allwinner D1, D1s
and T113. It is not the A31 CSI: its parser and DMA engines are separate
blocks. Only the 8-bit parallel input is pinned out on these SoCs.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 .../media/allwinner,sun20i-d1-csi.yaml        | 111 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml
new file mode 100644
index 0000000000..2bfe2cc9af
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allwinner,sun20i-d1-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1 CMOS Sensor Interface Controller (CSIC)
+
+maintainers:
+  - Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
+
+description:
+  The CSIC found in the Allwinner D1, D1s and T113 receives video from a
+  parallel camera interface and writes it to memory. It contains a parser for
+  the camera bus and two DMA engines.
+
+properties:
+  compatible:
+    const: allwinner,sun20i-d1-csi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: DMA engine 0
+      - description: DMA engine 1
+      - description: Parser 0
+      - description: Top-level block (CSI_TOP_PKT)
+
+  clocks:
+    items:
+      - description: Bus clock
+      - description: Module clock
+      - description: DRAM clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
+      - const: ram
+
+  resets:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    description: Parallel input port, connect to a parallel sensor
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-width:
+            const: 8
+
+          pclk-sample: true
+          hsync-active: true
+          vsync-active: true
+
+        required:
+          - bus-width
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun20i-d1-ccu.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/sun20i-d1-ccu.h>
+
+    csi@5800000 {
+        compatible = "allwinner,sun20i-d1-csi";
+        reg = <0x05800000 0x400000>;
+        interrupts = <111 IRQ_TYPE_LEVEL_HIGH>,
+                     <112 IRQ_TYPE_LEVEL_HIGH>,
+                     <116 IRQ_TYPE_LEVEL_HIGH>,
+                     <122 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_CSI>,
+                 <&ccu CLK_CSI_TOP>,
+                 <&ccu CLK_MBUS_CSI>;
+        clock-names = "bus", "mod", "ram";
+        resets = <&ccu RST_BUS_CSI>;
+
+        port {
+            endpoint {
+                remote-endpoint = <&ov5640_ep>;
+                bus-width = <8>;
+                hsync-active = <1>; /* Active high */
+                vsync-active = <0>; /* Active low */
+                pclk-sample = <1>;  /* Rising */
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index f5eff489a8..f4c45c4678 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -905,6 +905,13 @@ L:	linux-crypto@vger.kernel.org
 S:	Maintained
 F:	drivers/crypto/allwinner/
 
+ALLWINNER D1 CSIC DRIVER
+M:	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml
+
 ALLWINNER DMIC DRIVERS
 M:	Ban Tao <fengzheng923@gmail.com>
 L:	linux-sound@vger.kernel.org
-- 
2.34.1

