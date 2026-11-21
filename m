Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795271139;
	b=C5tGNcoGG/xP6nGgVE1NctkltB65QBAInS8LjxiQDNaVPnh7sWrDytq0rCqXw6CrmRS3
	 /dTcyWbb5WlYK5uJI/E+cfjOnLPRo10EKSloRPaPHSrczCjDZbh7nyAQHJ0x4J6ykLis7
	 JObvHQY+ae6PkBEkSilVQ/0+KZyRytFL41zipG2Qb4v5W/l/v+ponFVTR7xAnVmapJkPj
	 E/LmFJ00Y5Ug/X7xpGppYZgEsq39RnuyYpXhmW3Ni0zdH7CohXr4Ga6D93eCI7rrmJbkf
	 +ESdQeGW8MvOVcjvJzHA4A/C2RA19sjT6cjlFfpSIyHlpOiYxd0L94ZTfTTN3mRHqVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271139;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=q/1mAtnvyHaNeeiEpckn+2XG2425nFHR5nzDQK/AUM4=;
	b=mH2aZrp8K+vIjGx8UxzAO4l8KFMCxIpbVhVzvZuRNKzQCUT9XshjnFrubF2je9eAAVpU
	 +Zb7plk0eeekKSK+16Bi/7XmnV0hnROsBspjvOStZPdoX0PdnBfj4VRt5H44TSFRk3G7X
	 lnvDLBVppOhVHLI8WLiLcllSNfnDfsimkTym/4X/5MXjxFgxbBfWSBihsBr9Cx2BCAKLA
	 h2Vzgnq6M0HLMJLQaaFKwYK6/t3jt4vvZdBvUN+C9IWLu/rmEVWMF9fJXVXWfag9MEymg
	 axcstyPlLx5lr63sztxZJwXatEUpWkeONsNGINPkPUDDGzBV7+a7/lOIWzNq0E6YQsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BUbROApz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59CC606A333;
	Sat, 21 Nov 2026 14:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BUbROApz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795271139;
	b=AL474SCIZU/i4iSyIeXzZC2Uyr1rvO7ty6OFRomoHXCpJWtK8UIYUw8H4H4teCZ7SUKR
	 gZxhcQMuayuR5BQHWa+mKnoLcK7TkpXuaLi0Mqyq/IStiyj6pSA29YAKgnSvOMLm4Yfdl
	 3O3b9wBF6bdrTBa8RWx0JGw6snYqm25i0FIiYSyR39u3K5KVwPmtAYC4Wadws1Tv4GoiH
	 ssruE37bNiVG5DE0hygI6pmCHf9/WOER4160+izfy/CnUSHCPGpIwCYQ0ldQQnHJXKBoP
	 Nn0hi7bkyfR7/eDQFrMmnfHGCECLC2zmD76qBVZrvf07Mv7FvTun/GVlTZYSfDne7FA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795271139;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=q/1mAtnvyHaNeeiEpckn+2XG2425nFHR5nzDQK/AUM4=;
	b=dfBQgIGfVIkI0AHVw/WBm68qjoHv5c1mJ654pXkGD/GTTTS9pP3zHcRqgaGS3gSJTZDc
	 fYhDzzQxqRA11CgZXYgw+Y5DcMnmR8EpOfYSPcGsgbP8GpSRFQ0bGHT54bIA4em776SGv
	 vq/vwhazX2H7ZcbWchK8mSxyc9+d4cLKpDgwweGLVhcIQn9rNLA5iMXu+SGGtvzi83rs6
	 RX5y0NqsXF4YWEXSbqWUxsIikr661Q45wfYgLbDv4Ec4wY1Ce5isgA/EvFIv46Tmorxur
	 YVwOjj27Rgjg0ksv3JGOricgyj1s9CZDKC18aIteiBpbXOeFotjM2JUKntrSl9h9OOA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50FD21F000C0;
	Sat, 21 Nov 2026 14:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795271139;
	bh=q/1mAtnvyHaNeeiEpckn+2XG2425nFHR5nzDQK/AUM4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BUbROApzTQ32B8qUq2WbZRXeENZAGbqjzB6ha2pmMJmzI9E6AHKmq43wp/qAOWujt
	 fWk+C5oGHc+HbWEh39nyA6yvXYsgqoGd2BOnrHSkETBJ71gq1BF3XOn3SCbKv2JPZE
	 UiNTG/2sZKlx/uRskDPpuZu/hsB2BjgZ1mvR0OHBQaiNtrdvagdE6yP0oUk9Utl+Zl
	 emJjJEz+S6911LRZmg58zlFKlSQjXLatgzP7hpKWjMDQgznC71A0ILUJrQO4i5plzW
	 4Pikyfma8ll1EMWU4spc/ov11YOm6Brj6rbUo47nD7Xdw2Ye+ggsnWTRcow0h61Tl6
	 Eqj5DJ8tIwE3w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D4A7B4BCB3;
	Sat, 21 Nov 2026 14:25:37 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 14:25:37 +0000
