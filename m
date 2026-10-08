Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F58471D0B
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 08:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449733; cv=none; b=obMvmTxm24YpTJF+d30ML26ciL2EhLm5O/M7BKWE5UGsqHM795ZkRHGVnstsIJAKejaa6VKwq3uaxHRx+oHpzmPvwwI8UBfPaaRURfQCGGeG4I4yigTTN9kTSuFbqU8Dzt8UEhKJFQblo1X5xgQK5RN/fBSKxVR4tvgVi7VDjco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449733; c=relaxed/simple;
	bh=D+cwtxqHhKxmzq3opSJuVD16vC2LYHjmKeGRQkDf078=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=upyQjlkqH2FXx30XkZqq1VVoRNZGPgn6hKnl4XOpKGhFfL71n11Cg0Fj/KhgFRf5SIj/FIwg9WrhGVe/Aa2JnBmPOLr/XKppZnMwAD4kQ23SvX4YP5jsS5/sgG2I0sFbWpMFNukuxuFll0vh2EP+URUpwoiNt5kqBMBlNOVEGNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIvpEREB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIvpEREB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791449730; x=1822985730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D+cwtxqHhKxmzq3opSJuVD16vC2LYHjmKeGRQkDf078=;
  b=aIvpEREBci/jzkvuxC8ua3xZT2vXdEugSO1HVs4ZZlkRrHJkudWHw//G
   JX5ImZvziYdW1AEAd5vNP+a1qsnDokuIX9i0ED1aVcgRGFwTKejj/C/In
   +KpRwunTsrZyXHl+ndj5EJM55/whcMGoocncswJkoS4ZBbtPB4NcNO8IT
   nBR65t/xRq59oDki9/wC9hm7y2HIA23U0uyyW/yRNsoFh0KL7jHO4C7fa
   LuN1l2dU0iNmlldZAzDDhL+trMGmBLbHGbYgI5gG0ui0uNcCeHcE7inzX
   IOeGwYCqHt0kv24AOp1y/7I4ob6Neh/bfxdrx2EWPaAHCAlbIWPEcOZ5P
   Q==;
X-CSE-ConnectionGUID: nSL20G8hS2W+9Ms1LmEFVA==
X-CSE-MsgGUID: hIl3DGC6Tcas8YcfGHOnNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="233673"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="233673"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 01:55:27 -0700
X-CSE-ConnectionGUID: MOp1sbxtT/eU35nP/LrtfQ==
X-CSE-MsgGUID: WXDGTLdMQf64pEFgVRNlww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="86318"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.95])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 01:55:24 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 50774121BC0;
	Thu, 08 Oct 2026 11:55:25 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xEjrr-00000003Ldw-3D9i;
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
Subject: [PATCH 2/5] media: ipu6: Tell about not being able to obtain frame descriptor
Date: Thu,  8 Oct 2026 11:52:44 +0300
Message-ID: <20261008085247.798156-3-sakari.ailus@linux.intel.com>
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

Not being able to obtain a frame descriptor is a fatal error at this
point. The frame descriptor should be stored for the duration of the
streaming operation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 152545427930..3e9bfda2a8b9 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -749,8 +749,10 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 	lockdep_assert_held(&csi2->isys->stream_mutex);
 
 	ret = ipu6_isys_get_frame_desc(remote_sd, remote_pad->index, &desc);
-	if (ret)
-		return ret;
+	if (ret) {
+		dev_err(sd->dev, "cannot obtain frame descriptor\n");
+		return 0;
+	}
 
 	sink_streams =
 		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
-- 
2.47.3

