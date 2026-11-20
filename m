Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795174222;
	b=03dYI8GNz7H+ZKEp/kKa/amEUKEzw5iT578CYm0YvAlx5+wQWR63n8QjAJ87xpN4eFkd
	 F5qrywR4GmjaBeu+2EnpA9nQpEkUJ7zWihvnCj7StGWKRQIrXPJGpvR75pr0TYKcPJd5Z
	 8AWLBTpz713ruzhk31la6elc4iugOY3P4GqFQTb9TurdqtUeSPdZa9pUaIit1E9Uj2imj
	 5YOXCiWDl+oA1PxUF7DGVg1qaxtOSgDleUK2gzicEejNFNzqRn3eHXE5CSeckkj+JZ6yh
	 c6Woh9HqyGgPWP5bXDG/oc6IdzOna1R/4uhekxhld9OVJT0lABRZPmRulY1tKUOzJUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174222;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=R2eFuVKMuKx/HT5/2aCPbO7MjOp+iQ1ERiIlQILhiRQ=;
	b=lJ/AEpzGa39AR+/uFuL/NS9YvWzp982DMp01hTPcWu9OtyJVveZ9z3AEfTCGTicRr1pz
	 waB6vUU76bgyyvt1tnwyqMdTeHFtaxZeNOr52++3oUheG5EeBDClW3UFjAtQqLMIlza5Z
	 Ge1DYXcb5lES1+eRiXye78L+trdt503FBnNof4SDGzp+b5gYxy7lJ0mPYIaS0FDp5whAp
	 Fb/WY9SSRF10g3r7XhA6Ya7/I6AICnooTuWZTVzJI4lmHYO2nBssV3RstFAzuQ2bh8Jqb
	 Z0SmmxkJkdLPuOfTdQ2xbhlVe+1sZobWFHr0QeX6OTgD9W08B4qd3f9ZQrpcrAln3HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FrRlBesi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162F560A2619;
	Fri, 20 Nov 2026 11:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FrRlBesi
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795174221;
	b=OASUjcrQCqw3vwWajOOXmu4WGyhd8GsEgZmeJOnK4RmxptRFL9yI0MyGxP3oVMSbOLxI
	 dZy25Euo95ELYF5mRZfP0A4p5ZT092oI3tMIBuqOLcZk+GaXmgWVJkhWjO1GWWLpfbizD
	 k1jG6TOzPHrvtPK62X2SN/trJOzMIeOvzZfkNBB8GEfxYNFcwPqzh4XHC3HRlwtLxaWQA
	 jKhI2OQ620UlZ4sIKSeGlteYGKTPj1lwBjIPkVCV21M1MGLbY2XmU3OjLwZdkWWBAgcDV
	 E04tlrzUR3/a7TX5VOJyIAkObLK1of8xhoOdevfTjNW1QuuHjbOwKe7nw/g1PE1I7NQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795174221;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=R2eFuVKMuKx/HT5/2aCPbO7MjOp+iQ1ERiIlQILhiRQ=;
	b=B/7GtmMcTS+0m39Qi+UZ6ckPeWyN0l/EoxfhuVSbzZQxnjFyKZ32INVcdn1NtHp4scL6
	 N00Z4hdoFlES3YBKdwSP0Pz3he4i30szKQaGBu9XGQhyzOf4U+g+tO+LGPx2KqDrJHz6G
	 r9nWzlAAgAURTOXu+APjdR0jQWcJVlf3Rlr9NTn72OE+Z8qwqgYftvAJihXpQ6oaMSXb/
	 eb7n1prY9NzKbczTurtk+Z/KaSPXDkwxFak4NiunC6qoCA6vrK8S9Ug700uNZXu4/LjKK
	 2IMCdIUTULys2jDa18kc+XN/2vQ8ChF21I8JbayNw7AsaUWYBc0gSkzNl0PQjCyuX6A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D34C1F000CF;
	Fri, 20 Nov 2026 11:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795174221;
	bh=R2eFuVKMuKx/HT5/2aCPbO7MjOp+iQ1ERiIlQILhiRQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FrRlBesirWgKW2RUWQqROGcqUijlBQZ/fGKW3RdtBV21SJGWgVwDMGgIFyMf46SOH
	 ZHkIl6FxjSq+wU6NvYlNcy9hLH9QgjskOscQGwuF+7Ob06aK/CsefUhY2JDwTj/mpV
	 XDaJatDQAwcij3Ve1Jq/RF+linGSOk07vfwtEulJMERA/ZduEkUlFzP4REQvnjQqx6
	 ON8RNXBjWdBKjFSB1sLWnKu2J2X/dddhf/LpWtarYJI21SpDsrcdJWenq939hMNTL0
	 JGghLn/dXd9H6D0rECB9n6zpVZYVsNEKBDfz2/bMhwFtadcHt1V8sFMX7KNKAEFDIl
	 aPP7+ghu6UodA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F178B4985B;
	Fri, 20 Nov 2026 11:30:06 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 11:30:08 +0000
Subject: [PATCH v3 3/3] arm64: dts: rockchip: Add IEP2 deinterlacer to
 RK3588
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
Message-Id: <20261120-iep2-v3-3-e94eb9f629d2@gmail.com>
References: <20261120-iep2-v3-0-e94eb9f629d2@gmail.com>
In-Reply-To: <20261120-iep2-v3-0-e94eb9f629d2@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Alex Bee <knaerzche@gmail.com>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795174206; l=1631;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=pLFuCmNVRbb5CYDpQgDI0o9UDTdkG7B7CO7SPDGMaZU=;
 b=qtxi7/JfHkLdRC2oQC23PtlgYFMXtkrLjAe4buhYNm94Bx9+qTwEl2gbfG0OnM+ZW2XP/tddh
 NgOuXGE1xPEAl5hBQTzpdebHXwM/jOa+mP6pzZOiCNBPSbYzk2sJObO
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Add the IEP2 deinterlacer and its IOMMU to the RK3588 base dtsi. Both
share GIC SPI 117 and sit in the VDPU power domain.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index aa69fd3793fd..5297519bd251 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1397,6 +1397,28 @@ vepu121_3_mmu: iommu@fdbac800 {
 		#iommu-cells = <0>;
 	};
 
+	iep: deinterlace@fdbb0000 {
+		compatible = "rockchip,rk3588-iep2", "rockchip,rk3568-iep2";
+		reg = <0x0 0xfdbb0000 0x0 0x500>;
+		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_IEP2P0>, <&cru HCLK_IEP2P0>, <&cru CLK_IEP2P0_CORE>;
+		clock-names = "aclk", "hclk", "sclk";
+		resets = <&cru SRST_A_IEP2P0>, <&cru SRST_H_IEP2P0>, <&cru SRST_IEP2P0_CORE>;
+		reset-names = "axi", "ahb", "core";
+		power-domains = <&power RK3588_PD_VDPU>;
+		iommus = <&iep_mmu>;
+	};
+
+	iep_mmu: iommu@fdbb0800 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdbb0800 0x0 0x100>;
+		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_IEP2P0>, <&cru HCLK_IEP2P0>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VDPU>;
+		#iommu-cells = <0>;
+	};
+
 	vdec0: video-codec@fdc38000 {
 		compatible = "rockchip,rk3588-vdec";
 		reg = <0x0 0xfdc38000 0x0 0x100>,

-- 
2.55.0


