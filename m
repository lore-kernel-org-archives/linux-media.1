Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587398;
	b=pcf0BH2VzSU+DtRJ5fbDL/qcilJEzgzTekIbYORMj4PqFDDKFOLwEtPbOt+XTVkdOynH
	 PbsUhg9LbOhhlr4uupFPJe48EcJt/SDEPdG9fFiJnIHFcBssamhxIQZGkWhT0CWwgnh4U
	 tFdJ49ggJGPet1yEnAhRYr7Arhuk+/2ERJvUS99ejX6YAotb9/SbgWBOU4btbAMmuZFh4
	 ElUOa8k6V4GRsVJc6ONR2l+s87ujN6FUZMVN4VhBSu1eYINp2DSH+tDaiyv3T+38l2oNv
	 VX4AohbSPmzZX8W6IMlHoJvHh9rmRxZTVboindxb66vMwWje2BZKnGspDMws0Zg3cVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587398;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=qT4jukooijkn9oVFANgSEWWyX/Wb2Pv/yUrB34irBsY=;
	b=gCBY+W4mZQHwgOs99yl2QB58yHOZDLI5mC9WolYd6adpE8MEvpbLxcVQ0x3Q8Vfo9btC
	 Vlzn01p7nXqS350r3ZSZmQ3Dm6Wgkn0Hw5P+g7mbo2a3V28zOblROFaj3rN2+Ki/NSDKy
	 zYcT7Uctig0Psx38jopRAWM4sty9z5gHmmqv/Ox0Zfo0UsMEuoiPHK0PZdUIIuzNP78A+
	 YJhvvlUofMU8mLuYnEA87bewSO20Tq1yGVWsIBAuL0SE9+NhTrpAm2USxjFbu4h434zaW
	 SDQaZurG1f9D4qrgB1GGx3Ug+W9e0k6jekkBgTtsqcw0B0VPildpdlCtuKImWS9WXBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=CHVVM57v;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A61C6072DA3;
	Wed, 25 Nov 2026 06:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A61C6072DA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=CHVVM57v
X-UUID: c111d12ee89711f18dc8c9802ae25ab1-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qT4jukooijkn9oVFANgSEWWyX/Wb2Pv/yUrB34irBsY=;
	b=CHVVM57vdo1uIpXg9KK5Mte37CObBGESTgeZfMjBCsw1c5ZOwBQzIJy+7rjCntXPAwMxbrYORI3vMTDOJ4auzgwmOEEhlUqkhGK8IRo0Cjf1YNkks8RHh4gJ6ghqYMmtHV39+9sOJJJePzG3l/TEFxiK4QSVrw09dPrN//h4Bpw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:018ae8a4-9fdf-459d-971f-849abab44351,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:a4bc081a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c111d12ee89711f18dc8c9802ae25ab1-20261125
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 695043930; Wed, 25 Nov 2026 14:16:30 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:16:29 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:16:28 +0800
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
Subject: [PATCH v20 08/15] media: mediatek: jpeg: fix remove buffer removal timing for multi-core
Date: Wed, 25 Nov 2026 14:16:11 +0800
Message-ID: <20261125061618.2544386-9-kyrie.wu@mediatek.com>
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

Remove prepared source and destination buffers from the M2M ready
queues in the multi-core decoder after destination preparation succeeds
and before arming the timeout or starting hardware, matching the encoder
flow. Completion can then return buffers without leaving them linked
in a ready queue. Preparation failures keep the existing cleanup path.

Fixes: 86379bd9d399 ("media: mtk-jpeg: Fixes jpeg enc&dec worker sw flow")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 199d15828..7e4fd36dd 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1768,9 +1768,6 @@ retry_select:
 		goto dec_end;
 	}
 
-	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
-
 	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
 	if (mtk_jpeg_set_dec_dst(ctx,
 				 &jpeg_src_buf->dec_param,
@@ -1785,6 +1782,9 @@ retry_select:
 	jpeg_dst_buf->frame_num = ctx->total_frame_num;
 	ctx->total_frame_num++;
 
+	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+
 	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
 			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
 
-- 
2.51.0.windows.2

