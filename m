Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0330944F549
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805365; cv=none; b=B+IX0jvGKyogiaoaFndLuVUbKxMOsazN3u1RaECLfoKYuzXjT0cf7T6ZziCnfFvtSUu7h8bi+lLcbN4/uySZbt5o0wG3D4E8Z0VGbNW2beaRZPpOuG2CaRFzOroVgdD5ZAGAK9ZH5sBH8tgviVZpnEV9muBcXjwjii0ftD5uUeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805365; c=relaxed/simple;
	bh=S1A2CaCkhxhijA/dTdKiFSxDCk4UyEoTxjMCsDAJerw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jsrjf4ExaF75wFZnBCKDJFqDM1YWzR9IPrH99SM61RsLgljgdu1w4gggaKTeiaTHahP19Ln2Ph6rYU0oPlVIEeaDaX4QOJJ4BfJTknLriylo93IUUJGENIVNEpRDfQ/NpFs91AeeR1X5a6/kjnan/IsqsxkSsqB1rwC2+sOQH7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ejlums15; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ejlums15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791805365; x=1823341365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S1A2CaCkhxhijA/dTdKiFSxDCk4UyEoTxjMCsDAJerw=;
  b=Ejlums15pRw06lAQF54jEqBaMRa2UMnC2dLxbKq/7pTC0NNweRuR260e
   d/Kz+KZShyUhHZzEfwb4uxymG8CiB6qRmWf6F+UO6K2C+U70tkmzRQJnb
   efNxzR9i2c2OA14v358tNNxq0wtW+rZ5F4d33je+8tFuUV9EQX5vf6jcX
   H1dx2dGbMA3tokkG09munXJNXigxBF84y2PtXgGQBprFcOcu0Bdpq3kqC
   cWpRd7YMBBPQ+nvruMSEgeM4OQg56tYArvUtPNwLKuIx2jovW4jQ/iV93
   qfifPrslVi6/SRfHxPN6NmrIu5jCxLPiqMmoWldKCK7JTxA756oEGoLi+
   Q==;
X-CSE-ConnectionGUID: ztxHXcrCT3C2vRvqSWpEyQ==
X-CSE-MsgGUID: pLzNk8F/Rwqi7WaO7k0KrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="394322"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="394322"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 04:42:41 -0700
X-CSE-ConnectionGUID: nUkPo1j2T0O3vBnHylwaZg==
X-CSE-MsgGUID: zN2zUhTrSlKx5KftKE3Gqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="978032"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.165])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 04:42:37 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 28CF5121BA1;
	Mon, 12 Oct 2026 14:42:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xGENu-0000000GexO-1p3K;
	Mon, 12 Oct 2026 14:40:02 +0300
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
Subject: [PATCH v2 1/5] media: ipu6: Don't mark need_reset based on returned buffers
Date: Mon, 12 Oct 2026 14:39:58 +0300
Message-ID: <20261012114002.3970409-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012114002.3970409-1-sakari.ailus@linux.intel.com>
References: <20261012114002.3970409-1-sakari.ailus@linux.intel.com>
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

