Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538714;
	b=GdBTXCB/tgrlZ65feNDo5rfTHQeXjIqZQ/kWl8smujwbCSFTY6UaPu9P60SR5Y/yB/Zx
	 li9dbO+aCn5T+apb3pdh8MVY32i2IZn/jMr8+cJfYuRqWWRXrxCYKSXxbjT8WlboGIZ3q
	 TC9LA0znmSa0CmPABW/DAGnvjpp62U2unpMryChWAX4EDM4IWRlRkjuzMFjC+MQuGmEDr
	 7kLFUegM7CXe14Gp+aHM4RuMv3ZwPXJjHAXcZke6zP7VNzrHA5of7KtIEqFltAVbEY2TG
	 dEH4qX76DA2sxoPNNz95rR4kn/fKJcw38BpyFrK5FC7bh8a2lQGLJ8uS48/9ybHcFcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8clXuzr2pVaGld1IP4PIdwifTriXaPZT/rMYgoCQtvI=;
	b=FKmLk42f/ne4IA8Fnatt4DotZwkWa36UxHbZ2i+umucMdcBhzUsU6jXiTkpXkkayYW5b
	 ZPAG7LTekMvpPQ+JrSGlA7BJTvJ5Id1KFtY0ye8E51G/74ulQCOJQSlWiS6h5WPk039/Q
	 q2W7NwG00taWeb4762itvbdPXFeh50tnMazi1Z62D4etkJe3yiuVANjHh961IHUfQGMZi
	 78Uz8Tgku89BfGJrr5sMLfby3gJgWT70Nwr7cW2QpkCnTfDPWGFuCnrWW+NGhirFsaDgq
	 4xmEfWthT5U3ldw46ZR52b0YwOIEGW2bGowQW857+5THOtH466Ait14FTFhXYBSpmAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WATsHt6p;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCD3606A323
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 16:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BCD3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WATsHt6p
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so2121020b3a.3
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 08:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795538712; x=1796143512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8clXuzr2pVaGld1IP4PIdwifTriXaPZT/rMYgoCQtvI=;
        b=WATsHt6pDFxPsa0QuYYrSQzXcCNUgUdwEo9J+OZutSz/AozaZ43ZgAy4ZEYxx94XFB
         pGEuN1CBRigGdzI+5P6pdMM+mL3cteuBYccgDpTUTYsZDnR+GPtXtw2NeTmOG/+gsSc0
         cFyylDRJAcCW20kgwh6KnXXPJp/GtXAl5ZQc4q/W/RNANx3fJ0fdZWgiR9QyUI2Fn/k6
         9R0TTeVklcbg0WE5/fXQBclFGyZYwy1e2yUOI0zLWR8xPlvAFd8rgA67D0HJ2jtZ/14D
         q98lub68FioZjndq1QWCSxix6Z6lfYuycHbPJW1ESufGJgYARJgDgmgV+IeFJ4Kls4Mc
         a9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538712; x=1796143512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8clXuzr2pVaGld1IP4PIdwifTriXaPZT/rMYgoCQtvI=;
        b=x9B2o12wytxcA0co5GXb/fzeBdL6tFHRkUKtdHOP4q2N+6kfzi0mVWhDkwcrIXtcIQ
         EA6DGkZ8QGup9sVo4Kc5Sa1fQD0RxDW7c8r6HDy5cLmzfp873ScKebLMSYqSa7ehD0RX
         SZxQChcoswmlla62IDcdeZWO+LKlriAz1x8d072u7om4LtRxfXWSSrbXrCVkDAGKw+GX
         PG69tNSaCvogjD5zJ8wV90uBbFGi81NtSyDZ/rLdDbMBUI5yvjIiFCGF/+TxUWZmvFGN
         Y95D/JQiFmkDV+uDEhuWZmV3i9HhPJ1PNRwL+daGvknPNIP4nbxDeP09eYtz5nqmFbXI
         pd9w==
X-Forwarded-Encrypted: i=1; AL+hErFzXSSIWlXHhSwaSHcYpS0N7sJUN1ORsE70dbnUAe327ebz/8vcXxmtlj5lHoVkR/RB/VdHOf0gOkxrww==@vger.kernel.org
X-Gm-Message-State: APuU4Z9I1uPFW7tqF82lSuNnKRAoRR5/z0KJfcYTBB36WALFAgr0T3ej
	/HZyKZgIYC48xVOKKBhvIaomx4Zwsr1OESXThMel8w3thVQh9fDtoe3v
