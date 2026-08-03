Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E349E34750F
	for <linux-media@vger.kernel.org>; Mon,  3 Aug 2026 16:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785775165; cv=none; b=lTRrZknCmcnGZ4pKv2fRt2psb+XEiOg4YdOeosmIjGD7bLaMqSb0e4XMjyxenlD2ewPYiD+ukkf3oLMQZUDIgw/11KyUTRSXmQ5QRQy9WyLlnlmRVCuD9ndyEfMNakOxxU6zHMkm+Sgkhe1F6U1DaNUFSfSA2fLOpuBJocouoro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785775165; c=relaxed/simple;
	bh=22UjlLqTvOgOc4w8eEPcGaHJ47Haj9iA/n/By8dUo4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N5IG2uZGX0AHsDhvUgTKf6KGuTTHq/mBN3Vs6z8nxsx5CycbWGHqgvIAwVR16977it5jPU0qrt0p/1ygQTkIispZTpfCnojZ+GtBffY8iCU/7nFZRnze4CbVbe1LQHTfRa4tsgxgMESRPjRt4ixZoYjN2CJYhmS6ThXwOStAeIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGoj62ek; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGoj62ek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785775162; x=1817311162;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=22UjlLqTvOgOc4w8eEPcGaHJ47Haj9iA/n/By8dUo4A=;
  b=IGoj62ekcPMr64gn735ol1WAv0J5mkNZtDdYkEfil89yK9Y9QT6nkvbL
   4LcZEg7ZDVzymERbprALYsEcD0mgbpAVH02s6b3tkeTUcAA6w5xoWWtKP
   8azjapX5wdIBckltbjQ3dyaEueAGpfsez645jSYh3t3jrFiJG6x/vXMv1
   AEz2ROaxDAPLmilItcKfGiU5d/0TJrzO44w63HRkVFmUoMPKt5ZdJgV8e
   wNYa4s/Or1vB3mHvtZGh3kWwctAp5RP2aes8Gq0cpJuFxvbVav1ApFcHc
   QcjJTkO6tZ3yyqZ3z7NvSpBXh1xiYoa/3jUSSYaSC83Dg4B92L9raVuq3
   g==;
X-CSE-ConnectionGUID: AOhx3L+4T3u8wDhH5lzI5w==
X-CSE-MsgGUID: k7T7nSo3R4etFV0wSPxJhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="103720273"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="103720273"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 09:39:21 -0700
X-CSE-ConnectionGUID: cz+u0bCyQRaz/CCXnR1Xww==
X-CSE-MsgGUID: 944jJOzqTyuVPxLgbQCCxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="260016268"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.92])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 09:39:19 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 173881205B0;
	Mon, 03 Aug 2026 19:39:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wqvhC-00000000FGq-3pWd;
	Mon, 03 Aug 2026 19:39:22 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>
Subject: [PATCH 1/1] MAINTAINERS: Update Intel cvs and ipu6 driver entries
Date: Mon,  3 Aug 2026 19:39:22 +0300
Message-ID: <20260803163922.58692-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Antti and Sarang as reviewers for a set of Intel ipu6 drivers, Antti
as a reviewer of the cvs driver and myself as a maintainter to the cvs
driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index febe918d6316..88de4216d7d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12944,6 +12944,8 @@ F:	drivers/scsi/isci/
 
 INTEL COMPUTER VISION SENSING (CVS) DRIVER
 M:	Miguel Vadillo <miguel.vadillo@intel.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Antti Laakso <antti.laakso@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/i2c/cvs/
@@ -13153,6 +13155,8 @@ F:	drivers/staging/media/ipu3/
 
 INTEL IPU6 INPUT SYSTEM DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Antti Laakso <antti.laakso@linux.intel.com>
+R:	"Sapre, Sarang" <sarang.sapre@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
-- 
2.47.3

