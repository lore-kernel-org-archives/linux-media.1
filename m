Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE8546F4AF;
	Wed, 22 Jul 2026 07:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705684; cv=none; b=ZyvZdyRxo/BKFYX7fAs245CE+WegZ5ob3UbZZiJg3tZPZ1mTXL3gMA+1NbWqyPwE3Yxq9IdTVg49HDp69qJN+ohavCconADrHdvEPCcnSl4yUzVPBoKGAMxx1kJxgUoeDAxf79LYotXhBi0qabtw0Xf6Xi8I22tK4NBjqyqGXms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705684; c=relaxed/simple;
	bh=wDfgk5r9wQ+U4D3G3ER2LZoSuFZqHExCJmMB84GPHts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OaSNBDr8Ai4J3BA+NmCO94qyhJVtXmJu8nhyow++jE1U5WqeLfnTynRWTZCJuCIaWwxe6TVGn4MmWSAHC/W07NHwBC5W3zow5nb+/Eys1wAGYUScdHJ0+dlA+L7N/MaO9DRLBXSPlCZ0rA3i0xOiNZLCmSgC83h6GK79Uava2Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com; spf=pass smtp.mailfrom=gahingwoo.com; dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b=B3ViSFNp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QoqKWRtC; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b="B3ViSFNp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QoqKWRtC"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 15D00130010C;
	Wed, 22 Jul 2026 03:34:34 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 22 Jul 2026 03:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784705673; x=
	1784709273; bh=ssOn6zcVqmkZNO+y4cHN49WiK/ZTiT8VzjVZomEPNaw=; b=B
	3ViSFNpY2AJdem/qDnqhyt2gyW8G2gNsEU7DHrFcanZjkYu+fv9ll5I2yBQ452sl
	bKZi+y308KTBdEqYZDNu0GrrR9m8NRfpVGKnR1iZAxFlGjQ6FnMo7BoT1HBLTfu0
	+oTK81VXDxsU75c71E6ywU+uPPDwH17BU0Hyj7iDF+X4rn5qYOq3shwEUy5n87i8
	egheOmPV1HabtJvYemf2utIW3cp7hYvwSzk0rooXDIFCv8HPi3YGkZqr2n2LcD6t
	5WLtiBkoLKx/DfjfBGIC7SfEirqNcDm2dfa5znYxcMYZmw/7cKH9q3njx0KiaqUI
	kVRnVw+iO1WXGsx1GJIbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784705673; x=1784709273; bh=s
	sOn6zcVqmkZNO+y4cHN49WiK/ZTiT8VzjVZomEPNaw=; b=QoqKWRtCW+ec5kG8y
	ySjMtxboCJSOQGA0ImgwzrtYX5BnJBsGhmPgItlAPLictgUP+9w5Agn3gIx/135d
	JtEjlMCs0RDrpaKKncpmbXsP8AfsAs5M1s+ASU1G+/PVIwzUL4KYTUqsydWcUAvP
	CIH6YAAC6oAccjyKR8omMIfG9GQ1SEOELQfG0XZJo51InhlYH7PsGEc/dmS2GaQi
	v8HjxPnt3yVDOh5g5FGruz4jJ4C5VbgI924L27xqD9+K7Pl9QapQRTYpS5P2wZFB
	WagyNdQ6DlJH/wQVtzhf6TLTIo9U8QDe92GR4A58pV8Gc+3FfJ0IRTTHfiqU6C6m
	HAYdA==
X-ME-Sender: <xms:iXJgankv_t6xCdGR7I7NFnP49sm3UOuXcXS8TB8QfAHFiH5poWqjvQ>
    <xme:iXJgaqYri6DhhWYL8piQ4AZ31E_1Ke220Pt_oe0T8gB_tBLvpm19ce6UWmaoxAvjb
    gyTg5psDBD5c2VMsaXZo0QmGeN8PY3dqDg3py4IYI4WOh2sDGMroOY>
