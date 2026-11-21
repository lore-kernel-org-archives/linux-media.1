Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795271140;
	b=sEP4aqDxSBfDLcWrsRaBZua7QDl5wGVeKhhg3vw/9zTMooybOByeusd8chJzEHrXgHZ+
	 8z7fMf7hIupqBi5TU+uJR/f+J/KrdfCchk71dKv8ctHrqJI1BByobWcvT1wAi/0/cTe0l
	 lNr5Qa4kID5TWmOxNhxAZKURMReW1fxxf3PS9yUUae4HwRA2Rk1oqp7QTJ2cvQTqL7ssk
	 OG5SOuffRz4EixkoE1r5RT8yA7NxdxCEUNMFujNBqxUecRphcSyTEZN/3o0oimc3+uw7a
	 Ir1YyyU033syUe0hSXbBdkiepcI2FH1izlGC8KGDBr1hzxzD81W99O5rwSjLMguItFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271140;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=R2eFuVKMuKx/HT5/2aCPbO7MjOp+iQ1ERiIlQILhiRQ=;
	b=A04eUaICTub2BVAM56pgiA/KuYfUliOveGgnmX7gGp11P+xWj/im6mwarz6fmkM8Pq53
	 AYP/vXQU/tPYd+uXo/4eZyFhWxM23+Y9B7FdVKhEXckZ8gUkJuUXYYkxCmALg3LV0jdrR
	 KHq5KO9eKfVruSG35yzSAKTLHPYuELigtzol/sgVYka33KJ38/pCXB0vn0ho5YoX6/Mz2
	 A6kGbk2R2tk8usV0NFiacBlOdi85m1nI2w/9OlvODVjW5xS0vS28uWwcbGyjo6eN7r9Fs
	 H86TpHMK+bH7mIm62sGQIvVCIp8nLHUNaEdOODzGTu9fekc/eesjT0PPMdWFKDph9CQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GBysk8i7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BC3606A680;
	Sat, 21 Nov 2026 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GBysk8i7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795271140;
	b=LHeq/PprDtBX3Fm01iKeE0Bc3lukS4yWmQMbUJHLkhEWmdaieaz2fSKXcCMLIK0rdkVM
	 6xXJdjuRIRzHPK4lFNXoxGfOiEwXtxpTUQigCCHxCtggfEVA4ENh0Iwk8Zss8xlJtxL6Q
	 0JgUDF4n9Q3nsGEF3DVYLbds2g+IdqSA7Jv0EixGeW5uCnoGYDGhseFLZDNLye4T+btdl
	 MA5lsdZ2Yp2+KQftvMSztSkv2kyWzwu4zJrn/dNqdYZgUN4OLxayC/Fr3PEOq12Nys7q5
	 WOA1nInJDIi3jpVFetGxo2awOoQi+949/vWiQNAylXA8a4n3OfJe3cyEJ7Kdd7L/OpQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795271140;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=R2eFuVKMuKx/HT5/2aCPbO7MjOp+iQ1ERiIlQILhiRQ=;
	b=dqtuD2n9bVz6gJfIhnJWOEuzGOq0WZSxvGUycX7ywwFClAwd0Qip6t64j1N1HfzLdgbv
	 mSfAvwF7enuBGUMzax6LQgN/9XijHeuJQY2tYP6Lxm1NHq6gzVMn8ivK50jppgWmkvsAf
	 GAFe1pTix/8Lx/69hpRzAc+sLUd3ohFEQ+W7/AMLIP/QfTCxkhXglBbPGejGI9yoQo13v
	 xtw2mFVhmlmNUOcBPaP74kKZlPt6bgVhf62QWydy5GIafTKO5VAOZFjjZqihlAe7/GSdm
	 j6TN3Bv51VcR9mEITy8VDGg2ySz3QamNd/MqXegtWwdDySoSWbmBudykDc27PO715BQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 899E71F000D3;
	Sat, 21 Nov 2026 14:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795271140;
	bh=R2eFuVKMuKx/HT5/2aCPbO7MjOp+iQ1ERiIlQILhiRQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GBysk8i7oQckDVNCz7F//62GoGhw9GWjlaef/kGgMRHqRHwPnaJFfgpk96vyK3d3B
	 m+vsUXPIJMWD55f+fKvsZ++NRRMsPnR8LFoMOStpp1RBkqrELAT0aJIFvVyyeVfrJC
	 0j6fbOYCKh1c9V3MS3MSGhsxp8Cv9AgBfNUA8yy5LmREUBFsIxQfWajBbH7pS+2KaV
	 9314kQSwyMNBwPbo7bRguRog55EXp+miJCh9Vq5AL+B91i4/XoNl74djpP5nSlBfDt
	 g5JFcaRlHO96ijX2NDcXkJnoRctDJiQJPKlIX5pEeZiG8r2MU+8AoMWqcmnmzEMoeF
	 A1r9tPYO5AwyQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 141BE4BCB8;
	Sat, 21 Nov 2026 14:25:38 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 14:25:39 +0000
Subject: [PATCH v4 3/3] arm64: dts: rockchip: Add IEP2 deinterlacer to
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
Message-Id: <20261121-iep2-v4-3-760cf25f322b@gmail.com>
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
 Alex Bee <knaerzche@gmail.com>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795271137; l=1631;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=pLFuCmNVRbb5CYDpQgDI0o9UDTdkG7B7CO7SPDGMaZU=;
 b=yxgywoVv8poDbopGdZ3H0aaTxtZ8+BmvnJblZXzFqpRF5UH6QIyzGi5uegTEpaC9YT3TA/Nra
 8AzvZY41eAVDXRKx96/bPlck1Tq4ZMwM3o2oyD2ZJB8kJP9XQ/ZOIRj
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


