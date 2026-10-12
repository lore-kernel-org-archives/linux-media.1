Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA6C4DA9BB
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 19:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791833138; cv=none; b=dbXrMvWAqUZYYxzOo4QVEplnKMuIHNwp3WkIi27syKbaduiGVqFdFLsTGcc3NZ2yd8whWdEdHqrxIK1iRyiDDS7+Y3oIqW3OCJmEJM1FFguadW9VgELF4+uui0Bv2jKA1s3RopSU50WT4jNEgSTklOA2S+bF9EhIdoITKCVJ2R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791833138; c=relaxed/simple;
	bh=FHpXn4Py9Z+SuqQ6gmS93yrDxP/gg3A/K/kvlDvYs1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhAuEmH1aA+fDZc9HC6SlKCwrAITr7fOLw/hN2oAfX7Q5xGO1rdGFUiKvXcSzMJfBtzpb0o8CzEmAi+g9lv6l4FbxGfxMusJSvbjlJbcuzHkIwqfsqDWkTidB0bx0aXnVUe9I0sVF0QVxQiXlds7zFDwCPGX0SU4SoU9F+bqhh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFXW6efF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFXW6efF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791833138; x=1823369138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FHpXn4Py9Z+SuqQ6gmS93yrDxP/gg3A/K/kvlDvYs1U=;
  b=VFXW6efFh5mwSzMRdMgD0aSq6AJL9On4qn+Zz+CkaWt9NzkpzTzrwV5g
   FId8s6hssPhzbEVr6Fa2oaafKwBtBhtqqT2c+KZn7dGEOcCIwxdBlNnaK
   QCpQRn00WbWes3H0WeC880rt3XyFogVJnovloEbwehnhlTXF0ixGm5VJn
   hf127EEv0JT3NTB0VP5hi6hpbw3FwzSDpER0NWWMxjrnAVenvtn8/4Y0p
   16Q4+0OnqdJSQwnDfTZvnZf8+N0Ivix9DH5iUIhyYR8hzs8A2G97fvNkc
   Sx/erhqD5kccJH18bwpvNo36+R8vbqU4kUoS7uq8ec9tnjJjiwirh8myX
   A==;
X-CSE-ConnectionGUID: y96ooeSKR1KyQAcfn6YcxQ==
X-CSE-MsgGUID: Ir0f5g7PT6qynoTOm7tGgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="537699"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="537699"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 12:25:37 -0700
X-CSE-ConnectionGUID: CsH6ad73RX6y4/irwjiIow==
X-CSE-MsgGUID: 5HLPCFXcTPWaKny0IK0qVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1062260"
Received: from aduenasd-mobl5.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.178])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 12:25:35 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	miguel.vadillo@intel.com,
	sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com
Cc: antti.laakso@linux.intel.com
Subject: [PATCH 1/2] media: cvs: Hand CSI link to CVS on stream stop
Date: Mon, 12 Oct 2026 22:25:24 +0300
Message-ID: <05894a5a041a2169e8f0151d0cc1947a093a6c21.1791831649.git.antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791831649.git.antti.laakso@linux.intel.com>
References: <cover.1791831649.git.antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CVS may get stuck if sensor is being stopped in the middle of a
frame. The CVS recovers by handing the CSI link to CVS and back to host.
This is done with runtime suspend/resume, but only after autosuspend
delay. Removing autosuspend delay is not enough, as suspend depends on
IPU which may still be active.

Fix the issue by moving CVS link handing to enable/disable streams.

Fixes: 8e2b43d2c10b ("media: i2c: cvs: Add driver of Intel Computer Vision Sensing Controller(CVS)")
Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/i2c/cvs/v4l2.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/cvs/v4l2.c b/drivers/media/i2c/cvs/v4l2.c
index 776fe9460168..5a9d7caaee3f 100644
--- a/drivers/media/i2c/cvs/v4l2.c
+++ b/drivers/media/i2c/cvs/v4l2.c
@@ -83,7 +83,13 @@ static int cvs_csi_enable_streams(struct v4l2_subdev *sd,
 	s64 link_freq;
 	int ret;
 
-	/* cvs_set_link_owner(ICVS_CSI_LINK_HOST) */
+	ret = cvs_set_link_owner(ctx, ICVS_CSI_LINK_HOST);
+	if (ret) {
+		dev_err(dev, "failed to hand over CSI link to host: %d\n",
+			ret);
+		return ret;
+	}
+
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
 		return ret;
@@ -125,7 +131,7 @@ static int cvs_csi_disable_streams(struct v4l2_subdev *sd,
 	struct v4l2_subdev *remote_sd =
 			    media_entity_to_v4l2_subdev(ctx->remote->entity);
 	struct device *dev = cvs_dev(ctx);
-	int ret;
+	int ret, link_ret;
 
 	ret = v4l2_subdev_disable_streams(remote_sd,
 					  ctx->remote->index,
@@ -133,10 +139,14 @@ static int cvs_csi_disable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		dev_err(dev, "disable streams failed: %d\n", ret);
 
-	/* cvs_set_link_owner(ICVS_CSI_LINK_CVS) */
+	link_ret = cvs_set_link_owner(ctx, ICVS_CSI_LINK_CVS);
+	if (link_ret)
+		dev_err(dev, "failed to hand over CSI link to CVS: %d\n",
+			link_ret);
+
 	pm_runtime_put_autosuspend(dev);
 
-	return ret;
+	return ret ? : link_ret;
 }
 
 /*
-- 
2.55.0

