Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852101;
	b=ckJizJ5Uqi+h09BC8zexPjOAHVGHRaxMHCVo75rVnCtgluhbJH3LB4OCxDSwApLkxbdT
	 mrJ0TAn5ECOSyDC/SzW1OVOvSx4zpz3xZoltgoiaul9dZHzrslWymMr9lJhR/R3a0O943
	 8Z5YVHwI7c97fU2gRgU56AY9WXJCBEkclRk8detRhFmlpbPy2A322UoIz7RqKfsHAHE91
	 ORUMXoXQwiXM0GQPsdYRj5280cqeU6VDIhgBUhKusxroRtSDlje39eUpj0saWdT3Gixqn
	 nXTUcIRcfgASJcBU0zdn2uzVAzoCaA92x6FxJZqnUeKbACVhc+iWAUdjYsqJbCVdrsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852101;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=ZEXmGBXXJye9IGt3EKcRUDkbiwRap/GPuyXTExPamXo=;
	b=neajAAI3RW5whu+PrwK7kTpHWYqi9KvzHJ4FWXRb+nFkoAmxpy0t3zEdEnKHRWZQRy5i
	 k3miy/GEiI9G7IYDc1LgsjtmbuTkBMuU0IvXsmb2ROcLyzhBUW6Jp/kgpNM6lkaOUSBvq
	 8WyKYcO3YO3Rc3zrWCr92d5xYXnXC58ulNxDRMtc+yGZB6/BKtS3u28IXiBiRPQKPvz7d
	 sYWmi0QGU09T8j9/WdA+x9znlazaG73o1QKBfT7lsv0OLBPkHzk3Rp9WIdpbLLmQpp9rW
	 ReWt+5IiyYLA1FG0Lyz5DzcTP9rF6W4bK4jl5zqGUQAsGqyS+utAorIkt0XWB8nqqWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=p6LVWWrX;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45435606A6BC;
	Sat, 28 Nov 2026 07:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45435606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=p6LVWWrX
X-UUID: 124c688ceb0011f1b9cf3d4034dccee2-20261128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZEXmGBXXJye9IGt3EKcRUDkbiwRap/GPuyXTExPamXo=;
	b=p6LVWWrXOid8Nz2twq2jAiHE1uAb0hQ4fUHj1tRQnEII7Akssm7QV5Bvxn76UbBbm4cMPT/dUMMjJQWLgtwYF4G6y/hnj1NNlLp5NIwtIRm/hVlLHdhUE8Wk7uanXvmCR4/aP/YudZXLdgFKQijcZAc+mPrm7Ww7S1LtHORPcp0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:def789de-95c3-419b-beb4-468fadba03d4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:2d1b7531-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 124c688ceb0011f1b9cf3d4034dccee2-20261128
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1930606131; Sat, 28 Nov 2026 15:48:16 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 28 Nov 2026 15:48:15 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Sat, 28 Nov 2026 15:48:13 +0800
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
Subject: [PATCH v10 07/14] media: mediatek: vcodec: send share memory address to vcp
Date: Sat, 28 Nov 2026 15:47:53 +0800
Message-ID: <20261128074800.3108429-8-kyrie.wu@mediatek.com>
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

The share memory is allocated in kernel for vcp architecture, it's
different with vpu which share memors is reserved in vpu micro
processor. Need to send share memory address to vcp.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/vcodec/decoder/vdec_ipi_msg.h      | 2 ++
 .../media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
index c2c2a3a63..8b771d470 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
@@ -67,11 +67,13 @@ struct vdec_vpu_ipi_ack {
  * @msg_id	: AP_IPIMSG_DEC_INIT
  * @codec_type	: codec fourcc
  * @ap_inst_addr	: AP video decoder instance address
+ * @shared_iova	: reserved share memory address
  */
 struct vdec_ap_ipi_init {
 	uint32_t msg_id;
 	u32 codec_type;
 	uint64_t ap_inst_addr;
+	u64 shared_iova;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index cdb673e6b..50f1e1613 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -4,6 +4,8 @@
  * Author: PC Chen <pc.chen@mediatek.com>
  */
 
+#include <linux/stddef.h>
+
 #include "mtk_vcodec_dec_drv.h"
 #include "vdec_drv_if.h"
 #include "vdec_ipi_msg.h"
@@ -210,6 +212,7 @@ static int vcodec_send_ap_ipi(struct vdec_vpu_inst *vpu, unsigned int msg_id)
 int vpu_dec_init(struct vdec_vpu_inst *vpu)
 {
 	struct vdec_ap_ipi_init msg = { };
+	size_t msg_size = offsetof(struct vdec_ap_ipi_init, shared_iova);
 	int err;
 
 	init_waitqueue_head(&vpu->wq);
@@ -236,10 +239,14 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 	msg.msg_id = AP_IPIMSG_DEC_INIT;
 	msg.ap_inst_addr = (unsigned long)vpu;
 	msg.codec_type = vpu->codec_type;
+	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) == VCP) {
+		msg.shared_iova = vpu->ctx->dev->fw_handler->vcp->iova_addr;
+		msg_size = sizeof(msg);
+	}
 
 	mtk_vdec_debug(vpu->ctx, "vdec_inst=%p", vpu);
 
-	err = vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));
+	err = vcodec_vpu_send_msg(vpu, (void *)&msg, msg_size);
 
 	if (IS_ERR_OR_NULL(vpu->vsi)) {
 		mtk_vdec_err(vpu->ctx, "invalid vdec vsi, status=%d", err);
-- 
2.51.0.windows.2

