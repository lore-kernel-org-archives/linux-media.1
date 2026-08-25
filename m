Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927CA3CCFB4
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 06:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787640059; cv=none; b=Puas/d1/mLP+/afCQN6Jnr5ZeN90vjm6NnRApjHVhpbVSat0lhGNYDw9To6KaW5bAaD7k5YGvmHUAc/337dt1GR356qVlgV7IEt6cMcUCQQ+VCi5eRq4TnE00zkDUq9qWx57J5GqnBndr6iAi04gPeKuEmerY0PB3zYIJWMDfdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787640059; c=relaxed/simple;
	bh=YrCLIVIlkcpHfnHwCQcXK/+RM3szzKqkXKnx7EfESFg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A0D7NTxJq5IX5GM0SRvp7aru5jnkXhzndCWHJbMoFR8M39Cmcua21zX0WZP5sJ9XhSjiOJT81FG1utMSVXtJ5jj2q4Mc908WN0LYJ23OnQcUcSLyUrv6ZnFkA/OJoVHFJQpC4YDDGYtkRcCmbBEUUdkO8LRzzEm/gjV8zK9Vnd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e78ab7caa04f11f19a56ed5b684f684d-20260825
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
X-CID-O-INFO: VERSION:1.3.19,REQID:0d4add6c-27b6-4099-b782-63db9ee9aa37,IP:10,
	URL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:30
X-CID-INFO: VERSION:1.3.19,REQID:0d4add6c-27b6-4099-b782-63db9ee9aa37,IP:10,UR
	L:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:30
X-CID-META: VersionHash:7db8b62,CLOUDID:52b52c48527d04a9a0a55fc01bd7232e,BulkI
	D:2608251440512QIFWYIK,BulkQuantity:0,SF:19|38|66|72|78|102|127|136|850|86
	5|898,TC:nil,Content:0|15|50,EDM:5|-100,IP:-2,URL:0,File:nil,RT:nil,Bulk:n
	il,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BR
	E:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e78ab7caa04f11f19a56ed5b684f684d-20260825
X-User: lihaojie@kylinos.cn
Received: from localhost.localdomain [(39.144.194.152)] by mailgw.kylinos.cn
	(envelope-from <lihaojie@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 72568527; Tue, 25 Aug 2026 14:40:47 +0800
From: Haojie Li <lihaojie@kylinos.cn>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Haojie Li <lihaojie@kylinos.cn>
Subject: [PATCH] dma-buf: fix comment in dma_buf_llseek to match implementation
Date: Tue, 25 Aug 2026 14:40:41 +0800
Message-Id: <20260825064041.328640-1-lihaojie@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment in dma_buf_llseek() referenced a "SEEK_END(0), SEEK_CUR(0)
pattern", but the implementation does not support SEEK_CUR - it only
handles SEEK_END and SEEK_SET, returning -EINVAL for anything else.

Replace SEEK_CUR with SEEK_SET in the comment so that it accurately
describes the supported idiomatic pattern.

Signed-off-by: Haojie Li <lihaojie@kylinos.cn>
---
 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d504c636dc29..60571a2ecc23 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -260,7 +260,7 @@ static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
 
 	/* only support discovering the end of the buffer,
 	 * but also allow SEEK_SET to maintain the idiomatic
-	 * SEEK_END(0), SEEK_CUR(0) pattern.
+	 * SEEK_END(0), SEEK_SET(0) pattern.
 	 */
 	if (whence == SEEK_END)
 		base = dmabuf->size;
-- 
2.25.1

