Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795447544;
	b=hRcOUB3piov/z2o30wS/1270zC4ksPTYK0Mjb94ZBgf9Fb+AG2R6FlkruZUmIkPYJQfA
	 X2SzmNwf/6Wgjygl9YNihDbw9e85bRm7XEO4qk95QkB/Kw8HvsT+sOeKuIiTqkh0L0B+V
	 bm7rLZRA1B+YMox8Bwh6uqz+TClXRL62ByN5RkbHHHErp74mdeOk+UESc7HfXrjOHlCDM
	 pnqWO1xhMxiTujaYnRmfwkUN+AU+8xj5GDqmcBEXk5tECKPUkjPHkhvW5eKQJK/fYu39F
	 RsKqIIlZFi9fxSlc4TWniCVYP0FkgrJPyWZidv56mu7eVPtYpmGm3pt2LUADs0p+XOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447544;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=FeWTS8Q48bWPnQCGmjUGgs00u6eCx3a6nfu0+I6v/Og=;
	b=eZd76h7B+xTZYYNxkVOWPcwPgeOq+/3YNh+yWfodmQ/347Iv8Kr20DYmwACspzfldYuN
	 pGOSEtqP6ikJnwycfxZl5ToXmfYsY5sHderoGXW5SX+kDT7vodBd4rA0mWecmfUhar6HP
	 W+JKUpXQSkz+DIZcmSIw43QvTlwdgLEo+EX5vhKIr3QeDnuDADIK1zTsuR7Glrh9fzbIy
	 O+jCEa/r+Y+9kQWmHrHgmzgMljimsV00W6aF92/OY8rzx+c3YKhX4g2TxSg5kK+jyppaP
	 5zoljAkG9TzShBaMGNbFqSjqo6ifhr6J5/IKf7oTAfHQtptfwlA5IMvawM1z62f4/Yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Yn3NtIas;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44680606A68C;
	Mon, 23 Nov 2026 15:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44680606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Yn3NtIas
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5c0a:3200:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B82AA20228C;
	Mon, 23 Nov 2026 16:25:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795447538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FeWTS8Q48bWPnQCGmjUGgs00u6eCx3a6nfu0+I6v/Og=;
	b=Yn3NtIasFB4bNE7hi+meOpZRKsfmggAyxK/Lt1XQcngGebdL97xbLGrBLYV/S6aru4k9e3
	8XbLPmmcnjA2ogBJVTSeopfkQU7PFmo+LiAIqEl9WMCVT2HKvYRsKjLl+jzh24MQcfiRU4
	ORo2OCcDiJwtBdqrHde8xpb7M2LCdz0gwd6m5QxbBRXW+QE4A+sVjqYj6cinz/tbx+f+Ja
	v7Mv23v70VdvUsQspP6vYE6t40sVCNCPsahgvD+C7vVUWWvUAceekF5v/52i4JAXFJWaLo
	4K8Jh4pH1YqFLw2AFMnPLMu+MAUbpG0A9Ul5Rl+XdzYfmJuBxjKUO9qcOHe8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795447538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FeWTS8Q48bWPnQCGmjUGgs00u6eCx3a6nfu0+I6v/Og=;
	b=daweakudbzmXaAc8BSHk7NvyNlAz6B/bgoBK7LLyaMMRSwXoYFHhhVWS0JnPBhC0R6cU5y
	CJ1spp/BFcD4GYCFYtiNJU5l/IsSXgXz+dZGU1XD87gDwEtl6KJZVm5h8TvLNMi57wTubJ
	/RJoX0hr5bAYKH9Vmq5m+6zANy10/rpbQ3aP8PdprW4bT72dVs4grNpE5DnZoGt+odNK0h
	H1diJYCcULeu7bXD1SnUfZJlslmj4v00wVtGwVsVVAfZseJIy3iFSFRtACLnOuDDkhnqux
	d2+KZPd55hK54zCt/ekG13KkPr1Xb1UQe8nqkUW9KivuQ+/8LSeU49f6savByg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795447538; a=rsa-sha256;
	cv=none;
	b=NVQAQ9R5wm3fVB0ui2uwrt59wxEhUq8rqrmW7s3mFMKBI6Q+wn5KxHJf4/qulzs11qxHMV
	odSY0DNSvbFMl4XfL6ITdI1lv3J7pT7/H+kvPn0yzQAqJAEPWaRT2cIj1Y6oIMYY2IP93t
	3PdseBy5yjXotyCo5fblAmgGmB6SuvrnQj6YjXtrrLWkpxdhNVTH0yUxQ3HzLecNZIfcV+
	jjFb4wSy4OcDgFiu8l/f0Sz726c7MLQJ10H3y3X7TWNnr2l6WcOozK8NywrvZoPnDhfpst
	6t8MCVXvRIjvjIDHot/E3FLv4jFBZoEb9PAbufCM10J/CazfTM8H1qIXnABKdg==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 23 Nov 2026 16:25:23 +0100
Subject: [PATCH v8 4/4] arm64: dts: rockchip: rk356x: Add JPEG decoder node
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
Message-Id: <20261123-rockchip-jpegdec-v8-4-3316cd31b043@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795447521; l=2421;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=XKKZeAn83nsSxMgXM9Bvv6Y9OauycMDu579tqOq4OqA=;
 b=jh7bgTelvaHbCA5tQHRb7KpAP9ZtNbAJvWi5fzaI3ndM4ha3PDuG/w1OsEgUkdSFlC2TmWhn4
 HcBgXQRZoWhAIEC53vTjocjrmVx9dq/38iJQZbu1KNr2NdgSuLb0Zrr
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
300 MHz, which is also the default rate of the downstream driver.  The
downstream device tree assigns no rate to it either, and the vepu node
on the same clock tree already leaves it alone.

The domain needs nothing else, it already lists qos_jpeg_dec.

Both blocks are entirely on-SoC and have no board dependency, so they are
enabled unconditionally like the other codec blocks in this file.

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

