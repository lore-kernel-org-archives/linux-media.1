Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FE12E5B2A;
	Sat, 13 Jun 2026 15:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781364447; cv=none; b=BezCZbXoWrlNlUM+Rlbab6D96Ir05EZZynkkqZvXBRDexthosa69aHe2BAC2XqlvoFEIPFfrGsSaHoXVcnOOHeRsva6RruXWw9ImKx2JtTTN4wyr4HLCHzMbMjszPpa/4vFQjJ6tE9epYrWUy9BnycTgV2BbpggxT9Ut365Ko8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781364447; c=relaxed/simple;
	bh=Ia+K5OKQ20aA0EOylQsTIY2CEYdx+V8IhQf1h2n5i+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OXyUTCQqYUw3RSV24/hKUMjKPuDqkZY5iVJuMPX09qTST1uPiq0/mR/oZQ0al/fi7v+NJSAX2ZCau6b+TUTdnqkUXXc2s8/FBaE+EpalrRAY/q1jWz7ffTLtKK9UXSiZ+N4wFQ7bsG7fnf36dKYc8r5TqAslkMEMsBzaI8gqU2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 6A5D837002F7;
	Sat, 13 Jun 2026 15:27:16 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 634B4B45526; Sat, 13 Jun 2026 15:27:14 +0000 (UTC)
X-Spam-Level: **
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 1C25BB4551C;
	Sat, 13 Jun 2026 15:26:58 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v10 2/6] clk: sunxi-ng: v3s: Remove exported clock definitions
Date: Sat, 13 Jun 2026 17:26:51 +0200
Message-ID: <20260613152655.212490-3-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260613152655.212490-1-paulk@sys-base.io>
References: <20260613152655.212490-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

V3s MBUS and DRAM clock definitions are now exported in the dt-bindings
header. We can remove the duplicated definitons in the clock driver.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.h b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.h
index 345cdbbab362..c933ef016570 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.h
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.h
@@ -39,14 +39,10 @@
 
 /* The first bunch of module clocks are exported */
 
-#define CLK_DRAM		58
-
 /* All the DRAM gates are exported */
 
 /* Some more module clocks are exported */
 
-#define CLK_MBUS		72
-
 /* And the GPU module clock is exported */
 
 #define CLK_PLL_DDR1		74
-- 
2.54.0

