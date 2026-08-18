Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B4839A7EF;
	Tue, 18 Aug 2026 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047182; cv=none; b=INF0HZSlFUyhlmBQ2PQJikSWHt/41CV0RTk4O2RdHshqNydsM4z1Zkhrr86R/Efs9XFYEnC1T2O9UbmkoIN3oLw9rHjn5CcoLsLBwemY30vRDGpwSJrl2INZsTqs2xveJ0Y38yPSYXgAzNkMpWOkE+B3waTrrh2oZwAXwvD62QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047182; c=relaxed/simple;
	bh=OkaTYGtWw89P0vwqSv1qDuPT24rAmgp4ETddBbfLNAE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nz8s6NPF+RUkKVfnouY16B7VRd/dkcX8Jj68GaivgxUHn+wnwm/TwAuaZ+wSnaWuphDG6XIqNraKwMXUyweYL1Bff8JG5eyHApLX9eh/qo98ITpfFyDwwYk6e6yWt8QbvWh2CMaAuimu6x1DGNVJvUuQlpf69Rsraq+i3us7V9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 835ca3a89aeb11f19a56ed5b684f684d-20260818
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:3e0d74b0-af3f-45e9-aa25-5e88adb509c3,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:72d6a7886b2a0c6ab7002f11d23dea4b,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:n
	il,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
	,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 835ca3a89aeb11f19a56ed5b684f684d-20260818
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 234258355; Tue, 18 Aug 2026 17:59:33 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] media: rppx1: bls: read the raw pattern from the PRE2 acquisition module
Date: Tue, 18 Aug 2026 17:59:29 +0800
Message-Id: <20260818095929.3194503-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rppx1_bls_swap_regs() gets the Bayer pattern from the acquisition
module. The PRE1 path uses pre1.acq, but the PRE2 path mistakenly uses
pre2.bls. The BLS module does not store a Bayer pattern, so PRE2 would
read zero (RGGB) and map fixed black levels to the wrong colour
registers.

PRE2 is not started or dispatched yet, so the bug is currently latent.
Read the pattern from pre2.acq, as the PRE1 path does, so that enabling
PRE2 does not start out with the wrong register mapping.

Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Changes since v1 [1]:
- no code changes;
- dropped the Fixes: tag, the patch is expected to be collected together
  with the driver for v7.3;
- picked up Niklas' Reviewed-by;
- resent after Jacopo offered to collect this one as well [2].

v1 was patch 2/2 of "media: rppx1: parameters block fixes"; its patch
1/2 is on the list separately as "[PATCH v2] media: rppx1: describe the
MAIN_POST white balance gains block".

[1] https://lore.kernel.org/linux-media/20260817104529.3132552-3-lilinmao@kylinos.cn/
[2] https://lore.kernel.org/linux-media/aoQniglSwAEH3V0D@zed/

 drivers/media/platform/dreamchip/rppx1/rppx1_bls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
index 01a61db279bf7..71c5561457d52 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
@@ -70,7 +70,7 @@ rppx1_bls_swap_regs(struct rpp_module *mod, const u32 input[4], u32 output[4])
 
 	/* Swap to pattern used in our path, PRE1 or PRE2. */
 	struct rpp_module *acq = mod == &mod->rpp->pre1.bls ?
-		&mod->rpp->pre1.acq : &mod->rpp->pre2.bls;
+		&mod->rpp->pre1.acq : &mod->rpp->pre2.acq;
 	enum rpp_raw_pattern pattern = acq->info.acq.raw_pattern;
 
 	for (unsigned int i = 0; i < 4; ++i)
-- 
2.25.1

