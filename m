Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730F1481665;
	Tue, 25 Aug 2026 13:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787665600; cv=none; b=CodhdC0skvYnlSRk8ltaqq5cx5VSnaXfmLvlRm0sY+bAcYAs5akC/HJ12oxcjKIQO0SoHuBhvP/QPqT7BIrJ+Wp8iEVjyWYuzKWMAKsgB1abBH36Ju59sXqp7qFO22knuqJs8YnJ0mI4X/f2UkMvdRpHTPnWslGY/Xp8brEaNxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787665600; c=relaxed/simple;
	bh=+7O1QJsSUXcGQipBqMZA0BsI6TetBGDijpq/K/sEzAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CxDDknt6tyKIwGnoSIFufu3N9txB7PjZit47jq1YYEG2f6r2fbnhfOZmoNPpCmY4Up+kvXe2fYkA3SuPRwsfx17BhSWrKMmuWEXLCoSHDUHgLIAQqTk6kI2yfHD0hdwdOp7QUD/jUPW40nBA0NvZ8JFE6+dXwImAdgClnIB6XBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 04D3C2024A2;
	Tue, 25 Aug 2026 15:46:28 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wyrTv-003Hb7-2g;
	Tue, 25 Aug 2026 15:46:27 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wyrTv-00000002q5P-2zbz;
	Tue, 25 Aug 2026 15:46:27 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Tue, 25 Aug 2026 15:44:09 +0200
Subject: [PATCH v2 4/4] arm64: dts: rockchip: rk356x: Add JPEG decoder node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-rockchip-jpegdec-v2-4-86af859a3266@pengutronix.de>
References: <20260825-rockchip-jpegdec-v2-0-86af859a3266@pengutronix.de>
In-Reply-To: <20260825-rockchip-jpegdec-v2-0-86af859a3266@pengutronix.de>
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787665587; l=2390;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=+7O1QJsSUXcGQipBqMZA0BsI6TetBGDijpq/K/sEzAM=;
 b=o+hftTiI45tBNDLSxkIHqQoGEyXi7jY4IsmNtIxv8P+yVd1ShcXcQIa5PH7wFw/c7+DJ2ijf0
 A6JxzXm1VGCCsnW/JGq/F5A8N0LuGa6HcfLCzGOntPhGojVgWLSN2tj
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

Add device tree nodes for the Rockchip JPEG hardware decoder and its
IOMMU on the RK356x.

The decoder is the same block as on the RK3588, here at 0xfded0000 with
its MMU at 0xfded0480 and the same 0x400 register window.  Only the
integration differs: ACLK_JDEC and HCLK_JDEC instead of the JPEG decoder
clocks, SRST_A_JDEC and SRST_H_JDEC for the AXI and AHB resets, and the
RGA power domain rather than VDPU.

No rate is assigned to the AXI clock here.  Unlike on the RK3588 it is a
gate off aclk_rga_pre, shared with the RGA, the IEP and the EBC, so a
rate set for the decoder would move those too.  Its mux tops out at
300 MHz, close to the 297 MHz the downstream BSP asks for, and the vepu
node on the same clock tree already leaves it alone.

The domain needs nothing else, it already lists qos_jpeg_dec.

Both blocks are entirely on-SoC and have no board dependency, so they are
enabled unconditionally like the other codec blocks in this file.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index a5832895bd392..e6c7ae908a99f 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -619,6 +619,28 @@ rga: rga@fdeb0000 {
 		power-domains = <&power RK3568_PD_RGA>;
 	};
 
+	jpegd: video-codec@fded0000 {
+		compatible = "rockchip,rk3568-jpegd";
+		reg = <0x0 0xfded0000 0x0 0x400>;
+		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_JDEC>, <&cru HCLK_JDEC>;
+		clock-names = "axi", "ahb";
+		resets = <&cru SRST_A_JDEC>, <&cru SRST_H_JDEC>;
+		reset-names = "axi", "ahb";
+		iommus = <&jpegd_mmu>;
+		power-domains = <&power RK3568_PD_RGA>;
+	};
+
+	jpegd_mmu: iommu@fded0480 {
+		compatible = "rockchip,rk3568-iommu";
+		reg = <0x0 0xfded0480 0x0 0x40>;
+		interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_JDEC>, <&cru HCLK_JDEC>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3568_PD_RGA>;
+		#iommu-cells = <0>;
+	};
+
 	vepu: video-codec@fdee0000 {
 		compatible = "rockchip,rk3568-vepu";
 		reg = <0x0 0xfdee0000 0x0 0x800>;

-- 
2.47.3

