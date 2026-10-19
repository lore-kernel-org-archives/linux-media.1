Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792451218;
	b=1g+VMjpTG+vdvPLJCuD+S9yvH7bRGztXcUQGruSDnFy2ujm7TPg5OctB/M+PXfSe8Y+S
	 iORrvdaH9x6bps7941EljHMaCJfxYoHuE72HXhOktnhqT+dIE8Pa22r2aW51GSLyT7Fgk
	 xdAAsFObzOlRwE6tBL8/uxbpzGvTpy76fPQzOu7234qPv6DB11tDnmUEvSLf3OrEZiu72
	 s7K9WyDQIHdwIjVNEd7yxUbUPd9SPyzx+Bw2ZQdm3rLekgfX8+YKMaxVX756m4belmB10
	 Qjxc2ywLHD5mpq8oRfVKC4rrbi8HyFOMnWV0QiYJYA6wPpMO6DXiQUE0ftCZnjf0P+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792451218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eI+3DKitrdejqomr4uOZhFHbSbiOklqRvcG3ea3JJEA=;
	b=tD40f1uzrM+VB0Yr1+pXCMGXl1BXrEugnUXMudP8TporQ0fI2wvuHdYlxj+p+40hYzpC
	 7hplKZoS1Cx+J9z6ssYB/Qlkipz3xq9YQtCylq2aFwMdSG6uszJy7LA5u2c6MIcaezYRC
	 +51xSCGDwipBE1ecmv/O2LykS2ZuIiOzlXCgaPQXy/oYiBBjGbRiG47QgyoSjf29ZzzLX
	 DKv2SZ+lsHZFKoW7SW37uiMChlJcjtBoKwB642DqbOMUf4rSK4zae6DJqZAVRh3rF09ff
	 EFBIzTrWu+RKP6e40lNCBS9Os62D3jF3xyDvCyPUIN3artov1Ee9QYun4q9g3j/TDhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Hm4hnAXq;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01F9606A31D
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 23:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C01F9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Hm4hnAXq
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91b89c6caffso21030826d6.2
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 16:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792451217; x=1793056017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eI+3DKitrdejqomr4uOZhFHbSbiOklqRvcG3ea3JJEA=;
        b=Hm4hnAXqJAQgYrXqOeGc9+8J+aE1I+TL+SalozRMx9/bYz1NuT8So1KGmSqpI4j3xc
         YMrwm5M5SlISJroNW/pxWs7gZc/lKhkorZJxAssgOREVyzkGvMzy82jRffq/fdxsiDuf
         r5SMYHSLevO+6YRrAYtdjydDi/dATxxsxAkAd7c4eSHSUhuR9MWYaSzaqw6gu+mhNuHz
         CmN6m2dGNwZjLv9YUOhrNTbABhOx6/wEEvmQs4xQfNOjHtM2jxDANeIHfL2hfgMLDad7
         cXoMzKiOGZeov8AHi1a8/zjRvewPcDGHPy4tdlKXV2+nJIlyKKALqSZqaPi6szgdgQU9
         ywBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792451217; x=1793056017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eI+3DKitrdejqomr4uOZhFHbSbiOklqRvcG3ea3JJEA=;
        b=pE1fH+7rf9yBQeUYx6N9FKZc82x1lJ88ap03eUdzoJDXxdsTfEL2v10KGTh8r508Kw
         5b7vAI2qUkkiWsBcimejMSIVdrV27OCFaAy2PeBXL6hwTkluB8Mpqy7Um0lE+K0skmDw
         UYjMYLjokkZIdzxUa3hqldFdMsxnjZs5RmoGm3D5GJci5NM0RvmLX5d+dKlF/qkpGt0c
         t4gw+nM1JCRwN6Bal9XZihWf+vyKkv2RnRG3eVLq2F/3cb7mI/dz6x6Q9U6W1U196skS
         g+RFCBy3nsf6CeS9hz8UCpYh+ZEmWRJT9yBd2WQh7aL+mEW1RSUsmXqsT8++MHDmFUYX
         vowg==
X-Forwarded-Encrypted: i=1; AKwUvBwQbZbGtyUiu3fIFs1UKHrprwz7fPLDBKXIf/N2F10f4Vx0jfnzVQi+i58v/J4YaqL8yIAXtjojIs/9bA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL6QbPH0AF1zWCdrAEX3nY22M2Sxn1cm5RDtyOnKYl2nxbkOH7K
	lFJZuJJVamvJFw/2eBWNtKTXf9iAqgiHoIWBIbWvoqtzfCASBqFlNMk=
