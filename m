Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59F441A781
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780612; cv=none; b=LpJvYX68ld7BAHLYlpGxVGtMAZzRVi4LjkCvlb9SEotAGSEnj4Tlrcx5m4pbsHqgZ2FeL0hi0MXqaGzFRjLlmWIxfZvrafdnWUC8aG3FADaP2zvmud8MkOfRbsN+rQiwj7tiDq0obNeR9mtjH+HuN8GEY6GZYYn4jOB0jkbKoOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780612; c=relaxed/simple;
	bh=uWFlQDxvX4pOEcgkLpHADU9UthLFkRHTW9L/LBnCEaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iiRQQ9niOzM3uDWi0VctNe7rREhTmp/sl9pVuEnm7EylmMW5jOlEZhSZZDUdAXn0o1WrvBZUYNtiTzhVXmAyUympVegxc3n8T79igJILMb1GjXZVY3oeOUqWHwCWcRYq516kTwP6emVcN8RfvivWgY6+yE+jqtdtqS2q4jfbhwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMHUXtAT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMHUXtAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788780610; x=1820316610;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uWFlQDxvX4pOEcgkLpHADU9UthLFkRHTW9L/LBnCEaI=;
  b=lMHUXtATF7hBgHZ9W07g5rIXvkySCcozMc4U6rco48hOe1/zdun8A4ey
   WAEVkovrvCCpXpc00Mh+FabQjtDK+Jy1kF2zamkFcaO4fzJXQJGoY+1m9
   3LUlTpC+F5ih9OgdHflXLzSbiC9ngi28wJgpJ2IaeHQZ4j9Tp8J/PKLaE
   Hz593kVP+Yk2cl1QBUC6xxqtYABycRsyOBroLgEq0e7ceZlZA7+l8J1NO
   BQDX4Y5MhcosNCP4S3FUG4leg9BdpwKOETSn/gSRtO19SuyyTx+DN7pIi
   uT0Q7uog5Zx8Fq7ixmO3xT04ylHXVtGKVldZCCMDKR7p77isicD+r2g3b
   A==;
X-CSE-ConnectionGUID: qU6hAyV1TkOs10BwD2oPxA==
X-CSE-MsgGUID: UgrSTRDtSAC6UVj2wwX6JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="100538597"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="100538597"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 04:30:06 -0700
X-CSE-ConnectionGUID: qVAxxkmbQ6qR4VhysNPfpw==
X-CSE-MsgGUID: JK8Awd5zTOuyijPGnJZuLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="300569082"
Received: from abityuts-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.230])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 04:30:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 92459121C22;
	Mon, 07 Sep 2026 14:30:05 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x3XY5-0000000ARmo-02nY;
	Mon, 07 Sep 2026 14:30:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	sarang.sapre@intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH v4 00/45] media: ipu6: Add support for ipu7 hardware
Date: Mon,  7 Sep 2026 14:29:19 +0300
Message-ID: <20260907113004.2489993-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

The 7th Gen Intel Imaging Processing Unit is a PCI device including
input system and processing system. This set adds support for ISYS
in IPU7 and IPU7.5.

Changes since v3:

- Rename global symbols also found in ipu7 driver so both drivers can be
  compiled in the same build.

- Add a mechanism to select the ipu driver for ipu7 and ipu7.5 at runtime
  (second last patch) using module parameters.

- Update ipu7 driver TODO file (last patch).

Changes since v2:
- Addressed comments from Sakari.

Changes since v1:
- Fixed review and checkpatch issues.
- Fixed a bug in ipu6 fw communication.
- Added missing bits for ipu7 CSI2 initialization.
- Changed IPU runtime detection.
- Added IPU7.5 support.

