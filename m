Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BB049D5B1
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538512; cv=none; b=JUSST1ND8mLbyu0mtIcGko/kPcU9MgRBrWiGFj66lV4kUzFm0FWxhruEcqMrEdrF93LBeb8PISQlryaC/Lw9A8JBal2OI9YE8BYOjPoy7jHM5Q4fP2UUif+o4uqDmVzzbkNp3Ai4KOBdLcoh7Y+6vqlxHehiVwN9AuCf/qqclFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538512; c=relaxed/simple;
	bh=+DfwA/9JnYmxIzJc7f8WZOlmwjL8nVubhqWShSc2QrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b0+h8xwXyeokekLL4chDqmJtEhSuDmUC21aSTwWNg1gzzuLwUoW45s8GzL6GS2nij4QxaLPC0gQXb5cVPeMN8/ojmYfOtab+q/pOPGzgpOjp912g292iyloJnFzQFrNRO9j3ULEHajtt4bki3q6KPXbMWE+1zEqMcaG8M/TrI0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNlSvIdy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNlSvIdy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791538508; x=1823074508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+DfwA/9JnYmxIzJc7f8WZOlmwjL8nVubhqWShSc2QrA=;
  b=fNlSvIdyT0ff4O631YSQMr2HnqwwOBnKfNwEtMJdQ1rkaGfPeWesk0ES
   pTGRJOUXSLQUbfdzHcDGQD19DGxWiDdLKY9SRGjm0eVAg/Q8rLa3ng5yu
   bBM22Ca7TwyUTiWexQeHZTo6seYHkce5xOt/yjISlRtnFd+hiI62NfWvc
   d5XPNPKc+rxzpFNWPzdNWeLDoZ9mF8fx7vID5JmKYG/ZORVq7y8ZU2WV6
   Hfhwp2sf835kj/rvI9RS5vvkgeZm5zHlJym1S6v4oPs9Pzq/7Pe3bVsGV
   wjowPVuyeiWf7gZs6jVlrGX58mjPvMOP89+pnlusArtwupqvSnIxJu35D
   w==;
X-CSE-ConnectionGUID: yH7CgS9KQuW9jnPk9R15Jg==
X-CSE-MsgGUID: +eNPY+8sQ0yJU420Xo7JTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="229302"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="229302"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:34:52 -0700
X-CSE-ConnectionGUID: xFoqV0KeTOqTrS/ypIsNnQ==
X-CSE-MsgGUID: aq8wYO4GT7ydENDD2ZJKKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="596351"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:34:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D33B3121BC0;
	Fri, 09 Oct 2026 12:34:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xF6xc-00000009Fiz-1GPO;
	Fri, 09 Oct 2026 12:32:16 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	"hao.yao@intel.com" <hao.yao@intel.com>,
	"dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH v3 2/4] media: ov05c10: Set reset GPIO high when acquiring it
Date: Fri,  9 Oct 2026 12:32:14 +0300
Message-ID: <20261009093216.2205375-3-sakari.ailus@linux.intel.com>
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

Set the reset GPIO high when it is acquired.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/ov05c10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c
index 05ece063bae9..d6d7ced4beb6 100644
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

