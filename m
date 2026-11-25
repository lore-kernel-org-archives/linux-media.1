Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587402;
	b=D9WPOw0vcvEFBwe2b3fjcOhpv0NJDiyQTUWIwr/pT7FgpMg3rZikl6gQKHcSgQ+FtsZK
	 UOKR788dMxgHY3QirmUgd3397oE9vLV9BeKnu/TGCPGmNhdO5NhstjbSxNy5UgwmHomGE
	 hINtZjJE/0P/jg/NA3Ir9eojwWN4HMsomYCepMKc+JgcDJOZNKTW+ZFb5Teeocq6gu6uD
	 XVgQkPucZz9uKu1qC30JTmLlsKwUd0iJII0cjk9tB7eNq+8Yo9CTV1PmfWqCN1Z1F/r9R
	 R2C0dU2SUJMeputuvjF8bhHO3q0a8wTo59cZ/0tSPojWFnqkb1ckVqRZSNsx8chsT7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587402;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=y3zhTjpPZpXjLDk8y+TcI0f+3J+puzNWogbkrOaTR3c=;
	b=xDtUDUF/yyLAvzaWa1TsbM99sjDBOn+gLhZ/bBYlEwgVZWlJ3ZLn0OJieHy+RlsehiAU
	 O44lWpQNJ1UJNZB9xnr+6opp9kSiOi49wyIWc0FEl5u3fgLNZDxAFrizSEFsZlpFSXyf+
	 l7Ae9N/gkI6Slr1ebZQeg0+VtbGn6whmYIeVvVvw0WEBYudQxlmP+sI8/+yhWS+tLnzFw
	 d9GnFIYsOC2277skTmAfxBUHj2tMJNTCXSGO4HGMOMkyh1R8Xbqa3dxRH8N5MPYK6ABYG
	 gNzk6J3U5tn0tDgW9CWWN19cVbi6qQVj5OFh+CGWx0Vc5EYfXccDoMkvx0KW2VLwPaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=df1wUcnN;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E056077BC6;
	Wed, 25 Nov 2026 06:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3E056077BC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=df1wUcnN
X-UUID: c40466bce89711f1b1788b6acf885367-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=y3zhTjpPZpXjLDk8y+TcI0f+3J+puzNWogbkrOaTR3c=;
	b=df1wUcnNv4n870bwSxQcqVvUg5N19NAkavWXCfX/KSBRmQtwnRA5kldzltOY8L0xhYpbM1cVxJBXbMM/20vSw04N9vB1A4vPP6c4q1MOsbMtLpxTHMmsd9oqFui3clqEGHScZZ2bNtegFhn39EWwjSrGy3t1mHakjj5KSE5H+2o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:33d0351c-ce89-4d1c-b7b5-3547384aa716,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:c8bc081a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c40466bce89711f1b1788b6acf885367-20261125
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 26215831; Wed, 25 Nov 2026 14:16:35 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:16:34 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:16:33 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, Hans Verkuil
	<hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: [PATCH v20 13/15] dt-bindings: media: mediatek,jpeg: Add MT8196 encoder SMMU configuration
Date: Wed, 25 Nov 2026 14:16:16 +0800
Message-ID: <20261125061618.2544386-14-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125061618.2544386-1-kyrie.wu@mediatek.com>
References: <20261125061618.2544386-1-kyrie.wu@mediatek.com>
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

Describe the mediatek,smmu-config phandle to the MT8196 JPEG SMMU
configuration syscon used to program an encoder core's GUSER_ID fields.
Require the property for MT8196 encoder cores.

Document SMMU stream IDs for MT8196 in the parent and child iommus
descriptions while retaining the MT8195 hardware master-port description.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../media/mediatek,mt8195-jpegenc.yaml        | 31 ++++++++++++++++---
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
index e2d772ea0..46597003e 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
@@ -24,9 +24,11 @@ properties:
   iommus:
     maxItems: 4
     description:
-      Points to the respective IOMMU block with master port as argument, see
-      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
-      Ports are according to the HW.
+      Phandles to the respective IOMMU blocks. For MT8195, the argument is
+      a hardware master port; see
+      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml.
+      For MT8196, the argument is an SMMU stream ID; see
+      Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml.
 
   "#address-cells":
     const: 2
@@ -57,8 +59,11 @@ patternProperties:
         minItems: 1
         maxItems: 32
         description:
-          List of the hardware port in respective IOMMU block for current Socs.
-          Refer to bindings/iommu/mediatek,iommu.yaml.
+          Phandles to the respective IOMMU blocks. For MT8195, the argument is
+          a hardware master port; see
+          Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml.
+          For MT8196, the argument is an SMMU stream ID; see
+          Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml.
 
       interrupts:
         maxItems: 1
@@ -73,6 +78,22 @@ patternProperties:
       power-domains:
         maxItems: 1
 
+      mediatek,smmu-config:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          Phandle to the MT8196 JPEG SMMU configuration syscon used to
+          program this encoder's GUSER_ID fields.
+
+    allOf:
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: mediatek,mt8196-jpgenc-hw
+        then:
+          required:
+            - mediatek,smmu-config
+
     required:
       - compatible
       - reg
-- 
2.51.0.windows.2

