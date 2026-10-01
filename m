Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3B83C1983
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 07:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839904; cv=none; b=GYKLcQl/b3pias6+3k5cJHSLPpL5715o8m6MSA+nWDYDSDrVdR5kcMvy35Bn5TH9hUPvbNUxwmPhTpOqrC6TMqCrLRhQ37u2AUNm8ty7EKg7/mJ3tAqzsIjWe6FCzby1YtvriZnOXN25XsSIrq3sEZ5w5yQerb53buLWuHAs2S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839904; c=relaxed/simple;
	bh=+XwckYVlCqWV4Q4fmbLMyz51l70YmLaqr0YWkCS46IY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bVqaKTmICFY9OZKMuNrXQ9zxK1kQaONP144S+g7IV0HXhSSDcLIdd3Mx3xTwUOE05CloHr0szUKLQAcVwmPh/tNOQ20FKJ1CjG7YCkZiDWXzzS7PvQl7rvaZh+p4HRyALnLlf0UsP6s6qj+KQKD/6eaae+kXh1S0dmIRzBRQjwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SsiYCsXu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsiYCsXu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790839903; x=1822375903;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+XwckYVlCqWV4Q4fmbLMyz51l70YmLaqr0YWkCS46IY=;
  b=SsiYCsXu15SbnU+gupQIwKtE789eEC23kmw7BVrbbmTp1f1vjAXUdeYj
   v/LJfTYgLojA04PmbGKDSMEgj7ypo40VoqoOPXRP4kJvEgK4HCRC662ik
   XBFDYpmJJgFZHQk1ERktljWTuSF3EkzFKNUAR0DXDW44ukdkxCGHWoSds
   QKm9+pTpB3eIdkm+us4VLuRM/pk2EunPthQQzFsDvPPz1MRmrOOfYURD8
   bj7S61iAAPCYwjccyjlhoB7AMyjp3U4RJT7rcD1lJVi+v1tGM3GdKcHyp
   h03lPDkFYv4KHUzDKqpM2t+FOuKoQHC+Lm61BYjWxm/fk+7tIybrspb4T
   g==;
X-CSE-ConnectionGUID: pjNbr6wIRSqTJ8FRTf+EJQ==
X-CSE-MsgGUID: 8YHH1ZJAQeGgPCWo27feow==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="79150744"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="79150744"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:31:42 -0700
X-CSE-ConnectionGUID: ylKHGFyETBabvSM5jEP7BA==
X-CSE-MsgGUID: +cstROQSQbyxsU4lg3eXkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="279215598"
Received: from vtg-bdc-vm10.iil.intel.com ([143.185.124.149])
  by orviesa004.jf.intel.com with ESMTP; 01 Oct 2026 00:31:40 -0700
From: Divyamani Tripathi <divyamani.tripathi@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com,
	manik.bajpai@intel.com,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v2 0/7] media: ipu6: add IPU8 support
Date: Thu,  1 Oct 2026 10:31:27 +0300
Message-ID: <20261001073134.4031143-1-divyamani.tripathi@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds IPU8 support to the unified ipu6 driver
(drivers/media/pci/intel/ipu6), porting the applicable parts of the
existing "staging: ipu7" IPU8 enablement and completing the pieces
that staging left out, or that this driver's different internal
structure (no abi/ split, single shared power-sequencing path)
required to be done differently.

IPU8 shares its InSys firmware ABI, buttress and MMU/ZLX/UAO hardware
generation with IPU7/IPU7P5, so most of this series is chip
identification, PCI probe wiring, and porting/adapting the existing
IPU7-family codepaths and hardware tables rather than introducing new
driver infrastructure.

Scope: ISYS (raw frame capture) is the primary target and what has
been validated on real hardware. PSYS platform enablement (MMU table
and PLL power sequencing) is included because staging ipu7 already
ships it as part of its original upstream submission - porting it
here is not new, unreviewed psys pipeline support, just completing
hardware enablement that already exists upstream in the sibling
driver. This driver still has no psys pipeline consumer, so it only
affects the psys bus device's power sequencing and MMU setup, not a
processing pipeline.

