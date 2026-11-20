Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196505;
	b=vDetXWZEU62HU5QYA6rrUw+6UP8OYcHrcJnPLXP9ZNrIlVQrjjMIlvTmxV+tnW/5jvv7
	 XllQM/i9t1MDfFMM6zF9Wvt5wx+2US6Wu1w3bbXuWTq3kUuUeCTkytUojb76JRZEenesO
	 ofuCHYk0jqrEEUjxslAlE04PztBHicdO3Ei60Fm3TGijSFZyh06RbYqpsEP08d9TrVp3H
	 oj+49TZbcNy04LZsL2SIGinQX0xSCS9a8utQL9XYNdzXiacVSCgIqngb+/qm3oskgBiJX
	 aFT/qv4gKmXUrGQpcoKRFF4OMBktRLaFxmyu8zWVtczI6qcPZHlC4O53VvtA83I65qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196505;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/3goNM+YlVYOx6YNNz5wSPSGmNLugYEQ4XJP7WGonIQ=;
	b=U5Xsz4gDProsKpfkos2iTaN0lOvBmAVgp7ZYer/iMxXOKUlLaJ8Dk00TZzePZtFFdU1h
	 0eGWSLaxe3gl580T1MLzLNWIBpyzTwfWlFeL5wUFzSwbenCPvDiHQI6sGoMlvoM6IO0nz
	 TIM61eSgzzqxb+vj+8npGCnkzWh/NQelE6CKnMVdQNEzRQi24iWAx4C87n8VeHQAgImfm
	 9H7g2pEmzcuRYv4I4hd1pxU06OeyjgigCrVhlaL762TkGg/CQpXNRuzIiK422HYFzbBCL
	 BT9u/wQLNZ4WBtQQ7u9H2hZm9QGamJSZ6lLAYUDoKm1D9GOu8X6kTLfPoV5HvfF+Xhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F129B606A336;
	Fri, 20 Nov 2026 17:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F129B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUScC-000000000K9-3JK7;
	Fri, 20 Nov 2026 17:41:36 +0000
Date: Fri, 20 Nov 2026 17:41:27 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Marc Zyngier <maz@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dang Huynh <dang.huynh@mainlining.org>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH v5 4/5] arm64: dts: rockchip: Add the vdpu346 Video Decoders
 on RK356X
Message-ID: <6838f7dd9bcca7afdacc13dc84562d798c994223.1795191823.git.daniel@makrotopia.org>
References: <cover.1795191822.git.daniel@makrotopia.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795191822.git.daniel@makrotopia.org>

From: Christian Hewitt <christianshewitt@gmail.com>

Add the vdpu346 Video Decoders to the rk356x-base devicetree to
enable support on RK3566 and RK3568 boards. Also add the needed
sram and vdec_mmu nodes.

Suggested-by: Diederik de Haas <diederik@cknow-tech.com>
Suggested-by: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com> # PineTab2, Quartz64-A, NanoPi R5S
[daniel: link, function, cache reg order, codec-sram node name]
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v5: fold in "arm64: dts: rockchip: rk356x: Order vdec regs by address",
    name the SRAM pool node codec-sram as on the RK3588
v4: add Tested-by from Diederik de Haas

---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 1a4562df20ee5..411c9ed62d4ac 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -402,6 +402,19 @@ usb2phy1_grf: syscon@fdca8000 {
 		reg = <0x0 0xfdca8000 0x0 0x8000>;
 	};
 
+	sram@fdcc0000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0xfdcc0000 0x0 0xb000>;
+		ranges = <0x0 0x0 0xfdcc0000 0xb000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		vdec_sram: codec-sram@0 {
+			reg = <0x0 0xb000>;
+			pool;
+		};
+	};
+
 	pmucru: clock-controller@fdd00000 {
 		compatible = "rockchip,rk3568-pmucru";
 		reg = <0x0 0xfdd00000 0x0 0x1000>;
@@ -638,6 +651,42 @@ vepu_mmu: iommu@fdee0800 {
 		#iommu-cells = <0>;
 	};
 
+	vdec: video-codec@fdf80100 {
+		compatible = "rockchip,rk3568-vdec";
+		reg = <0x0 0xfdf80100 0x0 0x100>,
+		      <0x0 0xfdf80200 0x0 0x500>,
+		      <0x0 0xfdf80700 0x0 0x100>;
+		reg-names = "link", "function", "cache";
+		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_RKVDEC>, <&cru HCLK_RKVDEC>,
+			 <&cru CLK_RKVDEC_CA>, <&cru CLK_RKVDEC_CORE>,
+			 <&cru CLK_RKVDEC_HEVC_CA>;
+		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
+		assigned-clocks = <&cru ACLK_RKVDEC>,
+				  <&cru CLK_RKVDEC_CORE>,
+				  <&cru CLK_RKVDEC_CA>,
+				  <&cru CLK_RKVDEC_HEVC_CA>;
+		assigned-clock-rates = <297000000>, <297000000>,
+				       <297000000>, <600000000>;
+		iommus = <&vdec_mmu>;
+		power-domains = <&power RK3568_PD_RKVDEC>;
+		resets = <&cru SRST_A_RKVDEC>, <&cru SRST_H_RKVDEC>,
+			 <&cru SRST_RKVDEC_CA>, <&cru SRST_RKVDEC_CORE>,
+			 <&cru SRST_RKVDEC_HEVC_CA>;
+		reset-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
+		sram = <&vdec_sram>;
+	};
+
+	vdec_mmu: iommu@fdf80800 {
+		compatible = "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdf80800 0x0 0x40>, <0x0 0xfdf80840 0x0 0x40>;
+		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_RKVDEC>, <&cru HCLK_RKVDEC>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3568_PD_RKVDEC>;
+		#iommu-cells = <0>;
+	};
+
 	vicap: video-capture@fdfe0000 {
 		compatible = "rockchip,rk3568-vicap";
 		reg = <0x0 0xfdfe0000 0x0 0x200>;
-- 
2.56.1
