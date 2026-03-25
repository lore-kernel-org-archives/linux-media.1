Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AB827AC45;
	Wed, 25 Mar 2026 04:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774411507; cv=none; b=BkxFMPqu6UfoGZQDZ4jXgqi7cU+vMaPWb8viymVTu1esf7y8rxrfKY1D5ceAEiDP3ysfroAOMk9Wnc0HW6AgG3+vhf8GMo40fnd+rfNEv0OrFriNoVPbF8H33jj7Ji6h/bSuJ484z8T9NaeNiA8CZLYBYu/zKq+OrwuqEM7H6Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774411507; c=relaxed/simple;
	bh=iOg2bWidfk5aS3IgCrqn3+l3Dgl2GN57lWLRJDs9hgU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i7/1SSnd4Cm+f/J7kh4jIkXq3IHa2fE0E9MYKWhbHVkeO0lXGO+oElNPxv0p+N1FUDThDURY13boHtziN218Q0OwbujBNYZeSoA2f6lix6eoZLZKj3Btn4eYvlqsLRngKUbk6I4jc33uD7ySAq7zg9uFChuY8VRJMmIKW/HBQ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=jPCkH/+1; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jPCkH/+1"
X-UUID: ca7f6c2027ff11f1a02d4725871ece0b-20260325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1ejEhStdJVkaQdrxX1r/SaODVVa3XH11oPyK5ntd+5k=;
	b=jPCkH/+1/gi7Y0csf5L6wRAjCi3kRha05UuxITueNlRYx9Yd3sHRQLFMBTNuhUqOzs3Uu4u5oGeVa/i1b2pRDF0lKplKNBEMHNDug/H0fB5JpIDA4jHkXtIxidrw60WUiTYNhEF7CJX1CEMt5EA20qEU+TBCTEPTkPWasNNWNLo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:3a8d27ce-fef6-4827-99a1-4901f1640973,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:c3b92d94-f8ef-4ca8-bea0-143568f9ca1d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ca7f6c2027ff11f1a02d4725871ece0b-20260325
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 80697307; Wed, 25 Mar 2026 12:04:59 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 12:04:57 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Mar 2026 12:04:57 +0800
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
Subject: [PATCH v2 0/3] Remove deprecated CMDQ APIs (series 4/4)
Date: Wed, 25 Mar 2026 12:04:19 +0800
Message-ID: <20260325040457.2113120-1-jason-jh.lin@mediatek.com>
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
    - https://lore.kernel.org/all/20260325035836.2110757-1-jason-jh.lin@mediatek.com/
  2. [Series V2 3/4] Remove shift_pa from CMDQ jump functions
    - https://lore.kernel.org/all/20260325040239.2112517-1-jason-jh.lin@mediatek.com/
  3. [Series V2 4/4] Remove deprecated CMDQ APIs

Please apply this series after the MT8196 GCE support series,
and before the following series.

---

Change in v2:
1. Rebase on linux-next 20260324

---

Jason-JH Lin (3):
  soc: mediatek: mtk-cmdq: Remove cmdq_pkt_jump() and
    cmdq_pkt_jump_rel_temp()
  soc: mediatek: mtk-cmdq: Remove cmdq_pkt_write() and
    cmdq_pkt_write_mask()
  mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()

 drivers/mailbox/mtk-cmdq-mailbox.c       |  8 ---
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 49 +++++++-----------
 include/linux/mailbox/mtk-cmdq-mailbox.h | 12 -----
 include/linux/soc/mediatek/mtk-cmdq.h    | 65 ------------------------
 4 files changed, 18 insertions(+), 116 deletions(-)

-- 
2.43.0

