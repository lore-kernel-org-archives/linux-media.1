Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06343DB305
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092319; cv=none; b=EWZ/RIGowncp5NVERjlmQ51icj2eg48r0VPWFYS86UvSBeixC9gwCW2C9B38WnTqDkKTsr4iuI3Y4mOemPTXe0OZqU3G0Xm3e7FZfZxfFt/eiU94qIY95GsvnO8Vhp2wF4Lw0tKePugKTG/2Fl0Ms0XpTHBVB1VZqtb9N1kAunY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092319; c=relaxed/simple;
	bh=SZgHksKn5IvRYSDRu7bWUQbo7VZY/DTW0sI+HcJcg3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g7bi9q3HQZgdo9CwKErIuHOvuZAibBMOU3TLoxVJoAhToclSDlty54i5G7FPi6d22qiU2SUDtXD12+FaNH34JdgUtrxHn1sB/6HmLKoRs6UW2/YQKbN9VmAkW48PUS5sqWyb1+Aebn7ws+XOwSISRFWLAnVVO6QCR9JHbG60g8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+pPtJK4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+pPtJK4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092318; x=1814628318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SZgHksKn5IvRYSDRu7bWUQbo7VZY/DTW0sI+HcJcg3Q=;
  b=O+pPtJK4/UWIZDHiyKwZNk1S5o4CLZ5nmbltYufRtNjF+DQCnCoVpPAK
   1ModzfsZ8Ju94q+2/2qC1l6G3QRehzBMrnFwTk66aBnqGZFagO4zwc9tN
   oiU8Pi340TDCjS83gZ3MgnobTDs5Dzlz2osMVFV6ZrINSgLpTFbRfZbNh
   wCOWy85k9WRxCnyT35CwRohWZ/oS61Pj816BADyI9oPEAvxqoSqGpE96/
   yv/JarmSmExvAV6AG75tGAyU2cqLcdEc/A/ckmf/0/MAe1lTdH47je3ke
   V0ib82zjcatTYOiT7ttkgPFitlxgAueYrm9l41pYfFd30JRkK3W1MQLc5
   g==;
X-CSE-ConnectionGUID: eAzPhXj9RhelROlP6W7H7g==
X-CSE-MsgGUID: AJ8lVt+ZTmaSRiVkgTIAAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396118"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396118"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:17 -0700
X-CSE-ConnectionGUID: /90cvzZSTO62fAyav7lNcA==
X-CSE-MsgGUID: b/J7qctiTVu8SBpHadQ1WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799469"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:16 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 03/41] media: ipu6: Rename buttress_ipc pointer
Date: Fri,  3 Jul 2026 18:24:13 +0300
Message-ID: <20260703152451.1743132-4-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
References: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ipu6_buttress_ipc structure is called as cse sometimes,
rename it to ipc for consistency.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 33 ++++++++++----------
 drivers/media/pci/intel/ipu6/ipu6-buttress.h |  2 +-
 drivers/media/pci/intel/ipu6/ipu6.c          |  4 +--
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index e0ecb4c8b081..cbe356589a9d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -221,7 +221,7 @@ static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
 	unsigned long tx_timeout_jiffies, rx_timeout_jiffies;
 	unsigned int i, retry = BUTTRESS_IPC_CMD_SEND_RETRY;
 	struct ipu6_buttress *b = &isp->buttress;
-	struct ipu6_buttress_ipc *ipc = &b->cse;
+	struct ipu6_buttress_ipc *ipc = &b->ipc;
 	u32 val;
 	int ret;
 	int tout;
