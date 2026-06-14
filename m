Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DB23128AB
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781469022; cv=none; b=Yx5XEPsxhnhAllechvpACtzSUW7s3X4WSSAy2jTHycDjiwtbrrnwLMmHyT3sBxoWbU5oDvNJVPeqawubkv6rD1DNhttR9+b2nNyeQc0w48vKUQuEESC7F30REHg+M/RJJFRklOrtX8YYvRBEx7MLdHVD/42SOUTs23MpzY0xHmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781469022; c=relaxed/simple;
	bh=vHiobahySdZAKWgpMQSFbN+MfD9fEqNMaDttSm7gZy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ar7bl8/qWv2ydKBITtURNoXNvkXnNAthMupfls8k2Hh8/38KHc6PX7hVqJM4OziGwvln1uZ+JJ4DiTKVrx0fjO8LfGPkWYDA8Pz/+71vXkcgScXIPLCToq59psCoLxTZtRXCQ6RkCRWx4RNEDahLE4bK5tPigyYfsOmWHO/z8AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATSjvpEF; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATSjvpEF"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36bdda53d99so940800a91.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781469021; x=1782073821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlYZ8ARYCInYVGoYYyh2DszhX2UmROVygqNSfHG9s2I=;
        b=ATSjvpEFyr0FgfU1Mv4wNuYtrFOl6DLul4pD2xZSvV/nQatWPlhCLGa+jAF29uW9Rx
         Uwnn0ankGvgvCqgAp3dYFJHX8XzxdHboBP9ZEz+juRFzmuIoc7c1kObXY6nCw064xyav
         nA64UHNtx1m7PHJiRpQMrerhaU88AcXyvlcG8eCNjsowoMtW9D7BvjE5FMmNpa5LyHsg
         ddp3f5ZemQ25UsWmP7VghOetStSBMQWf7gfY9CsyvjU3z0myJ/uszORq5EoR/0p/6Qdo
         T0+aPtO5WV6yuUbHZ308tFXlJgVMyCT2Adxwj0UsMFfv1jQRcDzc82YbUlNh/JYIQutM
         Pakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781469021; x=1782073821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PlYZ8ARYCInYVGoYYyh2DszhX2UmROVygqNSfHG9s2I=;
        b=c99qjatVaEYiJkNEn2eUdflTjLEniIYrBE6LCpMQqG4EF7xHDqEL7Dd8fAkayNpzsd
         pjc/0uVnWkagY9q7/y3gFZcwhSB3nCWkg6M8YP8SilHRCqGs+/CIV1bJb5tIbhlItrif
         c+9XAwCsMNu3t1uWGg77TSVIz48VwEkLgrsSv7f9gglDM7tQHu2pEL2dVC1SigepEg4x
         G+qDD7BEBPYrp53SruC98pxvNguyafqBScQTOVpUrGHh8NB32KE+L02Mh7ckvphBvFGw
         qtb5Y/5zI2gbZyp2W/T+OBhN/KkhLzaaFdVgHqhiS7PsCwYpfd4qe917LMUxI4WCjYfR
         Xb2w==
X-Gm-Message-State: AOJu0YxTx3o3OMTVebgTSOz2DfMd6pzbKtFdd/FKig6nEem6VSRInx2R
	gSqMZV5XT1+a7G72uK+IR9a5Xme8AV22X/fxIJhEzYvdYwz1PoC4jms2xASaSmZa
