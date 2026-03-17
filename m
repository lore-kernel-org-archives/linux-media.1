Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655E53A3E61
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 09:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741368; cv=none; b=ji4xBLAeet5KgC6OdrzXszfOytO6nFHthx+m0N3JkklNQSlt08TvsngArl30O1Zzn6f30DDI2pWPUGnEqynFYPexCXGSgyUxF/tfPVXeZoxNAK+3nZUvYWUGgRZyaHB03h/Z/qYg7gZXfv0lhpovxog59ImGAh1HU3icj95dfSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741368; c=relaxed/simple;
	bh=9fG5ZhuFxmqZEsNs+eQROl+pSgrb+y2txU733+XSkrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dki9Rf5zDLTXoP0WNzg2DGug1peWvQqpRc8m0cwYnhnUmAxek0PbscosBbig9hzjbt/tDAZsdC6TtabzK94J3HSXVwXNI6bZbYA7FR7tL8ERnS63WYnw8V+4Ch2plB/sWnQo2rYPjN4k4xbos0sl+bWbos3EZ/XHT9F49wOH/Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oj+nQ3Mx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oj+nQ3Mx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773741368; x=1805277368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9fG5ZhuFxmqZEsNs+eQROl+pSgrb+y2txU733+XSkrI=;
  b=Oj+nQ3MxCnjB03WEtsuJUSw0nqFzgylazwwdjDYh4Rw+4SyiFIFHtzja
   nUwIG51gt+wTvVNQwX1ofsW9xLSCJl+QaWdgnNEeEi+FPtLZkZk05TYw9
   1KCPyihPX3suifcrJOOxN6EyIL3D/BHTd+PBGdM2PmMjQNCRjbem43K0N
   2qSLH4lqqPlfBB7cMP+/MUyGM5nqL9OzDW4AOOd3D63D7FhTAu6N6JLBb
   80HzDpMgXTzm32qacgR51JuBf0+NhHF7JcSprsm4ggA4gkMFIg/rv3JLg
   bc1FTSWADKnxQZ5FoNZG6bnoWWWrNjY6KlcboK5nywgYpyeFDwbN1HPGe
   g==;
X-CSE-ConnectionGUID: 6r6a0UXqQeOnPCr//JnvTg==
X-CSE-MsgGUID: 199zwCK3TFGHFibdZWBZ2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="62335678"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="62335678"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:56:06 -0700
X-CSE-ConnectionGUID: KXtbfLgLQParxs+Uc/LONQ==
X-CSE-MsgGUID: oa6oyUMaShmQVLJfLFh4lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226344886"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:56:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 696EE121D88;
	Tue, 17 Mar 2026 11:56:00 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w2RBa-00000000tov-1P3T;
	Tue, 17 Mar 2026 11:58:02 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH 5/7] More header sorting
Date: Tue, 17 Mar 2026 11:58:00 +0200
Message-ID: <20260317095802.214532-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
References: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 raw2rgbpnm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 215decd65d93..ef12be820be6 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -29,10 +29,12 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
-#include <unistd.h>
 #include <string.h>
-#include <sys/types.h>
+#include <unistd.h>
+
 #include <linux/videodev2.h>
+#include <sys/types.h>
+
 #include "utils.h"
 #include "raw_to_rgb.h"
 #include "yuv_to_rgb.h"
-- 
2.47.3

