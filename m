Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65762396B68
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 07:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296301; cv=none; b=At+qP7QvMHTfWteLfYfGl5A6Qy7ugqiaJaSZBZFDQok9jyjbY2GEATKH38uMRmhpyOvu4I+LJsgM0aeiWO8QzVaKYZ62o6OzbXsCATEKt63kBPb4tDd8o1K5UsJUuaOtMv78AYFjymNHuoS0XYQi8revYMOU0SWOcnAc2EqvcYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296301; c=relaxed/simple;
	bh=rlqukFGPX0yb35i9juGiuZEpnpR6IMdLIK4oKQz7FYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HbBKlphziJjgi+plOahVU5q+n7CqWRwrKFpLw+OCGS1XUCa3jsigAPMZAADMLC2tkTZ/0oDR8CGw7z+h7EGaKs6cmwL1riW1fTxMWFiDS3o21dnFOpzYlBlrLdjdC7Y/KrWOVkLDJ8u8KHmpNbbO7jCuS+q6y/9UcG2L46y6YgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBopDJaF; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBopDJaF"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cf50c6f235so8818325ad.0
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 00:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787296300; x=1787901100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=16wrpIYLOI0m5wqyuFzJT5HPywTkMkA0wd49jWhLIno=;
        b=cBopDJaF3QdXqn2UF5pCOp+/iVkqVhoR7Vyq4RLstbbtPD478T83YTwc4HEdHN0WIo
         9ugboclYwUM/l9i/Xy2GMgqbwRaPMLOVH5vA4FYeuM0J+l5SFTx+TSqNqaWWzs84Pie8
         1Ly9fh9KBbz//HajAmGvXO00+kK1IPcPZEOVbfj1lRfh2RMmI1zSDkYT+OnkNgvH1Kk/
         TWi2GzTwK3Y/vMZnt1q8Yi4aJqbdTA06VhEtLU37SXtw6HWyRazMMSpG1XCLEpQ9R9by
         5xUAbOTK5mHuVE9yjam+0AQPtBOzfFu1gGgjzAk8IEoxPeuoy/H93u3AYdGI19r3woBN
         Zmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296300; x=1787901100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=16wrpIYLOI0m5wqyuFzJT5HPywTkMkA0wd49jWhLIno=;
        b=lvyaANJjV0+GOYeEZjsq/wH6sVMhQTGVdm8o+RbUh8L2tbLsdSbMy09EduDnceiZCG
         VQ6N7xhNKc4jKKJjiH01DDXSdKz80dRRVpFncECbNhaClwq6HcKHjYzHaq0dz33k3ouB
         +dwSpk8Nw6/snDuQYko1tV84mUeHH9NMQfeACp0BlwSRrumrUkZ/HxhS5Ka3UNtEuPf4
         eAIHT0DjztgrwuokK/wp41uQcT3nEF2cee4CaVPKTABjsy2TwNXjHmqwjd8SCCr2z3CS
         zRRlZLF4wyFG9IRe/4MPn1MOGDT4OS/At8GAuv2zixLgMAiGFJvcyH1G6ZHbE2GmDWak
         Z2vQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpf8oqOtyLfj/3LfAVpnGUiAtebpleWjYjve2ZwrEfMTCDmpJndLQlnq9oqQPkd7kdLrA2UU41okqbPgw==@vger.kernel.org
X-Gm-Message-State: AFuF++n2VZCSafQiEVb22AjEqd6V1fpVW6yJfeuRBzxd+Ws11RTZLCnR
	OlR+fuxktIb0HT4F4s46cECh6SACizVtUhyzj1B3GDliAV/OXkDGkG4=
X-Gm-Gg: AR+sD11IMIw3ntQlSNZ8JS8EeQ5PnBkjMVSVQwkWxpiquupXGeDOz39Ho6oQ0ZlcWoW
	gvwPr6prly5jW+aUGftnJmcDEdHfnQSfnT9Pi3gCEjCED6HmOI2fSw7pgZ1F/tiKikb2iuAayJj
	Chui0u0n6flXNykdc3S+eBBYIcjT4BVLNQaA+8gDxQS1679fuHRl9exKZgjgKLQ21iI1CKOxbHO
	XtBYB4M/dO/1wpmJpiexRju99266r/tNzOX/87ju4tLgFV18NdZkk9PxK4OgND7Sh1Lj6SMChd0
	CLUkmvPdTmaSkMeW1kFpTzoeE4wyHb0PvMvbkY24l2mjo2BkOY2Hh4tBpiDVUYS4gZE9yK/DkVB
	Wfzz86eoSi1Wm6gGitQcq4VXFZSWzywyLUjuOsNQwZhO5gSbns1cykocb3R9NuUGUgoZ9rFImG8
	EHsNu0xyKIeUxwpnBDKiX3Wps/zae41N/cYpLg6sDfHipwgAblwVPc+6cCDBBBnJiXWQICdyD9U
	A==
X-Received: by 2002:a17:902:fc4f:b0:2d5:e9d5:8ae with SMTP id d9443c01a7336-2d64adf7718mr90616605ad.5.1787296299719;
        Fri, 21 Aug 2026 00:11:39 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d5552cesm14793585ad.1.2026.08.21.00.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:11:39 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: laurent.pinchart@ideasonboard.com
Cc: mchehab@kernel.org,
	michal.simek@amd.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] [media] v4l: xilinx: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 14:11:24 +0700
Message-ID: <20260821071125.213335-1-triet.hoang.dev@gmail.com>
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
 drivers/media/platform/xilinx/xilinx-tpg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index 7deec6e37edc..8bac01084605 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -686,7 +686,7 @@ static const struct media_entity_operations xtpg_media_ops = {
  * Power Management
  */
 
-static int __maybe_unused xtpg_pm_suspend(struct device *dev)
+static int xtpg_pm_suspend(struct device *dev)
 {
 	struct xtpg_device *xtpg = dev_get_drvdata(dev);
 
@@ -695,7 +695,7 @@ static int __maybe_unused xtpg_pm_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused xtpg_pm_resume(struct device *dev)
+static int xtpg_pm_resume(struct device *dev)
 {
 	struct xtpg_device *xtpg = dev_get_drvdata(dev);
 
@@ -895,7 +895,7 @@ static void xtpg_remove(struct platform_device *pdev)
 	xvip_cleanup_resources(&xtpg->xvip);
 }
 
-static SIMPLE_DEV_PM_OPS(xtpg_pm_ops, xtpg_pm_suspend, xtpg_pm_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(xtpg_pm_ops, xtpg_pm_suspend, xtpg_pm_resume);
 
 static const struct of_device_id xtpg_of_id_table[] = {
 	{ .compatible = "xlnx,v-tpg-5.0" },
@@ -906,7 +906,7 @@ MODULE_DEVICE_TABLE(of, xtpg_of_id_table);
 static struct platform_driver xtpg_driver = {
 	.driver = {
 		.name		= "xilinx-tpg",
-		.pm		= &xtpg_pm_ops,
+		.pm		= pm_sleep_ptr(&xtpg_pm_ops),
 		.of_match_table	= xtpg_of_id_table,
 	},
 	.probe			= xtpg_probe,
-- 
2.53.0

