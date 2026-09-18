Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36363B14BC
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 04:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789705545; cv=none; b=dE7xthwoBit6Da2Z5F9rm5e5cs5mPsah9b7Lzz2Cx9E4vZwuE8MURl5m2S9FfAs6CPS5T6IXGybYriAxZPjGo7FdEkEi8kLpXkBdoRHsY5fbzU/v3h5ZFzNcJqSi8Sjcad6dTSpVGdXtwQUDXi1M1+eA9msJ0p23hs8LT/bBBLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789705545; c=relaxed/simple;
	bh=TeNGwwUv9p0OgZ9zTBOSJStvG+ir1Lawd5JFOPdHyM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X8k7/jCQyUfn9flIEuLz7KBWHrJKFzd4Q7A3IeM9jA+5ROnu7T2BUBcaT4HG/LCi76NUGRv/SkooY0vQGmarjJFV+Dw0RXjUHIG3SS+WIYvJUxDBlgDLwKgtoQhE6QCkqaSLQoLK+2Rw3lx1fHslhWg+UeAdDHAPID2+kbSJGqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOXrt/NP; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOXrt/NP"
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2db1be98255so2701105ad.1
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 21:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789705543; x=1790310343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eXqj/anFkg7WWIQ739Rhs0gFVPFrSSy6bKiPhkhZ+GA=;
        b=GOXrt/NPJN43Xuabsv5lnP2Idd0UW7LyRw3rbaIEPsmaElhQLFhnMrkSMv03kI5mEz
         EvWV9B7VEwm12BWtOXViRS0Xy5SE5BVYbvAuC//frfmLwRJmoq9Kc85rNv6yxbtLkSes
         5fR+RDDvIPf8OCpZbchQltMt8Hc4n27AfXK5vzECJLsoCYbs8bPbV6nSLANJkYrBpqVM
         e4XqIk9eVADkHiMTzY77tuhNBK1FYPMmvfNGy9oVAsk0ECFO0PF1B8QPlpqVwzLo1pQH
         gp/QkuTtvVD7/nDbv+kYLHKaSFIQ/dgA1bzacC0FS6e1HX9E7yztvP4KnoViG9Kxv6NC
         y2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789705543; x=1790310343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eXqj/anFkg7WWIQ739Rhs0gFVPFrSSy6bKiPhkhZ+GA=;
        b=v4r3mwPyAjsF8nqf3J66CwmnIpxyRaX4qRGJH4SWPNFpf92TcDJpvXcr5OvOn2eMZg
         HKfKuhkLTQF4hR8Mbsz55H3NdSM0GLxwzV9mU0lRuu80rW9GGnGSXX50fau5eC2qzAe2
         FAz3+kGmkycxuVG2aYMvUYwtSP7R04kasm8xiIA18jdgqwo4LSlOjDUHgqRnxlpbHQ0u
         ceP4CPN1D0edfGKgQzCpCG5HiyX38YXt0Oqn7WYcW6/g6iF+lNuu9Ir1pFykCvoN0ClQ
         yLiijJdFRXhYM0m/o+9Uc+NEpv7JSxX8A3Ir/i384dy9EM9dXtET3rw6HU1Ow696WQcZ
         0S+Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2ebq8bEXchyWA7NBNtgc/XK17suuxAyYqWEbjp+9OnG50NYZx35vgb0Y/7nFy25+KQn+cYLuhDI5Tkw==@vger.kernel.org
X-Gm-Message-State: AFuF++loVXm4F4WyTI7shgcIcpXY05mViZnUDDSmwOhqDHbNN+y3Mpru
	DNk9mbQI4jG8SiS0nJbAv/NTvd01xdFtzI0biwCqe4IiDf5Iwt0YPDvF
X-Gm-Gg: AYBFou1Vdj9kCK/j0ITC68DwO9vp9u6mZpf38N+msbffWzuHGKZ2+JO21bY64RsPJBP
	XeC+W1LS894Vq6Plh3wHGD1466Ndjex16BCJ3zgYFEud5xfwBu98Vu8MGhTL6QuovbL+5s/g9Qe
	6ArH9sZnsYIAves/bHJgLWSi3tXV0A6Y3F7IIPl43fx2cdZwTeeIKS90fQeulMp/IoB7xkjbez7
	z6JBOgqSeT5q426xvekfy6AvR1C5BFY20gdyG5Xf5s614zJ4f680x6O5Erz3nx8Jw0t8XMpQsmY
	gvIm+1UYbJacClep/f87HIOwV07Bj79KIIVGPd0Q3KOgd8QvoiMxfb6KjaaUpU19YoBIiKD2Q0D
	KcLbVDdAUAi1RQvijKRuINmgWtOdrg/KvxKt5O0QxgPUROXXLvu7GJ28ZKrfQpH0aQas3vh0M2W
	XoPD2pIxl7ROWTgw/KvZpNLwdVKmEErunAn0yVRE73zy/M6k8JnpIIqo2GgPKEiNW1TPrVh9rjl
	fXI9u+Wen3h6LGFQ6a32EAMYbG6ncY+GxdRDzzFKrn14Zhocu9OlCx6B0DtQI0cpLfO5uj2PF1e
	HzRjZ8OZLzGZ7WL34eSoBUIxOTaUFnyrS0ynfXv1Da9zlTl7q9eSR4omIlH+6s/QvA==
