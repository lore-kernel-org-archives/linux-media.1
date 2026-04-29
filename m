Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161CE341AB8
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476401; cv=none; b=b/iXa/2pLKKH+kJ2MSmyiklEVAi8y7BFrih1kL+NtRdqiaL2WP7r+WireJE3FkXevP5C7h2RE3YTxiFHGZyePTssl7Cd1hDAxW3iDZ/5jeYuQwiEq30dLu4rG5VFvzCrBSV7dcCqLBgftLoQD18DR7qS1X8U4vk01BnFxWJ7++o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476401; c=relaxed/simple;
	bh=TNbU8+MjC7fg+gzsTlY9VKgO7+m4Z/JOjzFMK6wCecQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AkBk8cLt3GeKm0fUCPR9uXN00PSxBTgxjWR6EUwpu8zyUG0oPq8/DgKRJxj3qqXTMr2c5AM5iIY2YwjciJRgy37KsM5MbgVJTs76CF5dIrwn3XtbF9KlvfECZ/c6Ml8zn8QbB5vMvhgNGcde2CiNN0ey5eEEuqGqzjFRTAQRCiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAemwcGx; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAemwcGx"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8d65f4073bfso1683230185a.3
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777476399; x=1778081199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XS3dtDxzU2kxeMHxbKYApVqMr2WXis7MX2GRKVmVEqQ=;
        b=IAemwcGxM8zbmFxK+EW+u/+y8ZxXmhBbR4Ajqkwx/VZf3T+pUCjCQbVav4pGDVWYJg
         4ewmZ9ViwlKPh70FXzQI8oCCudqX28IOmH244hcq30rTfQiE8kHsE3z5zJO+P+n/Gdab
         SpfI8tNkGJcwgter2zXKwtwrisMpr62i6MlRWJjN1988GmTH5TozYm7Qi9yCrVyaBNxu
         2ZWiqrZ0v1WRltHpAfJTE6ouK0ZSll+Zw/Z/WOYtukEyrElfLd4tEuJ6ecFlH+RxvjyU
         m10hrsrX6ajqH8jDKc28xtJgVHZnYyh7PDyfGpuolC2CFSae5TEOvyuPGkwaWd+KbA5F
         dBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476399; x=1778081199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XS3dtDxzU2kxeMHxbKYApVqMr2WXis7MX2GRKVmVEqQ=;
        b=fyewNap9tbO9VvqOjAgqrwTY7+6DJcUNRexZMVzpz8Bd2HeToIbfEjHJV3mDI6AmZX
         djD3lxghOCS9S/Z6SKPZrbC7k1Ra4Vm+XxVyWZcJMOu7KNVFNqXFGh8FZUyI4tKCHO5o
         ZzQIKxCo11bQbZViCp06br63tdp556GejBoKJioyTLynMfOxPAD/cCBGjHBdke7+J1Nk
         FL+aMV6/p5lv6hSoJ5n6xMnz0N0tCj0FFEQHHlEg8z5IUVDfE38FgMRo6/ekh9IDzUzg
         GWj22VJyBbobHLDB5mylYakTGwAuKv4W5MpaEbcagoemGBMQ/FIp/2notnYQw5cW/53n
         Dbrg==
X-Forwarded-Encrypted: i=1; AFNElJ8eKGiejs3wbYvUXj3DmY/UwK0wdnKQvH/vSecssCTnQOnKnhM8uJDpdCjgavThCySwgxbbQYkxzQxGVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuriKrmDq7rBSniWQxPHrdxAUuzWgnPxEWAKsGrOMxF3BpHS1i
	45BQMpcFjjl1ikwP0eowoAcGbDXMbV/7q0PFWFR6KL0mQdYvyFlZ7aum
X-Gm-Gg: AeBDieuIMgB+OLNfGwkQsT3MaP/RImomEyvN9XjOJuwitj51uxks88slXmA9R3yanP8
	VsEg192UB8oj+/VjPMrOr61ooM3t0rrNvUjLTXdg7Nl+BZ+hxnliyzibZi6WyNqO2EcSQNFSqFM
	hU2aXH6aITZfnJQtZcMEZfKUkv891RHsT236V2FNMDlPstyDHYZnWpif/+035IaMJhAeJ+bPi0B
	U3uNJTSv2Zqgcs8FPviFv9o63thbWALcURUdvyfTkDgNpLcFRlY/Un5KZt48eVf9habpAl7VmV1
	2scTdN+ai715L4HCIk4zHyMCt/P0J5nWIoH+euuslXCvjYF5vixcYpEneChxQkjv35xlB9fisRp
	LzZE7/rPPD6jOAl96kY6nKyQVVUJtP77RlvBxkSk+tXxDXWZy744vrEtNz4w9efczYdv23JxbtR
	+B+rKtgksoesEgOjsYym9nmxiCHeqF6SrFYgRPbXmb1PCCqY7aZaMG+JwkmhLKdUsX/dmg
X-Received: by 2002:a05:620a:4081:b0:8eb:73f6:b5a5 with SMTP id af79cd13be357-8f7d950233cmr1109929485a.44.1777476399131;
        Wed, 29 Apr 2026 08:26:39 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:84bc:8954:e2b9:d27d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f93f583408sm202219285a.23.2026.04.29.08.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:26:38 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: neil.armstrong@linaro.org,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	khilman@baylibre.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: meson: fix typo in codec files
Date: Wed, 29 Apr 2026 11:25:32 -0400
Message-Id: <20260429152532.29302-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake: substracted -> subtracted

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/meson/vdec/codec_h264.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index 89e0f8624e5b..a6074de15118 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -16,7 +16,7 @@
 #define SIZE_SEI	(8 * SZ_1K)
 
 /*
- * Offset added by the firmware which must be substracted
+ * Offset added by the firmware which must be subtracted
  * from the workspace phyaddr
  */
 #define WORKSPACE_BUF_OFFSET	0x1000000
-- 
2.34.1

