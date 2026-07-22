Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D65471253;
	Wed, 22 Jul 2026 07:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705698; cv=none; b=JLKzK20y5N6valbsJJPe6BZF7tqhwNAQTZeCk4Pv+EkNqXuwpDyzN5Y4kbCjHUMEwUEvp+IUGZ2/r2KEmiRw6+g0SgYFINVVlfyI8z/DYEVAYgYve0mYR9DMIN7yJTd1HQmniqaeRuOmaZ8URS9nZKVPfNEwJG1PcPsxNPE3TjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705698; c=relaxed/simple;
	bh=0v7gSTvkG8Wf0/mcGZejWDJxAnSkBSXiwNbaj5GrkFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qa3XTWjRiu/U2oeu/BwTHzW1u1z5PpWWsAZ5HHxYVLg1lvhoi9+CQrW0dVhPujEMivWkjYkKxPJKuNZ0SB67X5ThEeLBGLhXS9U9x4izny7UEY4L/MxujFuFaqQ+JU8z5RCxs6ycYUsxeGdfaZXaocKyUy5Ey02BCGsKqPJklok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com; spf=pass smtp.mailfrom=gahingwoo.com; dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b=XjsLwTa3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oTiH/q+f; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b="XjsLwTa3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oTiH/q+f"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.stl.internal (Postfix) with ESMTP id 666C5130010C;
	Wed, 22 Jul 2026 03:34:50 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 22 Jul 2026 03:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784705690; x=
	1784709290; bh=2QJ5C+F1DA/FJAjipor7GjfS6+nFhyDKOaKdbzVDlcI=; b=X
	jsLwTa3qxeUa9vqAFByWM2DhChTg9IRV0fdaA3GVEpCJaMvhrxAjjYW2CARhjxVr
	HvUpB395c8GnkjCI3l8kXiW36avt245jZFRGAwZTv1M5lPgg3FpnyBlpEQFPP31D
	2U+up1en62ORxuMGFfvwYaKRlRTQeXHME3swHfSV7/a8AiIT2B3XeALJyD9IjCDf
	tPu3g3/sJOJ4IHtXRzrPJ5lTAGSTIput2dnlv2iooEE9bYKO6IW27dxjYfkxMp/I
	KKnw9FITUOETN8KMjarvd5D9P9uia45tii4cu3IbZ9kATtVVbhSpGlbJkiSgJ9/d
	Sxc7n9vkuy/uarwLi/xIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784705690; x=1784709290; bh=2
	QJ5C+F1DA/FJAjipor7GjfS6+nFhyDKOaKdbzVDlcI=; b=oTiH/q+fknqYEY81U
	Tg5BmibOHkd1NvLmYN/+j2tTVrNGvHNjXG88LW2ZyOul66Vrt686pGf2VtCkzlus
	5kPuv7sJwp71128eU1BQIbF9EQsOJYr64CbaENVursKdPHsJiqFo2FjltC/4qsKb
	nTYWSi0Jol+1sL1WYY66ODPt2LSDj/+6q639dx34iBjb91noY48xvCqQb0CeDifn
	iAwK7vVj9CwYjbnFFgE0SKIzm/6KP3OiNl0JAcA5y89ku2s4JQ2dXVACLai4qGTE
	Y82NTkYTrTbyxWlVKj9kLggkuc477SCvyO2gx7XVlHc6+oWJNjMj6/L80tOCdyVi
	8aaGQ==
X-ME-Sender: <xms:mnJgappuegiI3u7VGDe60GUvIT5CfyFNcZ2_D9TqQvWLc7zscJ_DZg>
    <xme:mnJgarOylbthKyzl5GarYVVCnY3ApylwCUYl1-GO0X4LlTNCSpQsT5IsnlFuGZAZ8
    FCrYARUIy3SivH751MW_MwlGaaKCVXCmpyxR1idJfRDJPfXgaIID0fY>
X-ME-Received: <xmr:mnJgaqh7yTYioxTU6qLMGA9j7N88F6Bt2v23fAVwsR4NsSY2H0Zxvy6g8ZUJ6m5O2G5k1P3SyQ>
X-ME-Proxy-Cause: dmFkZTFVIK4vf39ogJgDXiZBsIX5cHfPmRxt3QSla0pIIZ9ScJ9tXi/bHP/vWEBkPVTl1L
    IfbuvU4DfaJZ1mwduzFfn7E4RMd539NAe4Nv+GvvkJmTdPbaA+JvnHDCfhQNm/6WIdwYjL
    bnGh6mut2Djvd521unXurTCICfSJGXOA/LgrSLF6h6FjfzLl2ui7YsqG66TcSyuAp0usRa
    DPI06wil8NZHdiBd0rqBHmtfxb7nDahAGAqng5wsY7aI5t2QiQ+4IYudVqXKUmsyMu69Ox
    QzC9N9P8oo19JgNPRBGnT3ZfcqE6mYyq5O1odinHV3EQNrhrinQyHolkpzdqCjM8/6yITv
    rKBuCjvL9LmhFur9CM0Ne68aiSSvr0srjurYHRGLtd9/V3TQT7IK5ld/amomT/9m05Hndm
    IBBZL6AEc4vG/Bb1AyQ59Gl1aPX8E0D+40sCfOyfNX2mLBkQrP5YSsAwzNeUcI68uhVyyp
    R5+oFF5zM35U39MctxxMKl1RcGCBvbkDkcFsQ796wWwtMsGCm4S+/nIYNX3p6xzBmzcKqh
    dpRFVyQw1HerrCQjFdfMIlc21TfKNN0vLSHbYYosK6sV0cbh1nyb9jqNDRYUssBNxfyCX5
    DoXOAZEJMCIdL+EzrKEBNGHgpsXZE1RvisQB/cpN/2Inl2rOJ41cmQ2AjC8g
