Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456DE30F7FA
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468941; cv=none; b=Zfks6p4UVF/oeKirVUJ+yFMjC+5LL2n39grVLje8GjL22qO40X9wE2Gmi3Uls+Hbd7/0SPWnKb8euzX3b0d5YleRK+9REO4rqPDk9q16HHJ3J2s8MTfo4bEpX7DWWx1a10FC+hv/0XMPOYoOwvS136TA2eJrsxMR1EZoBtbc9+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468941; c=relaxed/simple;
	bh=9JI68SRCRoyQz/f7w6vRQinxQ01p0+QlDdaGDWZEg2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=esDXopQa3QUEtv0wW7KgXh/MiK3YJtfolr7Eo2rGY5xV6G83bvec1cfnkpOsdMwlx9H1aTIoO1KpdmOK99WaFdadgZyoDVnv5vOAt8Kqpqikjczzmy25dkCJ2cjCONNEB4a+D/FuK5uEOQOWAFoHHgFMij83ZTeuMa9lk4k6qqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7oJoFUn; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7oJoFUn"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36ba3ea5c46so1429834a91.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781468940; x=1782073740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fV7l28be5P+qBSslSEq0VtNafl/nMiAJlS2Suv7NaqI=;
        b=Q7oJoFUnpGy8JXmkQ8MlnYajuuVJmzU1aYZgmu8S7HosxXAsM+WICj2Uru52Rug2o5
         ulyj4/G7cTYMLQ2EAd83IRIosT75RUItzMqvp34/vSeMVEfDFGjLzuKtTHGX6bj69r34
         cBP01x5ejyP9HgHhEv3cYibB6C/qZF8fiPnPcESpWgdFKMm3Cjqcpg0vxRFXjXGp8abg
         xiGsvRmrq6EPqo9Vj9SPdwDXX38b3xKNt9lAhpqcE12KHgYer+l1H2QMD79HPZxjN20O
         iidVPU/vON+TKVpXzAw/D/UH4wiAzHO7rntq1aW9BTVrKEEfXXI0ktJgULyvehv0NxWf
         RQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781468940; x=1782073740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fV7l28be5P+qBSslSEq0VtNafl/nMiAJlS2Suv7NaqI=;
        b=tA6B01UOoIMcyHukEcHU7m+EO8NhkpDtLJWk56wq25TWKE5eBo/VFtDY1eqAQ86hjP
         OJegW7vnBy8KCGVDbqbhoo/fJw4dq8vG8MOwq9fFMWa4tW5+c8mn39tnqqAYgX8x8PI5
         mLaYQBSdcYjJGLbEJCeXGDNXp/Ur4PjI9U6h9+o/LW1EOy6Rjf8TXTeyOxWcMgGyBC0b
         e4M2vPOCaaXUNEweQGNp3xs6LfDIlkIa2p1gpkKwY34eOhHwiCrFTH6jmV8fgVaP0iTl
         4XRxJh32mG9ReIPv0lWb/n744z6AWJG1E012WwyI7xtidXQNujcMl23fOCCh7w4Nwz/N
         JvYQ==
X-Gm-Message-State: AOJu0YxhvN4MMbzOJSTp/T+Ofi68FoXOwlBc7trNLAwoKddGHUUjx9TD
	FKqS9hKDmQGZzH5re6eEvpqj53hLi7HMPKB3JYfaAZ09N0Z2rrcDz1EKzaogiZbi
X-Gm-Gg: Acq92OHlyTLHqHTJKjzvpfDO2/9AS1TSOOLXfbAcqY9RbLu3dn+KBMWZ8510vawnvIr
	6QNbJ00wfVhLwA62lxMxhMutGAsOlM956wfOiyM7T5xyHEPcF11SzHrV3y/le0P2+IWTEPnett+
	J5efUe/ETD32V7WCdTwYKJzx0sMe9H5o0OZtGl7xq3z5Xad6l6znbdEnQzTipaEvxEfclD8Fby4
	aKSfSKw7WPDkzENi2KLiv3E1YqTQvcN5bizAqidDpIbozyPFWMgnWEko4OGE1azqv6Jt5TpB54C
	Hyj9atfG8vWqsM5CpTR+nF4lR7AfymxhTbN42CscUgLVf+gnSFoAEvCLKWfqWTeSW5Oe43h0l+H
	6qH1tRTQiQWjE61+4XeUlvkRPJ76wssmrKoWHI9UEZmZWE3NL1rXxooneXdfhDt1QIE3+cNuYPq
	VX+5MqmuluIDDCi3qJYNA0Uboj/Aw/imcNBX9ffNv0OXp9zO1jUBym
X-Received: by 2002:a17:90b:4c87:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-37a024176e6mr11963842a91.8.1781468939652;
        Sun, 14 Jun 2026 13:28:59 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.28.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:28:59 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v3 04/22] media: i2c: mt9v011: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:04 +0530
Message-ID: <20260614202835.11977-5-birenpandya@gmail.com>
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

The media_entity_pads_init() function initializes the media entity, but
the driver forgets to call media_entity_cleanup() in the error paths
and remove function. Add the missing calls to fix the API violation and
prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/mt9v011.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/mt9v011.c b/drivers/media/i2c/mt9v011.c
index 055b7915260a..b7ef8bff727d 100644
--- a/drivers/media/i2c/mt9v011.c
+++ b/drivers/media/i2c/mt9v011.c
@@ -520,6 +520,7 @@ static int mt9v011_probe(struct i2c_client *c)
 	    (version != MT9V011_REV_B_VERSION)) {
 		v4l2_info(sd, "*** unknown micron chip detected (0x%04x).\n",
 			  version);
+		media_entity_cleanup(&sd->entity);
 		return -EINVAL;
 	}
 
@@ -542,6 +543,7 @@ static int mt9v011_probe(struct i2c_client *c)
 
 		v4l2_err(sd, "control initialization error %d\n", ret);
 		v4l2_ctrl_handler_free(&core->ctrls);
+		media_entity_cleanup(&sd->entity);
 		return ret;
 	}
 	core->sd.ctrl_handler = &core->ctrls;
@@ -577,6 +579,7 @@ static void mt9v011_remove(struct i2c_client *c)
 
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&core->ctrls);
+	media_entity_cleanup(&sd->entity);
 }
 
 /* ----------------------------------------------------------------------- */
-- 
2.50.1 (Apple Git-155)

