Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB52245198D
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941997; cv=none; b=K1DroVtFKXwOfoUhGsjWNOc8ETDvQPS8N6tCP5+sIfjn6jzF0wFvGNTcqK6neQxfJCj9/DefQmyEjY0JAXmSVS/lg2yNvHCE+wTQJwWyLPW7y1NJFiy2zvVD1Xm3gcEz3qOhpblRnS503cELw0YeQyH7oOtRsN3KrhZcoMuIHSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941997; c=relaxed/simple;
	bh=x1HEJN8rUu6UuuYN304KrQxrI3MXTC6x14YzmSGpcoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hClYjJE6RvsyeHhXaiEGZC+5Ydh+ZuO/PqpzBx45yWjD3/Z+2EIZjPijWMi0uKgnnum67mgcKYReizNyId9IdxMx9GlAU8qV86ofD3bUiRT8Hxf9uOthluCkzGaJxK5YhT4SvzvLa1uoatdqShH31P3AKNbs3lr995EAHQ3/tK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huGJRQFd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huGJRQFd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788941995; x=1820477995;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x1HEJN8rUu6UuuYN304KrQxrI3MXTC6x14YzmSGpcoo=;
  b=huGJRQFdiylPnxVVUbT4pF3dTZuI8hREWP1T8mCmEY3ZKeA7QX/MvXL/
   MveHbLGwLBrCjREGhcFO3zy47LU2WCnpTkQhEpuHuLn2bIN+BgSGbr9ZM
   zeM//HfjKYqYD+DTIEKVeswJMOZXBIde1C2h4ztk1pyGqqbLjDLl8Nut5
   OkWcBrz0ly2DrPVfUg+gy1rHb0pOTuI6LY+6X9s4/9WTPxe94fQlBOFyf
   UnBTc5nN8SAiY1Kvl6CONHnm7toWbpuCUXVToPao0qc9l4fOpi68Sb4mT
   4Z5MVmF5gPv+AbdZbi7viwkeYmmrg8h+8qL5Qj+nrZaO61HSUrMcojS3B
   w==;
X-CSE-ConnectionGUID: LSJlLzS/SxGBKNDaciwIwQ==
X-CSE-MsgGUID: S2Zrr/SKRfmramT12e16yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99952295"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="99952295"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 01:19:52 -0700
X-CSE-ConnectionGUID: lZ/ClqGuRaqEsCXlhTqaDg==
X-CSE-MsgGUID: k05lz8bPTBCZUV9aEEICZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="265041077"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 01:19:51 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9A752121CB1;
	Wed, 09 Sep 2026 11:19:53 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x4DX7-0000000Cxdr-0OG7;
	Wed, 09 Sep 2026 11:19:53 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: antti.laakso@intel.com,
	Lixu Zhang <lixu.zhang@intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	"Sapre, Sarang" <sarang.sapre@intel.com>
Subject: [PATCH v2 2/3] media: cvs: Use ipu_bridge_get_ipu6()
Date: Wed,  9 Sep 2026 11:19:51 +0300
Message-ID: <20260909081953.3089179-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909081953.3089179-1-sakari.ailus@linux.intel.com>
References: <20260909081953.3089179-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of going through the PCI device ID table, use
ipu_bridge_get_ipu6() to obtain a pointer to the IPU PCI device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/cvs/core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/cvs/core.c b/drivers/media/i2c/cvs/core.c
index d4a3b9c3bab1..98cadd58a075 100644
--- a/drivers/media/i2c/cvs/core.c
+++ b/drivers/media/i2c/cvs/core.c
@@ -21,7 +21,6 @@
 #include <linux/workqueue.h>
 
 #include <media/ipu-bridge.h>
-#include <media/ipu6-pci-table.h>
 
 #include "icvs.h"
 
@@ -656,14 +655,12 @@ static int cvs_configure_dev_caps(struct icvs *ctx)
  */
 static int cvs_core_probe(struct device *dev, struct i2c_client *i2c)
 {
-	struct pci_dev *ipu = NULL;
+	struct pci_dev *ipu;
 	struct icvs *ctx;
 	int ret;
 
 	/* Locate IPU device */
-	for (unsigned int i = 0; !ipu && ipu6_pci_tbl[i].vendor; i++)
-		ipu = pci_get_device(ipu6_pci_tbl[i].vendor,
-				     ipu6_pci_tbl[i].device, NULL);
+	ipu = ipu_bridge_get_ipu6();
 	for (unsigned int i = 0; !ipu && icvs_ipu7_tbl[i].vendor; i++)
 		ipu = pci_get_device(icvs_ipu7_tbl[i].vendor,
 				     icvs_ipu7_tbl[i].device, NULL);
-- 
2.47.3

