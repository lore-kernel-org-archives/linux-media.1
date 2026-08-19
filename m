Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A86D3B8944;
	Wed, 19 Aug 2026 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787137525; cv=none; b=G75+oLN62Yok+/Yo38mXsl1RJ6LssgOA+YwYOwvjv629HtRYNjv/PnFBNQYBtHeInPd75fsfiqJMYRLO2wuQT1tHabLwuwkIXTMOZv58Lmke9EEfq7yFILmMZ1oK0UyBwVh2ybYDAhs3z/6ludu/+cNJrDwQMvbGEPxarn1ux60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787137525; c=relaxed/simple;
	bh=I2ck4Qb0X4dTAM30ag8UYhxBpIdZg3/0QUdORTQ/EIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pwyM6XvJ23OQKMaNE8p59M3Ygrn7De0NUZPwI/8ov914GDMM4Y9ozttO9dPu9KvJDdwvtdt9VgFs+cdMgFpUPm6YvQi1TH3CQoZJHXQVXmR25K66McxL2058qU41NGw+dMwxswXz+kJknhiHryPIyBbcLEutuDM2KG3i2ARysgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EAEB8201AC8;
	Wed, 19 Aug 2026 13:05:17 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wwe6f-002HRb-2R;
	Wed, 19 Aug 2026 13:05:17 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wwe6f-00000004K0O-2ZnZ;
	Wed, 19 Aug 2026 13:05:17 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 19 Aug 2026 12:37:33 +0200
Subject: [PATCH 4/7] media: dt-bindings: Add Rockchip RK3588 VPU720 JPEG
 decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-rk3588-jpegdec-v1-4-33d74cdf369c@pengutronix.de>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
In-Reply-To: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lucas Sinn <lucas.sinn@wolfvision.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787137517; l=4361;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=I2ck4Qb0X4dTAM30ag8UYhxBpIdZg3/0QUdORTQ/EIc=;
 b=XVpfSQ+mCWDVHwnLqdyD2kv4xwSsvoaWOhqs9YuVgMgcr4W1EWJKKEtp8La/u25+v+x4yypdE
 G217MDzodjXA8SBh02C9WRWvPkDrq18mRHlbzf6fJY8zQ5vxpq3h8yb
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

Add a devicetree binding schema for the VPU720 JPEG hardware decoder on
the RK3588, driven by the hantro V4L2 driver.  Documents the single
register window (task registers plus the LLP link-table block at offset
0x300), the JPEG decode interrupt, the aclk/hclk clocks, the AXI/AHB
resets, the IOMMU and the power domain.

The resets and the power domain are required.  The block sits in
RK3588_PD_VDPU and cannot be reached with the domain off, and the driver
takes the resets with reset_control_array_get_optional(), so a node
without them probes and the hard reset fallback in its error recovery
silently does nothing.

The IOMMU stays optional.  The driver never refers to it, it is a platform
integration detail, and rockchip-vpu.yaml does not require it for the
other codec blocks on this SoC either.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../bindings/media/rockchip,rk3588-vpu720.yaml     | 93 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3588-vpu720.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3588-vpu720.yaml
new file mode 100644
index 0000000000000..6bbddea66c9b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3588-vpu720.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3588-vpu720.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip VPU720 JPEG Decoder
+
+maintainers:
+  - Lucas Sinn <lucas.sinn@wolfvision.net>
+
+description:
+  The VPU720 is Rockchip's in-house JPEG/MJPEG hardware decoder found on the
+  RK3588.  It is driven by the Hantro V4L2 driver.  A dedicated Link List
+  Processor (LLP) register block, located at offset 0x300 within the same
+  register window, allows the hardware to decode a chain of frames
+  autonomously ("link mode").
+
+properties:
+  compatible:
+    const: rockchip,rk3588-vpu720
+
+  reg:
+    maxItems: 1
+    description:
+      The decoder register window.  It covers both the task (function)
+      registers at offset 0x000 and the LLP (link table) registers at
+      offset 0x300.
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: vdpu
+
+  clocks:
+    items:
+      - description: AXI clock
+      - description: AHB clock
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+
+  resets:
+    items:
+      - description: AXI reset line
+      - description: AHB reset line
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
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
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3588-power.h>
+    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
+
+    video-codec@fdb90000 {
+        compatible = "rockchip,rk3588-vpu720";
+        reg = <0xfdb90000 0x400>;
+        interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+        interrupt-names = "vdpu";
+        clocks = <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
+        clock-names = "aclk", "hclk";
+        resets = <&cru SRST_A_JPEG_DECODER>, <&cru SRST_H_JPEG_DECODER>;
+        reset-names = "axi", "ahb";
+        iommus = <&jpegd_mmu>;
+        power-domains = <&power RK3588_PD_VDPU>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 9f8d226b305aa..7ef189e4ba237 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11375,6 +11375,7 @@ L:	linux-rockchip@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
 F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
+F:	Documentation/devicetree/bindings/media/rockchip,rk3588-vpu720.yaml
 F:	Documentation/devicetree/bindings/media/rockchip-vpu.yaml
 F:	drivers/media/platform/verisilicon/
 

-- 
2.47.3

