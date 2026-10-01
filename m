Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C9541B8F9
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 17:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877481; cv=none; b=FAK0q/ZdZL3XrKG6m1jm8DtLAbEyy7z+4o3Iu0fOEWqOAPUP4KtsEmdVFpjlsyqshhuJZEZzdHX8zbNCaiZ1vbvOH8ykYtPI6QHxfWjYuzhvKQGk9XQr96qDTCV2FVNzAw6NP/J7xA/9UPs9ShypgUk3ryaiQvsha3Yv1mG5H7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877481; c=relaxed/simple;
	bh=jpJ+Su3Y1yhm/gM5Dhwlk3M8DvQgQBJXozNtOrhbmY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umOmp5JkZr7b3SOSB+qNj6XxiOSGQVRJQMsNVu8wLrM9gpbFkvmnuGiyXa8hqK4ONnKZgkz4Xm+F5ZHgMoZ5Vrntc8J4ehisPoGRBHMSwI9my2urZsOe1lPOKqvAVTyLAChoJSlmTjzVSdioGotOeXY1Ut3ccqrSM2CaimfKf6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNGs+jaV; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNGs+jaV"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-53320068d8eso63936121cf.3
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 10:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790877467; x=1791482267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=axc/agQFuJUMgO0JWETHJcM/R1Xc0CldGQrnTgdLGIs=;
        b=SNGs+jaVfW43SM1Zgl6aMZN+jyG4LJHlDbCqUHj/SM4aCLKMnDVQIuKCoCnpLPz7le
         RxIQ4Z1qlRrYx8VsITrwpLd8/+1pSR5/OfbB+qjsB3fCkm4QVXaUB7Kz8QqSR97Bkm33
         L25YAi79gY2Y89N/UY1hVrqFeZtSY45ue2RvlRqANFPgq0sYaMr9oXAuBM4M9eTVYscX
         SXk9BktaXIdrQkF6z2NFkXdRLmcijYdcLmpNV2scAxtmpIpiTUvlLEDZl+2om1+ZTLHS
         md3mSVfNJrMP/awCNVVjrG4lC7RvIGxlKkX2sUxfCpMfCvOjYBeKdZ/E27pLJ9ywNSF9
         0Raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790877467; x=1791482267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=axc/agQFuJUMgO0JWETHJcM/R1Xc0CldGQrnTgdLGIs=;
        b=gRNwM1UBviLI5N9JC6wQdbst7Sre/oelbjwY6RFMMOEb9k3KU0oO8gCC2xMLO0h++S
         8wY/PvyX97dZdSqhEwS/U75V5S1B+djua1G7jrTsRp0f6SdTzSHyAyhM7bTcVzHUptig
         jDoQCbW+8XCLvPLKZFeVcKOHs9W8rf1dwCID5IBn9Yf2+QlyCJ45P/TTku3m8VIN50qK
         DLM6dxE9yR0lN4HmU8viCWF2ge5//8nr6TwVBapy42ueVOCqp+W65+Z/0QJT4iCA5H6O
         f/163nXAYDP7jzWfgaqh4RDbSW5TMDO4vvV0S5GTLACpu+RIS/vAW7Saa1B7KUhWSWO/
         plKg==
X-Forwarded-Encrypted: i=1; AKwUvBztMd/IugSHXy5q1IEIKxpmCEpxfnWz+OXqNtIG7P2CSBI1Isw6a5Dv3HPt32lAuqxgLSMB3XHsU/+gHw==@vger.kernel.org
X-Gm-Message-State: AFuF++mr9exoNAK42S3m/R6+iqcI2OrneEpqlezIQoh35YWkJeTJZj45
	nJl5Esf4win4toyA+gby3U0ewcCjm1UMNtE8K4WeZpEganf2M4G2NY4=
