Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873502459C5
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 15:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786462708; cv=none; b=l4NaXLVRyuq6gSj8v5B2NEfK4iFOSiPPf4y0vxSoSmsJehgW/Of8yWaL90D14JpsiQE6tkoeYmKNdralMqIqquvFB9CSA6Bv1vwTli720DLlYoNl/AO4XXDjsUI06trCVV82Wg94Pma7JcpTc37CqMQ5DNKwfhZ6HSrZdpQuDUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786462708; c=relaxed/simple;
	bh=l7Oleq5E6gOcoz/r+uzsqdS2OYWbz7GV550aQ5pCZZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IszCOf4c89TruOZmFvP9Q+bgWS7fL9YBwf8sYbM12WpUFuUyjI+OJiguBxESxH6aYloegL0N8meaZHtYubtDMIkWkQJOUZ9oUqFwaJgh5zhk2tmTZxmtvByZOs/Ub0NvkQCMaOMDcsfi+32hrNEmL/OnH6Bx+l7QRFCa0la6nnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qok8i2xH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qok8i2xH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786462706; x=1817998706;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l7Oleq5E6gOcoz/r+uzsqdS2OYWbz7GV550aQ5pCZZg=;
  b=Qok8i2xHRKhWbXd8VhkWUB9qq10cAgTzWSAMjW5lx7WJ092E+TipaJQp
   koBGDeKyVkOK0GQkVfAN5a17cnxRqRQ5KVJkPrr47ifE68zSSH0KG03QW
   FY2SW77na8dx46Puo7NxPTWclh7NlnNKd/72nZNbtFW47RafjV47vKv+O
   fLCyQnrLGRFVxyBH9PDEuZ0jg2TMe/sxvKkCnHJD9PY9BMtcV7b/lXGEF
   r0lmTc9WVSpnMQUvoAF3AIdOURxnamHOTR/1auOUXnn+pDNqixEFM30Td
   LYSX6QXQRZsvYvirYQXBubIaF78dsf5qEIYMbfqsNLTY8R3SGj4763Qss
   Q==;
X-CSE-ConnectionGUID: hG3DuZ5pQ16Qp5vmEQAkBQ==
X-CSE-MsgGUID: 9M1MaoSgQeOVvfL4k/DQJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="109788561"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="109788561"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 08:38:26 -0700
X-CSE-ConnectionGUID: MllME5rkT4689KwExTTqLw==
X-CSE-MsgGUID: 60x6JU4KQhy+aDzF8n2PMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="268526148"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.215])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 08:38:25 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F0E16121BF2;
	Tue, 11 Aug 2026 18:38:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wtoYZ-00000001fGY-02DT;
	Tue, 11 Aug 2026 18:38:23 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH 1/1] MAINTAINERS: media: ipu-bridge: Add entry
Date: Tue, 11 Aug 2026 18:38:22 +0300
Message-ID: <20260811153822.396946-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry for the ipu-bridge, a firmware parsing helper for the Intel
IPU drivers, with myself and Dan Scally as maintainers and Hans de Goede
as reviewer.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3785b8c1de0a..64fbdb8bc0b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13142,6 +13142,15 @@ S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
 F:	drivers/iommu/intel/
 
+INTEL IPU BRIDGE
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+M:	Dan Scally <dan.scally@ideasonboard.com>
+R:	Hans de Goede <hansg@kernel.org>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/media/pci/intel/ipu-bridge.c
+F:	include/media/ipu-bridge.h
+
 INTEL IPU3 CSI-2 CIO2 DRIVER
 M:	Yong Zhi <yong.zhi@intel.com>
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-- 
2.47.3

