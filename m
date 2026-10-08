Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB92468C29
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 21:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493664; cv=none; b=oBPLGIIa8A+vqFo8/HeLhpv0QrWvKBJM/ufkDvf2nj3b+Y1yQj92bOASj4ZnzYczn2y77Iq2ns6H6rgQ1TiPqvm85XOu8qsvcso4mXrAE3Py//RHEI/49Lzwu57uft6f5SRs5FOHPCGXznP/9g8J0fIT7ClAiAuX3ugvKa5UVkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493664; c=relaxed/simple;
	bh=gD2UfyymLILYimRBxfm1TS5qfPowhz3OyEezhFLEJFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bXNwR9AJuNDCr/rYVUwVX/3hxtdht+u4cC0Iz3TMb4swNV1zkt9UALGoghhIvUgMEQVljoaW2dANcPzCCMrPRdod/Q/HvIWqAtjVQir0vNgNLS7rP/WKIc6bAkcDpQ+iYZ2W2Gj1yzNEf56hPwscjQSszoIdoU0N033qdv2kfwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmIbdkUg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmIbdkUg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791493663; x=1823029663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gD2UfyymLILYimRBxfm1TS5qfPowhz3OyEezhFLEJFY=;
  b=CmIbdkUgn8+ni01FFXUKT8Q1D1dXIl9sKza21BKRbREipo3m6ls9S/Zs
   EfruN5ocQXmACn8vmYywP4rrJNZj0Cmebvt6kv+cH8beiWAHb7Ys6UL/L
   A3eRcYDmbIC7xfwDH7ZF0/JeQlnintjRbGt9UIFwRrZUSIx443SDAC3hv
   LxMwHgjt3BO1sbo7amM1xV9bf2nwNUSdWsW5A3D3gS1autB1Q0Qe/Gw4T
   h1kqBS9afpLreeIS5ENJHcccP5pLrkYbFSptoZy4pZAsT3y/cNO2kXOKA
   ny8uFhILBGul/4rdDFpthK8XHU/BGrVjAKOIsrF6IraQYBuZiiUnmSdQz
   Q==;
X-CSE-ConnectionGUID: qfadkuD6TIGoQvkxE0XRew==
X-CSE-MsgGUID: KN/87lQ9SkSCHe20Ut5sbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="173198"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="173198"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 14:07:40 -0700
X-CSE-ConnectionGUID: rQuWIWAoTw+/u5IJL8RncQ==
X-CSE-MsgGUID: 8cpnI25dQOCM/77ep3b2ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="135317"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 14:07:39 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0A52D121D31;
	Fri, 09 Oct 2026 00:07:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xEvIW-00000007sli-0pey;
	Fri, 09 Oct 2026 00:05:04 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	"hao.yao@intel.com" <hao.yao@intel.com>,
	"dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 3/4] media: ov05c10: Power management fixes
Date: Fri,  9 Oct 2026 00:05:02 +0300
Message-ID: <20261008210503.1878442-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008210503.1878442-1-sakari.ailus@linux.intel.com>
References: <20261008210503.1878442-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the device wasn't powered on in probe(), probe failure led to it still
being powered off. Fix this.

Also disable autosuspend in remove().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov05c10.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c
index 900aa84ddbc3..cd64a621ff48 100644
--- a/drivers/media/i2c/ov05c10.c
+++ b/drivers/media/i2c/ov05c10.c
@@ -920,7 +920,8 @@ static int ov05c10_probe(struct i2c_client *client)
 	v4l2_ctrl_handler_free(ov05c10->sd.ctrl_handler);
 
 probe_error_power_off:
-	ov05c10_power_off(&client->dev);
+	if (full_power)
+		ov05c10_power_off(&client->dev);
 
 	return ret;
 }
@@ -934,6 +935,7 @@ static void ov05c10_remove(struct i2c_client *client)
 	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&ov05c10->sd.entity);
 	v4l2_ctrl_handler_free(&ov05c10->ctrl_handler);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 	pm_runtime_disable(&client->dev);
 
 	if (!pm_runtime_status_suspended(&client->dev)) {
-- 
2.47.3

