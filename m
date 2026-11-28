Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859425;
	b=k1egu/J7YYbNlZOxaZnZhV+nhaGkmLdreSIqfM5+KRlBwxgvlpGl5uXpQxxIqJvIRByA
	 3xmRlIalH1lsyhxM3QlUidxGd6/nUam1HGJuMeMMOJbo1ZfEzz9hasfb1V7C0711LI0tV
	 JM3cf+uR7sja27GfldmoykNiVJ4vQL6yTJ0Hol0aaKjgjgDyvuLeglgV9mmjgCqqoUKoM
	 6NXtmYjGoiXhfqTam45khNP12cV/3JUJv6uvxlbR3uoFF1bXYmZPfWMadu/e4QluUn6Q0
	 TwJi4+wA8flLuzv8rrbJgVo4TVAfYnhxnOaLr2yw2eoO4DvnmsnRFNroSGlWAVyhdQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859425;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=7p8D+7g5hLJ03qoTTO+VClEUd1M9tQxlTS9hNQkrwHo=;
	b=vGudXmKjsjggU/mTfHMrea/RUUCFglMpWucIypO+tUWwIKXURY4IcWPLV0bhrwkk2oth
	 H+MkqYXVjqj68pehqiPKdYoOuKNM14kNUGRSNdlOyBdSz0nxfT/JwbsuLDER4n954PF2Y
	 vVJXshrDRrc+04TKD4UhlxSFSVBmVWdl48cnZ87mMB4MnCQ5u5zl2eIR+iDjFsLXWxWjh
	 6nktdpZgPvIZazarXiHctWz2MYNaKSJUv9BtrZpqEw7YGKgHKkuxBIgBKbWmbZv498Pyi
	 L4dyq8TE2iCXn44tXWyekknDFiZqyFFA6cTU4K4FMFm4M/VdEFECpcHypY0e2p3wZDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=DNkfmLCP;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91357606A31F;
	Sat, 28 Nov 2026 09:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91357606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=DNkfmLCP
X-UUID: 1e46421eeb1111f1a7aecdb2598be72c-20261128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7p8D+7g5hLJ03qoTTO+VClEUd1M9tQxlTS9hNQkrwHo=;
	b=DNkfmLCPoEGj9rQTMyoa7pL4blW+zgzpimI5YZJ1pRwps4bTqLlRg6VPBh5XngHzNNYvRieIPK99jDENvM8uy7lnZMZJbJcT7MhuelTBTCx5rt5mloX/wVK86V+psnZZ+YqlIfTT11U7aNYCOt6xR58t1Cd441J5Ct54RsJLK9s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:7a80310c-5587-42a4-b8e8-a4228eb5dcfd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:eb15e766-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1e46421eeb1111f1a7aecdb2598be72c-20261128
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 322998702; Sat, 28 Nov 2026 17:50:18 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 28 Nov 2026 17:50:16 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Sat, 28 Nov 2026 17:50:15 +0800
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
Subject: [PATCH v13 00/10] Enable video decoder & encoder for MT8189
Date: Sat, 28 Nov 2026 17:50:04 +0800
Message-ID: <20261128095014.3128536-1-kyrie.wu@mediatek.com>
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Kyrie Wu <kyrie.wu@mediatek.com>

This series enables the MT8189 video decoder and encoder. It adds the decoder
and encoder bindings and compatible data, updates decoder capability data,
and fixes two existing decoder issues. Patch 3 moves decoder firmware
selection from optional DT properties into platform data, matching the
encoder implementation.

Patch layout:
  1  Add the MT8189 decoder binding.
  2  Add decoder platform-data support.
  3  Move decoder firmware selection to platform data.
  4-5  Refactor decoder profile, level, and VP9 probability-size data.
  6  Fix VP9 4K profile-2 decoding.
  7  Add the MT8189 decoder compatible data.
  8  Fix the media-device node number.
  9-10  Add the MT8189 encoder binding and compatible data.

The dependency bundle contains 28 patches: 
[1] https://patchwork.linuxtv.org/project/linux-media/cover/20261128074800.3108429-1-kyrie.wu@mediatek.com/
[2] https://patchwork.linuxtv.org/project/linux-media/cover/20260914073423.16131-1-irui.wang@mediatek.com/
[3] https://lore.kernel.org/20261019212431.4109371-1-robh@kernel.org/

Historical testing reported in a previous submission (not rerun for v13):

H.264:
  ./fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -j2 -t 90
  JVT-AVC_V1: 96/135 tests passed

VP9:
  ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0 -j2 -t 90
  VP9-TEST-VECTORS: 276/305 tests passed

v4l2-compliance:
  mtk-vcodec-enc (/dev/video2): 46/47 passed, 1 failed, 0 warnings
  mtk-vcodec-dec (/dev/video3): 48/48 passed, 0 failed, 0 warnings

SCP upstream link:
https://patchwork.kernel.org/project/linux-mediatek/patch/20250811015922.32680-1-huayu.zong@mediatek.com/

DTSI upstream link:
https://lore.kernel.org/linux-mediatek/20251030134541.784011-12-jh.hsu@mediatek.com/T/#m847e35de0a5b18fac0ca0624a8559d84964ad5c7

Changes in v13:
  - Rebased on mainline 4dce97c6c265544342e716e62fd24bbb232590c5 with
    the 28 prerequisites above, using MT8196 decoder v10.
  - Rebase patch 1 on Rob's corrected child schema: keep the existing
    clock-name alternatives and add MT8189's soc-vdec/vdec pair. Require
    exactly two MT8189 clocks/names while preserving the existing SoC
    constraints, including exactly four clocks on MT8196.
  - Patch 1: require SCP and reject VCP for MT8189, which uses SCP to run
    the decoder firmware. Keep MT8196's separate VCP requirements.
  - Patch 4: restore the pre-refactor VP9 limits for existing platforms:
    MT8192 profile 1, and MT8195 level 5.2/profile 2. These limits had
    changed in earlier MT8189 revisions. The MT8189 data stays separate.
  - Keep the 10 target patch boundaries, authors and existing review tags.

