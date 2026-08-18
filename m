Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20958379971;
	Tue, 18 Aug 2026 02:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787018989; cv=none; b=SMsMzC2uVu9fPY7X/UYsqKTLH/rkMCaBlc42y7fll/fLM58K9cF/BH4F9PtgGHro+nUWqg2sWydl1pcPNRXe35GDUJS4T4yvhnKZYM3GtOHlCN06IcxnryPzhtor0n7/v6EYR0rSaOzOg93rtwLL4h5lT8GAh6oNYK0DnRuB5nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787018989; c=relaxed/simple;
	bh=fN4kQFpz9cguwXnCok8/sRf0kywrj1uCQJu4fnuOrMo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fNgPH+rRavyQ9Ncp7we33pP+exzFDMvRj7wPCqq+KL2FS64oWh1wr2SmPDB5iV/KQAXj6KBbj6AQtslkQ65fi9Ww3ri3zhpUBhaXCMpwfCH8HgfCbOmp4Erct6fpSSNkTolXKFklFKdfMNFb06ucV/sl0238yNl4/h+VYOvbh5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: dd9fc53a9aa911f19a56ed5b684f684d-20260818
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:948d89ca-a7e7-4bc2-8824-9a89bd7c56b4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:4f757c189a1f5de188447293e5b40a2d,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:n
	il,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
	,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dd9fc53a9aa911f19a56ed5b684f684d-20260818
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1574117582; Tue, 18 Aug 2026 10:09:38 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH v2] media: rppx1: describe the MAIN_POST white balance gains block
Date: Tue, 18 Aug 2026 10:09:33 +0800
Message-Id: <20260818020933.3153280-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rppx1_ext_params_blocks_info[] is indexed by block type and is built
with designated initialisers, so a block type without an entry is left
as a zero-sized hole. RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST is the only
such hole: a block reporting that type and a size of zero passes
v4l2_isp_params_validate_buffer(), which then has nothing to advance
the walk with.

Describe the block, so the array covers all block types the uAPI
defines. The MAIN_POST white balance gains module is probed and started
with the rest of the POST pipe, and RPPX1_PARAMS_MAX_SIZE already
reserves room for all three white balance gains blocks.

The block is not dispatched by rppx1_params(), in line with the other
described blocks that have no users yet.

Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
Changes since v1 [1]:
- dropped the rppx1_params() dispatch hunk, the block stays undispatched
  like the other described blocks that have no users yet (Niklas);
- retitled, and the commit message now leads with the hole in the array;
- dropped the Fixes: tag, the fix is expected to be collected together
  with the driver for v7.3 (Jacopo).

The second patch of v1, "media: rppx1: bls: read the raw pattern from
the PRE2 acquisition module", is dropped for now and will be resent when
PRE2 support lands.

The zero-sized block problem in the common validator is addressed by
David Carlier's "media: v4l2-isp: reject zero-sized parameter blocks"
[2], so it is not touched here.

[1] https://lore.kernel.org/linux-media/20260817104529.3132552-1-lilinmao@kylinos.cn/
[2] https://lore.kernel.org/linux-media/20260815193839.141406-1-devnexen@gmail.com/

 drivers/media/platform/dreamchip/rppx1/rpp_params.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index a75a27a8afd09..5e6727d589464 100644
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
-- 
2.25.1

