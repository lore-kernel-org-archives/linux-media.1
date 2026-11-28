Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859430;
	b=AALeD+IQoWgze6DgF2SibhqjTsElbKuq2QsunJCQWr4zD/HCxyY2VMchTNuEoSF5KlQk
	 b8HUSoR19lwM0g4zRVV3FRfSjIvrmoXnSRG9fLz1gLsd38x6H/UkzokYAgSBBp2/mBqkA
	 8wP2qjFPReLz6RpW0PUeBaTwmeNxbTtt1FlBEp4Tl9Cb4HD5sn/Rmz2i29Ddur41LtCEk
	 8kykfQlLJS94OB2lP6HmW1P6MsRHf2MT9p/MV6PJe/LW/klh21DmBV0L345PO4PoTx8MB
	 wgt9ICFNgzNrd4cxAILEvHSU1KdhqTcFT70XkfNsIm7cBYZI9Ioel79z1XP+Yk9PV+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859430;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=Mgp+MQekyGi7tJCQ+RIKGZme+41xxzdDoxvvENdB63Y=;
	b=feX6JGpLhic6J2i7rFwKg5dz4aY0GA+aD0wYppUI7jODRoElHR3H2BOejap0AEYr7Wk7
	 HVO+c9RjykvllZFH57LTLM91SkwZP50DQXs5GZ3MV1IKAGgXOX3mJQOO+yfAQGKgP0Tx+
	 kLoh0HR9wiznIKWcakXosEjspGCQT0FJ1S/AoU5q11KD/psM/ruWwM07OnIi1MoidDn64
	 GMZHCY8VnK/UtBV2rNTqtVZIO0XCrOgPc0QDRUWAPqVpdVL0vct0IEKDtikm2lT/Y3Ev1
	 JZRszLhEUqC+19SprqQKNDohe+/9sCN/oHoVmEdULDDqs5k2crJftYApadsx7gvERJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=lMAhhH+o;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFFA606A31C;
	Sat, 28 Nov 2026 09:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCFFA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=lMAhhH+o
X-UUID: 1f046f6eeb1111f1b9cf3d4034dccee2-20261128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Mgp+MQekyGi7tJCQ+RIKGZme+41xxzdDoxvvENdB63Y=;
	b=lMAhhH+o+0H+m8gr8xVEIFGMIgrNZuyY8Y2RD05Bss4ek9wyAe0qY8dZfVJ65nSjfBYaP+B5OYiY2OEh4nR130K63bnH5kQ39pC+x12cTCICnyZb4wr20kUlpZy3Z3x+mULolLAlfQa3MXdOgvNiTo5oLL2fPVGOJmX1AhS9K3E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:a210f672-7f6a-4e55-88d4-135b7a8f30e8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:32e07531-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1f046f6eeb1111f1b9cf3d4034dccee2-20261128
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 977939502; Sat, 28 Nov 2026 17:50:19 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 28 Nov 2026 17:50:17 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Sat, 28 Nov 2026 17:50:16 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Subject: [PATCH v13 01/10] dt-bindings: media: mediatek: decoder: Add MT8189 mediatek,vcodec-decoder
Date: Sat, 28 Nov 2026 17:50:05 +0800
Message-ID: <20261128095014.3128536-2-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128095014.3128536-1-kyrie.wu@mediatek.com>
References: <20261128095014.3128536-1-kyrie.wu@mediatek.com>
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

Add compatible for video decoder on MT8189 platform. Compared with
former ICs, the MT8189 decoder use iommu to instead of smmu, and
use scp architecture, the frequency is only 406MHZ, and cannot reach
more than 700MHZ. It uses two clocks named soc-vdec and vdec. At the
same time, the decoder supports the vp9 decoding protocol for the first
time in single IC.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../media/mediatek,vcodec-subdev-decoder.yaml | 38 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index 90722552d..5e8a9e11d 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -76,6 +76,7 @@ properties:
       - mediatek,mt8192-vcodec-dec
       - mediatek,mt8186-vcodec-dec
       - mediatek,mt8188-vcodec-dec
+      - mediatek,mt8189-vcodec-dec
       - mediatek,mt8195-vcodec-dec
       - mediatek,mt8196-vcodec-dec
 
@@ -138,7 +139,7 @@ patternProperties:
           Refer to bindings/iommu/mediatek,iommu.yaml.
 
       clocks:
-        minItems: 4
+        minItems: 2
         maxItems: 5
 
       clock-names:
@@ -163,6 +164,11 @@ patternProperties:
               - const: lat
               - const: top
 
+          - description: MT8189 clocks
+            items:
+              - const: soc-vdec
+              - const: vdec
+
       assigned-clocks:
         maxItems: 1
 
@@ -202,6 +208,35 @@ required:
   - ranges
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8189-vcodec-dec
+
+    then:
+      patternProperties:
+        '^video-codec@[0-9a-f]+$':
+          properties:
+            clocks:
+              minItems: 2
+              maxItems: 2
+
+            clock-names:
+              items:
+                - const: soc-vdec
+                - const: vdec
+
+    else:
+      patternProperties:
+        '^video-codec@[0-9a-f]+$':
+          properties:
+            clocks:
+              minItems: 4
+
+            clock-names:
+              minItems: 4
+
   - if:
       properties:
         compatible:
@@ -241,6 +276,7 @@ allOf:
               - mediatek,mt8192-vcodec-dec
               - mediatek,mt8186-vcodec-dec
               - mediatek,mt8188-vcodec-dec
+              - mediatek,mt8189-vcodec-dec
               - mediatek,mt8195-vcodec-dec
 
     then:
-- 
2.51.0.windows.2