Changes in v12:
  - Rebased on mainline 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4,
    using the published MT8196 decoder v9 and its VCP prerequisite.
  - Require two MT8189 decoder child clocks named soc-vdec and vdec.
    Correct the clock description and remove Rob Herring's withdrawn
    Acked-by from patch 1.

Changes in v11:
  - Rebased on the latest media tree.

Changes in v10:
  - Rebased on the latest media tree.
  - Reordered the compatible string for DT bindings.
  - Rebased on MT8196 decoder/VCP v7 and encoder v8.
  - Add a separate decoder firmware-platform-data patch following review.

Changes in v9:
--Rebased on top of the latest media tree

Changes in v8:
--relocate the patches set
--refactor decoder platform data patch
--fix commit message errors

Changes in v7:
--refactor the patches of set compatible data, profile and level
--add reviewer to commit messages
--fix commit message errors

Changes in v6:
--move default decoder parameters to compatible data structure
--add reviewer to commit messages
--Rebased on top of the latest media tree

Changes in v5:
--update H264 & vp9 fluster test results
--update vp9 single core decoder prob size setting and commit messages

Changes in v4:
--add reviewer to commit messages
--Rebased on top of the latest media tree

Changes in v3:
--add H264 fluster test results
--reorder compatible string for dt-bindings

Changes in v2:
  - Added v4l2-compliance test results.
  - Added the SCP upstream link.
  - Added hardware difference descriptions to the DT binding commit messages.

Changes in v1:
  - Initial submission.

Kyrie Wu (10):
  dt-bindings: media: mediatek: decoder: Add MT8189
    mediatek,vcodec-decoder
  media: mediatek: decoder: Add a new platform data member
  media: mediatek: decoder: Move firmware selection to platform data
  media: mediatek: vcodec: Refactor Decoder profile & level Handling
  media: mediatek: vcodec: Add VP9 Probability Size Configuration
  media: mediatek: vcodec: Fix vp9 4096x2176 fail for profile2
  media: mediatek: vcodec: add decoder compatible to support MT8189
  media: mediatek: vcodec: Fix media device node number
  dt-bindings: media: Add MT8189 mediatek,vcodec-encoder
  media: mediatek: encoder: Add MT8189 encoder compatible data

 .../media/mediatek,vcodec-encoder.yaml        |   2 +
 .../media/mediatek,vcodec-subdev-decoder.yaml |  38 ++-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |   2 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.h  |   6 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  64 ++---
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  42 +--
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        |   2 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  16 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 253 ++++++++++++------
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |  14 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  17 ++
 11 files changed, 313 insertions(+), 143 deletions(-)


base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
prerequisite-patch-id: 9f5a680ff9c58918d53c09c15d48e6ac33c643fc
prerequisite-patch-id: af540a1d2093ff0b635f96f3257fbf768302925e
prerequisite-patch-id: dee8633604fd7528e9ebcb9de25a3e42231f1f80
prerequisite-patch-id: f464ff9a2860b4fc07c051961e26c10047a1731d
prerequisite-patch-id: 1b9295ecd3895c60f6d5ab690f9c05987e1a551f
prerequisite-patch-id: a4abfe16fb9cfd55e44707491259f72f50783a33
prerequisite-patch-id: 472784c2603c63038b064dd36d867b9105a23eda
prerequisite-patch-id: b9bb46522b73329d7f2d92a42fc028bc520c50f3
prerequisite-patch-id: 3e9f9d5336485e4bd3be2a8726d2c2428619e286
prerequisite-patch-id: 239117262da6d2eddbd9fdc78224fa27b08d96fc
prerequisite-patch-id: 051092a8424afa3002442799fb016651eb80f79f
prerequisite-patch-id: 0053f4a078d3c5436fac542ed7d1098575ccf475
prerequisite-patch-id: c263a79890cb2c7cc4160b723c55de905361db36
prerequisite-patch-id: d8a3b0e7f634d02d3ef0625a9ad0d7f2fcc20b31
prerequisite-patch-id: 2129e8aec7acd498dd7badbaa5610d03df7dc52d
prerequisite-patch-id: 6659ecd9b8bb8c38e13edadee8fa0003362ad45c
prerequisite-patch-id: 7d41207a5d2d040ef77700c1d8a8bfca933ce040
prerequisite-patch-id: 1e5eb8ffad8ac92cea848342d2dec1b73683e75a
prerequisite-patch-id: 4489e714c6a152266194fdef803ba5fb48a685c6
prerequisite-patch-id: 341fd7d3230b150b3e17f298d1c06cfb2ad3ad5a
prerequisite-patch-id: de717dc84d8be3c25942021a48b8c26ba714a432
prerequisite-patch-id: 263c52d86ef675aff8c1b6c348e9ecc3ac75d7cd
prerequisite-patch-id: 2b0b00b672f448f333e9def6b9864afc11df991a
prerequisite-patch-id: 9fbf014b290db330f44f6702777acdef8ed5d76f
prerequisite-patch-id: acac610274fe76d67cedcd2d9729659132ab891f
prerequisite-patch-id: afa01b367b18eebac4bded1729931f4b1d1fc2ae
prerequisite-patch-id: 2844bb2bbd9328add841f4b13bdbdd3c120ffa5f
prerequisite-patch-id: e7405e261fde65f2cbe4f9d78d15fd411fb749bb
-- 
2.51.0.windows.2

