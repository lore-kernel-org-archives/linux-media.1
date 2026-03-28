Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76D4155A5D;
	Sat, 28 Mar 2026 05:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774675008; cv=none; b=SV6UAt8f3ugwvkSpOywxjDWvUb4Xj+/9FezZIDN95Tj9GLQ35L+PPxj+4UcTcYb2qE/wcc+1RIINWjA92a5ZW0EAU9thWY9/TV9VlcpJfKikFtu5u4aJRtUPcZjyhj1J9FNAxXxxwm5onDkCY48qTsz6d9Go1sxPDaTJC4A/SGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774675008; c=relaxed/simple;
	bh=0rIHMxjGErlS1YPGsRhI9pFUyvyJHnqt21nwbE0/QcE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ebb0fv67m1UIvQUjmKyLDDOzG324hSx90BFJW2YZIk9TPmzwt3gYz4dnzPr4OjzEJIg+Ga28HOvt0SIcbowCHF6HulTMNhgs98tdrQ6OEfKzS7CxUEMugsF6xEYePvUcqoZVcLrZi7dvmXUi+Y9tUa1rCS8/sF+75YpNEjdoqDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=YOuFXUDk; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YOuFXUDk"
X-UUID: 494e0f4a2a6511f19a16598d5ca7f8ec-20260328
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ItY3XW4lOvR6siOUQ5bYSIbpXYmHoGqydFeMTzgi2E4=;
	b=YOuFXUDkvjcpUOAsMrgpqKJ3TYzSpYynJ5ous4/1E49573A0q6KuR3TCIyS3P+PwVUhyyZlUbx/+mKEWFbo6BkQaLyeLt039lcbOr+CteTjrUvQ2T0wjZm19937g4GtPml0gbXd9MCjAFrwNs7NvYLFdCYuPsqwj6vzvB5DL3Fw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:039bd3ce-3756-4408-b3e8-69d795262eff,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:9c254d94-f8ef-4ca8-bea0-143568f9ca1d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 494e0f4a2a6511f19a16598d5ca7f8ec-20260328
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1256195620; Sat, 28 Mar 2026 13:16:33 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 28 Mar 2026 13:16:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 28 Mar 2026 13:16:31 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 00/14] media: mediatek: vcodec: support video decoder in mt8196
Date: Sat, 28 Mar 2026 13:16:10 +0800
Message-ID: <20260328051630.7937-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

This patch set adds support for the video decoder on the MediaTek MT8196
platform, leveraging the VCP microprocessor for enhanced performance. It
introduces new firmware interfaces for kernel-side communication with VCP,
adds MT8196 compatible, codec levels/profiles, and private data. Rewrites
the AV1 driver to support extended VSI structures, then change irq table
and cdf table size.

This patch set depends on "Add VCP support for mt8196"[1]

[1] https://patchwork.kernel.org/project/linux-remoteproc/patch/20250402092134.12293-2-xiangzhi.tang@mediatek.com/

Compliance Test Result:
- v4l2-compliance: 48/49 tests passed, 1 failed (known issue)
- fail: v4l2-test-controls.cpp(981): ret (got 13)
-        test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL

Fluster Test Result:
- H264:
- Ran 95/135 tests successfully   in 73.540 secs
- H265:
- Ran 142/147 tests successfully  in 100.168 secs
- VP9:
- Ran 276/305 tests successfully  in 106.804 secs
- AV1:
- Ran 240/242 tests successfully  in 23.991 secs
---
Changed in v4:
- Rebase to latest codebase
- Move dt-bindings and compatible to the after of vcp driver ready
- MT8189 base on MT8196 patch set

Changed in v3:
- Depends on change no update
- Add Compliance and Fluster test result
- Re-write the commit message for patch 12
- Change the patches according to review suggestion for patch: 3/4/5/6/14

Changed in v2:
- re-write the commit message for patch 1
---
Yunfei Dong (14):
  media: mediatek: vcodec: add driver to support vcp
  media: mediatek: vcodec: add driver to support vcp encoder
  media: mediatek: vcodec: get different firmware ipi id
  media: mediatek: vcodec: get share memory address
  media: mediatek: vcodec: define MT8196 vcodec levels.
  media: mediatek: vcodec: support vcp architecture
  media: mediatek: vcodec: support 36bit iova address
  media: mediatek: vcodec: clean xpc status
  media: mediatek: vcodec: add debug information
  media: mediatek: vcodec: send share memory address to vcp
  dt-bindings: media: mediatek: vcodec: add decoder dt-bindings for
    mt8196
  media: mediatek: vcodec: add decoder compatible to support mt8196
  media: mediatek: decoder: fill av1 buffer size with picinfo
  media: mediatek: decoder: support av1 extend vsi

 .../media/mediatek,vcodec-subdev-decoder.yaml |   1 +
 .../media/platform/mediatek/vcodec/Kconfig    |   4 +
 .../platform/mediatek/vcodec/common/Makefile  |   4 +
 .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c |  21 +-
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |  16 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.h    |   2 +
 .../vcodec/common/mtk_vcodec_fw_priv.h        |  12 +
 .../vcodec/common/mtk_vcodec_fw_vcp.c         | 561 ++++++++++++++++++
 .../vcodec/common/mtk_vcodec_fw_vcp.h         | 153 +++++
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  16 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   1 +
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        |  28 +
 .../vcodec/decoder/mtk_vcodec_dec_hw.h        |  13 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c |   6 +
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 113 +++-
 .../decoder/vdec/vdec_h264_req_multi_if.c     |  11 +-
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  12 +-
 .../vcodec/decoder/vdec/vdec_vp8_req_if.c     |   5 +-
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |  27 +-
 .../mediatek/vcodec/decoder/vdec_ipi_msg.h    |   2 +
 .../mediatek/vcodec/decoder/vdec_vpu_if.c     |  12 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |   1 -
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.h  |   2 +
 23 files changed, 985 insertions(+), 38 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h

-- 
2.45.2

