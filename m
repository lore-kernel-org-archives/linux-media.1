Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C0C3E8C79;
	Fri, 24 Apr 2026 17:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777053567; cv=none; b=PGgl8U24blPbGdZCe9I6TzyewSEHla8FHCJFtYgEv4TDI1GWlvs1JD0kp85VVHF8PxsuGmy0xOTawpy6fJaox5QtLPHJszcZQmdAasFjZNp5anG8bXjV0UnORUrtgsNGZDSefJSdHRTXnuiytKR54yquMVuTnWJD9I4PAcInzao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777053567; c=relaxed/simple;
	bh=QKMIRFf+egZTLlRGURczjRcS1xEDrJXoY7l0Wd95zZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGdViTu6UjFStV2beoHb47pBUl2PG9wfhlp91sgzP1ICJl8ddE1vUG5bWwMG0Pi5MjjpD4ubal/j6lxKizKWLxEkMsy98Z2dfG40WeqceC30ncyyw19vSclTrYNB+q32hHBzq80bOEeDB7PtHzByZCAbuV+1QZ0m5BbzaH4UA/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=orR6Gr+6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="orR6Gr+6"
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2404:7a81:160:2100:5216:c7b6:205:5f59])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45DE01E48;
	Fri, 24 Apr 2026 19:57:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777053464;
	bh=QKMIRFf+egZTLlRGURczjRcS1xEDrJXoY7l0Wd95zZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=orR6Gr+6Egau2xm0MyviEZYvZwUYNU/i7QITxtNiF6EvwO2U0u06JeYL/cbzcsQnu
	 zalf26n88lyT1fQY45zFO+I4GXVYyIM6xGAE/jgLgn8AuQW5tyg8vOhm5nXwezLDIN
	 W5eTPyL7zw4G3fooR8PHewgqAzhB8nxN11RU73CA=
From: Paul Elder <paul.elder@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: Xu Hongfei <xuhf@rock-chips.com>,
	michael.riesch@collabora.com,
	stefan.klug@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [RFC PATCH 2/5] arm64: dts: rockchip: add ISP nodes to rk3588
Date: Sat, 25 Apr 2026 02:58:47 +0900
Message-ID: <20260424175853.638202-3-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260424175853.638202-1-paul.elder@ideasonboard.com>
References: <20260424175853.638202-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xu Hongfei <xuhf@rock-chips.com>

Add device tree nodes for the ISP and their iommus on the RK3588.

Signed-off-by: Xu Hongfei <xuhf@rock-chips.com>
Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 8b98e5c3cc8b..607b03d55dfd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -3535,6 +3535,66 @@ gpio4: gpio@fec50000 {
 			#interrupt-cells = <2>;
 		};
 	};
+
+	isp0: isp@fdcb0000 {
+		compatible = "rockchip,rk3588-isp";
+		reg = <0x0 0xfdcb0000 0x0 0x7f00>;
+		interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "isp_irq", "mi_irq";
+		clocks = <&cru ACLK_ISP0>, <&cru HCLK_ISP0>,
+			 <&cru CLK_ISP0_CORE>, <&cru CLK_ISP0_CORE_MARVIN>,
+			 <&cru CLK_ISP0_CORE_VICAP>;
+		clock-names = "aclk", "hclk", "clk_core",
+			      "clk_core_marvin", "clk_core_vicap";
+		power-domains = <&power RK3588_PD_VI>;
+		iommus = <&isp0_mmu>;
+		status = "disabled";
+	};
+
+	isp0_mmu: iommu@fdcb7f00 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdcb7f00 0x0 0x100>;
+		interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "isp0_mmu";
+		clocks = <&cru ACLK_ISP0>, <&cru HCLK_ISP0>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VI>;
+		#iommu-cells = <0>;
+		rockchip,disable-mmu-reset;
+		status = "disabled";
+	};
+
+	isp1: isp@fdcc0000 {
+		compatible = "rockchip,rk3588-isp";
+		reg = <0x0 0xfdcc0000 0x0 0x7f00>;
+		interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "isp_irq", "mi_irq";
+		clocks = <&cru ACLK_ISP1>, <&cru HCLK_ISP1>,
+			 <&cru CLK_ISP1_CORE>, <&cru CLK_ISP1_CORE_MARVIN>,
+			 <&cru CLK_ISP1_CORE_VICAP>;
+		clock-names = "aclk", "hclk", "clk_core",
+			      "clk_core_marvin", "clk_core_vicap";
+		power-domains = <&power RK3588_PD_ISP1>;
+		iommus = <&isp1_mmu>;
+		status = "disabled";
+	};
+
+	isp1_mmu: iommu@fdcc7f00 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdcc7f00 0x0 0x100>;
+		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "isp1_mmu";
+		clocks = <&cru ACLK_ISP1>, <&cru HCLK_ISP1>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_ISP1>;
+		#iommu-cells = <0>;
+		rockchip,disable-mmu-reset;
+		status = "disabled";
+	};
 };
 
 #include "rk3588-base-pinctrl.dtsi"
-- 
2.47.2

