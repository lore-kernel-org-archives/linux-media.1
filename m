Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969593749F6
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 17:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783187644; cv=none; b=Ln5GZ9rI5vCqciq02FFWadqpSVPTfhL2dd+8tTF990zfQhZ3nJSa0oHEzWzb7QL+rrMlOv/sIIkGVYsLLfw5NjG5cHme1CcE2zfIZGOrsaDIPv9b5WnRc3TRSlhGTRTT8yd5nIs9MD8oQf2xj0UQ1JAf4DbokKUgXwk5d1+tVzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783187644; c=relaxed/simple;
	bh=Z9N6pEsigWAk2UWIWHJBzftcZEwVRuN0TCZwIeyDEcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3q9cSTLBMt8g1dZDnYHRMEzrXwv9X8sPKLIi00mUMOsYFZygMYBqH858o7HIdiGZckbtWJI6KVm83SreDoYSnWmOwqjy6Omu937MFfkcmjg7CbZYJx4FNDwAxFAUtbnaWmhtIjLAFckoEH3pNIjPdVUzzIYKS2wvmdmE/bDAls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mskwjMrL; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mskwjMrL"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso2082877a91.1
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 10:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783187643; x=1783792443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BtSYlQaJpsM/z+8viYvtsDhnMR5+tk/oB714i1BVbU=;
        b=mskwjMrLePnHjiFK6ADgVOxM8F+UMdGCSlfwCB62u1OOF+NxJmoh8hJluwGZGXkDnZ
         uApmlaPnNmiuluxaNZXg1AesEX4IGf5o26v67edgNmeA830Tz74AE7XS3KkH3fpF3pRs
         wSblRu0HmTC4OEe0QekgJOkrKkku8HlHMhVFIJmBJVPJAWlprrtcZb/1meozVL3UCM80
         dA7Ak4Jx7ql0BnQbv9uUsoh6ae4Kfmdglk70d/ajITGhT7Z7G4KOexWtiXO1ScIqpjD3
         YzNFRCwincScoQJs64b03379crBsWT4EA8ddhudHqrSZCiQs/VLqvG6Soj9V70cUWpe8
         SPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783187643; x=1783792443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1BtSYlQaJpsM/z+8viYvtsDhnMR5+tk/oB714i1BVbU=;
        b=gVR7umYH/tAHzIpTy21vCwCr1prwsiYDZc4JZdsHZ9GrXey9SaKyXRHGkO9uzcUgTJ
         Yna1FscIx9nivt0J4XfAagQgh7IaUT5xESupaWH+LOnKIcBxbgnmE+JEcWiErkYzsnRX
         fcebGqxShEGaNT1WcAaAiS2ymmlxwRQL0kwIqEtMj0JPVEou+F25LuElCoJmIXzCjRnT
         lYwzC94+wbcMA5rSukGI1qPwREKXplbFZy6uDs71+oQvSVJEUfBVmUtLhTwz11xXquqB
         2a6RZnqM45fkLBNQPcrea3unB9SwVgmC2+7vGc/BmSgncQgi/oovJEDf5h6JF5+BWV5O
         1Mfw==
X-Gm-Message-State: AOJu0YzxKKyhGQ7ys0yqyWuwQcbwSjJ5eTCAcHte6vikQdUGygNVHfp2
	E6rdbkm0dd3EqT85XZ/LDrxgRhgXyHMGT38lwRqHcDHxnVtOeilGSrk16MAtjjJc
X-Gm-Gg: AfdE7ck388m8IM9kS+0WQQ5qJ5zVilXOalruEkl7jOB0m3xoTnptd6/CuXSr0hDIDMG
	NjY1AFJOOP7SL1rpEfxgYYVUmDyPiBPvzPXnBi53wH2aqMkz1ztHEu/jH9qwD1uHjrsTvSlt2Cf
	s2IVK7MSaRrHUdxurqDu82BLyWlyvSc7b4U3Zr1SpkR5uuHQvHXi7v786O8z1vjLwYctkmn1bEK
	NMqISegqOLcwkdrQfJ87VPUUUss221Rjqw9WfCn+zNou96WkDv0cVOFsVKn/kaa12AGRg4IwwdC
	tWVpQVCAVEMx+iSN2Eg7rntA8BGHxjZJwSi3KvszouqOSKeDlMI2v1tzBbH+pS4s0kbNsCxHy5l
	QY3p/TlKK5xAkLgYUzuRmgInhcI9yiuC4nKTY/uOn5dDlcfaoOuCRfRllrtWKCGMr4BAxDl4V3K
	/qRFJgujNsUj4c1qqIlGzQCC6FEJNRplxH+qF36LjwolM=
X-Received: by 2002:a17:90b:2d07:b0:366:132:fda7 with SMTP id 98e67ed59e1d1-382808b2089mr4165513a91.10.1783187642936;
        Sat, 04 Jul 2026 10:54:02 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f39e07e0bsm15588749eec.30.2026.07.04.10.53.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Jul 2026 10:54:02 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	laurent.pinchart@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3 3/4] media: renesas: rcar-core: Add missing media_entity_cleanup()
Date: Sat,  4 Jul 2026 23:16:42 +0530
Message-ID: <20260704174638.66302-9-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260704174638.66302-6-birenpandya@gmail.com>
References: <20260704174638.66302-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe error path and the remove function fail to call
media_entity_cleanup() upon teardown.

While currently a no-op in most cases, calling media_entity_cleanup()
is an API requirement for entities initialized with media_entity_pads_init()
to prevent memory leaks.

Add the missing media_entity_cleanup() calls. Furthermore, introduce a
dedicated err_entity label in the probe error path to ensure the cleanup
is only invoked if media_entity_pads_init() has successfully completed.
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba..5bae8eb0ee19 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1211,7 +1211,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	ret = rvin_create_controls(vin);
 	if (ret < 0)
-		goto err_id;
+		goto err_entity;
 
 	switch (vin->info->model) {
 	case RCAR_GEN3:
@@ -1246,6 +1246,8 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 err_ctrl:
 	rvin_free_controls(vin);
+err_entity:
+	media_entity_cleanup(&vin->vdev.entity);
 err_id:
 	rvin_id_put(vin);
 err_dma:
@@ -1270,6 +1272,7 @@ static void rcar_vin_remove(struct platform_device *pdev)
 	rvin_group_put(vin);
 
 	rvin_free_controls(vin);
+	media_entity_cleanup(&vin->vdev.entity);
 
 	rvin_id_put(vin);
 
-- 
2.50.1 (Apple Git-155)