X-Gm-Gg: Acq92OH8x1y5vpjuSRtGGYpc+zvJZWdZydGq83BucEZwbEGj8glZn1Sb1gFCrkZ/kZ0
	YLSKQPCqJ5cVjz7dDwPn+4Bio01FG80Xbw1oybKLq5dPq+BBOUt2jKcMOVztkQgbJlanrE5s9Pq
	lX9fo0oO+YO+9DIl3b5NRXFEihu648IP5Ns41uTGNN4hJcX0//vbkFqgMnhg2TVHzj5UTRGrLL7
	0lcwSyEXgFoiAX0+sNt7A3SW7+i+ty8m6PceyJGFuRX+KOH4vfDglJCNKn4fGhMUwsJlu3HFqWD
	LDdFT+i2cC941Wyv4YTtsDbYtf/861dA103yKgVpkjZaDbMIIqi3xf4/rO+5Ned8ApyJZpIcxwV
	dRv/jpGuemMq5AWOeqUb9mbL7Q/uBgqTkT5knNVfh5eQ8LpPnCJVyDVt31fZHbWn5J+KnDUYE0D
	9TII8X+8A/gGiuRsMzkHq42H6rKn+8gOngzg4AgN9QwyiJGrCTn+dS
X-Received: by 2002:a17:90b:1c8e:b0:36d:cf58:b79 with SMTP id 98e67ed59e1d1-37a03fb81bamr12305956a91.19.1781469021095;
        Sun, 14 Jun 2026 13:30:21 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.30.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:30:16 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v3 17/22] media: pci: saa7134: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:17 +0530
Message-ID: <20260614202835.11977-18-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614202835.11977-1-birenpandya@gmail.com>
References: <20260614202835.11977-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/pci/saa7134/saa7134-core.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index 2f5b258d682b..c0e1e8ad55c8 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -798,8 +798,10 @@ static void saa7134_media_release(struct saa7134_dev *dev)
 #ifdef CONFIG_MEDIA_CONTROLLER
 	int i;
 
-	for (i = 0; i < SAA7134_INPUT_MAX + 1; i++)
+	for (i = 0; i < SAA7134_INPUT_MAX + 1; i++) {
 		media_device_unregister_entity(&dev->input_ent[i]);
+		media_entity_cleanup(&dev->input_ent[i]);
+	}
 #endif
 }
 
@@ -836,8 +838,10 @@ static void saa7134_create_entities(struct saa7134_dev *dev)
 			pr_err("failed to initialize demod pad!\n");
 
 		ret = media_device_register_entity(dev->media_dev, &dev->demod);
-		if (ret < 0)
+		if (ret < 0) {
 			pr_err("failed to register demod entity!\n");
+			media_entity_cleanup(&dev->demod);
+		}
 
 		dev->decoder = &dev->demod;
 	} else {
@@ -904,8 +908,10 @@ static void saa7134_create_entities(struct saa7134_dev *dev)
 			pr_err("failed to initialize input pad[%d]!\n", i);
 
 		ret = media_device_register_entity(dev->media_dev, ent);
-		if (ret < 0)
+		if (ret < 0) {
 			pr_err("failed to register input entity %d!\n", i);
+			media_entity_cleanup(ent);
+		}
 	}
 
 	/* Create input for Radio RF connector */
@@ -923,8 +929,10 @@ static void saa7134_create_entities(struct saa7134_dev *dev)
 			pr_err("failed to initialize input pad[%d]!\n", i);
 
 		ret = media_device_register_entity(dev->media_dev, ent);
-		if (ret < 0)
+		if (ret < 0) {
 			pr_err("failed to register input entity %d!\n", i);
+			media_entity_cleanup(ent);
+		}
 	}
 }
 #endif
@@ -956,6 +964,7 @@ static void saa7134_unregister_video(struct saa7134_dev *dev)
 			vb2_video_unregister_device(dev->video_dev);
 		else
 			video_device_release(dev->video_dev);
+		media_entity_cleanup(&dev->video_dev->entity);
 		dev->video_dev = NULL;
 	}
 	if (dev->vbi_dev) {
@@ -963,6 +972,7 @@ static void saa7134_unregister_video(struct saa7134_dev *dev)
 			vb2_video_unregister_device(dev->vbi_dev);
 		else
 			video_device_release(dev->vbi_dev);
+		media_entity_cleanup(&dev->vbi_dev->entity);
 		dev->vbi_dev = NULL;
 	}
 	if (dev->radio_dev) {
-- 
2.50.1 (Apple Git-155)

