Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102742;
	b=aZtYNzdnDGnRTlOoAN0cqohgpVNP0twy06Bli+KUgIg8L7wU5JfXhT1DEBTG7LnvoJyt
	 2D2t40DTw1CbOH7iaDwPlwGC/T2N+ymNmw7fQBy150fOxCRTL8JYUorKyJKVoBnniRQty
	 30RlKwsQg+UtUXIiBuaQo9CoApau8Hnu6WvTcN6PLAyyHTwrPWI8dJRPvn2N5kkfKwycs
	 CFb5xewWunvaQdJtoaUh2/Z6kIRLqBo3Naipp3TYg86lo2L5RW7CxKw2AWC3AjmvprFPT
	 Z5Y0p+cJ/5pqy0OtujSF7g+RnuJmOGAYJ9RG86szYe0A9O+bhGFVAPyIvtJqLRxeXWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102742;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lmhoFq5ko5bYbFoMKzzQLW/SC0gXe2MQg/kPpp1px68=;
	b=W8bALnTm1DVdNxGKmTyTBCUH43mNfVV/FEM80BaqPhd2z9fHV/+nvDRG6vA5+h5decr6
	 rMieS5uecjHES8vwWEUwtOeW/5ZmV4hW6rKnvJoEUbsETg2Fcy7/0GjKrZ1PCmrBYHxNL
	 uAEYkxl5nhE61UDo7C2GqB/+VJYOUkWdQjQc0LmIlxeP4GQr1mTxINuwfWNvAkdT1vAWS
	 dyCL72JA/rrYF9Nmv07+OegwEWwTH/EEqx811vZnNvL8kjtfISnfny8WgOehY/1ri5d2Z
	 D0u8oysnckFg1DlqeSYKE6Pn1s6bk4w3TJ7sukj+onP2O5U5VD8iHRghNhQIoZup0Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=V5lBCwQp;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576FB606C4B7;
	Thu, 19 Nov 2026 15:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 576FB606C4B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=V5lBCwQp
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEA2A1C01;
	Thu, 19 Nov 2026 07:38:56 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 638613F882;
	Thu, 19 Nov 2026 07:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102739; bh=+Q4GEARj/cJmJ5uBbWgqwMNG3ZlZ5LD+Ws41vdqeF0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V5lBCwQpHVqCXnIzy6AWWx+g8hoQhfFH3W0jj0wYSnaR8/0oJnvf6oJCgng3KcFoj
	 Xw/n4AV010Ha45U/7HxcxOcPD1+GQszPT7YRsNFTabi35d3YIdEbb36CVwlnjKopN/
	 /zWA3UVsPpC00U26iSGfK7GCWXb2CBHYdz6jYYLI=
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
Subject: [RFC PATCH 18/28] media: mali-vpu: handle firmware interrupts
Date: Thu, 19 Nov 2026 15:37:48 +0000
Message-ID: <20261119153758.1426673-19-charvi.mehta@arm.com>
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

Firmware responses and service requests are delivered through per-LSID
interrupts. Route these interrupts to the session currently assigned
to the LSID and process them outside hard IRQ context.

This allows the driver to service firmware RPC requests and consume
responses needed to complete asynchronous firmware commands.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 .../platform/arm/mali-vpu/mali-vpu-device.h   |  7 ++
 .../platform/arm/mali-vpu/mali-vpu-probe.c    | 84 +++++++++++++++++-
 .../arm/mali-vpu/mali-vpu-registers.h         |  1 +
 .../arm/mali-vpu/mali-vpu-scheduler.c         | 24 ++++++
 .../arm/mali-vpu/mali-vpu-scheduler.h         |  1 +
 .../platform/arm/mali-vpu/mali-vpu-session.c  | 86 +++++++++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-session.h  |  3 +
 7 files changed, 205 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
index 9be36e47d0879..cacdd86fe517e 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
@@ -7,6 +7,7 @@
 #define __MALI_VPU_DEVICE_H__
 
 #include <linux/device.h>
+#include <linux/workqueue.h>
 #include <media/v4l2-device.h>
 
 #include "mali-vpu-scheduler.h"
