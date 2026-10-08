Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A806643E088
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 21:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493662; cv=none; b=JITrGJvN5DH7rZXxcxWbF4gegJ81V0GfJy/hdYvUl6DyT/DebCcHqEogb5+6TPkMwjHnAM+i3LozSNWPdcsFcyx9QP12/XaC5iJ9eFLmM9BeTAbn/8m+I+UDyh/+zml6Xi3gkyD1+X2C2emeFzu4z5m+MaZm0mIgEHxNKhWM0pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493662; c=relaxed/simple;
	bh=SY7a46vy01XlrZr+r8E29vK8VbBPcGXdA0h1K5CIOVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ithQZIlAAmV60sukcHYAM+axMgsUzfpu12VDEYBVdHS9kUCYy/oHF5E/HlLBJq8+GC5w7EwkyHycR/GQTrfeXIIwOSzgTxAyMe+Z/ivwBxJtOJxwVt1jSuT4TYDeVpSJSpKXzhRVertW7cb7UJjVNaLiBVfzj4VxjCCztRQNbw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pu+NGPoF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pu+NGPoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791493661; x=1823029661;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SY7a46vy01XlrZr+r8E29vK8VbBPcGXdA0h1K5CIOVI=;
  b=Pu+NGPoFuXrKTgObwlZhBzq0Eb1fpGKRDiubclURwdG1MNIPVfNXb6py
   ToIZ+JBh0EihgckbzOoGj90HC7/jUp4fhjSenLplk1UP8IdhJ/PDsoJ7Y
   radaEcjhJhMbi0KkV53asd603/e9h+6A9yRtyzzH+DEncmqTbf3GN2Ci1
   yFG81bIlPjbcpTKFb+iFvNc8DSD9gM3lZrDd33Kl2APZngSln8ku4xDM6
   Y9PCALQ//rf1v+xWJLvwSblo8WEzBvD46rlmhSfKS4OrBguMzr0KlEQNJ
   sByDAGppHXqOg/mumgSRc7mtD6wOBK9lI6waRwtcWOmYrmp54WhnidGYj
   Q==;
X-CSE-ConnectionGUID: QbXkDMoXRzW/zaPwjxxxIQ==
X-CSE-MsgGUID: WSxgZDj7SKqI6J1exMf3dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="173194"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="173194"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 14:07:40 -0700
X-CSE-ConnectionGUID: xqWPOmTdQWO6EOuHvJKiKw==
X-CSE-MsgGUID: hkdpP5FwQ52SdE9Dg1cJ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="135314"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 14:07:39 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D4F94121BC0;
	Fri, 09 Oct 2026 00:07:39 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xEvIW-00000007slQ-0bL9;
	Fri, 09 Oct 2026 00:05:04 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	"hao.yao@intel.com" <hao.yao@intel.com>,
	"dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 2/4] media: ov05c10: Set reset GPIO high when acquiring it
Date: Fri,  9 Oct 2026 00:05:01 +0300
Message-ID: <20261008210503.1878442-3-sakari.ailus@linux.intel.com>
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

Set the reset GPIO high when it is acquired.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov05c10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c
index 0256e5514ade..900aa84ddbc3 100644
--- a/drivers/media/i2c/ov05c10.c
+++ b/drivers/media/i2c/ov05c10.c
@@ -765,7 +765,7 @@ static int ov05c10_get_pm_resources(struct device *dev)
 		return dev_err_probe(dev, PTR_ERR(ov05c10->avdd),
 				     "failed to get avdd regulator\n");
 
-	ov05c10->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	ov05c10->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ov05c10->reset))
 		return dev_err_probe(dev, PTR_ERR(ov05c10->reset),
 				     "failed to get reset gpio\n");
-- 
2.47.3

