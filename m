Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4BB4DAF88
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645183; cv=none; b=koxDKqfODVeLLZLuG12x05o6uWUz00LI86XZbMfRZbtllHHFMlYP8hHZgALQs6UcyPGxyXQUDfA6/W2RadA7fVT6SGnpcrqXSRMh3FajvpXcJ+sLDRyVJJRWK/CeRKxAW/TlKa1KOjFJYhNYO8kPT0bWEFYgTAvwPt+l879iht0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645183; c=relaxed/simple;
	bh=llM/j0vkPcJUMuy5LKMbsUzVqNeixWHqQKSDEX4us98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V7qbzgjvKMA0KPUF781FigSJRcUTGojJJ3WeqNCwfOj9e3hTut31GI0FqYxNA+NrE/xGG+mHLvRl7i9HbfdTRjUVOuiq3DP3JhHY5lRFo84xFBF5q9HBgnoBJLj8l7SHOv+EEqquTHPLs5LBW3o3CfIl7fBgaXHgoU1yCpSjs14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kY62PZQ9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kY62PZQ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789645180; x=1821181180;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=llM/j0vkPcJUMuy5LKMbsUzVqNeixWHqQKSDEX4us98=;
  b=kY62PZQ9sZfB3/qhl5GZY7NH/nmRvKIgY/+RwHM1Jet02d+8V4kClfjo
   2MH7IZpMTFMi4gMi/JnT3NeV0gbiHeX5DUOcb4OVVpYtYnJoy9nLP/90G
   swy3YBPx69RTnNDLRd8YGAJh1Z+gnks/83HwKDf+XkcZcJA/KRSebGpSW
   PpzH8nfX/mmiLz7+xS3q/KH48YtC8BSo1XQ4g9k+Ryjqa3E/d17gIj/0J
   YEeZvqt9TwYpph1gPSf/u3YwFzA3/bljp47da+BMcMbGCuRqamTFSSkGq
   5b0SRTv3NPRVifS309ygt2bC93HLFf2w4qiCxD4YGtLg9ICxYEG+wz+0L
   w==;
X-CSE-ConnectionGUID: md92ZMaCSbG2sxicoPMqYg==
X-CSE-MsgGUID: aYq89TQ5Tr2rKDufwXVGZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77622376"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77622376"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:35 -0700
X-CSE-ConnectionGUID: BapQAr4cT5mFxRQew/itlQ==
X-CSE-MsgGUID: XCiZn2y9SKiE6tSw2nkYEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271097347"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:33 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E627A121C7F;
	Thu, 17 Sep 2026 14:39:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x7ASa-00000000FNG-0Pkh;
	Thu, 17 Sep 2026 14:39:24 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v2 10/21] media: ipu6: Add lockdep checks for CSI-2 streaming enable and disable
Date: Thu, 17 Sep 2026 14:39:12 +0300
Message-ID: <20260917113923.59004-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917113923.59004-1-sakari.ailus@linux.intel.com>
References: <20260917113923.59004-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The callbacks for enabling and disabling streams access data serialised
using the isys stream_mutex; add lockdep checks for this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index aa07fabb2afc..431b770cc8e2 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -536,6 +536,8 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	int ret;
 	u8 vc;
 
+	lockdep_assert_held(&csi2->isys->stream_mutex);
+
 	ret = ipu6_isys_buffer_list_get(av->stream, &bl);
 	if (ret < 0) {
 		dev_warn(sd->dev, "no buffer available, DRIVER BUG?\n");
@@ -608,6 +610,8 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams;
 	u8 vc;
 
+	lockdep_assert_held(&csi2->isys->stream_mutex);
+
 	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, &vc, false))
 		goto out_del_csi2_entry;
 
-- 
2.47.3

