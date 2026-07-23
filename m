Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFE6483BD7
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 18:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832766; cv=none; b=Djh53s70pzese6b7t6avIMIoNu+EEqCcxPQ5FXhHk5G6yJBYnt26j/gC/qadfAByV2QUIyfJtepNGV2YnSc/nqv2et/GESYg6d1y1qv6C5Tq+r/fF05Lo7pLRC0Xuy8H3CzrwYqgDTHVW7u3sHxLgM2TgRCpE0ysKLwO0EOyWsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832766; c=relaxed/simple;
	bh=2bkdw8OxJrwnYUGhU/fhin1Aq0ZRsS8rd/JhENskV60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z1HqLLpp1j/2mwJFnvKzoL0/gawus/bhMjer0XYTw/7FHroTnXfv2ogjlvJyRPhThTNtpZ6yuJY4yALQDYjQCL20DAX2I1RDOMxMWTx02Tr1AOmyxtHTJaNpuuM8vat9Ut6VzLbR/v9OBdv8merBHiUR0WiIsCLSMXwsrAGyMgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l++qRngV; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l++qRngV"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39d4c864bfbso9812741fa.1
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832757; x=1785437557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75cngzgMY/OVAP7GKlxdzDklRXPgWBQ/BrWuJHHZzts=;
        b=l++qRngVhplsAUNXdPZ+l5DinSqVDTlBVbJ4pTS6rIGwIPZ4ZJWsJLE9in7r/98/Cb
         GZwSASjKPok9qmX6jg1htAHImvJcPKRn/90t31RcbY4i0BmX57UuAFxiIyJixPWQ78hP
         NdzZWlgbhwHmeuPu1u5q0UveDL0WwMALf6mMpZG28TsIESDF9XV8XEYq6G2f6jUKxWoI
         6ZSQBZTHWUVHEUaQfFCZcn7B/jNWFC/8M8S4w13NiFuRNotf+eXrHJudG//Mo++Wwik2
         myDvki8vmWqq7G5TVPUeAlnlgO8dOpyTwk2SpbQiQM0m+Nwe4XHyoXxSo/SIpMZhlB/L
         u0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832757; x=1785437557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=75cngzgMY/OVAP7GKlxdzDklRXPgWBQ/BrWuJHHZzts=;
        b=QOQEBmBd8aFW/qgFuObGcQhQ7v8/SCz4BJaXqmEBxAqMpV7x1X5UGRXkSL3iO96Bx6
         x48sD9OqFS6PyzAHF9+VHNASwFL6Vlzea0n73dRxMJBX1nebA84hqOjoTyHj+V2P1bWc
         CWfUTjeB+TRRRIGEOs80dEFaLhkgEG00HNvzAoRW/XpjpfLzR+mte+lt6V6bAAB+XLZx
         q8t2QTk+K1g8k6U9YT3ZW7a0WrijYmha3mTA6mQ2l1INWtCG1ntuO6bvWjr1uetT23go
         PgnckNdXAam1UEyBoS0+AJ39dBd7daZRnv0aSEsbwrwa/FdayxDzIcLRIML6N0ghFAjC
         fETQ==
X-Gm-Message-State: AOJu0Yw2sgBHT15lhIqouHArkdiebormO9SbaFyGFaHoQDhsAWfxm6GM
	wFq3LMO5Dlv5qMy9WdNSkO5dSxaCE+yw+0cJvylFx63N3qjnTK+Wj3lY
X-Gm-Gg: AR+sD12wlRhQ2LKEl05nAhoRqfv9YqcFGJtyr5mF26xtxYWiG9+8oV95P4aSFtJRpCi
	/hk7Ux/ERNEcivXd6VQsMFKd1x09/pbj8mGPKY9YB+kWhCMiZvCGq2/pYnzcHKnxiCo3QJ4+mKO
	wqsjaklmOprdi8O3DqntFgXyK0YcDAtXKzHqgioEDnHkewp1zqKgGC/Q0mDhnJiIqS+d2xsOrvG
	FXEcd1Psy+zcEwDE7AW4aETSS9syh3x//tpcXu7EoBuhLXudQZoxBo87u8+AbGw3EBYvec40T7A
	4BdCABJjeRAu+v/3e41rFKdvnJOD3iKu8OkMjr4PFsaMg5sHu97/I8EY2iY5Q0Rvz8vgLWF6OYO
	aeSFZfZp5MGk6YWkQ4fA0XaUzGZhU/hNV7k085PAMPlbwmbxlVD7vew2rZwgDKbenYZByNnh7Hn
	E=