X-Received: by 2002:a05:6a21:1b81:b0:3da:bea4:6215 with SMTP id adf61e73a8af0-3dd8c52948cmr2632640637.19.1789705543013;
        Thu, 17 Sep 2026 21:25:43 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c287be968sm870947eec.26.2026.09.17.21.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:25:42 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	linux-media@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: i2c: replace some GPL headers with SPDX-License-Identifier
Date: Thu, 17 Sep 2026 21:25:12 -0700
Message-ID: <20260918042532.633580-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several files in drivers/media/i2c/ use slightly nonstandard phrasing
for their GPL headers, which caused them to be missed by previous
SPDX-License-Identifier conversions. Replace these headers with
SPDX-License-Identifier.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/media/i2c/adv7343.c      | 10 +---------
 drivers/media/i2c/adv7393.c      | 10 +---------
 drivers/media/i2c/ths7303.c      | 10 +---------
 drivers/media/i2c/ths8200.c      | 14 +-------------
 drivers/media/i2c/ths8200_regs.h | 14 +-------------
 5 files changed, 5 insertions(+), 53 deletions(-)

diff --git a/drivers/media/i2c/adv7343.c b/drivers/media/i2c/adv7343.c
index 9b91d7073d3c..2bf17cd633c7 100644
--- a/drivers/media/i2c/adv7343.c
+++ b/drivers/media/i2c/adv7343.c
@@ -1,18 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * adv7343 - ADV7343 Video Encoder Driver
  *
  * The encoder hardware does not support SECAM.
  *
  * Copyright (C) 2009 Texas Instruments Incorporated - http://www.ti.com/
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation version 2.
- *
- * This program is distributed .as is. WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/media/i2c/adv7393.c b/drivers/media/i2c/adv7393.c
index 6f948ba02f86..b00783c141a9 100644
--- a/drivers/media/i2c/adv7393.c
+++ b/drivers/media/i2c/adv7393.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * adv7393 - ADV7393 Video Encoder Driver
  *
@@ -9,15 +10,6 @@
  * Based on ADV7343 driver,
  *
  * Copyright (C) 2009 Texas Instruments Incorporated - http://www.ti.com/
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation version 2.
- *
- * This program is distributed .as is. WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/media/i2c/ths7303.c b/drivers/media/i2c/ths7303.c
index fa5b9c884c1d..e04da5519a39 100644
--- a/drivers/media/i2c/ths7303.c
+++ b/drivers/media/i2c/ths7303.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * ths7303/53- THS7303/53 Video Amplifier driver
  *
@@ -10,15 +11,6 @@
  *     Hans Verkuil <hverkuil@kernel.org>
  *     Lad, Prabhakar <prabhakar.lad@ti.com>
  *     Martin Bugge <marbugge@cisco.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation version 2.
- *
- * This program is distributed .as is. WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/i2c.h>
diff --git a/drivers/media/i2c/ths8200.c b/drivers/media/i2c/ths8200.c
index 808ef16ec3b3..00535958faf1 100644
--- a/drivers/media/i2c/ths8200.c
+++ b/drivers/media/i2c/ths8200.c
@@ -1,20 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * ths8200 - Texas Instruments THS8200 video encoder driver
  *
  * Copyright 2013 Cisco Systems, Inc. and/or its affiliates.
- *
- * This program is free software; you may redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation version 2.
- *
- * This program is distributed .as is. WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/i2c.h>
diff --git a/drivers/media/i2c/ths8200_regs.h b/drivers/media/i2c/ths8200_regs.h
index 6bc9fd1111db..6a96b6a94406 100644
--- a/drivers/media/i2c/ths8200_regs.h
+++ b/drivers/media/i2c/ths8200_regs.h
@@ -1,20 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * ths8200 - Texas Instruments THS8200 video encoder driver
  *
  * Copyright 2013 Cisco Systems, Inc. and/or its affiliates.
- *
- * This program is free software; you may redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation version 2.
- *
- * This program is distributed .as is. WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #ifndef THS8200_REGS_H
-- 
2.43.0

