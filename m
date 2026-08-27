Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42342F60CC
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834050; cv=none; b=EpBgEyC53e5OsaBlG0YUlQleLtil9Dv+/bKL+LTEcDjNEOL9VPQSE5E81HTvc2agllpsxj55opjj3ZBv6ktxNM+mOfVE3n6pQetfqkki1SPcD0lyfq99PGjzJHA6ZP4o6rvuc4FGFivcI+gfRJnqKm9d2UDmAfXSCWqYIlLjeYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834050; c=relaxed/simple;
	bh=lNlEF9xMDwRcTM2dVv3SGr5wYNCMAK/r+h6DG8sY/aU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pPb+WNQOqg1N8ulrqUsUmCg9kEGxNZ4+sTTVTZYBDKSRqPHPoiCXvHp4iMerr1wBv0PRsq4bMWUwbBtSBowRtmlWGEJTVdULigvCKWINTamMe4xNIc3/wI89/oanqTciQDOqXVLuYfW8C0+J1yb5SBXO89P0LlcMst7bC5bYeuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejByQZr6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejByQZr6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834049; x=1819370049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lNlEF9xMDwRcTM2dVv3SGr5wYNCMAK/r+h6DG8sY/aU=;
  b=ejByQZr68vhF0zlAh3iGxaSNa7drw7FSs47FgXaWDhNbZzh1XfjMbPA6
   cHZM2ec9DmcDtanTzEKgK8Wa9oXGg8O5oMoTwSXMoDS7zRRq0H0LFPS++
   9QYwK7L21trWzqf+PBU/ZaaViILMARaCWuBb9yJWJXfWI3LdCWAv0K2JD
   K2Q+U44kTHLL1CUYZcj9/VsHcMOdNm/aXOxoKrL2q7wAYCGodt1k0OlRV
   r9ZN9bNPqWn86Pc8DqH90Ih/eHSSQjd/ePXX6NwPrzC6sFhx1gWO7WTyP
   1Mn+QxGWZ0OPY9wFBZWzYaYvH5PHviD9RF4u9fmgFKGngWiIc2lbnlS0q
   A==;
X-CSE-ConnectionGUID: ah19dhjjR7uVhOjeloQuGw==
X-CSE-MsgGUID: kHf00oo4TWu+tW9+nRfAQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188581"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188581"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:09 -0700
X-CSE-ConnectionGUID: 1JBlXSICTta1SZgYec2Syw==
X-CSE-MsgGUID: 4BoK5KiTScaXdVp+LVil2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384337"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:07 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 10/44] media: ipu6: Use single struct for registers
Date: Thu, 27 Aug 2026 15:33:02 +0300
Message-ID: <20260827123336.2219048-11-antti.laakso@linux.intel.com>
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

Move register values from ipu6_buttress_ipc struct to
ipu6_buttress_registers as these are different in future
hardware versions as well.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 86 +++++++++-----------
 drivers/media/pci/intel/ipu6/ipu6-buttress.h | 17 ++--
 drivers/media/pci/intel/ipu6/ipu6.c          | 13 +--
 3 files changed, 54 insertions(+), 62 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index 3c5f4e407b7c..e77a569bb97e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -55,11 +55,11 @@
 
 #define BUTTRESS_MAX_CONSECUTIVE_IRQS	100
 
