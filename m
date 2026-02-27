Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663B8194AE6;
	Fri, 27 Feb 2026 13:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772199667; cv=none; b=rtZf/cZH7lsuOQl8P+F+DnxQEnKLDItxJ3Fbic5N7JYVQae+Pw1GfpjB6wI4rTA2jegqOjQhqL7nCyezGJ5AGNVOzZi1xj6nh1gXxuY0Y0JDsjDAN2gI+JJ/f/9VsBhOzlIYN8mCpaHKV9qCcrdH2KftlQiVL7+LRreTsISJM/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772199667; c=relaxed/simple;
	bh=ySOHvv2NZ24WQAEc/h2WtpksZtcYYKA7Rnaql7PQJAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ag1LoRazYVGNWDsIS/7Pu1qMWTmmgB2gCT/NzKT1q15OMzblZQMxj4AvIhy199qwdvwTXlkNyQPAfE5whcPWCTYUFjZCKb0oSWb4kqaZRJg0cYcDwhTr0w7uiCgjfVKCQaEo6Fd5C2qhxdCK5HTuoJxf/euCNQiuYp2Tyerj+xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mENt2tAS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mENt2tAS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772199666; x=1803735666;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ySOHvv2NZ24WQAEc/h2WtpksZtcYYKA7Rnaql7PQJAw=;
  b=mENt2tAS/6w3pEg4HxqCM1qQXESU9ysz33FSWVCVqFc1opd4OnyX9HiI
   CIkRDfnnu9LclFY/XIwweMBDGdEm+fs/esznNfdOsyA/D7jquz48Fefc3
   UgaaPQjNMOFg96EZHwpOCsurPhEpABL1ogrjs0OzmaAB1sZ0IIqtgpiJf
   mKtXVmtDNO6X04u6C3xqtXmj5/t5KwMaQgtLB/6RlWVho8iRqA30h26O6
   PgWbj0M07EC1u/sAjzkcXMzf5iekUMrcZPRoeUHXwKWro0b3FIoS4qJiG
   sQ8LBwFGx4kwW6QtvfTIfmLfYesFFlNszu+nh744asPig8+hPcBTI10mA
   A==;
X-CSE-ConnectionGUID: mNADFAmmSNikaHH1nRKVrA==
X-CSE-MsgGUID: GTofm6erS+65wlbracNnJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="77121493"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="77121493"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 05:41:06 -0800
X-CSE-ConnectionGUID: RvQhBO/wRratmVUkPLjHnA==
X-CSE-MsgGUID: kHyf+jysRDSfPfW1LXFX5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="244281856"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by fmviesa001.fm.intel.com with ESMTP; 27 Feb 2026 05:41:04 -0800
From: Arun T <arun.t@intel.com>
To: arun.t@intel.com
Cc: mehdi.djait@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add TPS68470 power supply support for ov13b10 sensor
Date: Fri, 27 Feb 2026 19:05:40 +0530
Message-ID: <20260227133542.970820-1-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130092431.2335363-2-arun.t@intel.com>
References: <20260130092431.2335363-2-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds power supply management support for the OV13B10 camera sensor when used with TPS68470 PMIC, commonly used on Intel-based camera platforms. 

The OV13B10 sensor requires three power supplies (DOVDD, AVDD, DVDD) which are provided by the TPS68470 PMIC. 
This series implements proper regulator framework integration to manage these power supplies during sensor power on/off sequences. 

Changes in v2: 
- Added power supply names array for the three required regulators 
- Implement regulator handling with devm_regulator_bulk_get()
- Add regulator_bulk_enable() and regulator_bulk_disable() for sensor power on/off sequence

Arun T (2):
  platform/x86: int3472: Add board data for Intel nvl
  media: i2c: ov13b10: Support tps68470 regulator and gpio

 drivers/media/i2c/ov13b10.c                   |  47 +++---
 .../x86/intel/int3472/tps68470_board_data.c   | 150 ++++++++++++++++++
 2 files changed, 176 insertions(+), 21 deletions(-)

-- 
2.43.0

