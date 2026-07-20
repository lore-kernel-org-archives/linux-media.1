Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B4A282F35;
	Mon, 20 Jul 2026 06:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784528941; cv=none; b=mI5BRcfD7drCAIEcJkXyYs16jrCyzkWjKt0oteZ95HPCb/tRTbqbHGb4Knfjf+bk7NQ2PfEvJA/UttTkKkGzjG+r4oF261we943OP/mXQ4BJXNPUDsF9cTV5uTM6AJDf3CPEh2K/HkTEtKqChFSuJ/Fybd9TlHqwOGgPA8NJQFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784528941; c=relaxed/simple;
	bh=QRB6AUGP0AnYvZvzS5EUCMy0TQx51aB+5NxigtrLZ4c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N9lQaAemhkvFBBO4aZEDjngRinXuPm6dSv2BRu14adxaoBIcyxL6Wh5FSVOhOJ8v2S6Wrug6sWhz0PiTCrOCUM20j2/oAxJr6XdkRv6it2ztkCwO5Ey2yeF9E6fUuWENa2/KVkbGmMlNxQDjcxFHJNXQ20NUHu6mL02tsqTETiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ecGkTEpK; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ecGkTEpK"
X-UUID: 47111620840411f1b1788b6acf885367-20260720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XLBl84SAb+/sFEUEVdMtuOLokzwDCeQJfG1uziCXYEo=;
	b=ecGkTEpKdDNtvU/Yb0Y/qV8zw34Q7S4JjhOBxX98mIpxlUiKttPNIrLExtGE6dk9Nlyw9QmMqoocMGFPCvP/M9bEMCuB3nqVsNfYBy+fMXrJvR1QHxDwYOEWl1WH3bNmAEQy3chKhF1ZhafnHwe44sCF1Nr6U2S8c2RRBUy6X9o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:59754411-5618-40e4-903f-7247ec40b214,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:8a735a6,CLOUDID:3744793f-46cf-453a-bd84-ad9fc7cb0e8c,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|100|102|156,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 47111620840411f1b1788b6acf885367-20260720
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 148603672; Mon, 20 Jul 2026 14:28:53 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 20 Jul 2026 14:28:51 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 20 Jul 2026 14:28:51 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <nicolas@ndufresne.ca>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, Jianhua Lin <jianhua.lin@mediatek.com>
Subject: [PATCH v10 1/3] dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible string
Date: Mon, 20 Jul 2026 14:28:27 +0800
Message-ID: <20260720062829.7343-2-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260720062829.7343-1-jianhua.lin@mediatek.com>
References: <20260720062829.7343-1-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add the compatible string for the JPEG decoder block found in the
MediaTek MT8189 SoC.

Compared to previous generation ICs, the MT8189 JPEG decoder requires
34-bit IOVA address space support and only needs a single clock
("jpgdec") instead of two. Therefore, it is added as a standalone
compatible string without falling back to older SoCs.

Update the binding schema to include the new compatible string and add
an `allOf` block with conditional checks. This enforces the single clock
requirement for MT8189 while preserving the two-clock requirement
("jpgdec-smi", "jpgdec") for older SoCs.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 .../bindings/media/mediatek-jpeg-decoder.yaml | 50 ++++++++++++++++---
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
index a4aacd3eb189..654360c19c48 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -15,10 +15,10 @@ description: |-
 properties:
   compatible:
     oneOf:
-      - items:
-          - enum:
-              - mediatek,mt8173-jpgdec
-              - mediatek,mt2701-jpgdec
+      - enum:
+          - mediatek,mt2701-jpgdec
+          - mediatek,mt8173-jpgdec
+          - mediatek,mt8189-jpgdec
       - items:
           - enum:
               - mediatek,mt7623-jpgdec
@@ -32,13 +32,16 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 1
     maxItems: 2
-    minItems: 2
 
   clock-names:
-    items:
-      - const: jpgdec-smi
-      - const: jpgdec
+    oneOf:
+      - items:
+          - const: jpgdec
+      - items:
+          - const: jpgdec-smi
+          - const: jpgdec
 
   power-domains:
     maxItems: 1
@@ -51,6 +54,15 @@ properties:
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
       Ports are according to the HW.
 
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      A phandle to the local arbiter (SMI LARB) node. This explicitly
+      describes the hardware topology where the JPEG block is connected
+      to a dedicated SMI LARB for memory bandwidth arbitration. It is
+      required to accurately represent the hardware connection independently
+      of the IOMMU.
+
 required:
   - compatible
   - reg
@@ -60,6 +72,28 @@ required:
   - power-domains
   - iommus
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8189-jpgdec
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+      required:
+        - mediatek,larb
+    else:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+        mediatek,larb: false
+
 additionalProperties: false
 
 examples:
-- 
2.45.2

