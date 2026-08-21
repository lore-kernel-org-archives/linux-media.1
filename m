Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE81A4156EB
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 06:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294316; cv=none; b=dO682nAhLnvwYloK5VFxOgSLs8eVOIJ7XrlKnC5cOu30/QCObtoUVbHr2hMyuDrcfo2pbJ8+bQAI6xZaaGf8NwKxPkzHrmmvwC33CKkb/fYg/AjYAoH4Fs23Khu+WVE6h1Mq1Ls5qOUYRxmdE2cv0IC1E8UjGIJhcLhy46myg1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294316; c=relaxed/simple;
	bh=9542EncnhMb3M5u9FGqabhPIk+F0H49k60xRyPwzIBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YXwKlY4VXzgG5SdZW/hRFr396kq6rUMy7BYPptKKk5J2tLm1l/35MW3uC9iWYq5hIE+gcqz4tNTX7WHeSNOoePIs/ylEOP4cKITSeFGqVgQ4n0ryiCkiMRRIq4ygiaDI4SkMAq8v8O3DVDdW9TUW1YdFLHWlNzzmu1Dkbw4lKqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZb6xONn; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZb6xONn"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-392a608284dso209399a91.1
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 23:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787294313; x=1787899113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=osuvx9fj8LERvuZIMjsT9+rwDsorzB6nR1EbeoBm5W0=;
        b=WZb6xONnJbQhMK994fduFHbg4smKZRZ7YI0Q4nCnxa0tN2+BX1ljLpBQ5ixvWHt3hb
         yr0NQn7vBd4wrl1aaM3aC2+WXEdqizt4uOu4drOrvzT2c3TrJrTLh024kemIWc6dOdwj
         BFoZIisDv30LVVc0GuOPmAOchDcDmlYjwR+AHsgHTPj2YOyj4+qEq/rndrdYXalwtLQQ
         b4renhUdz63ZobCzQf7nsq4aV2W+rZ10+yzkJsz10KN6W+hZoXbcyyMXocYxWGIPX1+L
         Q09iexAnI9lq25myXTWcL6r66DHHOUYgsiUyDPaOLnYkdYKEGij7yR1vskF3/uPEDcYq
         NE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787294313; x=1787899113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=osuvx9fj8LERvuZIMjsT9+rwDsorzB6nR1EbeoBm5W0=;
        b=PUT34qqOdcBqtZeVlkOdJcj9QCXXHb2maAss3TfMvXKRmjqRt9qW57GgFo1Z4a5dY5
         Y3175Qg9OtR5XAbimS6mPjHMIdZJBiy9uZzHTkJ1B4dlX3LsItfHbm2yxLJ9igaF5nrt
         SJDfRenKdy9vuBOU1pfc8x5JlO5cVsZzAaTakIc/q/CJZ0eonP71dKzAiT82lMTlvv03
         l3Zctjt+RZsywE1fkEPhGY7DoUQXAIjcHplWwFm+Qxy4z9+3ee0nsPJHuWDUZ5N/X70f
         Cz5cfO+9JWcihgEtTbitsfAuxLpELeXD5Xk2OUO27GhSVap/LiIXW7QgT+1DOb8P8uJ2
         1owg==
X-Gm-Message-State: AFuF++kmpUkLy3A7QRRyzW7r5uk62TNqL2n+IEzIQWdkMyBKb+7NUeVK
	YbrOorXfHQuZIdZmGpoxX4Tm54JZ0SJgPSbBwDDOrJFYxdf0aw4AhFA=
X-Gm-Gg: AR+sD10+8IRcgvqAFPq/PVSHEB/HdOCsl9Nj5bj+ZYlAmMrWO7wkGi+PVib6SDOt9T+
	kj/FnlQvFuanEGVgAKQFB4Pg38IJNFhPQactdXW6m/5SAurTEf603jEop8LHkR5nozq9OEvoII8
	PBaeM8z221hN4TNBc7IOIEwIBioNxgpEBC+LSVUdsvZc8r/gt1XF3Y8a7QRZrswhHvoATbKg5d5
	EQPYqqj7n1ZnbTDunUZPuScX2QNAp0D3lZGnzrhplu1ZpWjPY/+lvIe2WbgXVO6ivRi730YpHhT
	Jv/Cq5sYh/nCh9WlQ7UcK/j3+jbrB0Xr6kmZPqvbW5NpPAMORk8wWujmjCuU5cosS9dbUVDjfyt
	+pJNhalVMMSUowDTtlLqG1aqfyEvbEB+edwHWHkxhgLfDgS+DF41oXREYVozYA+ETPNIf3d+2AJ
	W0YkejUidRfPEJApofz6YeRpURx0NpnP4eytYQ54GBuDxP4CZgcxQGsaDDjlJjyz/JRWuFuuTKv
	mW9j6EyLMBSZ4lZhO4WiPMI
X-Received: by 2002:a17:90b:2f0c:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-395c3847e85mr7635037a91.16.1787294312851;
        Thu, 20 Aug 2026 23:38:32 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4c18fa7sm2001695a91.14.2026.08.20.23.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 23:38:32 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] media: cx88: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 13:38:29 +0700
Message-ID: <20260821063829.190306-1-triet.hoang.dev@gmail.com>
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

This lets us drop the __maybe_unused annotations
from its suspend and resume callbacks,
also reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/media/pci/cx88/cx88-video.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index eaa46a2f92e7..f8f2843495f3 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -1549,7 +1549,7 @@ static void cx8800_finidev(struct pci_dev *pci_dev)
 	kfree(dev);
 }
 
-static int __maybe_unused cx8800_suspend(struct device *dev_d)
+static int cx8800_suspend(struct device *dev_d)
 {
 	struct cx8800_dev *dev = dev_get_drvdata(dev_d);
 	struct cx88_core *core = dev->core;
@@ -1576,7 +1576,7 @@ static int __maybe_unused cx8800_suspend(struct device *dev_d)
 	return 0;
 }
 
-static int __maybe_unused cx8800_resume(struct device *dev_d)
+static int cx8800_resume(struct device *dev_d)
 {
 	struct cx8800_dev *dev = dev_get_drvdata(dev_d);
 	struct cx88_core *core = dev->core;
@@ -1617,14 +1617,14 @@ static const struct pci_device_id cx8800_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, cx8800_pci_tbl);
 
-static SIMPLE_DEV_PM_OPS(cx8800_pm_ops, cx8800_suspend, cx8800_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(cx8800_pm_ops, cx8800_suspend, cx8800_resume);
 
 static struct pci_driver cx8800_pci_driver = {
 	.name      = "cx8800",
 	.id_table  = cx8800_pci_tbl,
 	.probe     = cx8800_initdev,
 	.remove    = cx8800_finidev,
-	.driver.pm = &cx8800_pm_ops,
+	.driver.pm = pm_sleep_ptr(&cx8800_pm_ops),
 };
 
 module_pci_driver(cx8800_pci_driver);
-- 
2.53.0

