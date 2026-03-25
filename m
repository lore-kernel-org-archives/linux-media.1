Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8F12BDC26;
	Wed, 25 Mar 2026 03:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774411132; cv=none; b=L+hHf6skvHtd9HfBzLTz2xPHdYp2VEBxxoPrjeKYUVwOyg8mDrAZXZpHVPMyHNTUqwJvNYA1FQA62mGIwMjDV6178QQ6qlGoprs4jqvfwHLGLRzuvhayMklyaR51A13E8iGpMBxVXWYpoOmd193PFzl/euRl4y0bXT4Tpvkncrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774411132; c=relaxed/simple;
	bh=9TqhTRm+skzTKYTfcXqaShb1+m+xgRbhssNcAvriwVA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B7njFeEz97vVcFXc68t6w13pjwn7O3e8K39fcHaA3uE9IanR96QRGrP/425A752+Z3Nizc9EQEVmjIaznJxW5Tbr8IK5bqigzfVnKAWcDLwkw7NUw1ZlwaxqjsNLW2ekxA4NDS25V3G0BaKNNXSeSTIZFSzdFRXojJZwC/6IdWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=GtIRqvVj; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GtIRqvVj"
X-UUID: eb75812c27fe11f1a39cd589f645bc18-20260325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=3bOdphtuowCR6PCgjWzhhXsj3t6e4lkXWBO8mqxyGy4=;
	b=GtIRqvVjd1yxETezQ1LIY/RO36HquPS1TZDY0ggOuwUyb0h+zthK60jaB/xk8VIe4IE2KYQgKgboNOeRKr/gcn0k5LCts+5MeAgWZvvuPw8Tl5BSdR9haGOB/DB08sD9VnOVpKP7wEybLPQRi+uwfd9r2IBYyd6IaQj/RO0hfUA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:3a0f7027-3b75-46b2-be7e-f43a6a3a9202,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:dba42d94-f8ef-4ca8-bea0-143568f9ca1d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: eb75812c27fe11f1a39cd589f645bc18-20260325
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1044230801; Wed, 25 Mar 2026 11:58:45 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 11:58:43 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Mar 2026 11:58:43 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy
 Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>,
	Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
	Chen-yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>
Subject: [PATCH v2 0/5] Migrate soc, drm-mediatek, mdp3 to new CMDQ APIs (series 2/4)
Date: Wed, 25 Mar 2026 11:57:37 +0800
Message-ID: <20260325035836.2110757-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

This series migrates the MediaTek SoC, DRM, and MDP3 drivers to the new
CMDQ APIs introduced for MT8196.

Series application order:
  1. [Series V2 2/4] Migrate subsystems to new CMDQ APIs (this series)
  2. [Series V2 3/4] Remove shift_pa from CMDQ jump functions
  3. [Series V2 4/4] Remove deprecated CMDQ APIs

Please apply this series after the MT8196 GCE support series,
and before the following series.

---

Change in v2:
1. Rebase on linux-next
2. Fix build error of -EINVAL in patch2.

---

Jason-JH Lin (5):
  soc: mediatek: Use pkt_write function pointer for subsys ID
    compatibility
  soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing
    shift_pa
  drm/mediatek:Use reg_write function pointer for subsys ID
    compatibility
  media: platform: mtk-mdp3: Refactor CMDQ writes for CMDQ API change
  media: platform: mtk-mdp3: Change cmdq_pkt_jump_rel() to
    cmdq_pkt_jump_rel_temp()

 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       | 12 +++++-----
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  6 ++---
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  6 ++---
 drivers/soc/mediatek/mtk-mmsys.c              |  8 ++++---
 drivers/soc/mediatek/mtk-mutex.c              |  5 ++--
 include/linux/soc/mediatek/mtk-cmdq.h         | 24 +++++++++++++++++++
 6 files changed, 44 insertions(+), 17 deletions(-)

-- 
2.43.0

