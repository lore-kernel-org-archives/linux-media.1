Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795447540;
	b=QFCM4/WWy5SX8OIyhxCM0HPsTEIv5XRH/UiCqv9jVqu/Ig3mRQrWeSxB/sViFOUBt/V+
	 8vYkxjY9We1B/yz+pZccu51TZjNcR4iO8DZ5gl/3v0v9uFBowsqB9f9zVP+Ag6napMOrw
	 d6rFweQykB9YeeojKsX33LCUCRGAyH+nBCmmCflW8saQ74SRQs5DvUT6/mGSHWzyJmdhz
	 yukUQlXgIF5HYyIr2bNrLxQY7iMT7Srv4vn2rZxSrm22UTOeh+Xf9DaGgGPQbBslXjM5S
	 hOYxL+4nzvCXTsRhWxq9g5GaGUE6bR9v2B6jCz6VipRS3Zt2eBt2DM/5+1cKJl17h1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447540;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=RtZuQpjBISQ5PzofF8ezvlSlMkGFsIg2Ig7KZUE+5nI=;
	b=A63OFvwpRJF4xUrix6N1NvPP/qFeFdkfgcVk795+jRkVKTs6M+yxnm7NsIVeAIbMdt0U
	 fzhi9HZX32Ddyhfj3Pfrx5X8e9ttl8qGqOcBYz+CUgLJ8mCuMUjH+Grhn3lwxTzytq599
	 CUkgTGjiXaAWQe0t5aaIdlIqolthic4jW4T6dPlqOaYtZejO2SUwsKC8WWLfKghjX7tO1
	 4LW7wzTByHmmaq5n73DLfz0dXILicqUJGGVT/dKrtasPSAdrjv255igLWAq+QC5H/Q4m2
	 OT5G40Vpe8aw2pfTXAL4peslHRVCjP75jLUdhgcDe2B02C6HuaN5dOxDO+wmIU3qsvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=YCJ1Sm9w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D568606A689;
	Mon, 23 Nov 2026 15:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D568606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=YCJ1Sm9w
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5c0a:3200:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 87D9920215A;
	Mon, 23 Nov 2026 16:25:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795447534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RtZuQpjBISQ5PzofF8ezvlSlMkGFsIg2Ig7KZUE+5nI=;
	b=YCJ1Sm9wSJyTcVdstzw5TsvJXDZrTsBfIFbBj2QnEq1t68ZAOhF3V5MaZ9/eAxq3HNlxTp
	jc/3pewzJvQrqCfRvXslFI41qGS5lBjg0x25htfrqy69o18UWIzMycjC4ezzcslHcaTVUO
	yYB+LVEVHPQWIoKv8KRRldVuVgiFzJsxXSo9LY/LMgeCXpZcjqrHbpYUPQyWkbrhloHJT7
	jJq1PlkUyLZAH9dM7b0ECp+0irb9iNxbL8SqnvSjsxsTvnvFAU7itTDyeE2yrtBI+IbiJu
	PQQFI0W9324A5dSTzfGxgS2F9GZ3iLMG2TkSreMvydlRcKVLyB8p4S86jVau7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795447534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RtZuQpjBISQ5PzofF8ezvlSlMkGFsIg2Ig7KZUE+5nI=;
	b=JdFLa67ldlJXlkWYyXw5VpJGdvOdZ4zAAp3LVTkbFNiGrVQy2ofOAx5QaZbHyFSfuXZkYU
	fTXayBwvauLYRfU4pUsaVy92lJRz3PX+cDVEXkuHzd1F9AcophTX/yEdIERH1WQnG0eoI7
	sk3S+N9qaXNAYADa/SjWp9LjfkerXaR6bIXpSYdEFkiA3MtsvbJ+295evOJfVbDoBcqLj5
	NHqs9sCNlnwM6sdexA6Kc9aJe3dw4iuJjnERt8K2vpcZmUXIyG31XmJ2W3LB4lGVwzukLc
	kvZHOYlPctPwsu/UgkXEmXoeo/l62guBLiRSvkdRercqqKAsaGYhiJFdfMg4Og==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795447534; a=rsa-sha256;
	cv=none;
	b=PSfHtdakjULySKUW65G9H7whHeWSjhN4P340vni8F5U5Mv2jTVc7M3bcCjfFLOMXvOx4zt
	GXGeuvGQWhpuaxtoFepPIjcNqW0U6In9KQUX+t2tJe7WgzI6Gv/Pyn3gbyeTF5Fyvp2UlF
	xxiWg1Fi/3c7PsEdyGUQAxDrMIrTlqpTtQDva+McDmsxHZIRuF0q8qo0vG9qexCR3hcqYt
	8jEpNoTEgUCfBfSy5PtfXYSbmbGzkCpMLpX6spo5x0pgMnm4gfaMOpZz8d5EBA9zeM6i+J
	uOKoM5yWcXbJcNpq4PVtkhUi/IXQU0L8Ahs1kL30uIAf/NiWduqpfY7IEGZXqA==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 23 Nov 2026 16:25:22 +0100
Subject: [PATCH v8 3/4] arm64: dts: rockchip: rk3588: Add JPEG decoder node
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
Message-Id: <20261123-rockchip-jpegdec-v8-3-3316cd31b043@pengutronix.de>
References: <20261123-rockchip-jpegdec-v8-0-3316cd31b043@pengutronix.de>
In-Reply-To: <20261123-rockchip-jpegdec-v8-0-3316cd31b043@pengutronix.de>
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795447521; l=2087;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=/5otNey9wykcyEsqmcE7HpFPjCyCSXpdbrUJbjJZsqU=;
 b=2yShTeDEluSQe4gR/nnFNAVc68Wmhp64tCITD1cDWJyFuY4hJMhVnxPZHxrlXbGauz3QEGvJs
 7rU4X2ja9DjAqPaBb1+6B14MWm1tcWrq5unELJp/aHNaTFVL3NnZJtZ
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

Add device tree nodes for the Rockchip JPEG hardware decoder and its
IOMMU on the RK3588.

The decoder is at 0xfdb90000 with its MMU at 0xfdb90480.  It takes the
AXI and AHB clocks and resets, and sits in the VDPU power domain.  The
AXI clock is pinned to 600 MHz, which is the rate the downstream BSP
runs it at; it is a dedicated clock, not shared with another block.

Both blocks are entirely on-SoC and have no board dependency, so they are
enabled unconditionally like the other codec blocks in this file.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 376ad04e07869..cc53878502898 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1317,6 +1317,30 @@ rga: rga@fdb80000 {
 		power-domains = <&power RK3588_PD_VDPU>;
 	};
 
+	jpegd: video-codec@fdb90000 {
+		compatible = "rockchip,rk3588-jpegd";
+		reg = <0x0 0xfdb90000 0x0 0x400>;
+		interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
+		clock-names = "axi", "ahb";
+		assigned-clocks = <&cru ACLK_JPEG_DECODER>;
+		assigned-clock-rates = <600000000>;
+		resets = <&cru SRST_A_JPEG_DECODER>, <&cru SRST_H_JPEG_DECODER>;
+		reset-names = "axi", "ahb";
+		iommus = <&jpegd_mmu>;
+		power-domains = <&power RK3588_PD_VDPU>;
+	};
+
+	jpegd_mmu: iommu@fdb90480 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdb90480 0x0 0x40>;
+		interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VDPU>;
+		#iommu-cells = <0>;
+	};
+
 	vepu121_0: video-codec@fdba0000 {
 		compatible = "rockchip,rk3588-vepu121";
 		reg = <0x0 0xfdba0000 0x0 0x800>;

-- 
2.47.3

