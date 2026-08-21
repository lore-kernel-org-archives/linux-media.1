Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4F13BBA04
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312623; cv=none; b=k9yy2w+wOXYEW0F0gRd3mZyC+1ImpAt/IKfWAMXZo32ZgpqaSAtfjjeGl8weaVbBZ9vvyA/8W10Aj//AaxJzUCaBsrouCCvXEsNAfkk/+l1Inl2FKOFBD3KcTJwrlzcBdTSNKYrvf5Hq/wvMes/gRvcmXo65MJssI6wlLlrbo0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312623; c=relaxed/simple;
	bh=hEFlAroSjyqHoDo8EmB4bYVylpcEkLerYJeR40UB/0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IkGoSoyXbNqeqZARfTms00RKEhUNbenz0u+lbpl1QHK1fONaTyzsU5PFpzX25i0/89bGC2od0Yts1BZIM9310bnL7h2o3DKnrdcKxez9i4B9p4LSbtIxLzGYd0wqT8Ff7nxA/WPVZL0Vy4a5AKNlclf5W8V2nN8pVGgNXhmzX+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLVa/aUI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLVa/aUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312622; x=1818848622;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hEFlAroSjyqHoDo8EmB4bYVylpcEkLerYJeR40UB/0c=;
  b=RLVa/aUIIjmNuyz9ODEhtaCp+eGVim8bFsutAAV7FMLguG1xamKUVhlH
   HnyszCgbbNAtHyAv5PEOblV4ydoSJJKAlw7lQX2ru1k88yTM5p5zTQsgu
   uGQ//IVohvC3Gi3R/wbYLVHb4HbqrMpBoaxawFRJIHYAmiXcNF/L7zuYm
   Ec2A90Vi5tlgeWJjuO6I9E9D24YMHnhhO/csUfwJOM2aJeGR7GBgVrk1i
   aDsA447L4haa3KexAnYWZ+dQBWDtJjgIn7nsxOhN3i1xJuFgHk2ClHFU/
   zW6Hd2lN52YooY1eFM4zJsK75ouPNkVUI6prkWkNGO72pLKjOFeBbpxVj
   A==;
X-CSE-ConnectionGUID: 9PALqnMjSWyyyShWgAyVfA==
X-CSE-MsgGUID: 8L1kARkrTn2BekelS4LnZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87988993"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87988993"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:43:41 -0700
X-CSE-ConnectionGUID: myU2I57kSQWP+1VFR20ZSw==
X-CSE-MsgGUID: yP1FuNtOQUu4xyxyFB7MKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172114"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:43:39 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 00/44] media: ipu6: Add support for ipu7 hardware
Date: Fri, 21 Aug 2026 14:42:18 +0300
Message-ID: <20260821114302.365532-1-antti.laakso@linux.intel.com>
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
 drivers/media/pci/intel/ipu6/ipu6.c           |  536 +++++---
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
 37 files changed, 7596 insertions(+), 1377 deletions(-)
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

