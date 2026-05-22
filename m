Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31BE3D7A07;
	Fri, 22 May 2026 10:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445129; cv=none; b=XrdpbNxSyGzJOOXJi2Zy7C10XbUXsIRkCfDU2/yjM87V0KQpmp3xUosNtJRVVazHCjZgeu3AiFW9kUkIjL9KbOVieDgXhj/OxAX3R+4QfgWVUbBSd1Jurmj/MbQ+fXzPuQLjtjJTtXcINOnpEZMCSxRbCrShvaX5/AN54nIgf5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445129; c=relaxed/simple;
	bh=pGGYOoltPgaRRnXyzfCNBXs1jvHPDksxLI7XjwOIn7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VdIspDL2C2i5eErdRjJORQ9atkQoIJdLh1+xgechIUh6dyfDjE06Hs2sFdvH277mAzi8KDh2wXINPOBxxlZdznQexvdMU+WLLcyK0yowCDAZSCv8f48PqSqRcYX7gQ/sRRgWgrdNu/ruBall8nam+vGAL+/LiwoiUTfVEJN98Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 63BBB3700290;
	Fri, 22 May 2026 10:18:27 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id B5153B408D2; Fri, 22 May 2026 10:18:22 +0000 (UTC)
X-Spam-Level: **
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 5E19EB408CC;
	Fri, 22 May 2026 10:17:19 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 14/14] arm64: dts: imx8mp: add VC8000E encoder node
Date: Fri, 22 May 2026 12:16:53 +0200
Message-ID: <20260522101653.2565125-15-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522101653.2565125-1-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marco Felsch <m.felsch@pengutronix.de>

Add support for the Versilicon VC8000E multi-codec stateless encoder.
The IP integrated on the i.MX8MP supports H.264 and H.265 encoding.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index a3de6604e29f..4e63c2b16c1a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2290,6 +2290,17 @@ vpu_g2: video-codec@38310000 {
 			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G2>;
 		};
 
+		vpu_vc8000e: video-codec@38320000 {
+			compatible = "nxp,imx8mp-vpu-vc8000e";
+			reg = <0x38320000 0x10000>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
+			assigned-clocks = <&clk IMX8MP_CLK_VPU_VC8000E>;
+			assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
+			assigned-clock-rates = <400000000>;
+			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_VC8000E>;
+		};
+
 		vpumix_blk_ctrl: blk-ctrl@38330000 {
 			compatible = "fsl,imx8mp-vpu-blk-ctrl", "syscon";
 			reg = <0x38330000 0x100>;
-- 
2.53.0

