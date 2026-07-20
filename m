Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558A138C2C3;
	Mon, 20 Jul 2026 06:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784528942; cv=none; b=EOEDwPKJwuwNZAQtwpehGV5IICD+fxbnYHVn5rD6lnTz0/h99+cs6t/L3fx5J5kzDjGiFNV/4wYxZauYqJBa2xUid8RrWaPGbOTrB/AP7P+pFb/4nw5vELIp4ebfLwZULzwl/dtNaUzLzJKMy0sWwe6lRgPPRBJ8m6mVR3/48kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784528942; c=relaxed/simple;
	bh=sOG/hDeXSZl2xg0PdJ+k9HPR2DEaQXu61QiP957upro=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ieyUJ6uhgbZUBq2O4qCXF2suhRzrzj9MAp8scpHpRmmCg0H+cZzGsbIhKCAwf5N1I1TVp1Is7uKHN3iQXeBoKio3H4SaIs78fCNgainCMKxFqtzPcuXhDnxsELGrcgpPfQJtFvaO+iRe4fAc6+zM3LkayvcI90fsWgl6Kv0ymco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=LCnVZlzH; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LCnVZlzH"
X-UUID: 468fcb92840411f18dc8c9802ae25ab1-20260720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bw6LccrRBPlUW+7QaAnRSbqbZZv/hGo7noV+T05D1co=;
	b=LCnVZlzHkO1ASerEna2KNMmbpSw3cGGQ4xli8hnXlrJZOKeCxpGIbCB2aieyBdXOzO7fxBttw2ve5IQmiEdK289m+zEYRqmVf+ON8mjs8WMbipUIOp0OKHlfQ2FUY5Yv+ojFdRrmB4zD5k55mC/FePEPcVBS5w9WAPgHlv8+moo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:a70b1d68-0633-4047-ae39-74e62010b738,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:8a735a6,CLOUDID:30f5af5f-762a-4584-baab-4eebe609beea,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 468fcb92840411f18dc8c9802ae25ab1-20260720
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 36269864; Mon, 20 Jul 2026 14:28:52 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 20 Jul 2026 14:28:50 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 20 Jul 2026 14:28:50 +0800
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
Subject: [PATCH v10 0/3] Mediatek MT8189 JPEG support
Date: Mon, 20 Jul 2026 14:28:26 +0800
Message-ID: <20260720062829.7343-1-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This series is based on linux-next tag next-20260707.

This series depends on commit 7560349ee0d9 ("media: mediatek: jpeg:
support 34bits"), which introduced the `support_34bit` field in struct
mtk_jpeg_variant. That commit has already been merged via the media
tree and is present in linux-next as of next-20260707.

Changes compared with v9:
- Patches 1/3 & 2/3 (dt-bindings: decoder & encoder):
  - Explicitly set `mediatek,larb: false` in the `else` branch of
    the `allOf` block for older SoCs to prevent incorrect configuration
    and ensure backward compatibility.

Changes compared with v8:
- Patches 1/3 & 2/3 (dt-bindings: decoder & encoder):
  - Expand the description of the `mediatek,larb` property to explicitly
    explain its necessity for accurately describing the hardware topology
    (SMI LARB connection for memory bandwidth arbitration), independent
    of the IOMMU driver's implicit handling.

Changes compared with v7:
- Patches 1/3 (dt-bindings: decoder):
  - In the allOf constraints, only keep maxItems: 1 in the then 
    branch and minItems: 2 in the else branch; remove duplicated
    constraints already defined at the top level

Changes compared with v6:
- Patches 1/3 (dt-bindings: decoder):
  update the existing `allOf` condition for mediatek,mt8189-jpgdec to
  make the 'mediatek,larb' property strictly required for MT8189 SoC.
- Patches 2/3 (dt-bindings: encoder):
  Add an `allOf` condition to enforce that the `mediatek,larb` property
  is strictly required when the compatible string contains
  mediatek,mt8189-jpgenc.

Changes compared with v5:
- Patches 1/3 (dt-bindings: decoder):
  - Drop top-level minItems/maxItems for clock-names per Krzysztof's
    review.
  - Refine allOf block to strictly enforce clock constraints.

Changes compared with v4:
- Refines the device tree bindings for JPEG decoder and encoder.
  - Patches 1/3 (dt-bindings: decoder):
    Moved the standalone compatible string mediatek,mt8189-jpgdec
    into the first oneOf entry along with mt2701 and mt8173, as
    suggested by Rob Herring. This correctly groups all independent
    ICs and removes the redundant items wrapper.
  - Patches 2/3 (dt-bindings: encoder):
    Applied the same logic suggested by Rob Herring to the encoder
    binding. Restructured the compatible property to clearly
    distinguish between the standalone IC (mediatek,mt8189-jpgenc)
    and the ICs that must fallback to mediatek,mtk-jpgenc.

Changes compared with v3:
- The v4 is resending the cover-letter, because the v3 cover-letter was
  not sent successfully.

Changes compared with v2:
- Dropped the dts patch (arm64: dts: mt8188: update JPEG encoder/decoder
  compatible) as it belongs to a different tree/series.
- Patches 1/3 (dt-bindings: decoder):
  - Changed the MT8189 compatible to be a standalone `const` instead of
    an `enum`.
  - Added an `allOf` block with conditional checks to enforce the single
    clock ("jpgdec") requirement for MT8189, while preserving the
    two-clock requirement for older SoCs.
  - Updated commit message to reflect the schema structure changes and
    hardware differences.
- Patches 2/3 (dt-bindings: encoder):
  - Changed the MT8189 compatible to be a standalone `const` instead of
    an `enum` inside the `items` list, as it does not fallback to
    "mediatek,mtk-jpgenc" due to 34-bit IOVA requirements.
  - Updated commit message to explain the standalone compatible design.
- Patches 3/3 (media: mediatek: jpeg):
  - Refined commit message for better clarity regarding 34-bit IOVA and
    single clock configuration.

Changes compared with v1:
- Patches 1/4:
  - Updating commit message
- Patches 2/4, 3/4: 
  - Updating commit message
  - Adjusted property descriptions acorrding to hardware requirements
  - Improved formatting for better readability and consistency
- Patches 4/4:
  - Updating commit message

Jianhua Lin (3):
  dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible
    string
  dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible
    string
  media: mediatek: jpeg: add compatible for MT8189 SoC

 .../bindings/media/mediatek-jpeg-decoder.yaml | 50 ++++++++++++++++---
 .../bindings/media/mediatek-jpeg-encoder.yaml | 38 +++++++++++---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 44 ++++++++++++++++
 3 files changed, 118 insertions(+), 14 deletions(-)

-- 
2.45.2