X-Gm-Gg: AYBFou2h288VQhWB9TXWqpDmMgmWmrneNPum21lYcUD/Mp0q41Mr5onm1b81LLzYyhk
	kv0rTWDgMq+Vau6y77K3XiLL4dbehc4RgmTiYyEQETbr1MqwU1yfXHn0w6Dk3G5pp7y3jUx8Wgk
	vCg3yzuuPeju5pV3fsMaDkEtu70CbEi88wYMcIwEDGWgZb1QKHG4s1mULcJUKNkqOc6fGqWaV5I
	bOtrg+1fEaNFHWwnSZFWScmfJcTUDVja9smXgsVzlDIk8l6Nbyahh4LGL1P3Xb4/N1N3LFAOXCE
	XOIjCiQDRyoUWbcWEY5klxFhuJPhr8dph4RfexZPmv+TrROtPLRF1FgjW3Na4q9Jby/op30kyQb
	dLOsFbTreGmbwAOWw9scTwNnLuKbQYCH0cRl5zP1l2RFRzsFgiSHorOjOBnsNhxbDsBK2fmSIjU
	FMxvoVPm82oa0MVTrQgsGwlcYgGD4nbwjgBqVBxJ0djljS61J8bCiRn6XEnzdZrnn2NnpJ83yNv
	FReBbo1Erp+ohOAHHRj8akhSs7/bSzkr6QMIqKwmiWuIFdM1pi4RWx/MbTrt7NAyoXwygyQLSzE
	u/uSOG+j8ffxcc+mZap03aw+mJaa
X-Received: by 2002:a05:6214:468b:b0:917:a8ae:26d6 with SMTP id 6a1803df08f44-91bdf199a1fmr163819196d6.34.1792451216575;
        Mon, 19 Oct 2026 16:06:56 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c04a5791asm6822066d6.2.2026.10.19.16.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:06:55 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] media: s5p_cec: release IRQ before deleting the adapter
Date: Mon, 19 Oct 2026 19:06:53 -0400
Message-ID: <179245120580.760232.1413226255768013894.s5p-cec-v2@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cec_unregister_adapter() can free cec->adap while a queued IRQ thread
still reports transmit or receive events through it. The managed IRQ
remains registered until devres cleanup, which also unmaps the registers
before releasing the IRQ.

Use request_threaded_irq() and free_irq() to release the IRQ before
unregistering the adapter. Request it after the register mapping and
adapter initialization, and free it on adapter registration failure.

Fixes: 1bcbf6f4b6b0 ("[media] cec: s5p-cec: Add s5p-cec driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Compile-tested with Clang, W=1.
No hardware runtime testing.

Changes in v2:
- Use request_threaded_irq() and free_irq() instead of the managed IRQ
  API, as suggested by Marek Szyprowski.
- Preserve notifier teardown before releasing the IRQ in remove.

Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.

 drivers/media/cec/platform/s5p/s5p_cec.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
index 4a92d3230f661e5f33137eaf81418d5fa529f812..9ce37f2c9ea87b2d385c7eea86bdcd7bf9d642f6 100644
--- a/drivers/media/cec/platform/s5p/s5p_cec.c
+++ b/drivers/media/cec/platform/s5p/s5p_cec.c
@@ -199,11 +199,6 @@ static int s5p_cec_probe(struct platform_device *pdev)
 	if (cec->irq < 0)
 		return cec->irq;
 
-	ret = devm_request_threaded_irq(dev, cec->irq, s5p_cec_irq_handler,
-		s5p_cec_irq_handler_thread, 0, pdev->name, cec);
-	if (ret)
-		return ret;
-
 	cec->clk = devm_clk_get(dev, "hdmicec");
 	if (IS_ERR(cec->clk))
 		return PTR_ERR(cec->clk);
@@ -231,16 +226,24 @@ static int s5p_cec_probe(struct platform_device *pdev)
 		goto err_delete_adapter;
 	}
 
-	ret = cec_register_adapter(cec->adap, &pdev->dev);
+	ret = request_threaded_irq(cec->irq, s5p_cec_irq_handler,
+				   s5p_cec_irq_handler_thread, 0, pdev->name, cec);
 	if (ret)
 		goto err_notifier;
 
+	ret = cec_register_adapter(cec->adap, &pdev->dev);
+	if (ret)
+		goto err_free_irq;
+
 	platform_set_drvdata(pdev, cec);
 	pm_runtime_enable(dev);
 
 	dev_dbg(dev, "successfully probed\n");
 	return 0;
 
+err_free_irq:
+	free_irq(cec->irq, cec);
+
 err_notifier:
 	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
 
@@ -254,6 +257,7 @@ static void s5p_cec_remove(struct platform_device *pdev)
 	struct s5p_cec_dev *cec = platform_get_drvdata(pdev);
 
 	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
+	free_irq(cec->irq, cec);
 	cec_unregister_adapter(cec->adap);
 	pm_runtime_disable(&pdev->dev);
 }
