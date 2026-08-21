Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142BD48425E
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312631; cv=none; b=udKtfwflH4uAqTiADqUKMGY6vflyLsPViRJ67wxbEmeQEogFQXn2dHNQaRs0USeN5MNtHQSOYhc4xeM2X0cy8Lc29OSHE0nHGWiC32K68m27jf5MPhM3wzFd/faKp5KhJxv7KE32TJwE3t9XRkuJJ5IY779AelcIDygVc1XUiS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312631; c=relaxed/simple;
	bh=F5LMgwY86UY1n+OC3fJ5Yyof4hzrogbRY0ag5yW7TQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IS/TXOXnvSDpdAWTOlIP4G6HONGe1ckaM8Yz0tFhaBG9sa/3maAa4/ZI4Yw2oKilsB+diQMcev9r+beH7gI9j2t3fFL8H9Y+w8jLhyU/zWj4SKaTSXK5qnp1B4FHnobhcx7h0B/c1Jj6pgmTBBVHG4lzvrqOYEMYqdup/ZVf+bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGRj/0B+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGRj/0B+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312630; x=1818848630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F5LMgwY86UY1n+OC3fJ5Yyof4hzrogbRY0ag5yW7TQQ=;
  b=iGRj/0B+LPo9VFywksbJDIbDJ6xoI0FQzsEuPlaPgQ1vgylwCO+ySVB9
   ak0PcWY/p9HWn+JxMSi5JPDt5nn0mFW3VA1enpVQ+SV4uaVvYz0zA9Eez
   9aUzpN3hKzaOcNJ//5z5jzPeUK4x2D1XFOYqSsKZv0/g+smJ6Ylo2N3Kh
   qiPyzFjxvpJ7P107+IV/BtATVC5sOb7VXNC0FR/+f75e/E9Syi2lXVis/
   NdXgSoIxL5YKFmWq0MMjNTuvx67rNeC6GaKZ1vasue27D5ckmrWSfue10
   /JNjOEB+RZxwkIFxvj0EUntFKYOTIGN06PUuSHmq9uETzJnKhDL+IslLN
   A==;
X-CSE-ConnectionGUID: mtp/OP+zShKLrbnGtDH0fQ==
X-CSE-MsgGUID: lADdQx2xR4eKnYhuPoHq2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989008"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989008"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:43:50 -0700
X-CSE-ConnectionGUID: tjs9ez1nSKKl5foLVk5qeQ==
X-CSE-MsgGUID: dXbxQ77UQ3OBR80h2i9BSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172163"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:43:48 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 04/44] media: ipu6: Remove duplicate warnings in cpd validation
Date: Fri, 21 Aug 2026 14:42:22 +0300
Message-ID: <20260821114302.365532-5-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821114302.365532-1-antti.laakso@linux.intel.com>
References: <20260821114302.365532-1-antti.laakso@linux.intel.com>
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

