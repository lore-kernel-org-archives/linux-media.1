Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420462E8DE3
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 08:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534143; cv=none; b=Dz0yafjG4DEkE3y8ASLRTZRQLTOKU4E5atkzQqLQmkhZYQ8rkmeYHWD/qBd3HJ48S91PDB6bo0vBGusuwL16zIBkXI51VeAODf1iWkUx+nozV809oToww9G5LRO5b/by4RLkCyz68htJDSJiNoWrm19dD62pIOrIRR+wXY65/oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534143; c=relaxed/simple;
	bh=SDvkDEGw6enq4A9Z2+4V6OKgdC0G4Z/8CPlyW1UM/zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYa47nJsXrWKhCKOrb9pXUwXf8WYPbv7+0ThAXKwVIOHyeviF/ABrRqMfy+6r5aCdi1fm235zAa7Qxxc/JeFr2n4BlSZDH+CdGovmoqU//wKBjgo0D0btSJeb6upyrfjhFUyZbWAVDZvh1p5v1jOT7kO7vC9rPr1QnRIog5opo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMguYZlq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMguYZlq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791534142; x=1823070142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SDvkDEGw6enq4A9Z2+4V6OKgdC0G4Z/8CPlyW1UM/zM=;
  b=bMguYZlqYr7NALpGs/ZXd4JoQsHToTRXcPAVqLTYvudDV1VZLoCahUxZ
   8I1b4h2nuyjRZ5hDKPs7e5Y3vaxHjP7NCr08DQuffYxAuKt0nWKqdAK8I
   BBjXu3uFq9kSFPJyZFctQf25o1NfhSrqz+0R7ly/ESSEgJayAWpfM7QrS
   A/ty3514u2IhX2f3Mb10PdzE+1tE++UbMBHjcB2XGcdelsQTwtgdYrMf0
   WWqub8GtosWWYLI+v9RfIt6CH2D7ZHMmz6k+dVypX44PukA51TbmHHlBV
   zi1+XklKtebq3M11mCCsZbmDyqM3krhmhXgMK+f+cW+bpK5Mge1Mgdi89
   Q==;
X-CSE-ConnectionGUID: J0gS8cqzSUWiG4SLXvd+vQ==
X-CSE-MsgGUID: lljyzNBTTaehebE0aIRZ3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="235409"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="235409"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:22:22 -0700
X-CSE-ConnectionGUID: th7KMNTzT9qIAjm/KC6K1w==
X-CSE-MsgGUID: fkc2Z9GkSrudpHyUl82Wfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="2068670"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:22:20 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E7D0F121BC0;
	Fri, 09 Oct 2026 11:22:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xF5pT-00000009FOM-1eko;
	Fri, 09 Oct 2026 11:19:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	"hao.yao@intel.com" <hao.yao@intel.com>,
	"dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH v2 3/4] media: ov05c10: Power management fixes
Date: Fri,  9 Oct 2026 11:19:46 +0300
Message-ID: <20261009081947.2204092-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009081947.2204092-1-sakari.ailus@linux.intel.com>
References: <20261009081947.2204092-1-sakari.ailus@linux.intel.com>
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
index 900aa84ddbc3..006be4ce030d 100644
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

