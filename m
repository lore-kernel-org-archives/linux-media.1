Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795447533;
	b=nZpdDIbhofwwoycBHQXgHbPgaA49SBf6sXe7lUb2rTGRncSXZcethlfgf4Z5gBLZ1hE1
	 NcynW5fu/d8MwgZ0D+S2URNnnQh9P2lzeB0JY3gezKj5PC+fE6ysKwMWKE1lQ5b+s8/Hi
	 /P9X8naRNBo7/lAa9cFJcWdOG/FMB0XfrMS8L4TOecWUkJdNc8A/9gvueP4zzKGjF3XFv
	 grQlZcRYr5DMjHXVfeOITyONivaCVxva2/8/dsvpqMxDeXPruMGzRcGtQ3/uqh34ppv/C
	 jrag7MMgEbh9nqbq6om5ItnSjU6bStn3ntM6VXzQhSxGRJ2rXW0BArSRQ8/G4jCyu/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447533;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5kI8gmY1B2lqy3EqGixZzS2Fx5POa83a6PEWgQ3NNoQ=;
	b=qnrGCsltLcJ46lpdyHZfWmkkqlko+xUzRl+nj3iMma+HQVhE4InIFY4oS7KnaM4HXvPt
	 961ThmPeuKikwJF/s0AoJhtUXiaXGO1o6uCSbt7W7cEoJ34S/oZPeAHsc9h00OT6RB609
	 Ie/R6vwkS7fkSrZim+hJW3XX00AK+RkOsRNRSoTvqKxhTKQEGQRhEnWLNs9/Aj87hKOEy
	 FUx6S+dYNsXdyN0ddno3touLsdKiLSUil1fHIcx3XSz0AgGzGNSEYHlJDNp3U910PfwPV
	 FNFaObrv7ysSwaPFv2Vs+qH+hwFjecqDmCyHQa9WaFCSNEpJBA6C3KYTeCH9DMCDJLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=gGSLRprC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECBD606A31F;
	Mon, 23 Nov 2026 15:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DECBD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=gGSLRprC
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5c0a:3200:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 0C2D8200531;
	Mon, 23 Nov 2026 16:25:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795447526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5kI8gmY1B2lqy3EqGixZzS2Fx5POa83a6PEWgQ3NNoQ=;
	b=gGSLRprClSYpl72LsmyLTiP0muvKpJfOcNf66puwPZewcHWm/B0iEyXuxdtMtuKwZ7glGy
	ytNizaD9Kcqqjrzr/CQ9Sb2vEX0KkYK7OI70NCzYOOdCUC0f2RzjhXwKrk0YwjyFCnoBDE
	r+6CYfpWlxODQTJmqzkEIz9qDkpzStbpcCyzAHG611fBETRsFNtCmxmXVNzeYmZcYuhSuS
	U8g6IgCcYpFNpHXhe2UpGFhOlpL0KsO7koucNAGaSQPQBExdzSAxsm8nAXMtLlIoHjoT53
	6QiVgt4wLTXi8h/CTvYzj6/5Ci4RBe+Fjp+sSF2qbw4v9r4rVN3CQhHYcsL+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795447526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5kI8gmY1B2lqy3EqGixZzS2Fx5POa83a6PEWgQ3NNoQ=;
	b=JbVAedhtxr506rU+58mqGBfdr+1cXrHT2YlXADIWcdeBgqB06mjwRIWWki0bZU+e1F9qOC
	cQuidKnd7KWru+WjfvbtzwFrhU1gGLNTFvIzKhW53M4xXIo/2kmv24dC6t+M6/K4RYp/AH
	RnjR5m2YB5Az0KVBYy/xI69f5BmcF/jUMpe6ln7kMkr2QWsYuKYVRIOB0dpt8O1I65YGpX
	luQu6w2E5I1dHC0CGCZ5mIZ+5ecR74hbftpHtDsvekGu7VmFJRTMzmTrPWCoQMo1V87Zwj
	OQZDGVSu5H8gjpiih9QAqJh6QJIL67IP98ptD0GC5j+pTfyzUJOS8A0b8VMbpA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795447526; a=rsa-sha256;
	cv=none;
	b=HtCDbINCaEHNs2OgZ6RBbkg7xwTJUXBW/1eqKPnCxjlwMdR3kxmgVlBCexv7tjgB7pSyFF
	ycEaFQSYrS2/OVqgjvGewEXlPW9SF3JPpS9ExbFMbcK8NdmIl0zoIakw+KquZMrZmZMVa4
	L8SMMWvrgRcL0Wk4m0G/STGXcg3CuDxZtF6NvDiOJbFzcDmalXwbdB3F19birkVp81Tbku
	Vx1AJDN5zpclFf1mJKMdTanm+ssJ5M1ZPNtMd8sbDmkhgTtAZMS40g8qZ9e66/eOAMOy4y
	kzJJvso9QMxS78Lvt43YcJzo4PAFHgBSv0J3exhzRQFQa/C95Y/2Ar2dt3apBw==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 23 Nov 2026 16:25:20 +0100
