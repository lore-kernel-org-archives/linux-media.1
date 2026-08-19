Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13911302753;
	Wed, 19 Aug 2026 06:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787121244; cv=none; b=isO208tRt+e9f1weQbDNJokdZmvzfMuhoeLBZijVD3M37hul8rtPe9LhIEQGJGWKY4tRqREVrZ2l4BS5FsexsiMKzLwx/EVE1k48QedEHkd5/cAwMhjHH+N3yp1gr+0sdSl5aNhqB+IVUULqgNpvN3vsn5cATBFTCD1XIwbpBBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787121244; c=relaxed/simple;
	bh=lWEA0itxyfpTjM8g98wzSo6j0fIj1KxxCis1MjXDerw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h504CLBqU+R53PU2ggA4l4M/Q3Tpb38E4C7YvqKscdwu17EYY4arQb4dDc7niHXqgFwTczSN90Yqs8zuPOEtTgl916L4Bdgpf0zYyAUFn8if307zII8pejYF16viPAXRRfI8nl4E5PYN+sWI4rAijZz3iJ0bKXTuZw3L44HMxWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f43484229b9711f19a56ed5b684f684d-20260819
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c341df24-24ef-4c31-9bbf-3f96c02fd83d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:8ad58eea5427002ea2b3e27a32a53e95,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f43484229b9711f19a56ed5b684f684d-20260819
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1795377435; Wed, 19 Aug 2026 14:33:56 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Ben Hoff <hoff.benjamin.k@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gonglinkai@kylinos.cn
Subject: [PATCH] media: pci: hws: only init channels the device actually has
Date: Wed, 19 Aug 2026 14:33:51 +0800
Message-Id: <20260819063351.3804260-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hws_probe() initializes max_channels (always 4) control handlers, but
register/unregister only walk cur_max_video_ch (1 or 2 on smaller
chips). The extra handlers are never freed.

Initialize the same number of channels that cleanup uses.

Fixes: ba07fd2f5742 ("media: pci: add AVMatrix HWS capture driver")
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
 drivers/media/pci/hws/hws_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/drivers/media/pci/hws/hws_pci.c b/drivers/media/pci/hws/hws_pci.c
index 30bb7d34465b..87ba27877f29 100644
--- a/drivers/media/pci/hws/hws_pci.c
+++ b/drivers/media/pci/hws/hws_pci.c
@@ -441,7 +441,7 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 	hws_init_video_sys(hws, false);
 
 	/* 5) Init channels (video state, locks, vb2, ctrls) */
-	for (i = 0; i < hws->max_channels; i++) {
+	for (i = 0; i < hws->cur_max_video_ch; i++) {
 		ret = hws_video_init_channel(hws, i);
 		if (ret) {
 			dev_err(&pdev->dev, "video channel init failed (ch=%d)\n", i);
-- 
2.25.1