X-Gm-Gg: AZFdTZdSNrEtyoHLGAJ503L+hT/065WIRfuz/Vd/B0bWYmSXW9P0h7Qy9L3lSzKwske
	ubUWUfx7T4x8T+wblUmDECrHjvYU2yY8fTl6OCHStsVKB4vmqfyfPe7QT80RJcZkFSPblJoXYKo
	RuM8SpregllRGMNYT5dhJUVBd0mVOhnlRoJrW59LTVUIbTXLyad/kgYTvUCtH9U98HHwe9RVceK
	wVBNVAOHfhSXvGO3cZpKp9AobEUFeIL97cfH5Ule64XYvp2ySV7oMJfhUNWg9xWlgQeh8bADAy6
	i0PviP8ONa6jbYqeKovmdMM0cb/sM0+cWSu55GllRgCMokrO54yZV+sODh7fq5KmyHKaMMXFx2P
	olijUH+AuzG3BrNbSLiBlptpK3Wg+YBkxAjWT0rNHy6MqVAldU43S0hGEZlaOYksZGy0eRVZGkQ
	6uBOFMDZPSProNsBlEaNdR7nZ7EKkJMK765b0ftQfpN7NBboFxyQMI4DGtVZMgBI6yRtCc1vo5L
	72HSBpZC+10ezX8i5KL1grZhWepmDM7cTss/s9zt9C6lOa1kWelfnTrX9eaP5XIcxqvWHckNuM7
	HJH5oSY7Qf6JoNZBN47A4NhO9SFWGLL+OBvcbby4MYJ7XvldbhARsodJNz5roe7PmQ69DbQm8g=
	=
X-Received: by 2002:a05:6a20:2448:b0:3eb:a890:5f8a with SMTP id adf61e73a8af0-4014e35c58fmr14924662637.86.1795538711452;
        Tue, 24 Nov 2026 08:45:11 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.40.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm5186228a12.27.2026.11.24.08.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:45:10 -0800 (PST)
From: Abhishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abhishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH v2] media: atomisp: Remove unused timed controller code
Date: Tue, 24 Nov 2026 16:45:04 +0000
Message-ID: <20261124164504.443-1-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123200658.449-1-chaulagainavishek14@gmail.com>
References: <20261123200658.449-1-chaulagainavishek14@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The timed controller HAL module - timed_ctrl_snd_commnd(),
timed_ctrl_snd_sp_commnd(), timed_ctrl_snd_gpio_commnd() and the inline
timed_ctrl_reg_store() helper they used - has no callers anywhere in the
tree. The only remaining reference was a stale #include in sh_css.c that
pulled in none of its symbols.

Remove the dead source file, its public/private/local/global headers and
the timed_controller_defs.h definitions header (included only by this
module), drop the object from the Makefile, and delete the unused include
from sh_css.c.

With the module gone, the timed_ctrl_ID_t enumeration in system_global.h
and the TIMED_CTRL_BASE[] base-address table in system_local.{c,h} have
no remaining users, so remove them as well.

No functional change intended.

Signed-off-by: Abhishek Chaulagain <chaulagainavishek14@gmail.com>
---
v2: Also remove the now-unused timed_ctrl_ID_t enum (system_global.h)
    and the TIMED_CTRL_BASE[] base-address table (system_local.{c,h}),
    which had no remaining users once the module was gone.  Raised by
    Andy during review of v1 [1].

[1] https://lore.kernel.org/all/20261123200658.449-1-chaulagainavishek14@gmail.com/
 drivers/staging/media/atomisp/Makefile        |  1 -
 .../pci/hive_isp_css_common/host/timed_ctrl.c | 66 -------------------
 .../host/timed_ctrl_local.h                   | 12 ----
 .../host/timed_ctrl_private.h                 | 26 --------
 .../hive_isp_css_common/timed_ctrl_global.h   | 46 -------------
 .../host/timed_ctrl_public.h                  | 51 --------------
 .../pci/hive_isp_css_include/timed_ctrl.h     | 37 -----------
 drivers/staging/media/atomisp/pci/sh_css.c    |  1 -
 .../staging/media/atomisp/pci/system_global.h |  5 --
 .../staging/media/atomisp/pci/system_local.c  |  5 --
 .../staging/media/atomisp/pci/system_local.h  |  3 -
 .../media/atomisp/pci/timed_controller_defs.h | 14 ----
 12 files changed, 267 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl.c
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_local.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_private.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_common/timed_ctrl_global.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/host/timed_ctrl_public.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/timed_ctrl.h
 delete mode 100644 drivers/staging/media/atomisp/pci/timed_controller_defs.h

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 1d0fbe220..2680e40d9 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -145,7 +145,6 @@ atomisp-objs += \
 	pci/hive_isp_css_common/host/isp.o \
 	pci/hive_isp_css_common/host/mmu.o \
 	pci/hive_isp_css_common/host/sp.o \
