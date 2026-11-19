Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102741;
	b=xQ6j+RcV34ie0CYwNoFzgC1jwa/q3jkenXmAaDqM8OxFTem2Xr94fEj6yrD6BB0O0g1n
	 2PKmI74NMiqGftqVQWMWakcVMgx1lEm0eDtbzFhJ/LAyo8KlAeR0YWK5KqWThrwkD7rqU
	 AoiUFhLF305lwAn/R+FiX/RHxE+QgMNvOq5cLUKiWcQx5LQSq/jhK/t5fDaGc4aYa16kj
	 L2e1+KXqMsiFCEtd+Z9o8cvbD0V+dKlPhd+NzGml9tBRSD1nTl31bCFx1Hd/WTVHEJSl1
	 MGoVr8lOQTQgXTrVkt1jdNZPSU6+4rLgawZTKrYTU6FrfhrgHLV7emyYSP/BKSJw7ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102741;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O8HYYjupFmfPa9Xd5itdWPX+UoG8R9ZtiB0654TVUaI=;
	b=S1PZM7Exd3OnJgmgVhzrZCERiadMUeSGhO8VCyuwc57wbEL1v+vQIx+Uo9Lsuek9zNYS
	 5FtWEtRJMZjuNKfsWfxAbY3TGnYrSQRBmITFLyYxdphUlbxkhxBGrj4i8e4EwMqhryikL
	 DllD+QmMRW5V8SxL01etHVjeOrZNZK879rf6DEgwCKITTNRqh8ldQvfMZ5mBNcpsgMlHX
	 8WDF0lvQQL8RZWSTy0lMvtmgeARkmDqDaB6Hy928bjlQjcfwQbanXJPwFfoVWQFABZQRQ
	 IxsdEM16e9Mfz3NJrqNIv3Xj/z2gPPAv8BfqDGpdZ0/yTh9zb7rcVQpPcXlrvjIb6nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="uFxM/cgS";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3D6606C495;
	Thu, 19 Nov 2026 15:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D3D6606C495
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uFxM/cgS
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C36E1C0A;
	Thu, 19 Nov 2026 07:38:55 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96C3D3F882;
	Thu, 19 Nov 2026 07:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102738; bh=KM8ICToR4BCELBHnAn/N7rkHDdKpgb/VXN8cxuvwvDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uFxM/cgS9+n6HsNhZoEZrqnnBUD/JM9/Oku7CKYU3RKSNy1SF/3nvsNVDPEDu/qZd
	 yVfq1sLvigrSVKSNEE07E4vP9PowSK0wHVjcmhyQCpaUCb8JtxNk58YzdIsW6oqnf+
	 ALdJLMBwBeoLcGSzjP1HNNT69AjK/pRKAeJJKBNI=
From: Charvi Mehta <charvi.mehta@arm.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Charvi Mehta <charvi.mehta@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
	Shobhit Pandey <shobhit.pandey@arm.com>
Subject: [RFC PATCH 17/28] media: mali-vpu: add single session scheduler
Date: Thu, 19 Nov 2026 15:37:47 +0000
Message-ID: <20261119153758.1426673-18-charvi.mehta@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119153758.1426673-1-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
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

Add a scheduler with a simple policy that assigns all available VPU cores
to a single session mapped at LSID 0. Provide operations for switching
the session in, signalling firmware, flushing its MMU context and
terminating execution.

