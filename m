Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C122B1D63F0;
	Sat, 13 Jun 2026 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781364442; cv=none; b=gjqsQUJiRDhqn9+t8aSPiChmowKgCfiiujq2X0NRUy7yaRNWSoZiOYGCye2UbsY0Lwcxu95983V+xudbq7weGk8VVnpHNAenqnpsdGCIv6UDfV7Uye6s6ZDxbYsZr7GP0g7blhO3r639INrAqUZOLiyH6OvQSZaWmkiMBQH6qtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781364442; c=relaxed/simple;
	bh=Loak2beHarVtJpX+qHOaWgaGxhARYe3ygz9aKU1CpvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B4EjkdDaL2DILm5rglTn3SibXg8QmNDAeEHMzDqdEoU0GsXUm4kTnfEb7dnq/IJiVjYHq7Yb63Hveajjj7bHXUICJoTwoTOFWoA+PH9eW2Zct6pRTzj2RCiIg8XlMhY2VAgKJ6jhMTcmmXpZSR4jYqQEoevfS156GO/acx7cxbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id BE4A83700300;
	Sat, 13 Jun 2026 15:27:10 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id AF449B45523; Sat, 13 Jun 2026 15:27:09 +0000 (UTC)
X-Spam-Level: **
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id A7697B4551B;
	Sat, 13 Jun 2026 15:26:57 +0000 (UTC)
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
Subject: [PATCH v10 1/6] dt-bindings: sun8i-v3s-ccu: Export MBUS and DRAM clocks to the public header
Date: Sat, 13 Jun 2026 17:26:50 +0200
Message-ID: <20260613152655.212490-2-paulk@sys-base.io>
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

In order to declare a mbus node for the V3s, expose its associated
clocks to the public header.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 include/dt-bindings/clock/sun8i-v3s-ccu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/clock/sun8i-v3s-ccu.h b/include/dt-bindings/clock/sun8i-v3s-ccu.h
index c4055629c9f9..d635bffd6914 100644
--- a/include/dt-bindings/clock/sun8i-v3s-ccu.h
+++ b/include/dt-bindings/clock/sun8i-v3s-ccu.h
@@ -87,7 +87,7 @@
 #define CLK_SPI0		55
 #define CLK_USB_PHY0		56
 #define CLK_USB_OHCI0		57
-
+#define CLK_DRAM		58
 #define CLK_DRAM_VE		59
 #define CLK_DRAM_CSI		60
 #define CLK_DRAM_EHCI		61
@@ -101,7 +101,7 @@
 #define CLK_VE			69
 #define CLK_AC_DIG		70
 #define CLK_AVS			71
-
+#define CLK_MBUS		72
 #define CLK_MIPI_CSI		73
 
 /* Clocks not available on V3s */
-- 
2.54.0

