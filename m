Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C813E6DE0;
	Thu,  9 Jul 2026 08:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585402; cv=none; b=qQQw+pTrm26JJ4jSwqfJpxBlNe5gW9jQzlJRMSEcVZpFTvvCRZeaI2RrK5Z0XvH8DTUEZ9XyyEu3vFzwjP+1rOS5BMWIjkCpR6DBXTtOz4ZTjBAVWVXqn7MobDEfXjaVD0kA+I6BNBhVXYbtQuIChGZdbIojyW30BllQPYpSX4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585402; c=relaxed/simple;
	bh=Z+lrYInv6ECSHOwTjMbWmhvphiMFb3CRFUVItMi3h4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ST8BvcaUjLqC6hGeB5NhunKv+4OmGAhePd63Rb2aSV5pYTbIeCD/SHMGDlgkAKafDZRQCJqXLKzvmdB4P+JFYx61+8tZ9sklRM75GkE3k8V2WUYm0qTUhK++t0AXhkdlAUHPseQ3ApLEd8yRaBd/kPqNkVLjo/MAggqAk+cEWFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nk1FtgVZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nk1FtgVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783585401; x=1815121401;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z+lrYInv6ECSHOwTjMbWmhvphiMFb3CRFUVItMi3h4E=;
  b=nk1FtgVZ1NydN+v5l+CGvdQVe0HP37Fjuah+H/Qu0wH7DyST1zBvsHYz
   WmTsO94IExwVrk36Hu3ukPxRgs7gs7f6Pye5Gk6VQal1aFV9PnAe1CRjI
   3T9ckrBCv5s63n2OGW2lkCsYCytJzjYxhviSceX/qmSifGrDJLf7jP9mC
   izIE7aXuA4MU6LN69MPgZTxmnXd5xqKJpo6nO8hsNtvEXMyYxZRPgvNjl
   HnO3MABOTG/L5aHFWuhCkeXNtqlBUi/W0RJ1Vjdq+joh6O20ZJh5yZb7W
   xQjtUMTVQJf4S5I985DXzAaqVt3xLXNM8VT+SBF6AedmtHplA/pUR1xZz
   Q==;
X-CSE-ConnectionGUID: UWPOCWJmQ5y+2HwmsShYkA==
X-CSE-MsgGUID: N+1zf7PTTri1PM3VGSHk7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107055804"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107055804"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:23:19 -0700
X-CSE-ConnectionGUID: F6ZgiDW1TfCMnIPt2TaBGA==
X-CSE-MsgGUID: r75DSajcQFiZ04Asp99wiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254631028"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 09 Jul 2026 01:23:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 77AEC94; Thu, 09 Jul 2026 10:23:16 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ettore Chimenti <ek5.chimenti@gmail.com>
Subject: [PATCH v1 1/8] media: cec: core: consolidate error path in cec_allocate_adapter()
Date: Thu,  9 Jul 2026 10:20:53 +0200
Message-ID: <20260709082315.72685-2-andriy.shevchenko@linux.intel.com>
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

Consolidate error path in cec_allocate_adapter() so next changes
will be less verbose.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/cec/core/cec-core.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 90a98f322f5e..55011e555d35 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -267,8 +267,7 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 	if (IS_ERR(adap->kthread)) {
 		pr_err("cec-%s: kernel_thread() failed\n", name);
 		res = PTR_ERR(adap->kthread);
-		kfree(adap);
-		return ERR_PTR(res);
+		goto err_free_adap;
 	}
 
 #ifdef CONFIG_MEDIA_CEC_RC
@@ -281,8 +280,8 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 		pr_err("cec-%s: failed to allocate memory for rc_dev\n",
 		       name);
 		kthread_stop(adap->kthread);
-		kfree(adap);
-		return ERR_PTR(-ENOMEM);
+		res = -ENOMEM;
+		goto err_free_adap;
 	}
 
 	snprintf(adap->input_phys, sizeof(adap->input_phys),
@@ -301,6 +300,10 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 	adap->rc->timeout = MS_TO_US(550);
 #endif
 	return adap;
+
+err_free_adap:
+	kfree(adap);
+	return ERR_PTR(res);
 }
 EXPORT_SYMBOL_GPL(cec_allocate_adapter);
 
-- 
2.50.1

