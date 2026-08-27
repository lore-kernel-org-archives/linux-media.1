Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C392D662F
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834075; cv=none; b=ChpxGArvtGu2o4JLh6GxAsAVn6yeKru+x8bzrqmVwNlNqx/c8buw6QQ6cG1/HSVvgIIp7vNNavsOWay8+UTv/9gICYLDealW4DcRE/cikMOmH/QC8s1h/2ieDWbSBzi2TXJQ/WDH9ezkU/DqLKP/9mj/C6jcnYnkknKYIju7kJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834075; c=relaxed/simple;
	bh=mmeBXRdksfkpc0HArP/665UOE60jCqeT4ygc5ixWEto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBxPcZwaF690xJ8qgrVOYKV6Z+K51VsZAy44wtKzlFHbUclvUX7FwrH41wmSwdijHRXuZEQ7U5OPuqOpGrETXULRWjwiYPxhdehRSp0DQELQ/mGgT55SaxrZ1kX/kBut26GpzKMHW99BK7eZDITM7XL2A0/y4uu9KQw8Ev3PHTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DboB4Ndz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DboB4Ndz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834074; x=1819370074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mmeBXRdksfkpc0HArP/665UOE60jCqeT4ygc5ixWEto=;
  b=DboB4NdzRjfvV9ePrnkQ/DOP9Yg7J03hJU/p4eJF/ld6WqCcgf8tjG2V
   zwNiw3DBckrSukvxFWXPrJlojZc4qx0IxJzE4qQ0mawfL7QDajYWZa1QB
   ZW4mpF2VcN0rYWTWQUewk0YKsyY1a8j8z7nsEnS7oGpk2bvnYfvZYpxI3
   2VrKMiKgZDsT1UFVPVSzU+WQ5s82jGgyCjJr4+h+sxLc7IFT66cqf/QnE
   z49Z4sKQ94PCBnxDEXVpIdXoEIXfg5lvaqnJexANet6ebtCxhnoP48eR7
   VaTcoLGaykdkyjf6JOKwawK3qn2dfFk2IzLpuV9m0XpPDLjd+8kXkTQ7t
   Q==;
X-CSE-ConnectionGUID: BLBPlLbVT7yq8FbpR4LxCA==
X-CSE-MsgGUID: tTxk4jdURRS/tuKVn+hiyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188629"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188629"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:34 -0700
X-CSE-ConnectionGUID: U9UNleWgR4KvHHx+IVe1mw==
X-CSE-MsgGUID: MXxwUC8MTHegpLB2JMgx2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384449"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:32 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 22/44] media: ipu6: Add ipu7 fw start/stop functionality
Date: Thu, 27 Aug 2026 15:33:14 +0300
Message-ID: <20260827123336.2219048-23-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
References: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ipu7 firmware start/stop sequence differs from ipu6. Add
ipu7-specific functions to handle this.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu7-boot.c      | 405 ++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu7-boot.h      |  46 ++
 .../media/pci/intel/ipu6/ipu7-platform-regs.h |  12 +
 3 files changed, 463 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-boot.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-boot.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-platform-regs.h

