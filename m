Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795263952;
	b=SgbczkwfNhbPjj2ak8sgOXAMC0mK9hzsp785YEa8SioFjLBeXgyZcWm1djxcgx6WdbKc
	 wT1402x81t7GHdnbp5L4BOL94w4e+ibup8IKt25xhsuuh8Ot4SkREFfDefrniP4bm8d2l
	 ecVsx3GPTBvlSR0Ix1gGYfB8Ed4xsVa6we0Nc12AOmz1fsBBU9c+K/+0NVXMMry5CtQ8W
	 mDvh0Y86aVNQ1AEHr6un+KjrZ+Nt47ul4IhRC9MP4ssECPlY6uDzpM3Q4YEAcPCEdVeYq
	 SzCWpuHd1YDVssErOczrlC+SY2RWcj6cKZWOWY9yvk5WMsNYTLz6nmb5Cz7T65LCaBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795263952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jIad2Olj92CNzs479lQy7bfwjc0bTVZb8HfHFWlPwwE=;
	b=JfaLX/RrMiTpIBtdyFNvBCAuivhvhg3QM8LTMyOApdHjjLySHkb41xr06R+T8eHSQ+P2
	 nwMUHwMCtTW0A1qMHenV5gL2hfZimcn6iDQdosjbbA3MdcRXyaUYBkcwHMfEmXIqSZUTw
	 mXTVyetFyoeH457EaaDYj/2APy8Owwo8mOUxoSOkgs+IcZYKlSYS/rnj+4S/17CJkjjcF
	 1888T2H5IaopvWGfOnkzNh47Gt+rA7soFIzyGZ6dnC5NnZHffVTALI248hCFx1+QHb9HA
	 uoyXygXENUqXiKRdyTUTEi2gaT8T1UXm2/S+V0Z3I8OYPUkPUH/yWg015g1qi6yKzbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eksHB53G;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E9E606A320
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 12:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19E9E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eksHB53G
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cde1479f76fso1171093a12.0
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 04:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795263951; x=1795868751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jIad2Olj92CNzs479lQy7bfwjc0bTVZb8HfHFWlPwwE=;
        b=eksHB53GJ89+gQaQFhKKAbEMIXH0d5Na+IHNxgLtXMX+V+Otkt2saNYJq+sWIk5mEE
         0TX9vdMOOWcifmyRSZvBSL+UovFPZ5d7Q94VU/xH2kiCRxYu1AqnIO8WPv85XsmkXRMz
         wZfB2KZidqLU1TcuraJCs3ht/7LpJ+Ow8023FRgx/rRR00NkcJK7vyxa++lRjdkMiUed
         fjRUjjONSMNje6VJjjhXmMRGbi917M7tsttfaUqfIiXruyFB3j2RVdGrl17J1y+MgiYr
         i1BINGD/+ldFMCJoG7KTRi7jtbHfUwVMCA9GEGS3SaCef1z751T/N4oz81PvpQiWfkm4
         OOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795263951; x=1795868751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIad2Olj92CNzs479lQy7bfwjc0bTVZb8HfHFWlPwwE=;
        b=AhtBW1pSjjVUxoyjRLDbfZKqj5itB6ACyolRC+2TATJbkj0mq8xjkFA7xE87ARFzPi
         mKJ7HitnntBi14iXNQYwrYW7fON5r1my9xT++T0ZUgRGfYnNFp+XA4f+4Dm9ZRh8wa0B
         NcRdPCL5ep8yFFkPsU3uBAdlsthR0KNc87zvi2gcfayqK0LCy0yuemfGEbg9A71D57rH
         Kscty2vX/+dkf2j7LCc9xNLvP8lgNmLs3hOLW3y5MMIMtZ/O4mOETPkCPNzleuceWoVT
         taxxP3MjFbRL96MkcWxK1s0s09wKggGphyz7GLmfYK99ExXKHlfmiDPVXCJu9pgQHkPq
         cPEA==
X-Forwarded-Encrypted: i=1; AL+hErF4eKSzr0KD+dLN4whHOuoouzF2r0cl7opODWBXFxSq6bsnrRbhg0g2fviFhhJpkzbXPm3T6Tc4oB2p9g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+4in90YipeqOKdtxNPkEj5yPEjqigidvT2XlkW6+FNGSEyjZVi
	vj6iyvAuhMeY3IQXYgnc7VR0QbzO0QPKVRZuinnDWD6D6RAXJV7C/1zL
