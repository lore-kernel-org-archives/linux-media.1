Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5314D418373
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312630; cv=none; b=MQs2Q6ORV1PgzNfUdGMh52cvH9EfMi5uVH/Bze0hcCRVdHnZu/v4qqALk5tFgFJmrfogWcVaJOBc2rwsiw2x9TWm5NEsyWrEDAZ7NkQP5PnwM+Z5If/zCtXjpGziofkjXnVeJ4Dn7xO2/pzH+MZ3b1VaEGzJ50eD9gfnGQ8LhpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312630; c=relaxed/simple;
	bh=5Yj1e64/IDdtZWjciyHzSmCxxxRyUmzDXt4TcUdzs+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sojaSYoFpMVd7K2qgNSgipu/p2qXrOcnnyAiBnXmiYXjpyYzYLjmyvN2OqZthjTjB5aQAABoDEnzMs31K+Qy7i9JJL3Oqbdz6hTY9DoVEL5W20OL4at1f7TwL5OsCh/ZHaucRUwKcMOa8tWBpYOOX6AMEXZtCOCwfOAh+qRwuUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VvzNBF5f; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VvzNBF5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312628; x=1818848628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5Yj1e64/IDdtZWjciyHzSmCxxxRyUmzDXt4TcUdzs+c=;
  b=VvzNBF5fXpxcCSVBUPXJA7xJ7g8e0nlD/CdQ9iZIS/fS+prQjILmkIaP
   3ZYXUgluDsryfj1PhKa5MEPk9AOrBRnUBJucCN4+FaOeSvnoo+IuuEAw8
   3CEfAQzMk4DSq8rUXdV20Esh84k2hZ0ENbuGSh8v+xocLcGFVf854lv1G
   LB+ylsJ9MR47Hgvrpfnp6Ntv7m1V1Jloduf4I+fIgj5+ZaHL/IT+2fmwx
   9Ja8wSgWtrwHdZmpupY+J5crPxmuShHxEFolJgBWy+6Kl+x3LL0DWBTbe
   ZBOpjzz0UfCpQglsN5jKc+sf+Msfojcszv/KmvmidEchX27JAsy+/0aTl
   A==;
X-CSE-ConnectionGUID: hs66bFIVSSuxhcIQm/cuaA==
X-CSE-MsgGUID: 7DU2DFgPR4SyVQEuayQgFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989001"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989001"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:43:48 -0700
X-CSE-ConnectionGUID: WSm3D87WQImFi6qXAzHUIg==
X-CSE-MsgGUID: HFBTAUrlQ0OQOukgi5s19Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172149"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:43:45 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 03/44] media: ipu6: Rename buttress_ipc pointer
Date: Fri, 21 Aug 2026 14:42:21 +0300
Message-ID: <20260821114302.365532-4-antti.laakso@linux.intel.com>
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
index 6d3235352a1c..efb58bc4d127 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -765,7 +765,7 @@ static int ipu6_resume(struct device *dev)
 
 	ipu6_buttress_restore(isp);
 
-	ret = ipu6_buttress_ipc_reset(isp, &b->cse);
+	ret = ipu6_buttress_ipc_reset(isp, &b->ipc);
 	if (ret)
 		dev_err(&isp->pdev->dev, "IPC reset protocol failed!\n");
 
@@ -797,7 +797,7 @@ static int ipu6_runtime_resume(struct device *dev)
 		struct ipu6_buttress *b = &isp->buttress;
 
 		isp->need_ipc_reset = false;
-		ret = ipu6_buttress_ipc_reset(isp, &b->cse);
+		ret = ipu6_buttress_ipc_reset(isp, &b->ipc);
 		if (ret)
 			dev_err(&isp->pdev->dev, "IPC reset protocol failed\n");
 	}
-- 
2.55.0

