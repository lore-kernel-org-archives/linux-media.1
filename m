Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E262A3AEF3A
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 20:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813109; cv=none; b=llF8CHb6ZamlhZiA9jZBWcVgs+jl4Heh5N3X2UOjGM60ZsvFVg+X1RMLrwKiQI787BLUI9UlJzezjzT6ILx80tmH8XssJ2/ZE9YPQYJ4CANzYPZfZ7/mN7iyd+bY7TkXOqSHo0pVHwszQoiYdW3c2H1pOCXRZhXQCF88ACAxwbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813109; c=relaxed/simple;
	bh=uR1rM9UJMODeJyTiMLKwnRoyjcLiBDYqvCeFTvK3vbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FMuNUYxVqoDKL3mOc+QHqUAc51QhF7QYVDBI1yT1gXwi81snu4EgfIbCuGLcROSoDxx1Qymip0FDSgQfTaD5LXvbMgPQfFwRXxduKqEL0094KO7hove9VFwMAP9z5/r3OEtMNenEOaT1YN097SVXTPF3lPs3p22l2pGrguUBQeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D1ck2qBA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1ck2qBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788813107; x=1820349107;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uR1rM9UJMODeJyTiMLKwnRoyjcLiBDYqvCeFTvK3vbY=;
  b=D1ck2qBAHlhYx5KeuYy21O8B1nH+bKnwOi3WNwvyde8jd7QcjRmAqm6p
   QKVAxdyrk6WrWiHQFlb7ArvuUvT7wp2b7zQfy/vwjA//+1v/H7NKIgNp6
   Gq984ZKV2XEuCuzIlzrSfID2kZDGjNDurJn4CMgx6WGBjcQzfxPagn/8r
   3A4LDHpArYFg6zl8iRfFX9l7q1gyAy6ka7IB4nZ9yT+UWxRQG9mk24CDI
   5s51epklflZu69edDGWNj6WY9E5+koJeIvDQIsHH11yZ4r6RKDY887wBa
   /tPnxk+pNUXBJe0soSFVxnQmFSrrW13frj/9uoLp2BHX2H7ma6OgTuKlE
   w==;
X-CSE-ConnectionGUID: RjBG2N51RDuiaDro6ndH6Q==
X-CSE-MsgGUID: OtETHYL4SGSNdmg/fMnnzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93034702"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="93034702"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 13:31:42 -0700
X-CSE-ConnectionGUID: 7VCR2f5dRX6p3tJurz1ESw==
X-CSE-MsgGUID: NoKyd60aQo6Gnf3haD5cmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="267536423"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.80])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 13:31:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C5F0C121C5B;
	Mon, 07 Sep 2026 23:31:42 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x3g0E-0000000Be9J-13KU;
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
Subject: [PATCH 1/3] media: ipu-bridge: Add ipu_bridge_get_ipu6()
Date: Mon,  7 Sep 2026 23:31:40 +0300
Message-ID: <20260907203142.2775925-2-sakari.ailus@linux.intel.com>
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
index 16fac765456e..373c63f98999 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -169,12 +169,14 @@ struct ipu_bridge {
 };
 
 #if IS_ENABLED(CONFIG_IPU_BRIDGE)
+struct pci_dev *ipu_bridge_get_ipu6(void);
 int ipu_bridge_init(struct device *dev,
 		    ipu_parse_sensor_fwnode_t parse_sensor_fwnode);
 int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor);
 int ipu_bridge_instantiate_vcm(struct device *sensor);
 #else
 /* Use a define to avoid the @parse_sensor_fwnode argument getting evaluated */
+struct pci_dev *ipu_bridge_get_ipu6(void) { return NULL; }
 #define ipu_bridge_init(dev, parse_sensor_fwnode)	(0)
 static inline int ipu_bridge_instantiate_vcm(struct device *s) { return 0; }
 #endif
-- 
2.47.3

