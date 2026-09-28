Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE2D4B7A48
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 11:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596626; cv=none; b=I7YCYCfRnNQVM3Sd6jopkZBWuOdXIlEnRVcAuBU7e5+19220Fpmv4UVMSuSZ5rfsl9MdNfs/m1o2g/KFRkm0KRwnE2B43EeGn+tWavARF9OG8CS6NwfpKs6Yy+kNTxxwgPojJVQCMEwAxiIENye+g1GXApx+PJ/2V1ABra6Q2Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596626; c=relaxed/simple;
	bh=QGoWAs8w9fksEcjX8a8hOl1ZgFZLdCtGBv1H8vAp3FI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mUJ66DI/AfAZTL7xc9LbRrOES4HKC+VQ3Htd4Erf1mVMdQ8BpFDg6JHqafDQHr/Y0ZI5cvlang4eVviF9aWfTdxNiOkY3H4as7xsrubiN0UkKqxuDo2u0f5OBPf62RPkjhdpc/8KyocHr/+7VKIupDECHSS9PeoHu55MRUHPRks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgJfa/ZM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgJfa/ZM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790596624; x=1822132624;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QGoWAs8w9fksEcjX8a8hOl1ZgFZLdCtGBv1H8vAp3FI=;
  b=DgJfa/ZMqnaK502SXi1WMlSnW9iofGt7WMZ6/TZyZG8HbPnS3eyVCBIS
   M/0Idb1eXDt0G6IHMHKw2tYqreN8YLENZObJNIuEehIznLx5ZPl7YVvso
   nu5heKqQAPkSjuk2jziitSmGBs5lN5PDiSOOW1RX1BaB2JaGi7cCsVTV8
   0IvOAwGFWsikpezIpfjxZk2kI/QdPGArX0MB6QRskJNKNTVGVv2BgYEc7
   hXBmRMBR3gc52Fn/yaxQZJ+sf91Qxj2u3qffhFwgY98TlhN1iLBtGRBl4
   L6+7OeYVAWnl1IQY9M97c5RggUAx/8rjoFSS6r24vVMfkDiv6wGCgsCJU
   w==;
X-CSE-ConnectionGUID: 3XBUlpZSQdK4BONYJx41tQ==
X-CSE-MsgGUID: SP9MLOP3TGKrA1MPGnyyTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90059353"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="90059353"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 04:56:56 -0700
X-CSE-ConnectionGUID: C0tgyXoSQROQVKVb5vZeCQ==
X-CSE-MsgGUID: o3VgCDjdS5yTPyxQcPK+WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="302981345"
Received: from unknown (HELO pepper.iind.intel.com) ([10.223.20.54])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 04:56:54 -0700
From: Manik Bajpai <manik.bajpai@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com
Subject: [PATCH v1 0/4] media: ipu6: A few defensive fixes for ipu7 buttress, fw-com and mmu paths
Date: Mon, 28 Sep 2026 17:26:42 +0530
Message-ID: <20260928115646.77399-1-manik.bajpai@intel.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes several bugs found while reviewing the ipu7 buttress
power on/off, fw-com and mmu paths: a boot-config leak on a queue memory
allocation failure, a skipped cleanup step on a buttress power on/off
timeout, unchecked firmware-supplied queue indices used in pointer
arithmetic in ipu7_fw_com_get_token(), and a missing "is this iova mapped"
check in ipu6_mmu_iova_to_phys() that could dereference an invalid pointer
for an unmapped iova.

A related fix for a missing NULL check on the output pin queue in the ipu7
isr was dropped from this series, since an equivalent patch is already on
the list:

https://lore.kernel.org/linux-media/20260927201631.153126-2-devnexen@gmail.com/

Manik Bajpai (4):
  media: ipu6: Free boot config on queue memory alloc failure
  media: ipu6: Always run cleanup in ipu7 power on/off on timeout
  media: ipu6: Validate fw-com queue indices before use
  media: ipu6: Fix NULL deref in ipu6_mmu_iova_to_phys()

 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 24 ++++++++++++--------
 drivers/media/pci/intel/ipu6/ipu6-mmu.c      | 11 ++++++++-
 drivers/media/pci/intel/ipu6/ipu7-boot.c     |  1 +
 drivers/media/pci/intel/ipu6/ipu7-fw-com.c   | 14 +++++++++++-
 drivers/media/pci/intel/ipu6/ipu7-fw-com.h   |  5 +++-
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c  |  7 +++---
 6 files changed, 47 insertions(+), 15 deletions(-)

-- 
2.53.0

