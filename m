Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30933E9C23;
	Wed,  1 Jul 2026 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894757; cv=none; b=fjPoZN1bRQL8GnnywOrMFb4ZHVi2Ql7vfDgcr5D3hm5SBzLR151QOVH6TW7ph9WL04QHEBmqs6Up0kEIzulCdqoeEm3BqnagDDw9m3ZorYilRtNfSl8ERpicUGYfjPL5ebY5mO/OoJCB8F3elk4wSFTy5Ou79HTeSQYN3A907lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894757; c=relaxed/simple;
	bh=K5aRILGqfW33axMqxqXmKZLDHZXKDHb+0xVUs357G3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gNvVT/rgBrCMNSG31TOIP0zrZgkiCt9R9EH2dioSXhhoQmdPAlzlOKI+jdyJ60Av0MHPOPDcRnXHIu+iyPrvdtWZy8JgO1lpnQQhPxiU8hgfujrfOwvUzokJpk0Dku5rFcWXaWe1XdIV3WFdEVWm4TbHNkWq3U7ycvTaxtXYlOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 65ae710e752711f1aa26b74ffac11d73-20260701
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:38914f79-ecbe-4097-a507-5b59f06b703d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:15e978aa05b7c80c36885be80d512c66,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|865|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 65ae710e752711f1aa26b74ffac11d73-20260701
X-User: pengcan@kylinos.cn
Received: from lenovo [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <pengcan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1873626414; Wed, 01 Jul 2026 16:32:29 +0800
From: Can Peng <pengcan@kylinos.cn>
To: aospan@amazon.com,
	mchehab@kernel.org,
	suzuki.katsuhiro@socionext.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Can Peng <pengcan@kylinos.cn>
Subject: [PATCH] media: dvb-frontends: helene: Fix double free on release
Date: Wed,  1 Jul 2026 16:32:23 +0800
Message-ID: <20260701083223.90137-1-pengcan@kylinos.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

helene_probe() allocates priv with devm_kzalloc() and stores it in
fe->tuner_priv. It also installs helene_tuner_ops, whose release callback
frees fe->tuner_priv with kfree(). If the frontend release path runs, the
devm allocation can be freed manually and later again by devres.

The legacy attach paths still use regular allocations and need
helene_release(), so keep the callback for those paths. For the i2c-managed
probe path, clear the copied release callback, matching other tuner drivers
such as mt2060.

Fixes: 817dc4b579d8 ("media: helene: add I2C device probe function")
Signed-off-by: Can Peng <pengcan@kylinos.cn>
---
 drivers/media/dvb-frontends/helene.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/dvb-frontends/helene.c b/drivers/media/dvb-frontends/helene.c
index 993280fefc2c..8cf6e1823605 100644
--- a/drivers/media/dvb-frontends/helene.c
+++ b/drivers/media/dvb-frontends/helene.c
@@ -1091,6 +1091,7 @@ static int helene_probe(struct i2c_client *client)
 
 	memcpy(&fe->ops.tuner_ops, &helene_tuner_ops,
 	       sizeof(struct dvb_tuner_ops));
+	fe->ops.tuner_ops.release = NULL;
 	fe->tuner_priv = priv;
 	i2c_set_clientdata(client, priv);
 
-- 
2.53.0

