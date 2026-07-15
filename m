Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB5386341;
	Wed, 15 Jul 2026 01:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784080574; cv=none; b=ntwkQpiqMz6KWxAalnMt2zsIuVchoXgifM5YCmZ1nFbshfIjmjn25Edhg+Z6Wa2og8ejDLt6o75r6pKEk7trqHgoW6LyBMm0brtQGbGM8QNZcxkDIoSzD3RDRtHLkL250ursDnfx5qeCGuhk8w3Z2SxaJodlhSkkitDV01p+Xx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784080574; c=relaxed/simple;
	bh=LeR0VC4vLaZT1gTAp2KhVKM4c9vRLRDYbo7YJILKm9g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cpvrrNfmFNVuXk4MTtoOTpgqWqoCdfIc4iT275xLoL3PQr/hh/T0HQfPvbvf+T6bIU1xkf92t+1JAOCtT8GrPPqgkw05yt6SSGVUHvfA1wkWZIIVcRVZCBDI+CgcGQhmznYT1EBE/hF6dCg/r0Ya+ru/BmjodTDN3dObN1xX65c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 578175f87ff011f1aa26b74ffac11d73-20260715
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:aff3609d-9dda-4340-a8c3-103421732c49,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:5f24e9afd672a51049327c43eb7c466d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 578175f87ff011f1aa26b74ffac11d73-20260715
X-User: chenchangcheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1821439909; Wed, 15 Jul 2026 09:56:06 +0800
From: Chen Changcheng <chenchangcheng@kylinos.cn>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Changcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH] media: go7007: fix memory leaks on probe error paths
Date: Wed, 15 Jul 2026 09:56:00 +0800
Message-Id: <20260715015600.23105-1-chenchangcheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In go7007_register_encoder(), if any step after
v4l2_device_register() fails (go7007_init_encoder,
go7007_v4l2_ctrl_init, go7007_i2c_init, go7007_v4l2_init), the
function returns directly without cleanup, leaking the registered
V4L2 device and the control handler (if already initialized).

Add cascade error labels that properly release resources according
to how far initialization has progressed:
- err_free_controls: frees the control handler
- err_unregister_v4l2_dev: unregisters the V4L2 device (reached
  from any failure after v4l2_device_register)

Signed-off-by: Chen Changcheng <chenchangcheng@kylinos.cn>
---
 drivers/media/usb/go7007/go7007-driver.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/go7007/go7007-driver.c b/drivers/media/usb/go7007/go7007-driver.c
index 25b3ee25aaa4..453ab5c3aa03 100644
--- a/drivers/media/usb/go7007/go7007-driver.c
+++ b/drivers/media/usb/go7007/go7007-driver.c
@@ -264,17 +264,17 @@ int go7007_register_encoder(struct go7007 *go, unsigned num_i2c_devs)
 	ret = go7007_init_encoder(go);
 	mutex_unlock(&go->hw_lock);
 	if (ret < 0)
-		return ret;
+		goto err_unregister_v4l2_dev;
 
 	ret = go7007_v4l2_ctrl_init(go);
 	if (ret < 0)
-		return ret;
+		goto err_free_controls;
 
 	if (!go->i2c_adapter_online &&
 			go->board_info->flags & GO7007_BOARD_USE_ONBOARD_I2C) {
 		ret = go7007_i2c_init(go);
 		if (ret < 0)
-			return ret;
+			goto err_free_controls;
 		go->i2c_adapter_online = 1;
 	}
 	if (go->i2c_adapter_online) {
@@ -304,13 +304,19 @@ int go7007_register_encoder(struct go7007 *go, unsigned num_i2c_devs)
 
 	ret = go7007_v4l2_init(go);
 	if (ret < 0)
-		return ret;
+		goto err_free_controls;
 
 	if (go->board_info->flags & GO7007_BOARD_HAS_AUDIO) {
 		go->audio_enabled = 1;
 		go7007_snd_init(go);
 	}
 	return 0;
+
+err_free_controls:
+	v4l2_ctrl_handler_free(&go->hdl);
+err_unregister_v4l2_dev:
+	v4l2_device_unregister(&go->v4l2_dev);
+	return ret;
 }
 EXPORT_SYMBOL(go7007_register_encoder);
 
-- 
2.25.1

