Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B45A3603E9
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 03:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791345001; cv=none; b=t3s/rpnuWPJlPh5azcuQ5Nfo8yObT1S9RU3XjxbnaWSLoIT4IhT8nBfUxUOC9F5UaQFNwhRRBVYGMTR1xv1vuWiz9b0MFv6KhuBBjEHSbWandPf64lhbD6xlye73MBsricCeUTUb0KZt51TlDJUXrkwEo9bDvgVDHhg9KytKnFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791345001; c=relaxed/simple;
	bh=POnNrUbduSYaIV+/gT7+CwPxHRI13WEWn4u2YbvC7Bw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GcVpP0l/ee6y0MZSey0JuCDbn1zX4lnm8QD2CTnlGSW4p0buFTInz9adPWpmnV7wkArTt+RiHIPyhllBsW7Wqc1j09d76lwSeZedSD3ZMzeBPqziHtq0f1M1tJqTmKMbLkT1MCWjZw+qYT3IBCSKVThD2P/DOtT2xPuCDrMfOLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hh66o9u/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hh66o9u/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791344999; x=1822880999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=POnNrUbduSYaIV+/gT7+CwPxHRI13WEWn4u2YbvC7Bw=;
  b=Hh66o9u/8lX23s8TQuj7tYzf4i1l+M3BP1ZCWHCcgfG/up9dnH7Z6/W7
   Wik4veLs6j8j3eguAO/s2cwD1ytqI7jrhkRC7C5exoGEKsj2+i1MH6sN7
   4FfC/VVAxXH9oG3h1AHZou80z/vSxhBenGiid7ZDEkBYFF5kJq+dPguOj
   EfatfMShFjSIrJYlXeBfhikF8oXk6CdFj1ExftXWs7vdlrYM/sfyZd12Q
   P0IoEPtIX8PMJG3f5MYZioTLiXTApULnj93JHsq5L2VnAp4vcHFvpC6Kx
   9LvVG7mwzijN5QxP2yEjZYc9t71z7zy0d0Ji/Y0fEVJ+cORuLaRoLs8W0
   Q==;
X-CSE-ConnectionGUID: nYz3/tjDQbSI4Xtt9aMrCw==
X-CSE-MsgGUID: ZvZD3itoT8G5DX2mTcqWgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="87878"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="87878"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 20:49:58 -0700
X-CSE-ConnectionGUID: kwTdSN8RTIeM1YiY8dRMnw==
X-CSE-MsgGUID: mxYDEZcuRyWxRNUUuTjrjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="277469976"
Received: from jimmy-x299-aorus-gaming-7.itwn.intel.com ([10.225.65.17])
  by fmviesa008.fm.intel.com with ESMTP; 06 Oct 2026 20:49:57 -0700
From: Jimmy Su <jimmy.su@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	jimmy.su@intel.com,
	serin.yeh@intel.com,
	vicamo@gmail.com,
	sarang.sapre@intel.com
Subject: [PATCH v1 1/2] media: ipu-bridge: extend upside-down matching with DSM module IDs
Date: Wed,  7 Oct 2026 11:49:13 +0800
Message-Id: <20261007034914.1654831-2-jimmy.su@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007034914.1654831-1-jimmy.su@intel.com>
References: <20261007034914.1654831-1-jimmy.su@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The existing upside-down sensor detection relies on sensor HID matching.
However, some platforms may source camera modules from multiple vendors.
While the sensor HID remains the same, camera modules from different
vendors may be mounted in different orientations.

Extend the upside-down matching mechanism to support ACPI _DSM module
identifiers. The driver retrieves the module ID from the sensor device
and applies a 180-degree rotation quirk when a matching module ID is
found.

This allows platform-specific rotation handling for camera modules that
cannot be distinguished by sensor HID alone.

Link: https://github.com/intel/ipu6-drivers/pull/445
Link: https://bugs.launchpad.net/bugs/2155837
Co-developed-by: Vicamo Yang <vicamo@gmail.com>
Signed-off-by: Vicamo Yang <vicamo@gmail.com>
Signed-off-by: Jimmy Su <jimmy.su@intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 95 ++++++++++++++++++++++++----
 1 file changed, 82 insertions(+), 13 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..64caa4254e41 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -36,6 +36,15 @@
  */
 #define IVSC_DEV_NAME "intel_vsc"
 
