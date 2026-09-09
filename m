Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2FB45FFBB
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 08:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941999; cv=none; b=ASiDLVfVml78tqm0CwkoaQdYCGwpMg1jsobMMCwrsJRyKzluQZ6vA+T76Hi78k8Zx9teinmSCV/u/6ifQuJW9bLiL73j8rj6hsWisWul5O74NMlf3mqA/VTYJCezezobKNtO0HMZmGU/1W+aUojcgIe4ORMDylx+qc2pCDxnRbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941999; c=relaxed/simple;
	bh=b4Fu0Qe9eL7ziiMe8aLjlEoIXQKMKk43L5IkiVFwaSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=em4Bv34R9YxF0GyBeURXnXFB2pfjz/v/WXY3tcX2Q9ETikrTUWaEJq0AGNIWlVMYg3at9/pajG5oHqarSAj1jZzPsVaPYOxPuEX6PiEX0JxgQCbXifwenyiK2PCTIVd+aJMgFgTG9oE5OiEuWXLwSq+mYqeCktHnZKRRoGnxB5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdUVt5KV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdUVt5KV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788941997; x=1820477997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b4Fu0Qe9eL7ziiMe8aLjlEoIXQKMKk43L5IkiVFwaSY=;
  b=kdUVt5KVCb4iu9BqD8oCg7txTNF3K4pwbP69u37lrw2HOXJ7CM2qKPdF
   UiGH3Wu2oeWk322uTbivHFQyyuTlNZSwhuVULT3379yGjGy27ToCgcPws
   mbLFNCNoK+JLURYFXsgD0vAxZHD0nKg2G+tmgzNhfJJeT2TEMEjHIBVze
   R/32zc0sUt2I/C2gZUf2wOfbVAFcfNhUUFb8rMHo/zHO4kxfGTC6FY20q
   gHNPrwXE37SKWX7ddghV3e+2Yz5UQ+yWRwNCq6x+la2niMwx63NqBVPkC
   nlNo8zVVLZkTuusw86jlXuECBPNFNmIHMSh19lI0QHvep+RVNj1R42rJA
   A==;
X-CSE-ConnectionGUID: gszrI7eKTFmujVPzzXBx7Q==
X-CSE-MsgGUID: nUD7NhBMTMmrlISNSMhPEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99952298"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="99952298"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 01:19:52 -0700
X-CSE-ConnectionGUID: qwjBi6e0T0auDKeyvtMiEw==
X-CSE-MsgGUID: DMR9BEu4Qv6n/A35P3ENhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="265041079"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 01:19:51 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9A205121CA9;
	Wed, 09 Sep 2026 11:19:53 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x4DX7-0000000Cxdn-0Ixe;
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
Subject: [PATCH v2 1/3] media: ipu-bridge: Add ipu_bridge_get_ipu6()
Date: Wed,  9 Sep 2026 11:19:50 +0300
Message-ID: <20260909081953.3089179-2-sakari.ailus@linux.intel.com>
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

Add ipu_bridge_get_ipu6() for obtaining the IPU 6 (or soon later) PCI
device. This isn't technically a job of the IPU bridge, but the
functionality is required in conjunction with the firmware definitions
that necessitate the use of the IPU bridge on many systems.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 14 ++++++++++++++
 include/media/ipu-bridge.h           |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 7e65491faf6d..67a1f233c4c6 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -8,6 +8,7 @@
 #include <linux/dmi.h>
 #include <linux/i2c.h>
 #include <linux/mei_cl_bus.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -15,6 +16,7 @@
 #include <linux/workqueue.h>
 
 #include <media/ipu-bridge.h>
+#include <media/ipu6-pci-table.h>
 #include <media/v4l2-fwnode.h>
 
 #define ADEV_DEV(adev) ACPI_PTR(&((adev)->dev))
@@ -950,6 +952,18 @@ static int ipu_bridge_check_fwnode_graph(struct fwnode_handle *fwnode)
 	return ipu_bridge_check_fwnode_graph(fwnode->secondary);
 }
 
+struct pci_dev *ipu_bridge_get_ipu6(void)
+{
+	struct pci_dev *ipu = NULL;
+
+	for (unsigned int i = 0; !ipu && ipu6_pci_tbl[i].vendor; i++)
+		ipu = pci_get_device(ipu6_pci_tbl[i].vendor,
+				     ipu6_pci_tbl[i].device, NULL);
+
+	return ipu;
+}
+EXPORT_SYMBOL_NS_GPL(ipu_bridge_get_ipu6, "INTEL_IPU_BRIDGE");
+
 static DEFINE_MUTEX(ipu_bridge_mutex);
 
 int ipu_bridge_init(struct device *dev,
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 16fac765456e..b46b6693f856 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -169,11 +169,13 @@ struct ipu_bridge {
 };
 
 #if IS_ENABLED(CONFIG_IPU_BRIDGE)
+struct pci_dev *ipu_bridge_get_ipu6(void);
 int ipu_bridge_init(struct device *dev,
 		    ipu_parse_sensor_fwnode_t parse_sensor_fwnode);
 int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor);
 int ipu_bridge_instantiate_vcm(struct device *sensor);
 #else
+static inline struct pci_dev *ipu_bridge_get_ipu6(void) { return NULL; }
 /* Use a define to avoid the @parse_sensor_fwnode argument getting evaluated */
 #define ipu_bridge_init(dev, parse_sensor_fwnode)	(0)
 static inline int ipu_bridge_instantiate_vcm(struct device *s) { return 0; }
-- 
2.47.3

