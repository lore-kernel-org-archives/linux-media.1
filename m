Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6DE392C21
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786461059; cv=none; b=ArSBfYxwZA8FKskKbgtW7To+isG17ieHY2nuGNGFDqeDKigqgr8+fzxy4yrqd4OOM/We3mKkI0L1k7Hy8B2xj2JwyRfU0iqsSi/Rk5IDQUfKp2Vr9z0v4pu5Q0Fs5EOX+tVuMaElWG7qmn2knzOTHtClf0wadXglw6mZE49tPY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786461059; c=relaxed/simple;
	bh=fZ5KmsoQ4pu5j4c1/ga1Zc9EYC/bcUJe+jLRI2bTyYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q+QJiiZavktUuDPzLYkTW1TQRkuxRUpuOXj10/3n8m/vv/UWIyy27g8ssW2Bhp1Ha1Hx3bAOH1Tl+mTw0fNRSx5TqlS2nNoSR29ZxJiFfv4FMDKp7P0uNEgMoU5NO7QbEpNVgdTzvtUxnoVCH8p1dgXKwKU3kEmGq+lfi8I9D4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/YHnnw7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/YHnnw7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786461055; x=1817997055;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fZ5KmsoQ4pu5j4c1/ga1Zc9EYC/bcUJe+jLRI2bTyYk=;
  b=g/YHnnw7fmkRRYN29LcCNGAl6UuHIorWx0qOBxjlmXEwMDepyARCBcSJ
   HrgPmO/lUD+v0/ssANDWj2hKfuAGR1ohgj4xyfbiDhdfe1800c43tDEjw
   U53MDG5/AI9zPU+lDgg+5l+VZqfKHlGdGqM97sh2c4BjVs/qU7JUL/G24
   4NO7V0s5PDGrgykXsQSDXnUBnxN/aY0He5vjSKzSYRTN00sqWsK3OC9TY
   WWP2n3VK6HGlqK+mPInS1+ukcjlHRjdCdgBViiDXlE3zG90rkbN6vDBIp
   8uFu4AuXQe+tYAdEfa4V0JiC33vkMkMklX7mTgKQ6C79AAUjNvCt853so
   Q==;
X-CSE-ConnectionGUID: h57Es56dQzOmNKLcmOSqXQ==
X-CSE-MsgGUID: TQgx5vBnSk6G/+sTVIR0+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="104383475"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="104383475"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 08:10:53 -0700
X-CSE-ConnectionGUID: GLcfTcMTSU2vlUiMpU05qg==
X-CSE-MsgGUID: wkV5L4H4RN+GLNPzAiTW8A==
X-ExtLoop1: 1
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.215])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 08:10:52 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 45084121BF2;
	Tue, 11 Aug 2026 18:10:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wto7u-00000001f6F-1W1U;
	Tue, 11 Aug 2026 18:10:50 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: antti.laakso@linux.intel.com,
	johannes.goede@oss.qualcomm.com
Subject: [PATCH v2 1/1] media: ipu-bridge: Print more debug information on connected devices
Date: Tue, 11 Aug 2026 18:10:50 +0300
Message-ID: <20260811151050.396307-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print information mainly from SSDB: port number, number of lanes, rotation
and orientation as well as VCM model on debug level. Also print the fwnode
path of the connected sensor.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
since v1:

- Also print the fwnode path of the connected sensor.

- Adjust the subject accordingly.

 drivers/media/pci/intel/ipu-bridge.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..125fe5da7a60 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -412,6 +412,7 @@ static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struct acpi_dev
 
 int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 {
+	acpi_handle handle = acpi_device_handle(ACPI_PTR(adev));
 	struct ipu_sensor_ssdb ssdb = {};
 	int ret;
 
@@ -435,8 +436,15 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 	sensor->rotation = ipu_bridge_parse_rotation(adev, &ssdb);
 	sensor->orientation = ipu_bridge_parse_orientation(adev);
 
-	if (ssdb.vcmtype)
+	acpi_handle_debug(handle,
+			  "CSI-2 port %u, lanes %u, mclkspeed %u, rotation %u (SSDB %u), orientation %u\n",
+			  sensor->link, sensor->lanes, sensor->mclkspeed,
+			  sensor->rotation, ssdb.degree, sensor->orientation);
+
+	if (ssdb.vcmtype) {
 		sensor->vcm_type = ipu_vcm_types[ssdb.vcmtype - 1];
+		acpi_handle_debug(handle, "VCM %s\n", sensor->vcm_type);
+	}
 
 	return 0;
 }
@@ -832,8 +840,8 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 		if (ret)
 			goto err_free_swnodes;
 
-		dev_info(bridge->dev, "Found supported sensor %s\n",
-			 acpi_dev_name(adev));
+		dev_info(bridge->dev, "Found supported sensor %s (%pfw)\n",
+			 acpi_dev_name(adev), primary);
 
 		bridge->n_sensors++;
 	}
-- 
2.47.3