X-Gm-Gg: AYBFou2DW6DVclU/Hh3+ZfF5XexxyGuMJLyjWEy0H8lH2IGosG21vygVp5tX/TW7Uvx
	6m9R0x4bHoyMhV79DgtG7JP7uvybXTKAbR8Iey7Q6XpzsTdY4yJ3bkBX7OuuQPo2ROKLoqyoRs6
	95DRmMPJZqvPvmQ/9ffWYa3kJBw6xaZvggLP/fQpmpadKV0CtQKMeENGP+TFRuGDMW5pmMR559z
	SYmqpmLYCrEGJAICVRBIEeMuSRIGQsnzxSxWm0RnAyKV9BEV2ZmvcPpOL25kpb37NwDLuKNyZcx
	I+v7cmrkenCNPFT4xiqGrXoJHnpNlhWmNSAwJEtj2nsfHmz1k4b2F5xRimKiBLNvUCzzHdVt6+j
	Wbc1uV/L9LU/u0kbmXFdqGcwq9C41/ZwrxzUOnxEwEVJZq5G3QJUsv3/VRp9j0by2wYBSpn7+V/
	ICKEdl0veK9GqrPH9iebJMlRBhHvZ418NH0EjSAhXMsZQ5ZGGmq+Ay16f32oaUvSoLzyEGfM5y6
	d2dLRiJo4COgztj5HAUD04x5FwisaTEfp/uI1KBSkqVD/gcoH/zwNDYXGZguYSTeF4nFeMK/Yir
	+4eFRdp8ba0YCTqkjLJ/dbll42jP
X-Received: by 2002:ac8:7f8c:0:b0:52d:9dd9:63bd with SMTP id d75a77b69052e-5337427ea48mr112168181cf.10.1790877466953;
        Thu, 01 Oct 2026 10:57:46 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a8a9800dsm31853976d6.46.2026.10.01.10.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:57:45 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ming Qian <ming.qian@nxp.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Shijie Qin <shijie.qin@nxp.com>
Subject: [PATCH v5 2/2] media: amphion: prevent unbind while video instances are open
Date: Thu,  1 Oct 2026 13:57:37 -0400
Message-ID: <20261001175737.4048254-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001175737.4048254-1-mhun512@gmail.com>
References: <20261001175737.4048254-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An open video instance holds a plain pointer to its devm-allocated core.
Unbinding the core or its parent through sysfs can release that memory
while the instance remains open. A later ioctl or close then uses the
stale pointer.

The video file operations pin the module, but sysfs unbind bypasses that
protection. Suppress manual bind and unbind for both platform drivers,
and warn if core removal ever encounters a live instance.

Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vpu_core.c | 3 +++
 drivers/media/platform/amphion/vpu_drv.c  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
index a0c58ec97a42..2e8e08e05de7 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -696,6 +696,8 @@ static void vpu_core_remove(struct platform_device *pdev)
 	struct vpu_core *core = platform_get_drvdata(pdev);
 	int ret;
 
+	WARN_ON(!list_empty(&core->instances));
+
 	vpu_core_remove_dbgfs_file(core);
 	ret = pm_runtime_resume_and_get(dev);
 	WARN_ON(ret < 0);
@@ -846,6 +848,7 @@ static struct platform_driver amphion_vpu_core_driver = {
 	.remove = vpu_core_remove,
 	.driver = {
 		.name = "amphion-vpu-core",
+		.suppress_bind_attrs = true,
 		.of_match_table = vpu_core_dt_match,
 		.pm = &vpu_core_pm_ops,
 	},
diff --git a/drivers/media/platform/amphion/vpu_drv.c b/drivers/media/platform/amphion/vpu_drv.c
index 2cca61f41bea..9c6f32c5eae9 100644
--- a/drivers/media/platform/amphion/vpu_drv.c
+++ b/drivers/media/platform/amphion/vpu_drv.c
@@ -205,6 +205,7 @@ static struct platform_driver amphion_vpu_driver = {
 	.remove = vpu_remove,
 	.driver = {
 		.name = "amphion-vpu",
+		.suppress_bind_attrs = true,
 		.of_match_table = vpu_dt_match,
 	},
 };
-- 
2.53.0

