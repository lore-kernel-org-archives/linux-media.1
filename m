Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13A43B1EC0
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 20:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813110; cv=none; b=GAGCBkyOtu3KDP6iNVO1zJIJxJrxh1r3TmA03Qz+FWEAI8+hMAxmdPjXwmIxj/6BsHwRt4AGLBQYSdkYTLB+gQ6vynuEEmD5w8WGHnDTgHTeupNR+TDRo9s75jMV533kxQZTkl9JRY7c2ArAo/GVdWYethfMK7bvD5Oc5dhyXW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813110; c=relaxed/simple;
	bh=x1HEJN8rUu6UuuYN304KrQxrI3MXTC6x14YzmSGpcoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wp4mHcoBKxgTSGSp3VEA+OHmW3ZgqBm5VJ4Tyi73S5cHZP5GPfTyY+oSwoY+6F6jyaaAFHSNYGbeAjDMwTQKf2WGsgFb0e1u68e82KOg2vkd/9G0brJqKUJ8wlrauX7BR1CzHWsdwU+R30frWMzoI7VMsfmarcnxpqUUKpkLexY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qy9or2lj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qy9or2lj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788813108; x=1820349108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x1HEJN8rUu6UuuYN304KrQxrI3MXTC6x14YzmSGpcoo=;
  b=Qy9or2lja/LojqHH6deS7JuQ+l5VYQJlzqykkLYyVnLAOtjlHiwoqJMy
   jKqIXX5vjwHHYpDyo6yCbn5t1ZuSrZipHTLHYyzoOSJf+k6EBYVGQHs0b
   +xSapdRKSlbIDUo80Fb7/+I/nXyqOT5ECwXrPEf+880cN2c5743SQMP7n
   kE8rM153KvfSNLF524hrzYFUJwRtIR5rMSYj/lYYWZLaG0w8jZkXtN+RS
   juRaGyUZqO8225bZ0MM2cWc/Twv0AnC9hQ7VjbTTRAngjYF/Py5DcSTp0
   kUDUoBsuwtGOBcI7cbBrZ97Ku5BgZc1NLPgI8jI9x5K0lSFMBUjgSuQFx
   A==;
X-CSE-ConnectionGUID: xa3BbbuDTCyunSijaTiMZw==
X-CSE-MsgGUID: C5DQQ+QhQGSi1kR9OkALdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93034699"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="93034699"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 13:31:42 -0700
X-CSE-ConnectionGUID: LloYjMAGRsi+zrYHbGepSA==
X-CSE-MsgGUID: LLFQzVXLTfeSyvTz9kAivw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="267536427"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.80])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 13:31:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C55D5121C28;
	Mon, 07 Sep 2026 23:31:42 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x3g0E-0000000Be9N-1ANL;
	Mon, 07 Sep 2026 23:31:42 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: antti.laakso@intel.com,
	Lixu Zhang <lixu.zhang@intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	"Sapre, Sarang" <sarang.sapre@intel.com>
Subject: [PATCH 2/3] media: cvs: Use ipu_bridge_get_ipu6()
Date: Mon,  7 Sep 2026 23:31:41 +0300
Message-ID: <20260907203142.2775925-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907203142.2775925-1-sakari.ailus@linux.intel.com>
References: <20260907203142.2775925-1-sakari.ailus@linux.intel.com>
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

