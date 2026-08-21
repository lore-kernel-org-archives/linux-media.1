Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC4925B083
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 06:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787293664; cv=none; b=lsAnlBg6AmMSEwUyHHK6WbKvweWI3pbZsfZiXxkjbDXzNWVAVxlWFffvjYnmyTekzD4CILHak4OqdRnpLCQHmeK3TKzEOiishiVPWy9p6EtnWyurbTslfY0toH32ZXrAYDRzFtycf5tFP9poJRox05L7Vm2P/k5L4TE2AutESP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787293664; c=relaxed/simple;
	bh=Fm8+y02EMDJW1Bz+AEMXf2S3DF1ECgyxxE12hjZE5P4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e6U6FziJmKD97au30b8+aVHID5m8/v5UX4N3EXouv2SaIPHqDf1YslhR5YbCFJKEO1YYX5Kr+HVLbL1/dOjAuuDMmslh/pqRwmHyuOM+2tGEv6wlKnH/fU7/aDiHRkL7zHoLtC5txcyFKoiIteJpq057kf4KYnW/A19n9xEHWVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pwy9MIMa; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pwy9MIMa"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3896ccc93b5so169179a91.1
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 23:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787293662; x=1787898462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0wevSjusM8yA+t2nlCfJYuqO/4sDLT57I+bH9/IZH/I=;
        b=Pwy9MIMa7NW5pJx4pKWw3Zavq7o8G2NyQrJhtJGqMeMaDQHHR4oOl7hgSdJFV31BPC
         nrZ/zLw6q7d8lCtUue7RukspsjCmIYco85HMtBuSvB9eH3j+HJZcXBJ4xF99Te07TsiH
         IHkSRq8Dg7TCqX14NNZEPOqKKM88IJ13kNynhxR4PAVLNcbpWFOMr9xb2Y75q/reaoG7
         QhacnLsQvFMOdvwEvCDEdIdYmRfSZy6uu45hoGzHZp5Xd6pXkScBprocp+uX/7J4eTGf
         5fhqXPjRMV4byOuf3exdq11k2GgRfB1PgvvGOGGij6i09bc5PyakvHB2t6e9FgT1eEI7
         pjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787293662; x=1787898462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0wevSjusM8yA+t2nlCfJYuqO/4sDLT57I+bH9/IZH/I=;
        b=EZhAkB8aKLiVvtbTo4NLO9CKJG5V6IiNrY5sOZQScK289xycBuRgVG0DuPvpQiUKTz
         mZvHOHc0ufp6KbsPXk3kDifMOnrhE2sQ2Gfj0DgnCHRJ1bqumCi5c4f1CrgfWkskupAe
         FxkeJEgzcuYbfjT/7omKeiFtZqmz3ZU53wlL5xM8B6slZ7Nf27c4zGbeTYBUS+of0snG
         OnAI3763c2+dJPCKZknT8Ze5AplxbCt5of8PA9PG6WWsl5ML/OLGg/G+WqEaygq2esbA
         PvMRVmuOAgRhfD6YTI4ZcnSEQLwfiWkQDN+l+xDufKlcoFDUC1Mm/PNyvfTX6hVYiwP+
         kpnQ==
X-Gm-Message-State: AFuF++mzTkvyzwYKka6UJUs7N24uWhCWJWm7c99NBIr+3zx66l7zr8Rd
	j7bm5Q7j8SbkOsm/+G9pv5L3JKfQcgzSkMdea1o8Ql6chUlH/3tiuTyTo2DOmLDQlrts
X-Gm-Gg: AR+sD10mzc2OSaTWTda5itdL51cK/BF395UmvPuAFjkcByomYcd39lzYQxdG5NzMnie
	uRSNT5m+XrfalELWpBL9q+QecA7TNs64kuOA61Lj6o+H9IS86Yl7WKeGTYFoy1eW5EduDZYSGI9
	GtQ/QQXkpuvbyapRitjk1d5rhXz1QINxZunhpAD78O251+zkv8cKpoTiZ4H75Igl9gyzmMGKvld
	TvS1iyMcATUecGBfREsB1VMZTXNgro/unAYO09Pwlcj9RQ8nY12qLKbA0zfTrDzKQBjhtTH1XL5
	TiZhy2ItC81xCRqBFtpZTpmRKma2L5s5T5GbH+T3jdzIBdswAVwDvbZD+/2R6D7KzRMr5F7YSMe
	WdrPqfQ9GNm53X1IaaQHAAHxX3S5C+w1qtlZLZbUidAhUktC7QurXJfKgaYPXXLyxWBX3ssXaAy
	5FMLXXclYuTj4QtP/OkvDGdjMy8vao+fZxKFHxw2xJZo/CLnNvFHvYMwXFJpOFRlEvCGpKPmNRt
	w==
X-Received: by 2002:a17:90b:2d91:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-395c39cd288mr7816485a91.14.1787293662190;
        Thu, 20 Aug 2026 23:27:42 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4be44fdsm1896934a91.12.2026.08.20.23.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 23:27:41 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] media: bttv: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 13:27:37 +0700
Message-ID: <20260821062737.182717-1-triet.hoang.dev@gmail.com>
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
 drivers/media/pci/bt8xx/bttv-driver.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index c631b8bbd386..8b9ca59f9434 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -3504,7 +3504,7 @@ static void bttv_remove(struct pci_dev *pci_dev)
 	return;
 }
 
-static int __maybe_unused bttv_suspend(struct device *dev)
+static int bttv_suspend(struct device *dev)
 {
 	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
 	struct bttv *btv = to_bttv(v4l2_dev);
@@ -3535,7 +3535,7 @@ static int __maybe_unused bttv_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused bttv_resume(struct device *dev)
+static int bttv_resume(struct device *dev)
 {
 	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
 	struct bttv *btv = to_bttv(v4l2_dev);
@@ -3573,7 +3573,7 @@ static const struct pci_device_id bttv_pci_tbl[] = {
 
 MODULE_DEVICE_TABLE(pci, bttv_pci_tbl);
 
-static SIMPLE_DEV_PM_OPS(bttv_pm_ops,
+static DEFINE_SIMPLE_DEV_PM_OPS(bttv_pm_ops,
 			 bttv_suspend,
 			 bttv_resume);
 
@@ -3582,7 +3582,7 @@ static struct pci_driver bttv_pci_driver = {
 	.id_table  = bttv_pci_tbl,
 	.probe     = bttv_probe,
 	.remove    = bttv_remove,
-	.driver.pm = &bttv_pm_ops,
+	.driver.pm = pm_sleep_ptr(&bttv_pm_ops),
 };
 
 static int __init bttv_init_module(void)
-- 
2.53.0

