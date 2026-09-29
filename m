Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824CE3DDB16
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 10:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679267; cv=none; b=IAm4Q/jFCHq6VZzgoiYzL3oYStFZKSsLQrF045iZlxDEetY99vOEc/YtK69qmOHy9z/OYK60/MHIL9IpdGK6VM/MOQgxpNO3XzyjPtv2HfyHOzRyGiE0KL6RhGWEOabU/y7bFhCynDV1Nc29aEX/OkpCghw7GLD1UUt9pRTjA5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679267; c=relaxed/simple;
	bh=qUTAtSkazbuiw97JmzmXpo13u0OoQY3Knwt3AvqF6iM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=agcNDwz1xMCOicVgZaufXkQsE77Ys/NPjamJPdIywqd2bG9dFwUZTQ1nGXfBqSZkxNX6GsLXs/V3+21FpxhgSJniP0HylnxkurFeYOsdHhMOzMgvTeqsv2T0w/wTOjvSfcS+8jffSm2Mkrbj5V4ZH1JjWWPuHzq+GXPNZ9Yzu7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1gWKGSS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1gWKGSS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790679264; x=1822215264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qUTAtSkazbuiw97JmzmXpo13u0OoQY3Knwt3AvqF6iM=;
  b=I1gWKGSS5NWbDqLgo2j0t11O/RYy2sY7FkdJ8nzwpHmtLuj8uZtHErSD
   DWmJXn0qcNAggZj6Icb1Yc+BWD0YZhvxOkeLVNWzllAfvLOLkz7fwJ5To
   qnZMKknVCochaZ6aro4t7wXfigYfAUelAiHCHu6QsiyiHzQyg1Ti47X89
   xi2iUa9rM6A53XlK16mV2OgJ0mOlx7Ww6I9+nXt/6ieD4TdpFNFMKTcCB
   MiJ6K8oyz5iR8A8D478GEbmqtoNK3BuuK3LMd0xFLkgH/fVDjFNqr4tdK
   sFqbcUtf5x3tGNNCjcItQ9YZ3S8gW3tLKiphCHeuVJ2l1NuWXTvQjvo1v
   A==;
X-CSE-ConnectionGUID: 0uiXBFu7RmWumhaggT6CGw==
X-CSE-MsgGUID: 1FLZRI71RUeE+yybJrUgTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="95206072"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="95206072"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 03:54:14 -0700
X-CSE-ConnectionGUID: vnDCqpZgSrKMQ+31++3GCw==
X-CSE-MsgGUID: B4et/VO8TJyMbjbq5V0siw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="278686988"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.223])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 03:54:13 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 969D9121BB7;
	Tue, 29 Sep 2026 13:54:16 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xBVTT-0000000AYZI-3AvH;
	Tue, 29 Sep 2026 13:54:15 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH 2/2] media: ipu6: Warn if the active list isn't empty when returning buffers
Date: Tue, 29 Sep 2026 13:54:15 +0300
Message-ID: <20260929105415.2516142-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929105415.2516142-1-sakari.ailus@linux.intel.com>
References: <20260929105415.2516142-1-sakari.ailus@linux.intel.com>
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
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 2608e3b91acb..c9ecda158fd1 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -423,6 +423,7 @@ static void return_buffers(struct ipu6_isys_queue *aq,
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
 	struct ipu6_isys_buffer *ib;
 	bool need_reset = false;
+	bool first_buf = true;
 	unsigned long flags;
 
 	spin_lock_irqsave(&aq->lock, flags);
@@ -448,6 +449,12 @@ static void return_buffers(struct ipu6_isys_queue *aq,
 	while (!list_empty(&aq->active)) {
 		struct vb2_buffer *vb;
 
+		if (first_buf) {
+			dev_warn(&av->isys->adev->auxdev.dev,
+				 "buffer list not empty, needs isys reset\n");
+			first_buf = false;
+		}
+
 		ib = list_first_entry(&aq->active, struct ipu6_isys_buffer,
 				      head);
 		vb = ipu6_isys_buffer_to_vb2_buffer(ib);
-- 
2.47.3

