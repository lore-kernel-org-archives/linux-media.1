Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E88C37266E
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 22:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789080530; cv=none; b=HtJkjSL68hW+P9cE/ZKydDHov9jc5u8z0VNIU/WMreMU8aS1h2MulB+tRLvZL8YDTyl13a7wNvhl8NEh4Se6sGUvkbLkffj5HU5UVfoNPWSxZPzqj9sIGUt4U3pgEM4LUUQKHIvQ6HgHowzoXF5ohEl1ZuBskFdU1wfJGGG4n8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789080530; c=relaxed/simple;
	bh=FD1CVR6P390fK5SosNu21bCJZwzv/9aYQoB8hxCdVYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tqO6jirjmZ1gNuVBQMLMQqVDTLtXbEENxx4vdgiaScJFNfkoKVnF7cCnASydvYFmAoVAqi28HsTrzvUYgf1NewuDNcJJFmY/DZbGiU6L4CQ79vTB2zlrHMf/P/2OMI7EdBmVTY1KFgwg6rbtvC47JgjfmgWycKTeGxWqw7m6NhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+270yTv; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+270yTv"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcc3e03so998016d6.1
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 15:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789080526; x=1789685326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gm6ysHQo5XVbaM7QmaAZGcihUIXrGGRXHoGmW7yFDKk=;
        b=F+270yTv/NXZvrIRXPEVgsgixMf2s9a4KV60/kvCnL3GlUO2KYZgMkxJly9nD2iFio
         R26EWGATWHSgKCtFIFZTiUZLQeAaFemMAUubbjumDJ+4Ec+YedbZ/sq5sfNBTNHMELyF
         SQvi9qf6UHBeqfwgfBB/f7epxCMovBx2OChMb/vVIDEXVluXfi5kbL0BHIcKkmGByNgG
         TALz5jt8dIvQFO4kMjpCHcvCiZ1LOUExesvRFZJu3vUg9lxNvraxGdwGX6KGH/i/ce8Q
         iLk6jgtWiQJMcUVa+J0qnP3oCtk7JQDnqnTx3B7ZjrRLMgQhPZcwHsTjBnQ2Jd+Lk/df
         OHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789080526; x=1789685326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gm6ysHQo5XVbaM7QmaAZGcihUIXrGGRXHoGmW7yFDKk=;
        b=ZyuaRqPjUA1u0TOl/ygVMlT6LbBnBgGxb/8hgsoErxbYUI36EjzVSeNKlt67x1yM6L
         g7V4EO40pRqFBxdvf3DD4j5qcCk13jDnTlB2ysKRxa1FAjQxtkU//ZhxzXpu3WqzKwrQ
         /M0HQjQJT8V+xkub1Gn26Zfw0iRLGf7KTMX/8TMZe+zW0F5DH9eVVoj94ZoxpKrAXMIp
         a4qVv9U72j2xCi5fBtKxqhoRPbWYFHfwqnT11qW2loVpe0SRIoCBYWuRMBh8N+GoWnvo
         5U39joVBHz3jbbb6+Np9q1h9RVQn+32AAy2lIp0bqfMl6bDO15yBouwl9PF1HQQqHDFd
         3TsA==
X-Gm-Message-State: AFuF++lSYKLjkJ/YA9BZ0ud2qm0qCdE8S5m1ODdldDGkynWM46SpU76V
	Z8Zg0BfJfTR1uA0MzrZ1R/h3OsB1Qv1n+Kzwp6KWRlyT3S0IflkJi5iOPKBDId8=
