Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27681F3B85
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 20:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785011823; cv=none; b=Mgd6idleRKSk3Pw6qlDWgbHFkbX7Gcu3fftK1qU1Xevkz69/REw+JKR4tq12PyxWH/t074vRVXYXNtDpAFPFDuRqTI8L93czyEeNOe55wr5bF9fL7WPYwvGxIbpUWMO9/wZbeZkOIkIy5Ho6O5KFS/ZffMHhrazVM+LtPlh0htU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785011823; c=relaxed/simple;
	bh=b9eO2ufxTmDiGllV56Ryr9wIv2g01JYHT8p/QFrWqAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m/hWdmILcnGR+SIIT0fdqrpfH8AIjxLVl7/QQXQny73pmsHPvyY+TAOqSOa7/6cLPh3eilWIcL9RESTqHkrT40i3vxVcewBN0zd8jEpgLp6C0bA++mAWS54vNKQFDfMFI5noSjK2+Zf/+Emci6Tlz6sqvenYFmpwRffH9k39LWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iS790ojS; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iS790ojS"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51a868b6962so16711151cf.2
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 13:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785011820; x=1785616620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VKThyZDQm2GBlCA+6BHocjxnWLD2psH1sM+1Vyl3yjU=;
        b=iS790ojSM866YTzxP07cYhwBZ32+gDT15oYQENJ3C6nR+29IBX9pZvXjNMJ/1knqb6
         iNO0n7UdUTqHaYIZbNswv1becD6ZtI8QrpgfAE9FZoGEsmbMYG9YjIpwPFv4Zg7+irgL
         vQBQtsXa/hn662Vtv0kky+GewRIjAB2bdeVBFlut8+x/7LeoMGF9USZJkX9QVIw0S7Rg
         Dv32Knlk24k90eOCXmXfo0mQUadkmhSOsTxlr5+kJM8/tVqjrQF2VQPMKiZeslXyE3h6
         84q3Ho2VoVTDU1TgDFPSknyK2DxLKABoZhqbyIhIAIxw5wi8mCHVFmSrP6jd81fSF7Hc
         0evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785011820; x=1785616620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VKThyZDQm2GBlCA+6BHocjxnWLD2psH1sM+1Vyl3yjU=;
        b=IF/JGlH0z8mJZfGTAXV+7K6Ih5OmwVDBPu1Rry7xPDcADHMXhJFc1IJB4fFoAd8/2B
         l1ajcknGZIo8J4flnD1KkLl4tN/ZxqtZNc4zukpQyLcVnWQFitHfDNNFFjQnwvleiTRA
         sKo7Lz8HSKIgPu8MylfVn8DkQXSkfY+mfnx0x24AwbcQE4cvDkG8Q0SrJt1/9oYHxWE8
         q8VvPkNipcgg3pJCwrX3LRHENwN1TmPpuLrNG+OpzhwHHBdurhUFDvkXzOxz0m1cowlO
         pmO990RN32jBzrXKyvsZuNMmnLsHqrYwx3tYKsn72FuRw7d1GHn+MYU01p3wprILijBz
         ys+g==
X-Forwarded-Encrypted: i=1; AHgh+RqpRTo6WJHRhEzjRh70rjZlQLsTkXl8LdD3TvrdoZZ6+jMGE9GfyLuAu+KgNs7FLDfcjzv/zEpbKbJ5PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwekGLJOJ//T2POyq4TtbtRMHB3GoZzm9LDNuEwzPeZ/lREQxB7
	opCjFix5h6uq+SgqcO75x4n/DjMrDfNIgQJhPMUz813sweVJpnBvtBkF
X-Gm-Gg: AR+sD10IRxrtd6FoXp3uBSwszaoygF9ol6I+2+5NdKta27yzJ9pSL2rHUycCEWjyLzK
	Pn+X/wPixF4ltRQFGdzEeFLOOBBVnKuUHPZR05tDpzFTYnZlOwPOG94CPl5rMG2oX1rTJ+bQnfQ
	OO8Bm23ThJPfPF6UJs492+uboHatJWuqilGmJwTqO/7IEY0EoLHsA17QDG+Yg/chezqqoj1zdRz
	3szEqjhvZJB2CvVMEcMY7W6QyEkK5W0bm20JEKRc526zDnqocJvj+faxpp1CGVduCocTb/VQL1y
	7RaoJIMcfjc67ih2SlR+j9ggb30jbUb+6R458g4APsu1uvhkotNsKFwZ8tTS/Nce5fn85+ZP01o
	ciUQXMw9e7dNqVtpYKDPWz3SrLUVoWOTottb1N+HwS6kFnxuBm/UB1fRo/F6gSysZFRlPBIx/tc
	DnWfwCAMoF7yBpgoaR65PFzDqADYPYGv+QFSHxxEzJxpLGKb9irZY0ncfR
X-Received: by 2002:ac8:6f0e:0:b0:517:5bc1:e1f0 with SMTP id d75a77b69052e-529a814332bmr35514241cf.0.1785011820462;
        Sat, 25 Jul 2026 13:37:00 -0700 (PDT)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a28118bbsm23067631cf.12.2026.07.25.13.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 13:36:59 -0700 (PDT)
