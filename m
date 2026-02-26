Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C8D2820A0;
	Thu, 26 Feb 2026 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772102825; cv=none; b=YJLjr1LlX2HN5P9+QWmncgx1APXVZafsx8Prlsy+ChMj3HijHVQTWQgT5cNPk2zmEJQ0XWeMi4gAAmXpG7yER6W5ACipRX/hJBgDxX9Luiq+qQw1kyZWM5iBeMMgOACzCHg2GhC93zyCknJgTTfpRA2TJmtsLZvdZ3AzXftxtQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772102825; c=relaxed/simple;
	bh=JlJr368Iduqmofj7bAqR0psZwFk+j7JbEHb1QjmEwow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RG/ETYMFhRTRcYAlnVsDr7/X+tBjJ1otbjNcoH6pq5kA9Berj+Xt+p2g/B+0y85x84u5LPFbqEeCDcXIgyogT5dlnoJjBtlQzaNCdOi+iafAry9G5hYtZdh6Egf5A5wjFS1aFNde36X6iCmpD7pRYdg++Fwnx1xZ/CEDJx1m4EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DTUp6uPw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DTUp6uPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772102821;
	bh=JlJr368Iduqmofj7bAqR0psZwFk+j7JbEHb1QjmEwow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DTUp6uPwrbPSHPVG7NghL0GBJle477+8UiwG7Q+Ab8CC6b29QnyMoocSOe8YBUdWS
	 CslAiWhBzmucgw/+chnJ1PdgnoU8wSWJx2AdJi1JHtEb3Cl5HNGeqptCjO3JEOpx2n
	 mbbpCzJvjfBVgThED2STvtiCsvOnDaMxdZSVJmM8DFGAuegvgKOstFAVhtkN04u5nv
	 ClBnKxMj1uh+fR5X4GK62c1yl4Nv6zF10tZqaXrIFFxgQgTvvn9ZGU8V/xy9t9vK+n
	 WalfxY2Llv5gMg8VALJJF8NARockUq+lrUYMzifIqTSFZOhLPpyAXxxkgx/8t6pAQD
	 CvvELNk2nwSMg==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A84FC17E0BA2;
	Thu, 26 Feb 2026 11:47:01 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 26 Feb 2026 12:46:54 +0200
Subject: [PATCH v4 2/3] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3576
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-vdec-reg-order-rk3576-v4-2-b8d72dc75250@collabora.com>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
In-Reply-To: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
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

When building device trees for the RK3576 based boards, DTC shows the
following complaint:

  rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"

Provide the register blocks using the 'link,function,cache' listing,
which follows the address-based ordering and, implicitly, ensures the
unit address points to the first register range.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 49ccdf12ef7e..45eb0d053a6f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1281,10 +1281,10 @@ gpu: gpu@27800000 {
 
 		vdec: video-codec@27b00000 {
 			compatible = "rockchip,rk3576-vdec";
-			reg = <0x0 0x27b00100 0x0 0x500>,
-			      <0x0 0x27b00000 0x0 0x100>,
+			reg = <0x0 0x27b00000 0x0 0x100>,
+			      <0x0 0x27b00100 0x0 0x500>,
 			      <0x0 0x27b00600 0x0 0x100>;
-			reg-names = "function", "link", "cache";
+			reg-names = "link", "function", "cache";
 			interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cru ACLK_RKVDEC_ROOT>, <&cru HCLK_RKVDEC>,
 				 <&cru ACLK_RKVDEC_ROOT_BAK>, <&cru CLK_RKVDEC_CORE>,

-- 
2.52.0

