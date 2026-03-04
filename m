Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FB038236A;
	Wed,  4 Mar 2026 21:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772658086; cv=none; b=bvRod+hHH+CGd06JP7I/6tSf4tn/4Go2WasRKwuXlqOm60E9j1VdopqTjZHCFtbp5ebKbJEtYhgu57AXAx1Yw6PvyqhdyTocRCGqE6ke0ulWRVH5/F20Lxc5kCx4xMddHL5Y+M99oyN+iyBYT6xc8utVzf8rw4UU2CIiMLe+77M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772658086; c=relaxed/simple;
	bh=W18nID6Ds1IUWT7XQqyotdnw5GBHgdabgbB7Y0/D6ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HSI5SVWiM05yTyOATRgEKh4zqU8KYCvO5Pc4bMrcZMLI02+97KLx/TA1THiV2f6SExoTaKOEP/BwUuIiZjtK9nWUTiCxHcDpJZLXgbDs3LgvDWyJKkWaUDyNVFLsspbQ0EQxZcd91+RIflMqQ6EW0D/2bdxMo4D/Ly6QM2aDCfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZTaEiEib; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZTaEiEib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772658082;
	bh=W18nID6Ds1IUWT7XQqyotdnw5GBHgdabgbB7Y0/D6ts=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZTaEiEib96XOisoUpNam8xd6cwaQ940kp9/BrUyNgvG4tdjK5o8ALs0V84yJiISKG
	 TpfI3JE8tif2OcO5KxjoyJfCV9lnupWKy+G5KCJtJSlY2pWH8DSk3RwGkIIEQ0pzJI
	 OJFjzPeIOcq9BW1EvblTSC4olb8koaN+dj3oKXFW3rcOlzDs59j/KRVZssyCmug64j
	 KbtAqHtVLM0oxoXOVd3rEVh9qY+ekPLTefNsW2v6kqrdKdkXqQ0ruRSInHgBZFoIan
	 27tEBhP8NKWn+k/mFsv0vtb+KG3Ed7Ew4XisfJqcN/uaLHBFxfipgnfHhK/Zu3Z/4R
	 jhrfjXQVZuFng==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BFEBB17E1005;
	Wed,  4 Mar 2026 22:01:22 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 04 Mar 2026 23:00:40 +0200
Subject: [PATCH v5 1/4] media: dt-bindings: rockchip,vdec: Mark reg-names
 required for RK35{76,88}
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-vdec-reg-order-rk3576-v5-1-7006fad42c3a@collabora.com>
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
 linux-media@vger.kernel.org, Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.3

The Rockchip Video Decoder driver expects reg-names to be mandatory for
RK3576 and RK3588 SoCs, however the binding does not currently require
the use of them.

As a consequence, driver would fail to probe with a hypothetical
devicetree that doesn't provide the reg-names for these SoCs, but which
is otherwise a perfectly valid DT from the binding perspective.

Update the binding and make reg-names required for the aforementioned
SoCs.  While this change introduces an ABI break, the expected impact on
potential users would be minimal, if any, since the old SoCs are
unaffected, while the video decoder support for these newer variants in
mainline driver and devicetrees hasn't been released yet.

Moreover, this is also a prerequisite for a subsequent binding update
introducing an alternative reg-names order, according to the
address-based listing in the vendor's datasheet.

Reported-by: Conor Dooley <conor@kernel.org>
Closes: https://lore.kernel.org/all/20260227-urologist-gratitude-7984733f2d41@spud/
Fixes: c6ffb7e1fb90 ("media: dt-bindings: rockchip: Document RK3588 Video Decoder bindings")
Fixes: a5c4a6526476 ("media: dt-bindings: rockchip: Add RK3576 Video Decoder bindings")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 809fda45b3bd..dc4ebb50b316 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -123,6 +123,8 @@ allOf:
           minItems: 5
         reset-names:
           minItems: 5
+      required:
+        - reg-names
     else:
       properties:
         reg:

-- 
2.52.0

