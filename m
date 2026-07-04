Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6E531716E
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 20:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783196197; cv=none; b=IJ9JFfjctQz5oXlzgR+smpRhyNaHA1XaHf4rraPOpJOf1PntN3mXHg62sJoimGvTvzIew557b4mCnTPo1D1Ln65zInmmhgRCj464vsveNNKR8x/tgPvz0n8O+2dmF//6B3WmVg72CMy5YqEH1LF3v+9PVKRfMgWILFLpVsxdWfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783196197; c=relaxed/simple;
	bh=tXOHWGUH+mLAhY12WSftjABbkjXUBFUyZ5r3XxC3FTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CN6pxFus7X8S+Z1XEx311XFLA9/1NZe6+0lOUuKVPnlNJbbDG1/dodujI4I5226KVOJAzKW2MehqnhYn7gUhCkYla0sfIYH3QTON21v/FJ9z4Eq+uPkZ59Q6Lr8xN2EILqic4Ab9DOYuRdc2/uiTQr1YIJMmbzSZl6OJHr2bAhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnFPCq1l; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnFPCq1l"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so363781a91.3
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 13:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783196196; x=1783800996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WB0PsRduN1OR6vgNnQ1H3urBvpeTtKBzrk/FhBQnt7c=;
        b=JnFPCq1lFG4EWozQv9aC6oyAzWNiZyJZvZ4r8aFBhanYXlG09SjRaTc9Sg5EPDvFQn
         CZn1w3vIAEMEn7wg++sxIi5kFaEp29CyNAXx3Bok29KCYahhTZZLMr77WPzkAVgzs2P9
         Lj8RpIWBTCLYM537FMu2G/mRGfQsF8qIpWOOC1BD8UVLPxUlGkt4KXuPfvjNwH7vswXi
         52EGwvBBXPyXhv7OB10gBv628foaXaxR+jiqCeRveYP297l79m6L7iD+B22+gE0HPr5c
         VKq+l+gc58mFtGEQ0a0oWEyn2Gbj3OHxQzcomxPZ+y+9rHL+WUwZIjRhLIX2PrGFBW6k
         eCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783196196; x=1783800996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WB0PsRduN1OR6vgNnQ1H3urBvpeTtKBzrk/FhBQnt7c=;
        b=FqLchRDHb74ScFtJtpuI4nFX2oie2Z8PatrBuyz/STI9QNpVYFR9/ZWuQnIWXicCE/
         JE5aVdsrCjcOQMb7no7ZWgTFsBO/GC6V5hhfR8Iln77hkU9zVK6lEHeTPHovhLpsg+cQ
         ksPImtb41QMaFVFnOBY9H6cLWtEXlrAFfWCMbxXGXtJ4pexT3ujJJHaUUF0bzgDf75h5
         NVmpeIfMCv7Gh2VUJfp0h7ZFFTM6zMPCXZkl6kWm2edPWsHOX0Zh1X1vEozoWWng+akH
         C48vBFeDPJ5qXbGC1goZi9JoCkhKFGSsUnjZjDp2qdpepWEpDs93sjkABvSkUZcgP1g9
         APMA==
X-Forwarded-Encrypted: i=1; AHgh+RqBen7VV33pz8fAIXjxLZG1tQOBBA66x+a3Y2hYd4Iu/xnxbRr7MLU60otZorftUL4baKVvC34DHdxSGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW13ej0/5oD8aLmsQOIf5p0QeeaVlVQYUZlTptWCMsSNo+RGnv
	U8/GWRFipSSCfN1tenM+vpn3zfpGouciphYS7/kFZIoXhdnWjIOGLoH3
X-Gm-Gg: AfdE7cmFT+kzcXcO91CJQk1mmJDUMSeL9yQm4ZbmvEUDbDs/wsOSLlgz8bcRUwa4Ayk
	E60aGwF6bRn80yAl1vDmdb653yEyprBVLG2CE3d56Gs8pBCJhncRyivH9mzb6sC2ySQpykSF9LD
	6O550Osa6zZlNkwk/ur3GrauYqtrVTegGnJihjwV+oF+DpVo9jM5+EC9WlQjql8SsytAkhtLyKk
	/ukUbtKiBbW1ryrbTA0VAEph5GbE3aziCXkYDI0ZrNgMnk5FEqtoN5kX2EtN7H3CgiOkF2c2QM0
	rjtweG/EZ1RrWi//9FzNSueqalVdYdmCfoQsctuhQRGlJLyQ9mj6Jh0hV4oneDIWjzDNOGin/en
	pW6R6uG7NHb/v4T385gSP4zCKsNfsJSYTtbaAuzP6JfA2QYgw1FCHuOXRyvKo23GP/QTDrlec7E
	JjqR3T9xh665SQQgxbGddk729VNvxfKnBwNBYFyyOns8ClE3Y0YgC0Aw==
X-Received: by 2002:a17:90b:510b:b0:36d:66d4:270e with SMTP id 98e67ed59e1d1-382803bbc43mr4429700a91.5.1783196196135;
        Sat, 04 Jul 2026 13:16:36 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb7fe46sm40571560eec.14.2026.07.04.13.16.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Jul 2026 13:16:35 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2] media: i2c: rdacm21: Fix missing media_entity_cleanup()
Date: Sun,  5 Jul 2026 01:46:28 +0530
Message-ID: <20260704201627.82584-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver misses calling media_entity_cleanup() on the probe error path
and during remove, leaking resources if probe fails after entity
initialization or when the driver is unloaded.

Fix this by adding media_entity_cleanup() to the rdacm21_probe() error
handling path and to rdacm21_remove().

Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
Changes in v2:
- Fixed a bug in v1's probe error handling where media_entity_cleanup() could be called on an uninitialized entity.
- Added Signed-off-by tag which was missing in v1.

 drivers/media/i2c/rdacm21.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index bcab462708c70..ece8a410e7ced 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -588,10 +588,12 @@ static int rdacm21_probe(struct i2c_client *client)
 
 	ret = v4l2_async_register_subdev(&dev->sd);
 	if (ret)
-		goto error_free_ctrls;
+		goto error_entity_cleanup;
 
 	return 0;
 
+error_entity_cleanup:
+	media_entity_cleanup(&dev->sd.entity);
 error_free_ctrls:
 	v4l2_ctrl_handler_free(&dev->ctrls);
 error:
@@ -606,6 +608,7 @@ static void rdacm21_remove(struct i2c_client *client)
 
 	v4l2_async_unregister_subdev(&dev->sd);
 	v4l2_ctrl_handler_free(&dev->ctrls);
+	media_entity_cleanup(&dev->sd.entity);
 	i2c_unregister_device(dev->isp);
 }
 
-- 
2.50.1 (Apple Git-155)

