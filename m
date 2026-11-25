Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587388;
	b=OYzPqWCljQP8Uh8OtvJgMAXFmPEBpXo7HXGfV1sGM7RcDVAn7NFfwGlVl119CzRrQHAH
	 WqKop4QFs/HqJXLe+oEjdKITU2czk9aGFuCSMoBPTZmfkoYOBhsxdQNP/w7CZAkH8Wt7W
	 TbrJ3mpYD9h/FswhcNlu8optsMIdIOd6BazpmBKbOX6MmhpN766zLOyTFWo8OG+ZAeICk
	 smA+iTvDMLSbQqnU0g7bHCwi0gdgD4e6dK3tqCwUsOYvqZHavg6HA1QLL80kClSBdamL4
	 b8w+Om6r7nqZ7+JWwtp8s/ZUkAGEYTX/nxYV2H2k5ovW4dO/YIMOh2Cv+2oOnw2q0Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587388;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-MTK;
	bh=sBCW/1+hC6LenyMex4ykRMV0Vc6X6yOWotOMEDTxmWo=;
	b=vMDXu60OCIzADrp5LSFrquGz+fbgnf0aJTM3ZruL5iPo8taW9/Xj2YnTMY1FDsQMAf0h
	 yx5paD4VvqKQ63iPrtHHTG+cwvCTOHAhZqI2Z7tclkph0hsAboSbx+U47c/kDRvTwOhbN
	 nLoBVvsx7LTJMuIX/3mqPyPoHz+pqx0AnEjMpupG7FEV61EVesYSZyR30UYnNyQ0+Ms+V
	 Mogr1zVjxLZE7Hyi2Ep/1XLbjrsihkxTQcKxCHpNDGJcWEot/Q1tQOIjMKq66RABhvMhx
	 rA3pBdd/C0hfJ6HqUeUyG7E2CTgOmMqgSO15fLpfoPNwb79CAzDe/Zoas7/UUH4rr/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=I5Ym7PCJ;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70B56070A29;
	Wed, 25 Nov 2026 06:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A70B56070A29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=I5Ym7PCJ
X-UUID: bc5741f0e89711f1b1788b6acf885367-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=sBCW/1+hC6LenyMex4ykRMV0Vc6X6yOWotOMEDTxmWo=;
	b=I5Ym7PCJsL5W15FtvnV+qiH81l0ajlelJ4kQln2338qJbtrGfIEtdsj05hfUGjpNldW9L+v8aot/XUucZCVF6b1GI/l9TrkN/xtVa29W7zdpxEVjDuGJcA49JMe2i0qojGTUE37sUFTE/CUSG1jtd6droqiWe2aPIKCnp0HddP8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f6dc5887-dd05-4855-85e6-eaf2cebf0f76,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:34bc081a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|52|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bc5741f0e89711f1b1788b6acf885367-20261125
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1211872711; Wed, 25 Nov 2026 14:16:22 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:16:21 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:16:20 +0800
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
Subject: [PATCH v20 00/15] media: mediatek: jpeg: add MT8196 JPEG support
Date: Wed, 25 Nov 2026 14:16:03 +0800
Message-ID: <20261125061618.2544386-1-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N

From: Kyrie Wu (吴晗) <kyrie.wu@mediatek.com>

This series fixes multi-core JPEG buffer handling, resolution changes,
streaming stop and clock management, and adds MT8196 JPEG decoder and
encoder support. The MT8196 support includes compatible strings and
SMMU stream-ID configuration through the shared JPEG syscon.

Review scope and tags in v20:
In v19, I folded the SMMU property changes already present in v18 patch 12
into the previously reviewed compatible patches, v19 patches 10 and 11.
I also removed the Reviewed-by tags from Krzysztof Kozlowski and
AngeloGioacchino Del Regno. The word "agreed" in the v19 cover was
incorrect: it did not reflect reviewer consent to that scope/tag change.

This revision separates those scopes:
- v19 patch 10 becomes v20 patch 10 (decoder compatibles only) and
  v20 patch 11 (decoder SMMU phandle and its conditional requirement).
- v19 patch 11 becomes v20 patch 12 (encoder compatibles only) and
  v20 patch 13 (encoder SMMU phandle, conditional requirement and both
  parent/child iommus stream-ID descriptions).

The diffs and commit descriptions of v20 patches 10 and 12 match the
reviewed v18 compatible-only patches exactly. Their Krzysztof Kozlowski
and AngeloGioacchino Del Regno Reviewed-by tags are restored only for
that unchanged scope. Those tags are not carried onto the SMMU changes.

Patch 9 uses the common mfd/syscon.yaml binding, per Rob Herring's review,
in place of the standalone JPEG SMMU schema.
Patches 9, 11 and 13 carry only the existing Signed-off-by and require
fresh DT review. All other Reviewed-by tags present in the published
v19 patches are retained. Patch 5 additionally carries
AngeloGioacchino Del Regno's new public Reviewed-by after review of the
multi-core power-management change.

Historical testing reported for v18 (not rerun for v19 or v20):
The v18 series was tested on MT8196 with tast. JPEG encoding and
decoding worked.

Patches 1-8 contain JPEG driver fixes.
Patch 9 adds the MT8196 JPEG SMMU compatible to the common syscon binding.
Patches 10 and 12 contain the reviewed decoder and encoder compatibles.
Patches 11 and 13 contain decoder and encoder SMMU properties.
Patch 14 adds the driver compatible strings for MT8196.
Patch 15 adds jpeg smmu sid setting.
---
Changes in v20 (relative to v19):
--Rebased on mainline 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc.
--Bound the dynamic core count in the existing multi-core branch before
  assigning max_hw_count, preserving the existing probe structure.
