Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E593C3C00
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 08:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449731; cv=none; b=IzNHoA7AeFTd0fTy3KGwO7y2GVtHkvaPjQVXlW58Pcr6Y7D74Ev1K02ihE9n1iYl+eKKXVIiIvXdJlRH5S5Hf0Ntcj/nQrGXZISkYbqS70aQWIYh6ruQe9+A7PTy2HE/yfS5U+rHTSrmJcSWGJKn6U/4F6If3TPOEHCFHyhyuh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449731; c=relaxed/simple;
	bh=S1A2CaCkhxhijA/dTdKiFSxDCk4UyEoTxjMCsDAJerw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwJ+qjpYoMVZw3u9ECvRs0sNIkZxFDSOKlJgYdk+HorujnIKf5YPDSpjOEEdzz+46aPkFPSvTy+USjISYbYoEJFT8E43g6WqaIFawi+py7zKy0xSYe+hT4F1nCDmed32jFGbEnicfs4Mqjf1SzZBzAYPCsQK23DiUkyOyDVGnVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WkaYgv8/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WkaYgv8/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791449728; x=1822985728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S1A2CaCkhxhijA/dTdKiFSxDCk4UyEoTxjMCsDAJerw=;
  b=WkaYgv8/FWzy75Ta4JF/z5asdjvGJOTnqZKybefuhH4IGGUCuD2alswi
   rsMQhWxwHicziuCt9h/2rLQavg5ECFQqJh2v9ZyIkwfccXw/hUK3pdoxu
   nI2gzzkk28blOtCmTxGa1ngO0+WWLzDMwFqwl4zwgPNv3xHvwMVt2YGPZ
   zGISAyITfLNT4/K0qU6UEPhHXiLdrV4LA72I6XS33w/wOgcGNvjrx+q4T
   aEAG1/IfqWtpPtfsey4hxU2aMpNgT8nsDonG0EGkb3cxt26RkH3MM8jsy
   2rU39b0nhDGP1Zgn3oOCC3uEL6c+judO+/IGYgH1A7Ax8XnS4JiQDQu+v
   Q==;
X-CSE-ConnectionGUID: Dyu/u9jjSgO64ZT97HMmPQ==
X-CSE-MsgGUID: /gEVhGWwRkqChx9FoeEowA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="233671"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="233671"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 01:55:26 -0700
X-CSE-ConnectionGUID: ZGPSjgBtREKdicB6/f9ReA==
X-CSE-MsgGUID: 3X+4ny16RI6ozkhlg2685Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="86310"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.95])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 01:55:24 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4C873121BB7;
	Thu, 08 Oct 2026 11:55:25 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xEjrr-00000003Lds-379O;
	Thu, 08 Oct 2026 11:52:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	"Yao, Hao" <hao.yao@intel.com>
Subject: [PATCH 1/5] media: ipu6: Don't mark need_reset based on returned buffers
Date: Thu,  8 Oct 2026 11:52:43 +0300
Message-ID: <20261008085247.798156-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008085247.798156-1-sakari.ailus@linux.intel.com>
References: <20261008085247.798156-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IPU7 firmware stops streaming without PIN_DATA_READY events for the
queued buffers, unlike IPU6 firmware which does queue such events to the
host. This effectively causes the need_reset field of struct ipu6_isys to
be always true after streaming, even though there's no actual problem.

Don't set need_reset field based on still-active buffers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 23d00e1f89e8..6596833e95d4 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -420,9 +420,7 @@ static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
 static void return_buffers(struct ipu6_isys_queue *aq,
 			   enum vb2_buffer_state state)
 {
-	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
 	struct ipu6_isys_buffer *ib;
-	bool need_reset = false;
 	unsigned long flags;
 
 	spin_lock_irqsave(&aq->lock, flags);
@@ -458,18 +456,9 @@ static void return_buffers(struct ipu6_isys_queue *aq,
 		vb2_buffer_done(vb, state);
 
 		spin_lock_irqsave(&aq->lock, flags);
-		need_reset = true;
 	}
 
 	spin_unlock_irqrestore(&aq->lock, flags);
-
-	if (need_reset) {
-		mutex_lock(&av->isys->mutex);
-		av->isys->need_reset = true;
-		mutex_unlock(&av->isys->mutex);
-		dev_warn(&av->isys->adev->auxdev.dev,
-			 "buffer list not empty, needs isys reset\n");
-	}
 }
 
 static void ipu6_isys_stream_cleanup(struct ipu6_isys_video *av)
-- 
2.47.3

