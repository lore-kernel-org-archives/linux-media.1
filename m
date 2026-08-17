Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11F43F8ED1;
	Mon, 17 Aug 2026 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963549; cv=none; b=jrFGP/8dlLPqc9DUeZnWJHRHG16gI/yi1Si4q+cho3fUjdTfN0cdlyx1gxXzpwhK3383RVzPZvba7DEFELjGFDW/Js4rWhNDU0HvjhkQOfkSRv4zMN3RSOL7k5G7CFjNggYYSKQIDyB5MECj68w/mMtvY16CAEbe730kLGF4kRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963549; c=relaxed/simple;
	bh=vB14N/QjAPD1Kc3eKJoZY+NRlYEnIUM7mNYOzmV+Na0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VXZCmF9ldpxYmJ81kQ/w9dXg3hQu/Zx3hDTKP36LLZaxtzQcTwV0V1WlwlZeMQDeSI36dq4zAHkjV9o+VQWSxrS0tYyvBRm+uH2rJdljWgsb/e6Akx16tk7SENr1AxOC3DFNKHnJkMtimPRWV2Sacuacg+JVZUzbzCH0G1MDG1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c8ba14589a2811f19a56ed5b684f684d-20260817
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:f092537f-c846-49dc-889f-8e3756039d19,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:d8e2226f90097353c429b16036df0a4e,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c8ba14589a2811f19a56ed5b684f684d-20260817
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1354324450; Mon, 17 Aug 2026 18:45:38 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH 2/2] media: rppx1: bls: read the raw pattern from the PRE2 acquisition module
Date: Mon, 17 Aug 2026 18:45:29 +0800
Message-Id: <20260817104529.3132552-3-lilinmao@kylinos.cn>
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

rppx1_bls_swap_regs() gets the Bayer pattern from the acquisition
module. The PRE1 path uses pre1.acq, but the PRE2 path mistakenly uses
pre2.bls. The BLS module does not store a Bayer pattern, so PRE2 would
read zero (RGGB) and map fixed black levels to the wrong colour
registers.

PRE2 is not started or dispatched yet, so the bug is currently
latent. Read the pattern from pre2.acq, as the PRE1 path does.

Fixes: 3f8a2a883655 ("media: rppx1: bls: Add support for black level compensation")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
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

