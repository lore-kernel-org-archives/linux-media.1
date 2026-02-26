Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631792F12C1;
	Thu, 26 Feb 2026 10:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772102824; cv=none; b=BSxDRCDHndUZI4Hv6qm0ra5it/FxKgw9VBg9X8JRSDHpnxhhymclfgYzRmLRiSHza8UwqG+ZjSbvRfby+y7H48qVrN5b11cEHWgnBb3JOczFHMF7jL2PfXVLwZ7bX3caLEz97rzk9P/HN7prt5elJ7xig9w9LR3xGE202qi+Duo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772102824; c=relaxed/simple;
	bh=bYkpLYhhwj5B4o0/14vepvOL5dD82IQeKBivzobWYYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k6y9pnGvKeahRrCCJmKLpOfSdjSSo0x1oPMGyNiBH1adiT9aNVutMQiaXfO9KY/yc2dBaLchSMXdOeC/K9Z12vvdDLN0DU4kgFE/2apq0V+Z9WimOiRFYiZTgKnERyIak0cFmbRaVbdIHW4SUnyZ2EZ/ggFlvJ9r+88YnjZBSus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iqxSzYip; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iqxSzYip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772102820;
	bh=bYkpLYhhwj5B4o0/14vepvOL5dD82IQeKBivzobWYYA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iqxSzYipJgD9Hk27esWpkrwPH+zXqY0hF2hA5rLyyps9BIH/KzwmGxtBb0VrGQmMg
	 288eM6vpq5B6RFzUeJ5Zx0kxKdsWq957Rr7Xg68mVQAKtSAgjn8+UKfsV/+E7/5Uwl
	 BZwcqsjMfnGeVed+FEpxrmKnl3vLIMsA3WztcRI7382FOSHc3HIa4KRoOBdXhtfqS2
	 K4qFmDM7WpasHe0VO3ffZv94zsA0b7dI59rHZ12iR7H+ekI3S31peFo9l9shv4qBM8
	 /G11mz+tmyPn5lWkWKI/+Xs/ZfXtAmL3l8dUKoNdpk07dhpNIVyGrDFv5+VOydopbt
	 Y0//Qd3zDJeIA==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A65BE17E095E;
	Thu, 26 Feb 2026 11:47:00 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 26 Feb 2026 12:46:53 +0200
Subject: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
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

With the introduction of the RK3588 SoC, and RK3576 afterwards, two more
register blocks have been provided for the video decoder unit.

However, the binding does not properly describe the new hardware layout,
as it breaks the convention expecting the unit address to indicate the
start of the first register range, i.e. 'function' block is listed
before 'link' instead of the opposite.

Since the binding changes have been already released and a fix would
bring up an ABI break, mark the current 'reg-names' ordering as
deprecated and introduce an alternative 'link,function,cache' listing
which follows the address-based ordering according to the TRM.

Additionally, drop the 'reg' description items as the order is not fixed
anymore, while the information they offer is not very relevant anyway.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../devicetree/bindings/media/rockchip,vdec.yaml     | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 809fda45b3bd..c513b68d2c72 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -28,16 +28,20 @@ properties:
 
   reg:
     minItems: 1
-    items:
-      - description: The function configuration registers base
-      - description: The link table configuration registers base
-      - description: The cache configuration registers base
+    maxItems: 3
 
   reg-names:
-    items:
-      - const: function
-      - const: link
-      - const: cache
+    oneOf:
+      - items:
+          - const: link
+          - const: function
+          - const: cache
+      - items:
+          - const: function
+          - const: link
+          - const: cache
+        deprecated: true
+        description: Use link,function,cache block order instead.
 
   interrupts:
     maxItems: 1

-- 
2.52.0

