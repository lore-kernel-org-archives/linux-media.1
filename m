Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102737;
	b=RPOvTFefNq3uhpruyxuUea4xIkO8JsqS0oknKEEVJehqhrWhfti2OF8sytacsYfJCy9o
	 N1ogUyECvG3GnOYINqclraghmQPGXfjJQdiCIyryepv6fdbtN7NOYhhjsq+VF/TBZcqdS
	 S1GHUBXzkPDO8t0jLegyaIeHE7QOpVJ9vjwTHXLjVOIK2tF+uQxZsy7oKZPcF9mD08wc0
	 kUjYBL0s9r23U5URZQO0GBfAV+LaRVU6dUKKV7iQcMxWeLZeNAttzAhjoG4k5Q4ikKRMG
	 WDEzLzjnPmUrXtuSzB81vgVyY1noAevtyUzX8LTM+ysCgGCEMYD0/g8bsKzcNyFya/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102737;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=boGz5ftOump72h417CUsNuyvCq9EYFAVaNCRWXtXZBk=;
	b=QouSNmkFTU6HbzpviNrYl0pQkYWAf9inZwqvrFdQzZMHCc0ULINOgZQaAD0yBzYKOpsu
	 8QI0vgFXB6PlCqVkf9qCBY8ZZVrRMpduhNvxvOC0fgHj9jeDHz/1btTZ3rUUeDaWAfE8P
	 wg9C/jrzdNmGiGziFt9oA4W0ZDXMgMQmn/5/5ysMx8vCySpGE6a9dbbYw9cAJ8V0Sw6MY
	 1GCSGDRVAE0oY3d/ghF+j5N7YHgG+3opvMCLWlEgk7U2LfTW4ii0vReepSevEplda7Ns1
	 zC89xuFyOT0gti93Kq4O+6Xfnmh+hiNIj9oV+u0bRUTWNQ40rxabRjmX4Qg6cPtfjXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DT4W5BI2;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D1F606B32F;
	Thu, 19 Nov 2026 15:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0D1F606B32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DT4W5BI2
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E44F1C25;
	Thu, 19 Nov 2026 07:38:53 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C93353F882;
	Thu, 19 Nov 2026 07:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102736; bh=Z5NDd/f3Zgq51XU0FuqXixGGqRjcdGrk8tmyOkIVsoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DT4W5BI2MX5Ip1Z9+fhVGQWEECiepW/IAeDKzfiC+Z7TrN5TzCU/IBxO7v2tz11mC
	 K4d14Y0Ag1Ja5wI/f1PneZt+8pmjICu2+OH4AKVQ5inSGGHJJqcq2Yd+08Yuh68cZe
	 ejLXruMtIHOQsvbS71cnSNW6oGCvOZnKbVQDgFu8=
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
Subject: [RFC PATCH 16/28] media: mali-vpu: add LSID hardware support
Date: Thu, 19 Nov 2026 15:37:46 +0000
Message-ID: <20261119153758.1426673-17-charvi.mehta@arm.com>
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

Add low-level support of managing the VPU local session IDs (LSIDs).
Define the per-LSID and job queue registers and provide helpers to map and
unmap sessions, manage the job queue, signal firmware, flush the session
MMU and terminate execution.

These operations provide hardware interface for the scheduler added
in a subsequent patch.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 drivers/media/platform/arm/mali-vpu/Makefile  |   3 +-
 .../platform/arm/mali-vpu/mali-vpu-lsid.c     | 271 ++++++++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-lsid.h     |  55 ++++
 .../arm/mali-vpu/mali-vpu-registers.h         |  44 ++-
 4 files changed, 370 insertions(+), 3 deletions(-)
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-lsid.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-lsid.h

diff --git a/drivers/media/platform/arm/mali-vpu/Makefile b/drivers/media/platform/arm/mali-vpu/Makefile
index 168b4bc43d54d..51d49d815f1fb 100644
--- a/drivers/media/platform/arm/mali-vpu/Makefile
+++ b/drivers/media/platform/arm/mali-vpu/Makefile
@@ -11,6 +11,7 @@ mali-vpu-objs := mali-vpu-probe.o \
 		mali-vpu-controls.o \
 		mali-vpu-mmu.o \
 		mali-vpu-firmware-cache.o \