Initialize the scheduler during probe and prepare the session hardware
context when its firmware is loaded.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 drivers/media/platform/arm/mali-vpu/Makefile  |   3 +-
 .../platform/arm/mali-vpu/mali-vpu-device.h   |   4 +
 .../platform/arm/mali-vpu/mali-vpu-lsid.h     |   3 +
 .../platform/arm/mali-vpu/mali-vpu-mmu.c      |   6 +
 .../platform/arm/mali-vpu/mali-vpu-mmu.h      |   2 +
 .../platform/arm/mali-vpu/mali-vpu-probe.c    |  11 +-
 .../arm/mali-vpu/mali-vpu-registers.h         |   9 +
 .../arm/mali-vpu/mali-vpu-scheduler.c         | 224 ++++++++++++++++++
 .../arm/mali-vpu/mali-vpu-scheduler.h         |  57 +++++
 .../platform/arm/mali-vpu/mali-vpu-session.c  |  14 +-
 .../platform/arm/mali-vpu/mali-vpu-session.h  |   6 +
 .../arm/mali-vpu/mali-vpu-variant-v76.c       |   2 +
 .../platform/arm/mali-vpu/mali-vpu-variant.h  |   2 +
 13 files changed, 334 insertions(+), 9 deletions(-)
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-scheduler.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-scheduler.h

diff --git a/drivers/media/platform/arm/mali-vpu/Makefile b/drivers/media/platform/arm/mali-vpu/Makefile
index 51d49d815f1fb..5860cda6055cc 100644
--- a/drivers/media/platform/arm/mali-vpu/Makefile
+++ b/drivers/media/platform/arm/mali-vpu/Makefile
@@ -12,6 +12,7 @@ mali-vpu-objs := mali-vpu-probe.o \
 		mali-vpu-mmu.o \
 		mali-vpu-firmware-cache.o \
 		mali-vpu-firmware.o \
-		mali-vpu-lsid.o
+		mali-vpu-lsid.o \
+		mali-vpu-scheduler.o
 
 obj-$(CONFIG_VIDEO_MALI_VPU) += mali-vpu.o
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
index a35c1b901aa3f..9be36e47d0879 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
@@ -9,6 +9,8 @@
 #include <linux/device.h>
 #include <media/v4l2-device.h>
 
+#include "mali-vpu-scheduler.h"
+
 #define MALI_VPU_DRV_NAME "mali-vpu"
 
 struct clk_bulk_data;
