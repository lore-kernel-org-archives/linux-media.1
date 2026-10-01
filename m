Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A454FDE7B
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 12:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858753; cv=none; b=mmRKISUsvvAnGpWNrAnAEU6/ALQD4JqvrophBuiMpMxaureuQEkEvel+rNM3Fy0q48RKue7futAdRezgQaw7OGmtac3K2skzxSDcD9cGIAOfG+Xq84el2vUyNLWlLxR0JAqTD5z+tqCHsXXIOVDhibdnpERBop8Jtbj1f1E9AlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858753; c=relaxed/simple;
	bh=9LjKYGDOo5Vi4A+zsb5F+IE4GsxVUeB/m9SifdQPXtk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gPCYTeQdjR/BwOw6w1NoGjh0UnOGZ+kFZROqnDnLV/iMjbxmn07EGOV6iBuRngm+wjSiYL+5RlQGmMROBJhqiRXknFu8FkmzX/ekxF79HO4QPXXrqfDQVM9df+liQTBhycYY7y5jPgF3kZLcVpeTKxdRlSoZPzLzxQCVB7EUy74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIblvpi3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIblvpi3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790858751; x=1822394751;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9LjKYGDOo5Vi4A+zsb5F+IE4GsxVUeB/m9SifdQPXtk=;
  b=aIblvpi34oudrD9TSOpI7SFBifF/ohvkq+3ZjJPvvM/tfG1/FRRE36eA
   PCkmYHGcDVFruev0+KgF9Az//Vw+ZcejfBpOEE+iB/96Zqd4uLEdHYW6W
   dS1qilisk6bL/WKMP2tElsKuBbocsZ89dHTWBejdJkbp9ex2lrmfwBC9R
   qIpVqsohrbL6Nz70+Z1PbVwxdJvCXh3fZ6n/21r2gUF3nSSVbbsBRHmWu
   BOTfA1jK/HqIPGMZaFv9L8E4D2DokEaBpNTTwqhsfpAE3diFo6cKnJGIn
   FtcB0xznmD4n2zRrzArk1ei2i6BNMXvb+mASWsWGtEhjPJ9aMYC9w1rbH
   w==;
X-CSE-ConnectionGUID: 5QDRQih4QMujcSvxHDWwmw==
X-CSE-MsgGUID: E82nN/4BTsKbvPeri0PU8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="101774553"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="101774553"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 05:45:51 -0700
X-CSE-ConnectionGUID: VITDf1PBTCiuWB5425Ycpw==
X-CSE-MsgGUID: gDYptcARTjSxb9X+dQSm7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="313934875"
Received: from cooperst-gp119.amr.corp.intel.com (HELO alaakso-desk.intel.com) ([10.125.111.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 05:45:49 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com,
	divyamani.tripathi@intel.com
Cc: manik.bajpai@intel.com
Subject: [PATCH 0/7] Make ipu7 fw boot code subsystem agnostic
Date: Thu,  1 Oct 2026 15:45:33 +0300
Message-ID: <20261001124540.2129309-1-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the ipu7 firmware boot and config helpers independent of isys.
The set includes a fix for media entity names, and now entities are
named according to ipu version. Excluding the fix, other changes are
for preparation only and do not intoruce changes to functionality.

Antti Laakso (7):
  media: ipu6: Fix media entity names for different ipu versions
  media: ipu6: Forward declare struct ipu6_mmu
  media: ipu6: Pass the fw context to the ipu7 boot helpers
  media: ipu6: Make ipu7 fw config subsystem agnostic
  media: ipu6: Export the ipu7 firmware boot state
  media: ipu6: Add the ipu7 psys buttress support
  media: ipu6: Move ipu7 fw logger and watchdog configuration

 drivers/media/pci/intel/ipu6/ipu6-buttress.c  | 22 ++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-buttress.h  |  2 ++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  3 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  3 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      | 18 +++++++++-
 drivers/media/pci/intel/ipu6/ipu6-mmu.h       |  1 +
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |  4 +++
 drivers/media/pci/intel/ipu6/ipu7-boot.c      | 35 ++++++++-----------
 drivers/media/pci/intel/ipu6/ipu7-boot.h      | 34 ++++++++++++++++--
 drivers/media/pci/intel/ipu6/ipu7-fw-com.h    |  2 +-
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c   | 13 ++++---
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.h   | 19 ++--------
 .../media/pci/intel/ipu6/ipu7-platform-regs.h | 12 +++++++
 13 files changed, 118 insertions(+), 50 deletions(-)

-- 
2.55.0

