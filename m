Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464427;
	b=vF3oiakLho8nuTSEmGjjl0Z0vU033yPMwIyBgAplpdvEQigrI8vFxB6B07A+TxCTCovM
	 7oxX0rf4nuzUuYpnfZFA6fr/QzBrpucL6FuJFsXfax3bTdM68sSWCBdgw7jzEJKxes/TG
	 24E1YMRMC+84tabL2ey2ODOgRnX5pXTb9KOZud/9gMZnR8qen8A66JldvlahY88WxT6Vr
	 ErF13tz8X2fSH28Kzgck4bQT8QXSKXi6Q8GJXxcikUW2MPkeJDPvpJfQIlVltXgnK30+a
	 j0NE6Im/iIgBKuMIqPUJ3nhsmIdVvIP0kMFyx/SvaEhS6bZqrV4nzYepAwGEy385y5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a2ziQehWCmdgrGG7cVUPIQm6dAT6aWiKHtE95x15y8o=;
	b=XbJLn+n8wHi4YHjzQ9yVC7PPLqk5MtGvDqgjOiEcK0MogPFPyq3hxZaqnMAluHMfldQV
	 kD1KfkKkmDGLjRJ6OCnQ9+yMjD+ePpKNG3vH0XyW7GA+4vPAL0FCPt0rJ7HkO9YKdoFrK
	 VWhapIsfJLQLcSsGrgCpsyi2OvrDWJFZwqCfqaZI0d5nb/AyRDAMfYmKk7GC6FiflBfzo
	 kM7Lo70dGrZtphxlT+I/QwBuow3XSKlyrXUv67PmHDhVnFCN0kueroS2jX7ftB0HXK+kc
	 E6qJnEkMEJZS03naimU8pdOfxXJIrcgnh20LPUYqGCmtT1K4E/8LBO0/QGEnz8B1djw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BSe2t1Vx;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C0A606A326
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 20:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83C0A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BSe2t1Vx
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f04bea9a93so31319095ad.3
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 12:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795464427; x=1796069227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a2ziQehWCmdgrGG7cVUPIQm6dAT6aWiKHtE95x15y8o=;
        b=BSe2t1Vxxt/GUuaXF6Rle1jjuc26YmcHWoFPxyzA1scFiUmskTGduJNViX87Ro2WQm
         SVftky6KMPlwmk8HRA/9q+ZU1eMYqQ6txsOPNwWFxgToZvnp4BwVh7PbU+OL8T99PdYk
         Ttte9qUXz2nAwPZl8uKVeYgK6FXkoTVyfqBtABi34cj6OGKywl1rjdwfwXCKvI/ffadt
         P24q3ZOXtEpNI8wV8wKsKQDCaibivK58M2Ub/f+CXn3aXo8RJ1Jr+/yvMqdgR17yFOQn
         zD8XzPybhy/oTjGblfOQqZ9l4WIj3uhOaoodcWvs/dGmpd2OvL/CbGRtwdYQvGVmqMXe
         RYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795464427; x=1796069227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2ziQehWCmdgrGG7cVUPIQm6dAT6aWiKHtE95x15y8o=;
        b=BHgDKxeSjFopWCl60rw05VVf46nc5bpLJGTWv86x/2QfwT9qrAFN5lwppe4pYget9x
         MzsI1Y3yfdW+u4yFCnubCRYH+W2tbWO4iqByDiSUCIaSGrUPuQn4o48g8vZ7Jp8kYn49
         iyn9MGXXLOey2iSGZHs598BCrgF1xE+tpDatZazcfj2VHTcH2zBFVyzP8CE1+mrIpvk3
         /x6a1Dwmf1nd42ODeDDzN6ANqtrBF/k1wsvCnU94bXY+2Ei2nQKiCcEP1U1H0xr7rrFW
         2pfXplN4ZkAq0IfyeTLVnzaOFltm49dQg1/a0yaCOUtRPDmr5ra8HiBimWawolCH5VBH
         Sd8g==
