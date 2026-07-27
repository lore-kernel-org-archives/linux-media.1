Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8084252BC
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 18:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785177311; cv=none; b=vGDShSPh/DzP6ypMeZIf4kZ7tFBceoKGgPjmGWsN94olt7kE/Wap+ECqCbsAI25CX6d+Q6qGXRqW0GClAyM7yZEg0hdy9oCtwZ5XLkEIBVxeRVjGIlkA5T7OsqYlSrsJVpJ8OwYS7UulcPAU9vnYJuxN8RSTBitnfgsEoKt3FPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785177311; c=relaxed/simple;
	bh=0p3hT4N/VlqQQj+WQX0FWwulHHc2Gt38/2TsWEJXjUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BVC5pxvSVDq/a1K4yC8NmuL6aogJ59av0+hH4/WEcUU0sLtj3dCeJ2aNiZTbjw/HbQPrJ3ubvtCvJQp4280lq7fVetAd8C7cdKw5kaK44n6Txom3ICHbr9x8ACXNPEdD4ULyNrutvgwLEQM4upwg+5/oVOSSQmgEXVg9IkUwQGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQe0BI8N; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQe0BI8N"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92ed3993c1eso172038185a.1
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 11:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785177308; x=1785782108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WG1MrVZv1CLm058WLMPZV+j3enBqJCTO3g9sfArNrrs=;
        b=fQe0BI8NhGS3f62KDs0Y6zUteWk2hanwfu+QiUwrb4ISnUMkUfBjQgJ6Dsspgxzw2R
         5ZH0oSoBqOCBYIDPSrl4NmhvUoF1gqQUcNBs3Baddq4NV6faRZ5foH4UHWxPUebbpXni
         3Y4yOveT34u8f6J574rhx+4cuh1LZQ5IbXdlKBI53tylnxFWXikMPKfzdphOL8wvtolP
         AvIXcp7A+a14AncAqusuzRiqhpbxXeR8QRFAJcwGdBlOFKS+rS4OGXVRiYHTZJ0+7cRD
         c7gPNxaCt+wjcjnU0U9kXjOSpReEq920QC6BGXmp0VOYsYOdtXTbPe0c7ZDDtRES9ToG
         ub0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785177308; x=1785782108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WG1MrVZv1CLm058WLMPZV+j3enBqJCTO3g9sfArNrrs=;
        b=noqIvV70y0evu1A2eztNzoPJARyUQL9rZF3ZzylH/yJHyGJsjypKXbRcqKPeKb7SNK
         u+7cy7iTsr4hpxT9WbgGYlrs/eUVPRLCOF4/keJix5+BwA64dLpI/tqpjdp+7A/XEx9Z
         tElku/IrPMHW6zVkTX6C6isn8EGdphaFGTr5hSx3A3Aw9Zl0Hrjhaa2sEMeQgZ1sJ3Qs
         R5BYmBToxypDsGy/UTg5xVChHPNYktVS+3vNhgQXeM5vlddymYojKGOBga67mht+t5O3
         W0BcLY2HQ6BgjQlHuqXchvD7SAnfzrd0g551okPlGJ8/0LdgtCm4kSDfIE/8krteQ+Db
         McNA==
X-Forwarded-Encrypted: i=1; AHgh+Roy44TA9hzAaXMwUzdTOPZWgXqE08he688uiU/tbMF/MK3ksQBOACNGUt3FYPV5ZJJdb+jHTb/58kzvTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxH9xiVzU9TWI0DMxVZwRNG5kHoJPWnS7IetfTmA7JVQ1KpQ/wY
	sWeyydCp3pC7TK0zKWOEk1pZRpttpULqddZfFChQXT+6lNQFBSlK1lnC
X-Gm-Gg: AR+sD13ZjUhW90EU1QbJUGpRyGygAWlJdBnOIzv8LFpQL4wicRNvIJl3RMz64SEwWPT
	vQCfESnnEMmVLnBMKQ0Hq8fFjggDP1kIe438r6E0C+qINyTCtptxCQeco/ugtxHVG102i2P1vla
	RObrHyKWhI/NN65/EaP7piSmT8JbZa8v9DQyMzx+CHtBfki+sN8M74V+Hxrf/mKGj3EM0v2OVdf
	+AggZVputle8rsEMrICiM+4faLa64MdJ3nLizCRWSLlbclMiwINcZIgLpjYz/gmsK+560Z/8zON
	9ueGzlamNttZDbQwssbiT++nnzrbjv73VxJ77Vp+N+l4lY1tUhCuNR5q1AVinY9MTrxCrsplApv
	JCo9Nlj5aYVv61HjjQY2XdnG6pbxCeoriDWfsDG7Zhqx8nAVJBK76QN58qDe3FGba8VZTiqlHA/
	TAbgK/5t+crKlSvdZ9feSAbfuSbUzsCGdkhvkpArP5gkjkW+0Cz4GyBer0EktbTboNFD+m0Z7De
	C5OJ29PEBKm/hIUAsrKoE9fON4ZksH0PS2Vrr6E8eg=
