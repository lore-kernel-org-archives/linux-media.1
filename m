Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D131342E43F
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805365; cv=none; b=dMioKb2P0TeIS4PW3uuVFUdg8o16F9Ey2mjmNoiHuMOqcKcPNikQx/1P95d1oDB9vP4UnGBDL8ZwxGDozjcTcjZ925Nv2Zwo3icbLXQgKuDs0q01xlC/ypaLYK7fnIZ9vaGJbpJYIfRPlrY/tjSUz/QmvpJCJ7T/HwO5+65LDMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805365; c=relaxed/simple;
	bh=D+cwtxqHhKxmzq3opSJuVD16vC2LYHjmKeGRQkDf078=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=temTfJ6L3WQ+Jtwl/iN1e2DrFazmOwzPXvEIEAywgI0qM24Yv+3AA+we7d2KhAYTkZ0SZ57Wh0ymll1u3gyASlK4wEKJX24CSFGKoV56KJQe6/1I5KSEP/jWFQNnyerFmqzvC6QPcZqnxoyzz+ECPqs/x/bBFTRTBfiMtqDBe/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ng13PDq4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ng13PDq4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791805364; x=1823341364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D+cwtxqHhKxmzq3opSJuVD16vC2LYHjmKeGRQkDf078=;
  b=ng13PDq4Je5O1eBSSC1RDnb4opa5JpBunoEymrDCmUqS/uetdG14YWQd
   OmiVQYsmOPJC9FQYCUVKsk8LqgdS64p3e2+AbspnhJk1NzKId7B2wHp5i
   +eyd1CxiTK7HcDkw20D51NOEyHQbIu6cvLQH+I6smFmLRyPcOj5hWoUPP
   VI47VZzVsVRXOrJlX/1/d1Awf/yRZ5GixPyjLvSNLSuVazDjl/C0iOde1
   8ifBeKSPPmT5Rbi4cWc/D51tZ+qmfSZidLOYdQC3CgLR3OQk5vOs1E29+
   5Tz5tD7ndSiPhr9WKjkMH8Wv+/CcPhap4NnX7oCtWtLyAic26pikTkga1
   g==;
X-CSE-ConnectionGUID: 4R8Vp5dNSSaZJly2d7CN3g==
X-CSE-MsgGUID: 7FafjuNdRViJEO95p2hDwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="394321"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="394321"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 04:42:40 -0700
X-CSE-ConnectionGUID: 4UpEPU4BTkuhRpS6+xLG6w==
X-CSE-MsgGUID: 4d3boYqnSZeU6egM29Kaaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="978030"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.165])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 04:42:36 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3315F121BA4;
	Mon, 12 Oct 2026 14:42:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xGENu-0000000Gext-236p;
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
Subject: [PATCH v2 2/5] media: ipu6: Tell about not being able to obtain frame descriptor
Date: Mon, 12 Oct 2026 14:39:59 +0300
Message-ID: <20261012114002.3970409-3-sakari.ailus@linux.intel.com>
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

