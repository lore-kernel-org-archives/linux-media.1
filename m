Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358F73C9893;
	Mon, 17 Aug 2026 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963546; cv=none; b=Z/a2wfJn9PVAnNh8PM/l4VM3e8qELri5TL70gzKjeUaiEvACENOZvXXx14G39l3MFm4VuKRiqFD2xeXLfMhnADGTi1EL4Urcju1icw0VSBP6w/tEZEuY7OSRBN0CKSgIXUHyuhXWbM5sOBHq7w3RBiIiNg013s0K9YnqrA9JSHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963546; c=relaxed/simple;
	bh=La4ifvKccdvuUY0OTx9lmKWj0YDAidB5oPsDEztH7nA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sFdyHe8EcHPvjwrsmfxUN8jU0WoMgM+IKHGFWhy6TQf5Bu4rAbCFZnxoFWpD/tWj5lG5iN0Cs13B41s4Xzhg/x8xKRCf8tuwpNYIDhsL76o95Fp79i6TEr4wST/uw0d5lzfX2MsRnRBnA49zN95THxjfCNxw25TX+AbMTFLmEbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c7453c389a2811f19a56ed5b684f684d-20260817
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:885e6abc-3418-409e-827c-5ddca2f57918,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:0a41e878886da7e5a925bdc8c8eea4fe,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c7453c389a2811f19a56ed5b684f684d-20260817
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1122224808; Mon, 17 Aug 2026 18:45:35 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH 1/2] media: rppx1: handle the MAIN_POST white balance gains block
Date: Mon, 17 Aug 2026 18:45:28 +0800
Message-Id: <20260817104529.3132552-2-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260817104529.3132552-1-lilinmao@kylinos.cn>
References: <20260817104529.3132552-1-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST is defined in the uAPI, the MAIN_POST
white balance gains module is probed and started, and
RPPX1_PARAMS_MAX_SIZE already reserves room for all three white balance
gains blocks. However, the parameters type table has no entry for
AWBG_POST and rppx1_params() does not dispatch it, so userspace cannot
configure the module.

The missing type-table entry is zero-initialised. A zero-sized
AWBG_POST block can therefore make v4l2_isp_params_validate_buffer()
loop forever. A pending v4l2-isp patch rejects zero-sized blocks in the
common validator.

Add the missing type entry and dispatch AWBG_POST to rpp->post.awbg.

Fixes: 9ebf50010c68 ("media: rppx1: awbg: Add support for white balance gain settings")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
 drivers/media/platform/dreamchip/rppx1/rpp_params.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index a75a27a8afd09..88162f0bdc115 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -25,6 +25,7 @@ rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
+	RPPX1_PARAMS_BLOCK_INFO(AWBG_POST, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(CCOR_POST, ccor),
 	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE1, hist),
 	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE2, hist),
@@ -79,6 +80,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
 			module = &rpp->pre1.awbg;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST:
+			module = &rpp->post.awbg;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST:
 			module = &rpp->post.ccor;
 			break;
-- 
2.25.1