X-Received: by 2002:a05:620a:a410:20b0:92f:bed:e252 with SMTP id af79cd13be357-932df6e9fdfmr774871085a.48.1785177308271;
        Mon, 27 Jul 2026 11:35:08 -0700 (PDT)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de635f12sm677589085a.25.2026.07.27.11.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:35:07 -0700 (PDT)
From: Yifei Gao <gyf161023@gmail.com>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>
Subject: [PATCH v2] media: amd: isp4: fix self-deadlock in isp4sd_pwron_and_init() error path
Date: Mon, 27 Jul 2026 18:34:19 +0000
Message-ID: <20260727183500.298036-1-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725203640.915626-1-gyf161023@gmail.com>
References: <20260725203640.915626-1-gyf161023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isp4sd_pwron_and_init() holds ops_mutex through guard(mutex) for the
whole function. On any initialization failure it jumps to the err_deinit
label and calls isp4sd_pwroff_and_deinit(), which takes the same
ops_mutex through its own guard(mutex). Because the guard in
isp4sd_pwron_and_init() still holds the lock at err_deinit, the call
re-acquires a non-recursive mutex held by the same thread and deadlocks
on any initialization failure.

The error path cannot simply drop the lock and keep calling the full
teardown, because that teardown is not valid at the earlier failure
points. In particular, pm_runtime_resume_and_get() drops the usage
counter again on failure (via pm_runtime_put_noidle()), so no PM
reference is held when it returns an error; calling pm_runtime_put_sync()
unconditionally would underflow the usage count, and the teardown would
also touch ISP MMIO while the device is not powered. This was previously
masked by the deadlock, since the thread never reached the teardown body.

Replace the single teardown call with staged labels that unwind only the
resources actually acquired at each failure point. The error path no
longer calls the locked isp4sd_pwroff_and_deinit(), which removes the
deadlock, and each failure now skips the steps it never reached, keeping
the runtime-PM count balanced and not accessing MMIO while unpowered.
isp4if_start() and isp4sd_start_resp_proc_threads() already clean up
after themselves on failure, so their resources are not unwound again.

Fixes: 4e5e7a7ddb4a ("media: platform: amd: isp4 subdev and firmware loading handling added")
Assisted-by: Claude:claude-opus-4-8 smatch
Signed-off-by: Yifei Gao <gyf161023@gmail.com>
---
v2:
- Reworked the fix from splitting the lock into staged error-path
  cleanup, so that each failure unwinds only the resources it acquired.
  This addresses the runtime-PM imbalance and the MMIO-while-unpowered
  access that Bin Du pointed out on v1, while still removing the
  self-deadlock (the error path no longer calls the locked
  isp4sd_pwroff_and_deinit()).

Link to v1: https://lore.kernel.org/all/20260725203640.915626-1-gyf161023@gmail.com/

 drivers/media/platform/amd/isp4/isp4_subdev.c | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
index 48deea79ce6c..868d1c74d35e 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -687,7 +687,7 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
 		if (ret) {
 			dev_err(dev, "fail to power on isp_subdev ret %d\n",
 				ret);
-			goto err_deinit;
+			goto err_module_disable;
 		}
 
 		/* ISPPG ISP Power Status */
@@ -697,7 +697,7 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
 			dev_err(dev,
 				"fail to set performance state %u, ret %d\n",
 				perf_state, ret);
-			goto err_deinit;
+			goto err_power_off;
 		}
 
 		ispif->status = ISP4IF_STATUS_PWR_ON;
@@ -709,12 +709,12 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
 	ret = isp4if_start(ispif);
 	if (ret) {
 		dev_err(dev, "fail to start isp_subdev interface\n");
-		goto err_deinit;
+		goto err_perf_restore;
 	}
 
 	if (isp4sd_start_resp_proc_threads(isp_subdev)) {
 		dev_err(dev, "isp_start_resp_proc_threads fail\n");
-		goto err_deinit;
+		goto err_stop_interface;
 	}
 
 	dev_dbg(dev, "create resp threads ok\n");
@@ -724,8 +724,24 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
 	isp_subdev->irq_enabled = true;
 
 	return 0;
-err_deinit:
-	isp4sd_pwroff_and_deinit(sd);
+
+err_stop_interface:
+	isp4if_stop(ispif);
+err_perf_restore:
+	ret = dev_pm_genpd_set_performance_state(dev, ISP4SD_PERFORMANCE_STATE_LOW);
+	if (ret)
+		dev_err(dev, "fail to set performance state %u, ret %d\n",
+			ISP4SD_PERFORMANCE_STATE_LOW, ret);
+err_power_off:
+	isp4hw_wreg(isp_subdev->mmio, ISP_SOFT_RESET, 0);
+	isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0);
+	ret = pm_runtime_put_sync(dev);
+	if (ret)
+		dev_err(dev, "power off isp_subdev fail %d\n", ret);
+	ispif->status = ISP4IF_STATUS_PWR_OFF;
+err_module_disable:
+	isp4sd_module_enable(isp_subdev, false);
+	msleep(20);
 	return -EINVAL;
 }
 
-- 
2.43.0

