Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC316481A96
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 15:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720296; cv=none; b=jEB0XKTm1g1DMi4L/RnWB414R/QQARodnAsOFV0zxFtORjlJ5irEsveLzXPv0oAnptsSWBs82JJJiRd8mLeClG2hnvD611BKrhhWV5FJwNA7NTgSBvmsG04eApcqie+H4RiyRk8CsyDQmiPwuGCYR25QBCxOV+TegVY8yEuT98Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720296; c=relaxed/simple;
	bh=XsU4KkXrbGzK0QK8y3CwxsLorSCvlWH6WhdpqA7lSP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YmLbGIHYT8kild4EzMozdXD1V/uObsAq/jw6fmcWXw5qXI5nbXkQCC+0pR/O4CGiBR56/zVdpTQH0b4xuRThMJJ4IbbIhT2r/yVsk/9iykTWRhNjhqYtU7/XVQteB7HR8pgSDJ5HwvFmEkzEaCcRz1lthSzqoNYAtHJ4mzbnnS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmbauBgp; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmbauBgp"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a0faa764beso6696091fa.2
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 08:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786720293; x=1787325093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74afaLSqgvu8r2wfuVQY2p6CPs0wjD5M9FZY2Wu7Cjg=;
        b=lmbauBgpTLnRRksN4bhw9H1ndJVDljoDuGS6UEj4i6cvZ2u7In47iBx/mFM93TpBHN
         mpIm2z5mGVcC9Zxdib4djiMLEs4VwpzrWC0fi9rlzkuWQlgmtTl9w0BFwPMSJyKixpK4
         XxdTyZzkvQCPYPDkm8g27ZswiSK6FZPMUtV+NVZFwS3qA9HhexMb1kk/VFVJGCuuUaWv
         1hGWX2oruuELhNSBsHAooECvdg/2ScS9pApUmA7KHR8sew+3koXL37NtGLciL5YhxYcQ
         3gz11tpn1BdiAv3lwKYcgCmch5zRVd0S/Jra+PNDl/cKrRwuc66eWhhuwjeAD8d1YHUJ
         D/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786720293; x=1787325093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74afaLSqgvu8r2wfuVQY2p6CPs0wjD5M9FZY2Wu7Cjg=;
        b=QgWc/2T+A3TBh6W97LcdLi2Oh18Qa3/QIP4Nx1VWs0rFJmRFF+h4evTbsOb+94Hgf5
         BjB7J/dqPNBke2UEdCWsmXSIXcPn0PV64dGagZGrU+F9/ZATe9LLzn2sW3Yq00UoeJXT
         CPHLwpT9SIYqET78xZ2v49CueiFb0VU8F8aUteJvW3u9GP6nCWzJ4hAVHzP1/qF4UwPJ
         K4qz5jFefm3grGaKaeAvO45m8NAuQLy8PJizMbkHS9n28ZfsQnLWR6QsPHdYCwXEMzs0
         pqIrm4FwjqlS81P4/SaeSUWb4NCTCK/pXCgfHEShaeJUFxbJn/Asf5xkYpLhxUmvcpqU
         QyEw==
X-Forwarded-Encrypted: i=1; AHgh+RqPD/iRTW382I79UDk3pmSpyY5U4ToOcdQi4RpPbBjoXwYv5v6n/EYmDA5D005rHzpKMcHOaaQ9BipfpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRKUy1PE/b2Uedcj9mbLngER/rb7MC+4Wxtljaza+i9kk6Mb82
	CmFmlo2bURiuaqpM2DoCE/RlNiAS5AMKjCq/KpoSjp50u5QfH/CEsZXy
X-Gm-Gg: AR+sD10zGfkfBn0fFeEuxshGbX12TFaVKQKajZD4uuUm7nyOdLj7+0OqjmUvYnGnk7d
	TvAQXfhAvRGWNiABmPzznOdgixm3Ygr3X0D2LZBgKu48OzMljSYiXVlEXYxea1Y6ZoG2R9mmBQO
	64+DKYEGMw5YZ4MP0Iom/xnsvCtJKVuKeoX1+c7uXOCA0+RWcIRqxZ5kneilq/eVnPB3zcSGxW1
	CF8D9J4FgagvxN8/H8aBV0W7BHCJ167fBho1ZIdm3lwufv/vv9JJOVsQAHU5SGkKkCU2vTvBdd1
	V8lMKJAFXSFMgHSRlaBzs+iYIhXox4v3/tgfpcZmtHyBx1m3a8EaxO6A9DC7XGXGMxKjDZrYrco
	Y0+Y+0bcoEmTK+y5F+UscN0tnFep9Rm5TPbPmoC/xS7gZes0HVDN/IL/4TmhD4iW87Md7zDIneA
	2LDG3sO5eu3pcOKzK/LmXLEwQtS3KaflhjCNTeegwOK6wMPOlJzSGnNt/VOiyf9j4jxKLCRg==
X-Received: by 2002:a2e:a986:0:b0:39c:8c37:bfa8 with SMTP id 38308e7fff4ca-3a1327dffdbmr6928051fa.29.1786720292737;
        Fri, 14 Aug 2026 08:11:32 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130d204b2sm7138251fa.41.2026.08.14.08.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 08:11:32 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Fri, 14 Aug 2026 18:10:12 +0300
Subject: [PATCH v4 5/5] staging: media: atomisp: remove hmm/hmm_common.h
 file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-atomisp_remove_hmm-v4-5-c3c954a12b51@gmail.com>
References: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
In-Reply-To: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786720280; l=2496;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=XsU4KkXrbGzK0QK8y3CwxsLorSCvlWH6WhdpqA7lSP4=;
 b=2LUmSBJW769o+AgUiECvrtfLA+q+wU99S8oMeQTRu+HwABsH6lGWQxnlolf168u87nviYhmFv
 RA/PMbCUK3YA24f6AF9R7gOHbKh9vHta4oTqV7OWnE8MmjEfpJ5kYap
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

Now this file contains nothing, and we can remove it and all the
"#include" directives.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm.h        |  1 -
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h     |  1 -
 drivers/staging/media/atomisp/include/hmm/hmm_common.h | 16 ----------------
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c         |  1 -
 4 files changed, 19 deletions(-)

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
index 7d0ef0f9eec8..c26038be76b6 100644
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