@@ -37,6 +38,9 @@ enum mali_vpu_session_role {
  * @rst_count: Number of reset controls in @rst_list.
  * @dma_mask: DMA mask for the device, indicating supported address width.
  * @irq: IRQ number for VPU.
+ * @irqve_mask: Bitmap of pending LSID IRQs.
+ * @irq_wq: Workqueue used to process LSID IRQs outside hard IRQ context.
+ * @irq_work: Work item for deferred LSID IRQ handling.
  * @variant: Structure describing variant-specific features and capabilities.
  * @v4l2_dev: V4L2 device structure for mali vpu.
  * @vdev_dec: Video device structure for decoder.
@@ -53,6 +57,9 @@ struct mali_vpu_dev {
 	unsigned int			rst_count;
 	u64				dma_mask;
 	int				irq;
+	unsigned long			irqve_mask;
+	struct workqueue_struct		*irq_wq;
+	struct work_struct		irq_work;
 
 	const struct mali_vpu_variant	*variant;
 	struct v4l2_device		v4l2_dev;
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
index 0c7ea9035fb50..b9f9558e76701 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
@@ -9,6 +9,7 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/io.h>
+#include <linux/interrupt.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -119,6 +120,70 @@ static int mali_vpu_get_resources(struct mali_vpu_dev *vpu_dev)
 	return mali_vpu_get_resets(vpu_dev);
 }
 
+static irqreturn_t mali_vpu_isr_top(int irq, void *data)
+{
+	struct mali_vpu_dev *vpu_dev = data;
+	u32 nlsid, irqve, nlsid_bound;
+	int ret = IRQ_NONE;
+
+	/*
+	 * IRQVE contains one interrupt bit per LSID. Acknowledge each asserted
+	 * source in hard IRQ context and record it for deferred firmware response
+	 * and RPC handling, which may sleep.
+	 */
+	nlsid = mali_vpu_read_reg(vpu_dev->regs_base, MALI_VPU_REG_NLSID);
+	irqve = mali_vpu_read_reg(vpu_dev->regs_base, MALI_VPU_REG_IRQVE);
+	nlsid_bound = min_t(u32, nlsid, vpu_dev->variant->max_lsid);
+
+	while (nlsid_bound-- > 0)
+		if ((irqve >> nlsid_bound) & 0x1) {
+			u32 reg_off = MALI_VPU_LSID_BASE +
+					(MALI_VPU_LSID_STRIDE * nlsid_bound) +
+					MALI_VPU_REG_LSID_IRQVE;
+			mali_vpu_write_reg(vpu_dev->regs_base, reg_off, 0);
+			set_bit(nlsid_bound, &vpu_dev->irqve_mask);
+			ret = IRQ_HANDLED;
+		}
+
+	if (ret == IRQ_HANDLED)
+		queue_work(vpu_dev->irq_wq, &vpu_dev->irq_work);
+
+	return ret;
+}
+
+static void mali_vpu_irq_bottom(struct work_struct *work)
+{
+	struct mali_vpu_dev *vpu_dev = container_of(work, struct mali_vpu_dev, irq_work);
+	u32 i;
+
+	for (i = 0; i < vpu_dev->sched.nlsid; i++) {
+		if (test_and_clear_bit(i, &vpu_dev->irqve_mask))
+			mali_vpu_sched_handle_lsid_irq(&vpu_dev->sched, i);
+	}
+}
+
+static int mali_vpu_irq_work_init(struct mali_vpu_dev *vpu_dev)
+{
+	vpu_dev->irqve_mask = 0;
+
+	vpu_dev->irq_wq = alloc_workqueue("%s-irq", WQ_UNBOUND, 1, dev_name(vpu_dev->dev));
+	if (!vpu_dev->irq_wq)
+		return -ENOMEM;
+
+	INIT_WORK(&vpu_dev->irq_work, mali_vpu_irq_bottom);
+	return 0;
+}
+
+static void mali_vpu_irq_work_cleanup(struct mali_vpu_dev *vpu_dev)
+{
+	if (!vpu_dev->irq_wq)
+		return;
+
+	cancel_work_sync(&vpu_dev->irq_work);
+	destroy_workqueue(vpu_dev->irq_wq);
+	vpu_dev->irq_wq = NULL;
+}
+
 static int mali_vpu_register_video_device(struct mali_vpu_dev *vpu_dev,
 					  enum mali_vpu_session_role role)
 {
@@ -219,10 +284,19 @@ static int mali_vpu_probe(struct platform_device *pdev)
 
 	dma_set_max_seg_size(vpu_dev->dev, SZ_2G);
 
+	ret = mali_vpu_irq_work_init(vpu_dev);
+	if (ret)
+		goto err_cleanup_sched;
+
+	ret = devm_request_irq(&pdev->dev, vpu_dev->irq, mali_vpu_isr_top, 0, pdev->name,
+			       vpu_dev);
+	if (ret)
+		goto err_cleanup_irq_work;
+
 	ret = v4l2_device_register(&pdev->dev, &vpu_dev->v4l2_dev);
 	if (ret) {
 		dev_err(vpu_dev->dev, "failed to register V4L2 device\n");
-		goto err_cleanup_sched;
+		goto err_free_irq;
 	}
 
 	vpu_dev->m2m_dev = v4l2_m2m_init(&mali_vpu_m2m_ops);
@@ -255,6 +329,10 @@ static int mali_vpu_probe(struct platform_device *pdev)
 	v4l2_m2m_release(vpu_dev->m2m_dev);
 err_unreg_v4l2:
 	v4l2_device_unregister(&vpu_dev->v4l2_dev);
+err_free_irq:
+	devm_free_irq(vpu_dev->dev, vpu_dev->irq, vpu_dev);
+err_cleanup_irq_work:
+	mali_vpu_irq_work_cleanup(vpu_dev);
 err_cleanup_sched:
 	mali_vpu_sched_cleanup(&vpu_dev->sched);
 err_rst_clk:
@@ -270,6 +348,10 @@ static void mali_vpu_remove(struct platform_device *pdev)
 	struct mali_vpu_dev *vpu_dev = platform_get_drvdata(pdev);
 
 	video_unregister_device(vpu_dev->vdev_dec);
+
+	devm_free_irq(vpu_dev->dev, vpu_dev->irq, vpu_dev);
+	mali_vpu_irq_work_cleanup(vpu_dev);
+
 	mali_vpu_fw_cache_cleanup(vpu_dev->fw_cache);
 	v4l2_m2m_release(vpu_dev->m2m_dev);
 	v4l2_device_unregister(&vpu_dev->v4l2_dev);
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h
index 1a3e0fcdba4c6..467f2cdb4c278 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h
@@ -19,6 +19,7 @@
 #define MALI_VPU_REG_NCORES   0x00008
 #define MALI_VPU_REG_NLSID    0x0000C
 #define MALI_VPU_REG_JOBQUEUE 0x00014
+#define MALI_VPU_REG_IRQVE    0x00018
 #define MALI_VPU_REG_CLKFORCE 0x00024
 #define MALI_VPU_REG_RESET    0x00050
 
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-scheduler.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-scheduler.c
index cae9ac0093be9..77503f20e4b29 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-scheduler.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-scheduler.c
@@ -222,3 +222,27 @@ int mali_vpu_sched_session_terminate(struct mali_vpu_sched_session *sched_sess,
 
 	return ret;
 }
+
+void mali_vpu_sched_handle_lsid_irq(struct mali_vpu_sched *sched, u32 lsid)
+{
+	struct mali_vpu_session *sess = NULL;
+	struct mali_vpu_sched_session *sched_sess;
+
+	/* Only single active session policy - always mapped to lsid 0 */
+	if (lsid != 0) {
+		dev_warn(sched->vpu_dev->dev,
+			 "unexpected interrupt from LSID %u\n", lsid);
+		return;
+	}
+
+	mutex_lock(&sched->lock);
+	if (sched->nlsid) {
+		sched_sess = sched->lsid_list[lsid].sched_sess;
+		if (sched_sess)
+			sess = container_of(sched_sess, struct mali_vpu_session, sched_sess);
+	}
+	mutex_unlock(&sched->lock);
+
+	if (sess)
+		mali_vpu_session_irq(sess);
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-scheduler.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-scheduler.h
index 23167aef6ff62..ffa93495e8b47 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-scheduler.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-scheduler.h
@@ -53,5 +53,6 @@ void mali_vpu_sched_flush_mmu(struct mali_vpu_sched_session *sched_sess,
 			      struct mali_vpu_sched *sched);
 int mali_vpu_sched_session_terminate(struct mali_vpu_sched_session *sched_sess,
 				     struct mali_vpu_sched *sched);
+void mali_vpu_sched_handle_lsid_irq(struct mali_vpu_sched *sched, u32 lsid);
 
 #endif /* __MALI_VPU_SCHEDULER_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
index c5579edfe627f..09ec6d14f4ad0 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -73,6 +73,56 @@ int mali_vpu_session_fw_send_set_option(struct mali_vpu_session *sess,
 	return mali_vpu_fw_send_set_option(&sess->fw, opt);
 }
 
+static int mali_vpu_session_handle_fw_msg(struct mali_vpu_session *sess,
+					  const struct mali_vpu_fw_msg *fw_msg)
+{
+	switch (fw_msg->code) {
+	case MALI_VPU_FW_CODE_ERROR:
+		dev_warn(sess->vpu_dev->dev, "firmware rsp: Error. code=%u, message=%s\n",
+			 fw_msg->data.error.error_code, fw_msg->data.error.message);
+		return -EIO;
+	case MALI_VPU_FW_CODE_JOB:
+		/*
+		 * The session uses an infinite job and does not implement
+		 * switch-out scheduling.
+		 */
+		return 0;
+	case MALI_VPU_FW_CODE_PONG:
+		/* Receiving the responses completes the diagnostic ping. */
+		return 0;
+	case MALI_VPU_FW_CODE_STATE_CHANGE:
+		sess->fw_state = fw_msg->data.state;
+		return 0;
+	case MALI_VPU_FW_CODE_SWITCH_IN:
+		/* Single session policy: the scheduler already tracks the active LSID mapping. */
+		return 0;
+	case MALI_VPU_FW_CODE_SWITCH_OUT:
+		dev_warn(sess->vpu_dev->dev,
+			 "Unexpected fw switch-out response for a single session policy.\n");
+		return 0;
+	case MALI_VPU_FW_CODE_SET_OPTION:
+		/*
+		 * The parser validated the confirmation and decremented the
+		 * pending_response_count.
+		 */
+		return 0;
+	case MALI_VPU_FW_CODE_SET_OPTION_FAIL:
+		/*
+		 * The parser printed the error and decremented the
+		 * pending_response_count.
+		 */
+		return -EINVAL;
+	case MALI_VPU_FW_CODE_IDLE:
+		dev_dbg(sess->vpu_dev->dev, "fw entered Idle/sleeping state.\n");
+		return 0;
+	case MALI_VPU_FW_CODE_UNKNOWN:
+	case MALI_VPU_FW_CODE_MAX:
+	default:
+		dev_warn(sess->vpu_dev->dev, "unknown fw msg code=%u\n", fw_msg->code);
+		return -EPROTO;
+	}
+}
+
 int mali_vpu_session_init(struct mali_vpu_session *sess)
 {
 	int ret;
@@ -120,6 +170,7 @@ int mali_vpu_session_init(struct mali_vpu_session *sess)
 	sess->port_src.stream_requested = false;
 	sess->port_dst.stream_requested = false;
 	init_completion(&sess->fw_load_done);
+	sess->fw_state = MALI_VPU_FW_STATE_STOPPED;
 
 	return 0;
 
@@ -321,3 +372,38 @@ int mali_vpu_session_request_fw_load(struct mali_vpu_session *sess)
 
 	return 0;
 }
+
+void mali_vpu_session_irq(struct mali_vpu_session *sess)
+{
+	struct mali_vpu_fw_msg msg;
+	bool flush_mmu = false;
+	int ret;
+
+	mutex_lock(&sess->vq_lock);
+
+	ret = mali_vpu_fw_handle_rpc(&sess->fw, &flush_mmu);
+	if (ret) {
+		if (flush_mmu)
+			mali_vpu_sched_flush_mmu(&sess->sched_sess, &sess->vpu_dev->sched);
+		mali_vpu_sched_send_irq(&sess->sched_sess, &sess->vpu_dev->sched);
+
+		if (ret < 0)
+			goto unlock_mutex;
+	}
+
+	do {
+		ret = mali_vpu_fw_parse_msg(&sess->fw, &msg);
+		if (ret < 0)
+			goto unlock_mutex;
+
+		if (!ret)
+			break;
+
+		ret = mali_vpu_session_handle_fw_msg(sess, &msg);
+		if (ret)
+			goto unlock_mutex;
+	} while (ret >= 0);
+
+unlock_mutex:
+	mutex_unlock(&sess->vq_lock);
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
index bf5923494773b..e6b9de3b272cf 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
@@ -78,6 +78,7 @@ enum mali_vpu_session_fw_bin_state {
  * @fw_event: Firmware binary load event callback structure for this session.
  * @fw_bin_state: Session firmware binary status.
  * @fw_load_done: Completion used to synchronize teardown with an in-flight firmware load.
+ * @fw_state: Last state confirmed by the firmware.
  * @sched_sess: Scheduler state used to map this session to an LSID.
  * @ncores: Number of cores assigned to this session by scheduler.
  */
@@ -103,6 +104,7 @@ struct mali_vpu_session {
 	struct mali_vpu_fw_event		*fw_event;
 	enum mali_vpu_session_fw_bin_state	fw_bin_state;
 	struct completion			fw_load_done;
+	enum mali_vpu_fw_state			fw_state;
 
 	struct mali_vpu_sched_session	sched_sess;
 	u32				ncores;
@@ -113,6 +115,7 @@ int mali_vpu_session_cleanup(struct mali_vpu_session *sess);
 int mali_vpu_session_request_fw_load(struct mali_vpu_session *sess);
 int mali_vpu_session_fw_send_set_option(struct mali_vpu_session *sess,
 					struct mali_vpu_fw_set_option *opt);
+void mali_vpu_session_irq(struct mali_vpu_session *sess);
 
 static inline struct mali_vpu_session *mali_vpu_get_session(struct file *filp)
 {
-- 
2.43.0