X-Received: by 2002:a2e:a88a:0:b0:39e:b257:e878 with SMTP id 38308e7fff4ca-39f07bdfdafmr9749291fa.8.1784832756862;
        Thu, 23 Jul 2026 11:52:36 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68b68ebsm11601731fa.10.2026.07.23.11.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:52:36 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 4/4] staging: media: atomisp: remove include/hmm/hmm_common.h file
Date: Thu, 23 Jul 2026 21:51:21 +0300
Message-ID: <20260723185217.317981-5-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260723185217.317981-1-nikolayof23@gmail.com>
References: <20260723185217.317981-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the last used macro with a conditional expression and remove
this header file, as it no longer contains any code that is being used.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../staging/media/atomisp/include/hmm/hmm.h   |  1 -
 .../media/atomisp/include/hmm/hmm_bo.h        |  1 -
 .../media/atomisp/include/hmm/hmm_common.h    | 36 -------------------
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    |  9 +++--
 4 files changed, 6 insertions(+), 41 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/include/hmm/hmm_common.h

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index 6bda02b9ff85..be92a9c9046f 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -15,7 +15,6 @@
 #include <linux/slab.h>
 #include <linux/mm.h>
 
-#include "hmm_common.h"
 #include "hmm/hmm_bo.h"
 #include "ia_css_types.h"
 
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index 69cf490bd88c..2a19e3b2c1f9 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -16,7 +16,6 @@
 #include <linux/spinlock.h>
 #include <linux/mutex.h>
 #include "mmu/isp_mmu.h"
-#include "hmm/hmm_common.h"
 #include "ia_css_types.h"
 
 #define rbtree_node_to_hmm_bo(root_node)	\
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_common.h b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
deleted file mode 100644
index c406fe8b1345..000000000000
--- a/drivers/staging/media/atomisp/include/hmm/hmm_common.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Medifield PNW Camera Imaging ISP subsystem.
- *
- * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
- *
- * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- */
-
-#ifndef	__HMM_BO_COMMON_H__
-#define	__HMM_BO_COMMON_H__
-
-#define	HMM_BO_NAME	"HMM"
-
-/*
- * some common use micros
- */
-#define	var_equal_return(var1, var2, exp, fmt, arg ...)	\
-	do { \
-		if ((var1) == (var2)) { \
-			dev_err(atomisp_dev, \
-			fmt, ## arg); \
-			return exp;\
-		} \
-	} while (0)
-
-#define	var_equal_return_void(var1, var2, fmt, arg ...)	\
-	do { \
-		if ((var1) == (var2)) { \
-			dev_err(atomisp_dev, \
-			fmt, ## arg); \
-			return;\
-		} \
-	} while (0)
-
-#endif
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index e92538ab025e..dd1897cdf662 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -30,7 +30,6 @@
 #include <asm/set_memory.h>
 
 #include "atomisp_internal.h"
-#include "hmm/hmm_common.h"
 #include "hmm/hmm_bo.h"
 
 static int __bo_init(struct hmm_bo_device *bdev, struct hmm_buffer_object *bo,
@@ -389,6 +388,7 @@ struct hmm_buffer_object *hmm_bo_alloc(struct hmm_bo_device *bdev,
 {
 	struct hmm_buffer_object *bo, *new_bo;
 	struct rb_root *root;
+	int ret;
 
 	if (!bdev) {
 		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
@@ -396,8 +396,11 @@ struct hmm_buffer_object *hmm_bo_alloc(struct hmm_bo_device *bdev,
 	}
 
 	root = &bdev->free_rbtree;
-	var_equal_return(hmm_bo_device_inited(bdev), 0, NULL,
-			 "hmm_bo_device not inited yet.\n");
+	ret = hmm_bo_device_inited(bdev);
+	if (!ret) {
+		dev_err(atomisp_dev, "hmm_bo_device not inited yet.\n");
+		return NULL;
+	}
 
 	if (pgnr == 0) {
 		dev_err(atomisp_dev, "0 size buffer is not allowed.\n");
-- 
2.55.0

