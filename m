Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03D848B36A
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312674; cv=none; b=gakIGPVX6Yn8AEMmlRur16P0FyYbpg+qX8OqUGd3gaxYBwgpT5JW8c448mB5l0LPhE8OMcFI5/j7NGuJYR/QazE5fLADNAPF1ZDYHDdx1RAiyY4trBHRHpMXOqUwUJm77KRMw00nu6j6wYNcJsWdCM/L6P3YB2vA83j9kJGWBOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312674; c=relaxed/simple;
	bh=lSTdoCKCMG0V5EcxP4fWwde5WEMr92ywHfMh1Gndu40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EIh48PCO6hwZZZfPyphDaEOtvugwLNGzW1+uHz5tItNrYnbOEyc7OTcXoXxhmalDDsd4SQT+XNendlggGN90CVAu73oZSq6Kd4bxc/PyPk8TwGPWnphD6uBFo8iqD87Ast9z4dZK0GnLL4qd9ALFDCQZHAzTPtzf67UD1oK/0QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JP6DgPX7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JP6DgPX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312672; x=1818848672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lSTdoCKCMG0V5EcxP4fWwde5WEMr92ywHfMh1Gndu40=;
  b=JP6DgPX7LdXxgRnImCntUGxvxr2gLeS5j9NJJsN5ZoYotlZzEl6WVCsE
   i04jJMIm60VPJGbZk7S3GG18V28EsilOL8y2e2cLiPBTjXyIoAYVpyBa6
   0RDBqvyKNBBVdh/ww2kmhINxIQm2Bj/35IvgYppiP/2Eh1ESOZuu/nkAl
   Iz84fVL8xja4T+Z0MK8HHFj7Af84+8jKLEJ5vmhdGn2tVVrumvRzq0Ix1
   Ps9rTEj32ZZ+GH7fsNgnPY+Pawlw8OYXY3WJM7tn2DYQ7Tct3GA15uxAk
   bgRlweLEzE1l4Ox26cDXeceIsy0lCvTnhb2eYn6jzGZf3C7IPNo2Xfvhx
   Q==;
X-CSE-ConnectionGUID: m8VvD73MTa2JlWGow/RkwA==
X-CSE-MsgGUID: etPzXXa6ThqkbDdX9Bdn1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989092"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989092"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:32 -0700
X-CSE-ConnectionGUID: z3IhjKH7SXCzJ8YF6kRPsw==
X-CSE-MsgGUID: 1gUr2FthRVSSrcMQwjCjFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172324"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:30 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 23/44] media: ipu6: Add ipu7 fw com methods
Date: Fri, 21 Aug 2026 14:42:41 +0300
Message-ID: <20260821114302.365532-24-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821114302.365532-1-antti.laakso@linux.intel.com>
References: <20260821114302.365532-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The get/put token methods read/write to ipu7 firmware message queues.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/Makefile      |  4 +-
 drivers/media/pci/intel/ipu6/ipu7-fw-com.c | 74 ++++++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu7-fw-com.h | 51 +++++++++++++++
 3 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-com.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-com.h

diff --git a/drivers/media/pci/intel/ipu6/Makefile b/drivers/media/pci/intel/ipu6/Makefile
index c0daf0995b22..406e2e19df17 100644
--- a/drivers/media/pci/intel/ipu6/Makefile
+++ b/drivers/media/pci/intel/ipu6/Makefile
@@ -8,7 +8,9 @@ intel-ipu6-y			:= ipu6.o \
 				ipu7-mmu-hw.o \
 				ipu6-buttress.o \
 				ipu6-cpd.o \
-				ipu6-fw-com.o
+				ipu6-fw-com.o \
+				ipu7-fw-com.o \
+				ipu7-boot.o
 
 obj-$(CONFIG_VIDEO_INTEL_IPU6)	+= intel-ipu6.o
 
diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-com.c b/drivers/media/pci/intel/ipu6/ipu7-fw-com.c
new file mode 100644
index 000000000000..7dd1e683aa92
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-com.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Intel Corporation
+ */
+
+#include <linux/io.h>
+
+#include "ipu7-fw-com.h"
+
+static void __iomem *ipu7_fw_com_get_indices(struct ipu7_fw_com_context *ctx,
+					     u32 q)
+{
+	return ctx->queue_indices + (q * sizeof(struct ipu7_fw_com_queue_indices));
+}
+
+void *ipu7_fw_com_get_token(struct ipu7_fw_com_context *ctx, int q)
+{
+	struct ipu7_fw_com_queue_config *queue_params = &ctx->queue_configs[q];
+	void __iomem *queue_indices = ipu7_fw_com_get_indices(ctx, q);
+	u32 write_index = readl(queue_indices +
+				offsetof(struct ipu7_fw_com_queue_indices,
+					 write_index));
+	u32 read_index = readl(queue_indices +
+			       offsetof(struct ipu7_fw_com_queue_indices,
+					read_index));
+	void *token = NULL;
+
+	if (q < ctx->num_output_queues) {
+		/* Output queue */
+		bool empty = (write_index == read_index);
+
+		if (!empty)
+			token = queue_params->token_array_mem +
+				read_index *
+				queue_params->token_size_in_bytes;
+	} else {
+		/* Input queue */
+		bool full = (read_index == ((write_index + 1U) %
+					    (u32)queue_params->max_capacity));
+
+		if (!full)
+			token = queue_params->token_array_mem +
+				write_index * queue_params->token_size_in_bytes;
+	}
+	return token;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_fw_com_get_token, "INTEL_IPU6");
+
+void ipu7_fw_com_put_token(struct ipu7_fw_com_context *ctx, int q)
+{
+	struct ipu7_fw_com_queue_config *queue_params = &ctx->queue_configs[q];
+	void __iomem *queue_indices = ipu7_fw_com_get_indices(ctx, q);
+	u32 offset, index;
+
+	if (q < ctx->num_output_queues)
+		/* Output queue */
+		offset = offsetof(struct ipu7_fw_com_queue_indices, read_index);
+
+	else
+		/* Input queue */
+		offset = offsetof(struct ipu7_fw_com_queue_indices, write_index);
+
+	index = readl(queue_indices + offset);
+	writel((index + 1U) % queue_params->max_capacity,
+	       queue_indices + offset);
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_fw_com_put_token, "INTEL_IPU6");
+
+struct ipu7_fw_com_queue_params_config *
+ipu7_fw_com_get_queue_config(struct ipu7_fw_com_config *config)
+{
+	return (struct ipu7_fw_com_queue_params_config *)(&config[1]);
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_fw_com_get_queue_config, "INTEL_IPU6");
diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-com.h b/drivers/media/pci/intel/ipu6/ipu7-fw-com.h
new file mode 100644
index 000000000000..10c09e759bed
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-com.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2026 Intel Corporation */
+
+#ifndef IPU7_FW_COM_H
+#define IPU7_FW_COM_H
+
+#include <linux/types.h>
+
+struct ipu7_fw_com_queue_config {
+	void *token_array_mem;
+	u32 queue_size;
+	u16 token_size_in_bytes;
+	u16 max_capacity;
+};
+
+struct ipu7_fw_com_context {
+	u16 num_input_queues;
+	u16 num_output_queues;
+	struct ipu7_fw_com_queue_config *queue_configs;
+	void __iomem *queue_indices;
+	dma_addr_t queue_mem_dma_addr;
+	void *queue_mem;
+	u32 queue_mem_size;
+	struct ipu7_boot_abi_cfg *boot_config;
+	dma_addr_t boot_config_dma_addr;
+	u32 boot_config_size;
+	u32 fw_entry;
+};
+
+struct ipu7_fw_com_queue_params_config {
+	u32 token_array_mem;
+	u16 token_size_in_bytes;
+	u16 max_capacity;
+};
+
+struct ipu7_fw_com_config {
+	u16 max_output_queues;
+	u16 max_input_queues;
+};
+
+struct ipu7_fw_com_queue_indices {
+	u32 read_index;
+	u32 write_index;
+};
+
+void ipu7_fw_com_put_token(struct ipu7_fw_com_context *ctx, int q);
+void *ipu7_fw_com_get_token(struct ipu7_fw_com_context *ctx, int q);
+struct ipu7_fw_com_queue_params_config *
+ipu7_fw_com_get_queue_config(struct ipu7_fw_com_config *config);
+
+#endif /* IPU7_FW_COM_H */
-- 
2.55.0

