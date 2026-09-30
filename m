Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E39386552
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 09:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761031; cv=none; b=EpyTxBPHhH5+MKraNaMfmfUc1ZJRgmZUcYHCp3OagAfELCoIC6wrlUdN9xJoiy6zRzt8H7GuXjLOy6WaOLjcbT21vE96JP7FgdowSS59Ae0FGPkSinToDu1E2M9MXE7Fc379fv6i2X58FmhhpqZxO63FQQuShNEvm5G4NHJDq/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761031; c=relaxed/simple;
	bh=DkWHTbY7cKIaGzbtxtuD7sIaOOSb0F63KJMnjaEBGrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQJxtH4/lDP2YsHCGhbHz5jGK02UqTaTBYyzdK0nbnrFBs5xshWbuZXkgNC08BZmBIjnbGNSd1SWSbDj32CZ4WElqRddDRC/9Yc7fS7ar/nVOOb95OPTyzhMRfD/7Kp0NMQVNVe9LUf7JWMIaK+jxWlzCZ3vWtbVCB029wrX6e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvUAz0iI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvUAz0iI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790761030; x=1822297030;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DkWHTbY7cKIaGzbtxtuD7sIaOOSb0F63KJMnjaEBGrs=;
  b=XvUAz0iIhyn9f2YqkzTsq2Ux+ZzOakUqYlaC6ixp45mdatecuCVNalQZ
   I1d4dyAjEL66NivHy7xDuYNzWarTy+ivv0wTu3EuZnTyV8OsbW2z0O/VK
   KYW56bn/OoEMQ/8RhOEUry7d3tuF2Sn57iSr5kbVrnJjIkwlTBZmDGxPN
   Duts2GFEl/Blw0qL71H8welgo2cPQAKdMkApzpERPcwaJlYM2r0Mxm5i5
   gscywvFJkgTWwAeJZVy/TIBwt0sagaBUBFjymKhNvmGoopkdOY42aQM6z
   wURMRRxbUk4GmAs5Bf2Y+kBbXmguNIIM6DKdUWP5eW4/109rT+vb3of5h
   w==;
X-CSE-ConnectionGUID: /W2eGs+tSQii+B9Vkv/MNQ==
X-CSE-MsgGUID: tSRcVTYKQLy1snsF0cuJlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90394170"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90394170"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:37:08 -0700
X-CSE-ConnectionGUID: 7i0iY5CfQ/W3CY2rmUmm6Q==
X-CSE-MsgGUID: 0SQYLEl3QoKrw8pOJOlNiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="279442924"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.109])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:37:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0A9E411FA30;
	Wed, 30 Sep 2026 12:37:10 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xBqkP-0000000B13j-0kJt;
	Wed, 30 Sep 2026 12:37:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v2 2/2] media: ipu6: Warn if the active list isn't empty when returning buffers
Date: Wed, 30 Sep 2026 12:37:09 +0300
Message-ID: <20260930093709.2625661-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930093709.2625661-1-sakari.ailus@linux.intel.com>
References: <20260930093709.2625661-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ISYS needs a reset when the active buffer list isn't empty. Warn about
this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 2608e3b91acb..23d00e1f89e8 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -467,6 +467,8 @@ static void return_buffers(struct ipu6_isys_queue *aq,
 		mutex_lock(&av->isys->mutex);
 		av->isys->need_reset = true;
 		mutex_unlock(&av->isys->mutex);
+		dev_warn(&av->isys->adev->auxdev.dev,
+			 "buffer list not empty, needs isys reset\n");
 	}
 }
 
-- 
2.47.3

