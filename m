Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE203B9D86
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568149; cv=none; b=iq5Lr9vK6t1AjlhjaO/UviLYXZO0AT+/9kVL7WbWXcJ2F6Fo1Aom7TuKGhzRuDJ5d2nCmDFJvUmFIFUpadTStPjhcq6ZoPhfXwtX9cRRBMA7/opmXNssz9hFDu86CLsVvumwZe4np1WGZrWZInxcOB/8e5qDeTUkb7J42hXaJIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568149; c=relaxed/simple;
	bh=pc5UESD6EDwQLGI9fUxjkSsSLs86VJEfjdxtMK0USzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJsQVXt/uBnfJ5Vl+X2J00qFOGlSnMYv8B7rpC8xON9vGUFL+G/2IPAEUFbnkfzqdakwKACzOYRaYgvaPvWCXtNXoh3Avm6z+onTcY4rCGS+e8MYK2zdjCJAeyJGnRgwNKhEN6ob29aHLEvtHLqFN886PQ4p9EygNdRN9pCrMxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UupwkKHn; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UupwkKHn"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aebd52488cso16817e87.2
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 13:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786568132; x=1787172932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYpha9QcagCXp8KuwiP/ovEe90DQEndNvsYkBOdtUDs=;
        b=UupwkKHn4gA5fB47TV7q57qnH1kE1mif5TB/9Rv5A0QzylkOQ1vLg2nuwiBjO9FwWC
         jV1GVuKGHGn7LWT9waM4hzhZs7mHRGQvYbcB5CZ0JCxa85b/IWKDLl8HUHPWGi1RrFDS
         N8ClX2qUYrr5aD7LniGId/kZSoKlq/aEFh7RSju9cpPYldIkkvbB3S85Cny0Ur/Na1QA
         zFCHjtLcbqPdGmYLQYZkyHr7BUlcg9BJhsDmXvIq4uqvGft+6E9UAr55Czi+C607C55G
         SdfbQkJDqzaAOhDL6Ke8sv7GkHayJWt9j2pXTl0tIhzYHB8NHGwyxd0rqJOjTzPfAO4J
         40HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786568132; x=1787172932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYpha9QcagCXp8KuwiP/ovEe90DQEndNvsYkBOdtUDs=;
        b=d5Y9Mf//jxzbHUWZVxqqHELSydz2wVi/C1KSYLAXjJ4frLmamrwMuWWKcTPwaGBYKa
         E4jEH/tdbP+dgsn781tJsqp1aQtu1A9VA7Gq1A/JpOr4JzeO3uu2TL7S4AY+qweTnpI2
         MFMMslasZJhU5o+94mAdnaihKn5Bve4NrVi+uAAY2Go+qe3UGltwctT7OLG47WQ97hqQ
         WvFxZLrOrjd4ow0sIzkRJ1mSMfLDNSb3AMMdBGpVyisE/cHqLr43la+T3XXI0H+e28M/
         B6d9+7gLH2LLHxCOPQq0hAwHHx8hqzUf098nj3BUI3e2cQ4A7kAb1p3aU2IPEUh2BJhr
         znzw==
X-Gm-Message-State: AOJu0YxlxyyhsYZAF70bpBft/grWXWsXUD70hediZ2wmwSXUfog+uDih
	iXX5mlLc2aMCQpf1qMdoCLcJ9YyzFIDp4CQW/HbootwF+Y7oGZUbBGa5
X-Gm-Gg: AR+sD11MGox87+kd2EgSdSSuuuTxZtmNsIhJlBiFkz3bPIwlkjU0jvDtU17C2X7SKvm
	p1KFStCu3Rf+d17A/NisRhjYVqOFqBTd5Ms7qICZTVCGtJDe1f9hS0Nr4zJ3p4NaUW4CYX6ep58
	iTJMLqugC45CysQitGYd3Nuok4CHvc4IRx4B4wdoQHtLxpnSJqt4yL/jzCjXI4oPysBB78mMM4b
	iioFda/BW3k2BxnZNVEDJJOA1QbWfaPfyQUWvfCkVIq97rqbbm3jR63glh+zgCicsCM9rhaqTFf
	t4+5Q7Fhj06lCuijd+iAUQDHf8YU+ftjQEqNwCbEWwZTru2MNUSzYAd3HrmMderA/fhBbPnWDZl
	txJIAjX/ct0NBWgwFCbA+sCpyDFpR07ZsIvbmh5DycY/mrRWFDIpsOoAApk26H/1wMFgvU14ZpV
	75Hlt9xwBqKHX/Rq/UTHUMIeQUsq+Td6EgJuMCVH6ADbAvxVMU4+xvlu+G2aMb
X-Received: by 2002:a05:6512:3196:b0:5ae:b260:cf47 with SMTP id 2adb3069b0e04-5b453f317f1mr52261e87.10.1786568132298;
        Wed, 12 Aug 2026 13:55:32 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4539e9605sm60999e87.22.2026.08.12.13.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:55:31 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v3 5/5] staging: media: atomisp: remove hmm/hmm_common.h file
Date: Wed, 12 Aug 2026 23:51:38 +0300
Message-ID: <20260812205429.39181-6-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812205429.39181-1-nikolayof23@gmail.com>
References: <20260812205429.39181-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now this file contains nothing, and we can remove it and all the
"#include" directives.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm.h  |  1 -
 .../staging/media/atomisp/include/hmm/hmm_bo.h   |  1 -
 .../media/atomisp/include/hmm/hmm_common.h       | 16 ----------------
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c   |  1 -
 4 files changed, 19 deletions(-)
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
index 029620347302..000000000000
--- a/drivers/staging/media/atomisp/include/hmm/hmm_common.h
+++ /dev/null
@@ -1,16 +0,0 @@
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
-
-#endif
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 89e56ce07444..ce0c8b2717a4 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -30,7 +30,6 @@
 #include <asm/set_memory.h>
 
 #include "atomisp_internal.h"
-#include "hmm/hmm_common.h"
 #include "hmm/hmm_bo.h"
 
 static int __bo_init(struct hmm_bo_device *bdev, struct hmm_buffer_object *bo,
-- 
2.55.0

