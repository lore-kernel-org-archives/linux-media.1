Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0942937D12E
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 06:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428977; cv=none; b=iTZlpCJW1S1FFq2h+n2Dl8AkpqSwb2+zSQrKJF4VtY1QL50zNrzOcqb2pdDW1OqtjeEpIKkad4VhW/yIfZIMXU9rZXJ8LCZNItRabQeRUi3nBVCYzrDbvLWdWGJLkZg0f4dpLKQJa6uZrcNYGbdfP9kYDlWCD030hA72x2/NIaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428977; c=relaxed/simple;
	bh=ioOPCYXnX2k0MRzZdxjywPPvHqRLuST9oiB8tg9zySs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=trY6mXFAUKNcB9ljo+gd85d9Uq179fsaHoYdfbLDxkgQtNkIE0q2uWNCvAcIgWfIXwgis5cMJ7WARVwdXF7KFH+jEXXqMRGLJa4VaiP9vvrT16KyM/96DyUO6w+9kyxPGVWIJ6oPuLaJ3l0pSmc8UlNtF+h1w0mZ6iK7DYmLZPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ec5BH4Ar; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ec5BH4Ar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786428975; x=1817964975;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ioOPCYXnX2k0MRzZdxjywPPvHqRLuST9oiB8tg9zySs=;
  b=ec5BH4ArMB9UoKu/uj3Tgcm1KAcrhIdvwrUUb8uW27UmcgZu3mM0Lnon
   jE6qsnhR/cIpKvUEYHnhx3/GO1QhOne4kIPyPhl5AOQwSmeOMiSFsmx5d
   6Nrnm/tcMSI129+R9LAVqqC7adYDARQus8jL6SJgKToiuLUSXFWdB3mDS
   iMUxV4e/+RVpgbn98cLUhP4AVBRjgRhdFsakCiLtBVGHt0z+KTa4Lr1oK
   IYbS3jxcjq3dF01zgCSkzPKoQHbTYHCSbgn4NVona6jQXGcjro35Tuvy7
   f17RNgls6qeIy97Fp4lrxlpk9KzFI4oI/jG8KniiKvihVM8pDcxR83xwU
   g==;
X-CSE-ConnectionGUID: SjRccaFBTnWvRgB50YXFzQ==
X-CSE-MsgGUID: 42bKQNEFTPGbQD1fPlUKow==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="87167992"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="87167992"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 23:16:15 -0700
X-CSE-ConnectionGUID: xY4o5S2AS6OotJ5wgaK3zw==
X-CSE-MsgGUID: gYT12SsSSWubOpuDFBrHDA==
X-ExtLoop1: 1
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.215])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 23:16:13 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 35B5611FC6D;
	Tue, 11 Aug 2026 09:16:12 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wtfmW-00000001MfP-12KT;
	Tue, 11 Aug 2026 09:16:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: antti.laakso@linux.intel.com
Subject: [PATCH 1/1] media: ipu-bridge: Print SSDB information on debug level
Date: Tue, 11 Aug 2026 09:16:12 +0300
Message-ID: <20260811061612.325451-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print information mainly from SSDB: port number, number of lanes, rotation
and orientation as well as VCM model on debug level.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..ff3bb80d374e 100644
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
-- 
2.47.3

