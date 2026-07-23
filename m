Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0514357CF1
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 07:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784792105; cv=none; b=KhxgPI3NbeCYfmCJYumLVN+fqJ0ASYRO4FNsasndZa1Z0zaSXeXJXubAxQwUWddnhgujjtlHGpl9U0m13Py8x6Ktqk59QoYXDAOdau53gySyWSJrjGKdtsNXFK56qIjHAVpjvoVrf2xJWyJi2cpBSuPyKF61Ymitfpo8IUcRL4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784792105; c=relaxed/simple;
	bh=Vplc9R32wl/PQ7mJ43Kr3/zKMVzq1nr6HIMSZFYYF/4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mEwunkHc3ml5aPTrVglTFp6NHM4z/4q2WKlP+ZGKWTwlO+mvGSmS0GxF79VJ2vuhzrKso/rOjp7cS8Q96eI4BKaTz/KedWhmet/hisiY5bfsxspdq4WVgs5YOCjNUb6ZOVsbcyLfnw3KdyvAJb4/SLChm4WJuIOj1IjCVs/eMC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mULB/DqQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mULB/DqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784792104; x=1816328104;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Vplc9R32wl/PQ7mJ43Kr3/zKMVzq1nr6HIMSZFYYF/4=;
  b=mULB/DqQ3+5zW8M80WEDWCeFQoUAJqUmohkj9V7JE0rlVV8HdaHEhGYf
   YCka79g5geRw9sczJoPMQa+wXGAjB5YOa5cu/NdivVsqJjyGuTpF2afAW
   INfZKMMqcO/+5tilqothnknj39QtFZ8dvaoSQGig/E5c1J0s4oZpBjcNn
   RLq1GZY3Y7SQXoFM2bQMTU25YOZ22Hb4IMRT5b2zb3lPml0OBX0YiQTTu
   1Sw42KIyfkb7DDoxNn4m5CX9Ij/y3jHZs5OWbXkFTkx8X5M+BkmcSVc8z
   /XxSbxwi/skK5BnHQ4GBtSCim849K+GmvnpL+JbbKD6j9u9dJEA5cxWef
   w==;
X-CSE-ConnectionGUID: 6oB3JTvGTBeBFTynLdG1PQ==
X-CSE-MsgGUID: zObnPEwGSqCzhWyleBiGLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96955886"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="96955886"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:35:04 -0700
X-CSE-ConnectionGUID: pZtO1RT/Q6OADGcWae0K3Q==
X-CSE-MsgGUID: 9MG5Y7JtQwmCcM3meCxRGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="256532018"
Received: from serinyeh-ms-7d25.itwn.intel.com ([10.225.65.16])
  by orviesa006.jf.intel.com with ESMTP; 23 Jul 2026 00:35:02 -0700
From: Serin Yeh <serin.yeh@intel.com>
To: linux-media@vger.kernel.org
Cc: serin.yeh@intel.com,
	sakari.ailus@linux.intel.com,
	jimmy.su@intel.com,
	sarang.sapre@intel.com,
	bod@kernel.org,
	kieran.bingham@ideasonboard.com
Subject: [PATCH v3 0/2] media: ov8856: run full power sequence on ACPI
Date: Thu, 23 Jul 2026 15:39:44 +0800
Message-Id: <20260723073944.368586-1-serin.yeh@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series makes the ov8856 driver request its power resources and run
the power on/off sequence on ACPI platforms as well as DT, and fixes an
unrelated debug message.

- Background: power resources on Intel ACPI platforms :
On Intel platforms the sensor is enumerated via ACPI, and an INT3472
"discrete" companion device (the power-logic-control driver under
drivers/platform/x86/intel/int3472) registers the sensor's reset/powerdown
GPIOs and the regulator supply.
These resources are therefore discoverable and usable through the 
standard gpiod/regulator lookups at probe time.

- Current symptom :
Previously the driver guarded both the GPIO/regulator acquisition in
ov8856_get_hwcfg() and the whole power on/off sequence with is_acpi_node() and
skipped them on ACPI. As a result the sensor was never powered or reset by the
driver and probe failed when reading the chip ID in ov8856_identify_module().
Removing those checks makes the ACPI path behave like DT.

- Validation :
Tested on Intel platforms with kernel 6.17 and 7.0.

Changes in v3:
 Add cover letter to describe details of patches.
 [1/2] media: i2c: ov8856 : remove ACPI node bypass mechanism
   - Add tags : Fixes and Cc
   - Removed a sentence from commit as this change has already been
     split out and is covered separately in patch 2/2
 [2/2] media: i2c: ov8856: fix debug message to report actual CSI-2 lane
count
   - Added tags : Cc

Changes in v2:
 [1/2] media: i2c: ov8856 : remove ACPI node bypass mechanism
   - No change
 [2/2] media: i2c: ov8856: fix debug message to report actual CSI-2 lane
count
   - Added tags : Fixes and Reviewed-by


Serin Yeh (2):
  media: i2c: ov8856 : remove ACPI node bypass mechanism
  media: i2c: ov8856: fix debug message to report actual CSI-2 lane
    count

 drivers/media/i2c/ov8856.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

-- 
2.25.1