-	pci/hive_isp_css_common/host/timed_ctrl.o \
 	pci/hive_isp_css_common/host/vmem.o \
 	pci/hive_isp_css_shared/host/tag.o \
 	pci/system_local.o \
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl.c
deleted file mode 100644
index 948b0b0a0..000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl.c
+++ /dev/null
@@ -1,66 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- */
-
-#include "timed_ctrl.h"
-
-#ifndef __INLINE_TIMED_CTRL__
-#include "timed_ctrl_private.h"
-#endif /* __INLINE_TIMED_CTRL__ */
-
-#include "assert_support.h"
-
-void timed_ctrl_snd_commnd(
-    const timed_ctrl_ID_t			ID,
-    hrt_data				mask,
-    hrt_data				condition,
-    hrt_data				counter,
-    hrt_address				addr,
-    hrt_data				value)
-{
-	OP___assert(ID == TIMED_CTRL0_ID);
-	OP___assert(TIMED_CTRL_BASE[ID] != (hrt_address)-1);
-
-	timed_ctrl_reg_store(ID, _HRT_TIMED_CONTROLLER_CMD_REG_IDX, mask);
-	timed_ctrl_reg_store(ID, _HRT_TIMED_CONTROLLER_CMD_REG_IDX, condition);
-	timed_ctrl_reg_store(ID, _HRT_TIMED_CONTROLLER_CMD_REG_IDX, counter);
-	timed_ctrl_reg_store(ID, _HRT_TIMED_CONTROLLER_CMD_REG_IDX, (hrt_data)addr);
-	timed_ctrl_reg_store(ID, _HRT_TIMED_CONTROLLER_CMD_REG_IDX, value);
-}
-
-/* pqiao TODO: make sure the following commands get
-	correct BASE address both for csim and android */
-
-void timed_ctrl_snd_sp_commnd(
-    const timed_ctrl_ID_t			ID,
-    hrt_data				mask,
-    hrt_data				condition,
-    hrt_data				counter,
-    const sp_ID_t				SP_ID,
-    hrt_address				offset,
-    hrt_data				value)
-{
-	OP___assert(SP_ID < N_SP_ID);
-	OP___assert(SP_DMEM_BASE[SP_ID] != (hrt_address)-1);
-
-	timed_ctrl_snd_commnd(ID, mask, condition, counter,
-			      SP_DMEM_BASE[SP_ID] + offset, value);
-}
-
-void timed_ctrl_snd_gpio_commnd(
-    const timed_ctrl_ID_t			ID,
-    hrt_data				mask,
-    hrt_data				condition,
-    hrt_data				counter,
-    const gpio_ID_t				GPIO_ID,
-    hrt_address				offset,
-    hrt_data				value)
-{
-	OP___assert(GPIO_ID < N_GPIO_ID);
-	OP___assert(GPIO_BASE[GPIO_ID] != (hrt_address)-1);
-
-	timed_ctrl_snd_commnd(ID, mask, condition, counter,
-			      GPIO_BASE[GPIO_ID] + offset, value);
-}
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_local.h
deleted file mode 100644
index bf97f272a..000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_local.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2010-2015, Intel Corporation.
- */
-
-#ifndef __TIMED_CTRL_LOCAL_H_INCLUDED__
-#define __TIMED_CTRL_LOCAL_H_INCLUDED__
-
-#include "timed_ctrl_global.h"
-
-#endif /* __TIMED_CTRL_LOCAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_private.h
deleted file mode 100644
index 7b90b4cf0..000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_private.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2010-2015, Intel Corporation.
- */
-
-#ifndef __TIMED_CTRL_PRIVATE_H_INCLUDED__
-#define __TIMED_CTRL_PRIVATE_H_INCLUDED__
-
-#include "timed_ctrl_public.h"
-
-#include "device_access.h"
-
-#include "assert_support.h"
-
-STORAGE_CLASS_TIMED_CTRL_C void timed_ctrl_reg_store(
-    const timed_ctrl_ID_t	ID,
-    const unsigned int		reg,
-    const hrt_data			value)
-{
-	OP___assert(ID < N_TIMED_CTRL_ID);
-	OP___assert(TIMED_CTRL_BASE[ID] != (hrt_address) - 1);
-	ia_css_device_store_uint32(TIMED_CTRL_BASE[ID] + reg * sizeof(hrt_data), value);
-}
-
-#endif /* __GP_DEVICE_PRIVATE_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/timed_ctrl_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/timed_ctrl_global.h
deleted file mode 100644
index e4c136660..000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/timed_ctrl_global.h
+++ /dev/null
@@ -1,46 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- */
-
-#ifndef __TIMED_CTRL_GLOBAL_H_INCLUDED__
-#define __TIMED_CTRL_GLOBAL_H_INCLUDED__
-
-#define IS_TIMED_CTRL_VERSION_1
-
-#include "timed_controller_defs.h"
-
-/*
- * Order of the input bits for the timed controller taken from
- * ISP_CSS_2401 System Architecture Description valid for
- * 2400, 2401.
- *
- * Check for other systems.
- */
-#define HIVE_TIMED_CTRL_GPIO_PIN_0_BIT_ID                       0
-#define HIVE_TIMED_CTRL_GPIO_PIN_1_BIT_ID                       1
-#define HIVE_TIMED_CTRL_GPIO_PIN_2_BIT_ID                       2
-#define HIVE_TIMED_CTRL_GPIO_PIN_3_BIT_ID                       3
-#define HIVE_TIMED_CTRL_GPIO_PIN_4_BIT_ID                       4
-#define HIVE_TIMED_CTRL_GPIO_PIN_5_BIT_ID                       5
-#define HIVE_TIMED_CTRL_GPIO_PIN_6_BIT_ID                       6
-#define HIVE_TIMED_CTRL_GPIO_PIN_7_BIT_ID                       7
-#define HIVE_TIMED_CTRL_GPIO_PIN_8_BIT_ID                       8
-#define HIVE_TIMED_CTRL_GPIO_PIN_9_BIT_ID                       9
-#define HIVE_TIMED_CTRL_GPIO_PIN_10_BIT_ID                      10
-#define HIVE_TIMED_CTRL_GPIO_PIN_11_BIT_ID                      11
-#define HIVE_TIMED_CTRL_IRQ_SP_BIT_ID                           12
-#define HIVE_TIMED_CTRL_IRQ_ISP_BIT_ID                          13
-#define HIVE_TIMED_CTRL_IRQ_INPUT_SYSTEM_BIT_ID                 14
-#define HIVE_TIMED_CTRL_IRQ_INPUT_SELECTOR_BIT_ID               15
-#define HIVE_TIMED_CTRL_IRQ_IF_BLOCK_BIT_ID                     16
-#define HIVE_TIMED_CTRL_IRQ_GP_TIMER_0_BIT_ID                   17
-#define HIVE_TIMED_CTRL_IRQ_GP_TIMER_1_BIT_ID                   18
-#define HIVE_TIMED_CTRL_CSI_SOL_BIT_ID                          19
-#define HIVE_TIMED_CTRL_CSI_EOL_BIT_ID                          20
-#define HIVE_TIMED_CTRL_CSI_SOF_BIT_ID                          21
-#define HIVE_TIMED_CTRL_CSI_EOF_BIT_ID                          22
-#define HIVE_TIMED_CTRL_IRQ_IS_STREAMING_MONITOR_BIT_ID         23
-
-#endif /* __TIMED_CTRL_GLOBAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/timed_ctrl_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/timed_ctrl_public.h
deleted file mode 100644
index 51e0bc0d0..000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/timed_ctrl_public.h
+++ /dev/null
@@ -1,51 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- */
-
-#ifndef __TIMED_CTRL_PUBLIC_H_INCLUDED__
-#define __TIMED_CTRL_PUBLIC_H_INCLUDED__
-
-#include "system_local.h"
-
-/*! Write to a control register of TIMED_CTRL[ID]
-
- \param	ID[in]				TIMED_CTRL identifier
- \param	reg_addr[in]		register byte address
- \param value[in]			The data to be written
-
- \return none, TIMED_CTRL[ID].ctrl[reg] = value
- */
-STORAGE_CLASS_TIMED_CTRL_H void timed_ctrl_reg_store(
-    const timed_ctrl_ID_t	ID,
-    const unsigned int		reg_addr,
-    const hrt_data			value);
-
-void timed_ctrl_snd_commnd(
-    const timed_ctrl_ID_t				ID,
-    hrt_data				mask,
-    hrt_data				condition,
-    hrt_data				counter,
-    hrt_address				addr,
-    hrt_data				value);
-
-void timed_ctrl_snd_sp_commnd(
-    const timed_ctrl_ID_t				ID,
-    hrt_data				mask,
-    hrt_data				condition,
-    hrt_data				counter,
-    const sp_ID_t			SP_ID,
-    hrt_address				offset,
-    hrt_data				value);
-
-void timed_ctrl_snd_gpio_commnd(
-    const timed_ctrl_ID_t				ID,
-    hrt_data				mask,
-    hrt_data				condition,
-    hrt_data				counter,
-    const gpio_ID_t			GPIO_ID,
-    hrt_address				offset,
-    hrt_data				value);
-
-#endif /* __TIMED_CTRL_PUBLIC_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/timed_ctrl.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/timed_ctrl.h
deleted file mode 100644
index b8f48b3c9..000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/timed_ctrl.h
+++ /dev/null
@@ -1,37 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- */
-
-#ifndef __TIMED_CTRL_H_INCLUDED__
-#define __TIMED_CTRL_H_INCLUDED__
-
-/*
- * This file is included on every cell {SP,ISP,host} and on every system
- * that uses the input system device(s). It defines the API to DLI bridge
- *
- * System and cell specific interfaces and inline code are included
- * conditionally through Makefile path settings.
- *
- *  - .        system and cell agnostic interfaces, constants and identifiers
- *	- public:  system agnostic, cell specific interfaces
- *	- private: system dependent, cell specific interfaces & inline implementations
- *	- global:  system specific constants and identifiers
- *	- local:   system and cell specific constants and identifiers
- */
-
-#include "system_local.h"
-#include "timed_ctrl_local.h"
-
-#ifndef __INLINE_TIMED_CTRL__
-#define STORAGE_CLASS_TIMED_CTRL_H extern
-#define STORAGE_CLASS_TIMED_CTRL_C
-#include "timed_ctrl_public.h"
-#else  /* __INLINE_TIMED_CTRL__ */
-#define STORAGE_CLASS_TIMED_CTRL_H static inline
-#define STORAGE_CLASS_TIMED_CTRL_C static inline
-#include "timed_ctrl_private.h"
-#endif /* __INLINE_TIMED_CTRL__ */
-
-#endif /* __TIMED_CTRL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 4a182dc38..e3942362c 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -60,7 +60,6 @@
 #include "gp_device.h"		/* gp_device_reg_store() */
 #include <gpio_global.h>
 #include <gpio_private.h>
