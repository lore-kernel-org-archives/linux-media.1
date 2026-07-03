Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8773CCFC4
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092384; cv=none; b=YyoJ0uHuZPhaZNwwiH7CjrnkzMRQ7+ngrFpAlWddApPfR9RmoJ/663P97a8VI6HzMRyPACtYlZZjEwTZjGljcWvYVlzHUibYiysHbPD2oEq5dgQn++TBUgO8TNO421esA46eetQFx0o5NIp+iqC93XedkBrn+H9gDhfIyq5bmmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092384; c=relaxed/simple;
	bh=pqn7jEmvFjtnrZdcNCMSo9zlKAD3mQm1/STI2PXQtFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CiE6DDz2Hz91kFPi1b7nsnHYUIN1AqSr7KH2XEdXPMjwWq7UQJx8Dh46gxj5kaLLopzuh3c+0TbfF1sbk5rVdQ8yXaHkvQYKRaMsGz9RrE324Ou2mmWxjns4Efo0nVuzuu707qNjsiFYw8mPNvRvbhjwh7OwLSQteLAEmkdZ5eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iu9IqYr0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iu9IqYr0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092383; x=1814628383;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pqn7jEmvFjtnrZdcNCMSo9zlKAD3mQm1/STI2PXQtFc=;
  b=iu9IqYr0eoMgRYNiO+A3JpweShGmwPGMu8GbXEXL9g2vkDVtGQK+PxOs
   r9kf54t9kDnZOgm6fsI9YRzNmznOZnkMohahzA5o47mU7zq+2h68G34vM
   kDMGNad1S2AQmu0Gy0fFMNO+U0dSgEZS1FqsU61NU5Q6ZLsGc+FtzwhjF
   //7IgTZ+saBvBlOPnBUsKaCl4J/qxTcND2Ct65rR5qc+LipHQVwSmGm1j
   C06biI4cUtBM+QTeA8MZkCQ+URdrb/CCqVc9m2Pe6lbo4UxNgLMDxb6Ss
   9D25djZI3QhIzw8pwAxXJxnpNID07NrPW6Go4oO5ghiz0cCmmflnuKdWV
   g==;
X-CSE-ConnectionGUID: j0nSXZCERcCfV+CF9trQxQ==
X-CSE-MsgGUID: P7wpDGTLR4atHGi8zmyyHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396247"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396247"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:23 -0700
X-CSE-ConnectionGUID: cXANN5B/TomaRhfFP4+mWQ==
X-CSE-MsgGUID: 2QD9+XoASoypgiXYdBT2Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799788"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:21 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 31/41] media: ipu6: The VC arbitration mechanism is ipu6 only
Date: Fri,  3 Jul 2026 18:24:41 +0300
Message-ID: <20260703152451.1743132-32-antti.laakso@linux.intel.com>
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

Skip it for ipu7.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 15d1590eda06..79661ff158f1 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -369,7 +369,12 @@ static int ipu6_pci_config_setup(struct pci_dev *dev)
 
 static void ipu6_configure_vc_mechanism(struct ipu6_device *isp)
 {
-	u32 val = readl(isp->base + BUTTRESS_REG_BTRS_CTRL);
+	u32 val;
+
+	if (pci_match_id(ipu7_ids, isp->pdev))
+		return;
+
+	val = readl(isp->base + BUTTRESS_REG_BTRS_CTRL);
 
 	if (IPU6_BTRS_ARB_STALL_MODE_VC0 == IPU6_BTRS_ARB_MODE_TYPE_STALL)
 		val |= BUTTRESS_REG_BTRS_CTRL_STALL_MODE_VC0;
-- 
2.54.0