X-Gm-Gg: AZFdTZeh1ZchT783q85o/qt7k8qwaMr/WnqSowgRav+bbwhlr1hhS3afbRvnODnvS3C
	X1MqbQy9FlmsBRtZyrYMExvHWfeZXu/IoAImGCj9WCd37vpqL0fQJm2R3lbC6eUvk0LvuZzkjgm
	xh4fT34vporfAGLotTZrjonQhBlwN7SXAu7aNa1TyFqyueV1M/hhToBXmjAcZI6f3m4SFxVQskV
	mdhfp4BEV9jj/MoLm63A1PbpC4Di9Z9HzuI35LHQGZRzQe58znKyUUAHjHK97bvW7D4a5eJsm6m
	/tQQr9skn5t2rYche37NKDQsfysZgW4pYAk6FCpdCGzVxu51BO2LUB9BrJvGQWSBQW58zT4M0WP
	E3aA665oUqqBKOjKK4h3poCSB7oN6GjLSgHC/tKNmIPYW3dHGG1ObzK5+GCbAR1Ug/1vDr5Xnwp
	LdCVqbFJg29JWI2IUh7EXutKzvfq3s4+880q2HlL+JRs0mwQVJ6CyBYS72intaPVBlJ8GuM7Dqs
	yvzFYOSQsCJcmixb1eMM722kMDxBiYBKENAVOtVWlURQ84r9lGoYp+BejslOdH0vV/zaa4cerTn
	nO300UiPybQnleG9gakSDvj7cjrOt5xm7wZzquDrCk1PziBrdBBPYApZwz1iVaho/Pa3Q2BoCck
	+t7TGQQsg5tuZIgm6XvI=
X-Received: by 2002:a17:90b:39a7:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3b41c8d95f0mr5500808a91.22.1795263951403;
        Sat, 21 Nov 2026 04:25:51 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.40.238])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c38sm2616474a12.2.2026.11.21.04.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:25:50 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abhishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH] media: atomisp: Remove unused ISP state control functions
Date: Sat, 21 Nov 2026 12:25:44 +0000
Message-ID: <20261121122544.428-1-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Abhishek Chaulagain <chaulagainavishek14@gmail.com>

isp_is_ready(), isp_is_sleeping(), isp_start() and isp_wake() are
defined in isp.c and declared in isp_public.h, but have no callers
anywhere in the tree. Remove the four unused functions along with
their prototypes.

isp_wake() was the only user of udelay() in this file, so drop the
now-unused linux/delay.h include as well.

Signed-off-by: Abhishek Chaulagain <chaulagainavishek14@gmail.com>
---
 .../pci/hive_isp_css_common/host/isp.c        | 32 -------------------
 .../hive_isp_css_include/host/isp_public.h    |  8 -----
 2 files changed, 40 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
index 39cccbfa3..13ea6d2a5 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
@@ -4,8 +4,6 @@
  * Copyright (c) 2010-2015, Intel Corporation.
  */
 
-#include <linux/delay.h>
-
 #include <system_global.h>
 #include "isp.h"
 
@@ -29,33 +27,3 @@ void cnd_isp_irq_enable(
 	}
 	return;
 }
-
-/* ISP functions to control the ISP state from the host, even in crun. */
-
-/* Inspect readiness of an ISP indexed by ID */
-unsigned int isp_is_ready(isp_ID_t ID)
-{
-	assert(ID < N_ISP_ID);
-	return isp_ctrl_getbit(ID, ISP_SC_REG, ISP_IDLE_BIT);
-}
-
-/* Inspect sleeping of an ISP indexed by ID */
-unsigned int isp_is_sleeping(isp_ID_t ID)
-{
-	assert(ID < N_ISP_ID);
-	return isp_ctrl_getbit(ID, ISP_SC_REG, ISP_SLEEPING_BIT);
-}
-
-/* To be called by the host immediately before starting ISP ID. */
-void isp_start(isp_ID_t ID)
-{
-	assert(ID < N_ISP_ID);
-}
-
-/* Wake up ISP ID. */
-void isp_wake(isp_ID_t ID)
-{
-	assert(ID < N_ISP_ID);
-	isp_ctrl_setbit(ID, ISP_SC_REG, ISP_START_BIT);
-	udelay(1);
-}
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h
index 78abd77c5..f778922f6 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h
@@ -153,12 +153,4 @@ STORAGE_CLASS_ISP_H uint32_t isp_2w_cat_1w(
     const u16		x0,
     const uint16_t		x1);
 
-unsigned int isp_is_ready(isp_ID_t ID);
-
-unsigned int isp_is_sleeping(isp_ID_t ID);
-
-void isp_start(isp_ID_t ID);
-
-void isp_wake(isp_ID_t ID);
-
 #endif /* __ISP_PUBLIC_H_INCLUDED__ */
-- 
2.43.0

