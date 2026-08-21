Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C250948BD51
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312698; cv=none; b=qA+KDD/TJUbgJXy+fCdT9V62aF+1eQZ+QRN+j2q9uoegVfeVcEFI/laE7U5WTDJy3ggVMcxOMctybc6yB3s8SqQd/9X/jZt+tZQBQpnV4JnzMFx2ksGMvmRbngQePFFMwpgM+ZOQnn/3jcA3dOful0w1oi/fntiJnUcGtI2JXjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312698; c=relaxed/simple;
	bh=KeFdm7ZM020ep5ugKl1/7LLqSxzlfwlljpnaQuS6flI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MtkEI4ogAXF1HrjQ0Kq2hqU79Uwx+AI/Rv3B7/8y23iUpr1PHgH/0s4tG1xdt7LDe5UeeoRwXIrHgFUk10aHQZvVDY7izjshdEIYswkeQJULHCvVmvtVOhwdFubjnSsFDsngSTUgjLMIS80HXBVbt2qR3SFuMJQKUYg8fuVQSGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFXUXlFn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFXUXlFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312697; x=1818848697;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KeFdm7ZM020ep5ugKl1/7LLqSxzlfwlljpnaQuS6flI=;
  b=fFXUXlFn7tbflDjcHR0i9urCImED4e29nLSiHFK3xJnWdZ7/g3AIwPjQ
   8dCEBKyrwBtYH48ZbXgZWu7otUJDF2O7yzDUQQfT+hsdnh/lCmL/Mf3ro
   v7hGJzbZvwKBiKYVIHJ0/nGyoHuw7KOS19IWq17jJY93SwJ9x877jNm8b
   Y+gF87H+6rr5Lk8vrcfdpMwtBXpT7ME5nbfIk47b+7LtivWGvWffPvBjY
   KIm3QaV8XKIvL7J30SuDR3SZyqKf5emwNOzYLPIaIYoB7jALq1i9pYnB5
   rZjmUTE9WXocZViZjXXJ895ZyaABqxJ++l3485SPXTNpEXQxHMo59FwY1
   Q==;
X-CSE-ConnectionGUID: E5pfLyscSYexAcPKAKUGOw==
X-CSE-MsgGUID: P/O7q/+yQ4GS7NAaKE8i0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989120"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989120"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:56 -0700
X-CSE-ConnectionGUID: T857OEjbS7KNWBhaS7ujRw==
X-CSE-MsgGUID: G77tso16RbGywXAQjX+n4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172386"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:54 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 34/44] media: ipu6: The VC arbitration mechanism is ipu6 only
Date: Fri, 21 Aug 2026 14:42:52 +0300
Message-ID: <20260821114302.365532-35-antti.laakso@linux.intel.com>
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