@@ -378,14 +378,15 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 		if (irq_status & BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING) {
 			dev_dbg(&isp->pdev->dev,
 				"BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING\n");
-			ipu6_buttress_ipc_recv(isp, &b->cse, &b->cse.recv_data);
-			complete(&b->cse.recv_complete);
+
+			ipu6_buttress_ipc_recv(isp, &b->ipc, &b->ipc.recv_data);
+			complete(&b->ipc.recv_complete);
 		}
 
 		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE) {
 			dev_dbg(&isp->pdev->dev,
 				"BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
-			complete(&b->cse.send_complete);
+			complete(&b->ipc.send_complete);
 		}
 
 		if (irq_status & BUTTRESS_ISR_SAI_VIOLATION &&
@@ -830,17 +831,17 @@ int ipu6_buttress_init(struct ipu6_device *isp)
 	mutex_init(&b->auth_mutex);
 	mutex_init(&b->cons_mutex);
 	mutex_init(&b->ipc_mutex);
-	init_completion(&b->cse.send_complete);
-	init_completion(&b->cse.recv_complete);
-
-	b->cse.nack = BUTTRESS_CSE2IUDATA0_IPC_NACK;
-	b->cse.nack_mask = BUTTRESS_CSE2IUDATA0_IPC_NACK_MASK;
-	b->cse.csr_in = BUTTRESS_REG_CSE2IUCSR;
-	b->cse.csr_out = BUTTRESS_REG_IU2CSECSR;
-	b->cse.db0_in = BUTTRESS_REG_CSE2IUDB0;
-	b->cse.db0_out = BUTTRESS_REG_IU2CSEDB0;
-	b->cse.data0_in = BUTTRESS_REG_CSE2IUDATA0;
-	b->cse.data0_out = BUTTRESS_REG_IU2CSEDATA0;
+	init_completion(&b->ipc.send_complete);
+	init_completion(&b->ipc.recv_complete);
+
+	b->ipc.nack = BUTTRESS_CSE2IUDATA0_IPC_NACK;
+	b->ipc.nack_mask = BUTTRESS_CSE2IUDATA0_IPC_NACK_MASK;
+	b->ipc.csr_in = BUTTRESS_REG_CSE2IUCSR;
+	b->ipc.csr_out = BUTTRESS_REG_IU2CSECSR;
+	b->ipc.db0_in = BUTTRESS_REG_CSE2IUDB0;
+	b->ipc.db0_out = BUTTRESS_REG_IU2CSEDB0;
+	b->ipc.data0_in = BUTTRESS_REG_CSE2IUDATA0;
+	b->ipc.data0_out = BUTTRESS_REG_IU2CSEDATA0;
 
 	INIT_LIST_HEAD(&b->constraints);
 
@@ -877,7 +878,7 @@ int ipu6_buttress_init(struct ipu6_device *isp)
 
 	/* Retry couple of times in case of CSE initialization is delayed */
 	do {
-		ret = ipu6_buttress_ipc_reset(isp, &b->cse);
+		ret = ipu6_buttress_ipc_reset(isp, &b->ipc);
 		if (ret) {
 			dev_warn(&isp->pdev->dev,
 				 "IPC reset protocol failed, retrying\n");
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
index 51e5ad48db82..b1c1a10e3e6d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
@@ -44,7 +44,7 @@ struct ipu6_buttress_ipc {
 
 struct ipu6_buttress {
 	struct mutex power_mutex, auth_mutex, cons_mutex, ipc_mutex;
-	struct ipu6_buttress_ipc cse;
+	struct ipu6_buttress_ipc ipc;
 	struct list_head constraints;
 	u32 wdt_cached_value;
 	bool force_suspend;
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 55686fccb537..23013454f94f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -766,7 +766,7 @@ static int ipu6_resume(struct device *dev)
 
 	ipu6_buttress_restore(isp);
 
-	ret = ipu6_buttress_ipc_reset(isp, &b->cse);
+	ret = ipu6_buttress_ipc_reset(isp, &b->ipc);
 	if (ret)
 		dev_err(&isp->pdev->dev, "IPC reset protocol failed!\n");
 
@@ -798,7 +798,7 @@ static int ipu6_runtime_resume(struct device *dev)
 		struct ipu6_buttress *b = &isp->buttress;
 
 		isp->need_ipc_reset = false;
-		ret = ipu6_buttress_ipc_reset(isp, &b->cse);
+		ret = ipu6_buttress_ipc_reset(isp, &b->ipc);
 		if (ret)
 			dev_err(&isp->pdev->dev, "IPC reset protocol failed\n");
 	}
-- 
2.54.0

