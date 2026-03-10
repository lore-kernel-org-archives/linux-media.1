Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FAD43635A
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132358; cv=none; b=sRsNoQMBCAX7JW3kfv29zVBFQ0FIdxwdDeJss4gKGVFm5AN7C0SdNYWoGSarhq0ZVMRWCciWNmmLfz5m4seUseV6KTfb55UszUAKNrPSfA2ayRgW8Eg2Pm95gEGPoMDnTMVdFxRf3SiF3AAYWKakG8lj3bmlIyMOjX+1W+jqAeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132358; c=relaxed/simple;
	bh=0IC/cGtBFqJ9idSsOhE5Y8gT+2YOVcF42JhkWGMUx7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=atTuMgD9oMDmgN6lhao8PQHQ8fmy7Z5/pomeJObhpW1rgtZiGExuUnnwLqBqudrmBJRw7bglXTRR8cEZMf9M1aZeskC7sRzR0F85ndnMr/dYem2PF6QXU0u8nh0yLtrFlBAmCGOlqsLf3RB+1OmiIFpnui/kAaI/OSiYMl0qzrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCUb4bLH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCUb4bLH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773132357; x=1804668357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0IC/cGtBFqJ9idSsOhE5Y8gT+2YOVcF42JhkWGMUx7A=;
  b=TCUb4bLHGugo96u0PLbQOY4/HqJxToFJGoFP5JRbegFyx9MedT3hOKG2
   QQR1HlBZMjhS4fh8TTXLh1FFCSowZL0AIaosvrrPOoB4PyDKsFkn6lgHU
   cSw8CL72+NyjkRV8Jcm814HjgAbJDGnG8674qZGCeoNxXGxnMquCenkwq
   MDoWPpsOZRxYjCD1wGxzLEFN7oW8PdFW6J09ko7/X8TlvaTvAr1HUbDZa
   wKylzBHs8f7aEs350G7UWUBy8VlzCYYHOXXYoo1xaLjGWDe/z4FKOXDTl
   HfgbD+8GFee7WUlpcKmsNQBTxAPVpC4oq8kSGDmzxtoZlsrILeM9o/vmG
   w==;
X-CSE-ConnectionGUID: 6Tk5NgYtRW68Fvuo9t1Zbg==
X-CSE-MsgGUID: T4HXZI8yQDW2EgSG3QcJNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84501765"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="84501765"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:54 -0700
X-CSE-ConnectionGUID: ybO+MDVeSh+hbgmhZoWK6g==
X-CSE-MsgGUID: zTAxbR0sTOmYV35vs1xtGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224727708"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7A4EA121EB3;
	Tue, 10 Mar 2026 10:46:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vzsjH-00000004xnt-1UoU;
	Tue, 10 Mar 2026 10:46:15 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH v4 07/11] Arrange headers alphabetically
Date: Tue, 10 Mar 2026 10:46:13 +0200
Message-ID: <20260310084615.1183141-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
References: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 raw2rgbpnm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index bb9a2d576969..0e0a5b1e63e9 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -25,13 +25,13 @@
 
 #include <ctype.h>
 #include <getopt.h>
+#include <limits.h>
 #include <stdio.h>
 #include <stdint.h>
 #include <stdlib.h>
 #include <unistd.h>
 #include <string.h>
 #include <sys/types.h>
-#include <limits.h>
 #include <linux/videodev2.h>
 #include "utils.h"
 #include "raw_to_rgb.h"
-- 
2.47.3

