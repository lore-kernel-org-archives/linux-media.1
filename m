Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852106;
	b=P05M91x8NWBSmW1HuK+sCVA3+XFrPsNowOVLlW0fWMi5uLAeX4f78+mHxnAccCOR0IYp
	 MReax2hoP4xLx8rZKHY12VnRM7aNqgHPsZGSXM8hrOeBXiyE5FkVgLVOtqoZXDlgrfPFC
	 z3UMsir7JjfxO8amn5rBWzcCUbYQrqiT3SMOM67GmE6H8ZgASkQQWVc16sdRDaeVXSGpy
	 hl6pl1F5ZEuwEF1RXGEtHbjoxLoCubfF+2TFagxL4bzmjwOjqJbxvAx2LrI3StPBnXf2e
	 BuYp91LnR3d52yCuVbL0CLLOUjEivIsTazg5WkoKXYtWgXfofiWHxuGQ43UHklGKGGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852106;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=nD8MNq3RQBezaKn2VnKR3c8r47mu1351TgflroxfNco=;
	b=kkGiNAK9+LX+bxbPCNw2aBAWAw3enoWj4k7Gljkqlrf+9Z4K3RPXUKZosVQ5varV/Prm
	 O6aIFl7V6cpTlPtGT/YiShwdBmaeIrwfhKNOTWD210/t14LNgT46ViUSZMYU7RuQusNhK
	 Fn3FccO2sjP5iskE9c2Dkq7fSjbh6UVcsKvDYpJC5CMACKqOpf033ERbCmWXiK7Lm7LSg
	 WnVY2YjONbJ4mPd2c0bclVQaxlMB9iGDpAbvYbKwvjnkj5mlVcxC2qwj4yXBin1dXHvTF
	 2T1LTEhbMEsPWabhj+EHXWEvCB63nnVybC6sQzGrvy4PfeyKNUC5K+TeHKoftRUKfxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=jIjqH4KA;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7235606A33B;
	Sat, 28 Nov 2026 07:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7235606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=jIjqH4KA
X-UUID: 16300724eb0011f1a7aecdb2598be72c-20261128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nD8MNq3RQBezaKn2VnKR3c8r47mu1351TgflroxfNco=;
	b=jIjqH4KAQ+TMrBFUGbPt8N9EBqj2lzNSaAT9IiRysirpR0qGbyRZY4AKHoR1MAa3LP3/rPpV19LpMLkmUXcUyXwmHWG3tK4fyQbag5xNlPziW8YqUdetfxuAoZsDU2RgVwB9npDHc94lY3hjpmM4yNm7qndEjm0nJp0Ibaq3mzQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:e5d1f148-97d5-4aeb-98d9-3784e4256b79,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:6acd2c1a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 16300724eb0011f1a7aecdb2598be72c-20261128
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 448214901; Sat, 28 Nov 2026 15:48:22 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 28 Nov 2026 15:48:21 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Sat, 28 Nov 2026 15:48:20 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Ricardo Ribalda
	<ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, Haoxiang Li
	<haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa
	<tfiga@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Qianfeng Rong
	<rongqianfeng@vivo.com>, Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v10 11/14] media: mediatek: vcodec: support 36bit iova address
Date: Sat, 28 Nov 2026 15:47:57 +0800
Message-ID: <20261128074800.3108429-12-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128074800.3108429-1-kyrie.wu@mediatek.com>
References: <20261128074800.3108429-1-kyrie.wu@mediatek.com>
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

Need to set dma mask to support 36bit iova address for decoder
hardware can use 36bit address to decode for mt8196.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c  | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 25adf181c..0296b39d9 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -388,6 +388,13 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
+	if (dev->chip_name == MTK_VDEC_MT8196) {
+		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36));
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to enable 36-bit DMA: %d\n", ret);
+			return ret;
+		}
+	}
 
 	dev->fw_handler = mtk_vcodec_fw_select(dev, DECODER, dev->fw_init);
 	if (IS_ERR(dev->fw_handler))
-- 
2.51.0.windows.2

