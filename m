Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F8C3EDE6A;
	Thu,  9 Jul 2026 08:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585403; cv=none; b=oaxoDpx9ZIvpp+XxY4GOxwAE5RZcqUu7uL+H2D9uZBAO/WfdiV3gvpRoKo00gKWsIYECR8M7logerqX53wDktMVS9f8464OQ/KQm+11ZJRHKqGddkOXa6baFk7Hj3I62PVY3m2vUJEqeoanbmNiUqmZpvof69nBL5x5lNBgoJ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585403; c=relaxed/simple;
	bh=kFfgqYhVxIrHQqeazgKoUPH34tA7OI0IdVdMEy9Nur8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WEBfJUGMxzSu8GkUUggjRjDw/v0w6J3CMtLPUgR0LiTGT3tSL3CeNxpRZVh+eVZuXzat3dJYVxup9zlFWUdKb0m12wnuwhOmdSm1aKPAxhpo3YOAMsVvyiPCZynBFWzTFKHV4Xasxeqq3DVKDwmGI5PjvbORK05VAtl+rDkniek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwW46Yvs; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwW46Yvs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783585402; x=1815121402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kFfgqYhVxIrHQqeazgKoUPH34tA7OI0IdVdMEy9Nur8=;
  b=XwW46YvsGP+BETlSsLGf1uidMYiiIyv+FScqJU9CD0vYJl9C6qmnk93B
   fZqBZtmyTJHUj03LBbIiHRVT5lwaM3y3gpfLYufoF5wXavmNvdjfo54h3
   8OKv2ZdHLfx9U6b/3mXeh8qPk6BWAf+JiZNQ2RXnS3gZ+/vQMfx8Fhn8p
   rb5trt9W99Ff7dRF91CoYjhHUS+avql2V8iYuVhSBwIvgPHvfs7LtkuCg
   QTgaBFiGdE0vyLsG95oMHg1sJbRJRDoIJyVeLZ+eUrt+ln8wmBEY77ezC
   orb/a69wEw680qNIaPZnrbplp5rESg4zMFxnuBS46usB3euXPerIC4SQc
   w==;
X-CSE-ConnectionGUID: BfftX/+6RG63m6uM2uIzlg==
X-CSE-MsgGUID: /DpqdEZfRlyaLu27XnvavA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107055814"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107055814"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:23:21 -0700
X-CSE-ConnectionGUID: WkS64Z1dQg6GnGsMerGzzw==
X-CSE-MsgGUID: NdPK7QaOS7+mjv5wRDz9IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254631032"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 09 Jul 2026 01:23:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 8F859A2; Thu, 09 Jul 2026 10:23:16 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ettore Chimenti <ek5.chimenti@gmail.com>
Subject: [PATCH v1 7/8] media: cec: core: Use predefined time multiplier
Date: Thu,  9 Jul 2026 10:20:59 +0200
Message-ID: <20260709082315.72685-8-andriy.shevchenko@linux.intel.com>
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

Instead of relying on custom MS_TO_US() macro, use existing time
multiplier.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/cec/core/cec-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 1b6f27a552db..a67c4283fbba 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -27,6 +27,7 @@
 #include <linux/slab.h>
 #include <linux/sprintf.h>
 #include <linux/string.h>
+#include <linux/time.h>
 #include <linux/types.h>
 #include <linux/wait.h>
 
@@ -300,7 +301,7 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 	adap->rc->allowed_protocols = RC_PROTO_BIT_CEC;
 	adap->rc->priv = adap;
 	adap->rc->map_name = RC_MAP_CEC;
-	adap->rc->timeout = MS_TO_US(550);
+	adap->rc->timeout = 550 * USEC_PER_MSEC;
 #endif
 	return adap;
 
-- 
2.50.1

