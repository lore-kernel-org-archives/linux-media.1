Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3866940D57B
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 06:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294630; cv=none; b=Q1Wo5ElyawI9PkgyAxZhyl4HgrDYoEgnJgS96O2z2Spr8Q67SbIw5cSihat9bK4SEmxVnsmbOmAlWMLoQ975eFepEi1fnRLmyZQjZ6HRkaEN9yuKPrIoa40OUjmtGtMoUdPw+vIN0FtZkcm5IT7P8AEbgbMY729hYMgY8aV7QtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294630; c=relaxed/simple;
	bh=nMDpusEcFIV9U0rABCEEuSYydnkCEh8SsKTXfUaSiCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QvJLUtASff998V4MXpqkn7bkYszi8hOUU5fphM7KglgIZMj2USFUlV1z2Z+8dL2X229yWrOKduQvkHrXsIF3ZnJ1VldCYL1IGUbsvohTebMQT6vDjhVLbEr0HmXztnKeUYbA2S2aXKtwxqZJ3es7mFc9LMF46X0VZ3E5IM8cuNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oHH7jGoT; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oHH7jGoT"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-84847482584so383585b3a.0
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 23:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787294627; x=1787899427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xG6lyol34yG6SFveU+pCiLoj5sH5WXvhQEioHYwr6JM=;
        b=oHH7jGoTKfReqe0ABjBSXOmX+VVfinhkjUHXkAXp5gtzM0G1ug9zwitezRpjj4t2u+
         g5h1vqctJPIUFP9q+FjtPodJHZdRQxOFW2i0wlHFhdgy/e4Lg5LHXLGW/isPBvcf5PCG
         cFU4YTzy42PEUwfYyyZbXVUccxHswwpJPjs8+Xs24Y8kDMkXaKtd/aVG6ryaNWRCCvpO
         G8unEwC6hq4PjyJodHsQ8BCuZSl8ATWccs3AWUyT2wbfkYILONRceBjtoqq5GY6C5dNS
         asCjpFTv5ZrstjSlgo7s3cLbPrWunyIn2Vkwzm4q04vNeSXpGbLEOqPG9Gt+CszNX+do
         mdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787294627; x=1787899427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xG6lyol34yG6SFveU+pCiLoj5sH5WXvhQEioHYwr6JM=;
        b=HGez9homoPUNtHGYtM/LoJONz3FbNAZ+4a/L4X8BO4KeSgtsnWLRpJwM8soOx79OqX
         8vFtpHQ89iLzuthsPewj3AulNzQthFqBT+5cxDn2MfPVTiEOmq0Xq4KGn4ltsAKFqNQz
         ufCjPVkpRRaV+SUW6Pv5nmAClRitp439e1w0A8s7lpfQEbKFJxOAUIO/1HUftI69Ycf7
         hIj23zcQKh/rQ2nAbanzaXTuOgazf0PUhv7t1vrRTWHVx/aOgVgf2smAkQNk2PthXVte
         Hlx612PjFgIm6xfK2Ow/YJIeaUyaPwVUf/Vv/QU7sil461zaDItQcVqkuHhsNR224l8h
         9esA==
X-Forwarded-Encrypted: i=1; AHgh+RqnMTTflat2gW60h5N0BXsTjjR/j7DT7mSNGGmf14iE4kCo7I89U6SVrtYb/Jpe9j0M2VzfoFuoJcUnYg==@vger.kernel.org
X-Gm-Message-State: AFuF++km+rXDH5Kn8PGTrbfXPfvDbnB+zLoMAwCgY3AQMCrqhYY9Aw4S
	ahUSpj7dCHsJ9QIHhsUaKw5+4SnhoKtQJnytjuchN62ehDnLZnCybFw=
X-Gm-Gg: AR+sD12onUpr8ORwHgbQnp3z+K/PeIUP1Qo9o/tEHvPAn6XBOC/gkZAon4pQ+jUZbBM
	Oquuv7WWPq6Ky6SFx2n9AzE6K79OqAgDbCDlfciLKgPSke43BZ/OCFPtCefitZr0ty3S5bFdwwO
	Gnq4eqaT84B71GZYAfpA+DWKtZNY2b2QucGMZuFUf+u0vKx2rAmm/mr4Qwd9DIraskum87ZN7Uk
	hQ3OR9gnq7X2RPVTKo340jEHOEQLDFQ9pAQPJbznz2J09ZxbwcngvlBfFWuC33TiWLCHNR8z3Py
	q19PWvO4BOIIgtWgFVu8P27kgoQisF6a+xrbN4Ry5APM8jtMeekmcd2KP6Qgna/t9zGRMxQht/u
	9IHkydsMRxQLLyzdcgBh7XwkrW9f9f5De9IW4/HnT/jR0iMBP9clQ7De+5MEPVgQmcktPdHJHv6
	y+kG1IPsM43KUlec60WecZrl2MK0eYN/IS6N00zdnFC2FLqj89WZslcigFs4wZYpfApsdgLLlBl
	Eeej81RSFQu
X-Received: by 2002:a05:6a00:2e05:b0:84a:65e8:137e with SMTP id d2e1a72fcca58-851dfa91c05mr11817565b3a.17.1787294627592;
        Thu, 20 Aug 2026 23:43:47 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3362852sm2458566b3a.9.2026.08.20.23.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 23:43:47 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: hverkuil@kernel.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] media: tw68: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 13:43:36 +0700
Message-ID: <20260821064337.194869-1-triet.hoang.dev@gmail.com>
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
 drivers/media/pci/tw68/tw68-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/tw68/tw68-core.c b/drivers/media/pci/tw68/tw68-core.c
index 509d7ddec150..a18107ddb0ac 100644
--- a/drivers/media/pci/tw68/tw68-core.c
+++ b/drivers/media/pci/tw68/tw68-core.c
@@ -359,7 +359,7 @@ static void tw68_finidev(struct pci_dev *pci_dev)
 	v4l2_device_unregister(&dev->v4l2_dev);
 }
 
-static int __maybe_unused tw68_suspend(struct device *dev_d)
+static int tw68_suspend(struct device *dev_d)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev_d);
 	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
@@ -377,7 +377,7 @@ static int __maybe_unused tw68_suspend(struct device *dev_d)
 	return 0;
 }
 
-static int __maybe_unused tw68_resume(struct device *dev_d)
+static int tw68_resume(struct device *dev_d)
 {
 	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev_d);
 	struct tw68_dev *dev = container_of(v4l2_dev,
@@ -405,14 +405,14 @@ static int __maybe_unused tw68_resume(struct device *dev_d)
 
 /* ----------------------------------------------------------- */
 
-static SIMPLE_DEV_PM_OPS(tw68_pm_ops, tw68_suspend, tw68_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(tw68_pm_ops, tw68_suspend, tw68_resume);
 
 static struct pci_driver tw68_pci_driver = {
 	.name	   = "tw68",
 	.id_table  = tw68_pci_tbl,
 	.probe	   = tw68_initdev,
 	.remove	   = tw68_finidev,
-	.driver.pm = &tw68_pm_ops,
+	.driver.pm = pm_sleep_ptr(&tw68_pm_ops),
 };
 
 module_pci_driver(tw68_pci_driver);
-- 
2.53.0

