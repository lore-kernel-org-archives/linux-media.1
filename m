Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E901734887B;
	Thu, 16 Jul 2026 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194323; cv=none; b=pds4L2ASO25/fVplQBVl4zlA64Q27nSpJfC11KTqo5AkYzQXdaFGriec695sHt1W0gIuTScteK0y3h0vzF6r/IVr+g+CB9pIuU0RfbBytDyjcEQN/x06Z5v5QrMHzOt/EyE1b3fKX0D5fvLgbSek1ROekaLD+MmaKLDAFPgmvb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194323; c=relaxed/simple;
	bh=35n2430aeHNVJsrtfHFLdUiibo5hQ7UrecgteADXSVs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mCwI45BnuPS1J39+01BtGo0K1U3oP89NwS0K1SdYKrynRfzBaxNFEEOrT6KeiY6dT6uShnL0PDgOzNG5fgMGsjWITUreUEDp2m0N1XdShNOtJMShNo1/cXGLjYpWHBrrZa7BMx5qG9CEZaXCabayj5GUy/CDfA6yzp7DmHGRsGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2e888c5e80f911f1aa26b74ffac11d73-20260716
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:a1fb6ec6-f60c-4b5a-9f34-b304621e7e78,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:77872c4207b68bad65599bb59d36d0d5,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2e888c5e80f911f1aa26b74ffac11d73-20260716
X-User: chenchangcheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 26109064; Thu, 16 Jul 2026 17:31:54 +0800
From: Chen Changcheng <chenchangcheng@kylinos.cn>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Changcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH] media: em28xx: remove unneeded semicolons
Date: Thu, 16 Jul 2026 17:31:51 +0800
Message-Id: <20260716093151.175539-1-chenchangcheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eliminate the following coccicheck warnings:
./drivers/media/usb/em28xx/em28xx-core.c:635:2-3: Unneeded semicolon
./drivers/media/usb/em28xx/em28xx-cards.c:4085:2-3: Unneeded semicolon

Signed-off-by: Chen Changcheng <chenchangcheng@kylinos.cn>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 2 +-
 drivers/media/usb/em28xx/em28xx-core.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index fbfb74eab475..133bc1082d57 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -4082,7 +4082,7 @@ static void em28xx_check_usb_descriptor(struct em28xx *dev,
 			dev->analog_ep_bulk = e->bEndpointAddress;
 		}
 		return;
-	};
+	}
 }
 
 /*
diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index 5bbb082dbed9..d4197e37f637 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -632,7 +632,7 @@ void em2828X_decoder_vmux(struct em28xx *dev, unsigned int vin)
 	default:
 		dev_dbg(&dev->intf->dev, "EM2828X_SVIDEO\n");
 		break;
-	};
+	}
 
 	em28xx_write_reg(dev, 0x24, 0x00);
 	em28xx_write_reg(dev, 0x25, 0x02);
-- 
2.25.1

