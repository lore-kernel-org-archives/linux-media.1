Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCDE3D3326;
	Thu,  9 Jul 2026 08:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585404; cv=none; b=VZeBmeAiAgxLGT8zc0uhv3+ZN8lJQLvYx2i+2oJCTOJDnkDtLHkOfYIfDnAqVsMiMX+SsLuF5K76UiM9b3WOS7h6kSfWLF1+CEAHvNKnFl2FX8NnXOTyeGtYZ/fCdsEn6XWzHGkyfbbhnRvT3zpdFqugHCmDhs2TifpH42MYPvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585404; c=relaxed/simple;
	bh=wDJbGRhWHHWJD2GwjiJ91JFiCT74FQ4d2GZYfLVNJbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVLZrVYZia9SmUFGDoQM/2/fhSG1LwVvuIZhZmDRp4Cp2SEwZIn6jDR6Qo7q8IxvtkniwIdfMqbJnbP3cSHF982ywNE/ZouDtjDBFnsWfi7zXT1YFRby6TqVYl2rAHq1Y3A+mDp06QX4K8LGTJGumu43rai2L7S6EDLxjRvVi0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6bi7pNC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6bi7pNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783585402; x=1815121402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wDJbGRhWHHWJD2GwjiJ91JFiCT74FQ4d2GZYfLVNJbE=;
  b=e6bi7pNCBjnncO14vTlvUsm2O6cWxcVwQvoAaAJfVSn3FZxbfmK1dygA
   tvzOtsxJffLw7fRDvgoemzgfdOp3jWMv/gCFcbYAOIzm0BQX9VKilT88q
   TMHGZu4jLHLZG6TFhASPS5cw+GD7hQVUCrRq3orQ7VrOWylsgbRKDF135
   qR9sUlRvRdaANkY7XbGp6aB952hYy3ihwepeRbF9M/oyacDlnC1YwGQVB
   /Jwc33x8hy7fHTt6Yvl4qg/3K3m82a2YnJu2MBg6qWW+1j8umJrc4P1j7
   wKl8fF9c8WmgJEhVvXkzbhr2JAQ4zuP6pvmNMW3097Jqabcd43chk+j6v
   Q==;
X-CSE-ConnectionGUID: 5rrI1iyNTZ+dXtQSkBu5Tw==
X-CSE-MsgGUID: a6+aY8KcTAmh69eMSKApLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83372154"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83372154"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:23:20 -0700
X-CSE-ConnectionGUID: Pwh60GdAS42Rr2LowKQWEw==
X-CSE-MsgGUID: 80RChK0vTeukL0ErN8AKcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250535884"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jul 2026 01:23:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 8B3C1A1; Thu, 09 Jul 2026 10:23:16 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ettore Chimenti <ek5.chimenti@gmail.com>
Subject: [PATCH v1 6/8] media: cec: core: Consistently use CEC_NAME where it matters
Date: Thu,  9 Jul 2026 10:20:58 +0200
Message-ID: <20260709082315.72685-7-andriy.shevchenko@linux.intel.com>
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

When create a debugfs folder or device nodes we use actual subsystem
name. But in some cases it's hardcoded, while in other it uses predefined
string literal. Make it consistently use CEC_NAME.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/cec/core/cec-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index dc05c5d7b2e3..1b6f27a552db 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -120,13 +120,13 @@ static int __must_check cec_devnode_register(struct cec_devnode *devnode,
 	devnode->dev.bus = &cec_bus_type;
 	devnode->dev.devt = MKDEV(MAJOR(cec_dev_t), minor);
 	devnode->dev.release = cec_devnode_release;
-	dev_set_name(&devnode->dev, "cec%d", devnode->minor);
+	dev_set_name(&devnode->dev, "%s%d", CEC_NAME, devnode->minor);
 	device_initialize(&devnode->dev);
 
 	/* Part 2: Initialize and register the character device */
 	cdev_init(&devnode->cdev, &cec_devnode_fops);
 	devnode->cdev.owner = owner;
-	kobject_set_name(&devnode->cdev.kobj, "cec%d", devnode->minor);
+	kobject_set_name(&devnode->cdev.kobj, "%s%d", CEC_NAME, devnode->minor);
 
 	devnode->registered = true;
 	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
@@ -267,7 +267,7 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 	mutex_init(&adap->devnode.lock_fhs);
 	mutex_init(&adap->devnode.lock);
 
-	adap->kthread = kthread_run(cec_thread_func, adap, "cec-%s", name);
+	adap->kthread = kthread_run(cec_thread_func, adap, "%s-%s", CEC_NAME, name);
 	if (IS_ERR(adap->kthread)) {
 		pr_err("%s: kernel_thread() failed\n", name);
 		res = PTR_ERR(adap->kthread);
@@ -429,9 +429,9 @@ static int __init cec_devnode_init(void)
 	}
 
 #ifdef CONFIG_DEBUG_FS
-	top_cec_dir = debugfs_create_dir("cec", NULL);
+	top_cec_dir = debugfs_create_dir(CEC_NAME, NULL);
 	if (IS_ERR_OR_NULL(top_cec_dir)) {
-		pr_warn("Failed to create debugfs cec dir\n");
+		pr_warn("Failed to create debugfs " CEC_NAME " dir\n");
 		top_cec_dir = NULL;
 	}
 #endif
-- 
2.50.1

