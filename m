Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C473235C01
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834031; cv=none; b=t/BoSr+flG5fhp9Ot6QazMCHgZ5Cj7SylPwswjvBttZuXLgbGeLfKRpzZytzRRzXTVekxgfhfwoGuik7q5oncmfJ7a3kZjJ1DZ0EebSqwMzji+jNwMQfW5LnXBYoizdBzUvm0lrO/BmvpOSglAP4qwsrHdY2+ArwzjJUng2riJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834031; c=relaxed/simple;
	bh=rKhQDxnzYEAq1lgLfXz6Ale3d/JnoKvObl8fnGz/9c0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NJNVFPZKq9df+hFpPu2+02rKAeqHdHnsFMFLf6+34+Ae2EbkUtQKvtNY3KhENDY1jbyQplHsuX2AHky7pSBzxK/Zs7s3szbo1uJksh1n33+VLj97X1BnPS8jg1Vsqo7k5GBEQjenZ1dElZq28MG0La3jgLMl2wLwK2pOBFJXx50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eiWUcezm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiWUcezm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834029; x=1819370029;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rKhQDxnzYEAq1lgLfXz6Ale3d/JnoKvObl8fnGz/9c0=;
  b=eiWUcezmfEca6HRAySHQfqoppIXaWhjvwXlqJ1NOOR2Hg2pe2s6v7qpi
   Knb2v6c1tHRv6f2bMi11fOqUP7GJzVr7fLOYstLCZuaED6XePlCiB+ask
   nC36TDXtKIA58oyMlU+YWH/Wi07Dcl/eGklu5xlx6xRjdNqIBH7s62qxW
   ZUsivPyUWr4sGakHpRyW7lnpYQuXvhJlvz4ucI9dQr2KlZT0Mbd5c82lL
   mqx7N1wCaKEmDPRARs2Xh5e5p19mw8GWPO7curfULiMJonV7ZZYBw7aoi
   hR0vK5NORFypERVitZpQuOvt2Sj/U8Ei6m095RFmjU56saIf8HgbS6ZdH
   A==;
X-CSE-ConnectionGUID: CCr4+mSwSDChq9spNO8gPg==
X-CSE-MsgGUID: kVtTaeWPQIa4Ri6K15QydA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188459"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188459"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:33:49 -0700
X-CSE-ConnectionGUID: dv/L8jnsTzWDHCqcq1gMBA==
X-CSE-MsgGUID: Y7V5bvspQfibv1hgDVZamw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384180"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:33:47 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 00/44] media: ipu6: Add support for ipu7 hardware
Date: Thu, 27 Aug 2026 15:32:52 +0300
Message-ID: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

