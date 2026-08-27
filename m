Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37D32C3768
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834063; cv=none; b=En8nJbsPeWt4DiaYnXy7Uk3XG26lIMpbNMeoDJkZ0Jss/vAXGdRXwYOP2mIrSEVmaDCX62PO1W4vV+bRjt8GsA/jEDPSiUn5d3+tvFbHh8aqOT/gDlIx3rfdFNs2S/VcgCDL7LooPMMBkLhBDm1xYJXwCZsyCqRD4xEQ4P0wETE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834063; c=relaxed/simple;
	bh=ZYasFjL3II3+pKKFfTfhcD2tFYXwvWEtoXslxyVLHA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a9ndXs/3ff07InORCdDBanQjGqwGoytMtE7fEPhm6uY5qtIbMBSFhKUwitXqWpP7HGbCaQxlBr1dgwISCkuJ2lh02nD5ASixNvpigIxSoWgWfU9Lw+OvUP1x1/WxbU/KO8WTORP7opkpIAiKYmbHOR92DZ6Yu3kMteCMKVa3laY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvkuMdp1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvkuMdp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834062; x=1819370062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZYasFjL3II3+pKKFfTfhcD2tFYXwvWEtoXslxyVLHA8=;
  b=mvkuMdp1Vs3RTaFJlD7SV+cYHbVJ99rMB9LBsNek1D9caWoLZzwpB8HP
   LrvJdzxOzw/QyL1ICLV027Ue02TZDZbJZ+P4QVnee3w1YIW8iw/esFVj2
   vMUtSa8P00haT6k6x8j85Xeq6w/KqBo1atyo11EPY7Kxv0OCG5uglXi+h
   H9kkFCUMrOz8PexAxBxXn+BLnfSu0Ik62Nym+0+zGte0uWaQLqG6llJGb
   2kvE94WnTDi8N1QT28970ca0SivZp2jqfWCORzxEp+MWYYDUlCvKpZRs5
   ztDmFHGB+y5QJylUfUspE+5RjD7BiIKNQ5khIWtbCiRLF9NVqRg37zO45
   g==;
X-CSE-ConnectionGUID: B17dMoQiTkCKo0FfC4wPOA==
X-CSE-MsgGUID: ekySU1pWT/qNU3h/xakdYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188606"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188606"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:22 -0700
X-CSE-ConnectionGUID: 0txBPQsZTK+xJp/gdF547g==
X-CSE-MsgGUID: 7KlSurj9QdymlAfuCYWATw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384413"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:20 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 16/44] media: ipu6: Add check for pkg_dir before freeing
Date: Thu, 27 Aug 2026 15:33:08 +0300
Message-ID: <20260827123336.2219048-17-antti.laakso@linux.intel.com>
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

We are adding support for mapping ipu7 firmware which doesn't have
pkg_dir.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-cpd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-cpd.c b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
index 8e59406a725c..564461e0bb62 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-cpd.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
@@ -235,8 +235,9 @@ EXPORT_SYMBOL_NS_GPL(ipu6_cpd_create_pkg_dir, "INTEL_IPU6");
 
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
2.55.0

