Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450137;
	b=4KG4bBrXXDdCJS56DdE44jGppH7LPTgmDvzwgHZzwaWhgHKEm5jya9mQsYrpQsqkYuq7
	 J5bElZ9NzwC/2XYPiTM16c1bW5RkkJQ3NnbidN6uCQZSz/1PuzzLyi8t2JqszAzs8/XLh
	 2ns22ura3jyPGTAODEWsHSzMveQ+WlC+vkU1geLOenQk8VJXn4fnBezLRXl5xyUgwS3qg
	 9LXNatZI2XfhwTZEFYgr69YgES931foYOKOdxGC5sreW0+Nxhzr5pYmYB8af4I/TqEgE8
	 B49VfWLQuJuM/kgq7rMuQSp9TGCxhNcvTxDQimAOcmsI//zPweyr2XePJLakA3VJGBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450137;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=36fvGZ5MBP5w76aYINjGhSirzPv9bE/OTOP888gZ8aM=;
	b=y05x3Uu1fi1nGvB2Fv/8PpC/2ITkH5gr9eU0EuVSsxWo1oasPrjuZWvqlwoUntHg47LE
	 Dl6IxsO+u0NzwqjY4DpN01VeEMI1/d3u6oPhpD+PYMtgwGQehBHJRVfeUJgH8NBv1zk8+
	 pQK8C2z6kEhrs2NRXmbaGjYIxap4iGEp5U0aNLECVEgbbpasP3omBt6e+yn42QUN4x6H3
	 uj8ZRl2fUKZWKeH0zWxl2uI59vRR2hOshKgHHcgX7PmWZ6iMw7Y+dpZepo8kA7BaPQLC8
	 UskRQixfwdmcU1Fv7rp7do5cuKOOFx22O+kWWsa+P6f/CQvneVmeo/1w6yoxlP6A5NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=37ztfjyu4za6dgi4ubb7nn6dfy.protonmail2 header.b=ZVRK7SWi;
	arc=none smtp.remote-ip=79.135.106.98
