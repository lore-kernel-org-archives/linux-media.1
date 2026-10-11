Received: from mail-106102.protonmail.ch (mail-106102.protonmail.ch [79.135.106.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1859E456DF5
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 14:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791729590; cv=none; b=snKGcm4mHGKHOOyrCzuBC/vxJyQAiuYe7CbJRt8PEy+AgbiisYlDtVK67O+HFfDYnQvPEXpy+1VrXDhTiFMzKndsAI6JD0ahjRoVvF0700F9ZIcEPZhD9g2xTjzdzMvLrfIm0UIC+t267lJfzKIKnUGwoXYs/fzMl5VLOpSneDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791729590; c=relaxed/simple;
	bh=ffJfsj0Kmy0gwq/TG5OyakZCCMEiCof1exM6SIqnAsc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EA38mvPnsQvZfbiLqIPsmx9/n3L2WqOIaBxooKtBG2Iu6wRL8Z2K1GysG+/GrkkQG3yvUbINz+w51B8qO/xhZHu8rwmJD04rnDyKqxEktEgondDdmzd2pNIwjpNIKseWd6ewrPzEFNtvC20k4IaRJSJacEsAw8Hxe+BR6QPWp2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=jGHWXq67; arc=none smtp.client-ip=79.135.106.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="jGHWXq67"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791729577; x=1791988777;
	bh=LNHdFCMthU1w41F655nKJu5RPKxG8vi1+AGtFv3Zpe0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jGHWXq67ILGCTdSjRtufB7+SGkr2XSA0Cv/7kwGHOgcVMvKcHIuaKKHL6Y3BNo4Jj
	 8ujxbdiBXIIe3VZXjD82PRM/kq5blC+3EH13o1eXqs5mR8H+MvnTAGYxdXJHZBtKpN
	 WM8cnS6JWRxp4NdOSomGahcebVhawWjjC9DYKztTcGZuPzTPnaFptyvw1NF3zh2oSJ
	 rIDvYBjDBmSeVIRgymtoHmBrPUHFubaYpzzsrXrbjCjERwq9njihlL2oY+ytAw7lc/
	 hDxVLj710L6gbfNqtXzVtAfUK96Vdy7tjs4bk3rNzs2pCIPXgKzts1zZbsY54VRl9e
	 BCeCwRUJaLL4g==
Date: Sun, 11 Oct 2026 14:39:31 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>, Ruslan Bay <ruslanbey@proton.me>
Subject: [RFC PATCH 07/12] media: ipu6: Add IPU4P ISYS firmware operations
Message-ID: <gjtb8e5IwUZu5qz0eABfcPJXYw0ebWqQ_J2cJ0FkOrPyrM070B4aWnEZzfb5KuCn7n45OifwYtyux4R6G8VvDB54i5wPUb-RvLsC3bYkZiA=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 9750c60a422aeefe58707460a18695f73469bff8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add IPU4P-specific ISYS firmware operations for stream configuration,
buffer management, response-token handling, and proxy communication.
Use the common response handler with the IPU4P firmware ABI.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 drivers/media/pci/intel/ipu6/Makefile         |   1 +
 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c  | 598 ++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h  |   3 +
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  11 +-
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |   8 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 124 +++-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  15 +
 drivers/media/pci/intel/ipu6/ipu6.c           |   7 +
 8 files changed, 742 insertions(+), 25 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c

diff --git a/drivers/media/pci/intel/ipu6/Makefile b/drivers/media/pci/inte=
l/ipu6/Makefile
index 676bc978b972..54b543ec5f52 100644
--- a/drivers/media/pci/intel/ipu6/Makefile
+++ b/drivers/media/pci/intel/ipu6/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_VIDEO_INTEL_IPU6)=09+=3D intel-ipu6.o
 intel-ipu6-isys-y=09=09:=3D ipu6-isys.o \
 =09=09=09=09ipu6-isys-csi2.o \
 =09=09=09=09ipu6-fw-isys.o \
+=09=09=09=09ipu4p-fw-isys.o \
 =09=09=09=09ipu7-fw-isys.o \
 =09=09=09=09ipu6-isys-video.o \
 =09=09=09=09ipu6-isys-queue.o \
diff --git a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c b/drivers/media/p=
ci/intel/ipu6/ipu4p-fw-isys.c
new file mode 100644
index 000000000000..dfab6e570e51
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c
@@ -0,0 +1,598 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Intel Corporation
+ */
+
+#include <linux/cacheflush.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/slab.h>
+
+#include "ipu6.h"
+#include "ipu6-bus.h"
+#include "ipu6-dma.h"
+#include "ipu6-fw-com.h"
+#include "ipu6-isys.h"
+#include "ipu6-isys-queue.h"
+#include "ipu6-isys-video.h"
+#include "ipu6-platform-regs.h"
+#include "ipu4p-fw-isys.h"
+
+static void start_sp(struct ipu6_bus_device *adev)
+{
+=09struct ipu6_isys *isys =3D ipu6_bus_get_drvdata(adev);
+=09void __iomem *spc_regs_base =3D isys->pdata->base +
+=09=09isys->pdata->ipdata->hw_variant.spc_offset;
+=09u32 val =3D IPU6_ISYS_SPC_STATUS_START |
+=09=09IPU6_ISYS_SPC_STATUS_RUN |
+=09=09IPU6_ISYS_SPC_STATUS_CTRL_ICACHE_INVALIDATE;
+
+=09val |=3D isys->icache_prefetch ? IPU6_ISYS_SPC_STATUS_ICACHE_PREFETCH :=
 0;
+
+=09writel(val, spc_regs_base + IPU6_ISYS_REG_SPC_STATUS_CTRL);
+}
+
+static int query_sp(struct ipu6_bus_device *adev)
+{
+=09struct ipu6_isys *isys =3D ipu6_bus_get_drvdata(adev);
+=09void __iomem *spc_regs_base =3D isys->pdata->base +
+=09=09isys->pdata->ipdata->hw_variant.spc_offset;
+=09u32 val;
+
+=09val =3D readl(spc_regs_base + IPU6_ISYS_REG_SPC_STATUS_CTRL);
+=09val &=3D IPU6_ISYS_SPC_STATUS_READY | IPU6_ISYS_SPC_STATUS_START;
+
+=09return val =3D=3D IPU6_ISYS_SPC_STATUS_READY;
+}
+
+static int ipu4p_isys_fwcom_cfg_init(struct ipu6_isys *isys,
+=09=09=09=09     struct ipu6_fw_com_cfg *fwcom_cfg,
+=09=09=09=09     unsigned int num_streams)
+{
+=09struct ipu6_fw_syscom_queue_config *input_queue_cfg;
+=09struct ipu6_fw_syscom_queue_config *output_queue_cfg;
+=09struct device *dev =3D &isys->adev->auxdev.dev;
+=09struct ipu4p_fw_isys_fw_config *isys_fw_cfg;
+=09u32 num_in_message_queues;
+=09unsigned int max_streams;
+=09unsigned int max_devq_size;
+=09unsigned int size;
+=09unsigned int i;
+
+=09max_streams =3D isys->pdata->ipdata->max_streams;
+=09max_devq_size =3D isys->pdata->ipdata->max_devq_size;
+=09num_in_message_queues =3D clamp(num_streams, 1U, max_streams);
+
+=09isys_fw_cfg =3D devm_kzalloc(dev, sizeof(*isys_fw_cfg), GFP_KERNEL);
+=09if (!isys_fw_cfg)
+=09=09return -ENOMEM;
+
+=09isys_fw_cfg->num_send_queues[IPU4P_FW_ISYS_QUEUE_TYPE_PROXY] =3D 1;
+=09isys_fw_cfg->num_send_queues[IPU4P_FW_ISYS_QUEUE_TYPE_DEV] =3D 1;
+=09isys_fw_cfg->num_send_queues[IPU4P_FW_ISYS_QUEUE_TYPE_MSG] =3D
+=09=09num_in_message_queues;
+=09isys_fw_cfg->num_recv_queues[IPU4P_FW_ISYS_QUEUE_TYPE_PROXY] =3D 1;
+=09isys_fw_cfg->num_recv_queues[IPU4P_FW_ISYS_QUEUE_TYPE_DEV] =3D 0;
+=09isys_fw_cfg->num_recv_queues[IPU4P_FW_ISYS_QUEUE_TYPE_MSG] =3D 1;
+
+=09size =3D sizeof(*input_queue_cfg) *
+=09=09(IPU4P_BASE_MSG_SEND_QUEUES + num_in_message_queues);
+=09input_queue_cfg =3D devm_kzalloc(dev, size, GFP_KERNEL);
+=09if (!input_queue_cfg)
+=09=09return -ENOMEM;
+
+=09size =3D sizeof(*output_queue_cfg) * IPU4P_N_MAX_RECV_QUEUES;
+=09output_queue_cfg =3D devm_kzalloc(dev, size, GFP_KERNEL);
+=09if (!output_queue_cfg)
+=09=09return -ENOMEM;
+
+=09fwcom_cfg->input =3D input_queue_cfg;
+=09fwcom_cfg->output =3D output_queue_cfg;
+
+=09fwcom_cfg->num_input_queues =3D
+=09=09isys_fw_cfg->num_send_queues[IPU4P_FW_ISYS_QUEUE_TYPE_PROXY] +
+=09=09isys_fw_cfg->num_send_queues[IPU4P_FW_ISYS_QUEUE_TYPE_DEV] +
+=09=09isys_fw_cfg->num_send_queues[IPU4P_FW_ISYS_QUEUE_TYPE_MSG];
+
+=09fwcom_cfg->num_output_queues =3D
+=09=09isys_fw_cfg->num_recv_queues[IPU4P_FW_ISYS_QUEUE_TYPE_PROXY] +
+=09=09isys_fw_cfg->num_recv_queues[IPU4P_FW_ISYS_QUEUE_TYPE_DEV] +
+=09=09isys_fw_cfg->num_recv_queues[IPU4P_FW_ISYS_QUEUE_TYPE_MSG];
+
+=09for (i =3D 0; i < IPU4P_ISYS_MAX_STREAMS; i++) {
+=09=09if (i < num_in_message_queues)
+=09=09=09isys_fw_cfg->buffer_partition.num_gda_pages[i] =3D
+=09=09=09=09(IPU6_DEVICE_GDA_NR_PAGES *
+=09=09=09=09 IPU6_DEVICE_GDA_VIRT_FACTOR) /
+=09=09=09=09num_in_message_queues;
+=09=09else
+=09=09=09isys_fw_cfg->buffer_partition.num_gda_pages[i] =3D 0;
+=09}
+
+=09input_queue_cfg[IPU4P_BASE_PROXY_SEND_QUEUES].token_size =3D
+=09=09sizeof(struct ipu4p_fw_isys_proxy_send_token);
+=09input_queue_cfg[IPU4P_BASE_PROXY_SEND_QUEUES].queue_size =3D
+=09=09IPU4P_ISYS_SIZE_PROXY_SEND_QUEUE;
+
+=09input_queue_cfg[IPU4P_BASE_DEV_SEND_QUEUES].token_size =3D
+=09=09sizeof(struct ipu4p_fw_isys_send_token);
+=09input_queue_cfg[IPU4P_BASE_DEV_SEND_QUEUES].queue_size =3D
+=09=09max_devq_size;
+
+=09for (i =3D 0; i < num_in_message_queues; i++) {
+=09=09input_queue_cfg[IPU4P_BASE_MSG_SEND_QUEUES + i].token_size =3D
+=09=09=09sizeof(struct ipu4p_fw_isys_send_token);
+=09=09input_queue_cfg[IPU4P_BASE_MSG_SEND_QUEUES + i].queue_size =3D
+=09=09=09IPU4P_ISYS_SIZE_SEND_QUEUE;
+=09}
+
+=09output_queue_cfg[IPU4P_BASE_PROXY_RECV_QUEUES].token_size =3D
+=09=09sizeof(struct ipu4p_fw_isys_proxy_recv_token);
+=09output_queue_cfg[IPU4P_BASE_PROXY_RECV_QUEUES].queue_size =3D
+=09=09IPU4P_ISYS_SIZE_PROXY_RECV_QUEUE;
+
+=09output_queue_cfg[IPU4P_BASE_MSG_RECV_QUEUES].token_size =3D
+=09=09sizeof(struct ipu4p_fw_isys_recv_token);
+=09output_queue_cfg[IPU4P_BASE_MSG_RECV_QUEUES].queue_size =3D
+=09=09IPU4P_ISYS_SIZE_RECV_QUEUE;
+
+=09fwcom_cfg->dmem_addr =3D isys->pdata->ipdata->hw_variant.dmem_offset;
+=09fwcom_cfg->specific_addr =3D isys_fw_cfg;
+=09fwcom_cfg->specific_size =3D sizeof(*isys_fw_cfg);
+=09fwcom_cfg->dmem_syscom =3D true;
+
+=09return 0;
+}
+
+static int ipu4p_fw_isys_close(struct ipu6_isys *isys)
+{
+=09struct device *dev =3D &isys->adev->auxdev.dev;
+=09int retry =3D IPU4P_ISYS_CLOSE_RETRY;
+=09unsigned long flags;
+=09void *fwctx;
+=09int ret;
+
+=09spin_lock_irqsave(&isys->power_lock, flags);
+=09ret =3D ipu6_fw_com_close(isys->fwctx);
+=09fwctx =3D isys->fwctx;
+=09isys->fwctx =3D NULL;
+=09spin_unlock_irqrestore(&isys->power_lock, flags);
+=09if (ret)
+=09=09dev_err(dev, "Device close failure: %d\n", ret);
+
+=09do {
+=09=09usleep_range(400, 500);
+=09=09ret =3D ipu6_fw_com_release(fwctx, 0);
+=09=09retry--;
+=09} while (ret && retry);
+
+=09if (ret) {
+=09=09dev_err(dev, "Device release time out %d\n", ret);
+=09=09spin_lock_irqsave(&isys->power_lock, flags);
+=09=09isys->fwctx =3D fwctx;
+=09=09spin_unlock_irqrestore(&isys->power_lock, flags);
+=09}
+
+=09return ret;
+}
+
+static void ipu4p_fw_isys_cleanup(struct ipu6_isys *isys)
+{
+=09int ret;
+
+=09ret =3D ipu6_fw_com_release(isys->fwctx, 1);
+=09if (ret < 0)
+=09=09dev_warn(&isys->adev->auxdev.dev,
+=09=09=09 "Device busy, fw_com release failed.\n");
+=09isys->fwctx =3D NULL;
+}
+
+static int ipu4p_fw_isys_init(struct ipu6_isys *isys, unsigned int num_str=
eams)
+{
+=09struct device *dev =3D &isys->adev->auxdev.dev;
+=09int retry =3D IPU4P_ISYS_OPEN_RETRY;
+=09struct ipu6_fw_com_cfg fwcom_cfg =3D {
+=09=09.cell_start =3D start_sp,
+=09=09.cell_ready =3D query_sp,
+=09=09.buttress_boot_offset =3D 0,
+=09=09.dmem_syscom =3D true,
+=09};
+=09int ret;
+
+=09ret =3D ipu4p_isys_fwcom_cfg_init(isys, &fwcom_cfg, num_streams);
+=09if (ret)
+=09=09return ret;
+
+=09isys->fwctx =3D ipu6_fw_com_prepare(&fwcom_cfg, isys->adev,
+=09=09=09=09=09  isys->pdata->base);
+=09if (!isys->fwctx) {
+=09=09dev_err(dev, "isys fw com prepare failed\n");
+=09=09return -EIO;
+=09}
+
+=09ret =3D ipu6_fw_com_open(isys->fwctx);
+=09if (ret) {
+=09=09dev_err(dev, "isys fw com open failed %d\n", ret);
+=09=09ipu4p_fw_isys_cleanup(isys);
+=09=09return ret;
+=09}
+
+=09do {
+=09=09usleep_range(400, 500);
+=09=09if (ipu6_fw_com_ready(isys->fwctx))
+=09=09=09break;
+=09=09retry--;
+=09} while (retry > 0);
+
+=09if (!retry) {
+=09=09dev_err(dev, "isys port open ready failed\n");
+=09=09ipu4p_fw_isys_close(isys);
+=09=09return -ETIMEDOUT;
+=09}
+
+=09return 0;
+}
+
+static int ipu4p_send_cmd(struct ipu6_isys *isys,
+=09=09=09  const unsigned int stream_handle,
+=09=09=09  void *cpu_mapped_buf,
+=09=09=09  dma_addr_t dma_mapped_buf,
+=09=09=09  size_t size, u16 send_type)
+{
+=09struct ipu6_fw_com_context *ctx =3D isys->fwctx;
+=09struct ipu4p_fw_isys_send_token *token;
+
+=09if (send_type >=3D N_IPU4P_FW_ISYS_SEND_TYPE)
+=09=09return -EINVAL;
+
+=09if (cpu_mapped_buf)
+=09=09clflush_cache_range(cpu_mapped_buf, size);
+
+=09token =3D ipu6_send_get_token(ctx, stream_handle +
+=09=09=09=09    IPU4P_BASE_MSG_SEND_QUEUES);
+=09if (!token)
+=09=09return -EBUSY;
+
+=09token->buf_handle =3D (unsigned long)cpu_mapped_buf;
+=09token->payload =3D dma_mapped_buf;
+=09token->send_type =3D send_type;
+=09token->stream_id =3D stream_handle;
+
+=09ipu6_send_put_token(ctx, stream_handle + IPU4P_BASE_MSG_SEND_QUEUES);
+
+=09return 0;
+}
+
+static int ipu4p_send_proxy_token(struct ipu6_isys *isys,
+=09=09=09=09  unsigned int req_id,
+=09=09=09=09  unsigned int region_index, u32 value)
+{
+=09struct ipu6_fw_com_context *ctx =3D isys->fwctx;
+=09struct ipu4p_fw_isys_proxy_send_token *send_token;
+=09unsigned int timeout =3D 1000;
+=09int ret =3D -ETIMEDOUT;
+
+=09send_token =3D ipu6_send_get_token(ctx, IPU4P_BASE_PROXY_SEND_QUEUES);
+=09if (!send_token)
+=09=09return -EBUSY;
+
+=09send_token->request_id =3D req_id;
+=09send_token->region_index =3D region_index;
+=09send_token->offset =3D 0;
+=09send_token->value =3D value;
+=09ipu6_send_put_token(ctx, IPU4P_BASE_PROXY_SEND_QUEUES);
+
+=09do {
+=09=09struct ipu4p_fw_isys_proxy_recv_token *recv_token;
+
+=09=09usleep_range(100, 110);
+=09=09recv_token =3D ipu6_recv_get_token(ctx,
+=09=09=09=09=09=09 IPU4P_BASE_PROXY_RECV_QUEUES);
+=09=09if (!recv_token) {
+=09=09=09timeout--;
+=09=09=09continue;
+=09=09}
+
+=09=09if (recv_token->proxy_resp_info.request_id !=3D req_id)
+=09=09=09ret =3D -EIO;
+=09=09else if (recv_token->proxy_resp_info.error_info.error)
+=09=09=09ret =3D -EIO;
+=09=09else
+=09=09=09ret =3D 0;
+
+=09=09ipu6_recv_put_token(ctx, IPU4P_BASE_PROXY_RECV_QUEUES);
+=09=09break;
+=09} while (timeout);
+
+=09return ret;
+}
+
+static int ipu4p_fw_isys_set_iwake_register(struct ipu6_isys *isys,
+=09=09=09=09=09    enum ipu6_isys_iwake_register reg,
+=09=09=09=09=09    u32 value)
+{
+=09switch (reg) {
+=09case IPU6_ISYS_IWAKE_GDA_THRESHOLD:
+=09=09return ipu4p_send_proxy_token(isys, 0, 0, value);
+=09case IPU6_ISYS_IWAKE_GDA_ENABLE:
+=09=09return ipu4p_send_proxy_token(isys, 1, 1, value);
+=09case IPU6_ISYS_IWAKE_GDA_IRQ_CRITICAL_THRESHOLD:
+=09case IPU6_ISYS_IWAKE_GDA_MEMOPEN_THRESHOLD:
+=09=09return -EOPNOTSUPP;
+=09default:
+=09=09return -EINVAL;
+=09}
+}
+
+static int ipu4p_isys_isr_one(struct ipu6_bus_device *adev)
+{
+=09struct ipu6_isys *isys =3D ipu6_bus_get_drvdata(adev);
+=09struct ipu4p_fw_isys_resp_info *fw_resp;
+=09struct ipu6_fw_isys_resp_info_abi resp =3D {};
+
+=09if (!isys->fwctx)
+=09=09return 1;
+
+=09fw_resp =3D ipu6_recv_get_token(isys->fwctx,
+=09=09=09=09      IPU4P_BASE_MSG_RECV_QUEUES);
+=09if (!fw_resp)
+=09=09return 1;
+
+=09resp.buf_id =3D fw_resp->buf_id;
+=09resp.pin.out_buf_id =3D fw_resp->pin.out_buf_id;
+=09/*
+=09 * IPU4P returns the opaque frame-buffer-set handle in the output
+=09 * pin payload for PIN_DATA_READY, not in the common response buf_id
+=09 * field. Normalize it here so the common response handler can
+=09 * release the message buffer before completing the capture buffer.
+=09 */
+=09if (fw_resp->type =3D=3D IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_READY)
+=09=09resp.buf_id =3D fw_resp->pin.out_buf_id;
+=09resp.pin.addr =3D fw_resp->pin.addr;
+=09resp.pin.compress =3D fw_resp->pin.compress;
+=09resp.error_info.error =3D fw_resp->error_info.error;
+=09resp.error_info.error_details =3D fw_resp->error_info.error_details;
+=09resp.timestamp[0] =3D fw_resp->timestamp[0];
+=09resp.timestamp[1] =3D fw_resp->timestamp[1];
+=09resp.stream_handle =3D fw_resp->stream_handle;
+=09resp.type =3D fw_resp->type;
+=09resp.pin_id =3D fw_resp->pin_id;
+
+=09ipu6_isys_handle_response(adev, &resp);
+=09ipu6_recv_put_token(isys->fwctx, IPU4P_BASE_MSG_RECV_QUEUES);
+
+=09return 0;
+}
+
+static int ipu4p_isys_fw_pin_cfg(struct ipu6_isys_video *av,
+=09=09=09=09 struct ipu4p_fw_isys_stream_cfg *cfg)
+{
+=09struct media_pad *src_pad =3D media_pad_remote_pad_first(&av->pad);
+=09struct v4l2_subdev *sd =3D media_entity_to_v4l2_subdev(src_pad->entity)=
;
+=09struct v4l2_subdev_state *state =3D
+=09=09v4l2_subdev_get_locked_active_state(sd);
+=09struct ipu4p_fw_isys_input_pin_info *input_pin;
+=09struct ipu4p_fw_isys_output_pin_info *output_pin;
+=09struct ipu6_isys_stream *stream =3D av->stream;
+=09struct ipu6_isys_queue *aq =3D &av->aq;
+=09struct v4l2_mbus_framefmt fmt;
+=09const struct ipu6_isys_pixelformat *pfmt =3D
+=09=09ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
+=09unsigned int input_pins;
+=09unsigned int output_pins;
+=09u32 src_stream;
+
+=09if (cfg->nof_input_pins >=3D IPU4P_MAX_IPINS ||
+=09    cfg->nof_output_pins >=3D IPU4P_MAX_OPINS)
+=09=09return -EINVAL;
+
+=09input_pins =3D cfg->nof_input_pins++;
+
+=09src_stream =3D ipu6_isys_get_src_stream_by_src_pad(sd, src_pad->index);
+=09fmt =3D *v4l2_subdev_state_get_format(state, src_pad->index, src_stream=
);
+
+=09input_pin =3D &cfg->input_pins[input_pins];
+=09input_pin->input_res.width =3D fmt.width;
+=09input_pin->input_res.height =3D fmt.height;
+=09input_pin->dt =3D av->dt;
+=09input_pin->bits_per_pix =3D pfmt->bpp_packed;
+=09input_pin->mapped_dt =3D N_IPU4P_FW_ISYS_MIPI_DATA_TYPE;
+=09input_pin->mipi_store_mode =3D (pfmt->bpp =3D=3D pfmt->bpp_packed) ?
+=09=09IPU4P_FW_ISYS_MIPI_STORE_MODE_DISCARD_LONG_HEADER :
+=09=09IPU4P_FW_ISYS_MIPI_STORE_MODE_NORMAL;
+
+=09output_pins =3D cfg->nof_output_pins++;
+=09aq->fw_output =3D output_pins;
+=09stream->output_pins_queue[output_pins] =3D aq;
+
+=09output_pin =3D &cfg->output_pins[output_pins];
+=09output_pin->input_pin_id =3D input_pins;
+=09output_pin->output_res.width =3D ipu6_isys_get_frame_width(av);
+=09output_pin->output_res.height =3D ipu6_isys_get_frame_height(av);
+=09output_pin->stride =3D ipu6_isys_get_bytes_per_line(av);
+=09output_pin->watermark_in_lines =3D 0;
+=09output_pin->payload_buf_size =3D 0;
+=09output_pin->send_irq =3D 1;
+=09output_pin->link_id =3D IPU4P_FW_ISYS_LINK_OFFLINE;
+=09output_pin->reserve_compression =3D 0;
+=09output_pin->ft =3D pfmt->css_pixelformat;
+
+=09if (pfmt->bpp !=3D pfmt->bpp_packed)
+=09=09output_pin->pt =3D IPU4P_FW_ISYS_PIN_TYPE_RAW_SOC;
+=09else
+=09=09output_pin->pt =3D IPU4P_FW_ISYS_PIN_TYPE_MIPI;
+
+=09return 0;
+}
+
+static void ipu4p_dump_stream_cfg(struct device *dev, struct isys_fw_msgs =
*msg)
+{
+=09struct ipu4p_fw_isys_stream_cfg *cfg =3D &msg->ipu4p.stream;
+=09unsigned int i;
+
+=09dev_dbg(dev, "IPU4P ISYS stream cfg: src=3D%u vc=3D%u in_pins=3D%u out_=
pins=3D%u\n",
+=09=09cfg->src, cfg->vc, cfg->nof_input_pins, cfg->nof_output_pins);
+
+=09for (i =3D 0; i < cfg->nof_input_pins; i++)
+=09=09dev_dbg(dev, "  input[%u]: %ux%u dt=3D0x%x bpp=3D%u\n",
+=09=09=09i, cfg->input_pins[i].input_res.width,
+=09=09=09cfg->input_pins[i].input_res.height,
+=09=09=09cfg->input_pins[i].dt,
+=09=09=09cfg->input_pins[i].bits_per_pix);
+
+=09for (i =3D 0; i < cfg->nof_output_pins; i++)
+=09=09dev_dbg(dev, "  output[%u]: %ux%u stride=3D%u pt=3D%u ft=3D%u\n",
+=09=09=09i, cfg->output_pins[i].output_res.width,
+=09=09=09cfg->output_pins[i].output_res.height,
+=09=09=09cfg->output_pins[i].stride,
+=09=09=09cfg->output_pins[i].pt,
+=09=09=09cfg->output_pins[i].ft);
+}
+
+static int ipu4p_fw_isys_prepare_stream_cfg(struct ipu6_isys_video *av,
+=09=09=09=09=09    struct isys_fw_msgs *msg)
+{
+=09struct ipu4p_fw_isys_stream_cfg *stream_cfg =3D &msg->ipu4p.stream;
+=09struct device *dev =3D &av->isys->adev->auxdev.dev;
+=09struct ipu6_isys_stream *stream =3D av->stream;
+=09struct ipu6_isys_queue *aq;
+
+=09memset(stream_cfg, 0, sizeof(*stream_cfg));
+=09stream_cfg->src =3D stream->stream_source;
+=09stream_cfg->vc =3D stream->vc;
+=09stream_cfg->isl_use =3D IPU4P_FW_ISYS_USE_NO_ISL_NO_ISA;
+
+=09list_for_each_entry(aq, &stream->queues, node) {
+=09=09struct ipu6_isys_video *__av =3D ipu6_isys_queue_to_video(aq);
+=09=09int ret;
+
+=09=09ret =3D ipu4p_isys_fw_pin_cfg(__av, stream_cfg);
+=09=09if (ret < 0)
+=09=09=09return ret;
+=09}
+
+=09stream->nr_output_pins =3D stream_cfg->nof_output_pins;
+
+=09ipu4p_dump_stream_cfg(dev, msg);
+
+=09return 0;
+}
+
+static void ipu4p_isys_buf_to_fw_frame_buf_pin(struct vb2_buffer *vb,
+=09=09=09=09=09       struct ipu4p_fw_isys_frame_buff_set *set)
+{
+=09struct ipu6_isys_queue *aq =3D vb2_queue_to_isys_queue(vb->vb2_queue);
+=09struct vb2_v4l2_buffer *vvb =3D to_vb2_v4l2_buffer(vb);
+=09struct ipu6_isys_video_buffer *ivb =3D
+=09=09vb2_buffer_to_ipu6_isys_video_buffer(vvb);
+
+=09set->output_pins[aq->fw_output].addr =3D ivb->dma_addr;
+=09/*
+=09 * IPU4P echoes out_buf_id in PIN_DATA_READY. Store the message
+=09 * pointer here so the common response handler can release it.
+=09 */
+=09set->output_pins[aq->fw_output].out_buf_id =3D (u64)(uintptr_t)set;
+}
+
+static void ipu4p_prepare_buf_set(struct isys_fw_msgs *msg,
+=09=09=09=09  struct ipu6_isys_stream *stream,
+=09=09=09=09  struct ipu6_isys_buffer_list *bl)
+{
+=09struct ipu4p_fw_isys_frame_buff_set *set =3D &msg->ipu4p.frame;
+=09struct ipu6_isys_buffer *ib;
+
+=09WARN_ON(!bl->nbufs);
+
+=09memset(set, 0, sizeof(*set));
+=09set->send_irq_sof =3D 1;
+=09set->send_irq_eof =3D 1;
+=09set->send_irq_capture_ack =3D 1;
+=09set->send_irq_capture_done =3D 1;
+=09set->send_resp_sof =3D 1;
+=09set->send_resp_eof =3D 1;
+=09set->frame_counter =3D atomic_fetch_inc(&stream->buf_id) % 256;
+
+=09list_for_each_entry(ib, &bl->head, head) {
+=09=09struct vb2_buffer *vb =3D ipu6_isys_buffer_to_vb2_buffer(ib);
+
+=09=09ipu4p_isys_buf_to_fw_frame_buf_pin(vb, set);
+=09}
+}
+
+static void ipu4p_dump_frame_buf_set(struct device *dev,
+=09=09=09=09     struct isys_fw_msgs *msg,
+=09=09=09=09     unsigned int outputs)
+{
+=09struct ipu4p_fw_isys_frame_buff_set *set =3D &msg->ipu4p.frame;
+=09unsigned int i;
+
+=09dev_dbg(dev, "IPU4P frame buff set: fid=3D%u outputs=3D%u\n",
+=09=09set->frame_counter, outputs);
+=09for (i =3D 0; i < outputs; i++)
+=09=09dev_dbg(dev, "  pin[%u]: addr=3D0x%x token=3D0x%llx\n",
+=09=09=09i, set->output_pins[i].addr,
+=09=09=09set->output_pins[i].out_buf_id);
+}
+
+static int ipu4p_stream_open(struct ipu6_isys *isys,
+=09=09=09     const unsigned int stream_handle,
+=09=09=09     struct isys_fw_msgs *msg)
+{
+=09return ipu4p_send_cmd(isys, stream_handle, &msg->ipu4p.stream,
+=09=09=09      msg->dma_addr, sizeof(msg->ipu4p.stream),
+=09=09=09      IPU4P_FW_ISYS_SEND_TYPE_STREAM_OPEN);
+}
+
+static int ipu4p_stream_start(struct ipu6_isys *isys,
+=09=09=09      const unsigned int stream_handle,
+=09=09=09      struct isys_fw_msgs *msg, bool capture)
+{
+=09if (!capture)
+=09=09return ipu4p_send_cmd(isys, stream_handle, NULL, 0, 0,
+=09=09=09=09      IPU4P_FW_ISYS_SEND_TYPE_STREAM_START);
+
+=09return ipu4p_send_cmd(isys, stream_handle, &msg->ipu4p.frame,
+=09=09=09      msg->dma_addr, sizeof(msg->ipu4p.frame),
+=09=09=09      IPU4P_FW_ISYS_SEND_TYPE_STREAM_START_AND_CAPTURE);
+}
+
+static int ipu4p_stream_capture(struct ipu6_isys *isys,
+=09=09=09=09const unsigned int stream_handle,
+=09=09=09=09struct isys_fw_msgs *msg)
+{
+=09return ipu4p_send_cmd(isys, stream_handle, &msg->ipu4p.frame,
+=09=09=09      msg->dma_addr, sizeof(msg->ipu4p.frame),
+=09=09=09      IPU4P_FW_ISYS_SEND_TYPE_STREAM_CAPTURE);
+}
+
+static int ipu4p_stream_flush(struct ipu6_isys *isys,
+=09=09=09      const unsigned int stream_handle)
+{
+=09return ipu4p_send_cmd(isys, stream_handle, NULL, 0, 0,
+=09=09=09      IPU4P_FW_ISYS_SEND_TYPE_STREAM_FLUSH);
+}
+
+static int ipu4p_stream_close(struct ipu6_isys *isys,
+=09=09=09      const unsigned int stream_handle)
+{
+=09return ipu4p_send_cmd(isys, stream_handle, NULL, 0, 0,
+=09=09=09      IPU4P_FW_ISYS_SEND_TYPE_STREAM_CLOSE);
+}
+
+const struct ipu6_fw_isys_ops ipu4p_fw_isys_ops =3D {
+=09.init =3D ipu4p_fw_isys_init,
+=09.close =3D ipu4p_fw_isys_close,
+=09.isr_one =3D ipu4p_isys_isr_one,
+=09.set_iwake_register =3D ipu4p_fw_isys_set_iwake_register,
+=09.cleanup =3D ipu4p_fw_isys_cleanup,
+=09.send_cmd =3D ipu4p_send_cmd,
+=09.prepare_stream_cfg =3D ipu4p_fw_isys_prepare_stream_cfg,
+=09.prepare_buf_set =3D ipu4p_prepare_buf_set,
+=09.stream_open =3D ipu4p_stream_open,
+=09.stream_start =3D ipu4p_stream_start,
+=09.stream_capture =3D ipu4p_stream_capture,
+=09.stream_flush =3D ipu4p_stream_flush,
+=09.stream_close =3D ipu4p_stream_close,
+=09.dump_stream_cfg =3D ipu4p_dump_stream_cfg,
+=09.dump_frame_buf_set =3D ipu4p_dump_frame_buf_set,
+};
diff --git a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h b/drivers/media/p=
ci/intel/ipu6/ipu4p-fw-isys.h
index afc288b939bd..7444fafea665 100644
--- a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h
@@ -18,6 +18,7 @@ struct ipu6_isys_buffer_list;
 struct isys_fw_msgs;
=20
 #define IPU4P_ISYS_MAX_STREAMS=09=09=098U
+#define IPU4P_ISYS_CSI2_NPORTS=09=09=098U
 #define IPU4P_MAX_IPINS=09=09=09=094U
 #define IPU4P_MAX_OPINS=09=09=09=096U
 #define IPU4P_NOF_SRAM_BLOCKS_MAX=09=098U
@@ -404,5 +405,7 @@ static_assert(sizeof(struct ipu4p_fw_isys_frame_buff_se=
t) =3D=3D 120);
 static_assert(sizeof(struct ipu4p_fw_isys_resp_info) =3D=3D 64);
=20
 extern const struct ipu6_fw_isys_ops ipu4p_fw_isys_ops;
+irqreturn_t ipu4p_isys_isr(struct ipu6_bus_device *adev);
+void ipu4p_isys_irq_setup(struct ipu6_isys *isys);
=20
 #endif /* IPU4P_FW_ISYS_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/=
pci/intel/ipu6/ipu6-isys-csi2.c
index 160eace947f4..9e87750269d0 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -22,6 +22,7 @@
 #include "ipu6-bus.h"
 #include "ipu6-isys.h"
 #include "ipu6-isys-csi2.h"
+#include "ipu4p-fw-isys.h"
 #include "ipu6-isys-subdev.h"
 #include "ipu6-platform-isys-csi2-reg.h"
 #include "ipu7-isys-csi2-regs.h"
@@ -621,6 +622,10 @@ void ipu6_isys_csi2_cleanup(struct ipu6_isys_csi2 *csi=
2)
 =09csi2->isys =3D NULL;
 }
