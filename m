Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C8534D91C;
	Thu, 26 Mar 2026 23:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566602; cv=none; b=nesix8FU7fb3uLmtM2YlHe1v7BQw4d7i0OK9mxXYTiSZGx4N8eVigkTx8cICXOsv2Ez0aOOkWRF7u1uwmdfnF6E9y6OdiBNLfZdxL45y0pLNcZgYSCNgS5YFbmbPF5HpS30rbO6Ppx7aShYm+CF9HZqLeAvr75NzljC63zFM22M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566602; c=relaxed/simple;
	bh=O6x7E60uogGixLDyJQPgrKYnDUinoJ2tUqk42mMfEko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mfk6m31ej/yO+f6tA6aLa5Ak8XTLDWTeqEzc2lPErtqsAnClNKdYiJ6Fn9uidslPsEr10xAs9+IlmPbfJtsVQwnK3gTpHaJCWfhKD+Ig8GIz4la1nUjT7I+7BHtfQ3ngk4iM7GwRXFg0Bs/jOmYiNRALveofsYKvY1Xse6VKVb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKsB20b6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKsB20b6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C388CC19424;
	Thu, 26 Mar 2026 23:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774566601;
	bh=O6x7E60uogGixLDyJQPgrKYnDUinoJ2tUqk42mMfEko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mKsB20b69PEZUZvlMKYSEd/J7jfYSFyqVWEX5EApfCK2DBHQusAnPLcBdzd3g7ZaL
	 n+QAeQTRVOHGkSmSWGraaQwUCRBkayOQNLQxYtMoTS3TbUscoiN4H+nI+RbtKLyq1y
	 3/Lk4jbkEiglFx9K30km6vZC83SDuDCIQ6HkOUNnTXYXmj3gfv9LSg0oJGZMRwBGWs
	 5bIql8PwnYbWQe8a3Vn4F5A0Xd/1FXBW3/EgpBGDzedyCj38soOaADsP9GJTzAOT88
	 6H8f6kZ/YcfKYceDbOfg7fl30JrS5X9Y2Kw05yS27CLHHP80hFR5d20mOosJWeqi5H
	 N78+NdrIacLow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A846910AB82E;
	Thu, 26 Mar 2026 23:10:01 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 27 Mar 2026 00:10:00 +0100
Subject: [PATCH v4 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3588 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-rk3588-csi2rx-v4-1-81c6bcfefa63@collabora.com>
References: <20260305-rk3588-csi2rx-v4-0-81c6bcfefa63@collabora.com>
In-Reply-To: <20260305-rk3588-csi2rx-v4-0-81c6bcfefa63@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774566600; l=1182;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=oSB0pcf7VsFDNyisKIcEiS+NR+CwirDnVBZgZpwFUp0=;
 b=4PvhVKCWiTn8YBw/fj9kmxZ1fmvqQSaDWZoo7ahk0Hb5esV4DhhBKqhn6ePC5EWouGNucAFwW
 1nj+ZEr/IYtANY1CaAEY6OGkW07Fk1FY3NQo40AE2MV/iVjCeGgQLxR
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
the RK3568.
Introduce a list of compatible variants and add the RK3588 variant to
it.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 4ac4a3b6f406..fbcf28e9e1da 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -16,9 +16,14 @@ description:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx93-mipi-csi2
-      - rockchip,rk3568-mipi-csi2
+    oneOf:
+      - enum:
+          - fsl,imx93-mipi-csi2
+          - rockchip,rk3568-mipi-csi2
+      - items:
+          - enum:
+              - rockchip,rk3588-mipi-csi2
+          - const: rockchip,rk3568-mipi-csi2
 
   reg:
     maxItems: 1

-- 
2.39.5