Subject: [PATCH v4 1/3] media: dt-bindings: Add Rockchip IEP2 deinterlacer
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
Message-Id: <20261121-iep2-v4-1-760cf25f322b@gmail.com>
References: <20261121-iep2-v4-0-760cf25f322b@gmail.com>
In-Reply-To: <20261121-iep2-v4-0-760cf25f322b@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Alex Bee <knaerzche@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795271137; l=3925;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=CeX1QEjZuZNTsKtj8wHcP2hhIDK1JE/9M0cffwr9/u0=;
 b=PlpZcWdBwyv5rqAHqUswJmO9fNm4dF5Vu4I44TWNiuzX2MchkseZXQ2IKRW8tkmOqjannb2V0
 59SOsILAbp7BCJ3wnrAdQOilpmmBGFd1nIHrTUvQfrerlxgTJQcPMLS
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Add a binding for the IEP2 deinterlacer of the RK3568 and RK3588 SoCs.
It is a different block from the IEP of RK3228/RK3288/RK3328/RK3399,
hence "iep2". The RK3588 block falls back to the RK3568 compatible.

Clock and reset names follow the RGA binding. The resets are optional:
the block has its own soft reset.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../bindings/media/rockchip,rk3568-iep2.yaml       | 95 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 101 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml
new file mode 100644
index 000000000000..0c7666de19f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3568-iep2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip IEP2 image enhancement processor
+
+maintainers:
+  - Arun Iyengar <aiyengar1990@gmail.com>
+
+description:
+  Memory to memory video deinterlacer of the Rockchip RK3568 and RK3588
+  SoCs. It has its own IOMMU, with which it shares its interrupt line.
+
+properties:
+  compatible:
+    oneOf:
+      - const: rockchip,rk3568-iep2
+      - items:
+          - const: rockchip,rk3588-iep2
+          - const: rockchip,rk3568-iep2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AXI bus clock
+      - description: AHB bus clock
+      - description: Core clock
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: sclk
+
+  resets:
+    items:
+      - description: AXI reset
+      - description: AHB reset
+      - description: Core reset
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+      - const: core
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
+  - clocks
+  - clock-names
+  - power-domains
+  - iommus
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
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      deinterlace@fdbb0000 {
+        compatible = "rockchip,rk3588-iep2", "rockchip,rk3568-iep2";
+        reg = <0x0 0xfdbb0000 0x0 0x500>;
+        interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cru ACLK_IEP2P0>, <&cru HCLK_IEP2P0>,
+                 <&cru CLK_IEP2P0_CORE>;
+        clock-names = "aclk", "hclk", "sclk";
+        resets = <&cru SRST_A_IEP2P0>, <&cru SRST_H_IEP2P0>,
+                 <&cru SRST_IEP2P0_CORE>;
+        reset-names = "axi", "ahb", "core";
+        power-domains = <&power RK3588_PD_VDPU>;
+        iommus = <&iep_mmu>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f72ce07a4e38..90ec701edce6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24285,6 +24285,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
 F:	sound/soc/rockchip/rockchip_i2s_tdm.*
 
+ROCKCHIP IEP2 DEINTERLACER DRIVER
+M:	Arun Iyengar <aiyengar1990@gmail.com>
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml
+
 ROCKCHIP ISP V1 DRIVER
 M:	Dafna Hirschfeld <dafna@fastmail.com>
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
2.55.0


