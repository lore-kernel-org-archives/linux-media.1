Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842F14E50AC
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 19:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363836; cv=none; b=hzNRhcX0PICrk3EA4iqFQGJH6aZEgkhV4A1PRefbXGM1kKWTlfMGfDsbwhQxJnvEJ7Mt29oPAqr/NYzQQ2gl3O1/2lCLZ8CxobLUZfbCx8rU1kHT+u4QwT4AFcVq17S61n2yRm6EULbDyh5xeTuj7xbSLu/TsPQH3zGj/cez6Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363836; c=relaxed/simple;
	bh=XhREjkmhNCUql4b5JIcUpys+k+BsoJ+A9gP9gB2g0ns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c0kKJHXDoDjpxZVRDMhmSCwCQDCoMi2eUkYDlfnx31HILk2j1WHflZtf5C0u5RR9V3Wc7Mwt/PKX0cAOrIthaCbtpND6BW3uCN1BhF3XrGAuY9oAQclqf8NTZ6FXq0S6Gmh11+25MkC5+EaXM6L9f5JhY6uxskF6fNlQGjX7Ra8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUP7Ifi2; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUP7Ifi2"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9105d241693so11667036d6.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 12:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363833; x=1790968633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTcnAr0ZcdWSjcBB1bEaQzDSsCqaWUPkS0US6ahLsTs=;
        b=KUP7Ifi2+UmoY1j2EVngOcpDYqQVkhqwPhr8aF47l3gIQX6WkkKr6Z1EVPm243Vsfo
         w/5f/YcyeaAked5s6YpBLIzr2SvdJOuM0FYMTbBQvwrNKg/z5qnbmoP4Hb9iLmC7J1V3
         Uezrz0V6xcGUbe0LlnL6dzfxPP1oTLCYkfzM3HRCzGSdZzvrYDb3UNLR2lYsZ6Jk0255
         uQ0NxXJUBHCu8pW1p0RWvtqsT+tFva7jNuCZA+Vzay4/4p8l6NtVvrjGcKKRHEgop4Lz
         Ywsdx9NTdqeKT5bvcq7fzXu/yXTwRCBV1tpAT63zF/1ks3zHQF1IduvrUMKg/WHBJc43
         XyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363833; x=1790968633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTcnAr0ZcdWSjcBB1bEaQzDSsCqaWUPkS0US6ahLsTs=;
        b=FodTNa+ILmK8gL2iWHmXNk9JBJKZwOjQNlggSwwx/G4GPFDCrKHq5evhq4zEkbNKXm
         HCKt7xfj5Mdv6syOj+ZmfKgGDt0Zhp/NeM20WRBLP2SGQV27NSczfOOHXaRc+2Lgq1iE
         BU4nvpyf3Y+6CbjySTuBTHZ2b/v+I0KRTBxmxWjlWF14NKSOh/J9I4i1kQEs+/DmTBsd
         M8zVhiW3QXZdI6rmHe5mmbrGjlBCpr1CapCMn9klorU8531sh/mO4vc1/4YcTxq64UCb
         F+FOBcg3SWncp2BI+4riuaQrCHpJQWtdNVtRKUfk4UPBnbSLd2O+93jsZp+eFLeJXz3c
         MFqw==
X-Forwarded-Encrypted: i=1; AKwUvBxtPnMJZwZKP9pORgKjOy01SbbmIL/45OdPblOdG57ypFLKz+lGqG3Hi2nBX5B92KD+IK5UMI0Ey3ZNHA==@vger.kernel.org
X-Gm-Message-State: AFuF++niJjqqjw6pP2RbyeEMO8iqIGAcbK7QktqF44EL8BiK62fHfTTg
	VGfLoFH2MSJCdxEUpOBzOffMd9yjE08SWg9MSrvlaY4XEwWa0XOABIQ=
X-Gm-Gg: AYBFou2Vgxdr5rakE9gd9YGJjg3YGD8xH+M4ILRFOmflWEA5H1mYKDeG9WAai2KnoHU
	cPWiifPFpVSx/L8sTlGwWw726rig73oE7YHN2p7kkwpF8bbBJsqWhy/rPfRNXiGqV/awZ7jiTvS
	uPUZj5RIiShO6NFh1XkiKMDNwXkARmhUGrPm59xvqh2ZyfJD+TACzueg3K2VLXlFaVqWI/IzE0L
	0VvMx0MxM26i0XYQuiCRoqJT0nvfEXw9Hq/UUJW+ehZ80I9GlSdQjnf4iwXEoTdZgrk+7mCJo8x
	UJJcV3Yka73kEPBwQZVSdeStgAEQiEThvieHR/LH5znhhkefmjGodiGKpnUYDlIlzGdUMompEhu
	vEsHCm5piBmsn9US48bmv7XAQT+E9gGoNqRAggfXsEuDcfofJCuEhZIpr2jVYGNz/yKri1VGjI7
	1gQ/c61g7sJgailmZFOLZ9eZpv9zCveU83nGbNwuUmge9TPx8alvsvQSYLeM+QH9yawze3ergMD
	TxL0Lup/KP+Rzx+Vz83YsxnQzWs62NRDfK6smeBSiFK+hsIJR3DTMaoaTWRrDxXHuvDwAVmnvBd
	6Gb92Ip9i4ABds0rAA5Z402g3qQnmZICd7DEGSc=
X-Received: by 2002:a05:6214:d8c:b0:912:40d2:45c2 with SMTP id 6a1803df08f44-9142f8b25bdmr62523526d6.30.1790363833095;
        Fri, 25 Sep 2026 12:17:13 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430e09ce4sm23521776d6.28.2026.09.25.12.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:17:10 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ming Qian <ming.qian@nxp.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v4 2/2] media: amphion: prevent unbind while video instances are open
Date: Fri, 25 Sep 2026 15:17:06 -0400
Message-ID: <20260925191706.3144437-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925191706.3144437-1-mhun512@gmail.com>
References: <20260925191706.3144437-1-mhun512@gmail.com>
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

