Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587397;
	b=DtjEAXWgTkCwjLkajUUNHs6u6vi9DFuXTVMOhasqafrtkRoJ5LzmTHi05bAPOJlC18Vq
	 4JAdeISN9S0uBAVuUzHor6t5g440qqy7qgj6ayqr3PixKDR891S78wyyfXx42TmpM354q
	 tmat9NzBMIWYwSnWWpTvC8nt1JWfrKGV264DssnoCfBPYzCZoWXuUeDKvKZf86vyI8Zi0
	 hwdJILslgqx5pR17YiKsALKp+v68A0r+mZk9CL4ds8ZkGC02ZaOOmg/+UJGwE+432qKwS
	 ds+gR/Nv3kC45MXk5pBb0dGtu7l2hK9Hu+NuJns5YHCUzru2roNDkNW5xbl6TCvX3iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587397;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=+knOiHqZcONjVV8iMyBXY+v3ChEvFqVMtV4ztBjfQjM=;
	b=D6RKRQjXdFyK3xpmueQCJPDoqGNRbbbJ8GlsKZ8taSlKqqhBllhdG7FcArBrhVGy4XXJ
	 Zqkbd2j0R+I+ww6p29PPQpiYk1qjQmYmkLn/aV3+ZrvP7tTN8tCJsXy5jinaIWi4K4c83
	 pjO9w4sUTijzGCHgmiEKR35xAT3cpGG8+r+ocmq6QOBNANDCRHXGZsXD6G60OkCYiUl53
	 xmp48+I3xTnb6ekryx433H68eCbzkxVacYfM3Og/oPZM2puVS+u61v55LSiyuX909dmAg
	 nWAl/8ahbIoNJ0I5mqlNlYEovicRtFFU+IuWYal7iYQblDWrfPZrSe3yk/J3klFNK+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Q5phc6yk;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1875606B3F2;
	Wed, 25 Nov 2026 06:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1875606B3F2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Q5phc6yk
X-UUID: c10a9e40e89711f1b1788b6acf885367-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+knOiHqZcONjVV8iMyBXY+v3ChEvFqVMtV4ztBjfQjM=;
	b=Q5phc6ykhJ0MS1eemdt/9DD3nm9fVXEl4M1hLZ9tKMUsRVTqqfgZ+P/6S6P/r5z4c1KCYE8CLUUhVM0GF9amB9zxhSg3sK6IfDnWSb7vn6Fyq8qpP0rY+NYRJSv+NgoSU+mpQyWREmI8/i9B+CugJYg2K5npZO8ZX8mKksdfH9Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:45f99c8d-7879-41a2-826e-9c5f85b4069c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:07145131-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c10a9e40e89711f1b1788b6acf885367-20261125
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1035769348; Wed, 25 Nov 2026 14:16:30 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:16:29 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:16:29 +0800
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
Subject: [PATCH v20 09/15] dt-bindings: mfd: syscon: Add MT8196 JPEG SMMU compatible
Date: Wed, 25 Nov 2026 14:16:12 +0800
Message-ID: <20261125061618.2544386-10-kyrie.wu@mediatek.com>
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

Add the MT8196 JPEG SMMU configuration compatible to the common syscon
binding. JPEG decoder and encoder cores use this shared register block
to configure their SMMU stream IDs through its GUSER_ID fields.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 MAINTAINERS                                       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 80ff0e1ca..cd22af4d4 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -91,6 +91,7 @@ properties:
               - mediatek,mt8135-pctl-a-syscfg
               - mediatek,mt8135-pctl-b-syscfg
               - mediatek,mt8173-pctl-a-syscfg
+              - mediatek,mt8196-jpeg-smmu
               - mediatek,mt8365-infracfg-nao
               - mediatek,mt8365-syscfg
               - microchip,lan966x-cpu-syscon
diff --git a/MAINTAINERS b/MAINTAINERS
index 742c4e6b2..6690f1efa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17063,6 +17063,7 @@ F:	include/dt-bindings/memory/mt*-port.h
 MEDIATEK JPEG DRIVER
 M:	Bin Liu <bin.liu@mediatek.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/media/mediatek,mt8195-jpeg*.yaml
 F:	Documentation/devicetree/bindings/media/mediatek-jpeg-*.yaml
 F:	drivers/media/platform/mediatek/jpeg/
 
-- 
2.51.0.windows.2

