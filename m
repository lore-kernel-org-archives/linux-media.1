Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1531C48FF75
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 09:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538497; cv=none; b=YdiZ1I9QhmPEzuVhhdgfHV69AfkjOe2CORiAHlOgIAKqajEYUL+GNlOdrsdU9KNRhZyrmINynfmzDQjuKk0Yud4kMG6Els37HHZVo9Th+mL7kGyWeV13X2kfE1HT5nvoh4pk160kbO/qWpWUnh0hl2RbNDR9MXAfGG8vwszW4cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538497; c=relaxed/simple;
	bh=EDYdEF76cbZtYwTqWb3FpsRDvwvS5PfzYr80BjgY2o8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z9C2TXGMMQAqdUgTu/Ny1BFPN4dQSbGSSj1YTutz+xbER905zbEsZDmfLLYpkEob4FLUned5jmRaPQjWl+xWKabjkdKxWB4INWysrHh9j5G7VUg0xuzM61hbS+8/KAYu0FzjJ09BfJBs109EmG0t/mazMDPvM1n8VJ8jfw6lcfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3tEKiq8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3tEKiq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791538494; x=1823074494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EDYdEF76cbZtYwTqWb3FpsRDvwvS5PfzYr80BjgY2o8=;
  b=d3tEKiq8sEaVwCCU+tdWa8Wz2TbBE7EcER5bspshBBYKlZdskTRiBnrD
   mxc8cvSxatSp8IWY31hu+h/92zp40HT6VRVA/4Zgm9ww45c/rlLt9eJbs
   xb3fvVFElzn9N72hAxfw5QxaCgCProFLwyc05EEe5HGeQSKkun/bmGMbD
   lWS4wFC2YPnno0OD+OKm3chJCjAJRsdwWw+dZRBZKARkudpsTq0JmZHXZ
   bV/Th7ELlBWEuN2LR9WWMT/zavcpbud5MDM2jHEHqkEW8Pr6aOQOnM6Qd
   M8thkrZfrNHp/xDUGuOHDXiIckh8fIpxVDjt/EZeqhgPEdH/8gOmZWUeA
   w==;
X-CSE-ConnectionGUID: UJbODqRhS7SkkNCRFjOrLQ==
X-CSE-MsgGUID: skB1nQTZQ0OmOFqQtNhnJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="229300"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="229300"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:34:51 -0700
X-CSE-ConnectionGUID: QKGyTcaQSbqvIhZU3ly1Aw==
X-CSE-MsgGUID: bFtYediAQKqHrNbBe23smg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="596346"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:34:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D54AF121D31;
	Fri, 09 Oct 2026 12:34:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xF6xc-00000009Fj3-1Mxs;
	Fri, 09 Oct 2026 12:32:16 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	"hao.yao@intel.com" <hao.yao@intel.com>,
	"dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH v3 3/4] media: ov05c10: Power management fixes
Date: Fri,  9 Oct 2026 12:32:15 +0300
Message-ID: <20261009093216.2205375-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009093216.2205375-1-sakari.ailus@linux.intel.com>
References: <20261009093216.2205375-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the device wasn't powered on in probe(), probe failure led to it still
being powered off. Also the device's PM runtime status was left active
when sub-device registration failed and autosuspend was left enabled after
unbind. Fix all three issues.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/ov05c10.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c
index d6d7ced4beb6..692474cbe84b 100644
--- a/drivers/media/i2c/ov05c10.c
+++ b/drivers/media/i2c/ov05c10.c
@@ -910,6 +910,8 @@ static int ov05c10_probe(struct i2c_client *client)
 	return 0;
 
 probe_error_rpm:
+	if (full_power)
+		pm_runtime_set_suspended(&client->dev);
 	pm_runtime_disable(&client->dev);
 	v4l2_subdev_cleanup(&ov05c10->sd);
 
@@ -920,7 +922,8 @@ static int ov05c10_probe(struct i2c_client *client)
 	v4l2_ctrl_handler_free(ov05c10->sd.ctrl_handler);
 
 probe_error_power_off:
-	ov05c10_power_off(&client->dev);
+	if (full_power)
+		ov05c10_power_off(&client->dev);
 
 	return ret;
 }
@@ -934,6 +937,7 @@ static void ov05c10_remove(struct i2c_client *client)
 	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&ov05c10->sd.entity);
 	v4l2_ctrl_handler_free(&ov05c10->ctrl_handler);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 	pm_runtime_disable(&client->dev);
 
 	if (!pm_runtime_status_suspended(&client->dev)) {
-- 
2.47.3