-		mali-vpu-firmware.o
+		mali-vpu-firmware.o \
+		mali-vpu-lsid.o
 
 obj-$(CONFIG_VIDEO_MALI_VPU) += mali-vpu.o
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-lsid.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-lsid.c
new file mode 100644
index 0000000000000..42bf32b0937ff
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-lsid.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#include <linux/iopoll.h>
+
+#include "mali-vpu-device.h"
+#include "mali-vpu-lsid.h"
+#include "mali-vpu-registers.h"
+
+#define MALI_VPU_TERMINATE_READ_TIMEOUT_US  10000000
+#define MALI_VPU_TERMINATE_POLL_INTERVAL_US 10
+
+static u32 mali_vpu_lsid_reg(u32 lsid, u32 off)
+{
+	return MALI_VPU_LSID_BASE + (MALI_VPU_LSID_STRIDE * lsid) + off;
+}
+
+static u32 mali_vpu_read_lsid(void __iomem *regs_base, u32 lsid, u32 off)
+{
+	return mali_vpu_read_reg(regs_base, mali_vpu_lsid_reg(lsid, off));
+}
+
+static void mali_vpu_write_lsid(void __iomem *regs_base, u32 lsid, u32 off, u32 val)
+{
+	mali_vpu_write_reg(regs_base, mali_vpu_lsid_reg(lsid, off), val);
+}
+
+static bool mali_vpu_is_lsid_allocated(struct mali_vpu_lsid *lsid)
+{
+	u32 alloc = mali_vpu_read_lsid(lsid->vpu_dev->regs_base, lsid->id,
+				       MALI_VPU_REG_LSID_ALLOC);
+
+	return alloc != MALI_VPU_ALLOC_FREE;
+}
+
+static u32 mali_vpu_jobqueue_get_lsid(u32 jobqueue, u32 job)
+{
+	u32 shift = MALI_VPU_JOBQUEUE_JOB_STRIDE * job;
+	u32 lsid_mask = (1 << MALI_VPU_JOBQUEUE_LSID_BITS) - 1;
+
+	return (jobqueue >> shift) & lsid_mask;
+}
+
+static u32 mali_vpu_jobqueue_get_ncores_minus1(u32 jobqueue, u32 job)
+{
+	u32 shift = (MALI_VPU_JOBQUEUE_JOB_STRIDE * job) + MALI_VPU_JOBQUEUE_LSID_BITS;
+	u32 ncores_mask = (1 << MALI_VPU_JOBQUEUE_NCORES_BITS) - 1;
+
+	return (jobqueue >> shift) & ncores_mask;
+}
+
+static u32 mali_vpu_jobqueue_set_job(u32 jobqueue, u32 job_id, u32 lsid,
+				     u32 ncores_minus1)
+{
+	u32 shift = MALI_VPU_JOBQUEUE_JOB_STRIDE * job_id;
+	u32 job_mask = ((1u << MALI_VPU_JOBQUEUE_JOB_STRIDE) - 1) << shift;
+	u32 job_val, lsid_mask, ncores_mask;
+
+	lsid_mask = ((1u << MALI_VPU_JOBQUEUE_LSID_BITS) - 1);
+	ncores_mask = ((1u << MALI_VPU_JOBQUEUE_NCORES_BITS) - 1);
+
+	job_val = lsid & lsid_mask;
+	job_val |= (ncores_minus1 & ncores_mask) << MALI_VPU_JOBQUEUE_LSID_BITS;
+
+	return (jobqueue & ~job_mask) | (job_val << shift);
+}
+
+int mali_vpu_lsid_terminate(struct mali_vpu_lsid *lsid)
+{
+	struct mali_vpu_dev *vpu_dev = lsid->vpu_dev;
+	u32 val;
+
+	mali_vpu_write_lsid(vpu_dev->regs_base, lsid->id, MALI_VPU_REG_LSID_TERMINATE, 1);
+
+	return read_poll_timeout(mali_vpu_read_lsid, val, val == 0,
+				MALI_VPU_TERMINATE_POLL_INTERVAL_US,
+				MALI_VPU_TERMINATE_READ_TIMEOUT_US, false,
+				vpu_dev->regs_base, lsid->id,
+				MALI_VPU_REG_LSID_TERMINATE);
+}
+
+void mali_vpu_lsid_init(struct mali_vpu_lsid *lsid, struct mali_vpu_dev *dev, u32 id)
+{
+	lsid->vpu_dev = dev;
+	lsid->id = id;
+}
+
+int mali_vpu_lsid_map(struct mali_vpu_lsid *lsid, struct mali_vpu_lsid_pcb *pcb)
+{
+	struct mali_vpu_dev *vpu_dev = lsid->vpu_dev;
+	u32 alloc;
+	int ret;
+
+	/* Check that the LSID is not already allocated. */
+	if (mali_vpu_is_lsid_allocated(lsid)) {
+		dev_err(vpu_dev->dev,
+			"failed to map session to LSID. LSID already allocated. lsid=%u\n",
+			lsid->id);
+		return -EBUSY;
+	}
+
+	/* Allocate LSID. */
+	alloc = pcb->nprot == 0 ? MALI_VPU_ALLOC_PROTECTED : MALI_VPU_ALLOC_NON_PROTECTED;
+	mali_vpu_write_lsid(vpu_dev->regs_base, lsid->id, MALI_VPU_REG_LSID_ALLOC, alloc);
+
+	if (mali_vpu_read_lsid(vpu_dev->regs_base, lsid->id,
+			       MALI_VPU_REG_LSID_NPROT) != pcb->nprot) {
+		dev_err(vpu_dev->dev,
+			"unexpected protection state for LSID %u\n", lsid->id);
+		mali_vpu_write_lsid(vpu_dev->regs_base, lsid->id,
+				    MALI_VPU_REG_LSID_ALLOC, MALI_VPU_ALLOC_FREE);
+		return -EIO;
+	}
+
+	/* Ensure that the cores have stopped executing any session previously mapped. */
+	ret = mali_vpu_lsid_terminate(lsid);
+	if (ret) {
+		dev_err(vpu_dev->dev, "failed to terminate LSID %u: %d\n",
+			lsid->id, ret);
+		/*
+		 * The caller must reset the VPU on termination timeout. The
+		 * LSID cannot safely be marked free while hardware activity
+		 * is uncertain.
+		 */
+		return ret;
+	}
+
+	/* Configure number of cores to use and which cores to disable. */
+	mali_vpu_write_lsid(vpu_dev->regs_base, lsid->id, MALI_VPU_REG_LSID_CTRL, pcb->ctrl);
+
+	/* Configure MMU L0 entry and flush MMU tables. */
+	mali_vpu_write_lsid(vpu_dev->regs_base, lsid->id, MALI_VPU_REG_LSID_MMU_CTRL,
+			    pcb->mmu_ctrl);
+	mali_vpu_write_lsid(vpu_dev->regs_base, lsid->id, MALI_VPU_REG_LSID_FLUSH_ALL, 0);
+
+	mali_vpu_write_lsid(vpu_dev->regs_base, lsid->id, MALI_VPU_REG_LSID_BUSATTR_0, 0x0);
+	mali_vpu_write_lsid(vpu_dev->regs_base, lsid->id, MALI_VPU_REG_LSID_BUSATTR_1, 0x0);
+	mali_vpu_write_lsid(vpu_dev->regs_base, lsid->id, MALI_VPU_REG_LSID_BUSATTR_2, 0x33);
+	mali_vpu_write_lsid(vpu_dev->regs_base, lsid->id, MALI_VPU_REG_LSID_BUSATTR_3, 0x33);
+
+	/* Restore interrupt registers. */
+	mali_vpu_write_lsid(vpu_dev->regs_base, lsid->id, MALI_VPU_REG_LSID_IRQVE, 0);
+	mali_vpu_write_lsid(vpu_dev->regs_base, lsid->id, MALI_VPU_REG_LSID_IRQHOST, pcb->irqhost);
+
+	/*
+	 * Order the configuration writes before enabling scheduling.
+	 */
+	wmb();
+
+	/* Enable LSID for scheduling. */
+	mali_vpu_write_lsid(vpu_dev->regs_base, lsid->id, MALI_VPU_REG_LSID_SCHED, 1);
+
+	return 0;
+}
+
+/*
+ * An LSID must not be unmapped if it is present in the job queue or core LSID.
+ * It is the responsibility of the scheduler to guarantee that the LSID is idle
+ * before it is unmapped.
+ */
+void mali_vpu_lsid_unmap(struct mali_vpu_lsid *lsid, struct mali_vpu_lsid_pcb *pcb)
+{
+	struct mali_vpu_dev *vpu_dev = lsid->vpu_dev;
+
+	if (!mali_vpu_is_lsid_allocated(lsid)) {
+		dev_dbg(vpu_dev->dev, "no session mapped to LSID %u\n", lsid->id);
+		return;
+	}
+
+	/* Prevent the LSID from being scheduled. */
+	mali_vpu_write_lsid(vpu_dev->regs_base, lsid->id, MALI_VPU_REG_LSID_SCHED, 0);
+
+	/* Store registers in process control block. */
+	pcb->ctrl = mali_vpu_read_lsid(vpu_dev->regs_base, lsid->id,
+				       MALI_VPU_REG_LSID_CTRL);
+	pcb->mmu_ctrl = mali_vpu_read_lsid(vpu_dev->regs_base, lsid->id,
+					   MALI_VPU_REG_LSID_MMU_CTRL);
+	pcb->irqhost = mali_vpu_read_lsid(vpu_dev->regs_base, lsid->id,
+					  MALI_VPU_REG_LSID_IRQHOST);
+	pcb->nprot = mali_vpu_read_lsid(vpu_dev->regs_base, lsid->id,
+					MALI_VPU_REG_LSID_NPROT);
+
+	/* Deallocate LSID. */
+	mali_vpu_write_lsid(vpu_dev->regs_base, lsid->id, MALI_VPU_REG_LSID_ALLOC,
+			    MALI_VPU_ALLOC_FREE);
+}
+
+int mali_vpu_lsid_jobqueue_add(struct mali_vpu_lsid *lsid, u32 ncores)
+{
+	struct mali_vpu_dev *vpu_dev = lsid->vpu_dev;
+	u32 jobqueue;
+	int job, ret = -EAGAIN;
+
+	if (!ncores || ncores > BIT(MALI_VPU_JOBQUEUE_NCORES_BITS))
+		return -EINVAL;
+
+	/* Stop the hardware scheduler while updating the jobqueue. */
+	mali_vpu_write_reg(vpu_dev->regs_base, MALI_VPU_REG_ENABLE, 0);
+
+	jobqueue = mali_vpu_read_reg(vpu_dev->regs_base, MALI_VPU_REG_JOBQUEUE);
+
+	/* Search if the LSID is already in the job queue. */
+	for (job = 0; job < MALI_VPU_JOBQUEUE_NJOBS; job++)
+		if (mali_vpu_jobqueue_get_lsid(jobqueue, job) == lsid->id) {
+			ret = 0;
+			goto enable_hw_scheduler;
+		}
+
+	/* Search for a free slot in the job queue. */
+	for (job = 0; job < MALI_VPU_JOBQUEUE_NJOBS; job++) {
+		if (mali_vpu_jobqueue_get_lsid(jobqueue, job) != MALI_VPU_JOBQUEUE_JOB_INVALID)
+			continue;
+
+		jobqueue = mali_vpu_jobqueue_set_job(jobqueue, job, lsid->id, ncores - 1);
+		mali_vpu_write_reg(vpu_dev->regs_base, MALI_VPU_REG_JOBQUEUE, jobqueue);
+		ret = 0;
+		break;
+	}
+
+enable_hw_scheduler:
+	mali_vpu_write_reg(vpu_dev->regs_base, MALI_VPU_REG_ENABLE, 1);
+	return ret;
+}
+
+void mali_vpu_lsid_jobqueue_remove(struct mali_vpu_lsid *lsid)
+{
+	struct mali_vpu_dev *vpu_dev = lsid->vpu_dev;
+	u32 old_jobqueue, new_jobqueue = 0;
+	u32 old_job_id, new_job_id, old_lsid, old_ncores_minus1;
+
+	/* Disable scheduling. */
+	mali_vpu_write_reg(vpu_dev->regs_base, MALI_VPU_REG_ENABLE, 0);
+
+	old_jobqueue = mali_vpu_read_reg(vpu_dev->regs_base, MALI_VPU_REG_JOBQUEUE);
+
+	/* Copy job entries that do not match the LSID to be removed. */
+	for (old_job_id = 0, new_job_id = 0; old_job_id < MALI_VPU_JOBQUEUE_NJOBS; old_job_id++) {
+		old_lsid          = mali_vpu_jobqueue_get_lsid(old_jobqueue, old_job_id);
+		old_ncores_minus1 = mali_vpu_jobqueue_get_ncores_minus1(old_jobqueue, old_job_id);
+
+		if (old_lsid == MALI_VPU_JOBQUEUE_JOB_INVALID ||
+		    old_lsid == lsid->id)
+			continue;
+
+		new_jobqueue = mali_vpu_jobqueue_set_job(new_jobqueue, new_job_id,
+							 old_lsid,
+							 old_ncores_minus1);
+		new_job_id++;
+	}
+
+	while (new_job_id < MALI_VPU_JOBQUEUE_NJOBS) {
+		new_jobqueue = mali_vpu_jobqueue_set_job(new_jobqueue, new_job_id,
+							 MALI_VPU_JOBQUEUE_JOB_INVALID, 0);
+		new_job_id++;
+	}
+
+	mali_vpu_write_reg(vpu_dev->regs_base, MALI_VPU_REG_JOBQUEUE, new_jobqueue);
+	mali_vpu_write_reg(vpu_dev->regs_base, MALI_VPU_REG_ENABLE, 1);
+}
+
+void mali_vpu_lsid_send_irq(struct mali_vpu_lsid *lsid)
+{
+	mali_vpu_write_lsid(lsid->vpu_dev->regs_base, lsid->id, MALI_VPU_REG_LSID_IRQHOST, 1);
+}
+
+void mali_vpu_lsid_flush_mmu(struct mali_vpu_lsid *lsid)
+{
+	mali_vpu_write_lsid(lsid->vpu_dev->regs_base, lsid->id, MALI_VPU_REG_LSID_FLUSH_ALL, 0);
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-lsid.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-lsid.h
new file mode 100644
index 0000000000000..97c32f9ac9aa0
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-lsid.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#ifndef __MALI_VPU_LSID_H__
+#define __MALI_VPU_LSID_H__
+
+#include <linux/types.h>
+
+struct mali_vpu_dev;
+
+/*
+ * A local session identifier (LSID) represents a hardware execution
+ * context. A firmware session must be mapped to an LSID before it can be
+ * scheduled on the VPU cores.
+ */
+
+/**
+ * struct mali_vpu_lsid_pcb - LSID process control block.
+ * @ctrl: Saved LSID control register value.
+ * @mmu_ctrl: Saved LSID MMU control register value.
+ * @irqhost: Saved pending host IRQ state.
+ * @nprot: Saved non-protected/protected allocation state.
+ *
+ * This structure is used to store the register map when a session is unmapped
+ * from a LSID, so it can be restored again when the session is remapped.
+ */
+struct mali_vpu_lsid_pcb {
+	u32 ctrl;
+	u32 mmu_ctrl;
+	u32 irqhost;
+	u32 nprot;
+};
+
+/**
+ * struct mali_vpu_lsid - Hardware LSID instance.
+ * @vpu_dev: Back pointer to parent Mali VPU device.
+ * @id: Hardware LSID instance.
+ */
+struct mali_vpu_lsid {
+	struct mali_vpu_dev *vpu_dev;
+	u32 id;
+};
+
+void mali_vpu_lsid_init(struct mali_vpu_lsid *lsid, struct mali_vpu_dev *vpu_dev, u32 id);
+int mali_vpu_lsid_map(struct mali_vpu_lsid *lsid, struct mali_vpu_lsid_pcb *pcb);
+void mali_vpu_lsid_unmap(struct mali_vpu_lsid *lsid, struct mali_vpu_lsid_pcb *pcb);
+int mali_vpu_lsid_jobqueue_add(struct mali_vpu_lsid *lsid, u32 ncores);
+void mali_vpu_lsid_jobqueue_remove(struct mali_vpu_lsid *lsid);
+void mali_vpu_lsid_send_irq(struct mali_vpu_lsid *lsid);
+void mali_vpu_lsid_flush_mmu(struct mali_vpu_lsid *lsid);
+int mali_vpu_lsid_terminate(struct mali_vpu_lsid *lsid);
+
+#endif /* __MALI_VPU_LSID_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h
index b7883b1ea47f3..f2386bdc4943a 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h
@@ -14,8 +14,32 @@
  *
  * Offsets are relative to the VPU MMIO base.
  */
-#define MALI_VPU_REG_VERSION 0x00000
-#define MALI_VPU_REG_NCORES  0x00008
+#define MALI_VPU_REG_VERSION  0x00000
+#define MALI_VPU_REG_ENABLE   0x00004
+#define MALI_VPU_REG_NCORES   0x00008
+#define MALI_VPU_REG_JOBQUEUE 0x00014
+
+#define MALI_VPU_LSID_BASE    0x00200
+#define MALI_VPU_LSID_STRIDE  0x40
+
+/*
+ * Per-LSID registers.
+ * Address = MALI_VPU_LSID_BASE + (MALI_VPU_LSID_STRIDE * lsid) + per-LSID offset
+ * Each LSID has its own set of these registers, which are identical in layout.
+ */
+#define MALI_VPU_REG_LSID_CTRL      0x00
+#define MALI_VPU_REG_LSID_MMU_CTRL  0x04
+#define MALI_VPU_REG_LSID_NPROT     0x08
+#define MALI_VPU_REG_LSID_ALLOC     0x0C
+#define MALI_VPU_REG_LSID_FLUSH_ALL 0x10
+#define MALI_VPU_REG_LSID_SCHED     0x14
+#define MALI_VPU_REG_LSID_TERMINATE 0x18
+#define MALI_VPU_REG_LSID_IRQVE     0x1C
+#define MALI_VPU_REG_LSID_IRQHOST   0x20
+#define MALI_VPU_REG_LSID_BUSATTR_0 0x30
+#define MALI_VPU_REG_LSID_BUSATTR_1 0x34
+#define MALI_VPU_REG_LSID_BUSATTR_2 0x38
+#define MALI_VPU_REG_LSID_BUSATTR_3 0x3C
 
 /* Version register fields */
 #define MALI_VPU_VERSION_PRODUCT_ID_MASK GENMASK(31, 16)
@@ -23,9 +47,25 @@
 #define MALI_VPU_VERSION_PATCH_MASK      GENMASK(7, 0)
 #define MALI_VPU_PID_SUFFIX_MASK         GENMASK(15, 12)
 
+/* JOBQUEUE register: 4 entries x 8 bits (LSID[3:0], NCORES-1[7:4]) */
+#define MALI_VPU_JOBQUEUE_LSID_BITS   4
+#define MALI_VPU_JOBQUEUE_NCORES_BITS 4
+#define MALI_VPU_JOBQUEUE_JOB_STRIDE  8
+#define MALI_VPU_JOBQUEUE_JOB_INVALID 0xf
+#define MALI_VPU_JOBQUEUE_NJOBS       4
+
+#define MALI_VPU_ALLOC_FREE          0
+#define MALI_VPU_ALLOC_NON_PROTECTED 1
+#define MALI_VPU_ALLOC_PROTECTED     2
+
 static inline u32 mali_vpu_read_reg(void __iomem *regs_base, u32 off)
 {
 	return readl(regs_base + off);
 }
 
+static inline void mali_vpu_write_reg(void __iomem *regs_base, u32 off, u32 val)
+{
+	writel(val, regs_base + off);
+}
+
 #endif /* __MALI_VPU_REGISTERS_H__ */
-- 
2.43.0

