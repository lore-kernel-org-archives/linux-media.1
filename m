Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852108;
	b=mGbEvjxGcYzaFioWHGyt5QPt/WRJB4aySHO2Yc/6ddemXGfq8R9jOuVv/LotPOYZE78Z
	 PF7OPoPdWnQdcOBMsex10F+W4UeQYbhEYbYdKPM59Ny+/xd5oGl5WdoqZqGDBmE1GrsRh
	 HojTAVit4aH0wGo7PbSaEZfn/Wtg0ptSfnPlBQeI9+jj3B+YStwTLybdaGR+3QgEFrGt6
	 x4e9yxM2Hw+VFI4vPSjHA3X8wVgyadM/AJskBNVJbOEvKupMXZYA8sqHeveOR3oPfnjxC
	 /VsQBJc41r5J/kCU0+A6WBXMtbUuD+kdgmGvGgrRHseiNlgvc1ca1UqlmsWs32nPY8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852108;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=poQsy/lXFWAF6nNOJuV5K4qD75e3XJYxz/ewBIIcjdI=;
	b=PVFXlauSVY1BcIG3maumja55tLjgl+LJpRz3K0w/QyBn4h8ggXDt2/DNOYjauWc9d1Au
	 eJumcL7ZM3nrgxociGDyyQp1xIMHLUi/6vbm12lA7oQGYKHK2tAdBY/C2/qPWwnxoGOT3
	 BvmJMmGihHc9vCk2foZcR8aWPwnJAGGB6uiFZBbKLGvMBmHDBFSZqLdoQrbndlwDC+0z6
	 PbkbChKFnR1UftzJZwhoil1mVBr0Az+QpSvNj9pHj04AP46RexIybr9zA2Lb9tbiOl+rU
	 nWlFfSqNAETCRwEhT0Kah7+wHwWp6tNp4ZM4njmBn15M3QlN0OtRr0iSG5KEZSt237A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="H2ukG/P2";
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE98606A6B3;
	Sat, 28 Nov 2026 07:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CE98606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=H2ukG/P2
X-UUID: 13467444eb0011f1a7aecdb2598be72c-20261128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=poQsy/lXFWAF6nNOJuV5K4qD75e3XJYxz/ewBIIcjdI=;
	b=H2ukG/P2Tp9e9VW6/A+lT1oEjqTPbQU9tuKI1tL3v5JlDnJb4Vp3RaoTmWisA2nfx7/IsnMXLM9mIWZhTySSSMzZBHdWZzzvxJ6Hlk2hSE9eGy9TwveyEKk86i+/RlSbT0E4gNuXz7W8QoJamDnu7pIu9SYe+0BnU7SHeXa68bY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:c4e5ef10-842c-4bdb-bdc7-1a2ce08a6991,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:74cd2c1a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 13467444eb0011f1a7aecdb2598be72c-20261128
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1162700556; Sat, 28 Nov 2026 15:48:18 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 28 Nov 2026 15:48:16 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Sat, 28 Nov 2026 15:48:15 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Ricardo Ribalda
	<ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, Haoxiang Li
	<haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa
	<tfiga@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Qianfeng Rong
	<rongqianfeng@vivo.com>, Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v10 08/14] media: dt-bindings: mediatek,vcodec-subdev-decoder: Add MT8196
Date: Sat, 28 Nov 2026 15:47:54 +0800
Message-ID: <20261128074800.3108429-9-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128074800.3108429-1-kyrie.wu@mediatek.com>
References: <20261128074800.3108429-1-kyrie.wu@mediatek.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Compared to previous ICs, the MT8196 supports a 10-bit decoder
and has a decoding capability of 4K@120fps. It also supports
36-bit DRAM IOVA address and Video Power Control to optimize
bandwidth and voltage usage.

MT8196 uses VCP to run the decoder firmware, so require mediatek,vcp
for MT8196 and move the mediatek,scp requirement into the condition
for the existing SoCs.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../media/mediatek,vcodec-subdev-decoder.yaml | 57 ++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index 6033ecffd..90722552d 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -64,6 +64,7 @@ description: |
   it doesn't have a dedicated interrupt.
 
   The used video decoding pipeline architecture across various Mediatek SoC:
+    MT8196: LAT + Core
     MT8195: LAT-SoC + LAT + Core
     MT8192: LAT + Core
     MT8188: LAT + Core
@@ -76,6 +77,7 @@ properties:
       - mediatek,mt8186-vcodec-dec
       - mediatek,mt8188-vcodec-dec
       - mediatek,mt8195-vcodec-dec
+      - mediatek,mt8196-vcodec-dec
 
   reg:
     minItems: 1
@@ -96,6 +98,11 @@ properties:
       The node of system control processor (SCP), using
       the remoteproc & rpmsg framework.
 
+  mediatek,vcp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Video Companion Processor (VCP) that runs the
+      video decoder firmware.
+
   "#address-cells":
     const: 2
 
@@ -192,9 +199,57 @@ required:
   - compatible
   - reg
   - iommus
-  - mediatek,scp
   - ranges
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8196-vcodec-dec
+
+    then:
+      required:
+        - mediatek,vcp
+
+      properties:
+        mediatek,scp: false
+
+      patternProperties:
+        '^video-codec@[0-9a-f]+$':
+          properties:
+            compatible:
+              enum:
+                - mediatek,mtk-vcodec-core
+                - mediatek,mtk-vcodec-lat
+
+            clocks:
+              maxItems: 4
+
+            clock-names:
+              items:
+                - const: sel
+                - const: vdec
+                - const: lat
+                - const: top
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8192-vcodec-dec
+              - mediatek,mt8186-vcodec-dec
+              - mediatek,mt8188-vcodec-dec
+              - mediatek,mt8195-vcodec-dec
+
+    then:
+      required:
+        - mediatek,scp
+
+      properties:
+        mediatek,vcp: false
+
 additionalProperties: false
 
 examples:
-- 
2.51.0.windows.2

