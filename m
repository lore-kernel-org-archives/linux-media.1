Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C7E4B7A5E
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 11:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596630; cv=none; b=STWk3teQR5gsdYMi1WstYXaCqTNQlYfvVrm7YneFSc+CvOMUI6F35AddEdgFfXpRmBXkGm0rQnVeR0mEAQYyx25LuSm3LQVyVO8Ubn803jhl3W0EsKA/xSaoMJ4uRWo7PLSEbGHjAt+RKaHSLXA90jxUfnP54xUe7ft8m2Z2Y5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596630; c=relaxed/simple;
	bh=KmMZQ2IfNf0nd1yGJkCTM4DS5eJjeRYJx+jj1IUow6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkBRoCJ02Bj3suCWGS8sxhHXLUNDfsx/Ae36VvwFc4smq3Yw6QnEBAoBrB9t9bQYWr/NY1nyitqRS7fIE5bVQ/5mxqIXo5ZoJTBtD/GAgnuYHuNL91eWFn2V/HAzb++ICXUIR0pgqDB270wZj0xUaz97jUKGfjXHY3fm5d3UAlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myv3shNX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myv3shNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790596629; x=1822132629;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KmMZQ2IfNf0nd1yGJkCTM4DS5eJjeRYJx+jj1IUow6k=;
  b=myv3shNX9d/wof6gzD6K7IH/+sCjmLy4k1rnXm22mM51qou+ur9N7NaH
   phBFA6EkbHCGA7AVYCXU2natLlVR3nGN9JNtT9IZm4jm6GD8gRPUbNhcf
   WivPKamZBkK4z0qfo3ic3SrdwcibabLUG3fDaIGN4c6WBmJu3RkWihur3
   xTSqQdFV1ybQBBQ4ruHMJyxPFaZ3pO8XDn/WNw4OdGbtNYcqRk0u6c1Th
   zT6oT4svv9zzuU8DmQpIXPQMnL81alMmPvcq7ozcBMZJMHnrBxwlHc47t
   eJJyYH4W8BHbozvF+T4h0p7iriXtr+V8CxWu2I46ZTx9wSkyOFzO+W2Cb
   w==;
X-CSE-ConnectionGUID: S/gnrwgaSRiWhepO30WqCg==
X-CSE-MsgGUID: bE8kHrbMShW7GaqXV7DyXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90059373"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="90059373"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 04:57:01 -0700
X-CSE-ConnectionGUID: oM+IiKyPRcaFffIIH2gBnQ==
X-CSE-MsgGUID: EpeBncA9Q9iUtBA3y49/4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="302981378"
Received: from unknown (HELO pepper.iind.intel.com) ([10.223.20.54])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 04:56:59 -0700
From: Manik Bajpai <manik.bajpai@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com
Subject: [PATCH v1 3/4] media: ipu6: Validate fw-com queue indices before use
Date: Mon, 28 Sep 2026 17:26:45 +0530
Message-ID: <20260928115646.77399-4-manik.bajpai@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928115646.77399-1-manik.bajpai@intel.com>
References: <20260928115646.77399-1-manik.bajpai@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipu7_fw_com_get_token() reads read_index/write_index directly from
firmware-shared memory and uses them unchecked in pointer arithmetic
to compute a token address:

	token = queue_params->token_array_mem +
		read_index * queue_params->token_size_in_bytes;

If firmware ever writes a corrupted or out-of-range index into that
shared memory, this computes a pointer outside token_array_mem.

Reject indices that are not smaller than max_capacity before doing any
pointer arithmetic.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Manik Bajpai <manik.bajpai@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu7-fw-com.c  | 14 +++++++++++++-
 drivers/media/pci/intel/ipu6/ipu7-fw-com.h  |  5 ++++-
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c |  7 ++++---
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-com.c b/drivers/media/pci/intel/ipu6/ipu7-fw-com.c
index 7dd1e683aa92..3d0a8fcac15e 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-com.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-com.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2026 Intel Corporation
  */
 
+#include <linux/device.h>
 #include <linux/io.h>
 
 #include "ipu7-fw-com.h"