X-ME-Received: <xmr:iXJgah9N_HcQy9M7yl-WOlnrW9bc051-glznbEpNS3Kc_YxtrWMEGuydqKFr4VJAMxvRPGb9OA>
X-ME-Proxy-Cause: dmFkZTFmUtz3C00idprHP4TMAdWqwVjfgm2V7kpblYYJ9d8us6y8xMYVsJnHDuUDTMdQcz
    JKnb+8K1MXAXROTcAeoyxqgYpjhv0pDOGk6iPqoXfy1RSvjNCW1ROVtBlRBM8lT/Ajz6Or
    Rt1iO/zmML/J4u7t5tRcJ0OOTZqRUPzsr2wOyfdwnNlUbSi820lnFt1BF42RlIe5X4uFG8
    reYqGWWV0dFHdd3u8IJrdEKqssQByJ+bkuhN7vMvD+7NVp5MS9D4jTzWplLkLxnzW21r08
    q/nhF8TxnB+vHTZlpXIEcayIIlSGoIf5hf+0TQQFoQB7jvIUDCufhCHR4mc0E2655GGlTQ
    gGSyQwZjTtBx3z1auEveicw5+rxTJGJGVLsCVh2DgXlVFrAm4zcCGUF0sejhLOqTTW7hDM
    REUNqdMeKC0eaDsSGMGLD8PTdwGQlR9KbCFcevwAO/XNKgHKPxE6YYa0mdHXJHvLUoNL2v
    V0B/41w5kAnEqVj+ec5xwnX9IUrHsePfGYEJ/HYeCYgJImqFg33850slwKWcTXU6Dxp690
    7PafB0+9v0VVM/TpprYL4iR0lCFx0g7bBUAbSIWH3/mi4ocTW/H4sP2PGLd5xjGgW8HNDS
    AuOoHkFfaApT6o+HxnmIW/dvxAVLTHXxpGKPXEN4JuiVqObLgLMGxYX6tlCQ
X-ME-Proxy: <xmx:iXJgaiEwK_-_RzKpYE7dC9X2BP-FRtil6v4ok3tHGZ2lQo7BR574WA>
    <xmx:iXJgaje1yLHlmsW2642KD8w_fpeTPumqrRuS5_A9f69KaEBZmK0dhA>
    <xmx:iXJgajmnLU1eS72kgCqLVkNDyJYobx5CYCsoefndblctgflzx-UViw>
    <xmx:iXJgaioJACQ5DpXH9ucgmIbz2LX9HBTsPpXCVNS0RlM-5upZHEQbeQ>
    <xmx:iXJgarorsA6aBFSfSj89gxFguXA9AfvDjIBsTdv5JDoaNWQ73CLw_3in>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 03:34:29 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: mchehab@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.dufresne@collabora.com
Cc: ezequiel@vanguardiasur.com.ar,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH 1/3] dt-bindings: media: add Rockchip RK3576 VEPU H.264 encoder
Date: Wed, 22 Jul 2026 19:34:15 +1200
Message-ID: <20260722073417.2064667-2-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722073417.2064667-1-gahing@gahingwoo.com>
References: <20260722073417.2064667-1-gahing@gahingwoo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the binding for the VEPU510 H.264 hardware video encoder found on the
Rockchip RK3576.  Each SoC has two independent encoder cores, each behind
its own IOMMU.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 .../bindings/media/rockchip,rk3576-vepu.yaml       | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3576-vepu.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3576-vepu.yaml
new file mode 100644
index 000000000..942118cb3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3576-vepu.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3576-vepu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip VEPU510 Video Encoder (RK3576)
+
+maintainers:
+  - Jiaxing Hu <gahing@gahingwoo.com>
+
+description: |-
+  RK3576 has two identical VEPU510 hardware H.264/H.265 video encoder
+  cores. Each core is a standalone V4L2 mem2mem device in this binding;
+  there is no shared hardware descriptor/link-list engine tying the two
+  cores together (unlike the RK3576 video decoder's CCU), so each core
+  node is independent and self-contained.
+
+properties:
+  compatible:
+    const: rockchip,rk3576-vepu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The Video Encoder AXI interface clock
+      - description: The Video Encoder AHB interface clock
+      - description: The Video Encoder core clock
+
+  clock-names:
+    items:
+      - const: aclk_vcodec
+      - const: hclk_vcodec
+      - const: clk_core
+
+  assigned-clocks: true
+
+  assigned-clock-rates: true
+
+  resets:
+    items:
+      - description: The Video Encoder AXI interface reset
+      - description: The Video Encoder AHB interface reset
+      - description: The Video Encoder core reset
+
+  reset-names:
+    items:
+      - const: video_a
+      - const: video_h
+      - const: video_core
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/rockchip,rk3576-cru.h>
+    #include <dt-bindings/power/rockchip,rk3576-power.h>
+
+    vepu0: video-codec@27a00000 {
+        compatible = "rockchip,rk3576-vepu";
+        reg = <0x27a00000 0x6000>;
+        interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cru ACLK_VEPU0>, <&cru HCLK_VEPU0>, <&cru CLK_VEPU0_CORE>;
+        clock-names = "aclk_vcodec", "hclk_vcodec", "clk_core";
+        assigned-clocks = <&cru ACLK_VEPU0>, <&cru CLK_VEPU0_CORE>;
+        assigned-clock-rates = <400000000>, <702000000>;
+        resets = <&cru SRST_A_VEPU0>, <&cru SRST_H_VEPU0>, <&cru SRST_VEPU0_CORE>;
+        reset-names = "video_a", "video_h", "video_core";
+        power-domains = <&power RK3576_PD_VEPU0>;
+        iommus = <&vepu0_mmu>;
+    };
+
+...
-- 
2.43.0

