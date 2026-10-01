Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3927C502771
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 12:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858755; cv=none; b=BOMp4Z9joAPaBBtDkTqNzDkQWGMwSWoCUx8atZB5FIgDa5wISOdA0Ud9vSTCVOoYOVKEpXMqiQj5PVGVVmh2i0AH5QJMTvHJS23TTd7astQO1vMJrwpl35hEt6bvYfbNw5DwEJYfdeWjCkIklwvLS3ETBUg1iNEM15zJI9UmnZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858755; c=relaxed/simple;
	bh=Qb4roRDJ86XbD9i0WDeaotA2k+556P7Tozs05XWxgIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ExSJJqgQdLTr1JKd/MIYaZY6eF/2A/qyLP+yXTO9KzkZQWBE9cXr4J+scpoilwpr/4it6qL5ygfw+Qx2BgXcsFNIomHbD8i59PFTg+JnIYBz9mRC6CxpBZ6Srh5XVZtv9Up7WtryefjiBBdt8O861R9vgofD8c6wEwSwY97u8uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wbt3iJL1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wbt3iJL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790858754; x=1822394754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qb4roRDJ86XbD9i0WDeaotA2k+556P7Tozs05XWxgIs=;
  b=Wbt3iJL1HcZgJ1gIQjcWMdo0mYs0kH3XoR4zGYu1KCPvEQrxdNn/sfpi
   HBvlNnN1/2VIAws5Kzjt8lqcHivfQdoXzF6H3Cwo1KsuHSfTGwQFyvkfs
   hTeqYgR3Nv1f+UTkhXy678Xrwh/8v1EOifeVgw5Hau7cCPaa9wBr/N802
   HQaksF8hhrXe/riVDdpxgX9ptkkipiLzlPXJHiDuEcnNKBzfOw1o/jt4L
   3NIIga35TMawUJq2+uD1DqWRGFiX6Ntkd1oi6kK7FX3zJPvx+9REvnyC+
   ez2Ji8pF+BPOcn01MNwrsk5hbtlTea+Ua0j68x8yqjXV66KAag+TcpRnK
   w==;
X-CSE-ConnectionGUID: TRqWvXm6TYWI4cXuoezudg==
X-CSE-MsgGUID: DXzqOXz7RLCjkF/yx64r9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="101774556"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="101774556"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 05:45:54 -0700
X-CSE-ConnectionGUID: UxtutDmqQR2B3+NleSRdsQ==
X-CSE-MsgGUID: l/2fPty1SNWgTPwPHnlBJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="313934895"
Received: from cooperst-gp119.amr.corp.intel.com (HELO alaakso-desk.intel.com) ([10.125.111.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 05:45:52 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com,
	divyamani.tripathi@intel.com
Cc: manik.bajpai@intel.com
Subject: [PATCH 2/7] media: ipu6: Forward declare struct ipu6_mmu
Date: Thu,  1 Oct 2026 15:45:35 +0300
Message-ID: <20261001124540.2129309-3-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001124540.2129309-1-antti.laakso@linux.intel.com>
References: <20261001124540.2129309-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct ipu6_mmu is used by ipu6_mmu_hw_ops, but the latter is
defined before former. Including ipu6-mmu.h on its own would not work,
add a forward declaration.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.h b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
index 44880478d242..ff113384c126 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
@@ -11,6 +11,7 @@
 #include "ipu7-mmu-hw.h"
 
 struct device;
+struct ipu6_mmu;
 struct page;
 
 struct ipu6_mmu_info {
-- 
2.55.0

