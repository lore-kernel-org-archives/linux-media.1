Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587400;
	b=mBDB58FB5oXSdzF8kP9rl3dFHmlz6BKKm8G4rzmVjQ78CPlh8Xt27kK8muSdUsi8Tljd
	 DtzCXUnmN96E07udkb8r87HhaKiQp9vJ6Frob44euWddAF3twydSEv26IT8qkVkPOVpLE
	 j2EaN66lWgYulKckg7ZF5q6WHp9vorZQ6cBHC/YuXLbEMZrGZMbaZUvS98BduhiBbjqMq
	 Ug7BpylhLv4N5325ll9h3i89V1orIkIPJYxMNjS5IoVTSU6uC62bcq6xNuagkS7oQuG6R
	 fQeLfJjn+5aJr32MmcOxHCk67jhiIF74YHn0Jnmw/kkVOJHgm3amKrPFdTTQK4J/svQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587400;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=ic0glzATr1orwxg9sAwpihro0jBOD1YeWa7mgA88vuI=;
	b=BI54NWDqItKhA4OgAiM4Gt11tAhTWgPC4nSOcg2IsP476y+nvmLdxH0PGeXuc0PPAviq
	 7sv7+bqACgDrFyMDuAnQD50L4BlQAHWc4J0QSSZmFuw5X4p2Uqqv0V+zTk23WygZEYhuF
	 c7MSeFggm35lIxKSuj6JXJsEQit2wM3YTBRFmjx+g+Tn+4PP8E7ySpVYEqjfCJoXitnkC
	 wn1OOYA6flKyN+wcQS85uFUDHPDIu2Lc/PJUhZtqIU9JWDHWRk/cjzuWm20cmxyIerAgK
	 fo2K66p5V4WyNJSYr10FWUYkviQPiBhM0ZY2yoNqbIDPMU6i4UdPUg2m0Fc2DxBSngA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=dnKK3myL;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97886076154;
	Wed, 25 Nov 2026 06:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B97886076154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=dnKK3myL
X-UUID: c2ccb83ae89711f1b1788b6acf885367-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ic0glzATr1orwxg9sAwpihro0jBOD1YeWa7mgA88vuI=;
	b=dnKK3myLgtb5NwAS054P65hItCDC5w2vUKFvlo5vPwJmfO0s13K+XVZuldA2zNsIDgxGpWxtEBmONdNG8dYPB8rcu5bQzambABSOU/hkCpuW1YRXvJMMKa+FOmJrWoMwyAC2U3+n+ujB+IAj2dAxu6He77yTplWVcRrGNECizeE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:66bc7fe6-fab1-42c9-8f3b-bf28307a52b0,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:d9f9f2bd-9e04-43bc-9c07-a2d8d8315d7e,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c2ccb83ae89711f1b1788b6acf885367-20261125
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 287164332; Wed, 25 Nov 2026 14:16:33 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:16:31 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:16:31 +0800
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
Subject: [PATCH v20 11/15] dt-bindings: media: mediatek,jpeg: Add MT8196 decoder SMMU configuration
Date: Wed, 25 Nov 2026 14:16:14 +0800
Message-ID: <20261125061618.2544386-12-kyrie.wu@mediatek.com>
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
configuration syscon used to program a decoder core's GUSER_ID fields.
Require the property for MT8196 decoder cores.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../bindings/media/mediatek,mt8195-jpegdec.yaml  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
index 28a9a9bfd..b1dccc3c8 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
@@ -73,6 +73,22 @@ patternProperties:
       power-domains:
         maxItems: 1
 
+      mediatek,smmu-config:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          Phandle to the MT8196 JPEG SMMU configuration syscon used to
+          program this decoder's GUSER_ID fields.
+
+    allOf:
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: mediatek,mt8196-jpgdec-hw
+        then:
+          required:
+            - mediatek,smmu-config
+
     required:
       - compatible
       - reg
-- 
2.51.0.windows.2

