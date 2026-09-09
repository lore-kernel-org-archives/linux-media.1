Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A210929405
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 08:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941995; cv=none; b=efXn1JHwS5JN5+JIRuhoULA1dJ8uk4cyr2CnYKMna1GCHCyl0vrGCt9Rtb2MG6s7/5EXmZk/dhTOJQrAztw+qzrp1n7OTyHWdmlEBRWc/XxtxpiCm+scCIAhXBhBJ9WORYDfYUwjGs13FbboSi56HngpKqmiScoYN0jKOIfqUII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941995; c=relaxed/simple;
	bh=k+95z1oqZTiVoEV0NfQ17CtfPrutuvOFHTJaNRbQNH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gvz0PIpg138gf7fjOur3fKvFU5CkpcZxSADPKS7QVeHl+t91gkOGsfgiV85EmSxm+/3/Zx7A8EKIMU1EaDUbOGlb0OpaEcJx09QftMqbKBypqp4PG1HjwpcGb1AqChPvrEib21HvgVx19ut0ICaJfHTCyS/YKZHoGGfpGQyPog0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ie4b3Fh/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ie4b3Fh/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788941993; x=1820477993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k+95z1oqZTiVoEV0NfQ17CtfPrutuvOFHTJaNRbQNH0=;
  b=Ie4b3Fh/1kYDC/g/1xxQ0f2k5GTDrwfo+tebo6CsrkciFhIbvFhSBMYi
   igLs+LZVghcdcoBzbJBrWUPIxBBbVXcje6XGHIn0H8vIxmKlfplgHh8bR
   iMC8zZ8kWh3YzwtBO2kJw6VOOTGFGmWaMgGdgUEyF1tgeMZ4o6KBY+lzV
   DDEhevqMAK54AwCreyIrut7EIeNX1dRzo4Ew+Yy5egEblsGHxN4hoq/T4
   1LMNg28rhfOXyjIQL1nMwgwQIeB3G7/X9bMHSCNOtAg0RYQS9q0yH0pSU
   wPo2axxb6DWX+wbiQpeIk5R2QvEST4X4fk4zr6fCil1eVZa0Ip6Ai0wZP
   A==;
X-CSE-ConnectionGUID: 3641nrmHQLWXfsTOpGOvlg==
X-CSE-MsgGUID: Xz3gm7P4R2KNiwr+VKyY7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99952292"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="99952292"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 01:19:52 -0700
X-CSE-ConnectionGUID: rVYLQS8wRe+eYdM3e7fLMA==
X-CSE-MsgGUID: 9yotqIgHQ0CfPb+t0bl8+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="265041076"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 01:19:51 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9B9F0121CB3;
	Wed, 09 Sep 2026 11:19:53 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x4DX7-0000000Cxdv-0Snj;
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
Subject: [PATCH v2 3/3] media: ivsc: Use ipu_bridge_get_ipu6()
Date: Wed,  9 Sep 2026 11:19:52 +0300
Message-ID: <20260909081953.3089179-4-sakari.ailus@linux.intel.com>
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
 drivers/media/pci/intel/ivsc/mei_csi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index c2917e156345..d4256415a829 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -27,7 +27,6 @@
 #include <linux/workqueue.h>
 
 #include <media/ipu-bridge.h>
-#include <media/ipu6-pci-table.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
@@ -644,13 +643,9 @@ static int mei_csi_probe(struct mei_cl_device *cldev,
 	struct device *dev = &cldev->dev;
 	struct pci_dev *ipu;
 	struct mei_csi *csi;
-	unsigned int i;
 	int ret;
 
-	for (i = 0, ipu = NULL; !ipu && ipu6_pci_tbl[i].vendor; i++)
-		ipu = pci_get_device(ipu6_pci_tbl[i].vendor,
-				     ipu6_pci_tbl[i].device, NULL);
-
+	ipu = ipu_bridge_get_ipu6();
 	if (!ipu)
 		return -ENODEV;
 
-- 
2.47.3

