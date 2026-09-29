Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE0A3469FA
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 08:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670703; cv=none; b=B7iA4cpUxDm05TUQMyX660RLFXrgfJ9X/dWeB5MqW3fd0SO43FMlpLPVlY2ThmT1Ik9jxunCAieHySoqd/jzBDcvCan6k0gL9Do4mkDcjZS/cTHP5fvQ/9QfmwTBS8bY5fv5rE8dQeEp51WGFZIIw5MhWxnFJTdMGgFZUSnssE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670703; c=relaxed/simple;
	bh=v9tn5OYn+kVFNbUuBJH/XXbjz7SVhNFrBYcZXtK1rzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nBbLXShRf87xlt/8P1w6ABtC/A+JcAVVRYR9jSJMCpvAeQ/wpVWK8QOCtACFiw6q0kroa4w3cSeVB3r6xz7pEp/YGs3RHXaRUxU6ZRwDzpx2uH7mpUlVfG8vi+OQepz9I3lhR4dcPq83lzjBxh7TaiohUZX9pxknJCdnlOnGte0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNEJZ81U; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNEJZ81U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790670701; x=1822206701;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v9tn5OYn+kVFNbUuBJH/XXbjz7SVhNFrBYcZXtK1rzg=;
  b=eNEJZ81U7GvUIIXdehNCq1Z5nKK1Cihie0PgEXd/DAefZ6Fe93l1lCP2
   prHYNhybivqtjaHhemcFilMZE6rGwGOWA5kVaOoKS4JCB0aelB0mHyHVB
   u1guKjwnRevnPCcBfCpikRT1tZ0mdjxhaQMKan8qOXnrs4iXIYS0Uwo/z
   w8E7dVT7pWlt1XHBdj9z2mZTAIFeOOs3vTkDTOJhXdg6Cw73+MNVgkinA
   E0yhRYT7+rfoFzfd7MJKaTakg+9Eg1vODpf6Q1MyVWxaUlxmo/JdEgEkk
   hOaY8H0KooIFDiSHyNKbITLNKDk3qRRgdC7IvY4hP33jjOHLJZjYSUGiE
   w==;
X-CSE-ConnectionGUID: KmQkhZaIT1Sf6Rh/EsHS1A==
X-CSE-MsgGUID: aK82d1yeTmKmmUEYwk3Uzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101548899"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="101548899"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 01:31:40 -0700
X-CSE-ConnectionGUID: GK7JrN/uTjCrD+jMnXl2Ug==
X-CSE-MsgGUID: /nXjVjhkQ4exTKuu0HCriA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="275339408"
Received: from unknown (HELO pepper.iind.intel.com) ([10.223.20.54])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 01:31:39 -0700
From: Manik Bajpai <manik.bajpai@intel.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com
Subject: [PATCH v2 1/4] media: ipu6: Free boot config on queue memory alloc failure
Date: Tue, 29 Sep 2026 14:01:27 +0530
Message-ID: <20260929083130.88381-2-manik.bajpai@intel.com>
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

