Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4485E2EC083
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834039; cv=none; b=rFPUpmr5BSVS3Oc94QwTp8gzllTL6bht1C99vmY28ngD6x8q/XzIab4CfAYkXRJYAgv3b7oaUBabG2ri9/pIHhOWldyiWZZOMlLxfJUl3JNjamxv/uRxwn4/gXbpAOCkPekNuZsLNKN97kUKJcOrHLr9QjKlNOOk9dsFY6WMVUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834039; c=relaxed/simple;
	bh=F5LMgwY86UY1n+OC3fJ5Yyof4hzrogbRY0ag5yW7TQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C/nd0UmaL5ZcN3cPoenP//zd3f4G3MI5gBBu8r53r5Litken+bER7+T/pxRKxmyZjuerh7DuPHw6PpBvhgm5mAER30W3PVIz+ckwlsCQJLDCa4k3ByYeJQ2vGpz2Y38eDjOcuY8UfwTTO9jFODAfIR89dzFtJv2i5EnCFWBVZCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L673pzrm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L673pzrm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834038; x=1819370038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F5LMgwY86UY1n+OC3fJ5Yyof4hzrogbRY0ag5yW7TQQ=;
  b=L673pzrmImTz0KINMmTLUT9ZV9lC9Vup87inZBHxxHDyPaWNOv46n4yI
   QIaUwRzbBdDe8opdMNXQNPieQ6dgFSKdIEiGjzJ955ImrqZZAt6J1Ac5j
   /JTSY3EBiTkxukoWyk82WEVtIEZFYeCbwhcziwYa4AT8ILEjycwVB1lJi
   f4zJR3jfekYLyO6p5+7dPDeq+2XVyWPnMC790TgqGLbngs8ySUM7G1xXu
   sBB06c7jO9WnRerK4LnW3difPLdBuf2gwal2fjnOXXB97CDuy/J9De08j
   kficmZ+G17ZtyrNog1rtSj26w25vOcpLKzP8BsoE5DRSB/lIu8Rh15vyF
   w==;
X-CSE-ConnectionGUID: 5zLwVHFkSI29LvxqbjN7Qg==
X-CSE-MsgGUID: WGmiMKKdSHaqquxtIAhDpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188519"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188519"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:33:57 -0700
X-CSE-ConnectionGUID: nIrfBQKlTQmQYMXFGW2tyQ==
X-CSE-MsgGUID: 2GXQ8I/aQYyJFsVB6gdJUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384266"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:33:55 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 04/44] media: ipu6: Remove duplicate warnings in cpd validation
Date: Thu, 27 Aug 2026 15:32:56 +0300
Message-ID: <20260827123336.2219048-5-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
References: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the error paths printed same or similar errors twice,
once is enough.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-cpd.c | 29 ++++++-------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-cpd.c b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
index b7013f6524ec..966a16a300f8 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-cpd.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
@@ -266,7 +266,6 @@ static int ipu6_cpd_validate_moduledata(struct ipu6_device *isp,
 					u32 moduledata_size)
 {
 	const struct ipu6_cpd_module_data_hdr *mod_hdr = moduledata;
-	int ret;
 
 	/* Ensure moduledata hdr is within moduledata */
 	if (moduledata_size < sizeof(*mod_hdr) ||
@@ -276,15 +275,9 @@ static int ipu6_cpd_validate_moduledata(struct ipu6_device *isp,
 	}
 
 	dev_dbg(&isp->pdev->dev, "FW version: %x\n", mod_hdr->fw_pkg_date);
-	ret = ipu6_cpd_validate_cpd(isp, moduledata + mod_hdr->hdr_len,
-				    moduledata_size - mod_hdr->hdr_len,
-				    moduledata_size);
-	if (ret) {
-		dev_err(&isp->pdev->dev, "Invalid CPD in moduledata\n");
-		return ret;
-	}
-
-	return 0;
+	return ipu6_cpd_validate_cpd(isp, moduledata + mod_hdr->hdr_len,
+				     moduledata_size - mod_hdr->hdr_len,
+				     moduledata_size);
 }
 
 static int ipu6_cpd_validate_metadata(struct ipu6_device *isp,
@@ -325,10 +318,8 @@ int ipu6_cpd_validate_cpd_file(struct ipu6_device *isp, const void *cpd_file,
 
 	ret = ipu6_cpd_validate_cpd(isp, cpd_file, cpd_file_size,
 				    cpd_file_size);
-	if (ret) {
-		dev_err(&isp->pdev->dev, "Invalid CPD in file\n");
+	if (ret)
 		return ret;
-	}
 
 	/* Check for CPD file marker */
 	if (hdr->hdr_mark != CPD_HDR_MARK) {
@@ -346,17 +337,11 @@ int ipu6_cpd_validate_cpd_file(struct ipu6_device *isp, const void *cpd_file,
 	/* Validate metadata */
 	ent = ipu6_cpd_get_metadata(cpd_file);
 	ret = ipu6_cpd_validate_metadata(isp, cpd_file + ent->offset, ent->len);
-	if (ret) {
-		dev_err(&isp->pdev->dev, "Invalid CPD metadata\n");
+	if (ret)
 		return ret;
-	}
 
 	/* Validate moduledata */
 	ent = ipu6_cpd_get_moduledata(cpd_file);
-	ret = ipu6_cpd_validate_moduledata(isp, cpd_file + ent->offset,
-					   ent->len);
-	if (ret)
-		dev_err(&isp->pdev->dev, "Invalid CPD moduledata\n");
-
-	return ret;
+	return ipu6_cpd_validate_moduledata(isp, cpd_file + ent->offset,
+					    ent->len);
 }
-- 
2.55.0

