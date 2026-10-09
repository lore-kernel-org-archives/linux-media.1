Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304A13C9880
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 08:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534146; cv=none; b=G/81vKoislpe5sRDnlO33KXKAuIFOzB5bgkUm3IXVzOVHzmI2vcoga9+ZkESAACbhnnwhrS5z0qasqQhio5lX5yax1mK6YfO0e5hyp8+7D6HY93o/3gsUAHkgXaz25rlYS0Q3ua7jr5udQjAWY2NgxJC5coe2XcnJNS1XM0ysY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534146; c=relaxed/simple;
	bh=t/jFbW7oeXQY94vY86WuFNE0Kb7M6o1t9luhBNWZL9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=He6XjGU0Ufe+ZJG674y+xS+NR0x4lIUA1YP2HEiL0zwlVW3RFU5q6XkodNN8/mjQXWLR822zrWXSJ6eZ2gmDFZL6ljZ70vFlRQBDF4czB5BzTG+m8yylicNJFULqV2x58ybQt3N0E/Ab0nLT/4RMMvyuCSsWgwFZWsu95+ZCfhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KIzS0CwM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KIzS0CwM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791534145; x=1823070145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t/jFbW7oeXQY94vY86WuFNE0Kb7M6o1t9luhBNWZL9s=;
  b=KIzS0CwMjZMbLSunMTRnfLQa828KmJ71AVJRSipEd3GwsAzCzR8J/1kW
   q5JNyKwVPVGAClrfZOfgDRvdL+IFa/nHBNu+Y7OdcceR+qMW9pej3kic6
   PvQSGtLX3XoovgS7Ki5QA/TPTd9NwbaytDq4M+9KF6XjYENtIQRvrmaN9
   t1bR/5WEdXrkZPb8kuBp9VJJwW+rAjnLA4yQdybXFG7tbml/sGucyOBIt
   hFcJVsg36w23szqcpnTDClGNPEmLLaRAxpETuG1DrBHNNOV6e9Zf1zvp+
   MeZ18aS2FsSWLlehMDs7Mu25U8oU/p3mRW/nzvnV/OIQPObpSwhoMJOAg
   w==;
X-CSE-ConnectionGUID: stYW2C4ySzaDNhfhpWolgw==
X-CSE-MsgGUID: 4hPTWvtjS2i99YDiieY7lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="235413"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="235413"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:22:22 -0700
X-CSE-ConnectionGUID: F+IBYn/5RHuwfAfDyreW8Q==
X-CSE-MsgGUID: W8ocuU6ERumCPoIDW7zzoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="2068673"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:22:20 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EB99F121D4C;
	Fri, 09 Oct 2026 11:22:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xF5pT-00000009FOQ-1jMS;
	Fri, 09 Oct 2026 11:19:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	"hao.yao@intel.com" <hao.yao@intel.com>,
	"dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH v2 4/4] media: ov05c10: Remove duplicated writes to analogue gain register
Date: Fri,  9 Oct 2026 11:19:47 +0300
Message-ID: <20261009081947.2204092-5-sakari.ailus@linux.intel.com>
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

Remove duplicated writes to analogue gain (P1:0x24) register from the mode
register list.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/ov05c10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c
index 006be4ce030d..8687448945e7 100644
--- a/drivers/media/i2c/ov05c10.c
+++ b/drivers/media/i2c/ov05c10.c
@@ -158,7 +158,6 @@ static const struct cci_reg_sequence mode_2800_1576_30fps[] = {
 	{ OV05C10_REG8(0x01, 0x06), 0x76 },
 	{ OV05C10_REG8(0x01, 0x07), 0x08 },
 	{ OV05C10_REG8(0x01, 0x1b), 0x01 },
-	{ OV05C10_REG8(0x01, 0x24), 0xff },
 	{ OV05C10_REG8(0x01, 0x42), 0x5d },
 	{ OV05C10_REG8(0x01, 0x43), 0x08 },
 	{ OV05C10_REG8(0x01, 0x44), 0x81 },
-- 
2.47.3