-#include "timed_ctrl.h"
 #include "ia_css_inputfifo.h"
 #define WITH_PC_MONITORING  0
 
diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index ee1d9b66c..c50efde99 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -158,11 +158,6 @@ typedef enum {
 	N_GPIO_ID
 } gpio_ID_t;
 
-typedef enum {
-	TIMED_CTRL0_ID = 0,
-	N_TIMED_CTRL_ID
-} timed_ctrl_ID_t;
-
 typedef enum {
 	INPUT_FORMATTER0_ID = 0,
 	INPUT_FORMATTER1_ID,
diff --git a/drivers/staging/media/atomisp/pci/system_local.c b/drivers/staging/media/atomisp/pci/system_local.c
index 69bcd557a..ba99075d2 100644
--- a/drivers/staging/media/atomisp/pci/system_local.c
+++ b/drivers/staging/media/atomisp/pci/system_local.c
@@ -93,11 +93,6 @@ const hrt_address GPIO_BASE[N_GPIO_ID] = {
 	0x0000000000000400ULL
 };
 
-/* TIMED_CTRL */
-const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID] = {
-	0x0000000000000100ULL
-};
-
 /* INPUT_FORMATTER */
 const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
 	0x0000000000030000ULL,
diff --git a/drivers/staging/media/atomisp/pci/system_local.h b/drivers/staging/media/atomisp/pci/system_local.h
index 970f4ef99..cab0669a4 100644
--- a/drivers/staging/media/atomisp/pci/system_local.h
+++ b/drivers/staging/media/atomisp/pci/system_local.h
@@ -61,9 +61,6 @@ extern const hrt_address GP_TIMER_BASE;
 /* GPIO */
 extern const hrt_address GPIO_BASE[N_GPIO_ID];
 
-/* TIMED_CTRL */
-extern const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID];
-
 /* INPUT_FORMATTER */
 extern const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID];
 
diff --git a/drivers/staging/media/atomisp/pci/timed_controller_defs.h b/drivers/staging/media/atomisp/pci/timed_controller_defs.h
deleted file mode 100644
index 37a9226c6..000000000
--- a/drivers/staging/media/atomisp/pci/timed_controller_defs.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- */
-
-#ifndef _timed_controller_defs_h
-#define _timed_controller_defs_h
-
-#define _HRT_TIMED_CONTROLLER_CMD_REG_IDX 0
-
-#define _HRT_TIMED_CONTROLLER_REG_ALIGN 4
-
-#endif /* _timed_controller_defs_h */
-- 
2.43.0

