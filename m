Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D499830B517
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834102; cv=none; b=rwTzX16aFueLH76Mmca/kzNGVJWfHSzfgrwzAryMT+BhDkN4c4AML8yOpo+yHYWDqeZeyOJmhyB77jOANzEu/3DM8kC3yHflkCcwbPR+GlbOTO/8qJCWZyJXgARBGda/0sJJ3kLChr1s9+NxqhrbRnes4es4kQaZTuCQLlrBP58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834102; c=relaxed/simple;
	bh=KeFdm7ZM020ep5ugKl1/7LLqSxzlfwlljpnaQuS6flI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F59YGJ3p/lhVahA0mVfwxtDHLA1c7pqW4K8BBnovCpBa7GhJUOUN42twb35f/35ZnzqY7jHBWPdO52Wj9t+Rf3w4ohoRMABHo8aU43WRUH/aN5vXxFdy/cBF2tD8+IxytDSKMphbm2p3IDkZIdZ4vDt9I87jv3Js7ee7zhPVXQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDE8OHm6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDE8OHm6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834100; x=1819370100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KeFdm7ZM020ep5ugKl1/7LLqSxzlfwlljpnaQuS6flI=;
  b=PDE8OHm6Qz1LNFJGTuTMs4KLqu5uljTlIlB9S8DPB1nyYz5cpPgwOJvh
   idO+wCym9lTCSXrzzlTCugK2ZeJHE60QMCW+JIHohU6mw9lqOTahztjoF
   nKCTB34FWEd4iKuPEc/QAE/c5F2tVbE5CmVMm8Mnhmh9FGG3zB6SV1QH/
   OIiALqf8hXeAf5HSJbN2R2AbTXZMMlKlQ2CyirE4uZUuAaLFJxQa5WUmQ
   Gy9F84VZYiy4+hy9H/M3+CrCE/Zv6R6qtSKB01MvpKm6ZSrMKW9RQl3Bb
   D65V/NNIRkQ82Qhpjt3SyTN3w9bZLFvum5FtgQafjTHy20+ns4zTFlyS+
   Q==;
X-CSE-ConnectionGUID: m2csw+Y7RSa+D/S40czEvA==
X-CSE-MsgGUID: /WyUkpJERkq58vWiYM/sQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188660"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188660"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:57 -0700
X-CSE-ConnectionGUID: 1sICnHKwT7i5sS2RFA/n7Q==
X-CSE-MsgGUID: RDJaXOJ3Qtq2QB2pyLX9Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384511"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:56 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 34/44] media: ipu6: The VC arbitration mechanism is ipu6 only
Date: Thu, 27 Aug 2026 15:33:26 +0300
Message-ID: <20260827123336.2219048-35-antti.laakso@linux.intel.com>
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

The ipu7 doesn't support the VC arbitration mechanism that exist in
ipu6.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index cb1145080460..7d1c3713a69b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -447,7 +447,12 @@ static int ipu6_pci_config_setup(struct pci_dev *dev)
 
 static void ipu6_configure_vc_mechanism(struct ipu6_device *isp)
 {
-	u32 val = readl(isp->base + BUTTRESS_REG_BTRS_CTRL);
+	u32 val;
+
+	if (IS_IPU7(isp))
+		return;
+
+	val = readl(isp->base + BUTTRESS_REG_BTRS_CTRL);
 
 	if (IPU6_BTRS_ARB_STALL_MODE_VC0 == IPU6_BTRS_ARB_MODE_TYPE_STALL)
 		val |= BUTTRESS_REG_BTRS_CTRL_STALL_MODE_VC0;
-- 
2.55.0

