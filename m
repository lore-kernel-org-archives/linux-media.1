Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC423806A6;
	Wed, 12 Aug 2026 02:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786502495; cv=none; b=Awz6UKm40ibtYQDpHfRIathGKOO9+Hc3kyloXXi8yAxskNvf5ydJhZAQ+FH6Ys5wVlDhaXmNsFSpUOrWt+D7Jf+nEJ9uj125Op9Rx+iE+IrWTVNBIM8K4kKjt1V5TFwpU969Js80QOZQHTBuyHzCrLissFVA2gZo5C1nsWcpc8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786502495; c=relaxed/simple;
	bh=doW9pi23sj/cTxrC+DwemhpJKoEXzoywgavV8mxVNQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J00jPOPwWAZ5FrPhLHh3IpFkAiX3csS1EQ0D0+7ioqbiVablJuet9VYuNegMkpFrqpTQAArGEdMofnBR703P3XVlLSA5XNnSZBJSdWDh04Nz+8c02UpKZjkGZ3+l9oLj2VwcKpvareZBRq+kJB/cJuTTvcjz2SOhynvc1SFV5Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbhPmIhM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbhPmIhM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C9EBC2BCFC;
	Wed, 12 Aug 2026 02:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786502495;
	bh=doW9pi23sj/cTxrC+DwemhpJKoEXzoywgavV8mxVNQ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cbhPmIhMLgQYiSG1Ubzs05SaREDQCdPPozb+Cldin5lwh4vJvuXg2laG/+bOOVw1u
	 Owr9M7L4/1td9P49KIDqnVoVKXYz30ag6ejyw3cthjtEcQHl7yn4WU/+H4mR3hFMoa
	 ZiiCrmJq09YWzamxaU40aqUn2T6+pab+05qrUinBP/fyVEgJVeAVi/cq8lGUatLFrP
	 vgoA9PV+N3KwzGD3HUtZkkxX3negJ8d+1k2olCWuaMeczvAWfx2FxjgAyIgx+JDT9D
	 vsBvjZ4Cnio6cb3WVsQRkCLqJ6YVAU3t2CXuKnDUQUYKEcqbsGFOfR+Fomi7D0j0Io
	 l+8eCpQoWHaPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64426C5B572;
	Wed, 12 Aug 2026 02:41:35 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Wed, 12 Aug 2026 10:41:25 +0800
Subject: [PATCH v7 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-b4-s4-vdec-upstream-v7-3-3fae085861bd@amlogic.com>
References: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
In-Reply-To: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786502492; l=3409;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=gqN9jbMMxVH85rt3rKwM/onT1L7aKjc77EyNsOG4BpA=;
 b=K2/ILBECnfUNQAvLiG7A090qY3l8bQ7AYEFI5l+pWGpBie6MSsUb2MzpGf6+/1BfFanax8G4a
 HxRjOiOxOa3Dl7IwQrqRnhTsTFK9pUjSXVC4EHZhzRH7NN9NfKi9ih7
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com

From: Zhentao Guo <zhentao.guo@amlogic.com>

Describe the initial support for the V4L2 stateless video decoder
driver used with the Amlogic S4 (S805X2) platform.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
new file mode 100644
index 000000000000..b5af3f931b26
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/amlogic,s4-vdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Video Decode Accelerator
+
+maintainers:
+  - Zhentao Guo <zhentao.guo@amlogic.com>
+
+description:
+  The Video Decoder Accelerator present on Amlogic SOCs.
+  It supports stateless h264 decoding.
+
+properties:
+  compatible:
+    const: amlogic,s4-vdec
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: dos
+      - const: dmc
+
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: hvdec
+      - const: vdec
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: dos
+      - const: vdec
+      - const: hevcf
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: vdec
+      - const: hvdec
+
+  resets:
+    maxItems: 1
+
+  amlogic,canvas:
+    description: should point to a canvas provider node
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  secure-monitor:
+    description: phandle to the secure-monitor node
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - resets
+  - amlogic,canvas
+  - secure-monitor
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
+    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
+    #include <dt-bindings/power/meson-s4-power.h>
+    #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
+    video-codec@fe320000 {
+      compatible = "amlogic,s4-vdec";
+      reg = <0xfe320000 0x10000>,
+            <0xfe036000 0x20>;
+      reg-names = "dos",
+                  "dmc";
+      interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>;
+      interrupt-names = "hvdec",
+                        "vdec";
+      clocks = <&clkc_periphs CLKID_DOS>,
+               <&clkc_periphs CLKID_VDEC_SEL>,
+               <&clkc_periphs CLKID_HEVCF_SEL>;
+      clock-names = "dos",
+                    "vdec",
+                    "hevcf";
+      power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+                      <&pwrc PWRC_S4_DOS_HEVC_ID>;
+      power-domain-names = "vdec",
+                           "hvdec";
+      resets = <&reset RESET_DOS>;
+      amlogic,canvas = <&canvas>;
+      secure-monitor = <&sm>;
+    };

-- 
2.42.0


