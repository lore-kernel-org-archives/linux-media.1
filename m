Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EA038422B;
	Wed,  4 Mar 2026 21:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772658088; cv=none; b=I/uVU11PRA2w6SYzX8y+9sR01Gd9BC3wDSs8gsj1+ZO2tVQX/g/BlXGpxqYT2FHurnVWVfIndCFyAgGOP82f3sEjoAtT0b28NL7osRv4LwqY7XYS5Ka/TBxK8ZJm2OL/zZre0vjbvxRFkIVTU0h2A+a2qPLyCBIwbNdScGkm5c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772658088; c=relaxed/simple;
	bh=8eJ22plX2MZ8pc5rrDZ6oinNv/HYJGA7/2+Vl7H8TGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DjzLBOIYItLvLgqvsGQEtUC2F6ejQy/HU/XINJK4TMjic1meKq3EVAoJ1cInMGHJOyz87g4n1aIVqF6By7I1tNJE9Fzkr55JBcLzyW9gR7MVKnpOd45kLzLyoMdJaxkVQ1uu8ZL3DmAszBKLbLbwbJsuJf9y17Hoqh+N8tt4wKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Qqemr+ZN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Qqemr+ZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772658084;
	bh=8eJ22plX2MZ8pc5rrDZ6oinNv/HYJGA7/2+Vl7H8TGI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Qqemr+ZNL+WlDOj6us4JYFRAEPWVgcmZKChAkADbXlpr2BJycmSvZ1g7MxGsgMWUX
	 oqeJodNjomJugLkjJINbu8OLlgcRvVNyBr3f4eAH40ajAk4n2RKongSfmN3DCm/C3H
	 ZDQD6Z9Fq/y89rJpaJGUvk3N7HjUaE0VdyjnZ7hGMVNKLisAam8fAqMTCXaw5BgowO
	 ENWXf05HkUeVdI3xIfvh6CWN66Arv/Upr5/rNPjYKEM8KwulkEcdMoPPu2lTLFKtv1
	 iSgWGqtrPJJDas4sHkBDPJSv4UTI77VcYUiqghUvIBfA2YplrdhQOeGM8sJ1wYhYp2
	 E/Yr5KY3JUXBA==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A86E317E128A;
	Wed,  4 Mar 2026 22:01:24 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 04 Mar 2026 23:00:42 +0200
Subject: [PATCH v5 3/4] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3576
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-vdec-reg-order-rk3576-v5-3-7006fad42c3a@collabora.com>
References: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
In-Reply-To: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
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

Since the video decoder support for the aforementioned SoC in mainline
driver and devicetrees hasn't been released yet (just landed in
v7.0-rc1), fix the issue by providing the register blocks using the
'link,function,cache' listing, which follows the address-based order as
shown in the vendor's datasheet and, implicitly, ensures the unit
address points to the primary register range.

Fixes: da0de806d8b4 ("arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576")
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