--Correct patch 5's dispatch-versus-hardware-completion description;
  add AngeloGioacchino Del Regno's public Reviewed-by. No PM code change.
--Correct patch 6's description: restart the done-queue scan after each
  expected frame and release consecutive completed frames in order.
--Use the common syscon binding for the MT8196 JPEG SMMU compatible,
  remove the standalone schema and its MAINTAINERS file entry, and keep
  the existing JPEG media-binding coverage.
--Split the decoder and encoder binding changes into the reviewed
  compatible-only scopes and independent SMMU property patches, with
  the exact review-tag ownership described above. The series has 15 patches.

Changes in v19 (relative to v18; patch numbers below refer to v19):
--Rebased on mainline 23c62304dde29abe92013d85910d03a77dada35d.
--Initialize hw_rdy before populating children to preserve probe counts.
--Drain ready queues before waiting for in-flight buffers at STREAMOFF.
--Reject component suspend with -EBUSY while hardware is active; restore
  M2M scheduling on failure and use pm_ptr() for component PM operations.
--Publish decoder completion metadata before arming the timeout.
--Keep queue-format updates under CAPTURE STREAMOFF locking and check
  SOURCE_CHANGE state before comparing resolutions.
--Unlink prepared buffers before arming timeout or starting hardware.
--Introduce the shared SMMU schema before complete MT8196 decoder and
  encoder bindings, including their required smmu-config phandles.
--Clarify MT8196 SMMU stream IDs in encoder iommus descriptions and use
  the soc binding prefix for the shared SMMU schema patch.
--Complete SMMU initialization before allocating a child index and
  publishing child pointers, preserving parent state on probe failure.
--Update descriptions. v19 removed Reviewed-by tags from the changed
  code patches 7, 8 and 13 and from the combined binding patches 10 and
  11. The handling of the binding scope and tags is corrected in v20.

Changes in v18 (relative to v17):
--Keep suspend/resume callbacks and clock ownership on multi-hw component
  devices. Leave single-hw callbacks on the master, and wait for the active
  job before disabling component clocks.
--Add a standalone DT binding patch for mediatek,smmu-config and the
  dedicated MT8196 JPEG SMMU configuration syscon at 0x38d0000.

Changes in v17 (relative to v16):
--Rebased on top of the latest media tree

Changes in v16 (relative to v15):
--Set max_hw_count from the DT child count and update hw_rdy from child hardware probes in patch 1.
--Fix patch 2 commit message wording per review.
--Rework patch 6 commit message per review.
--Remove redundant devm_clk_bulk_get() calls in patch 5 per review comments.
--Use %pe to print smmu_regmap error pointer in patch 12 to fix media-ci/static warnings.

Changes in v15 (relative to v14):
--Rebased on top of the latest media tree

Changes in v14 (relative to v13):
--Rebased on top of the latest media tree

Changes in v13 (relative to v12):
--Rebased on top of the latest media tree
--fix kernel rebot build warnings in patch 5

Changes in v12 (relative to v11):
--Rebased on top of the latest media tree
--Some modifications for patch v11's review comments.
--add reviewer to commit messages

Changes in v11 (relative to v10):
--Rebased on top of the latest media tree
--add reviewer to commit messages

Changes in v10 (relative to v9):
--Rebased on top of the latest media tree

Changes in v9 (relative to v8):
--Rebased on top of the latest media tree

Changes in v8 (relative to v7):
--Rebased on top of the latest media tree

Changes in v7 (relative to v6):
--Rebased on top of the latest media tree

Changes in v6 (relative to v5):
--reorder the patches set.
--fix commit message of patch 1-8.

Changes in v5 (relative to v4):
--fix kernel robot build errors for patch 4.
--add reviewer for patch 1 and patch 2.

Changes in v4 (relative to v3):
--change patch subject of jpeg encoder and decoder compatible.

Changes in v3 (relative to v2):
--refactor smmu sid setting function interface
--Some modifications for patch v2's review comments.

Changes in v2 (relative to v1):
--refine jpeg dt-bindings for MT8196
--optimize software code to manage jpeg HW count
--refactor smmu sid setting function interface
--Some modifications for patch v1's review comments.

Kyrie Wu (15):
  media: mediatek: jpeg: fix jpeg cores' amounts setting
  media: mediatek: jpeg: fix jpeg buffer payload size setting
  media: mediatek: jpeg: fix buffer structure size and layout
  media: mediatek: jpeg: Fix buffer completion on multi-core streaming
    stop
  media: mediatek: jpeg: Fix multi-core clk suspend and resume setting
  media: mediatek: jpeg: fix buffer state update timing
  media: mediatek: jpeg: fix resolution change event handling in decoder
  media: mediatek: jpeg: fix remove buffer removal timing for multi-core
  dt-bindings: mfd: syscon: Add MT8196 JPEG SMMU compatible
  media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgdec
    compatible
  dt-bindings: media: mediatek,jpeg: Add MT8196 decoder SMMU
    configuration
  media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgenc
    compatible
  dt-bindings: media: mediatek,jpeg: Add MT8196 encoder SMMU
    configuration
  media: mediatek: jpeg: add jpeg compatible
  media: mediatek: jpeg: add jpeg smmu sid setting

 .../media/mediatek,mt8195-jpegdec.yaml        |  24 ++-
 .../media/mediatek,mt8195-jpegenc.yaml        |  39 +++-
 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 MAINTAINERS                                   |   1 +
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 169 +++++++++++++-----
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  19 +-
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  |  96 +++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  |  94 +++++++++-
 8 files changed, 377 insertions(+), 66 deletions(-)


base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.51.0.windows.2

