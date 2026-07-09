Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AF13F1AC6;
	Thu,  9 Jul 2026 08:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585405; cv=none; b=a7cdBPyUK6mubURa/zTBRYPQ3frxCa2nLqmhoZO/FY6b8WLCV2HxMBzVj9KBeNAiipjSeVr2JYMH5PACD2Bu30v0SJS9nD/ePM4fXPpB3sLM18Mt2RyNVlySZfAWwV83c90fDylmxXSFhMpwCxIc7Ao4LV8TE327dmtlCynARiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585405; c=relaxed/simple;
	bh=41xvevZ556DVVgT4Ol4iQ9h/U49oHfCnL0fcgqjSfj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOrmig6JICQESq7Bq0/qvQj20i29tq7tZ+Pu7y+NTPJ/5rNzpgvRW7qsuZrI8Sia2Ia9jTANfqSsfXIBmHyTUtK9GfSDRqySS/bkE8Gz+beLOh5VfGo39hZypMhZvvybjve0He5skVj4toBw6C5Tbhu2Ph1mOU5MuVENdABmczM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mu8fwC65; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mu8fwC65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783585404; x=1815121404;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=41xvevZ556DVVgT4Ol4iQ9h/U49oHfCnL0fcgqjSfj4=;
  b=mu8fwC65F44b/VCyVO32AB1mzvfUWH7txM47YvJ26SByqJoW4WasJLMz
   atI4lEQzEAaLDW49O06/7BxORgqz42yQ6alb8F3x8UG8rF/TsKc2Cs/9o
   xKoqlOQ6gsM/Pz70mR0uS0j7/F+NT/RFDAA/pzsD4beOuNMz2NhbqkbSh
   Wkek+OqVHcOu2e3u6bwj5akjyznrhYA3EoTdH6fgT/WU+NSG1Bnax2llc
   +ls/v5luUTxOdMmJgnzoWR0HOCdImib3KnnE2PZxo0VS+v0QcYacvAJUL
   F0Kwz+sfxJJiGdF7a9RbtYmezQm8Gb0YdiGdHNPm50EU4KdOKiRF0ROgy
   Q==;
X-CSE-ConnectionGUID: 5bPAfUEbTqqD3V92BNoiaA==
X-CSE-MsgGUID: n0LPSXomQSy4fJ98PCYCjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83372160"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83372160"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:23:20 -0700
X-CSE-ConnectionGUID: CFWOSdl0TlmCTzFx4Q8AQA==
X-CSE-MsgGUID: duwQh1QcQd2TI/9I1OOEzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250535885"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jul 2026 01:23:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 878F29E; Thu, 09 Jul 2026 10:23:16 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ettore Chimenti <ek5.chimenti@gmail.com>
Subject: [PATCH v1 5/8] media: cec: core: Add pr_fmt()
Date: Thu,  9 Jul 2026 10:20:57 +0200
Message-ID: <20260709082315.72685-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260709082315.72685-1-andriy.shevchenko@linux.intel.com>
References: <20260709082315.72685-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several prints inconsistently use cec: or cec-%s: or nothing. To make
it clear which prints come from cec-core.c, add a pr_fmt() macro.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/cec/core/cec-core.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 1f12fb0caca7..dc05c5d7b2e3 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -5,6 +5,8 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
 #include <linux/bitops.h>
 #include <linux/bug.h>
 #include <linux/cdev.h>
@@ -107,7 +109,7 @@ static int __must_check cec_devnode_register(struct cec_devnode *devnode,
 	minor = find_first_zero_bit(cec_devnode_nums, CEC_NUM_DEVICES);
 	if (minor == CEC_NUM_DEVICES) {
 		mutex_unlock(&cec_devnode_lock);
-		pr_err("could not get a free minor\n");
+		pr_err("Could not get a free minor\n");
 		return -ENFILE;
 	}
 
@@ -130,7 +132,7 @@ static int __must_check cec_devnode_register(struct cec_devnode *devnode,
 	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
 	if (ret) {
 		devnode->registered = false;
-		pr_err("%s: cdev_device_add failed\n", __func__);
+		pr_err("cdev_device_add() failed\n");
 		goto clr_bit;
 	}
 
@@ -267,7 +269,7 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 
 	adap->kthread = kthread_run(cec_thread_func, adap, "cec-%s", name);
 	if (IS_ERR(adap->kthread)) {
-		pr_err("cec-%s: kernel_thread() failed\n", name);
+		pr_err("%s: kernel_thread() failed\n", name);
 		res = PTR_ERR(adap->kthread);
 		goto err_free_adap;
 	}
@@ -279,8 +281,7 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 	/* Prepare the RC input device */
 	adap->rc = rc_allocate_device(RC_DRIVER_SCANCODE);
 	if (!adap->rc) {
-		pr_err("cec-%s: failed to allocate memory for rc_dev\n",
-		       name);
+		pr_err("%s: failed to allocate memory for rc_dev\n", name);
 		kthread_stop(adap->kthread);
 		res = -ENOMEM;
 		goto err_free_adap;
@@ -336,8 +337,7 @@ int cec_register_adapter(struct cec_adapter *adap,
 		res = rc_register_device(adap->rc);
 
 		if (res) {
-			pr_err("cec-%s: failed to prepare input device\n",
-			       adap->name);
+			pr_err("%s: failed to prepare input device\n", adap->name);
 			rc_free_device(adap->rc);
 			adap->rc = NULL;
 			return res;
@@ -424,14 +424,14 @@ static int __init cec_devnode_init(void)
 	int ret = alloc_chrdev_region(&cec_dev_t, 0, CEC_NUM_DEVICES, CEC_NAME);
 
 	if (ret < 0) {
-		pr_warn("cec: unable to allocate major\n");
+		pr_warn("Unable to allocate major\n");
 		return ret;
 	}
 
 #ifdef CONFIG_DEBUG_FS
 	top_cec_dir = debugfs_create_dir("cec", NULL);
 	if (IS_ERR_OR_NULL(top_cec_dir)) {
-		pr_warn("cec: Failed to create debugfs cec dir\n");
+		pr_warn("Failed to create debugfs cec dir\n");
 		top_cec_dir = NULL;
 	}
 #endif
@@ -440,7 +440,7 @@ static int __init cec_devnode_init(void)
 	if (ret < 0) {
 		debugfs_remove_recursive(top_cec_dir);
 		unregister_chrdev_region(cec_dev_t, CEC_NUM_DEVICES);
-		pr_warn("cec: bus_register failed\n");
+		pr_warn("bus_register() failed\n");
 		return -EIO;
 	}
 
-- 
2.50.1