X-ME-Proxy: <xmx:mnJganYWo0hqBEOYWGVusKbtksxVYWKtxh5fbWjMmncb1pJ9aRwR6w>
    <xmx:mnJgamglIr9IeWizwHfXLTPfwOyBO2DXh1L3XeW-3Sj0AK-hodvYtg>
    <xmx:mnJgahZyOkIP-QxMqFJcyS2sZOLzt92m2mUzCqb6HWsr-4tBTnDpRg>
    <xmx:mnJgakP3cKJQLlnMbcxh1kOzHWSJ2t3tL9ZwhsSMEe6DNf9byXTJsg>
    <xmx:mnJgavMlwcKCiGHLtFmo8IQDUFQ5h9DSzL0wH_KYwYiSUyymV9FszvNz>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 03:34:46 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: mchehab@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.dufresne@collabora.com
Cc: ezequiel@vanguardiasur.com.ar,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH 3/3] arm64: dts: rockchip: rk3576: add VEPU H.264 encoder nodes
Date: Wed, 22 Jul 2026 19:34:17 +1200
Message-ID: <20260722073417.2064667-4-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722073417.2064667-1-gahing@gahingwoo.com>
References: <20260722073417.2064667-1-gahing@gahingwoo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the two VEPU510 encoder cores at 0x27a00000 / 0x27a10000 and their
IOMMUs.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 50 ++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b622c6fee..9bf4f2c41 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1320,6 +1320,56 @@ vdec_mmu: iommu@27b00800 {
 			#iommu-cells = <0>;
 		};
 
+		vepu0: video-codec@27a00000 {
+			compatible = "rockchip,rk3576-vepu";
+			reg = <0x0 0x27a00000 0x0 0x6000>;
+			interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_VEPU0>, <&cru HCLK_VEPU0>, <&cru CLK_VEPU0_CORE>;
+			clock-names = "aclk_vcodec", "hclk_vcodec", "clk_core";
+			assigned-clocks = <&cru ACLK_VEPU0>, <&cru CLK_VEPU0_CORE>;
+			assigned-clock-rates = <400000000>, <702000000>;
+			resets = <&cru SRST_A_VEPU0>, <&cru SRST_H_VEPU0>, <&cru SRST_VEPU0_CORE>;
+			reset-names = "video_a", "video_h", "video_core";
+			power-domains = <&power RK3576_PD_VEPU0>;
+			iommus = <&vepu0_mmu>;
+		};
+
+		vepu0_mmu: iommu@27a0f000 {
+			compatible = "rockchip,rk3576-iommu", "rockchip,rk3568-iommu";
+			reg = <0x0 0x27a0f000 0x0 0x40>;
+			interrupts = <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_VEPU0>, <&cru HCLK_VEPU0>;
+			clock-names = "aclk", "iface";
+			power-domains = <&power RK3576_PD_VEPU0>;
+			rockchip,disable-mmu-reset;
+			#iommu-cells = <0>;
+		};
+
+		vepu1: video-codec@27a10000 {
+			compatible = "rockchip,rk3576-vepu";
+			reg = <0x0 0x27a10000 0x0 0x6000>;
+			interrupts = <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_VEPU1>, <&cru HCLK_VEPU1>, <&cru CLK_VEPU1_CORE>;
+			clock-names = "aclk_vcodec", "hclk_vcodec", "clk_core";
+			assigned-clocks = <&cru ACLK_VEPU1>, <&cru CLK_VEPU1_CORE>;
+			assigned-clock-rates = <400000000>, <702000000>;
+			resets = <&cru SRST_A_VEPU1>, <&cru SRST_H_VEPU1>, <&cru SRST_VEPU1_CORE>;
+			reset-names = "video_a", "video_h", "video_core";
+			power-domains = <&power RK3576_PD_VEPU1>;
+			iommus = <&vepu1_mmu>;
+		};
+
+		vepu1_mmu: iommu@27a1f000 {
+			compatible = "rockchip,rk3576-iommu", "rockchip,rk3568-iommu";
+			reg = <0x0 0x27a1f000 0x0 0x40>;
+			interrupts = <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_VEPU1>, <&cru HCLK_VEPU1>;
+			clock-names = "aclk", "iface";
+			power-domains = <&power RK3576_PD_VEPU1>;
+			rockchip,disable-mmu-reset;
+			#iommu-cells = <0>;
+		};
+
 		vop: vop@27d00000 {
 			compatible = "rockchip,rk3576-vop";
 			reg = <0x0 0x27d00000 0x0 0x3000>, <0x0 0x27d05000 0x0 0x1000>;
-- 
2.43.0