X-Gm-Gg: AYBFou3cI1BNnHIlILiWKzKA+3wg5tWQR6BNEcaJQr9MEhqI1VoylK/kCothnyO+InW
	5sY/fjOaQ6bNyvQWIwzkN5vZsqw5bbEUbW0t2Z/16anOB0sN4oLj6Es5jeDmCxvDO7syP14tlWy
	hCXFwtXLjeMPmwDp+WhKJgBX9GlzC6Qjqorl9BE4LEylQXpOzXuTha0YCcUkXE053psIHgWy2H2
	hrfy+Jcn7rpFdc0PqEj39EHTyFOXVWT6pa5gPjEXIRjPCdr6cCkBh4i3/1Q1GoM+jeOIzL+IxFJ
	lEVmKvsrvMkEPpxghyj6dxt8Qr7jGDKdE8d4emrNRAUOZWPzU1UPc5p/kvx0cMRSETA+fyuLoAH
	jg12t13a3HfkXW1apkpNrUqPicD/+vbZPJTBaf1K577LlolnHgyc7AgLLDSWGn7yDGN4tPU2VgM
	kRVgZc9l7EYwwzTi07K9+H8AoMGwRJY8SGgsMuDCDWjlbLX/qvKJrZXRiXZoDE/nOvBro9sd6w9
	32sTq/UzDGwiWe0PN268F2zCqO6ZGAe+gpSiZq6nlnPLMBn/W7w/JtQDNORSTN/0oHf0xc0PE8N
	rGsUe4VJL0+h7ZppLX2vr9MUhD4GVvwA5Q4=
X-Received: by 2002:a05:6214:2b8a:b0:90c:a989:a68a with SMTP id 6a1803df08f44-9120ec865c1mr22173266d6.11.1789080526563;
        Thu, 10 Sep 2026 15:48:46 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45a78bsm6777996d6.8.2026.09.10.15.48.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 15:48:45 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: linux-media@vger.kernel.org
Cc: ehristev@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: microchip-csi2dc: Power off on probe failure and remove
Date: Thu, 10 Sep 2026 18:48:37 -0400
Message-ID: <20260910224837.15554-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

csi2dc_probe() leaves runtime PM enabled and the controller powered on
if subdevice registration fails. Removal also leaves an active controller
powered on, since pm_runtime_disable() does not suspend it.

Disable runtime PM and power off the controller on both paths, then mark
it suspended. Check pm_runtime_status_suspended() after disabling runtime
PM to avoid turning off clocks that runtime suspend has already disabled.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 2de0b3c0f678 ("media: atmel: introduce microchip csi2dc driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/microchip/microchip-csi2dc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-csi2dc.c b/drivers/media/platform/microchip/microchip-csi2dc.c
index e69292f3b2a909be6a044db6ad086a7b0e082802..56cccb02bc562febe5e6a36e69a9ae014e005ccc 100644
--- a/drivers/media/platform/microchip/microchip-csi2dc.c
+++ b/drivers/media/platform/microchip/microchip-csi2dc.c
@@ -727,13 +727,18 @@ static int csi2dc_probe(struct platform_device *pdev)
 	ret = v4l2_async_register_subdev(&csi2dc->csi2dc_sd);
 	if (ret) {
 		dev_err(csi2dc->dev, "failed to register the subdevice\n");
-		goto csi2dc_probe_cleanup_notifier;
+		goto csi2dc_probe_disable_pm;
 	}
 
 	dev_info(dev, "Microchip CSI2DC version %x\n", ver);
 
 	return 0;
 
+csi2dc_probe_disable_pm:
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		csi2dc_power(csi2dc, false);
+	pm_runtime_set_suspended(dev);
 csi2dc_probe_cleanup_notifier:
 	v4l2_async_nf_cleanup(&csi2dc->notifier);
 csi2dc_probe_cleanup_entity:
@@ -746,12 +751,15 @@ static void csi2dc_remove(struct platform_device *pdev)
 {
 	struct csi2dc_device *csi2dc = platform_get_drvdata(pdev);
 
-	pm_runtime_disable(&pdev->dev);
-
 	v4l2_async_unregister_subdev(&csi2dc->csi2dc_sd);
 	v4l2_async_nf_unregister(&csi2dc->notifier);
 	v4l2_async_nf_cleanup(&csi2dc->notifier);
 	media_entity_cleanup(&csi2dc->csi2dc_sd.entity);
+
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		csi2dc_power(csi2dc, false);
+	pm_runtime_set_suspended(&pdev->dev);
 }
 
 static int __maybe_unused csi2dc_runtime_suspend(struct device *dev)

base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.47.1
