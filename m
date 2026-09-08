Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522C33AAF6C
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 20:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900610; cv=none; b=Y/pllnmXoM2lYI3pWklP2j6g7wT1qS2+hw7Bhc0aAgBKKbyEAFO68lc7qgVe2U/gf4f7gC2WPKKYPO5KzNwTcHbfHzSTZPmKQ8jSuSpof+7sKL7vdiGQqq6En//jwxAvNqEt4AMLI3ozSn8W5LdWAFm+VnNMedpgHOxHH0paO+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900610; c=relaxed/simple;
	bh=OwJjxlkzYgHjrr2dAE1/yyAdM+fKT/LoIlo1GV9Yqdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eMNyTrYpZC/DAr03xrn/AoVea6tIDMGFX0PaOf5k995qvSERf7S5uLWSIbqoZpTuu23xMONpHbZpiliDv6baYWgSWbr6wmO2rUzz81pWIalSh+O+RD6a3t1ksieOG/xM2BDz1Z/7DCiVeWmLOBHSG0OcYC4j6OjoZFXm290HmB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXvxtXJS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXvxtXJS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7605E1F00A3A;
	Tue,  8 Sep 2026 20:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788900609;
	bh=ecHxQjDjWePtcM3nRCKBmttidw+ug6Ij/mtd1N7JXCc=;
	h=From:To:Cc:Subject:Date;
	b=ZXvxtXJSmw1HQopQtDVsidnhuxaR21gdsIAz8UM0aVcUAa2uLA9NynBvvpNivOQqY
	 jnGDIn2KjxuHG7sIPU6/IIPHP55/buMA1ezPm5sWA+w6gLx8MQGisU4OFewbnH4Hv+
	 U7EM6b++AtjDy1mLt2ZJyPXGIjd4OZuoUUCnK9uLV5mxIcYDBWt8Dbk4qPytg8UMV5
	 MgOXVGixidFuc01uxHYBuCZA/Wv908p0WrQaOfbXfyvVxlHzX9kAThcUJHqfzfj78I
	 LhWky4mFLPNNlNX2169LcOgIqzIM8hYjjrsOdDhnsc1HA39Tq4lrkl2/ug+LAnVZmf
	 56eDO71fq2C1w==
From: Mark Brown <broonie@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] media: ipu6: Fix up missing IWYU issue
Date: Tue,  8 Sep 2026 21:49:56 +0100
Message-ID: <20260908204956.864759-1-broonie@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In -next:

/tmp/next/build/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c:229:3: error: call to undeclared function 'clflush_cache_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  229 |                 clflush_cache_range(cpu_mapped_buf, size);
      |                 ^

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
index f821ec5f55b26..aee9227fd66c3 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/cacheflush.h>
 
 #include "ipu6-bus.h"
 #include "ipu6-dma.h"
-- 
2.47.3

