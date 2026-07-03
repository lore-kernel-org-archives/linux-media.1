Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E93417350
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092398; cv=none; b=YY9+OecCPPSvXR25DqvMG48XF20pcZUhjXaihqzDrmkTQeA26OMbJijMDuId7SAqY295lhIF0fYPALWtSOkLB2PJW2+75WeaGOAhbOxxIhWm0QBRjuFWp+SX6AIRpYf92Fiqo76A/fxWcwyZz7vxyeuptOnamEK7BmrRvZpggOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092398; c=relaxed/simple;
	bh=aStwut9s5/2Zj0qycgwA8jfBTwND7y7r54v7YlbOiqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qVXaOZDARHxq36uJArU/K51Nw2zbTl+Si68rhQygNW19agt85h33ScRF0Kx8tN2VFCirc8muiCcan3NnzDgb0R/kX72JJMYkj7abDr2cM5LHeOYNBloidc0JBt47o6Eq2O5wYJ06yOVqVopWfPTBuWXpeWYRqF4+HZHHOG1QRE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcTrrbiz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcTrrbiz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092397; x=1814628397;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aStwut9s5/2Zj0qycgwA8jfBTwND7y7r54v7YlbOiqo=;
  b=LcTrrbizVoFqhQgUp278i6vS0ChaVqNGH0XLmWOgKUKKU/KoEgrGHACM
   4DDQSqA0OHTKVDrPGpW1xLJJjbHllSugvLgYd1RPKUsrWVLunkH4lh2ij
   0q8pe6kj1F+i3HJxUbcB7NYYaj1Oi5PcxjOEyqlcvP2Gc2axTvIjmtA56
   G6qbs3uTNctrgpJSo0+svxTeXjnq6eW2rrRTgnHM4CSCly3LZtFfz1EfZ
   uC9U+xSUzLcKGPQCAmXiwFrRAV8643oA/Tb5K/IA9VXjWCE9sj2Bl7HT3
   bEJ0MUDE7j2qxV4NMfmwzBGOHE3A/cOrji22mq84lZSsar72GfBEltZ66
   A==;
X-CSE-ConnectionGUID: WRneeFHdTZmSUTf75nF0ew==
X-CSE-MsgGUID: fVRLs9y1TtmQPERaHCMc5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396273"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396273"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:37 -0700
X-CSE-ConnectionGUID: 4eTcoiltQAGLKPHrU1SCrA==
X-CSE-MsgGUID: qQUC7lcmTrC/HWjeAyVIcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799846"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:35 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 37/41] media: ipu6: Add check for pkg_dir before freeing
Date: Fri,  3 Jul 2026 18:24:47 +0300
Message-ID: <20260703152451.1743132-38-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
References: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We are adding support for mapping ipu7 firmware, which doesn't have
pkg_dir.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-cpd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-cpd.c b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
index 186d3dd771cd..72d51b2b0efd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-cpd.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
@@ -234,8 +234,9 @@ EXPORT_SYMBOL_NS_GPL(ipu6_cpd_create_pkg_dir, "INTEL_IPU6");
 
 void ipu6_cpd_free_pkg_dir(struct ipu6_bus_device *adev)
 {
-	ipu6_dma_free(adev, adev->pkg_dir_size, adev->pkg_dir,
-		      adev->pkg_dir_dma_addr, 0);
+	if (adev->pkg_dir)
+		ipu6_dma_free(adev, adev->pkg_dir_size, adev->pkg_dir,
+			      adev->pkg_dir_dma_addr, 0);
 }
 EXPORT_SYMBOL_NS_GPL(ipu6_cpd_free_pkg_dir, "INTEL_IPU6");
 
-- 
2.54.0

