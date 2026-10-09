Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E603C0607
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 08:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534145; cv=none; b=krkcvSo9scmxzgJzNb0mMf/9faIQ40sgrAsxpVKwmSMzr8/0IayEbqnf5gRZOmzBiXgiwS0x7eUeRw/X3wfL09HHg9U3acIZz3yQO+S6FuIVaNn/DKe4cR+Uyk5mhO8QrR1qgW2C9YdFQCi5mWI+mVtHikSpZ0uaIbMq4OR7r7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534145; c=relaxed/simple;
	bh=hjO1KzkFgjcs6rR29aca0Oj7W+wZVxQz+4dJ1O/1gf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Acp7Tv8z8TVg7nEjyuQE8wU86mO44W5Kz1FY0OgMKYHpbU3d6knLX4bvk3oqw65yOeEUMxF4JZERotom3JtC9mMMF6Ie2phlCmFLD1fR7Dp0cgNSCKXU/BwH7JSdWgsU03XXGdJOC7HroTIp+mBmPadBv63Zlgt2YBlPUzp62Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lv01SNZB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lv01SNZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791534144; x=1823070144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hjO1KzkFgjcs6rR29aca0Oj7W+wZVxQz+4dJ1O/1gf0=;
  b=Lv01SNZB5okAL2wdgiZYDL9/gI4zaIDvLm3nrtQlls8q+wclXzwRhsiO
   LAfruC53gNTPt4aOKfj0mfo/dTBmUxgCrWMtOvSsdYrNk5wflRpJvdoee
   nvaPwUDI/2dldBzZtzf0nuz3/dXra4Mmt+Jvz3kw/bpk18ONm4ORNgoM/
   RasWP3j+LHeZBVltZ0erzgg7hiYDYjcZsNgUeC7U0QKalipq4A0yWvaJw
   202JJXBqOaqKPjWl9jT05XzgYgYIJsqe89iAy98F/2dEslCNpfkfle0hQ
   vXw51m1Q0FFU0ih/PWCFTRpQH0YdVgLqkZPjZ3A02raQf+Q4uf1r5s5FU
   A==;
X-CSE-ConnectionGUID: eLRS8hlESiqQLqH93wNQoA==
X-CSE-MsgGUID: irYgk6N8Qu6AYxQEuPAniQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="235407"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="235407"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:22:21 -0700
X-CSE-ConnectionGUID: QZDjwn5kQJOP4bOJfiRrAg==
X-CSE-MsgGUID: cRzIF+gMSeG2Ol432NO5cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="2068667"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:22:20 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E88AC121D31;
	Fri, 09 Oct 2026 11:22:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xF5pT-00000009FOI-1a4C;
	Fri, 09 Oct 2026 11:19:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	"hao.yao@intel.com" <hao.yao@intel.com>,
	"dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH v2 2/4] media: ov05c10: Set reset GPIO high when acquiring it
Date: Fri,  9 Oct 2026 11:19:45 +0300
Message-ID: <20261009081947.2204092-3-sakari.ailus@linux.intel.com>
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

Set the reset GPIO high when it is acquired.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
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