@@ -40,6 +42,7 @@ enum mali_vpu_session_role {
  * @vdev_dec: Video device structure for decoder.
  * @m2m_dev: V4L2 mem2mem device structure for mali vpu.
  * @fw_cache: Firmware cache for sharing or reusing firmware blobs.
+ * @sched: Mali VPU hardware scheduler state.
  */
 struct mali_vpu_dev {
 	struct device			*dev;
@@ -56,6 +59,7 @@ struct mali_vpu_dev {
 	struct video_device		*vdev_dec;
 	struct v4l2_m2m_dev		*m2m_dev;
 	struct mali_vpu_fw_cache	*fw_cache;
+	struct mali_vpu_sched		sched;
 };
 
 #endif /* __MALI_VPU_DEVICE_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-lsid.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-lsid.h
index 97c32f9ac9aa0..57733304d4e17 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-lsid.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-lsid.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 struct mali_vpu_dev;
+struct mali_vpu_sched_session;
 
 /*
  * A local session identifier (LSID) represents a hardware execution
@@ -36,10 +37,12 @@ struct mali_vpu_lsid_pcb {
 /**
  * struct mali_vpu_lsid - Hardware LSID instance.
  * @vpu_dev: Back pointer to parent Mali VPU device.
+ * @sched_sess: Scheduler session currently mapped to this LSID, if any.
  * @id: Hardware LSID instance.
  */
 struct mali_vpu_lsid {
 	struct mali_vpu_dev *vpu_dev;
+	struct mali_vpu_sched_session *sched_sess;
 	u32 id;
 };
 
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.c
index 00cf5251eff5e..115539fe1cb3e 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.c
@@ -691,3 +691,9 @@ int mali_vpu_mmu_write(struct mali_vpu_mmu_pages *pages,
 
 	return 0;
 }
+
+mali_vpu_mmu_pte mali_vpu_mmu_get_root_pte(const struct mali_vpu_mmu *mmu)
+{
+	return mali_vpu_mmu_set_pte(MALI_VPU_ATTR_PRIVATE, mmu->root.dma,
+				    MALI_VPU_ACCESS_READ_WRITE);
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.h
index 6ad645a2dc6bb..4baf1daaf2983 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.h
@@ -149,4 +149,6 @@ int mali_vpu_mmu_map_dma(struct mali_vpu_mmu *mmu,
 void mali_vpu_mmu_unmap_va(struct mali_vpu_mmu *mmu, mali_vpu_mmu_va va, size_t size);
 int mali_vpu_mmu_write(struct mali_vpu_mmu_pages *pages, const void *data, size_t size);
 
+mali_vpu_mmu_pte mali_vpu_mmu_get_root_pte(const struct mali_vpu_mmu *mmu);
+
 #endif /* __MALI_VPU_MMU_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
index 123ff4d8fc937..0c7ea9035fb50 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
@@ -208,17 +208,21 @@ static int mali_vpu_probe(struct platform_device *pdev)
 		goto err_rst_clk;
 	}
 
+	ret = mali_vpu_sched_init(&vpu_dev->sched, vpu_dev);
+	if (ret)
+		goto err_rst_clk;
+
 	vpu_dev->dma_mask = vpu_dev->variant->dma_mask;
 	ret = dma_set_mask_and_coherent(vpu_dev->dev, vpu_dev->dma_mask);
 	if (ret)
-		goto err_rst_clk;
+		goto err_cleanup_sched;
 
 	dma_set_max_seg_size(vpu_dev->dev, SZ_2G);
 
 	ret = v4l2_device_register(&pdev->dev, &vpu_dev->v4l2_dev);
 	if (ret) {
 		dev_err(vpu_dev->dev, "failed to register V4L2 device\n");
-		goto err_rst_clk;
+		goto err_cleanup_sched;
 	}
 
 	vpu_dev->m2m_dev = v4l2_m2m_init(&mali_vpu_m2m_ops);
@@ -251,6 +255,8 @@ static int mali_vpu_probe(struct platform_device *pdev)
 	v4l2_m2m_release(vpu_dev->m2m_dev);
 err_unreg_v4l2:
 	v4l2_device_unregister(&vpu_dev->v4l2_dev);
+err_cleanup_sched:
+	mali_vpu_sched_cleanup(&vpu_dev->sched);
 err_rst_clk:
 	mali_vpu_assert_reset(vpu_dev);
 err_clk:
@@ -268,6 +274,7 @@ static void mali_vpu_remove(struct platform_device *pdev)
 	v4l2_m2m_release(vpu_dev->m2m_dev);
 	v4l2_device_unregister(&vpu_dev->v4l2_dev);
 
+	mali_vpu_sched_cleanup(&vpu_dev->sched);
 	mali_vpu_assert_reset(vpu_dev);
 	mali_vpu_disable_clk(vpu_dev);
 
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h
index f2386bdc4943a..1a3e0fcdba4c6 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h
@@ -17,7 +17,10 @@
 #define MALI_VPU_REG_VERSION  0x00000
 #define MALI_VPU_REG_ENABLE   0x00004
 #define MALI_VPU_REG_NCORES   0x00008
+#define MALI_VPU_REG_NLSID    0x0000C
 #define MALI_VPU_REG_JOBQUEUE 0x00014
+#define MALI_VPU_REG_CLKFORCE 0x00024
+#define MALI_VPU_REG_RESET    0x00050
 
 #define MALI_VPU_LSID_BASE    0x00200
 #define MALI_VPU_LSID_STRIDE  0x40
@@ -54,6 +57,12 @@
 #define MALI_VPU_JOBQUEUE_JOB_INVALID 0xf
 #define MALI_VPU_JOBQUEUE_NJOBS       4
 
+/* IRQVE contains one interrupt bit per LSID. */
+#define MALI_VPU_IRQVE_NUM_BITS 32
+
+/* CTRL register fields */
+#define MALI_VPU_CTRL_MAXCORES GENMASK(11, 8)
+
 #define MALI_VPU_ALLOC_FREE          0
 #define MALI_VPU_ALLOC_NON_PROTECTED 1
 #define MALI_VPU_ALLOC_PROTECTED     2
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-scheduler.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-scheduler.c
new file mode 100644
index 0000000000000..cae9ac0093be9
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-scheduler.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/string.h>
+
+#include "mali-vpu-device.h"
+#include "mali-vpu-mmu.h"
+#include "mali-vpu-registers.h"
+#include "mali-vpu-scheduler.h"
+#include "mali-vpu-session.h"
+#include "mali-vpu-variant.h"
+
+int mali_vpu_sched_init(struct mali_vpu_sched *sched, struct mali_vpu_dev *vpu_dev)
+{
+	u32 hw_nlsid, variant_nlsid;
+	u32 lsid, max_irq_lsid;
+
+	if (!vpu_dev->variant || !vpu_dev->variant->max_lsid)
+		return -EINVAL;
+
+	hw_nlsid = mali_vpu_read_reg(vpu_dev->regs_base, MALI_VPU_REG_NLSID);
+	variant_nlsid = vpu_dev->variant->max_lsid;
+
+	max_irq_lsid = min_t(u32, BITS_PER_LONG, MALI_VPU_IRQVE_NUM_BITS);
+	if (variant_nlsid > max_irq_lsid) {
+		dev_err(vpu_dev->dev,
+			"variant supports %u LSIDs, but IRQ handling supports only %u\n",
+			variant_nlsid, max_irq_lsid);
+		return -EINVAL;
+	}
+
+	if (!hw_nlsid || hw_nlsid > variant_nlsid) {
+		dev_err(vpu_dev->dev,
+			"hardware reports %u LSIDs, but variant supports only %u\n",
+			hw_nlsid, variant_nlsid);
+		return -EINVAL;
+	}
+
+	sched->nlsid = hw_nlsid;
+	sched->lsid_list = devm_kcalloc(vpu_dev->dev, sched->nlsid,
+					sizeof(*sched->lsid_list), GFP_KERNEL);
+	if (!sched->lsid_list)
+		return -ENOMEM;
+
+	sched->vpu_dev = vpu_dev;
+	mutex_init(&sched->lock);
+
+	for (lsid = 0; lsid < sched->nlsid; lsid++)
+		mali_vpu_lsid_init(&sched->lsid_list[lsid], vpu_dev, lsid);
+
+	mali_vpu_write_reg(vpu_dev->regs_base, MALI_VPU_REG_RESET, 1);
+	mali_vpu_write_reg(vpu_dev->regs_base, MALI_VPU_REG_CLKFORCE, 0);
+
+	return 0;
+}
+
+void mali_vpu_sched_cleanup(struct mali_vpu_sched *sched)
+{
+	mutex_destroy(&sched->lock);
+}
+
+int mali_vpu_sched_session_prepare(struct mali_vpu_sched_session *sched_sess,
+				   struct mali_vpu_session *sess)
+{
+	u32 hw_ncores, ctrl = 0;
+
+	if (sched_sess->lsid)
+		return -EBUSY;
+
+	if (!sess->mmu.root.cpu)
+		return -EINVAL;
+
+	/* Simple scheduling policy - all cores for all sessions */
+	hw_ncores = mali_vpu_read_reg(sess->vpu_dev->regs_base, MALI_VPU_REG_NCORES);
+	if (!hw_ncores ||
+	    hw_ncores > BIT(MALI_VPU_JOBQUEUE_NCORES_BITS))
+		return -EINVAL;
+
+	ctrl |= FIELD_PREP(MALI_VPU_CTRL_MAXCORES, hw_ncores);
+
+	memset(sched_sess, 0, sizeof(*sched_sess));
+
+	sched_sess->core_count = hw_ncores;
+	sched_sess->pcb.ctrl = ctrl;
+	sched_sess->pcb.mmu_ctrl = mali_vpu_mmu_get_root_pte(&sess->mmu);
+	sched_sess->pcb.nprot = 1;
+
+	sess->ncores = sched_sess->core_count;
+
+	return 0;
+}
+
+static void mali_vpu_sched_reset_locked(struct mali_vpu_sched *sched)
+{
+	struct mali_vpu_lsid *lsid;
+	u32 i;
+
+	lockdep_assert_held(&sched->lock);
+
+	mali_vpu_write_reg(sched->vpu_dev->regs_base, MALI_VPU_REG_RESET, 1);
+
+	for (i = 0; i < sched->nlsid; i++) {
+		lsid = &sched->lsid_list[i];
+
+		if (lsid->sched_sess)
+			lsid->sched_sess->lsid = NULL;
+
+		lsid->sched_sess = NULL;
+	}
+
+	mali_vpu_write_reg(sched->vpu_dev->regs_base, MALI_VPU_REG_CLKFORCE, 0);
+}
+
+int mali_vpu_sched_switch_in(struct mali_vpu_sched_session *sched_sess,
+			     struct mali_vpu_sched *sched)
+{
+	struct mali_vpu_lsid *lsid;
+	struct mali_vpu_sched_session *owner;
+	bool mapped_here = false;
+	int ret = 0;
+
+	mutex_lock(&sched->lock);
+
+	if (!sched->nlsid) {
+		ret = -ENODEV;
+		goto err_unlock;
+	}
+
+	/* Allow only one active session as a simple policy */
+	lsid = &sched->lsid_list[0];
+
+	owner = lsid->sched_sess;
+	if (owner && owner != sched_sess) {
+		ret = -EBUSY;
+		goto err_unlock;
+	}
+
+	if (sched_sess->lsid && sched_sess->lsid != lsid) {
+		ret = -EINVAL;
+		goto err_unlock;
+	}
+
+	if (!sched_sess->lsid) {
+		/* Map the session to an lsid first */
+		ret = mali_vpu_lsid_map(lsid, &sched_sess->pcb);
+		if (ret) {
+			if (ret == -ETIMEDOUT)
+				mali_vpu_sched_reset_locked(sched);
+			goto err_unlock;
+		}
+
+		lsid->sched_sess = sched_sess;
+		sched_sess->lsid = lsid;
+		mapped_here = true;
+	}
+
+	/* Add the session to jobqueue */
+	ret = mali_vpu_lsid_jobqueue_add(sched_sess->lsid, sched_sess->core_count);
+	if (ret && mapped_here) {
+		mali_vpu_lsid_unmap(lsid, &sched_sess->pcb);
+		lsid->sched_sess = NULL;
+		sched_sess->lsid = NULL;
+	}
+
+err_unlock:
+	mutex_unlock(&sched->lock);
+	return ret;
+}
+
+void mali_vpu_sched_send_irq(struct mali_vpu_sched_session *sched_sess,
+			     struct mali_vpu_sched *sched)
+{
+	mutex_lock(&sched->lock);
+	if (!sched_sess->lsid)
+		sched_sess->pcb.irqhost = 1;
+	else
+		mali_vpu_lsid_send_irq(sched_sess->lsid);
+	mutex_unlock(&sched->lock);
+}
+
+void mali_vpu_sched_flush_mmu(struct mali_vpu_sched_session *sched_sess,
+			      struct mali_vpu_sched *sched)
+{
+	mutex_lock(&sched->lock);
+	if (sched_sess->lsid)
+		mali_vpu_lsid_flush_mmu(sched_sess->lsid);
+	mutex_unlock(&sched->lock);
+}
+
+int mali_vpu_sched_session_terminate(struct mali_vpu_sched_session *sched_sess,
+				     struct mali_vpu_sched *sched)
+{
+	struct mali_vpu_lsid *lsid;
+	int ret = 0;
+
+	mutex_lock(&sched->lock);
+
+	lsid = sched_sess->lsid;
+	if (!lsid)
+		goto unlock;
+
+	mali_vpu_lsid_jobqueue_remove(sched_sess->lsid);
+
+	ret = mali_vpu_lsid_terminate(sched_sess->lsid);
+	if (ret) {
+		dev_err(sched->vpu_dev->dev,
+			"failed to terminate LSID %u: %d; resetting VPU\n",
+			lsid->id, ret);
+		mali_vpu_sched_reset_locked(sched);
+		goto unlock;
+	}
+
+	mali_vpu_lsid_unmap(lsid, &sched_sess->pcb);
+	lsid->sched_sess = NULL;
+	sched_sess->lsid = NULL;
+
+unlock:
+	mutex_unlock(&sched->lock);
+
+	return ret;
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-scheduler.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-scheduler.h
new file mode 100644
index 0000000000000..23167aef6ff62
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-scheduler.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#ifndef __MALI_VPU_SCHEDULER_H__
+#define __MALI_VPU_SCHEDULER_H__
+
+#include <linux/mutex.h>
+
+#include "mali-vpu-lsid.h"
+
+struct mali_vpu_dev;
+struct mali_vpu_session;
+
+/**
+ * struct mali_vpu_sched_session - Client session class.
+ * @lsid: Pointer to LSID the session is mapped to.
+ * @pcb: LSID process control block programmed when the session is mapped.
+ * @core_count: Number of cores assigned to this scheduled session.
+ *
+ * This struct is used to keep track of session's information needed by the scheduler.
+ */
+struct mali_vpu_sched_session {
+	struct mali_vpu_lsid *lsid;
+	struct mali_vpu_lsid_pcb pcb;
+	u32 core_count;
+};
+
+/**
+ * struct mali_vpu_sched - Scheduler class.
+ * @vpu_dev: Pointer to mali_vpu_dev structure.
+ * @lock: Serialise access to sched resources.
+ * @lsid_list: Array of LSID instances.
+ * @nlsid: Number of LSIDs.
+ */
+struct mali_vpu_sched {
+	struct mali_vpu_dev *vpu_dev;
+	struct mutex lock;	/* Serialise access to sched resources. */
+	struct mali_vpu_lsid *lsid_list;
+	u32 nlsid;
+};
+
+int mali_vpu_sched_init(struct mali_vpu_sched *sched, struct mali_vpu_dev *dev);
+void mali_vpu_sched_cleanup(struct mali_vpu_sched *sched);
+int mali_vpu_sched_session_prepare(struct mali_vpu_sched_session *sched_sess,
+				   struct mali_vpu_session *sess);
+int mali_vpu_sched_switch_in(struct mali_vpu_sched_session *sched_sess,
+			     struct mali_vpu_sched *sched);
+void mali_vpu_sched_send_irq(struct mali_vpu_sched_session *sched_sess,
+			     struct mali_vpu_sched *sched);
+void mali_vpu_sched_flush_mmu(struct mali_vpu_sched_session *sched_sess,
+			      struct mali_vpu_sched *sched);
+int mali_vpu_sched_session_terminate(struct mali_vpu_sched_session *sched_sess,
+				     struct mali_vpu_sched *sched);
+
+#endif /* __MALI_VPU_SCHEDULER_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
index 36197e82461be..c5579edfe627f 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -16,7 +16,6 @@
 #include "mali-vpu-firmware.h"
 #include "mali-vpu-firmware-cache.h"
 #include "mali-vpu-formats.h"
-#include "mali-vpu-registers.h"
 #include "mali-vpu-variant.h"
 #include "mali-vpu-vb2.h"
 
@@ -216,7 +215,6 @@ static void mali_vpu_session_fw_bin_ready(struct mali_vpu_fw_bin *vpu_fw_bin,
 					  bool same_thread)
 {
 	struct mali_vpu_session *sess = arg;
-	u32 ncores;
 	int ret;
 
 	if (!same_thread)
@@ -239,13 +237,17 @@ static void mali_vpu_session_fw_bin_ready(struct mali_vpu_fw_bin *vpu_fw_bin,
 	sess->fw_bin = vpu_fw_bin;
 
 	/*
-	 * Get total number of cores on VPU element.
-	 * This will be scheduler decision in subsequent patches.
+	 * Prepare the scheduler's saved session hardware context.
+	 * Scheduler assigns the session's core count.
 	 */
-	ncores = mali_vpu_read_reg(sess->vpu_dev->regs_base, MALI_VPU_REG_NCORES);
+	ret = mali_vpu_sched_session_prepare(&sess->sched_sess, sess);
+	if (ret) {
+		sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_UNINITIALIZED;
+		goto err_cache_put;
+	}
 
 	ret = mali_vpu_fw_construct(&sess->fw, sess->fw_bin, sess->vpu_dev->dev,
-				    &sess->mmu, ncores);
+				    &sess->mmu, sess->ncores);
 	if (ret) {
 		dev_err(sess->vpu_dev->dev,
 			"failed to initialise firmware: %d\n", ret);
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
index f0aa98005e92a..bf5923494773b 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
@@ -20,6 +20,7 @@
 struct v4l2_m2m_ctx;
 struct mali_vpu_fw_bin;
 struct mali_vpu_fw_event;
+struct mali_vpu_sched_session;
 
 /**
  * struct mali_vpu_port - format state of a src/dst queue in a session.
@@ -77,6 +78,8 @@ enum mali_vpu_session_fw_bin_state {
  * @fw_event: Firmware binary load event callback structure for this session.
  * @fw_bin_state: Session firmware binary status.
  * @fw_load_done: Completion used to synchronize teardown with an in-flight firmware load.
+ * @sched_sess: Scheduler state used to map this session to an LSID.
+ * @ncores: Number of cores assigned to this session by scheduler.
  */
 struct mali_vpu_session {
 	struct mali_vpu_dev		*vpu_dev;
@@ -100,6 +103,9 @@ struct mali_vpu_session {
 	struct mali_vpu_fw_event		*fw_event;
 	enum mali_vpu_session_fw_bin_state	fw_bin_state;
 	struct completion			fw_load_done;
+
+	struct mali_vpu_sched_session	sched_sess;
+	u32				ncores;
 };
 
 int mali_vpu_session_init(struct mali_vpu_session *sess);
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
index 0a7481d97c717..30ff5c25417e0 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
@@ -18,6 +18,7 @@
 
 #define MALI_VPU_HW_PID_V76 0x56627
 #define MALI_VPU_FW_VER_MAJOR_V76 1
+#define MALI_VPU_MAX_LSID_V76 4
 
 #define MALI_V76_MAX_FRAME_WIDTH 8192
 #define MALI_V76_MAX_FRAME_HEIGHT 8192
@@ -153,6 +154,7 @@ const struct mali_vpu_variant mali_vpu_v76_variant = {
 	.dma_mask = DMA_BIT_MASK(40),
 	.expected_hw_pid = MALI_VPU_HW_PID_V76,
 	.fw_ver_major = MALI_VPU_FW_VER_MAJOR_V76,
+	.max_lsid = MALI_VPU_MAX_LSID_V76,
 
 	.rst_names = mali_v76_rst_names,
 	.num_rsts = ARRAY_SIZE(mali_v76_rst_names),
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
index 3c37cd70bd81f..ac0bc3d899877 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
@@ -51,6 +51,7 @@ struct mali_vpu_control_caps {
  * @expected_hw_pid: Expected hardware product ID read from the version register.
  * @dma_mask: DMA addressing capability mask.
  * @fw_ver_major: Major firmware version compatible with this variant.
+ * @max_lsid: Maximum number of hardware LSID slots in a VPU element.
  * @fmt_caps: Format capability tables for encode/decode paths.
  * @frmsz_caps: Frame dimension limits and defaults.
  * @ctrl_caps:  Control capability tables for encode/decode paths.
@@ -61,6 +62,7 @@ struct mali_vpu_variant {
 	u32 expected_hw_pid;
 	u64 dma_mask;
 	u32 fw_ver_major;
+	u32 max_lsid;
 
 	struct mali_vpu_format_caps	fmt_caps;
 	struct mali_vpu_framesize_caps	frmsz_caps;
-- 
2.43.0