=20
+static const u8 ipu4p_csi2_fw_sources[IPU4P_ISYS_CSI2_NPORTS] =3D {
+=093, 6, 7, 8, 9, 10, 11, 12,
+};
+
 int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
 =09=09=09struct ipu6_isys *isys,
 =09=09=09void __iomem *base, unsigned int index)
@@ -639,7 +644,11 @@ int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
 =09if (ret)
 =09=09goto fail;
=20
-=09csi2->asd.source =3D IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT0 + index;
+=09if (IS_IPU4P(isys->adev->isp))
+=09=09csi2->asd.source =3D IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT0 +
+=09=09=09=09      ipu4p_csi2_fw_sources[index];
+=09else
+=09=09csi2->asd.source =3D IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT0 + index;
 =09csi2->asd.supported_codes =3D csi2_supported_codes;
 =09snprintf(csi2->asd.sd.name, sizeof(csi2->asd.sd.name),
 =09=09 IPU6_ISYS_ENTITY_PREFIX " CSI2 %u", index);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media=
/pci/intel/ipu6/ipu6-isys-video.c
index 9634b4f232bd..d9cab5b5d872 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -783,13 +783,17 @@ ipu6_isys_get_stream(struct ipu6_isys_video *av, stru=
ct ipu6_isys_subdev *asd)
 =09struct ipu6_isys *isys =3D av->isys;
 =09unsigned long flags;
 =09unsigned int i;
