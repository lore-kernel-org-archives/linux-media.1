Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDDA29405
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 08:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941998; cv=none; b=gydU/Lzehhx+Xv7mQ68LM2qquD26N0LDYfAouFEUYmv3sPDVDgEBxjoH8kdOy24LQ55+ur4QronHQg8NEW+fY/7Rz0Wh84GB+o2IDXcSixCrvlAchpzlopSgiQY5eXyni0EGuDgZ0PiBjZwM5DFfh0J58cQGbIWsuC4a9mAKXcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941998; c=relaxed/simple;
	bh=kmPfb+Xb+jFNhIoLDFGh1ZHl/FOcVcUNX5mrxFKi9cU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c+FEx+Cf7dIlEWQwL9TPCuMvS6PSjWEGV+ndzxvTD5pEXLHhr0PfAvmWVtNwQ8lvEFt2KGxob5uj8vRZYVqkOjrraCXeEqBTna7vqGT90t89s/bGq8LQYvZYI3X/icl8u9ETX6XlHPE5YMLpggztBw+gWyYdUUKyFo8uXV+/QFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djsC7sFl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djsC7sFl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788941996; x=1820477996;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kmPfb+Xb+jFNhIoLDFGh1ZHl/FOcVcUNX5mrxFKi9cU=;
  b=djsC7sFl4w+dDRyHqluWuF12JbICOYt0nlNoI4A096EEVr+RWUAfVrNL
   aFAspfMhPyAQLcxRFCxBDOLfKthbc4Bd7/w4Xvx2qiev6U6xmusQrNK3n
   U9KtJDAIeELvlWXVZG+mAnus9vpJFJRt9UFx7DZ9/9IKtoWREOprTOVOb
   YpOKIGab/p8aoHfk1BEc1cKl9DpsZmmLwZqpLkumAgpJcJt7JDvUg+Dhg
   Zpe/EVyNeheuibsMWst+1JMbOnChIF2rzOR1+0pL4ddCjNbEJ1ywVAXtT
   srIZXHYQzqT8Qz/dvkvtj2qpOkyKoZdcVwYIwwwwe8zpNNd9TlcdCBqij
   Q==;
X-CSE-ConnectionGUID: A3lIr5GERc2WByd5DV40Jw==
X-CSE-MsgGUID: iE7Pkg25Q7SM1wQv30D2Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99952300"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="99952300"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 01:19:52 -0700
X-CSE-ConnectionGUID: 99oOchSqQnyCIIGoeeR0dA==
X-CSE-MsgGUID: 9/KcZtjFTqeVvjPRgDWWcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="265041081"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 01:19:51 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 999D7121BD2;
	Wed, 09 Sep 2026 11:19:53 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x4DX7-0000000Cxdk-0Drl;
	Wed, 09 Sep 2026 11:19:53 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: antti.laakso@intel.com,
	Lixu Zhang <lixu.zhang@intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	"Sapre, Sarang" <sarang.sapre@intel.com>
Subject: [PATCH 0/3] Rework IPU6 PCI table
Date: Wed,  9 Sep 2026 11:19:49 +0300
Message-ID: <20260909081953.3089179-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello everyone,

This set reworks IPU PCI tables a little, by moving them from the IVSC and
CVS drivers to the IPU bridge. The IPU 6 driver will need a copy of the
PCI ID table for module device table whereas another copy will reside on
the IPU bridge. That's one copy less.

since v1:

- Use static inline for ipu_bridge_get_ipu6() in non-CONFIG_IPU_BRIDGE=[my]
  case and move the line above the comment related to the line following
  the comment.

Sakari Ailus (3):
  media: ipu-bridge: Add ipu_bridge_get_ipu6()
  media: cvs: Use ipu_bridge_get_ipu6()
  media: ivsc: Use ipu_bridge_get_ipu6()

 drivers/media/i2c/cvs/core.c           |  7 ++-----
 drivers/media/pci/intel/ipu-bridge.c   | 14 ++++++++++++++
 drivers/media/pci/intel/ivsc/mei_csi.c |  7 +------
 include/media/ipu-bridge.h             |  2 ++
 4 files changed, 19 insertions(+), 11 deletions(-)


base-commit: bc4257aa73edad2ba94a725f8f156eca69fc60ce
-- 
2.47.3

