Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF97F3AE70E;
	Wed, 25 Feb 2026 12:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772022007; cv=none; b=O7HKpRb0/LLXt2tPb4ipyrwg2lijeuRU89X943WTFiwz8E4bR3/mF4GMkacVorE10H+kG8F9a+QqIWhEAf3gn2BsvahkvWWjLikl6NblfXFucBafU+3d5d71eWcCV5qBC0/wXQ7VKgWelXaGfFW+w/eu1zIdZf7KaLcH87J1Bn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772022007; c=relaxed/simple;
	bh=fWQKaJ3KVVTMepHRQE9cVCUJU/NMZyu4U07A0PswQIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IxeG6peSnQ1bivQ/AKTBB0t6mKQ7TQML8+pZdlTeIH2lyPsqQ3J02VHwksOIa3XYBudqCyEiACE7JfrSNJktHfJ2l99yE5LcfynBKeqVgdbtgkoQbOPckdL4ku6d2GiLIfqydpBjLnPYEkrcGu0wk3HO5VhD+XU5rdJ96bQ7cz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fdjFDCDC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fdjFDCDC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772022003;
	bh=fWQKaJ3KVVTMepHRQE9cVCUJU/NMZyu4U07A0PswQIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fdjFDCDCVQLTuObBeHpSDDrY0mNHmbBdwPFozwtkIedBw+D1aux27QHYXpCYS6c4n
	 cU+vPjmWOdRz9Ak/F6ZiXYKIQ82z/10tUaznABe8FEYALu8sfWdIHCJmz64V2Xdxml
	 OSMQS5k+6MzmhN3YqIiCIrKNZCRfSyd5OC47D6tSTIq70N0yFAY6U1DQDBdNUjSKXW
	 ibrdvep6Ys44K4IKjMF80eDjpO7yhCY9yGAmm8QDzNa8T0u0v/JE6m83DXBNU3fWY3
	 0n48Rkr4cYGzc0PuW53bPV5fP5Sj1oAGaUhWdcXCWd9fiKW3gZMrtwwPmYpdsvrjvH
	 fnqg7bt1a/qbA==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E66617E0D8E;
	Wed, 25 Feb 2026 13:20:03 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 25 Feb 2026 14:19:59 +0200
Subject: [PATCH v3 3/3] arm64: dts: rockchip: Update vdec register blocks
 order on RK3588
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-vdec-reg-order-rk3576-v3-3-5a2ebe1b11a8@collabora.com>
References: <20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com>
In-Reply-To: <20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3

Provide the register blocks for RK3588 vdec0 & vdec1 nodes using the
'link,function,cache' listing, which follows the address-based ordering
and, implicitly, ensures the unit address points to the first register
range.

This aligns with a similar fix for RK3576 where DTC complained about the
bus address format.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 7fe9593d8c19..b95129f85aba 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1355,10 +1355,10 @@ vepu121_3_mmu: iommu@fdbac800 {
 
 	vdec0: video-codec@fdc38000 {
 		compatible = "rockchip,rk3588-vdec";
-		reg = <0x0 0xfdc38100 0x0 0x500>,
-		      <0x0 0xfdc38000 0x0 0x100>,
+		reg = <0x0 0xfdc38000 0x0 0x100>,
+		      <0x0 0xfdc38100 0x0 0x500>,
 		      <0x0 0xfdc38600 0x0 0x100>;
-		reg-names = "function", "link", "cache";
+		reg-names = "link", "function", "cache";
 		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
 		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, <&cru CLK_RKVDEC0_CA>,
 			 <&cru CLK_RKVDEC0_CORE>, <&cru CLK_RKVDEC0_HEVC_CA>;
@@ -1387,10 +1387,10 @@ vdec0_mmu: iommu@fdc38700 {
 
 	vdec1: video-codec@fdc40000 {
 		compatible = "rockchip,rk3588-vdec";
-		reg = <0x0 0xfdc40100 0x0 0x500>,
-		      <0x0 0xfdc40000 0x0 0x100>,
+		reg = <0x0 0xfdc40000 0x0 0x100>,
+		      <0x0 0xfdc40100 0x0 0x500>,
 		      <0x0 0xfdc40600 0x0 0x100>;
-		reg-names = "function", "link", "cache";
+		reg-names = "link", "function", "cache";
 		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
 		clocks = <&cru ACLK_RKVDEC1>, <&cru HCLK_RKVDEC1>, <&cru CLK_RKVDEC1_CA>,
 			 <&cru CLK_RKVDEC1_CORE>, <&cru CLK_RKVDEC1_HEVC_CA>;

-- 
2.52.0