+=09unsigned int max_streams;
 =09u8 vc =3D av->vc;
=20
 =09if (!isys)
 =09=09return NULL;
=20
+=09max_streams =3D min_t(unsigned int, IPU6_ISYS_MAX_STREAMS,
+=09=09=09    isys->pdata->ipdata->max_streams);
+
 =09spin_lock_irqsave(&isys->streams_lock, flags);
-=09for (i =3D 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
+=09for (i =3D 0; i < max_streams; i++) {
 =09=09if (isys->streams_ref_count[i] && isys->streams[i].vc =3D=3D vc &&
 =09=09    isys->streams[i].asd =3D=3D asd) {
 =09=09=09isys->streams_ref_count[i]++;
@@ -799,7 +803,7 @@ ipu6_isys_get_stream(struct ipu6_isys_video *av, struct=
 ipu6_isys_subdev *asd)
 =09}
=20
 =09if (!stream) {
-=09=09for (i =3D 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
+=09=09for (i =3D 0; i < max_streams; i++) {
 =09=09=09if (!isys->streams_ref_count[i]) {
 =09=09=09=09isys->streams_ref_count[i]++;
 =09=09=09=09stream =3D &isys->streams[i];
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/i=
ntel/ipu6/ipu6-isys.c
index 08f29b678d1b..1f9809d1b138 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -103,6 +103,26 @@ enum ltr_did_type {
=20
 #define ISYS_PM_QOS_VALUE=09300
=20
+static int
+ipu6_isys_csi2_fw_port_to_index(struct ipu6_isys *isys, unsigned int fw_po=
rt)
+{
+=09unsigned int index;
+
+=09if (!IS_IPU4P(isys->adev->isp))
+=09=09index =3D fw_port;
+=09else if (fw_port =3D=3D 3)
+=09=09index =3D 0;
+=09else if (fw_port >=3D 6 && fw_port <=3D 12)
+=09=09index =3D fw_port - 5;
+=09else
+=09=09return -EINVAL;
+
+=09if (index >=3D isys->pdata->ipdata->csi2.nports)
+=09=09return -EINVAL;
+
+=09return index;
+}
+
 static int
 isys_complete_ext_device_registration(struct ipu6_isys *isys,
 =09=09=09=09      struct v4l2_subdev *sd,
@@ -110,8 +130,16 @@ isys_complete_ext_device_registration(struct ipu6_isys=
 *isys,
 {
 =09struct device *dev =3D &isys->adev->auxdev.dev;
 =09unsigned int i;
+=09int csi2_port;
 =09int ret;
=20
+=09csi2_port =3D ipu6_isys_csi2_fw_port_to_index(isys, csi2->port);
+=09if (csi2_port < 0) {
+=09=09dev_warn(dev, "invalid csi2 port %u\n", csi2->port);
+=09=09ret =3D csi2_port;
+=09=09goto unregister_subdev;
+=09}
+
 =09for (i =3D 0; i < sd->entity.num_pads; i++) {
 =09=09if (sd->entity.pads[i].flags & MEDIA_PAD_FL_SOURCE)
 =09=09=09break;
@@ -124,7 +152,7 @@ isys_complete_ext_device_registration(struct ipu6_isys =
*isys,
 =09}
=20
 =09ret =3D media_create_pad_link(&sd->entity, i,
-=09=09=09=09    &isys->csi2[csi2->port].asd.sd.entity,
+=09=09=09=09    &isys->csi2[csi2_port].asd.sd.entity,
 =09=09=09=09    0, MEDIA_LNK_FL_ENABLED |
 =09=09=09=09       MEDIA_LNK_FL_IMMUTABLE);
 =09if (ret) {
@@ -132,8 +160,8 @@ isys_complete_ext_device_registration(struct ipu6_isys =
*isys,
 =09=09goto unregister_subdev;
 =09}
=20
-=09isys->csi2[csi2->port].nlanes =3D csi2->nlanes;
-=09isys->csi2[csi2->port].phy_mode =3D
+=09isys->csi2[csi2_port].nlanes =3D csi2->nlanes;
+=09isys->csi2[csi2_port].phy_mode =3D
 =09=09csi2->bus_type =3D=3D V4L2_MBUS_CSI2_DPHY ?
 =09=09PHY_MODE_DPHY : PHY_MODE_CPHY;
=20
@@ -361,18 +389,46 @@ static void get_lut_ltrdid(struct ipu6_isys *isys, st=
ruct ltr_did *pltr_did)
 =09=09*pltr_did =3D ltrdid_default;
 }
=20
-static int set_iwake_register(struct ipu6_isys *isys, u32 index, u32 value=
)
+static int set_iwake_register(struct ipu6_isys *isys,
+=09=09=09      enum ipu6_isys_iwake_register reg, u32 value)
 {
 =09struct device *dev =3D &isys->adev->auxdev.dev;
-=09u32 req_id =3D index;
-=09u32 offset =3D 0;
+=09const struct ipu6_fw_isys_ops *fw_ops =3D isys->adev->auxdrv_data->fw_o=
ps;
+=09unsigned int proxy_region;
 =09int ret;
=20
-=09ret =3D ipu6_fw_isys_send_proxy_token(isys, req_id, index, offset, valu=
e);
-=09if (ret)
-=09=09dev_err(dev, "write %d failed %d", index, ret);
+=09if (fw_ops->set_iwake_register) {
+=09=09ret =3D fw_ops->set_iwake_register(isys, reg, value);
+=09} else if (IS_IPU7(isys->adev->isp)) {
+=09=09ret =3D -EOPNOTSUPP;
+=09} else {
+=09=09switch (reg) {
+=09=09case IPU6_ISYS_IWAKE_GDA_IRQ_CRITICAL_THRESHOLD:
+=09=09=09proxy_region =3D GDA_IRQ_CRITICAL_THRESHOLD_INDEX;
+=09=09=09break;
+=09=09case IPU6_ISYS_IWAKE_GDA_THRESHOLD:
+=09=09=09proxy_region =3D GDA_IWAKE_THRESHOLD_INDEX;
+=09=09=09break;
+=09=09case IPU6_ISYS_IWAKE_GDA_ENABLE:
+=09=09=09proxy_region =3D GDA_ENABLE_IWAKE_INDEX;
+=09=09=09break;
+=09=09case IPU6_ISYS_IWAKE_GDA_MEMOPEN_THRESHOLD:
+=09=09=09proxy_region =3D GDA_MEMOPEN_THRESHOLD_INDEX;
+=09=09=09break;
+=09=09default:
+=09=09=09ret =3D -EINVAL;
+=09=09=09goto out;
+=09=09}
=20
-=09return ret;
+=09=09ret =3D ipu6_fw_isys_send_proxy_token(isys, proxy_region,
+=09=09=09=09=09=09    proxy_region, 0, value);
+=09}
+
+out:
+=09if (ret && ret !=3D -EOPNOTSUPP)
+=09=09dev_err(dev, "write %u failed %d", reg, ret);
+
+=09return ret =3D=3D -EOPNOTSUPP ? 0 : ret;
 }
=20
 /*
@@ -399,6 +455,13 @@ static void set_iwake_ltrdid(struct ipu6_isys *isys, u=
16 ltr, u16 did,
 =09struct ipu6_device *isp =3D isys->adev->isp;
 =09union fabric_ctrl fc;
=20
+=09/*
+=09 * IPU4P exposes its supported GDA IWAKE controls through the firmware
+=09 * proxy. Do not apply IPU6 LTR/DID programming to IPU4P.
+=09 */
+=09if (IS_IPU4P(isp))
+=09=09return;
+
 =09switch (use) {
 =09case LTR_IWAKE_ON:
 =09=09ltr_val =3D min_t(u16, ltr, (u16)LTR_DID_VAL_MAX);
@@ -466,7 +529,7 @@ static void enable_iwake(struct ipu6_isys *isys, bool e=
nable)
 =09=09return;
 =09}
=20
-=09ret =3D set_iwake_register(isys, GDA_ENABLE_IWAKE_INDEX, enable);
+=09ret =3D set_iwake_register(isys, IPU6_ISYS_IWAKE_GDA_ENABLE, enable);
 =09if (!ret)
 =09=09iwake_watermark->iwake_enabled =3D enable;
=20
@@ -495,7 +558,8 @@ void update_watermark_setting(struct ipu6_isys *isys)
 =09mutex_lock(&iwake_watermark->mutex);
 =09if (iwake_watermark->force_iwake_disable) {
 =09=09set_iwake_ltrdid(isys, 0, 0, LTR_IWAKE_OFF);
-=09=09set_iwake_register(isys, GDA_IRQ_CRITICAL_THRESHOLD_INDEX,
+=09=09set_iwake_register(isys,
+=09=09=09=09   IPU6_ISYS_IWAKE_GDA_IRQ_CRITICAL_THRESHOLD,
 =09=09=09=09   CRITICAL_THRESHOLD_IWAKE_DISABLE);
 =09=09goto unlock_exit;
 =09}
@@ -516,7 +580,8 @@ void update_watermark_setting(struct ipu6_isys *isys)
 =09=09enable_iwake(isys, false);
 =09=09set_iwake_ltrdid(isys, 0, 0, LTR_IWAKE_OFF);
 =09=09mutex_lock(&iwake_watermark->mutex);
-=09=09set_iwake_register(isys, GDA_IRQ_CRITICAL_THRESHOLD_INDEX,
+=09=09set_iwake_register(isys,
+=09=09=09=09   IPU6_ISYS_IWAKE_GDA_IRQ_CRITICAL_THRESHOLD,
 =09=09=09=09   CRITICAL_THRESHOLD_IWAKE_DISABLE);
 =09=09goto unlock_exit;
 =09}
@@ -548,14 +613,14 @@ void update_watermark_setting(struct ipu6_isys *isys)
=20
 =09set_iwake_ltrdid(isys, ltr, did, ltr_did_type);
=20
-=09/* calculate iwake threshold with 2KB granularity pages */
+=09/* Calculate the IWAKE threshold in SRAM granularity units. */
 =09threshold_bytes =3D did * isys_pb_datarate_mbs;
 =09iwake_threshold =3D max_t(u32, 1, threshold_bytes >> shift);
 =09iwake_threshold =3D min_t(u32, iwake_threshold, max_sram_size);
=20
 =09mutex_lock(&iwake_watermark->mutex);
 =09if (isys->pdata->ipdata->enhanced_iwake) {
-=09=09set_iwake_register(isys, GDA_IWAKE_THRESHOLD_INDEX,
+=09=09set_iwake_register(isys, IPU6_ISYS_IWAKE_GDA_THRESHOLD,
 =09=09=09=09   DEFAULT_IWAKE_THRESHOLD);
 =09=09/* calculate number of pages that will be filled in 10 usec */
 =09=09page_num =3D (DEFAULT_MEM_OPEN_TIME * isys_pb_datarate_mbs) /
@@ -565,10 +630,11 @@ void update_watermark_setting(struct ipu6_isys *isys)
 =09=09mem_open_threshold =3D isys->pdata->ipdata->memopen_threshold;
 =09=09mem_open_threshold =3D max_t(u32, mem_open_threshold, page_num);
 =09=09dev_dbg(dev, "mem_open_threshold: %u\n", mem_open_threshold);
-=09=09set_iwake_register(isys, GDA_MEMOPEN_THRESHOLD_INDEX,
+=09=09set_iwake_register(isys,
+=09=09=09=09   IPU6_ISYS_IWAKE_GDA_MEMOPEN_THRESHOLD,
 =09=09=09=09   mem_open_threshold);
 =09} else {
-=09=09set_iwake_register(isys, GDA_IWAKE_THRESHOLD_INDEX,
+=09=09set_iwake_register(isys, IPU6_ISYS_IWAKE_GDA_THRESHOLD,
 =09=09=09=09   iwake_threshold);
 =09}
=20
@@ -578,7 +644,8 @@ void update_watermark_setting(struct ipu6_isys *isys)
 =09dev_dbg(dev, "threshold: %u critical: %u\n", iwake_threshold,
 =09=09iwake_critical_threshold);
=20
-=09set_iwake_register(isys, GDA_IRQ_CRITICAL_THRESHOLD_INDEX,
+=09set_iwake_register(isys,
+=09=09=09   IPU6_ISYS_IWAKE_GDA_IRQ_CRITICAL_THRESHOLD,
 =09=09=09   iwake_critical_threshold);
=20
 =09writel(VAL_PKGC_PMON_CFG_RESET,
@@ -624,10 +691,11 @@ static int isys_notifier_bound(struct v4l2_async_noti=
fier *notifier,
 =09=09container_of(asc, struct sensor_async_sd, asc);
 =09int ret;
=20
-=09if (s_asd->csi2.port >=3D isys->pdata->ipdata->csi2.nports) {
+=09ret =3D ipu6_isys_csi2_fw_port_to_index(isys, s_asd->csi2.port);
+=09if (ret < 0) {
 =09=09dev_err(&isys->adev->auxdev.dev, "invalid csi2 port %u\n",
 =09=09=09s_asd->csi2.port);
-=09=09return -EINVAL;
+=09=09return ret;
 =09}
=20
 =09ret =3D ipu_bridge_instantiate_vcm(sd->dev);
@@ -987,6 +1055,7 @@ void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, struc=
t isys_fw_msgs *msg)
 }
=20
 static const struct ipu6_auxdrv_data ipu6_isys_auxdrv_data;
+static const struct ipu6_auxdrv_data ipu4p_isys_auxdrv_data;
 static const struct ipu6_auxdrv_data ipu7_isys_auxdrv_data;
=20
 static int isys_probe(struct auxiliary_device *auxdev,
@@ -1006,8 +1075,12 @@ static int isys_probe(struct auxiliary_device *auxde=
v,
 =09if (!isys)
 =09=09return -ENOMEM;
=20
-=09adev->auxdrv_data =3D IS_IPU7(isp) ? &ipu7_isys_auxdrv_data :
-=09=09=09=09=09   &ipu6_isys_auxdrv_data;
+=09if (IS_IPU7(isp))
+=09=09adev->auxdrv_data =3D &ipu7_isys_auxdrv_data;
+=09else if (IS_IPU4P(isp))
+=09=09adev->auxdrv_data =3D &ipu4p_isys_auxdrv_data;
+=09else
+=09=09adev->auxdrv_data =3D &ipu6_isys_auxdrv_data;
 =09adev->auxdrv =3D to_auxiliary_drv(auxdev->dev.driver);
 =09isys->adev =3D adev;
 =09isys->pdata =3D adev->pdata;
@@ -1103,6 +1176,13 @@ static const struct ipu6_auxdrv_data ipu6_isys_auxdr=
v_data =3D {
 =09.fw_ops =3D &ipu6_fw_isys_ops,
 };
=20
+static const struct ipu6_auxdrv_data ipu4p_isys_auxdrv_data =3D {
+=09.isr =3D ipu6_isys_isr,
+=09.isr_threaded =3D NULL,
+=09.wake_isr_thread =3D false,
+=09.fw_ops =3D &ipu4p_fw_isys_ops,
+};
+
 static const struct ipu6_auxdrv_data ipu7_isys_auxdrv_data =3D {
 =09.isr =3D ipu7_isys_isr,
 =09.isr_threaded =3D NULL,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/i=
ntel/ipu6/ipu6-isys.h
index 7d652a06837d..775b85396e6f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -57,6 +57,11 @@ struct ipu6_bus_device;
 #define IPU6_MAX_SRAM_SIZE=09=09=09(200 << 10)
 /* IS pixel buffer is 128KB, MaxSRAMSize is 96KB on IPU6SE */
 #define IPU6SE_MAX_SRAM_SIZE=09=09=09(96 << 10)
+/* IPU4P has 128 physical GDA pages of 1 KiB each. */
+#define IPU4P_SRAM_GRANULARITY_SHIFT=0910
+#define IPU4P_SRAM_GRANULARITY_SIZE=091024
+/* Use the 96 KiB usable size for a 128 KiB buffer, as on IPU6SE. */
+#define IPU4P_MAX_SRAM_SIZE=09=09=09(96 << 10)
=20
 #define IPU6EP_LTR_VALUE=09=09=09200
 #define IPU6EP_MIN_MEMOPEN_TH=09=09=090x4
@@ -169,6 +174,13 @@ struct ipu6_isys {
 =09struct isys_iwake_watermark iwake_watermark;
 };
=20
+enum ipu6_isys_iwake_register {
+=09IPU6_ISYS_IWAKE_GDA_IRQ_CRITICAL_THRESHOLD,
+=09IPU6_ISYS_IWAKE_GDA_THRESHOLD,
+=09IPU6_ISYS_IWAKE_GDA_ENABLE,
+=09IPU6_ISYS_IWAKE_GDA_MEMOPEN_THRESHOLD,
+};
+
 struct isys_fw_msgs {
 =09union {
 =09=09u64 dummy;
@@ -193,6 +205,9 @@ struct ipu6_fw_isys_ops {
 =09int (*init)(struct ipu6_isys *isys, unsigned int num_streams);
 =09int (*close)(struct ipu6_isys *isys);
 =09int (*isr_one)(struct ipu6_bus_device *adev);
+=09/* Optional; NULL uses the IPU6 proxy-region mapping. */
+=09int (*set_iwake_register)(struct ipu6_isys *isys,
+=09=09=09=09  enum ipu6_isys_iwake_register reg, u32 value);
 =09int (*send_cmd)(struct ipu6_isys *isys,
 =09=09=09const unsigned int stream_handle,
 =09=09=09void *cpu_mapped_buf,
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/=
ipu6/ipu6.c
index 789477e3829b..417978bef3f7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -399,6 +399,13 @@ static void ipu6_internal_pdata_init(struct ipu6_devic=
e *isp)
 =09}
=20
 =09if (IS_IPU4P(isp)) {
+=09=09isys_ipdata.num_parallel_streams =3D IPU4P_ISYS_MAX_STREAMS;
+=09=09isys_ipdata.max_streams =3D IPU4P_ISYS_MAX_STREAMS;
+=09=09isys_ipdata.sram_gran_shift =3D IPU4P_SRAM_GRANULARITY_SHIFT;
+=09=09isys_ipdata.sram_gran_size =3D IPU4P_SRAM_GRANULARITY_SIZE;
+=09=09isys_ipdata.max_sram_size =3D IPU4P_MAX_SRAM_SIZE;
+=09=09isys_ipdata.max_sram_blocks =3D IPU4P_NOF_SRAM_BLOCKS_MAX;
+=09=09isys_ipdata.max_devq_size =3D IPU4P_DEV_SEND_QUEUE_SIZE;
 =09=09isys_ipdata.hw_variant.offset =3D IPU4P_ISYS_OFFSET;
 =09=09isys_ipdata.hw_variant.spc_offset =3D IPU4P_ISYS_SPC_OFFSET;
 =09=09isys_ipdata.hw_variant.dmem_offset =3D IPU4P_ISYS_DMEM_OFFSET;
--=20
2.55.0