-int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
-			    struct ipu6_buttress_ipc *ipc)
+int ipu6_buttress_ipc_reset(struct ipu6_device *isp)
 {
 	unsigned int retries = BUTTRESS_IPC_RESET_RETRY;
 	struct ipu6_buttress *b = &isp->buttress;
+	const struct ipu6_buttress_registers *regs = b->regs;
 	u32 val = 0, csr_in_clr;
 
 	if (!isp->secure_mode) {
@@ -70,11 +70,11 @@ int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 	mutex_lock(&b->ipc_mutex);
 
 	/* Clear-by-1 CSR (all bits), corresponding internal states. */
-	val = readl(isp->base + ipc->csr_in);
-	writel(val, isp->base + ipc->csr_in);
+	val = readl(isp->base + regs->csr_in);
+	writel(val, isp->base + regs->csr_in);
 
 	/* Set peer CSR bit IPC_PEER_COMP_ACTIONS_RST_PHASE1 */
-	writel(ENTRY, isp->base + ipc->csr_out);
+	writel(ENTRY, isp->base + regs->csr_out);
 	/*
 	 * Clear-by-1 all CSR bits EXCEPT following
 	 * bits:
@@ -89,7 +89,7 @@ int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 
 	do {
 		usleep_range(400, 500);
-		val = readl(isp->base + ipc->csr_in);
+		val = readl(isp->base + regs->csr_in);
 		switch (val) {
 		case ENTRY | EXIT:
 		case ENTRY | EXIT | QUERY:
@@ -100,8 +100,8 @@ int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 			 * 2) Set peer CSR bit
 			 * IPC_PEER_QUERIED_IP_COMP_ACTIONS_RST_PHASE.
 			 */
-			writel(ENTRY | EXIT, isp->base + ipc->csr_in);
-			writel(QUERY, isp->base + ipc->csr_out);
+			writel(ENTRY | EXIT, isp->base + regs->csr_in);
+			writel(QUERY, isp->base + regs->csr_out);
 			break;
 		case ENTRY:
 		case ENTRY | QUERY:
@@ -112,8 +112,8 @@ int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 			 * 2) Set peer CSR bit
 			 * IPC_PEER_COMP_ACTIONS_RST_PHASE1.
 			 */
-			writel(ENTRY | QUERY, isp->base + ipc->csr_in);
-			writel(ENTRY, isp->base + ipc->csr_out);
+			writel(ENTRY | QUERY, isp->base + regs->csr_in);
+			writel(ENTRY, isp->base + regs->csr_out);
 			break;
 		case EXIT:
 		case EXIT | QUERY:
@@ -130,17 +130,17 @@ int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 			 * 3) Set peer CSR bit
 			 * IPC_PEER_COMP_ACTIONS_RST_PHASE2.
 			 */
-			writel(EXIT, isp->base + ipc->csr_in);
-			writel(0, isp->base + ipc->db0_in);
-			writel(csr_in_clr, isp->base + ipc->csr_in);
-			writel(EXIT, isp->base + ipc->csr_out);
+			writel(EXIT, isp->base + regs->csr_in);
+			writel(0, isp->base + regs->db0_in);
+			writel(csr_in_clr, isp->base + regs->csr_in);
+			writel(EXIT, isp->base + regs->csr_out);
 
 			/*
 			 * Read csr_in again to make sure if RST_PHASE2 is done.
 			 * If csr_in is QUERY, it should be handled again.
 			 */
 			usleep_range(200, 300);
-			val = readl(isp->base + ipc->csr_in);
+			val = readl(isp->base + regs->csr_in);
 			if (val & QUERY) {
 				dev_dbg(&isp->pdev->dev,
 					"RST_PHASE2 retry csr_in = %x\n", val);
@@ -155,8 +155,8 @@ int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 			 * 2) Set peer CSR bit
 			 * IPC_PEER_COMP_ACTIONS_RST_PHASE1
 			 */
-			writel(QUERY, isp->base + ipc->csr_in);
-			writel(ENTRY, isp->base + ipc->csr_out);
+			writel(QUERY, isp->base + regs->csr_in);
+			writel(ENTRY, isp->base + regs->csr_out);
 			break;
 		default:
 			dev_dbg_ratelimited(&isp->pdev->dev,
@@ -171,42 +171,42 @@ int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 	return -ETIMEDOUT;
 }
 
-static void ipu6_buttress_ipc_validity_close(struct ipu6_device *isp,
-					     struct ipu6_buttress_ipc *ipc)
+static void ipu6_buttress_ipc_validity_close(struct ipu6_device *isp)
 {
 	writel(BUTTRESS_IU2CSECSR_IPC_PEER_DEASSERTED_REG_VALID_REQ,
-	       isp->base + ipc->csr_out);
+	       isp->base + isp->buttress.regs->csr_out);
 }
 
 static int
-ipu6_buttress_ipc_validity_open(struct ipu6_device *isp,
-				struct ipu6_buttress_ipc *ipc)
+ipu6_buttress_ipc_validity_open(struct ipu6_device *isp)
 {
 	unsigned int mask = BUTTRESS_IU2CSECSR_IPC_PEER_ACKED_REG_VALID;
+	const struct ipu6_buttress_registers *regs = isp->buttress.regs;
 	void __iomem *addr;
 	int ret;
 	u32 val;
 
 	writel(BUTTRESS_IU2CSECSR_IPC_PEER_ASSERTED_REG_VALID_REQ,
-	       isp->base + ipc->csr_out);
+	       isp->base + regs->csr_out);
 