Antti Laakso (44):
  media: ipu6: Add helpers for IPU runtime variation
  media: ipu6: Rename pointer to firmware context
  media: ipu6: Rename buttress_ipc pointer
  media: ipu6: Remove duplicate warnings in cpd validation
  media: ipu6: Remove unused ipu6 firmware struct
  media: ipu6: Cleanup ipu6_mmu_init()
  media: ipu6: Simplify firmware com arguments
  media: ipu6: Add helper to identify ipu7
  media: ipu6: Prepare buttress for ipu7 support
  media: ipu6: Use single struct for registers
  media: ipu6: Rename IPU subsys ID
  media: ipu6: Add ipu7 buttress support
  media: ipu6: Prepare mmu driver for hw variation
  media: ipu6: Add ipu7 mmu support
  media: ipu6: Add ipu7 cpd handling
  media: ipu6: Add check for pkg_dir before freeing
  media: ipu6: Rename isys fw msg union
  media: ipu6: Move isys isr handlers to fw file
  media: ipu6: Move hw specific buffer handling down
  media: ipu6: Isolate hw specific buffer handling
  media: ipu6: Add isys firmware ops
  media: ipu6: Add ipu7 fw start/stop functionality
  media: ipu6: Add ipu7 fw com methods
  media: ipu6: Add ipu7 fw isys ops
  media: ipu6: Add ipu7 csi2 register definitions
  media: ipu6: Add ipu7 isr handler
  media: ipu6: Add ipu7 csi phy driver
  media: ipu6: Split ipu6 csi2 stream enable/disable
  media: ipu6: Add support for ipu7 csi2 receiver
  media: ipu6: Parse bus type for ipu7
  media: ipu6: Enable ipu7 isys interrupts
  media: ipu6: Skip watermark configuration for ipu7
  media: ipu6: The SPC init is valid only for ipu6
  media: ipu6: The VC arbitration mechanism is ipu6 only
  media: ipu6: Move buttress mem alloc out from probe
  media: ipu6: Read correct SKU ID for ipu7
  media: ipu6: Add support for fixed iova region
  media: ipu6: Make fw mapping function reusable
  media: ipu6: Move isys fw mapping to pci_probe
  media: ipu6: Map ipu7 firmware
  media: ipu6: Set model name for ipu7
  media: ipu6: Add ipu7.5 buttress support
  media: ipu6: Add ipu7.5 mmu initialization data
  media: ipu6: Enable ipu7 and ipu7.5

 drivers/media/pci/intel/ipu6/Makefile         |   10 +-
 drivers/media/pci/intel/ipu6/ipu6-bus.h       |    6 +-
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  |  568 +++++---
 drivers/media/pci/intel/ipu6/ipu6-buttress.h  |   50 +-
 drivers/media/pci/intel/ipu6/ipu6-cpd.c       |  195 ++-
 drivers/media/pci/intel/ipu6/ipu6-cpd.h       |   43 +
 drivers/media/pci/intel/ipu6/ipu6-dma.c       |   24 +-
 drivers/media/pci/intel/ipu6/ipu6-dma.h       |    2 +
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   |  589 +++++++-
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h   |   48 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  207 ++-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |    5 +
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |   87 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |    6 +-
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  160 +--
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |    1 +
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  397 ++----
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |   55 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c    |  296 ++++
 drivers/media/pci/intel/ipu6/ipu6-mmu.c       |  133 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu.h       |  158 ++-
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |  111 +-
 drivers/media/pci/intel/ipu6/ipu6.c           |  546 +++++---
 drivers/media/pci/intel/ipu6/ipu6.h           |  200 +--
 drivers/media/pci/intel/ipu6/ipu7-boot.c      |  405 ++++++
 drivers/media/pci/intel/ipu6/ipu7-boot.h      |   46 +
 drivers/media/pci/intel/ipu6/ipu7-fw-com.c    |   74 +
 drivers/media/pci/intel/ipu6/ipu7-fw-com.h    |   53 +
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c   |  787 +++++++++++
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.h   |  296 ++++
 .../media/pci/intel/ipu6/ipu7-isys-csi-phy.c  | 1072 +++++++++++++++
 .../media/pci/intel/ipu6/ipu7-isys-csi-phy.h  |   16 +
 .../pci/intel/ipu6/ipu7-isys-csi2-regs.h      | 1189 +++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c    |  858 ++++++++++++
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h    |  254 ++++
 .../media/pci/intel/ipu6/ipu7-platform-regs.h |   32 +
 include/media/ipu6-pci-table.h                |    4 +
 37 files changed, 7602 insertions(+), 1381 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-boot.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-boot.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-com.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-com.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-isys-csi2-regs.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-platform-regs.h

-- 
2.55.0



