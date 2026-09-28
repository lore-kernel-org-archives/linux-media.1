Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFBC4B8260
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 11:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596628; cv=none; b=n0W5sJOwVX+rv9+oDAPW+hu9e4EGx7g/JjSywuCYCEJ3mVySBsorpQZstjuHyTKj6tOnBq1vwdHVYAcaJdH0vYSUYX6hHBJBVogQTz9Cn43p+0/hId4HSGE+1TGsV3NbIT93ZyxU6uNYTKcqqFHe5qJhS2rWtB6GYbYqJRwG+Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596628; c=relaxed/simple;
	bh=v9tn5OYn+kVFNbUuBJH/XXbjz7SVhNFrBYcZXtK1rzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+/m+5SI8tGEtl2T+igJ2fZIUmXb4ho31iz0GQTlEGRYODa3KoH+19NWKYxUbWJcgH4kwRYcAzTOtgS6Bh7Bpbz/vqxhFWZ/zftqgDJMtNgbkN/fDm14j6YTclrRi3N4wcoMBwpH2zVY1rK7UAqSvn+eREcbUtHM1vR6I7yReyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IhnOfJyQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhnOfJyQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790596627; x=1822132627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v9tn5OYn+kVFNbUuBJH/XXbjz7SVhNFrBYcZXtK1rzg=;
  b=IhnOfJyQZ2f++y9p79pgbPRi+3P9kjMDvAHtAxvPLHB2kzbKnhputTcP
   hKiP2CKqBuo9S3dRvnoKkxy1ae1zNbcbzrJ3JAK/VTZfBjaWP5ev2AcMo
   0DZ/thW8t+VTMK2z9pabXevy49BTmp8wwDcySnk092CPVv27NStYpCvjq
   EJcSgRwtkl5hhE3IfJeedLMu8++YrTLjkV32R3T73mcZyygfLsvD2plL7
   YOaWgPGb1pRP9UTcOERQTkRdgXI7xQYzFI0WdjQ2omnm+10Ze2/+FANG9
   t0/7fdnM2z86i9Kyn9BUWE2xV0FuHDMDjy1Bq4F9teE5wYIZSIqLS6kSG
   w==;
X-CSE-ConnectionGUID: SKNfXyKDR5KxBSCon+fHkw==
X-CSE-MsgGUID: rHqLpOCfQwK6X7VZfJ+Rew==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90059367"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="90059367"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 04:56:57 -0700
X-CSE-ConnectionGUID: 86j095xDTmKsOI92gZRygA==
X-CSE-MsgGUID: UGq1w3+3QIOB6asA3W8efA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="302981357"
Received: from unknown (HELO pepper.iind.intel.com) ([10.223.20.54])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 04:56:56 -0700
From: Manik Bajpai <manik.bajpai@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com
Subject: [PATCH v1 1/4] media: ipu6: Free boot config on queue memory alloc failure
Date: Mon, 28 Sep 2026 17:26:43 +0530
Message-ID: <20260928115646.77399-2-manik.bajpai@intel.com>
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

If the queue_mem allocation in ipu7_init_boot_config() fails, the
function returned -ENOMEM without freeing the boot_config buffer it
had already allocated. The current caller happens to clean up via
ipu7_fw_isys_cleanup() -> ipu7_release_boot_config() on any failure
from this function, so this is not an active leak today, but
ipu7_init_boot_config() should not rely on a specific caller undoing
its partial allocations.

Call the existing ipu7_release_boot_config() helper before returning,
so the function cleans up after itself on its own error path,
independent of what the caller does.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Manik Bajpai <manik.bajpai@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu7-boot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu7-boot.c b/drivers/media/pci/intel/ipu6/ipu7-boot.c
index 5bd5281ec107..225f802cfd1c 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-boot.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-boot.c
@@ -246,6 +246,7 @@ int ipu7_init_boot_config(struct ipu6_bus_device *adev,
 					  GFP_KERNEL, 0);
 	if (!fwctx->queue_mem) {
 		dev_err(dev, "Failed to allocate queue memory.\n");
+		ipu7_release_boot_config(adev);
 		return -ENOMEM;
 	}
 	fwctx->queue_mem_size = total_queue_size_aligned;
-- 
2.53.0

