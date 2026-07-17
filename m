Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9217526FA4B;
	Fri, 17 Jul 2026 17:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784310721; cv=none; b=BE5J5OZsCElaHZNim3Jmkv/bH9YvbTO2P9zVblZto5T/HbIcj0jw8m0hO7uAGtRrDF/tdzcBUMOcSV4Pm2MDMvuDOexCYBLujI5/OrUMwHvgfskocYMKKFiTgHnHkVg7sG33+k//80r6XCEYJbQ1mS2Tjg0EFlhj8LPuLUe6RbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784310721; c=relaxed/simple;
	bh=56kJOBmVM5l07R7poVTxRg+/hseGmFU4UAZrGuynX5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YH6vOXhJ1mQacjiy1fUzxMrM86RmAiegRUzcI1C9Yqeq28q7wqGzs91hXhBvIyl68Uvb7TD2pUFXzmkO931XiEIkWQrD5j35h+uDrKkjyT7Mu5AM82/YduYJBeBff9xwgAtEeO8PCrTgxDa6yreThl7ddI6p+M+Sh0dTkfsgML8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UiuZWgOo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UiuZWgOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784310720; x=1815846720;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=56kJOBmVM5l07R7poVTxRg+/hseGmFU4UAZrGuynX5o=;
  b=UiuZWgOon6/Vt5O9BQou8tWjmpKiRZm/2ti7f22C4gzWwlP2ToLlepwy
   CEitumBY6DNBZOIaNOlE4//tKxSHFU6jWjbkXACcJDiJt4dDdh9mJ+e5n
   o+FRlETdxQ5W5OtbXKy6AIZOE7LXEt894KttI8f+JtGAvuRaz6Nro8bck
   x8yQDTBhwtCLJVQQMOhl61swSxrpzE8JlRrtbAE9w45V1OyAYccs79hWA
   9ZDhFgNfQYIkgfNUsZBAdai+Ck05aetKmcidc4eynVOASHHsn9IqYIi7t
   qpfCftzRB7VVjtKNTUWTp4pwqqaYBcrAU8Bh2bsnDFCOMWmjtu1BF6k2Q
   w==;
X-CSE-ConnectionGUID: rnmlmx1hQMK7I/u9nvrtIA==
X-CSE-MsgGUID: Li1aa3AwTeC67VvC4jwVag==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="107777651"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="107777651"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 10:51:59 -0700
X-CSE-ConnectionGUID: FxQhY0xXQ/WU/gf8odLHQQ==
X-CSE-MsgGUID: FZ7KgityTnCmoVXKRuIXXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="252446957"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jul 2026 10:51:58 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9B1BE98; Fri, 17 Jul 2026 19:51:56 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Olli Salonen <olli.salonen@iki.fi>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 1/1] media: tda18250: Don't use "proxy" headers
Date: Fri, 17 Jul 2026 19:25:53 +0200
Message-ID: <20260717175155.1784500-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update header inclusions to follow IWYU (Include What You Use)
principle.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Induced by the ongoing task to drop always included kconfig.h.

 drivers/media/tuners/tda18250.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/tuners/tda18250.h b/drivers/media/tuners/tda18250.h
index 2819126e5e8d..b020aeae4d58 100644
--- a/drivers/media/tuners/tda18250.h
+++ b/drivers/media/tuners/tda18250.h
@@ -8,7 +8,8 @@
 #ifndef TDA18250_H
 #define TDA18250_H
 
-#include <linux/kconfig.h>
+#include <linux/types.h>
+
 #include <media/media-device.h>
 #include <media/dvb_frontend.h>
 
-- 
2.50.1

