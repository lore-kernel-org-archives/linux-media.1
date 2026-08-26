Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2393F6C59
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 13:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752447; cv=none; b=CmzXIPpJqRG+9M7qmZUK1jOGXJ7q0Xh51n1kaZg88IQknw4qPPY+xVs0FHPHLhff3C3/h86ib9ivD+ynAHeKjbfvlp6nv6wAVKS2N+Mng96M4gN5W58nHM32TbkCt+qJSqsenhyGe/0fQXIHm71torBeP4LyfZ11Ngvx8ckweIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752447; c=relaxed/simple;
	bh=8rTH+kcGVVWC4O9UYd+nHgJzRkDuUmS9WFz7klp3z7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fFcdp7PfvWgx0mNzXzcMhi4sxkxVnQTFNwserOjsNxOcJMCZ23B+SMWpeB350Se6r0V+5hW9hvql4RmO3EQa/0+iAvN3lylGC73cuTqdZRu+YZBPxU8YhIo0kGuwWn2KxHnY3uD0SD6tE9dXMTh3W10PidvLwCPeJQuOaArQU8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyNITQnS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyNITQnS"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4815bce4652so571579f8f.1
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 06:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787752436; x=1788357236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KEVG8kAFLJoKx+jDc12PPtT6k0cGqduvqfafakCoXeE=;
        b=eyNITQnSuYoDtewnJW8wIH7JJk+f2FayOBNMqG1PV3+/nWIGobSSA5rNxl9uvAx5LC
         8JgOH9qTe6EiDF2AnrJmUaLJtaMiBN1P+LUARybeUmvmlpyA6TWVleEnO1JyyyRNnmyi
         yCn8j7a5eqEsepbeLOjqJkFkueJfXSEb4FkWQC/i+93z7tJGMs558yNg3ABwQ/l1T8uy
         zEpOVMOgB82Wbm0ve/zIzBP8j9U8N0HmT7IPQoZpPt0SLiIm4wXe/QuG2I+ATEtdAtJD
         tnaSJ+ejI1sq2GPY24YFK3nhytTTep72/mmk+SeeVTyiOPwqWV05BQlPBENIvdfPumcZ
         yxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787752436; x=1788357236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEVG8kAFLJoKx+jDc12PPtT6k0cGqduvqfafakCoXeE=;
        b=J5AmMP6baRYDbPK3TuzOVKdBKaLwyqdtxJxxlWQcAX3ffddITmQb59RCgleyi8YnEA
         dl5UKjaZI0HBJxS2n8WCW0JW/Aow3h0UVUBjSFeLXoAUBWbMXCfjEE09aiqGWic6L2rD
         pgk73zlv4Fn46ARcbbi8QmfNQnaWMZ56j3vhNjR3gRH4s7gN1Y4nc3tzEZ2aKk/ran6t
         auqqr0wHLRlRctjRuzRPrOtCZUoUzUOO5BkSlnu412wMorLbauBk9cuPsyag4jGgt/Od
         NS1xrOBuF2KJbAKGSZQVRHdiu+iFiiRGIdNw1wsekfs6HUhA3LcE9VTWew91gWuSIXKn
         Y16Q==
X-Gm-Message-State: AFuF++lx70QIeJIGlxcJBHwsrarjsQBA/qOojt9xWHIOnq+pRF/wZSCZ
	mVXVa9TjqHVF6MgOYojxLcp0Sj4xsqqtyhBzpYbeQTvWUa/Ab79pGbS4
X-Gm-Gg: AR+sD135RqDec9kvM6XSwm6o6Hy8sLrjJ4/H0QU4qg0wDPWyysigVG0ZzgiMEr4pSKF
	WcUXkY+lc8JyQ8kesxgl/kV4Gs08A7h7w2wKBQm3jOP3EzOzA5Jn4Cf4mWij94IJcjaTtlpCA+P
	a5QWgwbOClyre5KibH5LHnAn9QVBVgFkJK8NsxyRzLlfC9d1htVTjxt7M8yKYLl62m4+kJIcPJ+
	9hxbEDIeE6FMzusEcRTiq4Ewq1uuNeRphAfeZL1xJSv/ISo5VIka2LV6f++ub3+5Jp2PT5Z2okK
	Vto9LcDRrpHgvMKBPBKtmhqRe0spfxcNa3TLeNZCHjx/dLpyqQVBvo/iAxfegS2OnASEUXzIZ3F
	CJBZL+SvlneXEn5NSBbLn6bR+SKEJGjbiF6pMi8km/vDeCmwYJqkq5DjSg4knRBeOzv4vTUhsZV
	OpVoPtRPTxlMLoo9dbQzcxOzOC1Hb0ZLp7Iq6Ab39T03WDnjXNu6EwUCHLhcXIquxglK7GGlXVn
	6dZklN5PD6Pc4TeTYLZ+H4lkvH5zQ==
X-Received: by 2002:a05:6000:2c09:b0:482:ea47:4488 with SMTP id ffacd0b85a97d-482ea47452dmr482725f8f.8.1787752436403;
        Wed, 26 Aug 2026 06:53:56 -0700 (PDT)
Received: from MacBookPro.lan ([2001:861:3dd1:ccb0:7ca4:98b:a443:98d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eef5sm2845154f8f.1.2026.08.26.06.53.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 06:53:55 -0700 (PDT)
From: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
Subject: [v2] media: ngene: Remove all unused headers in the ngene-i2c.c files.
Date: Wed, 26 Aug 2026 15:53:51 +0200
Message-ID: <20260826135351.7473-1-elouandacostapeixoto@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check all headers individualy to see if the driver compiled.
Check if some symbols from those headers where used directly by the file
using grep.
Use the script scripts/checkincludes.pl

Signed-off-by: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
---
 drivers/media/pci/ngene/ngene-i2c.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/media/pci/ngene/ngene-i2c.c b/drivers/media/pci/ngene/ngene-i2c.c
index 2e9e9774dc6f..038bab38db36 100644
--- a/drivers/media/pci/ngene/ngene-i2c.c
+++ b/drivers/media/pci/ngene/ngene-i2c.c
@@ -10,21 +10,6 @@
  *                         support for new dual DVB-S2 card prototype
  */
 
-/* FIXME - some of these can probably be removed */
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/delay.h>
-#include <linux/slab.h>
-#include <linux/poll.h>
-#include <linux/io.h>
-#include <asm/div64.h>
-#include <linux/pci.h>
-#include <linux/pci_ids.h>
-#include <linux/timer.h>
-#include <linux/byteorder/generic.h>
-#include <linux/firmware.h>
-#include <linux/vmalloc.h>
-
 #include "ngene.h"
 
 /* Firmware command for i2c operations */

base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
-- 
2.55.0

