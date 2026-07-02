Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D25F35F165
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 10:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988498; cv=none; b=XawmHSpYcXB9Xq7No3Pbq1yJzIxOzvHf6pgSIJZMqMlEyd7ZrTOzFpXxS3x1Z1ui1A27WmXs460zLQHG6uG6XomntJjwTKBxpVvGaAAfiB0WpD6jq0S4m1ZHt/4BovBYvWTdlsv8FZC7ANPKwQMZN5zJ8622Lh1xlo02lzeLQ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988498; c=relaxed/simple;
	bh=TwrDbLi1pC9WUNSqUhhC59vYbXMRR3WpZnF2BmH1AvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B0o5pFaBu6nxU3uqLriXF+mdrUpAjcySqxXHdyIuxxl8LD3m/EpQltF17rarC08V5HYr/pVPd6Z1juqGPoA4ZOm4AnOKzVMA3dwejB7QB3nfTnoRIJTKEX3gVpythF/jPdYaziQ3ITDiuBCU2LqEpBOTfvDKLWQc0Qggct2x//o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pTIkwMRA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pTIkwMRA"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso5893035e9.1
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 03:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782988495; x=1783593295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2+pjaQR7lTb4k2svNO+Lg3ruGFNjqRCr8CkNWwxNNeQ=;
        b=pTIkwMRAdzIb/f6vG5X4dlyERtkuS1TVl7bcSCBz1/wYtAsfF7i7dw4Bux6VVMZzrc
         JwUwMxCkqwQhiRiIN0bdBQgCj7PSOKMIHuux8VNi3Pmi7iWvKTgigZiQXzJ5RUOGRV80
         SZQhV9zZSMc8jNh4skkl8xguGdjX6mwTc5zC2E7cfP/UOnOnbVs3ZDxIbos9+qyJ5t8d
         JzbpjdH3SoCF/t+H9hr/ERwc9yoLBDw///g+asyBgY1HLHFzH5XkJdNrJNx9bp+/ZKR9
         JQkDIUD+8ZqkpzbDSwUSz4B7zuYUI2kv6QilXb3O+eJJ7CLZQbTObfILqibgNYoeKcMh
         A9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988495; x=1783593295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+pjaQR7lTb4k2svNO+Lg3ruGFNjqRCr8CkNWwxNNeQ=;
        b=n5C3ilKOWh6ozxsErstqPK4jmH/FTk7l7PNYVwxfGEiRSCgDB4D2mDJWKHR2a0F/at
         q2+PurfcEIDkg0+Bn0OyZWYYJx90mXbw3fb0JbtrdhtSduidpFU/BlORbW+hcn/2onrA
         o5bHVIliXJN2OggxGe0O8ZDQwe1gYNWdNq4OboAHiJVe6ngHI22csLlXUuj0YOW5khEf
         yX5SozOpq+n1ge5YZJwuCc1Hn0DjuB8LqC6G9DLW2qpUpTPn9ssjOncqbLPiZm/a22AB
         DFoT+HwxIjaRx5rkSgcLgZkjdkFViSfFFQu3AtvsdXMM5LTd6oTfpw0vRbfVKpBoVJLF
         x3GA==
X-Gm-Message-State: AOJu0Yx+ES4tzhDTx9znPYlXGGMHFENVC7RKaYE2unTbxOvlYgLQNcZZ
	o84qGsUxwAIgkKoaIwLs571vGW5wJqToCtaXzFSbYj07zJ3Gd9DHSQrH
X-Gm-Gg: AfdE7cnIDiGOdj9FUagEv/IPvQGQ/DyAswCRozHsvfiK/g4Bh97YZ6wsRDqyV2LZI3B
	qpV+yaerL0/xzy1yn+vdzjX5W2V89aJAHzoJ9Bkw9dQ0hLYEC3vyVbCljGe9d+6DybYr87l5189
	oLTD2KidEUVg0iZlOOlyk0AnKtjsr5Q0wOGdygjM5nob20m871YQ60QdciOgeMp6dJVDHPcpqMb
	dzkKPnnigZVD+OWZnR33f+5DF1Y/nTz+SiHyQNTmLMq+yHEu+ZpEW2o7ZPmoRqZ5EtYQcaEnPzc
	WAlP3C1oJ9gR8nBep/lnvsCwIZVfqV8SzrswNydt13AHoKzHc1P3S0+T3BOrmbv3cEjnRqYSu0N
	7oVHnijl8+j8LIEU69ZkJcmcWtr63BpdSpGbXfuLxZY9feLIESzneX5XLnvFf2JgHM5oAJkB7zV
	0OHgO1UEe8pHm8LHOmJMdfLe4bNtcxUKiYgU4VP4/jvDiKFYqgMa//rVRXeirLG+1+Ahh3k76j
X-Received: by 2002:a05:600c:4f48:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-493c2b5400amr95863795e9.15.1782988495335;
        Thu, 02 Jul 2026 03:34:55 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636c8b9sm39551155e9.10.2026.07.02.03.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:34:54 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mali-c55: Fix unaligned access of AEC histogram zone weights
Date: Thu,  2 Jul 2026 11:34:53 +0100
Message-ID: <20260702103453.348056-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mali_c55_params_aexp_hist_weights() packs the 225 per-zone u8 weights
into the ISP registers four at a time by casting the zone_weights array
to u32 and dereferencing it. The array sits at offset 10 within the
parameter block, so it is only 2-byte aligned: the u32 access is
unaligned, which is undefined behaviour and can fault on strict-align
configurations or once the loop is auto-vectorised.

The cast also reads the four weights in host byte order before they are
written to the little-endian register, so on big-endian hosts the four
weights packed into each register end up in the wrong byte lanes.

Read the weights with get_unaligned_le32() instead, which is both
alignment-safe and fixes the byte order regardless of host endianness.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-params.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index de0e9d898..1aaf64dde 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -6,6 +6,7 @@
  */
 #include <linux/media/arm/mali-c55-config.h>
 #include <linux/pm_runtime.h>
+#include <linux/unaligned.h>
 
 #include <media/media-entity.h>
 #include <media/v4l2-dev.h>
@@ -203,7 +204,7 @@ mali_c55_params_aexp_hist_weights(struct mali_c55 *mali_c55,
 	 * of overwriting other registers.
 	 */
 	for (unsigned int i = 0; i < 56; i++) {
-		val = ((u32 *)params->zone_weights)[i]
+		val = get_unaligned_le32(&params->zone_weights[i * 4])
 			    & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK;
 		addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
 
-- 
2.53.0