-	addr = isp->base + ipc->csr_in;
+	addr = isp->base + regs->csr_in;
 	ret = readl_poll_timeout(addr, val, val & mask, 200,
 				 BUTTRESS_IPC_VALIDITY_TIMEOUT_US);
 	if (ret) {
 		dev_err(&isp->pdev->dev, "CSE validity timeout 0x%x\n", val);
-		ipu6_buttress_ipc_validity_close(isp, ipc);
+		ipu6_buttress_ipc_validity_close(isp);
 	}
 
 	return ret;
 }
 
-static void ipu6_buttress_ipc_recv(struct ipu6_device *isp,
-				   struct ipu6_buttress_ipc *ipc, u32 *ipc_msg)
+static void ipu6_buttress_ipc_recv(struct ipu6_device *isp, u32 *ipc_msg)
 {
+	const struct ipu6_buttress_registers *regs = isp->buttress.regs;
+
 	if (ipc_msg)
-		*ipc_msg = readl(isp->base + ipc->data0_in);
-	writel(0, isp->base + ipc->db0_in);
+		*ipc_msg = readl(isp->base + regs->data0_in);
+	writel(0, isp->base + regs->db0_in);
 }
 
 static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
@@ -217,13 +217,14 @@ static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
 	unsigned int i, retry = BUTTRESS_IPC_CMD_SEND_RETRY;
 	struct ipu6_buttress *b = &isp->buttress;
 	struct ipu6_buttress_ipc *ipc = &b->ipc;
+	const struct ipu6_buttress_registers *regs = b->regs;
 	u32 val;
 	int ret;
 	int tout;
 
 	mutex_lock(&b->ipc_mutex);
 
-	ret = ipu6_buttress_ipc_validity_open(isp, ipc);
+	ret = ipu6_buttress_ipc_validity_open(isp);
 	if (ret) {
 		dev_err(&isp->pdev->dev, "IPC validity open failed\n");
 		goto out;
@@ -239,9 +240,9 @@ static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
 
 		dev_dbg(&isp->pdev->dev, "bulk IPC command: 0x%x\n",
 			msgs[i].cmd);
-		writel(msgs[i].cmd, isp->base + ipc->data0_out);
+		writel(msgs[i].cmd, isp->base + regs->data0_out);
 		val = BUTTRESS_IU2CSEDB0_BUSY | msgs[i].cmd_size;
-		writel(val, isp->base + ipc->db0_out);
+		writel(val, isp->base + regs->db0_out);
 
 		tout = wait_for_completion_timeout(&ipc->send_complete,
 						   tx_timeout_jiffies);
@@ -253,7 +254,7 @@ static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
 			}
 
 			/* Try again if CSE is not responding on first try */
-			writel(0, isp->base + ipc->db0_out);
+			writel(0, isp->base + regs->db0_out);
 			i--;
 			continue;
 		}
@@ -271,8 +272,8 @@ static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
 			goto out;
 		}
 
-		if (ipc->nack_mask &&
-		    (ipc->recv_data & ipc->nack_mask) == ipc->nack) {
+		if ((ipc->recv_data & BUTTRESS_CSE2IUDATA0_IPC_NACK_MASK) ==
+		     BUTTRESS_CSE2IUDATA0_IPC_NACK) {
 			dev_err(&isp->pdev->dev,
 				"IPC NACK for cmd 0x%x\n", msgs[i].cmd);
 			ret = -EIO;
@@ -291,7 +292,7 @@ static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
 	dev_dbg(&isp->pdev->dev, "bulk IPC commands done\n");
 
 out:
-	ipu6_buttress_ipc_validity_close(isp, ipc);
+	ipu6_buttress_ipc_validity_close(isp);
 	mutex_unlock(&b->ipc_mutex);
 	return ret;
 }
@@ -375,7 +376,7 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 			dev_dbg(&isp->pdev->dev,
 				"BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING\n");
 
-			ipu6_buttress_ipc_recv(isp, &b->ipc, &b->ipc.recv_data);
+			ipu6_buttress_ipc_recv(isp, &b->ipc.recv_data);
 			complete(&b->ipc.recv_complete);
 		}
 
@@ -836,15 +837,6 @@ int ipu6_buttress_init(struct ipu6_device *isp)
 	init_completion(&b->ipc.send_complete);
 	init_completion(&b->ipc.recv_complete);
 
