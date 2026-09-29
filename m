Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2BC42902E
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 08:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670703; cv=none; b=h9zznIhfPeKI9pDZjUUX/S2F2x8qQUQMv7s2SJTcbTTg2CDnAMip9h7vqMHKLk/62X3h1JVan0WakurDYvHyZtWsDLXfYIgnSCAq310ukBO2wl4+FHvTcWKNx8BHToAQQuBk0gEsySkqFwhmr+zaL594+ZpLycb1h9QkWbnCpks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670703; c=relaxed/simple;
	bh=p+7LyiO+87BBNGSL01P/9yB0H0JF5LRzWi5ZdDP+CeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqJpI/KXPtzRqwwJogQrdiLUbKp6I95TCdLVnipOrhO6I/5O11AKPvDrz8+zWXWEDvJLilnmPnUHdz0VTuWDflUzSFYtpZUXT5zJHTSDsUHVZACex310mofumiNFHwQsIbl7JYhJgZOTU8clDIlrE15xfcX3538NH2n+tBeDznA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNY6FZDP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNY6FZDP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790670700; x=1822206700;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p+7LyiO+87BBNGSL01P/9yB0H0JF5LRzWi5ZdDP+CeA=;
  b=QNY6FZDP2arJiMFCcSh0jx4ADqJWhQYF0haOfvsaRx8qULTAHr9p4ZBw
   t5en+8Rjp4jaBIKSvq5Wavnwt2hcNJPz/KqOyJE+WzxqrSXd64Ypf8Uj1
   huTsp1XdRCo93H+kXqrOeT/sNcjjsEK2iN0Gox7Li/0iSXq33WKmGCj1u
   GdQrwtWDOOFwKoGfCmv6ZiLrLNiuBPV5Wr0Ml/PVOFJWhk20vL3JlQLUr
   6ZrEWugL7Iqa8rWr61Gjc8dQl4f41ZlxmwS3ZWvklG9/LF/8HlmvhH75f
   FL4ImOeOT44zQHmz9qTSB9asWvUOpid5En1o/uQen8KpbfgPchPaaVfYi
   g==;
X-CSE-ConnectionGUID: WymvpJKERw+onray/vJWgA==
X-CSE-MsgGUID: gjI/CQ2AT1uriZYQkUT74Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101548896"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="101548896"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 01:31:39 -0700
X-CSE-ConnectionGUID: n6j7hsL/RtmIvJOHiobdzA==
X-CSE-MsgGUID: yYOzwehTRX2yTKzFnP3TfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="275339401"
Received: from unknown (HELO pepper.iind.intel.com) ([10.223.20.54])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 01:31:38 -0700
From: Manik Bajpai <manik.bajpai@intel.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com
Subject: [PATCH v2 0/4] media: ipu6: A few defensive fixes for ipu7 buttress, fw-com and mmu paths
Date: Tue, 29 Sep 2026 14:01:26 +0530
Message-ID: <20260929083130.88381-1-manik.bajpai@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <arpYuzb0yJinlDyH@kekkonen.localdomain>
References: <arpYuzb0yJinlDyH@kekkonen.localdomain>
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

v2:
- ipu6_mmu_iova_to_phys(): this was found via code review, not from an
  observed crash (comparing against l2_map()/l2_unmap(), which already
  guard the equivalent lookup). Added a Fixes: tag pointing at the
  commit that introduced the unguarded lookup, but skipped a
  stable-tree backport since there's no confirmed real-world trigger
  (Sakari).

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