X-Forwarded-Encrypted: i=1; AL+hErFKKlhjpkEhK/nLEVyAn+9EGHyi0qPN0pzf47Z2fPt7CfP9G3us5QWVOyQ3r2r/XXyNkOKKhWYcqbBmWQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/qM6rdhuxoIDn+VEOdjNNrp2gjU0S+paNEBhSGaZSYfB8RcyOf
	BJpVv/JfXUxh2w1ejMzQaDwwxhtP1d/mq3bTwYNir8UxC/uls0ZjICEerIy+XRh4
X-Gm-Gg: AZFdTZcdipeK5c9EJ2o/ORx1vMMIITM+WofFKIAf5Q9aNLOcFxNwmpzM1pZThjk/Efc
	lUD4YlCyoJDeNBMCkpZ4NOOJCWxWsvy6DPmjzRBVvpSHiQRltiGEmvvlcQ6vi+APGMHQ1JYgc1W
	6tQWwlHE4n5i3vtyJbiRDlu70U/MLh+ztGIJCn/A26WddIInQbAyGli6+/4w9sfiTws2Z3vf6Bi
	fFMBP8ha8c6CSc+pGGmZPuKDNksO8dEOuQ4Gcw4KxO/bbuW+DDW+Msi9XT5NYlDqsDGf/70vYV3
	fk4jEJpAzefPLTIf2+cyIxU3O+oDBVO4kYC06+fjIetsdAR0b4EOG1MNdjWrX4oqCZsdlZPQRLl
	Q3zgELDKWL+jkg04sTSjv+4XhEHIaabah0KuS8z/kxLjIqubis4TJkb1vRBqRzEBfZyNbhhkNCD
	Qp1Ual9CDs8V55Y4GsROOdYMIwqzrlUOgA+vRAv70RzQljcBSSgENXanfjcTIEjmKBfbVMLZkgf
	1RWf2EjrzplBD1LN/RTuoZuf/v8KYwIjtbVzWzi5YallYB0zQq6GIuicSWd4AfolY6GGcn77UTv
	/Cq5TEDEmon1Y8uczuYXcUWb/06LzdlGjzSNIDMrFLXotpg9XTv1S7rhF0YkV+i2P6SsxXuCWw=
	=
X-Received: by 2002:a17:902:e80b:b0:2e9:660a:7944 with SMTP id d9443c01a7336-2f03f2689eemr126770635ad.58.1795464426593;
        Mon, 23 Nov 2026 12:07:06 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.40.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b8a43768sm3092515ad.31.2026.11.23.12.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:07:05 -0800 (PST)
From: Abhishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abhishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH] media: atomisp: Remove unused timed controller code
Date: Mon, 23 Nov 2026 20:06:58 +0000
Message-ID: <20261123200658.449-1-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The timed_ctrl device identifiers (timed_ctrl_ID_t, TIMED_CTRL0_ID,
N_TIMED_CTRL_ID, TIMED_CTRL_BASE) live in the shared system_global.h /
system_local.* enumerations and are left untouched.

No functional change intended.

Signed-off-by: Abhishek Chaulagain <chaulagainavishek14@gmail.com>
---
 drivers/staging/media/atomisp/Makefile        |  1 -
 .../pci/hive_isp_css_common/host/timed_ctrl.c | 66 -------------------
 .../host/timed_ctrl_local.h                   | 12 ----
 .../host/timed_ctrl_private.h                 | 26 --------
 .../hive_isp_css_common/timed_ctrl_global.h   | 46 -------------
 .../host/timed_ctrl_public.h                  | 51 --------------
 .../pci/hive_isp_css_include/timed_ctrl.h     | 37 -----------
 drivers/staging/media/atomisp/pci/sh_css.c    |  1 -
 .../media/atomisp/pci/timed_controller_defs.h | 14 ----
 9 files changed, 254 deletions(-)
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