-	b->ipc.nack = BUTTRESS_CSE2IUDATA0_IPC_NACK;
-	b->ipc.nack_mask = BUTTRESS_CSE2IUDATA0_IPC_NACK_MASK;
-	b->ipc.csr_in = BUTTRESS_REG_CSE2IUCSR;
-	b->ipc.csr_out = BUTTRESS_REG_IU2CSECSR;
-	b->ipc.db0_in = BUTTRESS_REG_CSE2IUDB0;
-	b->ipc.db0_out = BUTTRESS_REG_IU2CSEDB0;
-	b->ipc.data0_in = BUTTRESS_REG_CSE2IUDATA0;
-	b->ipc.data0_out = BUTTRESS_REG_IU2CSEDATA0;
-
 	INIT_LIST_HEAD(&b->constraints);
 
 	isp->secure_mode = ipu6_buttress_get_secure_mode(isp);
@@ -880,7 +872,7 @@ int ipu6_buttress_init(struct ipu6_device *isp)
 
 	/* Retry couple of times in case of CSE initialization is delayed */
 	do {
-		ret = ipu6_buttress_ipc_reset(isp, &b->ipc);
+		ret = ipu6_buttress_ipc_reset(isp);
 		if (ret) {
 			dev_warn(&isp->pdev->dev,
 				 "IPC reset protocol failed, retrying\n");
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
index 68586a32fda3..a3c23adede7b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
@@ -31,15 +31,7 @@ struct ipu6_buttress_ctrl {
 struct ipu6_buttress_ipc {
 	struct completion send_complete;
 	struct completion recv_complete;
-	u32 nack;
-	u32 nack_mask;
 	u32 recv_data;
-	u32 csr_out;
-	u32 csr_in;
-	u32 db0_in;
-	u32 db0_out;
-	u32 data0_out;
-	u32 data0_in;
 };
 
 struct ipu6_buttress_registers {
@@ -55,6 +47,12 @@ struct ipu6_buttress_registers {
 	u32 tsc_lo;
 	u32 wdt;
 	u32 btrs_ctrl;
+	u32 csr_in;
+	u32 csr_out;
+	u32 db0_in;
+	u32 db0_out;
+	u32 data0_in;
+	u32 data0_out;
 
 	/* Bitmasks */
 	u32 irq_is;
@@ -83,8 +81,7 @@ struct ipu6_ipc_buttress_bulk_msg {
 	u8 cmd_size;
 };
 
-int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
-			    struct ipu6_buttress_ipc *ipc);
+int ipu6_buttress_ipc_reset(struct ipu6_device *isp);
 int ipu6_buttress_map_fw_image(struct ipu6_bus_device *sys,
 			       const struct firmware *fw,
 			       struct sg_table *sgt);
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 55e660fda421..7ac9c92744c0 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -241,6 +241,12 @@ static const struct ipu6_buttress_registers ipu6_buttress_regs = {
 	.tsc_lo		= BUTTRESS_REG_TSC_LO,
 	.wdt		= BUTTRESS_REG_WDT,
 	.btrs_ctrl	= BUTTRESS_REG_BTRS_CTRL,
+	.csr_in		= BUTTRESS_REG_CSE2IUCSR,
+	.csr_out	= BUTTRESS_REG_IU2CSECSR,
+	.db0_in		= BUTTRESS_REG_CSE2IUDB0,
+	.db0_out	= BUTTRESS_REG_IU2CSEDB0,
+	.data0_in	= BUTTRESS_REG_CSE2IUDATA0,
+	.data0_out	= BUTTRESS_REG_IU2CSEDATA0,
 
 	/* Bitmasks */
 	.irq_is		= BUTTRESS_ISR_IS_IRQ,
@@ -779,7 +785,6 @@ static int ipu6_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct ipu6_device *isp = pci_get_drvdata(pdev);
-	struct ipu6_buttress *b = &isp->buttress;
 	int ret;
 
 	/* Configure the arbitration mechanisms for VC requests */
@@ -791,7 +796,7 @@ static int ipu6_resume(struct device *dev)
 
 	ipu6_buttress_restore(isp);
 
-	ret = ipu6_buttress_ipc_reset(isp, &b->ipc);
+	ret = ipu6_buttress_ipc_reset(isp);
 	if (ret)
 		dev_err(&isp->pdev->dev, "IPC reset protocol failed!\n");
 
@@ -820,10 +825,8 @@ static int ipu6_runtime_resume(struct device *dev)
 	ipu6_buttress_restore(isp);
 
 	if (isp->need_ipc_reset) {
-		struct ipu6_buttress *b = &isp->buttress;
-
 		isp->need_ipc_reset = false;
-		ret = ipu6_buttress_ipc_reset(isp, &b->ipc);
+		ret = ipu6_buttress_ipc_reset(isp);
 		if (ret)
 			dev_err(&isp->pdev->dev, "IPC reset protocol failed\n");
 	}
-- 
2.55.0