Received: from mail-10698.protonmail.ch (mail-10698.protonmail.ch [79.135.106.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96FF606A31A
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 12:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E96FF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=37ztfjyu4za6dgi4ubb7nn6dfy.protonmail2 header.b=ZVRK7SWi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=37ztfjyu4za6dgi4ubb7nn6dfy.protonmail2; t=1793450129;
	x=1793709329; bh=36fvGZ5MBP5w76aYINjGhSirzPv9bE/OTOP888gZ8aM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ZVRK7SWi7dfHfvToZH9hsUVBO4ddlU4siaKY9GPe3cYGnkqj3dWS+O+2BU9BCDM9W
	 B/CAByDwYV3QOpA/gjiiJQ5Ax2CHvtMg/UWqMre48xCCtJMEA4RrrnfW7TbraQit0V
	 YYt8iYnuaoFwz3ZMLw9ios66DWXlaa+e0JL2jfTcZDqxl0xv0R3rIc9EMWxGdkCbAv
	 b2vOHFLnSaDWPtKRU1GMixD32wpHrCmtOQmRYUEqSH/vZio3NjZ38TFXUwdW7AMGJJ
	 YrjI+CRwWok9ygBtm2NDp2aF+WGa9QPbVHDddv4/RlhK0zsBaAYJ2do3o/90knuWFK
	 VLqPGCKgVlUvQ==
Date: Sat, 31 Oct 2026 12:35:24 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: [RFC PATCH v2 07/12] media: ipu6: Add IPU4P ISYS firmware operations
Message-ID: <Jmj6noRGE-pr4vr97B1H6Qt2u2m3wHDQvZF0tOg9fMulZS1SrNHgIFVW-y2bx0wwnnd6FHLIL1oaKmJ9_57yTU_pedSW_Ni9-R8IJUqaoek=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 1d2594039cace8229e4fefe5b065327b0974b0e9
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add IPU4P-specific ISYS operations for queue setup, stream
configuration, buffer submission and response handling.

Adapt the common ISYS code to IPU4P's stream limits, CSI port mapping
and IWAKE proxy controls.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 drivers/media/pci/intel/ipu6/Makefile         |   1 +
 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c  | 880 ++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h  |   7 +
 drivers/media/pci/intel/ipu6/ipu6-bus.h       |   1 +
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   |   9 +
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  21 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  36 +-
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  12 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 126 ++-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  27 +
 drivers/media/pci/intel/ipu6/ipu6.c           |   8 +
 11 files changed, 1090 insertions(+), 38 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c

diff --git a/drivers/media/pci/intel/ipu6/Makefile b/drivers/media/pci/inte=
l/ipu6/Makefile
index 676bc978b97..54fca25785a 100644
--- a/drivers/media/pci/intel/ipu6/Makefile
+++ b/drivers/media/pci/intel/ipu6/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_VIDEO_INTEL_IPU6)=09+=3D intel-ipu6.o
=20
 intel-ipu6-isys-y=09=09:=3D ipu6-isys.o \
 =09=09=09=09ipu6-isys-csi2.o \
+=09=09=09=09ipu4p-fw-isys.o \
 =09=09=09=09ipu6-fw-isys.o \
 =09=09=09=09ipu7-fw-isys.o \
 =09=09=09=09ipu6-isys-video.o \
diff --git a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c b/drivers/media/p=
ci/intel/ipu6/ipu4p-fw-isys.c
new file mode 100644
index 00000000000..2c0b08ecaf8
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c
@@ -0,0 +1,880 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Intel Corporation
+ */
+
+#include <linux/atomic.h>
+#include <linux/bits.h>
+#include <linux/bug.h>
+#include <linux/cacheflush.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/minmax.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include "ipu6-bus.h"
+#include "ipu6-fw-com.h"
+#include "ipu6-isys.h"
+#include "ipu6-isys-queue.h"
+#include "ipu6-isys-subdev.h"
+#include "ipu4p-fw-isys.h"
+#include "ipu6-platform-regs.h"
+
+static const char send_msg_types[N_IPU4P_FW_ISYS_SEND_TYPE][32] =3D {
+=09"STREAM_OPEN",
+=09"STREAM_START",
+=09"STREAM_START_AND_CAPTURE",
+=09"STREAM_CAPTURE",
+=09"STREAM_STOP",
+=09"STREAM_FLUSH",
+=09"STREAM_CLOSE",
+};
+
+static int ipu4p_fw_isys_send_cmd(struct ipu6_isys *isys,
+=09=09=09=09  const unsigned int stream_handle,
+=09=09=09=09  void *cpu_mapped_buf,
+=09=09=09=09  dma_addr_t dma_mapped_buf,
+=09=09=09=09  size_t size, u16 send_type)
+{
+=09struct ipu4p_fw_isys_send_token *token;
+=09struct device *dev =3D &isys->adev->auxdev.dev;
+
+=09if (send_type >=3D N_IPU4P_FW_ISYS_SEND_TYPE ||
+=09    stream_handle >=3D IPU4P_ISYS_MAX_STREAMS)
+=09=09return -EINVAL;
+
+=09if (upper_32_bits(dma_mapped_buf))
+=09=09return -ERANGE;
+
+=09dev_dbg(dev, "send_token: %s\n", send_msg_types[send_type]);
+
+=09if (cpu_mapped_buf)
+=09=09clflush_cache_range(cpu_mapped_buf, size);
+
+=09token =3D ipu6_send_get_token(isys->fwctx,
+=09=09=09=09    stream_handle + IPU4P_BASE_MSG_SEND_QUEUES);
+=09if (!token)
+=09=09return -EBUSY;
+
+=09token->payload =3D lower_32_bits(dma_mapped_buf);
+=09token->buf_handle =3D (unsigned long)cpu_mapped_buf;
+=09token->send_type =3D send_type;
+=09token->stream_id =3D stream_handle;
+
+=09ipu6_send_put_token(isys->fwctx,
+=09=09=09    stream_handle + IPU4P_BASE_MSG_SEND_QUEUES);
+
+=09return 0;
+}
+
+static int ipu4p_fw_isys_close(struct ipu6_isys *isys)
+{
+=09struct device *dev =3D &isys->adev->auxdev.dev;
+=09int retry =3D IPU4P_ISYS_CLOSE_RETRY;
+=09void *fwctx;
+=09int ret;
+
+=09if (!isys->fwctx)
+=09=09return 0;
+
+=09ret =3D ipu6_fw_com_close(isys->fwctx);
+=09fwctx =3D isys->fwctx;
+=09isys->fwctx =3D NULL;
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
+=09=09dev_err(dev, "Device release timed out: %d\n", ret);
+=09=09isys->fwctx =3D fwctx;
+=09}
+
+=09return ret;
+}
+
+static void ipu4p_fw_isys_cleanup(struct ipu6_isys *isys)
+{
+=09int ret;
+
+=09if (!isys->fwctx)
+=09=09return;
+
+=09ret =3D ipu6_fw_com_release(isys->fwctx, 1);
+=09if (ret < 0)
+=09=09dev_warn(&isys->adev->auxdev.dev,
+=09=09=09 "Device busy, firmware communication release failed\n");
+
+=09isys->fwctx =3D NULL;
+}
+
+static void ipu4p_fw_isys_start_sp(struct ipu6_bus_device *adev)
+{
+=09struct ipu6_isys *isys =3D ipu6_bus_get_drvdata(adev);
+=09void __iomem *spc_regs_base =3D isys->pdata->base +
+=09=09isys->pdata->ipdata->hw_variant.spc_offset;
+=09u32 val;
+
+=09val =3D IPU6_ISYS_SPC_STATUS_START | IPU6_ISYS_SPC_STATUS_RUN |
+=09      IPU6_ISYS_SPC_STATUS_CTRL_ICACHE_INVALIDATE;
+=09if (isys->icache_prefetch)
+=09=09val |=3D IPU6_ISYS_SPC_STATUS_ICACHE_PREFETCH;
+
+=09writel(val, spc_regs_base + IPU6_ISYS_REG_SPC_STATUS_CTRL);
+}
+
+static int ipu4p_fw_isys_query_sp(struct ipu6_bus_device *adev)
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
+static int
+ipu4p_fw_isys_fwcom_cfg_init(struct ipu6_isys *isys,
+=09=09=09     struct ipu6_fw_com_cfg *fwcom_cfg,
+=09=09=09     unsigned int num_streams)
+{
+=09unsigned int max_send_queues, max_sram_blocks, max_devq_size;
+=09struct ipu6_fw_syscom_queue_config *input_queue_cfg;
+=09struct ipu6_fw_syscom_queue_config *output_queue_cfg;
+=09struct ipu4p_fw_isys_fw_config *isys_fw_cfg;
+=09unsigned int num_message_queues;
+=09unsigned int max_streams;
+=09unsigned int i;
+
+=09max_streams =3D min_t(unsigned int, isys->pdata->ipdata->max_streams,
+=09=09=09    IPU4P_ISYS_MAX_STREAMS);
+=09max_send_queues =3D isys->pdata->ipdata->max_send_queues;
+=09max_sram_blocks =3D min_t(unsigned int,
+=09=09=09=09isys->pdata->ipdata->max_sram_blocks,
+=09=09=09=09IPU4P_NOF_SRAM_BLOCKS_MAX);
+=09max_devq_size =3D isys->pdata->ipdata->max_devq_size;
+=09if (!max_streams || !max_sram_blocks)
+=09=09return -EINVAL;
+
+=09max_streams =3D min(max_streams, max_sram_blocks);
+=09if (max_send_queues < IPU4P_BASE_MSG_SEND_QUEUES + max_streams)
+=09=09return -EINVAL;
+
+=09num_message_queues =3D clamp(num_streams, 1U, max_streams);
+
+=09isys_fw_cfg =3D kzalloc_obj(*isys_fw_cfg);
+=09if (!isys_fw_cfg)
+=09=09return -ENOMEM;
+
+=09input_queue_cfg =3D kzalloc_objs(*input_queue_cfg, max_send_queues);
+=09if (!input_queue_cfg)
+=09=09goto err_free_fw_cfg;
+
+=09output_queue_cfg =3D kzalloc_objs(*output_queue_cfg,
+=09=09=09=09=09IPU4P_N_MAX_RECV_QUEUES);
+=09if (!output_queue_cfg)
+=09=09goto err_free_input_queue_cfg;
+
+=09isys_fw_cfg->num_send_queues[IPU4P_FW_ISYS_QUEUE_TYPE_PROXY] =3D
+=09=09IPU4P_N_MAX_PROXY_SEND_QUEUES;
+=09isys_fw_cfg->num_send_queues[IPU4P_FW_ISYS_QUEUE_TYPE_DEV] =3D
+=09=09IPU4P_N_MAX_DEV_SEND_QUEUES;
+=09isys_fw_cfg->num_send_queues[IPU4P_FW_ISYS_QUEUE_TYPE_MSG] =3D
+=09=09num_message_queues;
+=09isys_fw_cfg->num_recv_queues[IPU4P_FW_ISYS_QUEUE_TYPE_PROXY] =3D
+=09=09IPU4P_N_MAX_PROXY_RECV_QUEUES;
+=09isys_fw_cfg->num_recv_queues[IPU4P_FW_ISYS_QUEUE_TYPE_DEV] =3D 0;
+=09isys_fw_cfg->num_recv_queues[IPU4P_FW_ISYS_QUEUE_TYPE_MSG] =3D
+=09=09IPU4P_N_MAX_RECV_QUEUES - IPU4P_N_MAX_PROXY_RECV_QUEUES;
+
+=09/*
+=09 * The GDA has 128 physical pages and a virtualization factor of 32.
+=09 * Partition the virtual pages evenly across the message queues.
+=09 */
+=09for (i =3D 0; i < max_sram_blocks; i++) {
+=09=09if (i < num_message_queues)
+=09=09=09isys_fw_cfg->buffer_partition.num_gda_pages[i] =3D
+=09=09=09=09(IPU4P_DEVICE_GDA_NR_PAGES *
+=09=09=09=09 IPU4P_DEVICE_GDA_VIRT_FACTOR) /
+=09=09=09=09num_message_queues;
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
+=09input_queue_cfg[IPU4P_BASE_DEV_SEND_QUEUES].queue_size =3D max_devq_siz=
e;
+
+=09for (i =3D 0; i < num_message_queues; i++) {
+=09=09unsigned int queue =3D IPU4P_BASE_MSG_SEND_QUEUES + i;
+
+=09=09input_queue_cfg[queue].token_size =3D
+=09=09=09sizeof(struct ipu4p_fw_isys_send_token);
+=09=09input_queue_cfg[queue].queue_size =3D IPU4P_ISYS_SIZE_SEND_QUEUE;
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
+=09fwcom_cfg->num_input_queues =3D
+=09=09isys_fw_cfg->num_send_queues[IPU4P_FW_ISYS_QUEUE_TYPE_PROXY] +
+=09=09isys_fw_cfg->num_send_queues[IPU4P_FW_ISYS_QUEUE_TYPE_DEV] +
+=09=09isys_fw_cfg->num_send_queues[IPU4P_FW_ISYS_QUEUE_TYPE_MSG];
+=09fwcom_cfg->num_output_queues =3D
+=09=09isys_fw_cfg->num_recv_queues[IPU4P_FW_ISYS_QUEUE_TYPE_PROXY] +
+=09=09isys_fw_cfg->num_recv_queues[IPU4P_FW_ISYS_QUEUE_TYPE_DEV] +
+=09=09isys_fw_cfg->num_recv_queues[IPU4P_FW_ISYS_QUEUE_TYPE_MSG];
+=09fwcom_cfg->input =3D input_queue_cfg;
+=09fwcom_cfg->output =3D output_queue_cfg;
+=09fwcom_cfg->dmem_addr =3D isys->pdata->ipdata->hw_variant.dmem_offset;
+=09fwcom_cfg->specific_addr =3D isys_fw_cfg;
+=09fwcom_cfg->specific_size =3D sizeof(*isys_fw_cfg);
+=09fwcom_cfg->dmem_syscom =3D true;
+
+=09return 0;
+
+err_free_input_queue_cfg:
+=09kfree(input_queue_cfg);
+err_free_fw_cfg:
+=09kfree(isys_fw_cfg);
+
+=09return -ENOMEM;
+}
+
+static void ipu4p_fw_isys_fwcom_cfg_free(struct ipu6_fw_com_cfg *fwcom_cfg=
)
+{
+=09kfree(fwcom_cfg->specific_addr);
+=09kfree(fwcom_cfg->output);
+=09kfree(fwcom_cfg->input);
+}
+
+static int ipu4p_fw_isys_init(struct ipu6_isys *isys,
+=09=09=09      unsigned int num_streams)
+{
+=09struct device *dev =3D &isys->adev->auxdev.dev;
+=09struct ipu6_fw_com_cfg fwcom_cfg =3D {
+=09=09.cell_start =3D ipu4p_fw_isys_start_sp,
+=09=09.cell_ready =3D ipu4p_fw_isys_query_sp,
+=09};
+=09int retry =3D IPU4P_ISYS_OPEN_RETRY;
+=09int ret;
+
+=09ret =3D ipu4p_fw_isys_fwcom_cfg_init(isys, &fwcom_cfg, num_streams);
+=09if (ret)
+=09=09return ret;
+
+=09isys->fwctx =3D ipu6_fw_com_prepare(&fwcom_cfg, isys->adev,
+=09=09=09=09=09  isys->pdata->base);
+=09ipu4p_fw_isys_fwcom_cfg_free(&fwcom_cfg);
+=09if (!isys->fwctx) {
+=09=09dev_err(dev, "ISYS firmware communication prepare failed\n");
+=09=09return -EIO;
+=09}
+
+=09ret =3D ipu6_fw_com_open(isys->fwctx);
+=09if (ret) {
+=09=09dev_err(dev, "ISYS firmware communication open failed: %d\n",
+=09=09=09ret);
+=09=09ipu4p_fw_isys_cleanup(isys);
+=09=09return ret;
+=09}
+
+=09do {
+=09=09usleep_range(400, 500);
+=09=09if (ipu6_fw_com_ready(isys->fwctx))
+=09=09=09return 0;
+=09=09retry--;
+=09} while (retry);
+
+=09dev_err(dev, "ISYS firmware failed to become ready\n");
+=09ipu4p_fw_isys_close(isys);
+
+=09return -EIO;
+}
+
+static void
+ipu4p_fw_isys_dump_stream_cfg(struct device *dev, struct isys_fw_msgs *msg=
)
+{
+=09const struct ipu4p_fw_isys_stream_cfg *cfg =3D &msg->ipu4p.stream;
+=09unsigned int i;
+
+=09dev_dbg(dev, "IPU4P stream config: source %u, VC %u, input pins %u, out=
put pins %u\n",
+=09=09cfg->src, cfg->vc, cfg->nof_input_pins, cfg->nof_output_pins);
+
+=09for (i =3D 0; i < cfg->nof_input_pins; i++) {
+=09=09const struct ipu4p_fw_isys_input_pin_info *pin =3D
+=09=09=09&cfg->input_pins[i];
+
+=09=09dev_dbg(dev, "input pin %u: %ux%u, DT 0x%x, bpp %u, mapped DT 0x%x\n=
",
+=09=09=09i, pin->input_res.width, pin->input_res.height,
+=09=09=09pin->dt, pin->bits_per_pix, pin->mapped_dt);
+=09}
+
+=09for (i =3D 0; i < cfg->nof_output_pins; i++) {
+=09=09const struct ipu4p_fw_isys_output_pin_info *pin =3D
+=09=09=09&cfg->output_pins[i];
+
+=09=09dev_dbg(dev, "output pin %u: %ux%u, stride %u, format %u, type %u\n"=
,
+=09=09=09i, pin->output_res.width, pin->output_res.height,
+=09=09=09pin->stride, pin->ft, pin->pt);
+=09}
+}
+
+static void
+ipu4p_fw_isys_dump_frame_buf_set(struct device *dev,
+=09=09=09=09 struct isys_fw_msgs *msg,
+=09=09=09=09 unsigned int outputs)
+{
+=09const struct ipu4p_fw_isys_frame_buff_set *set =3D &msg->ipu4p.frame;
+=09unsigned int i;
+
+=09for (i =3D 0; i < outputs; i++) {
+=09=09const struct ipu4p_fw_isys_output_pin_payload *pin =3D
+=09=09=09&set->output_pins[i];
+
+=09=09dev_dbg(dev, "output pin %u: buffer ID 0x%llx, address 0x%x\n",
+=09=09=09i, (unsigned long long)pin->out_buf_id, pin->addr);
+=09}
+}
+
+static int ipu4p_fw_isys_resp_type_to_ipu6(unsigned int type)
+{
+=09switch (type) {
+=09case IPU4P_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE:
+=09=09return IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE;
+=09case IPU4P_FW_ISYS_RESP_TYPE_STREAM_START_ACK:
+=09=09return IPU6_FW_ISYS_RESP_TYPE_STREAM_START_ACK;
+=09case IPU4P_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK:
+=09=09return IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK;
+=09case IPU4P_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_ACK:
+=09=09return IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_ACK;
+=09case IPU4P_FW_ISYS_RESP_TYPE_STREAM_STOP_ACK:
+=09=09return IPU6_FW_ISYS_RESP_TYPE_STREAM_STOP_ACK;
+=09case IPU4P_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK:
+=09=09return IPU6_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK;
+=09case IPU4P_FW_ISYS_RESP_TYPE_STREAM_CLOSE_ACK:
+=09=09return IPU6_FW_ISYS_RESP_TYPE_STREAM_CLOSE_ACK;
+=09case IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_READY:
+=09=09return IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_READY;
+=09case IPU4P_FW_ISYS_RESP_TYPE_FRAME_SOF:
+=09=09return IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF;
+=09case IPU4P_FW_ISYS_RESP_TYPE_FRAME_EOF:
+=09=09return IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF;
+=09case IPU4P_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE:
+=09=09return IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE;
+=09case IPU4P_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE:
+=09=09return IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE;
+=09case IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_SKIPPED:
+=09=09return IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_SKIPPED;
+=09case IPU4P_FW_ISYS_RESP_TYPE_STATS_DATA_READY:
+=09=09return IPU6_FW_ISYS_RESP_TYPE_STATS_DATA_READY;
+=09case IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_WATERMARK:
+=09case IPU4P_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_SKIPPED:
+=09case IPU4P_FW_ISYS_RESP_TYPE_FRAME_SOF_DISCARDED:
+=09case IPU4P_FW_ISYS_RESP_TYPE_FRAME_EOF_DISCARDED:
+=09=09return -EOPNOTSUPP;
+=09default:
+=09=09return -EINVAL;
+=09}
+}
+
+/*
+ * Resolve each pin response by stream, frame counter and echoed handle wh=
en
+ * present. Clear each output-pin bit exactly once so duplicate responses
+ * cannot release a frame message before all buffers have completed. Never
+ * dereference a firmware-provided value as a pointer.
+ */
+static bool
+ipu4p_fw_isys_complete_pin_response(struct ipu6_isys *isys,
+=09=09=09=09    const struct ipu4p_fw_isys_resp_info *resp)
+{
+=09struct isys_fw_msgs *msg;
+=09unsigned long flags;
+=09u64 handle =3D resp->pin.out_buf_id;
+=09u8 pin_mask;
+=09bool found =3D false;
+
+=09if (resp->pin_id >=3D IPU4P_MAX_OPINS)
+=09=09return false;
+
+=09pin_mask =3D BIT(resp->pin_id);
+=09spin_lock_irqsave(&isys->listlock, flags);
+=09list_for_each_entry(msg, &isys->framebuflist_fw, head) {
+=09=09if (!msg->ipu4p_is_frame ||
+=09=09    msg->ipu4p_stream_handle !=3D resp->stream_handle ||
+=09=09    msg->ipu4p_frame_counter !=3D resp->frame_counter ||
+=09=09    (handle && handle !=3D (u64)(uintptr_t)&msg->ipu4p.frame))
+=09=09=09continue;
+=09=09if (!(msg->ipu4p_pending_pin_mask & pin_mask))
+=09=09=09break;
+
+=09=09msg->ipu4p_pending_pin_mask &=3D ~pin_mask;
+=09=09if (!msg->ipu4p_pending_pin_mask)
+=09=09=09list_move(&msg->head, &isys->framebuflist);
+=09=09found =3D true;
+=09=09break;
+=09}
+=09spin_unlock_irqrestore(&isys->listlock, flags);
+
+=09return found;
+}
+
+/*
+ * A skipped capture has no PIN_DATA_READY response. Copy the output addre=
sses
+ * before releasing the frame set, then complete those buffers as skipped.
+ */
+static bool
+ipu4p_fw_isys_complete_skipped_frame(struct ipu6_isys *isys,
+=09=09=09=09     unsigned int stream_handle,
+=09=09=09=09     unsigned int frame_counter,
+=09=09=09=09     u32 addrs[IPU4P_MAX_OPINS],
+=09=09=09=09     u8 *pending_pin_mask)
+{
+=09struct isys_fw_msgs *msg;
+=09unsigned long flags;
+=09bool found =3D false;
+=09unsigned int i;
+
+=09*pending_pin_mask =3D 0;
+=09spin_lock_irqsave(&isys->listlock, flags);
+=09list_for_each_entry(msg, &isys->framebuflist_fw, head) {
+=09=09if (!msg->ipu4p_is_frame ||
+=09=09    msg->ipu4p_stream_handle !=3D stream_handle ||
+=09=09    msg->ipu4p_frame_counter !=3D frame_counter)
+=09=09=09continue;
+
+=09=09*pending_pin_mask =3D msg->ipu4p_pending_pin_mask;
+=09=09for (i =3D 0; i < IPU4P_MAX_OPINS; i++) {
+=09=09=09if (*pending_pin_mask & BIT(i))
+=09=09=09=09addrs[i] =3D msg->ipu4p.frame.output_pins[i].addr;
+=09=09}
+
+=09=09msg->ipu4p_pending_pin_mask =3D 0;
+=09=09list_move(&msg->head, &isys->framebuflist);
+=09=09found =3D true;
+=09=09break;
+=09}
+=09spin_unlock_irqrestore(&isys->listlock, flags);
+
+=09return found;
+}
+
+static int ipu4p_fw_isys_send_proxy_token(struct ipu6_isys *isys,
+=09=09=09=09=09  unsigned int req_id,
+=09=09=09=09=09  unsigned int region_index,
+=09=09=09=09=09  u32 value)
+{
+=09struct ipu6_fw_com_context *ctx =3D isys->fwctx;
+=09struct ipu4p_fw_isys_proxy_send_token *send_token;
+=09unsigned int timeout =3D 1000;
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
+=09=09int ret;
+
+=09=09usleep_range(100, 110);
+=09=09recv_token =3D ipu6_recv_get_token(ctx,
+=09=09=09=09=09=09 IPU4P_BASE_PROXY_RECV_QUEUES);
+=09=09if (!recv_token)
+=09=09=09continue;
+
+=09=09if (recv_token->proxy_resp_info.request_id !=3D req_id)
+=09=09=09ret =3D -EIO;
+=09=09else if (recv_token->proxy_resp_info.error_info.error)
+=09=09=09ret =3D -EIO;
+=09=09else
+=09=09=09ret =3D 0;
+
+=09=09ipu6_recv_put_token(ctx, IPU4P_BASE_PROXY_RECV_QUEUES);
+=09=09return ret;
+=09} while (--timeout);
+
+=09return -ETIMEDOUT;
+}
+
+static int
+ipu4p_fw_isys_set_iwake_register(struct ipu6_isys *isys,
+=09=09=09=09 enum ipu6_isys_iwake_register reg, u32 value)
+{
+=09switch (reg) {
+=09case IPU6_ISYS_IWAKE_GDA_THRESHOLD:
+=09=09return ipu4p_fw_isys_send_proxy_token(isys, 0, 0, value);
+=09case IPU6_ISYS_IWAKE_GDA_ENABLE:
+=09=09return ipu4p_fw_isys_send_proxy_token(isys, 1, 1, value);
+=09case IPU6_ISYS_IWAKE_GDA_IRQ_CRITICAL_THRESHOLD:
+=09case IPU6_ISYS_IWAKE_GDA_MEMOPEN_THRESHOLD:
+=09=09return -EOPNOTSUPP;
+=09default:
+=09=09return -EINVAL;
+=09}
+}
+
+static int ipu4p_fw_isys_isr_one(struct ipu6_bus_device *adev)
+{
+=09struct ipu6_isys *isys =3D ipu6_bus_get_drvdata(adev);
+=09struct device *dev =3D &adev->auxdev.dev;
+=09struct ipu4p_fw_isys_recv_token *token;
+=09struct ipu4p_fw_isys_resp_info *fw_resp;
+=09struct ipu6_fw_isys_resp_info_abi resp =3D {};
+=09int type;
+
+=09if (!isys->fwctx)
+=09=09return 1;
+
+=09token =3D ipu6_recv_get_token(isys->fwctx, IPU4P_BASE_MSG_RECV_QUEUES);
+=09if (!token)
+=09=09return 1;
+
+=09fw_resp =3D &token->resp_info;
+=09if (fw_resp->type >=3D N_IPU4P_FW_ISYS_RESP_TYPE) {
+=09=09dev_err(dev, "Unknown IPU4P response type %u stream %u\n",
+=09=09=09fw_resp->type, fw_resp->stream_handle);
+=09=09goto out;
+=09}
+
+=09switch (fw_resp->type) {
+=09case IPU4P_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_SKIPPED: {
+=09=09u32 addrs[IPU4P_MAX_OPINS] =3D {};
+=09=09u8 pending_pin_mask;
+=09=09unsigned int i;
+
+=09=09if (!ipu4p_fw_isys_complete_skipped_frame(isys,
+=09=09=09=09=09=09=09  fw_resp->stream_handle,
+=09=09=09=09=09=09=09  fw_resp->frame_counter,
+=09=09=09=09=09=09=09  addrs, &pending_pin_mask)) {
+=09=09=09dev_dbg(dev, "No in-flight frame set for skipped stream %u frame =
%u\n",
+=09=09=09=09fw_resp->stream_handle, fw_resp->frame_counter);
+=09=09=09goto out;
+=09=09}
+
+=09=09for (i =3D 0; i < IPU4P_MAX_OPINS; i++) {
+=09=09=09struct ipu6_fw_isys_resp_info_abi skipped =3D {};
+
+=09=09=09if (!(pending_pin_mask & BIT(i)))
+=09=09=09=09continue;
+
+=09=09=09skipped.timestamp[0] =3D fw_resp->timestamp[0];
+=09=09=09skipped.timestamp[1] =3D fw_resp->timestamp[1];
+=09=09=09skipped.stream_handle =3D fw_resp->stream_handle;
+=09=09=09skipped.type =3D IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_SKIPPED;
+=09=09=09skipped.pin_id =3D i;
+=09=09=09skipped.pin.addr =3D addrs[i];
+=09=09=09ipu6_isys_handle_response(adev, &skipped, false);
+=09=09}
+=09=09goto out;
+=09}
+=09case IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_SKIPPED:
+=09=09if (!ipu4p_fw_isys_complete_pin_response(isys, fw_resp)) {
+=09=09=09dev_dbg(dev, "No in-flight pin set for stream %u frame %u\n",
+=09=09=09=09fw_resp->stream_handle, fw_resp->frame_counter);
+=09=09=09goto out;
+=09=09}
+=09=09break;
+=09case IPU4P_FW_ISYS_RESP_TYPE_FRAME_SOF_DISCARDED:
+=09case IPU4P_FW_ISYS_RESP_TYPE_FRAME_EOF_DISCARDED:
+=09case IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_WATERMARK:
+=09=09dev_dbg(dev, "Ignoring IPU4P response type %u for stream %u\n",
+=09=09=09fw_resp->type, fw_resp->stream_handle);
+=09=09goto out;
+=09case IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_READY:
+=09=09if (!ipu4p_fw_isys_complete_pin_response(isys, fw_resp)) {
+=09=09=09dev_warn(dev,
+=09=09=09=09 "Unmatched IPU4P pin response for stream %u frame %u\n",
+=09=09=09=09 fw_resp->stream_handle, fw_resp->frame_counter);
+=09=09=09goto out;
+=09=09}
+=09=09break;
+=09default:
+=09=09break;
+=09}
+
+=09type =3D ipu4p_fw_isys_resp_type_to_ipu6(fw_resp->type);
+=09if (type < 0) {
+=09=09if (type =3D=3D -EINVAL)
+=09=09=09dev_err(dev, "Unknown IPU4P response type %u\n",
+=09=09=09=09fw_resp->type);
+=09=09else
+=09=09=09dev_dbg(dev, "Ignoring unsupported IPU4P response type %u\n",
+=09=09=09=09fw_resp->type);
+=09=09goto out;
+=09}
+
+=09resp.buf_id =3D fw_resp->buf_id;
+=09resp.pin.out_buf_id =3D fw_resp->pin.out_buf_id;
+=09resp.pin.addr =3D fw_resp->pin.addr;
+=09resp.pin.compress =3D fw_resp->pin.compress;
+=09resp.error_info.error =3D fw_resp->error_info.error;
+=09resp.error_info.error_details =3D fw_resp->error_info.error_details;
+=09resp.timestamp[0] =3D fw_resp->timestamp[0];
+=09resp.timestamp[1] =3D fw_resp->timestamp[1];
+=09resp.stream_handle =3D fw_resp->stream_handle;
+=09resp.type =3D type;
+=09resp.pin_id =3D fw_resp->pin_id;
+
+=09/* IPU4P manages message-buffer ownership separately. */
+=09ipu6_isys_handle_response(adev, &resp, false);
+
+out:
+=09ipu6_recv_put_token(isys->fwctx, IPU4P_BASE_MSG_RECV_QUEUES);
+
+=09return 0;
+}
+
+static int ipu4p_fw_isys_pin_cfg(struct ipu6_isys_video *av,
+=09=09=09=09 struct ipu6_isys_stream *stream,
+=09=09=09=09 struct media_pad *src_pad,
+=09=09=09=09 struct v4l2_mbus_frame_desc_entry *entry,
+=09=09=09=09 void *__cfg)
+{
+=09struct v4l2_subdev *sd =3D media_entity_to_v4l2_subdev(src_pad->entity)=
;
+=09struct v4l2_subdev_state *state =3D v4l2_subdev_get_locked_active_state=
(sd);
+=09struct ipu4p_fw_isys_stream_cfg *cfg =3D __cfg;
+=09struct ipu4p_fw_isys_input_pin_info *input_pin;
+=09struct ipu4p_fw_isys_output_pin_info *output_pin;
+=09struct ipu6_isys_queue *aq =3D &av->aq;
+=09const struct ipu6_isys_pixelformat *pfmt;
+=09struct v4l2_mbus_framefmt *fmt;
+=09unsigned int input_pins, output_pins;
+=09u32 src_stream;
+
+=09if (cfg->nof_input_pins >=3D IPU4P_MAX_IPINS ||
+=09    cfg->nof_output_pins >=3D IPU4P_MAX_OPINS)
+=09=09return -EINVAL;
+
+=09pfmt =3D ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
+=09if (!pfmt)
+=09=09return -EINVAL;
+
+=09src_stream =3D __ipu6_isys_get_src_stream_by_src_pad(state, src_pad->in=
dex);
+=09fmt =3D v4l2_subdev_state_get_format(state, src_pad->index, src_stream)=
;
+=09if (!fmt)
+=09=09return -EINVAL;
+
+=09input_pins =3D cfg->nof_input_pins++;
+=09input_pin =3D &cfg->input_pins[input_pins];
+=09input_pin->input_res.width =3D fmt->width;
+=09input_pin->input_res.height =3D fmt->height;
+=09input_pin->dt =3D entry->bus.csi2.dt;
+=09input_pin->bits_per_pix =3D pfmt->bpp_packed;
+=09input_pin->mapped_dt =3D N_IPU4P_FW_ISYS_MIPI_DATA_TYPE;
+=09input_pin->mipi_store_mode =3D pfmt->bpp =3D=3D pfmt->bpp_packed ?
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
+=09output_pin->payload_buf_size =3D 0;
+=09output_pin->pt =3D pfmt->bpp =3D=3D pfmt->bpp_packed ?
+=09=09IPU4P_FW_ISYS_PIN_TYPE_MIPI : IPU4P_FW_ISYS_PIN_TYPE_RAW_SOC;
+=09output_pin->ft =3D pfmt->css_pixelformat;
+=09output_pin->send_irq =3D 1;
+=09output_pin->link_id =3D IPU4P_FW_ISYS_LINK_OFFLINE;
+
+=09return 0;
+}
+
+static int
+ipu4p_fw_isys_prepare_stream_cfg(struct ipu6_isys_stream *stream,
+=09=09=09=09 struct v4l2_mbus_frame_desc *desc,
+=09=09=09=09 struct isys_fw_msgs *msg)
+{
+=09struct ipu4p_fw_isys_stream_cfg *cfg =3D &msg->ipu4p.stream;
+=09struct device *dev =3D &stream->isys->adev->auxdev.dev;
+=09int ret;
+
+=09memset(cfg, 0, sizeof(*cfg));
+=09msg->ipu4p_stream_handle =3D stream->stream_handle;
+=09msg->ipu4p_frame_counter =3D 0;
+=09msg->ipu4p_pending_pin_mask =3D 0;
+=09msg->ipu4p_is_frame =3D false;
+=09msg->ipu4p_addr_error =3D false;
+=09cfg->src =3D stream->asd->source;
+=09cfg->vc =3D stream->vc;
+=09cfg->isl_use =3D IPU4P_FW_ISYS_USE_NO_ISL_NO_ISA;
+
+=09ret =3D ipu6_isys_fw_pins_prepare(stream, desc, ipu4p_fw_isys_pin_cfg,
+=09=09=09=09=09cfg);
+=09if (ret)
+=09=09return ret;
+
+=09stream->nr_output_pins =3D cfg->nof_output_pins;
+=09ipu4p_fw_isys_dump_stream_cfg(dev, msg);
+
+=09return 0;
+}
+
+static int ipu4p_fw_isys_stream_open(struct ipu6_isys *isys,
+=09=09=09=09     const unsigned int stream_handle,
+=09=09=09=09     struct isys_fw_msgs *msg)
+{
+=09return ipu4p_fw_isys_send_cmd(isys, stream_handle,
+=09=09=09=09      &msg->ipu4p.stream, msg->dma_addr,
+=09=09=09=09      sizeof(msg->ipu4p.stream),
+=09=09=09=09      IPU4P_FW_ISYS_SEND_TYPE_STREAM_OPEN);
+}
+
+static int ipu4p_fw_isys_stream_close(struct ipu6_isys *isys,
+=09=09=09=09      const unsigned int stream_handle)
+{
+=09return ipu4p_fw_isys_send_cmd(isys, stream_handle, NULL, 0, 0,
+=09=09=09=09      IPU4P_FW_ISYS_SEND_TYPE_STREAM_CLOSE);
+}
+
+static int ipu4p_fw_isys_stream_flush(struct ipu6_isys *isys,
+=09=09=09=09      const unsigned int stream_handle)
+{
+=09return ipu4p_fw_isys_send_cmd(isys, stream_handle, NULL, 0, 0,
+=09=09=09=09      IPU4P_FW_ISYS_SEND_TYPE_STREAM_FLUSH);
+}
+
+static int
+ipu4p_fw_isys_send_frame_buff_set(struct ipu6_isys *isys,
+=09=09=09=09  const unsigned int stream_handle,
+=09=09=09=09  struct isys_fw_msgs *msg, u16 send_type)
+{
+=09if (msg->ipu4p_addr_error)
+=09=09return -ERANGE;
+
+=09return ipu4p_fw_isys_send_cmd(isys, stream_handle,
+=09=09=09=09      &msg->ipu4p.frame, msg->dma_addr,
+=09=09=09=09      sizeof(msg->ipu4p.frame), send_type);
+}
+
+static int ipu4p_fw_isys_stream_start(struct ipu6_isys *isys,
+=09=09=09=09      const unsigned int stream_handle,
+=09=09=09=09      struct isys_fw_msgs *msg, bool capture)
+{
+=09if (!capture)
+=09=09return ipu4p_fw_isys_send_cmd(isys, stream_handle, NULL, 0, 0,
+=09=09=09=09=09      IPU4P_FW_ISYS_SEND_TYPE_STREAM_START);
+
+=09return ipu4p_fw_isys_send_frame_buff_set(isys, stream_handle, msg,
+=09=09=09=09=09=09 IPU4P_FW_ISYS_SEND_TYPE_STREAM_START_AND_CAPTURE);
+}
+
+static int ipu4p_fw_isys_stream_capture(struct ipu6_isys *isys,
+=09=09=09=09=09const unsigned int stream_handle,
+=09=09=09=09=09struct isys_fw_msgs *msg)
+{
+=09return ipu4p_fw_isys_send_frame_buff_set(isys, stream_handle, msg,
+=09=09=09=09=09=09 IPU4P_FW_ISYS_SEND_TYPE_STREAM_CAPTURE);
+}
+
+static bool
+ipu4p_fw_isys_buf_to_frame_buf_pin(struct vb2_buffer *vb,
+=09=09=09=09   struct ipu4p_fw_isys_frame_buff_set *set)
+{
+=09struct ipu6_isys_queue *aq =3D vb2_queue_to_isys_queue(vb->vb2_queue);
+=09struct vb2_v4l2_buffer *vvb =3D to_vb2_v4l2_buffer(vb);
+=09struct ipu6_isys_video_buffer *ivb =3D
+=09=09vb2_buffer_to_ipu6_isys_video_buffer(vvb);
+=09struct ipu4p_fw_isys_output_pin_payload *pin;
+
+=09if (aq->fw_output >=3D IPU4P_MAX_OPINS ||
+=09    upper_32_bits(ivb->dma_addr))
+=09=09return false;
+
+=09pin =3D &set->output_pins[aq->fw_output];
+=09pin->addr =3D lower_32_bits(ivb->dma_addr);
+=09/* Firmware echoes this opaque handle in PIN_DATA_READY. */
+=09pin->out_buf_id =3D (u64)(uintptr_t)set;
+
+=09return true;
+}
+
+static void
+ipu4p_fw_isys_prepare_buf_set(struct isys_fw_msgs *msg,
+=09=09=09      struct ipu6_isys_stream *stream,
+=09=09=09      struct ipu6_isys_buffer_list *bl)
+{
+=09struct ipu4p_fw_isys_frame_buff_set *set =3D &msg->ipu4p.frame;
+=09struct ipu6_isys_buffer *ib;
+
+=09WARN_ON(!bl->nbufs);
+
+=09memset(set, 0, sizeof(*set));
+=09set->frame_counter =3D atomic_fetch_inc(&stream->buf_id) % 256;
+=09msg->ipu4p_stream_handle =3D stream->stream_handle;
+=09msg->ipu4p_frame_counter =3D set->frame_counter;
+=09msg->ipu4p_pending_pin_mask =3D 0;
+=09msg->ipu4p_is_frame =3D true;
+=09msg->ipu4p_addr_error =3D false;
+=09set->send_irq_sof =3D 1;
+=09set->send_irq_eof =3D 1;
+=09set->send_irq_capture_ack =3D 1;
+=09set->send_irq_capture_done =3D 1;
+=09set->send_resp_sof =3D 1;
+=09set->send_resp_eof =3D 1;
+
+=09list_for_each_entry(ib, &bl->head, head) {
+=09=09struct vb2_buffer *vb =3D ipu6_isys_buffer_to_vb2_buffer(ib);
+=09=09struct ipu6_isys_queue *aq =3D
+=09=09=09vb2_queue_to_isys_queue(vb->vb2_queue);
+
+=09=09if (ipu4p_fw_isys_buf_to_frame_buf_pin(vb, set))
+=09=09=09msg->ipu4p_pending_pin_mask |=3D BIT(aq->fw_output);
+=09=09else
+=09=09=09msg->ipu4p_addr_error =3D true;
+=09}
+}
+
+const struct ipu6_fw_isys_ops ipu4p_fw_isys_ops =3D {
+=09.init =3D ipu4p_fw_isys_init,
+=09.close =3D ipu4p_fw_isys_close,
+=09.isr_one =3D ipu4p_fw_isys_isr_one,
+=09.set_iwake_register =3D ipu4p_fw_isys_set_iwake_register,
+=09.send_cmd =3D ipu4p_fw_isys_send_cmd,
+=09.cleanup =3D ipu4p_fw_isys_cleanup,
+=09.prepare_stream_cfg =3D ipu4p_fw_isys_prepare_stream_cfg,
+=09.prepare_buf_set =3D ipu4p_fw_isys_prepare_buf_set,
+=09.stream_open =3D ipu4p_fw_isys_stream_open,
+=09.stream_start =3D ipu4p_fw_isys_stream_start,
+=09.stream_capture =3D ipu4p_fw_isys_stream_capture,
+=09.stream_flush =3D ipu4p_fw_isys_stream_flush,
+=09.stream_close =3D ipu4p_fw_isys_stream_close,
+=09.dump_stream_cfg =3D ipu4p_fw_isys_dump_stream_cfg,
+=09.dump_frame_buf_set =3D ipu4p_fw_isys_dump_frame_buf_set,
+};
diff --git a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h b/drivers/media/p=
ci/intel/ipu6/ipu4p-fw-isys.h
index d2d5962b218..15a5dc7c938 100644
--- a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h
@@ -12,6 +12,11 @@
 #define IPU4P_MAX_IPINS=09=09=09=094U
 #define IPU4P_MAX_OPINS=09=09=09=096U
 #define IPU4P_NOF_SRAM_BLOCKS_MAX=09=098U
+#define IPU4P_DEVICE_GDA_NR_PAGES=09=09128U
+#define IPU4P_DEVICE_GDA_VIRT_FACTOR=09=0932U
+#define IPU4P_N_MAX_PROXY_SEND_QUEUES=09=091U
+#define IPU4P_N_MAX_DEV_SEND_QUEUES=09=091U
+#define IPU4P_N_MAX_PROXY_RECV_QUEUES=09=091U
 #define IPU4P_DEV_SEND_QUEUE_SIZE=09=098U
 #define IPU4P_ISYS_SIZE_RECV_QUEUE=09=0940U
 #define IPU4P_ISYS_SIZE_SEND_QUEUE=09=0940U
@@ -26,6 +31,8 @@
 #define IPU4P_BASE_PROXY_RECV_QUEUES=09=090U
 #define IPU4P_BASE_MSG_RECV_QUEUES=09=091U
 #define IPU4P_N_MAX_RECV_QUEUES=09=09=092U
+#define IPU4P_N_MAX_SEND_QUEUES \
+=09(IPU4P_BASE_MSG_SEND_QUEUES + IPU4P_ISYS_MAX_STREAMS)
=20
 #define IPU4P_ISYS_CROPPING_LOCATION_MAX=094U
 #define IPU4P_ISYS_RESOLUTION_INFO_MAX=09=092U
diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.h b/drivers/media/pci/in=
tel/ipu6/ipu6-bus.h
index d2f93eb03de..68a3b8e29b3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-bus.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-bus.h
@@ -46,6 +46,7 @@ struct ipu6_auxdrv_data {
 =09container_of(_auxdev, struct ipu6_bus_device, auxdev)
 #define ipu6_bus_get_drvdata(adev) dev_get_drvdata(&(adev)->auxdev.dev)
=20
+extern const struct ipu6_fw_isys_ops ipu4p_fw_isys_ops;
 extern const struct ipu6_fw_isys_ops ipu6_fw_isys_ops;
 extern const struct ipu6_fw_isys_ops ipu7_fw_isys_ops;
=20
diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pc=
i/intel/ipu6/ipu6-fw-isys.c
index c6066e37ef5..efcece5620d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -599,6 +599,15 @@ void ipu6_isys_handle_response(struct ipu6_bus_device =
*adev,
 =09case IPU6_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK:
 =09=09complete(&stream->stream_stop_completion);
 =09=09break;
+=09case IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_SKIPPED:
+=09=09if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS &&
+=09=09    stream->output_pins_queue[resp->pin_id])
+=09=09=09ipu6_isys_queue_buf_ready(stream, resp);
+=09=09else
+=09=09=09dev_warn(&adev->auxdev.dev,
+=09=09=09=09 "%d:No queue for skipped pin id %d\n",
+=09=09=09=09 resp->stream_handle, resp->pin_id);
+=09=09break;
 =09case IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_READY:
 =09=09/*
 =09=09 * firmware only release the capture message until software
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/=
pci/intel/ipu6/ipu6-isys-csi2.c
index 15254542793..ea21ce9b814 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2013--2024 Intel Corporation
  */
=20
+#include <linux/array_size.h>
 #include <linux/atomic.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
@@ -914,6 +915,17 @@ void ipu6_isys_csi2_cleanup(struct ipu6_isys_csi2 *csi=
2)
 =09csi2->isys =3D NULL;
 }
=20
+static const u8 ipu4p_csi2_fw_sources[] =3D {
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_3,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_6,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_7,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_8,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_9,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_10,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_11,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_12,
+};
+
 int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
 =09=09=09struct ipu6_isys *isys,
 =09=09=09void __iomem *base, unsigned int index)