+/*
+ * 822ace8f-2814-4174-a56b-5f029fe079ee
+ * This _DSM GUID returns a string from the sensor device, which acts as a
+ * module identifier.
+ */
+static const guid_t sensor_module_guid =
+	GUID_INIT(0x822ace8f, 0x2814, 0x4174,
+		  0xa5, 0x6b, 0x5f, 0x02, 0x9f, 0xe0, 0x79, 0xee);
+
 /*
  * Extend this array with ACPI Hardware IDs of devices known to be working
  * plus the number of link-frequencies expected by their drivers, along with
@@ -105,6 +114,36 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("XMCC0003", 1, 321468000),
 };
 
+/*
+ * Upside-down orientation can be determined by the Sensor HID or module ID.
+ * Camera modules from different vendors may be mounted in opposite
+ * orientations.
+ */
+enum upside_down_match_type {
+	UPSIDE_DOWN_MATCH_HID = 1,
+	UPSIDE_DOWN_MATCH_DSM,
+};
+
+struct upside_down_match_info {
+	enum upside_down_match_type type;
+	const char * const ids[2];
+};
+
+static struct upside_down_match_info ov02c10_match = {
+	.type = UPSIDE_DOWN_MATCH_HID,
+	.ids = { "OVTI02C1" },
+};
+
+static struct upside_down_match_info imx471_match = {
+	.type = UPSIDE_DOWN_MATCH_HID,
+	.ids = { "SONY471A" },
+};
+
+static struct upside_down_match_info ov02e10_match = {
+	.type = UPSIDE_DOWN_MATCH_HID,
+	.ids = { "OVTI02E1" },
+};
+
 /*
  * DMI matches for laptops which have their sensor mounted upside-down
  * without reporting a rotation of 180° in neither the SSDB nor the _PLD.
@@ -115,35 +154,35 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 13 9340"),
 		},
-		.driver_data = "OVTI02C1",
+		.driver_data = &ov02c10_match,
 	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 13 9350"),
 		},
-		.driver_data = "OVTI02C1",
+		.driver_data = &ov02c10_match,
 	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 14 9440"),
 		},
-		.driver_data = "OVTI02C1",
+		.driver_data = &ov02c10_match,
 	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 16 9640"),
 		},
-		.driver_data = "OVTI02C1",
+		.driver_data = &ov02c10_match,
 	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 16 (Dell 16 Premium) DA16250"),
 		},
-		.driver_data = "OVTI02C1",
+		.driver_data = &ov02c10_match,
 	},
 	/*
 	 * The first four characters of DMI_BOARD_NAME identify the Lenovo
@@ -158,7 +197,7 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_BOARD_NAME, "21QA"),
 		},
-		.driver_data = "SONY471A",
+		.driver_data = &imx471_match,
 	},
 	{
 		/* Lenovo X9-14 */
@@ -166,7 +205,7 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_BOARD_NAME, "21QB"),
 		},
-		.driver_data = "SONY471A",
+		.driver_data = &imx471_match,
 	},
 	{
 		/* Lenovo X9-15 */
@@ -174,7 +213,7 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_BOARD_NAME, "21Q6"),
 		},
-		.driver_data = "SONY471A",
+		.driver_data = &imx471_match,
 	},
 	{
 		/* Lenovo X9-15 */
@@ -182,7 +221,7 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_BOARD_NAME, "21Q7"),
 		},
-		.driver_data = "SONY471A",
+		.driver_data = &imx471_match,
 	},
 	{
 		/* Samsung Galaxy Book5 Pro 360 */
@@ -190,7 +229,7 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "960QHA"),
 		},
-		.driver_data = "OVTI02E1",
+		.driver_data = &ov02e10_match,
 	},
 	{} /* Terminating entry */
 };
@@ -359,9 +398,39 @@ static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
 
 	/* A machine may have one entry per sensor, so check all matches. */
 	for (dmi_id = dmi_first_match(upside_down_sensor_dmi_ids); dmi_id;
-	     dmi_id = dmi_first_match(dmi_id + 1))
-		if (acpi_dev_hid_match(adev, dmi_id->driver_data))
-			return 180;
+	     dmi_id = dmi_first_match(dmi_id + 1)) {
+		const struct upside_down_match_info *match =
+			dmi_id->driver_data;
+		union acpi_object *obj;
+		size_t i;
+
+		switch (match->type) {
+		case UPSIDE_DOWN_MATCH_HID:
+			for (i = 0; i < ARRAY_SIZE(match->ids) && match->ids[i];
+			     i++)
+				if (acpi_dev_hid_match(adev, match->ids[i]))
+					return 180;
+			break;
+		case UPSIDE_DOWN_MATCH_DSM:
+			obj = acpi_evaluate_dsm_typed(adev->handle,
+						      &sensor_module_guid, 0x00,
+						      0x01, NULL,
+						      ACPI_TYPE_STRING);
+			if (!obj)
+				break;
+
+			for (i = 0; i < ARRAY_SIZE(match->ids) && match->ids[i];
+			     i++)
+				if (!strcmp(match->ids[i],
+					    obj->string.pointer)) {
+					ACPI_FREE(obj);
+					return 180;
+				}
+
+			ACPI_FREE(obj);
+			break;
+		}
+	}
 
 	switch (ssdb->degree) {
 	case IPU_SENSOR_ROTATION_NORMAL:
-- 
2.34.1

