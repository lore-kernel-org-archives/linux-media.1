Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9FD302146;
	Wed, 25 Mar 2026 03:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774411135; cv=none; b=l59/kGHOAa24NCqNuFQC3EYCZGyzf3Y/bmywi3f/5hjJVuFSC7dBFBMuLwc8zXN5LBNwrrMm8scCD33krt/7aPVvvTumSxilbyGmCpojEQTVTT9LbSQeAuqEdeOPfH6RVnMCr4n6A8ynoSMYX4AMrp+897gJW5ziqgtXTepz8TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774411135; c=relaxed/simple;
	bh=Vihgm9XeFrM9Wg1bVxQ+N3gJINjhuXhzN4bjJyErm6I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EJkdl2JyrIMnIoRJDH7wN+IUT3fi78LJiwN52nNMih6KMVDvMWe6UrRCPCMZ43Sz2URpUwZQfkMDLakJyH0tdAWRmVgXq9c36Mr9ACe7sIF0fASA9taehMqOm3f3Nd9T/+rleYBPQjotbN6juSHxO0RssJ/XXfLZbU5Fb6yC9QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=FRh4dIs7; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FRh4dIs7"
X-UUID: eba4d16627fe11f1a39cd589f645bc18-20260325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mrXKcBdRPrRQpsmgZp3qH7cul05vLsZIIetTaWP3sms=;
	b=FRh4dIs7+OArKnw/0t53vGM7GovLsJsqrz1TvNZ+h7lpf1lrQyOTlS3w4BTwH1K5DV96AVi7UBb/hQ7P6VNW0HwjyLkVLApPXVNy5aQqQViGlOR4EXCWc+aiXDpeJqBeKC91IGZWTHdaZZ4XGBUO3dkPUuKYjLqtDZvyLUODs0Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e3de7700-af25-44ed-9580-91c1e37210e6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:eaf76be0-cf51-4058-942d-ef4f058f9afa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: eba4d16627fe11f1a39cd589f645bc18-20260325
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1317168700; Wed, 25 Mar 2026 11:58:45 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 11:58:44 +0800
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
Subject: [PATCH v2 2/5] soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing shift_pa
Date: Wed, 25 Mar 2026 11:57:39 +0800
Message-ID: <20260325035836.2110757-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260325035836.2110757-1-jason-jh.lin@mediatek.com>
References: <20260325035836.2110757-1-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Since shift_pa will be stored into the cmdq_mobx_priv of cmdq_pkt, all
the shif_pa parameters in CMDQ helper APIs can be removed.

Add cmdq_pkt_jump_rel_temp() for the current users of cmdq_pkt_jump_rel(),
and then remove shift_pa after all users have migrated to the new APIs.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 include/linux/soc/mediatek/mtk-cmdq.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index a06b5a61f337..03bb85462566 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -445,6 +445,24 @@ static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_
  */
 int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
 
+/**
+ * cmdq_pkt_jump_rel_temp() - Temporary wrapper for new CMDQ helper API
+ * @pkt:	the CMDQ packet
+ * @offset:	relative offset of target instruction buffer from current PC.
+ * @shift_pa:	[DEPRECATED] shift bits of physical address in CMDQ instruction.
+ *		This value is got by cmdq_get_shift_pa().
+ *
+ * This function is a temporary wrapper that was introduced only for ease of
+ * migration of the many users of the CMDQ API located in multiple kernel
+ * subsystems.
+ *
+ * This has to be removed after all users are migrated to the newer CMDQ API.
+ */
+static inline int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
+{
+	return cmdq_pkt_jump_rel(pkt, offset, shift_pa);
+}
+
 /**
  * cmdq_pkt_eoc() - Append EOC and ask GCE to generate an IRQ at end of execution
  * @pkt:	The CMDQ packet
@@ -599,6 +617,12 @@ static inline int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_p
 	return -EINVAL;
 }
 
+/* This wrapper has to be removed after all users migrated to jump_rel */
+static inline int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
+{
+	return -EINVAL;
+}
+
 static inline int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
 {
 	return -EINVAL;
-- 
2.43.0