@@ -921,6 +933,10 @@ int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
 =09struct device *dev =3D &isys->adev->auxdev.dev;
 =09int ret;
=20
+=09if (IS_IPU4P(isys->adev->isp) &&
+=09    index >=3D ARRAY_SIZE(ipu4p_csi2_fw_sources))
+=09=09return -EINVAL;
+
 =09csi2->isys =3D isys;
 =09csi2->base =3D base;
 =09csi2->port =3D index;
@@ -934,7 +950,10 @@ int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
=20
 =09INIT_LIST_HEAD(&csi2->av_head);
 =09INIT_LIST_HEAD(&csi2->streams);
-=09csi2->asd.source =3D IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT0 + index;
+=09if (IS_IPU4P(isys->adev->isp))
+=09=09csi2->asd.source =3D ipu4p_csi2_fw_sources[index];
+=09else
+=09=09csi2->asd.source =3D IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT0 + index;
 =09csi2->asd.supported_codes =3D csi2_supported_codes;
 =09snprintf(csi2->asd.sd.name, sizeof(csi2->asd.sd.name),
 =09=09 "Intel IPU%s CSI2 %u",
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media=
/pci/intel/ipu6/ipu6-isys-queue.c
index 23d00e1f89e..5ac34699c3b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -301,8 +301,10 @@ static void buf_queue(struct vb2_buffer *vb)
 =09struct device *dev =3D &adev->auxdev.dev;
 =09struct ipu6_isys_stream *stream =3D av->stream;
 =09struct ipu6_isys_csi2 *csi2;
+=09struct ipu6_isys_buffer *buffers[IPU6_ISYS_OUTPUT_PINS];
 =09struct ipu6_isys_buffer_list bl;
 =09struct isys_fw_msgs *msg;
+=09unsigned int num_buffers =3D 0, i;
 =09unsigned long flags;
 =09dma_addr_t dma;
 =09int ret;
@@ -344,9 +346,15 @@ static void buf_queue(struct vb2_buffer *vb)
 =09msg =3D ipu6_get_fw_msg_buf(stream);
 =09if (!msg) {
 =09=09ret =3D -ENOMEM;
+=09=09ipu6_isys_buffer_list_queue(&bl,
+=09=09=09=09=09    IPU6_ISYS_BUFFER_LIST_FL_INCOMING,
+=09=09=09=09=09    VB2_BUF_STATE_QUEUED);
 =09=09goto out;
 =09}
=20
+=09list_for_each_entry(ib, &bl.head, head)
+=09=09buffers[num_buffers++] =3D ib;
+
 =09fw_ops->prepare_buf_set(msg, stream, &bl);
 =09fw_ops->dump_frame_buf_set(dev, msg, stream->nr_output_pins);
=20
@@ -359,8 +367,29 @@ static void buf_queue(struct vb2_buffer *vb)
 =09ipu6_isys_buffer_list_queue(&bl, IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
=20
 =09ret =3D fw_ops->stream_capture(stream->isys, stream->stream_handle, msg=
);
-=09if (ret < 0)
-=09=09dev_err(dev, "send stream capture failed\n");
+=09if (ret < 0) {
+=09=09dev_err(dev, "send stream capture failed: %d\n", ret);
+=09=09ipu6_put_fw_msg_buf(stream->isys, msg);
+
+=09=09/*
+=09=09 * The command was not submitted. Return only this frame's
+=09=09 * buffers, leaving other in-flight captures untouched.
+=09=09 */
+=09=09for (i =3D 0; i < num_buffers; i++) {
+=09=09=09struct ipu6_isys_queue *buffer_aq;
+=09=09=09struct vb2_buffer *buffer_vb;
+
+=09=09=09ib =3D buffers[i];
+=09=09=09buffer_vb =3D ipu6_isys_buffer_to_vb2_buffer(ib);
+=09=09=09buffer_aq =3D vb2_queue_to_isys_queue(buffer_vb->vb2_queue);
+
+=09=09=09spin_lock_irqsave(&buffer_aq->lock, flags);
+=09=09=09list_del(&ib->head);
+=09=09=09spin_unlock_irqrestore(&buffer_aq->lock, flags);
+
+=09=09=09vb2_buffer_done(buffer_vb, VB2_BUF_STATE_ERROR);
+=09=09}
+=09}
=20
 out:
 =09mutex_unlock(&stream->mutex);
@@ -699,7 +728,8 @@ void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream =
*stream,
 =09=09=09       struct ipu6_fw_isys_resp_info_abi *info)
 {
 =09u64 time =3D (u64)info->timestamp[1] << 32 | info->timestamp[0];
-=09bool err =3D info->error_info.error =3D=3D IPU6_FW_ISYS_ERROR_HW_REPORT=
ED_STR2MMIO;
+=09bool err =3D info->type =3D=3D IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_SKIPPED =
||
+=09=09   info->error_info.error =3D=3D IPU6_FW_ISYS_ERROR_HW_REPORTED_STR2=
MMIO;
=20
 =09ipu6_stream_buf_ready(stream, info->pin_id, info->pin.addr, time, err);
 }
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media=
/pci/intel/ipu6/ipu6-isys-video.c
index 129016e5744..f4668bf40a7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -673,14 +673,22 @@ ipu6_isys_alloc_stream_firmware(struct ipu6_isys_csi2=
 *csi2,
 =09struct device *dev =3D &csi2->isys->adev->auxdev.dev;
 =09struct ipu6_isys_stream *stream;
 =09struct v4l2_subdev_route *route;
+=09unsigned int max_streams;
 =09int ret;
=20
 =09stream =3D kzalloc_obj(*stream);
 =09if (!stream)
 =09=09return ERR_PTR(-ENOMEM);
=20
-=09ret =3D ida_alloc_max(&csi2->isys->streams, IPU6_ISYS_MAX_STREAMS - 1,
-=09=09=09    GFP_KERNEL);
+=09max_streams =3D min_t(unsigned int,
+=09=09=09    csi2->isys->pdata->ipdata->max_streams,
+=09=09=09    IPU6_ISYS_MAX_STREAMS);
+=09if (!max_streams) {
+=09=09ret =3D -EINVAL;
+=09=09goto err_free_stream;
+=09}
+
+=09ret =3D ida_alloc_max(&csi2->isys->streams, max_streams - 1, GFP_KERNEL=
);
 =09if (ret < 0)
 =09=09goto err_free_stream;
=20
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/i=
ntel/ipu6/ipu6-isys.c
index 094a98e31c0..037eb0a52d4 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -124,10 +124,33 @@ struct ltr_did {
=20
 #define ISYS_PM_QOS_VALUE=09300
=20
+static int
+ipu6_isys_csi2_fw_port_to_index(struct ipu6_isys *isys,
+=09=09=09=09unsigned int fw_port)
+{
+=09unsigned int index;
+
+=09if (!IS_IPU4P(isys->adev->isp))
+=09=09index =3D fw_port;
+=09else if (fw_port =3D=3D IPU4P_FW_ISYS_STREAM_SRC_PORT_3)
+=09=09index =3D 0;
+=09else if (fw_port >=3D IPU4P_FW_ISYS_STREAM_SRC_PORT_6 &&
+=09=09 fw_port <=3D IPU4P_FW_ISYS_STREAM_SRC_PORT_12)
+=09=09index =3D fw_port - IPU4P_FW_ISYS_STREAM_SRC_PORT_5;
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
-=09=09=09=09      struct ipu6_isys_csi2_config *csi2)
+=09=09=09=09      struct ipu6_isys_csi2_config *csi2,
+=09=09=09=09      unsigned int csi2_port)
 {
 =09struct device *dev =3D &isys->adev->auxdev.dev;
 =09unsigned int i;
@@ -145,7 +168,7 @@ isys_complete_ext_device_registration(struct ipu6_isys =
*isys,
 =09}
=20
 =09ret =3D media_create_pad_link(&sd->entity, i,
-=09=09=09=09    &isys->csi2[csi2->port].asd.sd.entity,
+=09=09=09=09    &isys->csi2[csi2_port].asd.sd.entity,
 =09=09=09=09    0, MEDIA_LNK_FL_ENABLED |
 =09=09=09=09       MEDIA_LNK_FL_IMMUTABLE);
 =09if (ret) {
@@ -153,8 +176,8 @@ isys_complete_ext_device_registration(struct ipu6_isys =
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
@@ -352,16 +375,22 @@ static void ipu6_isys_setup_hw(struct ipu6_isys *isys=
)
 =09=09writel(thd[i], base + IPU6_REG_ISYS_CDC_THRESHOLD(i));
 }
=20
-static int set_iwake_register(struct ipu6_isys *isys, u32 index, u32 value=
)
+static int set_iwake_register(struct ipu6_isys *isys,
+=09=09=09      enum ipu6_isys_iwake_register index, u32 value)
 {
+=09const struct ipu6_fw_isys_ops *fw_ops =3D isys->adev->auxdrv_data->fw_o=
ps;
 =09struct device *dev =3D &isys->adev->auxdev.dev;
-=09u32 req_id =3D index;
 =09u32 offset =3D 0;
 =09int ret;
=20
-=09ret =3D ipu6_fw_isys_send_proxy_token(isys, req_id, index, offset, valu=
e);
-=09if (ret)
-=09=09dev_err(dev, "write %d failed %d", index, ret);
+=09if (fw_ops->set_iwake_register)
+=09=09ret =3D fw_ops->set_iwake_register(isys, index, value);
+=09else
+=09=09ret =3D ipu6_fw_isys_send_proxy_token(isys, index, index,
+=09=09=09=09=09=09    offset, value);
+
+=09if (ret && ret !=3D -EOPNOTSUPP)
+=09=09dev_err(dev, "write %d failed %d\n", index, ret);
=20
 =09return ret;
 }
@@ -390,6 +419,10 @@ static void set_iwake_ltrdid(struct ipu6_isys *isys, u=
16 ltr, u16 did,
 =09struct ipu6_device *isp =3D isys->adev->isp;
 =09union fabric_ctrl fc;
=20
+=09/* IPU4P must not use the IPU6-specific fabric LTR/DID registers. */
+=09if (IS_IPU4P(isp))
+=09=09return;
+
 =09switch (use) {
 =09case LTR_IWAKE_ON:
 =09=09ltr_val =3D min_t(u16, ltr, (u16)LTR_DID_VAL_MAX);
@@ -485,9 +518,19 @@ void ipu6_isys_update_watermark_setting(struct ipu6_is=
ys *isys)
=20
 =09if (force_iwake_disable) {
 =09=09dev_dbg(dev, "watermark: forcing iwake disabled\n");
-=09=09set_iwake_ltrdid(isys, 0, 0, LTR_IWAKE_OFF);
-=09=09set_iwake_register(isys, GDA_IRQ_CRITICAL_THRESHOLD_INDEX,
-=09=09=09=09   CRITICAL_THRESHOLD_IWAKE_DISABLE);
+=09=09if (IS_IPU4P(isys->adev->isp)) {
+=09=09=09/*
+=09=09=09 * IPU4P has no critical-threshold proxy operation.
+=09=09=09 * Disable IWAKE through the supported enable operation.
+=09=09=09 */
+=09=09=09if (!set_iwake_register(isys, GDA_ENABLE_IWAKE_INDEX,
+=09=09=09=09=09=09false))
+=09=09=09=09isys->iwake_watermark_enabled =3D false;
+=09=09} else {
+=09=09=09set_iwake_ltrdid(isys, 0, 0, LTR_IWAKE_OFF);
+=09=09=09set_iwake_register(isys, GDA_IRQ_CRITICAL_THRESHOLD_INDEX,
+=09=09=09=09=09   CRITICAL_THRESHOLD_IWAKE_DISABLE);
+=09=09}
 =09=09return;
 =09}
=20
@@ -495,8 +538,9 @@ void ipu6_isys_update_watermark_setting(struct ipu6_isy=
s *isys)
 =09=09dev_dbg(dev, "watermark: disabled iwake\n");
 =09=09enable_iwake(isys, false);
 =09=09set_iwake_ltrdid(isys, 0, 0, LTR_IWAKE_OFF);
-=09=09set_iwake_register(isys, GDA_IRQ_CRITICAL_THRESHOLD_INDEX,
-=09=09=09=09   CRITICAL_THRESHOLD_IWAKE_DISABLE);
+=09=09if (!IS_IPU4P(isys->adev->isp))
+=09=09=09set_iwake_register(isys, GDA_IRQ_CRITICAL_THRESHOLD_INDEX,
+=09=09=09=09=09   CRITICAL_THRESHOLD_IWAKE_DISABLE);
 =09=09return;
 =09}
=20
@@ -551,19 +595,21 @@ void ipu6_isys_update_watermark_setting(struct ipu6_i=
sys *isys)
 =09=09=09=09   iwake_threshold);
 =09}
=20
-=09iwake_critical_threshold =3D iwake_threshold +
-=09=09(IS_PIXEL_BUFFER_PAGES - iwake_threshold) / 2;
+=09if (!IS_IPU4P(isys->adev->isp)) {
+=09=09iwake_critical_threshold =3D iwake_threshold +
+=09=09=09(IS_PIXEL_BUFFER_PAGES - iwake_threshold) / 2;
=20
-=09dev_dbg(dev, "watermark: threshold: %u critical: %u\n", iwake_threshold=
,
-=09=09iwake_critical_threshold);
+=09=09dev_dbg(dev, "watermark: threshold: %u critical: %u\n",
+=09=09=09iwake_threshold, iwake_critical_threshold);
=20
-=09set_iwake_register(isys, GDA_IRQ_CRITICAL_THRESHOLD_INDEX,
-=09=09=09   iwake_critical_threshold);
+=09=09set_iwake_register(isys, GDA_IRQ_CRITICAL_THRESHOLD_INDEX,
+=09=09=09=09   iwake_critical_threshold);
=20
-=09writel(VAL_PKGC_PMON_CFG_RESET,
-=09       isys->adev->isp->base + REG_PKGC_PMON_CFG);
-=09writel(VAL_PKGC_PMON_CFG_START,
-=09       isys->adev->isp->base + REG_PKGC_PMON_CFG);
+=09=09writel(VAL_PKGC_PMON_CFG_RESET,
+=09=09       isys->adev->isp->base + REG_PKGC_PMON_CFG);
+=09=09writel(VAL_PKGC_PMON_CFG_START,
+=09=09       isys->adev->isp->base + REG_PKGC_PMON_CFG);
+=09}
 }
=20
 /* The .bound() notifier callback when a match is found */
@@ -575,12 +621,14 @@ static int isys_notifier_bound(struct v4l2_async_noti=
fier *notifier,
 =09=09container_of(notifier, struct ipu6_isys, notifier);
 =09struct sensor_async_sd *s_asd =3D
 =09=09container_of(asc, struct sensor_async_sd, asc);
+=09int csi2_port;
 =09int ret;
=20
-=09if (s_asd->csi2.port >=3D isys->pdata->ipdata->csi2.nports) {
+=09csi2_port =3D ipu6_isys_csi2_fw_port_to_index(isys, s_asd->csi2.port);
+=09if (csi2_port < 0) {
 =09=09dev_err(&isys->adev->auxdev.dev, "invalid csi2 port %u\n",
 =09=09=09s_asd->csi2.port);
-=09=09return -EINVAL;
+=09=09return csi2_port;
 =09}
=20
 =09ret =3D ipu_bridge_instantiate_vcm(sd->dev);
@@ -591,7 +639,8 @@ static int isys_notifier_bound(struct v4l2_async_notifi=
er *notifier,
=20
 =09dev_dbg(&isys->adev->auxdev.dev, "bind %s nlanes is %d port is %d\n",
 =09=09sd->name, s_asd->csi2.nlanes, s_asd->csi2.port);
-=09ret =3D isys_complete_ext_device_registration(isys, sd, &s_asd->csi2);
+=09ret =3D isys_complete_ext_device_registration(isys, sd, &s_asd->csi2,
+=09=09=09=09=09=09    csi2_port);
 =09if (ret)
 =09=09return ret;
=20
@@ -772,12 +821,13 @@ static int isys_runtime_pm_resume(struct device *dev)
 =09if (ret)
 =09=09goto err_mmu_hw_cleanup;
=20
-=09if (IS_IPU7(isp) || IS_IPU8(isp)) {
+=09if (IS_IPU7(isp) || IS_IPU8(isp))
 =09=09ipu7_isys_setup_hw(isys);
-=09} else {
+=09else if (!IS_IPU4P(isp))
 =09=09ipu6_isys_setup_hw(isys);
+
+=09if (!IS_IPU7(isp) && !IS_IPU8(isp))
 =09=09set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_ON);
-=09}
=20
 =09ipu6_configure_spc(adev->isp, &ipdata->hw_variant,
 =09=09=09   IPU6_CPD_PKG_DIR_ISYS_SERVER_IDX, isys->pdata->base,
@@ -972,6 +1022,7 @@ void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, struc=
t isys_fw_msgs *msg)
 =09spin_unlock_irqrestore(&isys->listlock, flags);
 }
=20
+static const struct ipu6_auxdrv_data ipu4p_isys_auxdrv_data;
 static const struct ipu6_auxdrv_data ipu6_isys_auxdrv_data;
 static const struct ipu6_auxdrv_data ipu7_isys_auxdrv_data;
=20
@@ -991,8 +1042,12 @@ static int isys_probe(struct auxiliary_device *auxdev=
,
 =09if (!isys)
 =09=09return -ENOMEM;
=20
-=09adev->auxdrv_data =3D (IS_IPU7(isp) || IS_IPU8(isp)) ? &ipu7_isys_auxdr=
v_data :
-=09=09=09=09=09   &ipu6_isys_auxdrv_data;
+=09if (IS_IPU4P(isp))
+=09=09adev->auxdrv_data =3D &ipu4p_isys_auxdrv_data;
+=09else if (IS_IPU7(isp) || IS_IPU8(isp))
+=09=09adev->auxdrv_data =3D &ipu7_isys_auxdrv_data;
+=09else
+=09=09adev->auxdrv_data =3D &ipu6_isys_auxdrv_data;
 =09adev->auxdrv =3D to_auxiliary_drv(auxdev->dev.driver);
 =09isys->adev =3D adev;
 =09isys->pdata =3D adev->pdata;
@@ -1071,6 +1126,13 @@ static void isys_remove(struct auxiliary_device *aux=
dev)
 =09mutex_destroy(&isys->mutex);
 }
=20
+static const struct ipu6_auxdrv_data ipu4p_isys_auxdrv_data =3D {
+=09.isr =3D NULL,
+=09.isr_threaded =3D NULL,
+=09.wake_isr_thread =3D false,
+=09.fw_ops =3D &ipu4p_fw_isys_ops,
+};
+
 static const struct ipu6_auxdrv_data ipu6_isys_auxdrv_data =3D {
 =09.isr =3D ipu6_isys_isr,
 =09.isr_threaded =3D NULL,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/i=
ntel/ipu6/ipu6-isys.h
index 86b1ab681e3..9f521fefef4 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -18,6 +18,7 @@
 #include <media/v4l2-mediabus.h>
=20
 #include "ipu6.h"
+#include "ipu4p-fw-isys.h"
 #include "ipu6-fw-isys.h"
 #include "ipu7-fw-isys.h"
 #include "ipu6-isys-csi2.h"
@@ -63,12 +64,18 @@ static inline const char *ipu6_isys_entity_version(stru=
ct ipu6_device *isp)
 #define IPU6_ISYS_MAX_WIDTH=09=094672U
 #define IPU6_ISYS_MAX_HEIGHT=09=093416U
=20
+/* IPU4P has 128 physical GDA pages of 1 KiB each. */
+#define IPU4P_SRAM_GRANULARITY_SHIFT=0910
+#define IPU4P_SRAM_GRANULARITY_SIZE=091024
 /* the threshold granularity is 2KB on IPU6 */
 #define IPU6_SRAM_GRANULARITY_SHIFT=0911
 #define IPU6_SRAM_GRANULARITY_SIZE=092048
 /* the threshold granularity is 1KB on IPU6SE */
 #define IPU6SE_SRAM_GRANULARITY_SHIFT=0910
 #define IPU6SE_SRAM_GRANULARITY_SIZE=091024
+
+/* Use the 96 KiB usable size for a 128 KiB buffer, as on IPU6SE. */
+#define IPU4P_MAX_SRAM_SIZE=09=09=09(96 << 10)
 /* IS pixel buffer is 256KB, MaxSRAMSize is 200KB on IPU6 */
 #define IPU6_MAX_SRAM_SIZE=09=09=09(200 << 10)
 /* IS pixel buffer is 128KB, MaxSRAMSize is 96KB on IPU6SE */
@@ -148,6 +155,10 @@ struct ipu6_isys {
 struct isys_fw_msgs {
 =09union {
 =09=09u64 dummy;
+=09=09union {
+=09=09=09struct ipu4p_fw_isys_frame_buff_set frame;
+=09=09=09struct ipu4p_fw_isys_stream_cfg stream;
+=09=09} ipu4p;
 =09=09union {
 =09=09=09struct ipu6_fw_isys_frame_buff_set_abi frame;
 =09=09=09struct ipu6_fw_isys_stream_cfg_data_abi stream;
@@ -162,12 +173,28 @@ struct isys_fw_msgs {
 =09};
 =09struct list_head head;
 =09dma_addr_t dma_addr;
+=09u8 ipu4p_stream_handle;
+=09u8 ipu4p_frame_counter;
+=09/* Bits mark output pins with buffers awaiting firmware completion. */
+=09u8 ipu4p_pending_pin_mask;
+=09bool ipu4p_is_frame;
+=09bool ipu4p_addr_error;
+};
+
+enum ipu6_isys_iwake_register {
+=09IPU6_ISYS_IWAKE_GDA_IRQ_CRITICAL_THRESHOLD,
+=09IPU6_ISYS_IWAKE_GDA_THRESHOLD,
+=09IPU6_ISYS_IWAKE_GDA_ENABLE,
+=09IPU6_ISYS_IWAKE_GDA_MEMOPEN_THRESHOLD,
 };
=20
 struct ipu6_fw_isys_ops {
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
index 1432c2a1f6f..10827ababfd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -370,6 +370,14 @@ static void ipu6_internal_pdata_init(struct ipu6_devic=
e *isp)
 =09isys_ipdata.csi2.fw_access_port_ofs =3D CSI_REG_HUB_FW_ACCESS_PORT_OFS;
=20
 =09if (IS_IPU4P(isp)) {
+=09=09isys_ipdata.num_parallel_streams =3D IPU4P_ISYS_MAX_STREAMS;
+=09=09isys_ipdata.max_streams =3D IPU4P_ISYS_MAX_STREAMS;
+=09=09isys_ipdata.sram_gran_shift =3D IPU4P_SRAM_GRANULARITY_SHIFT;
+=09=09isys_ipdata.sram_gran_size =3D IPU4P_SRAM_GRANULARITY_SIZE;
+=09=09isys_ipdata.max_sram_size =3D IPU4P_MAX_SRAM_SIZE;
+=09=09isys_ipdata.max_send_queues =3D IPU4P_N_MAX_SEND_QUEUES;
+=09=09isys_ipdata.max_sram_blocks =3D IPU4P_NOF_SRAM_BLOCKS_MAX;
+=09=09isys_ipdata.max_devq_size =3D IPU4P_DEV_SEND_QUEUE_SIZE;
 =09=09isys_ipdata.hw_variant.offset =3D IPU4P_ISYS_OFFSET;
 =09=09isys_ipdata.hw_variant.spc_offset =3D IPU4P_ISYS_SPC_OFFSET;
 =09=09isys_ipdata.hw_variant.dmem_offset =3D IPU4P_ISYS_DMEM_OFFSET;
--=20
2.56.0