diff --git a/drivers/media/pci/intel/ipu6/ipu7-boot.c b/drivers/media/pci/intel/ipu6/ipu7-boot.c
new file mode 100644
index 000000000000..5bd5281ec107
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu7-boot.c
@@ -0,0 +1,405 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 - 2026 Intel Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/iopoll.h>
+#include <linux/types.h>
+
+#include "ipu6.h"
+#include "ipu6-bus.h"
+#include "ipu6-buttress.h"
+#include "ipu6-dma.h"
+#include "ipu6-isys.h"
+#include "ipu6-platform-buttress-regs.h"
+#include "ipu7-boot.h"
+#include "ipu7-platform-regs.h"
+
+#define IPU7_FW_START_STOP_TIMEOUT		2000
+#define IPU7_BOOT_CELL_RESET_TIMEOUT		(2 * USEC_PER_SEC)
+#define IPU7_BOOT_STATE_CRITICAL(s)		(((s) & 0xffff0000U) == 0xdead0000U)
+#define IPU7_BOOT_STATE_READY(s)		((s) == 0x57a7e100U)
+#define IPU7_BOOT_STATE_INACTIVE(s)		((s) == 0x57a7e300U)
+#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS0				0x4000
+#define IPU7_BUTTRESS_FW_BOOT_PARAMS_ENTRY(i) \
+	(IPU7_BUTTRESS_REG_FW_BOOT_PARAMS0 + ((i) * 4U))
+
+struct boot_regs {
+	u32 base;
+	u32 dmem_address;
+	u32 status_ctrl_reg;
+	u32 fw_start_address_reg;
+	u32 fw_code_base_reg;
+};
+
+enum ipu7_boot_reg_id {
+	IPU7_FW_BOOT_CONFIG_ID = 0,
+	IPU7_FW_BOOT_STATE_ID = 1,
+	IPU7_FW_BOOT_SYSCOM_QUEUE_INDICES_BASE_ID = 2,
+	IPU7_FW_BOOT_UNTRUSTED_ADDR_MIN_ID = 3,
+	IPU7_FW_BOOT_MESSAGING_VERSION_ID = 4,
+	IPU7_FW_BOOT_ID_MAX,
+};
+
+enum ipu7_boot_state {
+	IPU7_FW_BOOT_STATE_UNINIT = 0x57a7e000U,
+	IPU7_FW_BOOT_STATE_READY = 0x57a7e100U,
+	IPU7_FW_BOOT_STATE_SHUTDOWN_CMD = 0x57a7f001U,
+	IPU7_FW_BOOT_STATE_INACTIVE = 0x57a7e300U,
+};
+
+static const struct boot_regs boot_regs[IPU_SUBSYS_NUM] = {
+	[IPU_ISYS] = {
+		.dmem_address = IPU7_ISYS_DMEM_OFFSET,
+		.status_ctrl_reg = IPU7_BUTTRESS_REG_ISYS_UCX_CTRL_STATUS,
+		.fw_start_address_reg = IPU7_BUTTRESS_REG_ISYS_UCX_START_ADDR,
+		.fw_code_base_reg = IPU7_IS_UC_CTRL_BASE
+	},
+	[IPU_PSYS] = {
+		.dmem_address = IPU7_PSYS_DMEM_OFFSET,
+		.status_ctrl_reg = IPU7_BUTTRESS_REG_PSYS_UCX_CTRL_STATUS,
+		.fw_start_address_reg = IPU7_BUTTRESS_REG_PSYS_UCX_START_ADDR,
+		.fw_code_base_reg = IPU7_PS_UC_CTRL_BASE
+	}
+};
+
+static u32 get_fw_boot_reg_addr(const struct ipu6_bus_device *adev,
+				enum ipu7_boot_reg_id reg)
+{
+	u32 base = (adev->ctrl->subsys_id == IPU_ISYS) ?
+				0U : (u32)IPU7_FW_BOOT_ID_MAX;
+
+	return IPU7_BUTTRESS_FW_BOOT_PARAMS_ENTRY(base + (u32)reg);
+}
+
+static void write_fw_boot_param(const struct ipu6_bus_device *adev,
+				enum ipu7_boot_reg_id reg,
+				u32 val)
+{
+	void __iomem *base = adev->isp->base;
+
+	dev_dbg(&adev->auxdev.dev,
+		"write boot param reg: %d addr: %x val: 0x%x\n",
+		reg, get_fw_boot_reg_addr(adev, reg), val);
+	writel(val, base + get_fw_boot_reg_addr(adev, reg));
+}
+
+static u32 read_fw_boot_param(const struct ipu6_bus_device *adev,
+			      enum ipu7_boot_reg_id reg)
+{
+	void __iomem *base = adev->isp->base;
+
+	return readl(base + get_fw_boot_reg_addr(adev, reg));
+}
+
+static int ipu7_boot_cell_reset(const struct ipu6_bus_device *adev)
+{
+	const struct device *dev = &adev->auxdev.dev;
+	const struct boot_regs *regs = &boot_regs[adev->ctrl->subsys_id];
+	u32 ucx_ctrl_status = regs->status_ctrl_reg;
+	u32 timeout = IPU7_BOOT_CELL_RESET_TIMEOUT;
+	void __iomem *base = adev->isp->base;
+	u32 val, val2;
+	int ret;
+
+	val = readl(base + ucx_ctrl_status);
+	val |= IPU7_UCX_CTL_RESET;
+	val &= ~IPU7_UCX_CTL_RUN;
+
+	writel(val, base + ucx_ctrl_status);
+
+	ret = readl_poll_timeout(base + ucx_ctrl_status, val2,
+				 (val2 & 0x3U) == (val & 0x3U), 100, timeout);
+	if (ret) {
+		dev_err(dev, "cell enter reset timeout. status: 0x%x\n", val2);
+		return -ETIMEDOUT;
+	}
+
+	val = readl(base + ucx_ctrl_status);
+	val &= ~(IPU7_UCX_CTL_RESET | IPU7_UCX_CTL_RUN);
+	writel(val, base + ucx_ctrl_status);
+
+	ret = readl_poll_timeout(base + ucx_ctrl_status, val2,
+				 (val2 & 0x3U) == (val & 0x3U), 100, timeout);
+	if (ret) {
+		dev_err(dev, "cell exit reset timeout. status: 0x%x\n", val2);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static void ipu7_boot_cell_start(const struct ipu6_bus_device *adev)
+{
+	const struct boot_regs *regs = &boot_regs[adev->ctrl->subsys_id];
+	void __iomem *base = adev->isp->base;
+	u32 val;
+
+	val = readl(base + regs->status_ctrl_reg);
+	WARN_ON(val & (IPU7_UCX_CTL_RESET | IPU7_UCX_CTL_RUN));
+
+	val &= ~IPU7_UCX_CTL_RESET;
+	val |= IPU7_UCX_CTL_RUN;
+	writel(val, base + regs->status_ctrl_reg);
+}
+
+static void ipu7_boot_cell_stop(const struct ipu6_bus_device *adev)
+{
+	const struct boot_regs *regs = &boot_regs[adev->ctrl->subsys_id];
+	void __iomem *base = adev->isp->base;
+	u32 val;
+
+	val = readl(base + regs->status_ctrl_reg);
+	val &= ~IPU7_UCX_CTL_RUN;
+	writel(val, base + regs->status_ctrl_reg);
+
+	/* Wait for uC transactions complete */
+	usleep_range(10, 20);
+
+	val = readl(base + regs->status_ctrl_reg);
+	val |= IPU7_UCX_CTL_RESET;
+	writel(val, base + regs->status_ctrl_reg);
+}
+
+static int ipu7_boot_cell_init(const struct ipu6_bus_device *adev)
+{
+	const struct boot_regs *regs = &boot_regs[adev->ctrl->subsys_id];
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	struct ipu7_fw_com_context *fwctx = isys->fwctx;
+	void __iomem *base = adev->isp->base;
+
+	writel(fwctx->fw_entry, base + regs->fw_start_address_reg);
+
+	return ipu7_boot_cell_reset(adev);
+}
+
+static void init_cfg_versions(struct ipu7_boot_abi_cfg *boot_cfg, u32 length, u8 major)
+{
+	boot_cfg->length = length;
+	boot_cfg->config_version.major = 1U;
+	boot_cfg->config_version.minor = 0U;
+	boot_cfg->config_version.subminor = 0U;
+	boot_cfg->config_version.patch = 0U;
+
+	boot_cfg->client_version_support.num_versions = 1U;
+	boot_cfg->client_version_support.versions[0].major = major;
+	boot_cfg->client_version_support.versions[0].minor = 0U;
+	boot_cfg->client_version_support.versions[0].subminor = 0U;
+	boot_cfg->client_version_support.versions[0].patch = 0U;
+}
+
+int ipu7_init_boot_config(struct ipu6_bus_device *adev,
+			  struct ipu7_fw_com_queue_config *qconfigs,
+			  int num_queues, u32 uc_freq,
+			  dma_addr_t subsys_config, u8 major)
+{
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	struct ipu7_fw_com_context *fwctx = isys->fwctx;
+	struct ipu7_boot_abi_cfg *boot_config;
+	struct ipu7_fw_com_queue_params_config *cfgs;
+	struct device *dev = &adev->auxdev.dev;
+	u32 total_queue_size_aligned = 0;
+	dma_addr_t queue_mem_dma_ptr;
+	void *queue_mem_ptr;
+	unsigned int i;
+
+	/* Allocate boot config. */
+	fwctx->boot_config_size =
+		sizeof(*cfgs) * num_queues + sizeof(*boot_config);
+	fwctx->boot_config = ipu6_dma_alloc(adev, fwctx->boot_config_size,
+					    &fwctx->boot_config_dma_addr,
+					    GFP_KERNEL, 0);
+	if (!fwctx->boot_config) {
+		dev_err(dev, "Failed to allocate boot config.\n");
+		return -ENOMEM;
+	}
+
+	boot_config = fwctx->boot_config;
+	memset(boot_config, 0, sizeof(*boot_config));
+	init_cfg_versions(boot_config, fwctx->boot_config_size, major);
+	boot_config->subsys_config = subsys_config;
+
+	boot_config->uc_tile_frequency = uc_freq;
+	boot_config->uc_tile_frequency_units = 0;
+	boot_config->fw_com_config.max_output_queues =
+		fwctx->num_output_queues;
+	boot_config->fw_com_config.max_input_queues =
+		fwctx->num_input_queues;
+
+	ipu6_dma_sync_single(adev, fwctx->boot_config_dma_addr,
+			     fwctx->boot_config_size);
+
+	for (i = 0; i < num_queues; i++) {
+		u32 queue_size = qconfigs[i].max_capacity *
+			qconfigs[i].token_size_in_bytes;
+
+		queue_size = ALIGN(queue_size, 64U);
+		total_queue_size_aligned += queue_size;
+		qconfigs[i].queue_size = queue_size;
+	}
+
+	/* Allocate queue memory */
+	fwctx->queue_mem = ipu6_dma_alloc(adev, total_queue_size_aligned,
+					  &fwctx->queue_mem_dma_addr,
+					  GFP_KERNEL, 0);
+	if (!fwctx->queue_mem) {
+		dev_err(dev, "Failed to allocate queue memory.\n");
+		return -ENOMEM;
+	}
+	fwctx->queue_mem_size = total_queue_size_aligned;
+
+	cfgs = ipu7_fw_com_get_queue_config(&boot_config->fw_com_config);
+	queue_mem_ptr = fwctx->queue_mem;
+	queue_mem_dma_ptr = fwctx->queue_mem_dma_addr;
+	for (i = 0; i < num_queues; i++) {
+		cfgs[i].token_array_mem = queue_mem_dma_ptr;
+		cfgs[i].max_capacity = qconfigs[i].max_capacity;
+		cfgs[i].token_size_in_bytes = qconfigs[i].token_size_in_bytes;
+		qconfigs[i].token_array_mem = queue_mem_ptr;
+		queue_mem_dma_ptr += qconfigs[i].queue_size;
+		queue_mem_ptr += qconfigs[i].queue_size;
+	}
+
+	ipu6_dma_sync_single(adev, fwctx->queue_mem_dma_addr,
+			     total_queue_size_aligned);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_init_boot_config, "INTEL_IPU6");
+
+void ipu7_release_boot_config(struct ipu6_bus_device *adev)
+{
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	struct ipu7_fw_com_context *fwctx;
+
+	if (!isys || !isys->fwctx)
+		return;
+
+	fwctx = isys->fwctx;
+
+	if (fwctx->queue_mem) {
+		ipu6_dma_free(adev, fwctx->queue_mem_size,
+			      fwctx->queue_mem,
+			      fwctx->queue_mem_dma_addr, 0);
+		fwctx->queue_mem = NULL;
+		fwctx->queue_mem_dma_addr = 0;
+	}
+
+	if (fwctx->boot_config) {
+		ipu6_dma_free(adev, fwctx->boot_config_size,
+			      fwctx->boot_config,
+			      fwctx->boot_config_dma_addr, 0);
+		fwctx->boot_config = NULL;
+		fwctx->boot_config_dma_addr = 0;
+	}
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_release_boot_config, "INTEL_IPU6");
+
+int ipu7_boot_start_fw(const struct ipu6_bus_device *adev)
+{
+	const struct device *dev = &adev->auxdev.dev;
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	struct ipu7_fw_com_context *fwctx = isys->fwctx;
+	u32 timeout = IPU7_FW_START_STOP_TIMEOUT;
+	void __iomem *base = adev->isp->base;
+	u32 boot_state, last_boot_state;
+	u32 indices_addr, msg_ver, id;
+	int ret;
+
+	ret = ipu7_boot_cell_init(adev);
+	if (ret)
+		return ret;
+
+	/* store "uninit" state to boot state reg */
+	write_fw_boot_param(adev, IPU7_FW_BOOT_STATE_ID,
+			    IPU7_FW_BOOT_STATE_UNINIT);
+	/* Set registers to zero, recommended for diagnostics. */
+	write_fw_boot_param(adev,
+			    IPU7_FW_BOOT_SYSCOM_QUEUE_INDICES_BASE_ID, 0);
+	write_fw_boot_param(adev, IPU7_FW_BOOT_MESSAGING_VERSION_ID, 0);
+	/* store firmware configuration address */
+	write_fw_boot_param(adev, IPU7_FW_BOOT_CONFIG_ID,
+			    fwctx->boot_config_dma_addr);
+
+	ipu7_boot_cell_start(adev);
+
+	last_boot_state = IPU7_FW_BOOT_STATE_UNINIT;
+	while (timeout--) {
+		boot_state = read_fw_boot_param(adev,
+						IPU7_FW_BOOT_STATE_ID);
+		if (boot_state != last_boot_state) {
+			dev_dbg(dev, "boot state changed from 0x%x to 0x%x\n",
+				last_boot_state, boot_state);
+			last_boot_state = boot_state;
+		}
+		if (IPU7_BOOT_STATE_CRITICAL(boot_state) ||
+		    IPU7_BOOT_STATE_READY(boot_state))
+			break;
+		usleep_range(1000, 1200);
+	}
+
+	if (IPU7_BOOT_STATE_CRITICAL(boot_state)) {
+		dev_err(dev, "critical boot state error 0x%x\n", boot_state);
+		return -EINVAL;
+	} else if (!IPU7_BOOT_STATE_READY(boot_state)) {
+		dev_err(dev, "fw boot timeout. state: 0x%x\n", boot_state);
+		return -ETIMEDOUT;
+	}
+	dev_dbg(dev, "fw boot done.\n");
+
+	id = IPU7_FW_BOOT_SYSCOM_QUEUE_INDICES_BASE_ID;
+	indices_addr = read_fw_boot_param(adev, id);
+	fwctx->queue_indices = base + indices_addr;
+	dev_dbg(dev, "fw queue indices offset is 0x%x\n", indices_addr);
+
+	msg_ver = read_fw_boot_param(adev,
+				     IPU7_FW_BOOT_MESSAGING_VERSION_ID);
+	dev_dbg(dev, "ipu message version is 0x%08x\n", msg_ver);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_boot_start_fw, "INTEL_IPU6");
+
+int ipu7_boot_stop_fw(const struct ipu6_bus_device *adev)
+{
+	const struct device *dev = &adev->auxdev.dev;
+	u32 timeout = IPU7_FW_START_STOP_TIMEOUT;
+	u32 boot_state;
+
+	boot_state = read_fw_boot_param(adev, IPU7_FW_BOOT_STATE_ID);
+	if (IPU7_BOOT_STATE_CRITICAL(boot_state) ||
+	    !IPU7_BOOT_STATE_READY(boot_state)) {
+		dev_err(dev, "fw not ready for shutdown, state 0x%x\n",
+			boot_state);
+		return -EBUSY;
+	}
+
+	/* Issue shutdown to start shutdown process */
+	dev_dbg(dev, "stopping fw...\n");
+	write_fw_boot_param(adev, IPU7_FW_BOOT_STATE_ID,
+			    IPU7_FW_BOOT_STATE_SHUTDOWN_CMD);
+	while (timeout--) {
+		boot_state = read_fw_boot_param(adev,
+						IPU7_FW_BOOT_STATE_ID);
+		if (IPU7_BOOT_STATE_CRITICAL(boot_state) ||
+		    IPU7_BOOT_STATE_INACTIVE(boot_state))
+			break;
+		usleep_range(1000, 1200);
+	}
+
+	if (IPU7_BOOT_STATE_CRITICAL(boot_state)) {
+		dev_err(dev, "critical boot state error 0x%x\n", boot_state);
+		return -EINVAL;
+	} else if (!IPU7_BOOT_STATE_INACTIVE(boot_state)) {
+		dev_err(dev, "stop fw timeout. state: 0x%x\n", boot_state);
+		return -ETIMEDOUT;
+	}
+
+	ipu7_boot_cell_stop(adev);
+	dev_dbg(dev, "stop fw done.\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_boot_stop_fw, "INTEL_IPU6");
diff --git a/drivers/media/pci/intel/ipu6/ipu7-boot.h b/drivers/media/pci/intel/ipu6/ipu7-boot.h
new file mode 100644
index 000000000000..242ad70a385d
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu7-boot.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2026 Intel Corporation */
+
+#ifndef IPU7_BOOT_H
+#define IPU7_BOOT_H
+
+#include "ipu7-fw-com.h"
+
+#define IPU7_BOOT_MSG_VER_MAX_ENTRIES	3U
+
+struct ipu7_boot_abi_version {
+	u8 patch;
+	u8 subminor;
+	u8 minor;
+	u8 major;
+};
+
+struct ipu7_boot_abi_msg_versions {
+	u8 num_versions;
+	u8 reserved[3];
+	struct ipu7_boot_abi_version versions[IPU7_BOOT_MSG_VER_MAX_ENTRIES];
+};
+
+struct ipu7_boot_abi_cfg {
+	u32 length;
+	struct ipu7_boot_abi_version config_version;
+	struct ipu7_boot_abi_msg_versions client_version_support;
+	u32 pkg_dir;
+	u32 subsys_config;
+	u32 uc_tile_frequency;
+	u16 checksum;
+	u8 uc_tile_frequency_units;
+	u8 padding[1];
+	u32 reserved[58];
+	struct ipu7_fw_com_config fw_com_config;
+} __packed;
+
+int ipu7_init_boot_config(struct ipu6_bus_device *adev,
+			  struct ipu7_fw_com_queue_config *qconfigs,
+			  int num_queues, u32 uc_freq,
+			  dma_addr_t subsys_config, u8 major);
+void ipu7_release_boot_config(struct ipu6_bus_device *adev);
+int ipu7_boot_start_fw(const struct ipu6_bus_device *adev);
+int ipu7_boot_stop_fw(const struct ipu6_bus_device *adev);
+
+#endif
diff --git a/drivers/media/pci/intel/ipu6/ipu7-platform-regs.h b/drivers/media/pci/intel/ipu6/ipu7-platform-regs.h
new file mode 100644
index 000000000000..3ca9d65e58b9
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu7-platform-regs.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2026 Intel Corporation */
+
+#ifndef IPU7_PLATFORM_REGS_H
+#define IPU7_PLATFORM_REGS_H
+
+#define IPU7_IS_UC_CTRL_BASE                   0x230000
+#define IPU7_ISYS_DMEM_OFFSET                  0x200000
+#define IPU7_PS_UC_CTRL_BASE                   0x130000
+#define IPU7_PSYS_DMEM_OFFSET                  0x100000
+
+#endif
-- 
2.55.0