@@ -13,7 +14,8 @@ static void __iomem *ipu7_fw_com_get_indices(struct ipu7_fw_com_context *ctx,
 	return ctx->queue_indices + (q * sizeof(struct ipu7_fw_com_queue_indices));
 }
 
-void *ipu7_fw_com_get_token(struct ipu7_fw_com_context *ctx, int q)
+void *ipu7_fw_com_get_token(struct device *dev, struct ipu7_fw_com_context *ctx,
+			    int q)
 {
 	struct ipu7_fw_com_queue_config *queue_params = &ctx->queue_configs[q];
 	void __iomem *queue_indices = ipu7_fw_com_get_indices(ctx, q);
@@ -25,6 +27,16 @@ void *ipu7_fw_com_get_token(struct ipu7_fw_com_context *ctx, int q)
 					read_index));
 	void *token = NULL;
 
+	/* Indices come from firmware-shared memory; don't trust them blindly. */
+	if (read_index >= queue_params->max_capacity ||
+	    write_index >= queue_params->max_capacity) {
+		dev_err_once(dev,
+			     "ipu7-fw-com: bad queue %d index (r=%u w=%u cap=%u)\n",
+			     q, read_index, write_index,
+			     queue_params->max_capacity);
+		return NULL;
+	}
+
 	if (q < ctx->num_output_queues) {
 		/* Output queue */
 		bool empty = (write_index == read_index);
diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-com.h b/drivers/media/pci/intel/ipu6/ipu7-fw-com.h
index 097eaab99547..2921d097e580 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-com.h
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-com.h
@@ -6,6 +6,8 @@
 
 #include <linux/types.h>
 
+struct device;
+
 struct ipu7_fw_com_queue_config {
 	void *token_array_mem;
 	u32 queue_size;
@@ -46,7 +48,8 @@ struct ipu7_fw_com_queue_indices {
 };
 
 void ipu7_fw_com_put_token(struct ipu7_fw_com_context *ctx, int q);
-void *ipu7_fw_com_get_token(struct ipu7_fw_com_context *ctx, int q);
+void *ipu7_fw_com_get_token(struct device *dev, struct ipu7_fw_com_context *ctx,
+			    int q);
 struct ipu7_fw_com_queue_params_config *
 ipu7_fw_com_get_queue_config(struct ipu7_fw_com_config *config);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
index e74e2b2566aa..60e29e2d63a7 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
@@ -147,7 +147,8 @@ static int ipu7_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 
 static struct ipu7_insys_resp *ipu7_fw_isys_get_resp(struct ipu6_isys *isys)
 {
-	return ipu7_fw_com_get_token(isys->fwctx, IPU7_INSYS_OUTPUT_MSG_QUEUE);
+	return ipu7_fw_com_get_token(&isys->adev->auxdev.dev, isys->fwctx,
+				     IPU7_INSYS_OUTPUT_MSG_QUEUE);
 }
 
 static void ipu7_fw_isys_put_resp(struct ipu6_isys *isys)
@@ -219,7 +220,6 @@ ipu7_fw_isys_send_cmd(struct ipu6_isys *isys, const unsigned int stream_handle,
 		      size_t size, u16 send_type)
 {
 	struct ipu7_fw_com_context *ctx = isys->fwctx;
-	/*struct device *dev = &isys->adev->auxdev.dev;*/
 	struct ipu7_insys_send_queue_token *token;
 
 	if (send_type >= N_IPU7_INSYS_SEND_TYPE)
@@ -228,7 +228,8 @@ ipu7_fw_isys_send_cmd(struct ipu6_isys *isys, const unsigned int stream_handle,
 	if (cpu_mapped_buf)
 		clflush_cache_range(cpu_mapped_buf, size);
 
-	token = ipu7_fw_com_get_token(ctx, stream_handle +
+	token = ipu7_fw_com_get_token(&isys->adev->auxdev.dev, ctx,
+				      stream_handle +
 				      IPU7_INSYS_INPUT_MSG_QUEUE);
 	if (!token)
 		return -EBUSY;
-- 
2.53.0