Antti Laakso (44):
  media: ipu6: Add helpers for IPU runtime variation
  media: ipu6: Rename pointer to firmware context
  media: ipu6: Rename buttress_ipc pointer
  media: ipu6: Remove duplicate warnings in cpd validation
  media: ipu6: Remove unused ipu6 firmware struct
  media: ipu6: Cleanup ipu6_mmu_init()
  media: ipu6: Simplify firmware com arguments
  media: ipu6: Add helper to identify ipu7
  media: ipu6: Prepare buttress for ipu7 support
  media: ipu6: Use single struct for registers
  media: ipu6: Rename IPU subsys ID
  media: ipu6: Add ipu7 buttress support
  media: ipu6: Prepare mmu driver for hw variation
  media: ipu6: Add ipu7 mmu support
  media: ipu6: Add ipu7 cpd handling
  media: ipu6: Add check for pkg_dir before freeing
  media: ipu6: Rename isys fw msg union
  media: ipu6: Move isys isr handlers to fw file
  media: ipu6: Move hw specific buffer handling down
  media: ipu6: Isolate hw specific buffer handling
  media: ipu6: Add isys firmware ops
  media: ipu6: Add ipu7 fw start/stop functionality
  media: ipu6: Add ipu7 fw com methods
  media: ipu6: Add ipu7 fw isys ops
  media: ipu6: Add ipu7 csi2 register definitions
  media: ipu6: Add ipu7 isr handler
  media: ipu6: Add ipu7 csi phy driver
  media: ipu6: Split ipu6 csi2 stream enable/disable
  media: ipu6: Add support for ipu7 csi2 receiver
  media: ipu6: Parse bus type for ipu7
  media: ipu6: Enable ipu7 isys interrupts
  media: ipu6: Skip watermark configuration for ipu7
  media: ipu6: The SPC init is valid only for ipu6
  media: ipu6: The VC arbitration mechanism is ipu6 only
  media: ipu6: Move buttress mem alloc out from probe
  media: ipu6: Read correct SKU ID for ipu7
  media: ipu6: Add support for fixed iova region
  media: ipu6: Make fw mapping function reusable
  media: ipu6: Move isys fw mapping to pci_probe
  media: ipu6: Map ipu7 firmware
  media: ipu6: Set model name for ipu7
  media: ipu6: Add ipu7.5 buttress support
  media: ipu6: Add ipu7.5 mmu initialization data
  media: ipu6: Enable support for IPU 7 and IPU 7.5

Sakari Ailus (1):
  staging: media: ipu7: Update TODO file

 drivers/media/pci/intel/ipu6/Kconfig          |    9 +
 drivers/media/pci/intel/ipu6/Makefile         |   10 +-
 drivers/media/pci/intel/ipu6/ipu6-bus.h       |    6 +-
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  |  568 +++++---
 drivers/media/pci/intel/ipu6/ipu6-buttress.h  |   50 +-
 drivers/media/pci/intel/ipu6/ipu6-cpd.c       |  195 ++-
 drivers/media/pci/intel/ipu6/ipu6-cpd.h       |   43 +
 drivers/media/pci/intel/ipu6/ipu6-dma.c       |   24 +-
 drivers/media/pci/intel/ipu6/ipu6-dma.h       |    2 +
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   |  589 +++++++-
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h   |   48 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  207 ++-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |    5 +
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |   87 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |    6 +-
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  160 +--
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |    1 +
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  397 ++----
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |   55 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c    |  296 ++++
 drivers/media/pci/intel/ipu6/ipu6-mmu.c       |  133 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu.h       |  158 ++-
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |  111 +-
 drivers/media/pci/intel/ipu6/ipu6.c           |  556 +++++---
 drivers/media/pci/intel/ipu6/ipu6.h           |  200 +--
 drivers/media/pci/intel/ipu6/ipu7-boot.c      |  405 ++++++
 drivers/media/pci/intel/ipu6/ipu7-boot.h      |   46 +
 drivers/media/pci/intel/ipu6/ipu7-fw-com.c    |   74 +
 drivers/media/pci/intel/ipu6/ipu7-fw-com.h    |   53 +
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c   |  787 +++++++++++
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.h   |  296 ++++
 .../media/pci/intel/ipu6/ipu7-isys-csi-phy.c  | 1072 +++++++++++++++
 .../media/pci/intel/ipu6/ipu7-isys-csi-phy.h  |   16 +
 .../pci/intel/ipu6/ipu7-isys-csi2-regs.h      | 1189 +++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c    |  858 ++++++++++++
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h    |  254 ++++
 .../media/pci/intel/ipu6/ipu7-platform-regs.h |   32 +
 drivers/staging/media/ipu7/TODO               |   28 +-
 drivers/staging/media/ipu7/ipu7.c             |    7 +
 include/media/ipu6-pci-table.h                |    4 +
 40 files changed, 7630 insertions(+), 1407 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-boot.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-boot.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-com.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-com.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-isys-csi2-regs.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-platform-regs.h


base-commit: f9536a8065d9eed0d9114878c56ffc4e5a18bdfc
-- 
2.47.3

