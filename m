Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9461A3F8ED3
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 06:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294449; cv=none; b=RPRNj3lUGKuZtcW/AJ2cwYTndYkuVkMpSHPViO5h+ghXdhMhXByLLIVxtGtdgvfxZD68BwENn4MLzsWNzL33Fm60N60gpjM/Dfz/hgHeWoU3l9xQe7XpKYyR1PD5pX7OjEvKdV/M1ISgdNLqlndbCEb2sG3daCI4VsXDLe1RMnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294449; c=relaxed/simple;
	bh=Jek4os+2o9UKwL9M8hIqwHBcmcOLvIaKxu7n8ouPmCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G6NxWENVqYETW2kAiK+sgrvld8ShUQAlcUcvhPsXCUALOilzUMOWPg1gNMzfNwg8DwY3MqplWqM0R95309o8Le8rvjPSHK2WRrks7YvEs1JoDS8vEpkgpiR8JhaZZk8jEllHgtfFWnriKGbDx5J+cnQT2t3ciKD+l3HWcCk1u4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2QGOWLo; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2QGOWLo"
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2ccc2e84048so2356105ad.1
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 23:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787294448; x=1787899248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Si2uJLr2C3TfZLA1r/6JVBI+2JbvJPOjGxnYB4ZFk0o=;
        b=h2QGOWLoquSnqydw/Wn3zJo7UlQPp0FG4zhh00L6+mUlWcqtN3UPbdcFq3KUBrD5Mz
         MkKhahBURBAFmYKgPbY+4b7Z8I8YMNk40fmMQz9rX4OKoO/xzeYLtrlTlcT3yM+stZkI
         34e9xYCymJQzzGUmGAJu3ROeBN6Xf5qWJtDwWIzH8w7UB6ED8YFSIccoqrB/EKhZHqoh
         t/20+IoZG+zn/H1X65xu93EkHHTdvljdc1XhnUXUcKVfvBF5617xiTBT3GgSOQgdDVmR
         62nx1u+aDYK6bWXGvpk5QOTtDV6PxsMgj8QDdNFAbNZPcIQZffu17Wkc80RBbfDPbK6W
         GO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787294448; x=1787899248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Si2uJLr2C3TfZLA1r/6JVBI+2JbvJPOjGxnYB4ZFk0o=;
        b=sSNnE9w9Vd0y9a9rRz0Bu3LkkLQ0yXndC2GBg4dmpKbRfak0/ndFxtj0tetH+iH24r
         HD0UWjrqRRejWidkAQ2pfSiwKnGff+6522sZYTbVIUqZYMH+QiZqKhSCq1aqhyOQkNfj
         g7nyP//wiCO3TorcDeXzs9N+jFTbpOQpN9QvGYWqgmX/xtAtfGvBupgKlImFFPy89IoB
         yF0OHAOJeUCnNM0G+K68Srd+1PosJiSaMrDlFsur2Nl/G6IrMF2KdsBRU33O5DRd8vNE
         v6jfKB3ezbd9wS53P+yQ8q0D8iGyvaE2f0/mwv3WohUkRAGXnv5FQVYq5tQ7AzTHxFLc
         RQmQ==
X-Gm-Message-State: AFuF++kps4HA8PQmpILgcagVn4SoQTLR2BCKS4Sz8tyKGhxMpW7GO42c
	bObr6LMeNI0SaNzCzVMQsKye1OMIkYuPxxd6EQ+7+yUVk4xF2hDTNaE=
X-Gm-Gg: AR+sD13xW0nBXONw3Km7f8ryBJSyhbSUP8LSrwi3nJsYNtTUDttwdBBj3ZZBV5LWQmN
	wvKxX2DehRJYXL6kDpcdC643b2PR1kOzNSP16loTqlZaYJH3vZSbfXdpNpsWDVN8BR8LrtHJzqN
	5diVTtJ29EYN4M4qYGHTg/7jR1lfReIy6Bg8yEBWz3P0pqDzHVSYe1a5MJcbj2Kg6C3O04tKLNV
	odYeCXCDgwVJqwhnVWwKzc3Fi83RNXE9s6Phc9zXxRYXtz1xm9EavY/r98KN3aehA6pLJ5BZk6O
	HBi2jNvh++MYWv9u1Il5ZEQo090wmbF/zw4rR60rPbWZ89UV6v4tU8OsRfnhQdRprlzjVZsGNOT
	tj6n2hehw4g8g15VLxSPx3pnbD48+HR3T93JCPX+fbAq6BWuQNNV4J25OHo/O27/CD+u57LtXub
	JySD45yDiPRACLlHjnkkUNxNKgrgdo9Vs4zExqQinZAL+2l0WZ5vYR2wwKSvKXaGM7yNs12x8ED
	A==
X-Received: by 2002:a17:902:ce08:b0:2cc:9179:32e with SMTP id d9443c01a7336-2d64afe9569mr80486015ad.10.1787294447855;
        Thu, 20 Aug 2026 23:40:47 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d5b687bsm15068905ad.37.2026.08.20.23.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 23:40:47 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] media: saa7134: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 13:40:43 +0700
Message-ID: <20260821064043.192496-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr().

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/media/pci/saa7134/saa7134-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index 2f5b258d682b..507ad23776e0 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -1368,7 +1368,7 @@ static int __maybe_unused saa7134_buffer_requeue(struct saa7134_dev *dev,
 	return 0;
 }
 
-static int __maybe_unused saa7134_suspend(struct device *dev_d)
+static int saa7134_suspend(struct device *dev_d)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev_d);
 	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
@@ -1400,7 +1400,7 @@ static int __maybe_unused saa7134_suspend(struct device *dev_d)
 	return 0;
 }
 
-static int __maybe_unused saa7134_resume(struct device *dev_d)
+static int saa7134_resume(struct device *dev_d)
 {
 	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev_d);
 	struct saa7134_dev *dev = container_of(v4l2_dev, struct saa7134_dev, v4l2_dev);
@@ -1484,14 +1484,14 @@ EXPORT_SYMBOL(saa7134_ts_unregister);
 
 /* ----------------------------------------------------------- */
 
-static SIMPLE_DEV_PM_OPS(saa7134_pm_ops, saa7134_suspend, saa7134_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(saa7134_pm_ops, saa7134_suspend, saa7134_resume);
 
 static struct pci_driver saa7134_pci_driver = {
 	.name     = "saa7134",
 	.id_table = saa7134_pci_tbl,
 	.probe    = saa7134_initdev,
 	.remove   = saa7134_finidev,
-	.driver.pm = &saa7134_pm_ops,
+	.driver.pm = pm_sleep_ptr(&saa7134_pm_ops),
 };
 
 static int __init saa7134_init(void)
-- 
2.53.0