From: Yifei Gao <gyf161023@gmail.com>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>
Subject: [PATCH] media: amd: isp4: fix self-deadlock in power-on error path
Date: Sat, 25 Jul 2026 20:36:37 +0000
Message-ID: <20260725203640.915626-1-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isp4sd_pwron_and_init() holds ops_mutex via guard(mutex) for the entire
function. On any initialization failure it jumps to the err_deinit label
and calls isp4sd_pwroff_and_deinit(), which acquires the same ops_mutex
through its own guard(mutex). Since the guard in isp4sd_pwron_and_init()
still holds the lock at err_deinit, this re-acquires a non-recursive
mutex already held by the current thread and deadlocks.

Every failure path in isp4sd_pwron_and_init() reaches this: a failed
pm_runtime_resume_and_get(), a failed dev_pm_genpd_set_performance_state(),
a firmware start failure in isp4if_start(), or a response-thread creation
failure.

Move the cleanup logic into a new lockless __isp4sd_pwroff_and_deinit()
and have isp4sd_pwroff_and_deinit() call it under the lock. The
err_deinit path, which already holds ops_mutex, now calls the lockless
helper directly.

The "stream still running" check remains in the locked wrapper: it guards
external close requests, and the power-on rollback path never reaches the
STARTED state. The cleanup steps are safe on a partially initialized
device: response-thread stop is guarded per-thread, and gpu memory pools
are released through isp4if_gpu_mem_free(), which is a no-op on
unallocated pools.

Fixes: 4e5e7a7ddb4a ("media: platform: amd: isp4 subdev and firmware loading handling added")
Assisted-by: Claude:claude-opus-4-8 smatch
Signed-off-by: Yifei Gao <gyf161023@gmail.com>
---
 drivers/media/platform/amd/isp4/isp4_subdev.c | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
index 48deea79ce6c..eabb6b36705f 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -607,7 +607,8 @@ static int isp4sd_start_resp_proc_threads(struct isp4_subdev *isp_subdev)
 	return 0;
 }
 
-int isp4sd_pwroff_and_deinit(struct v4l2_subdev *sd)
+/* Caller must hold isp_subdev->ops_mutex. */
+static void __isp4sd_pwroff_and_deinit(struct v4l2_subdev *sd)
 {
 	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
 	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
@@ -616,31 +617,20 @@ int isp4sd_pwroff_and_deinit(struct v4l2_subdev *sd)
 	struct device *dev = isp_subdev->dev;
 	int ret;
 
-	guard(mutex)(&isp_subdev->ops_mutex);
-	if (sensor_info->status == ISP4SD_START_STATUS_STARTED) {
-		dev_err(dev, "fail for stream still running\n");
-		return -EINVAL;
-	}
-
 	sensor_info->status = ISP4SD_START_STATUS_OFF;
-
 	if (isp_subdev->irq_enabled) {
 		for (unsigned int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
 			disable_irq(isp_subdev->irq[i]);
 		isp_subdev->irq_enabled = false;
 	}
-
 	isp4sd_stop_resp_proc_threads(isp_subdev);
 	dev_dbg(dev, "isp_subdev stop resp proc threads suc\n");
-
 	isp4if_stop(ispif);
-
 	ret = dev_pm_genpd_set_performance_state(dev, perf_state);
 	if (ret)
 		dev_err(dev,
 			"fail to set isp_subdev performance state %u,ret %d\n",
 			perf_state, ret);
-
 	/* hold ccpu reset */
 	isp4hw_wreg(isp_subdev->mmio, ISP_SOFT_RESET, 0);
 	isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0);
@@ -649,11 +639,9 @@ int isp4sd_pwroff_and_deinit(struct v4l2_subdev *sd)
 		dev_err(dev, "power off isp_subdev fail %d\n", ret);
 	else
 		dev_dbg(dev, "power off isp_subdev suc\n");
-
 	ispif->status = ISP4IF_STATUS_PWR_OFF;
 	isp4if_clear_cmdq(ispif);
 	isp4sd_module_enable(isp_subdev, false);
-
 	/*
 	 * When opening the camera, isp4sd_module_enable(isp_subdev, true) is
 	 * called. Hardware requires at least a 20ms delay between disabling
@@ -661,7 +649,20 @@ int isp4sd_pwroff_and_deinit(struct v4l2_subdev *sd)
 	 * during quick reopen scenarios.
 	 */
 	msleep(20);
+}
 
+int isp4sd_pwroff_and_deinit(struct v4l2_subdev *sd)
+{
+	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
+	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
+	struct device *dev = isp_subdev->dev;
+
+	guard(mutex)(&isp_subdev->ops_mutex);
+	if (sensor_info->status == ISP4SD_START_STATUS_STARTED) {
+		dev_err(dev, "fail for stream still running\n");
+		return -EINVAL;
+	}
+	__isp4sd_pwroff_and_deinit(sd);
 	return 0;
 }
 
@@ -725,7 +726,7 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
 
 	return 0;
 err_deinit:
-	isp4sd_pwroff_and_deinit(sd);
+	__isp4sd_pwroff_and_deinit(sd);
 	return -EINVAL;
 }
 
-- 
2.43.0

