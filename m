Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D1A4BD798
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 19:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791833136; cv=none; b=FMs8ogmDS5zpffJW5N/aSTwsk3696EQHqVC2L6HxU8t18eYQjeSeR9taeHXhPfvbMu8aS7dAVcHDgODqvowv69zlZiwLSyzg/P2+uCI1+hap0ECvSyAhOIhZYVJDnDAUwn8SI8scwM6YlfNptkw0ZJsOAvbq9sc8mZVYrLZ++iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791833136; c=relaxed/simple;
	bh=cBcRebwBiyvU2OuyXydFmL1BXzk3p0oW3CzbWxERcjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gsXKsVISGzjrGMPlEMOwhu17vpZvSR1g93ULjqfPbAx1F/bIbnInbREEEG1XSIiv4Gcr0VnlRqQ4ruP08YyN9R3ppCq/8QOAGpf9zed33pr2HM/tki38VEDCMKY7wwjYPAHYubUzFCI/UIQvDSpk9E9n4PnAzglc3nOlouWzVb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OoigueqM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OoigueqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791833136; x=1823369136;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cBcRebwBiyvU2OuyXydFmL1BXzk3p0oW3CzbWxERcjo=;
  b=OoigueqMbhD7qe57D9RZ02yFVmnG6M/4b/RkburoMP7g2pHef7enT6/6
   wQanXc1t/AW5iPSVXONQB+YDXaHqNFjvOScK9agXnPggK89GjLBLv1JKp
   ABvSBotNKpkpZjc+lzAQ67JkJJXiGNF+0XokQHOYnzzqPWz3vfqheyDZH
   EIdpfBih12PefJ9Y4MW8k5K3OUZQ8YYoSgZMrSWwu2cz6ERCB9l8yaa6G
   KwOU/cZOb48R61cL3pzhjNypsn+GWR+g52Ckv9qozl1UErOXBgON8/7Ay
   RWzs9PlNtEDq+S+h7FpqZItqDuaI/uiqTtJ5CqFRxIeI4uyHt4hh4BUvw
   Q==;
X-CSE-ConnectionGUID: 4P4kk4nqTAeOuL5vNlWsrA==
X-CSE-MsgGUID: p3mc243aRVymA1zaFdoFWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="537698"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="537698"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 12:25:36 -0700
X-CSE-ConnectionGUID: oM0PopNQQQq0i+qCaZfi8A==
X-CSE-MsgGUID: Nog5kdOtSGShzP3xGg1BLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1062256"
Received: from aduenasd-mobl5.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.178])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 12:25:33 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	miguel.vadillo@intel.com,
	sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com
Cc: antti.laakso@linux.intel.com
Subject: [PATCH 0/2] Fix for CVS getting stuck on fast subsequent capture
Date: Mon, 12 Oct 2026 22:25:23 +0300
Message-ID: <cover.1791831649.git.antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CVS may get stuck if sensor stops streaming mid-frame. To recover
CVS the CSI ownership need to be transferred to CVS and back to host.
This is done in CVS runtime pm suspend/resume, but it is prone to timing
related errors.

Fix is to change CSI link ownership in stream enable/disable.

The problem is reproduced and fix tested on Dell Pro13.

Antti Laakso (2):
  media: cvs: Hand CSI link to CVS on stream stop
  media: cvs: Remove runtime PM support

 drivers/media/i2c/cvs/core.c | 65 +++---------------------------------
 drivers/media/i2c/cvs/icvs.h |  2 +-
 drivers/media/i2c/cvs/v4l2.c | 40 +++++++++++-----------
 3 files changed, 24 insertions(+), 83 deletions(-)

-- 
2.55.0

