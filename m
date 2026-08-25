Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F113C1ACED5
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 06:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787640511; cv=none; b=Pq9H9aaOwlq8Wsc8Fynb+q159RHhQw/TvcBwPQQ4kkntkViLEEatxPNSq2AWCY7POgRWCC75TlaQgv3R39qp8XpgAaLF4Ydo2XvqkJld/oaX9UIdM0mJRNR3yIc8LQLRj7F16wNfY0C8efvcX8W1U5EC+yiL9vEfqdAn/s8kM5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787640511; c=relaxed/simple;
	bh=LvQb9X5RgIvOZR+GB6sX2HCVsUnZnUG/CxvF68tlPK0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RJGaF0A8LeieLcDp4iauKXgONWQ/5eEU5DeB6p+J8TCCeGlEY943av0On+mPdGsUCVJELhVHyAi3di0mssAe9Nq2jvlE6CCz8dm3KKqQ7x609L7EFN83Yl9vBolwQTQJhb4K/qtc0vfQ6RVhEnlDRhf6jYv8NXgV+9BA60okIVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f56db44aa05011f19a56ed5b684f684d-20260825
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CHARSET
	HR_CHARSET_NUM, HR_CTE_8B, HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD
	HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_CHARSET
	HR_TO_CHARSET_NUM, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NAME, IP_UNTRUSTED
	SRC_UNTRUSTED, IP_UNFAMILIAR, SRC_UNFAMILIAR, DN_TRUSTED, SRC_TRUSTED
	SA_EXISTED, SN_UNTRUSTED, SN_LOWREP, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, CIE_UNKNOWN
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:6d8ea21a-811b-45cd-bbdd-64524ccf41e8,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.3.19,REQID:6d8ea21a-811b-45cd-bbdd-64524ccf41e8,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:7db8b62,CLOUDID:c3e46c1cf2c82a3bb5de4a970c6e606f,BulkI
	D:260825144824CR8KV65X,BulkQuantity:0,SF:19|38|66|72|78|102|127|850|865|89
	8,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:ni
	l,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:
	0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f56db44aa05011f19a56ed5b684f684d-20260825
X-User: lihaojie@kylinos.cn
Received: from localhost.localdomain [(39.144.194.152)] by mailgw.kylinos.cn
	(envelope-from <lihaojie@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1786909968; Tue, 25 Aug 2026 14:48:20 +0800
From: Haojie Li <lihaojie@kylinos.cn>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Haojie Li <lihaojie@kylinos.cn>
Subject: [PATCH] dma-buf: fix coding style in dma_resv_get_singleton
Date: Tue, 25 Aug 2026 14:48:15 +0800
Message-Id: <20260825064815.331653-1-lihaojie@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The conditional "if (r)" following the dma_resv_get_fences() call was
indented with spaces instead of a tab, violating the kernel coding
style. Fix it to use a single tab for consistency with the rest of
the function.

Signed-off-by: Haojie Li <lihaojie@kylinos.cn>
---
 drivers/dma-buf/dma-resv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 39a92d9f2413..2365a6d8ca15 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -633,7 +633,7 @@ int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage usage,
 	int r;
 
 	r = dma_resv_get_fences(obj, usage, &count, &fences);
-        if (r)
+	if (r)
 		return r;
 
 	if (count == 0) {
-- 
2.25.1

