Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643243469FA
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 08:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670706; cv=none; b=cTysloKgj0v2uymDGiCsI08DfIW7lB/oSw0mrw281iD9MkjcyD2i/1/2dmmF4nGUy+kzpu9Ti8AUqihMDbrdCYS1Xd1NPLMqlkrTur8UKbTBaJRu4xE31Gf/2f1XJORCupNQtSgsYLL8LPd8Dvg/yxhq4l9nXEeXPP8A7B7cMiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670706; c=relaxed/simple;
	bh=KmMZQ2IfNf0nd1yGJkCTM4DS5eJjeRYJx+jj1IUow6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlIz1+g5/Hy/TLtLjkyOiALheYi3usU4ubjOtJ6nzGldxXy3Txz9ADK/WoCNytc0yO3usIMoGM8kyp41Tqph0cpW09IPecwgeVaa63ogVOE5ExfWt/cctnUAr8nSMBXfjNH3lvJHoUs5gvrrBlMilP3sDji5vTXPoIED8ZiCFRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbpQMVGt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbpQMVGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790670704; x=1822206704;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KmMZQ2IfNf0nd1yGJkCTM4DS5eJjeRYJx+jj1IUow6k=;
  b=kbpQMVGtAWrkk2F+K6zMtubDXg4qd48N1aMb90gQUoRr9QMXrguwaeMs
   P3IgFEEm3TlneTbrgGitO/qLRxPbJdzgoB+RtMIf6S5L9wtmftqAZgT+B
   GS5xEzVuVFel1azKv4kbk8rai3hXVcOMp6DVpz80edWAcssu85zCxryv5
   e06Zc5ZTtUGxx9jIPwl+3ieuK/t1g2JyXLUlfdyTzogqttLSlM979nm5S
   /Qwrgts03k6O8OX98PfDUAZZCQl4OMDE0nIjgZbZ7AIQnNT3yym6EYnvn
   uht4t7KkOwgyDtmHQ9kPLKFPtRs6I9sLMEmHeg6kOgq7ioQWFrU4lHFFZ
   Q==;
X-CSE-ConnectionGUID: r1jgmt7sTaGnBk2zGFZDSQ==
X-CSE-MsgGUID: WJZ9euESTpO51CTDdqs1JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101548902"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="101548902"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 01:31:44 -0700
X-CSE-ConnectionGUID: hhV6vc7ETIm6oR8gScX0fA==
X-CSE-MsgGUID: dzaRy0NRQe67A1u3dYvZog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="275339425"
Received: from unknown (HELO pepper.iind.intel.com) ([10.223.20.54])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 01:31:42 -0700
From: Manik Bajpai <manik.bajpai@intel.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com
Subject: [PATCH v2 3/4] media: ipu6: Validate fw-com queue indices before use
Date: Tue, 29 Sep 2026 14:01:29 +0530
Message-ID: <20260929083130.88381-4-manik.bajpai@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929083130.88381-1-manik.bajpai@intel.com>
References: <arpYuzb0yJinlDyH@kekkonen.localdomain>
 <20260929083130.88381-1-manik.bajpai@intel.com>
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