Subject: [PATCH v8 1/4] media: dt-bindings: Add Rockchip JPEG decoder
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-rockchip-jpegdec-v8-1-3316cd31b043@pengutronix.de>
References: <20261123-rockchip-jpegdec-v8-0-3316cd31b043@pengutronix.de>
In-Reply-To: <20261123-rockchip-jpegdec-v8-0-3316cd31b043@pengutronix.de>
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795447521; l=4940;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=w0ZyeOuPJN4G/4KlIW7sG2pYv8p9hc+BbbJymlcGgu4=;
 b=lB0cbr50Ncc2B2pOiq9T1A4/uDcMawDoUiXUSnWrNq5/savcy3PSkwP0tANCcg0/07RaW3R6N
 65D6S0QYYxGCIK490+yNaFiVIIuGRPXjXX7ICAc0YrtzXSTqpy7ZzsV
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

Add a devicetree binding schema for the JPEG hardware decoder Rockchip
integrates into a number of its SoCs.  Documents the single register
window (task registers plus the LLP link-table block at offset 0x300),
the decode interrupt, the AXI and AHB clocks and resets, the IOMMU and
the power domain.

The core is not tied to one SoC.  Downstream it is known as the VDPU720
and the same block sits on the RK3528, RK3562, RK356x, RK3576, RK3588 and
RV1126B, with only the clocks, the resets and the power domain differing,
none of which this schema constrains.  A compatible per SoC is all it
takes to cover them; the RK3568 and the RK3588 are the two that have been
tested and are enabled here.

The resets and the power domain are required.  The block cannot be
reached with its domain off, and the driver takes it out of reset when
it probes and puts it back into reset when it is removed.

The IOMMU stays optional.  The driver never refers to it, it is a platform
integration detail, and rockchip-vpu.yaml does not require it for the
other codec blocks on these SoCs either.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../bindings/media/rockchip,rk3568-jpegd.yaml      | 92 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 ++
 2 files changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
new file mode 100644
index 0000000000000..27d85f17922ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3568-jpegd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip JPEG Decoder
+
+maintainers:
+  - Lucas Sinn <lucas.sinn@wolfvision.net>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+
+description:
+  Rockchip's in-house JPEG/MJPEG hardware decoder, known downstream as the
+  VDPU720.  The same core is integrated into a number of Rockchip SoCs, which
+  differ only in the clocks, resets and power domain they are wired to.  A
+  dedicated Link List Processor (LLP) register block, located at offset 0x300
+  within the same register window, allows the hardware to decode a chain of
+  frames autonomously ("link mode").
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3568-jpegd
+      - rockchip,rk3588-jpegd
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
+  clocks:
+    items:
+      - description: AXI clock
+      - description: AHB clock
+
+  clock-names:
+    items:
+      - const: axi
+      - const: ahb
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
+        compatible = "rockchip,rk3588-jpegd";
+        reg = <0xfdb90000 0x400>;
+        interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
+        clock-names = "axi", "ahb";
+        resets = <&cru SRST_A_JPEG_DECODER>, <&cru SRST_H_JPEG_DECODER>;
+        reset-names = "axi", "ahb";
+        iommus = <&jpegd_mmu>;
+        power-domains = <&power RK3588_PD_VDPU>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 782389bd5cd3d..f47f614dc6857 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23714,6 +23714,14 @@ F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
 F:	drivers/media/platform/rockchip/rkisp1
 F:	include/uapi/linux/rkisp1-config.h
 
+ROCKCHIP JPEG DECODER DRIVER
+M:	Lucas Sinn <lucas.sinn@wolfvision.net>
+M:	Sascha Hauer <s.hauer@pengutronix.de>
+L:	linux-media@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
+
 ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
 M:	Daniel Golle <daniel@makrotopia.org>
 M:	Aurelien Jarno <aurelien@aurel32.net>

-- 
2.47.3