Patch summary:
 - Patches 1-2 bring the InSys firmware ABI up to date and add IPU8
   chip identification (IS_IPU8()).
 - Patch 3 adds the IPU8-specific (ABI 1.0.14) InSys message layout
   and selects the firmware boot-message major version IPU8 expects;
   without it the IPU8 firmware rejects the boot handshake
   (IA_GOFO_FW_BOOT_STATE_CRIT_MSG_VERSION, 0xdead0301), confirmed on
   real hardware.
 - Patch 4 makes the ipu7 GPREG stride configurable, since IPU8/NVL
   uses a different stride than IPU7/IPU7P5.
 - Patch 5 completes ISYS chip/MMU enablement (NDE/TLBID_HASH register
   values, TSC sync, ISYS MMU/ZLX/UAO hardware table); adds IS_IPU8()
   alongside the existing IS_IPU7() check at each site that needs to
   follow the IPU7-family codepath, keeping the two checks independent
   instead of widening IS_IPU7() to also match IPU8. Without it IPU8
   firmware boot fails with IA_GOFO_FW_BOOT_STATE_CRIT_UNSPECIFIED
   (0xdead0001), also confirmed on real hardware.
 - Patch 6 completes PSYS platform enablement (MMU table, PLL power
   sequencing).
 - Patch 7 adds the IPU8 PCI device ID, wires up the probe, and adds
   IPU8's own buttress control ratio.

All hardware table/register values are transcribed from the
corresponding staging ipu7 tables (same silicon), not re-derived.

Validation: compiles cleanly (W=1); tested on real IPU8 hardware with
two OV13B10 sensors - driver probes, ISYS firmware boots, and the
media controller topology enumerates both sensors' CSI2/capture nodes
correctly. Series verified with checkpatch.pl --strict (0 errors, 0
warnings) and applies cleanly on top of next.

Changes since v1:
- Patch 3 ("add IPU8 InSys ABI 1.0.14 support"): copy the union member
  into a local struct via plain assignment instead of memcpy(), since
  a type-safe copy of msg->ipu7.stream is simpler and the union still
  requires copying it out before overwriting it in place
  (Sakari Ailus).
- Patch 4 ("make ipu7 gpreg stride configurable as per IPU version"):
  use separate IS_IPU7()/IS_IPU8() checks in
  ipu6_internal_pdata_init() instead of an if/else, so a third/unknown
  IPU version isn't silently treated as IPU7.

Divyamani Tripathi (7):
  media: ipu6: update ipu7 InSys ABI to 1.2.1.20251215_224531
  media: ipu6: add IS_IPU8() macro
  media: ipu6: add IPU8 InSys ABI 1.0.14 support
  media: ipu6: make ipu7 gpreg stride configurable as per IPU version
  media: ipu6: add IPU8 isys chip/MMU enablement
  media: ipu6: add IPU8 psys MMU table and PLL power sequencing
  media: ipu6: add PCI ID for IPU8

 drivers/media/pci/intel/ipu6/ipu6-buttress.c  |  61 +++-
 drivers/media/pci/intel/ipu6/ipu6-cpd.c       |   2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  15 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  14 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |   3 +
 drivers/media/pci/intel/ipu6/ipu6-mmu.c       |   4 +-
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |   6 +
 drivers/media/pci/intel/ipu6/ipu6.c           |  59 +++-
 drivers/media/pci/intel/ipu6/ipu6.h           |   5 +
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c   |  85 +++++-
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.h   |  78 +++++-
 .../media/pci/intel/ipu6/ipu7-isys-csi-phy.c  |   6 +-
 .../pci/intel/ipu6/ipu7-isys-csi2-regs.h      |   2 +
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c    | 262 +++++++++++++++++-
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h    | 115 ++++++++
 include/media/ipu6-pci-table.h                |   2 +
 16 files changed, 674 insertions(+), 45 deletions(-)

-- 
2.43.0

