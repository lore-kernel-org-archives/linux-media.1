Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73CC38E8BD
	for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 14:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470177; cv=none; b=qogdo+y9Wrn1OILARTMVRAdskwWksPqi1JCznCzdkV5TdbD5Hbqic0xlQ+qSc/65WATQjx0EzDdsVEEwa0f6dHK0yUSd8sPS9dM2IzDHUegoJX6Dmm1R8qIsZ76Zi148hnc7HBiVhqJUFCZr1/pFUX2JYZq6P0nG0+ECRYzyrVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470177; c=relaxed/simple;
	bh=VyoYZX2D8OpDlEMmDS96qc0SFFUHyp553K5Y3reG7BU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qVoxDgNubal7GmmH//knypzM2edW0XSdjXLVEyie+FtK2uzBHzfe7L8/uLkiPjhSRIIAXnUJcGHbqp5/bHemqN+M7FxJPgDqDlm19Hch9kdPNK+GHiAKZvYqEgqxxBMzH7Z1/5s/GiiWNBwrH9tKvmwUbAKl7PiJGbzyv5H/X9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYJSSaGB; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYJSSaGB"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so83900495ad.1
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 07:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470176; x=1785074976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/VsDwgGBi6jRNk4FQjDctfybeowX+5DSAIGnbjWlZPo=;
        b=kYJSSaGBOHv5hVaMNYe/m8Whq5DhxMbYr2RmTOU1BZjYOEHgU6/aM4Bqla0SZNzhnm
         MEdJj4i5Bb7Igq3YjAFV8Gop9+G187AxgywRsmkQIgWYO886KJ2FNazcmxGz97bFgoXM
         Z0Y0mo/VCYv3quymJk06JnpYhJbi/E2AAdX+CwXRlK+wFyTtVYUJ9aBPzmEarw3RWZtt
         gc83vwjfy6W9ohacCgeU0Z8c4p3+NqlL/suNuT+rX8dus8QgxRUbghZdntVJ9+6FccYa
         tRBJaq4Ysnv+VXtpihuvXcYdJ/JsohudYk0mFazTR9To8pxDUzq3dZgjNB9nPyYEGEcV
         I0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470176; x=1785074976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/VsDwgGBi6jRNk4FQjDctfybeowX+5DSAIGnbjWlZPo=;
        b=rmYYcA3JDamFBOMtQbn2aY6MaG1ql19fXdD1VOI9ovqlgcidsVGrTlOux0pCROK0cs
         /yN+3anWgSr95w9yOAu1teCOOe2uYyesMcNQDp7gm8Q3ZIYcaTLMlIxUzfGJ98rXuS3o
         EZMGofvL2yUlQLx/hhS29mWP19S/gtm5HxJ7R2A5ROGY9ds5n8alkYKWOP6Ms2u6W91t
         LjcxipmxbP44jJGymB+/VGP2bmP04UL8RGeZAQgXgi1KI4TsjjFYokTOibPHeCuOjkfW
         zcXuPR12YJe2Fv6wEdwn6JTqZZSsAI6V7NhhnWTwTIQ/d3E4v3q1yAAvQ7soVbPXqqVm
         a2cQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2SGXcH8l8TVUki52PMmDAZh5MvHaA1wP5DQRNPNvRhE41meNtsvxg5hrRjgdq7IMwSZOXGZQBzklyMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9QdPHmf1B/aIEKUTzZCHt4d/NuasHY/prlpfrVDs4oPJiZx/y
	atsb8M2npv1wwfKGhKqnlXL4xsMOIVZ0pGGOXOLh5nLXvrZjt8FN7Fyb
X-Gm-Gg: AfdE7cnrSYUolRwOWtwa+JEzqqDG3hJaXMq5H/5+/L7ZmdlW+iarA5PCpK6zn+orWLG
	hW8g06StbUws1EZ173K9CqVUC55i9O+8f039AeArpwaAqWkh2jxPtTJmLpIQfw07bbJjbBgkpfz
	X1lr7Z7lmAP9ew8zhGiDx3KEBl/mGkSX9Y+1a7TJ3yMYi0QkNsQOVeUn+k4khqvJa0yAHHWfcnH
	miXZ1Ylitq3BTElphlo1Wnz4vBiIFp6NO11nW/vcpunen43gsJc00V4agySRbIUgJ01Mu1LKxD6
	UERtiPvz7W7keXbajbty+vUNGMvaW1t0pSTBu2HJDeUESTzIqoAB5LCWsLIJNjDA7kFr3/VoRVD
	xyHGUTngIGzdvBYZhHkcHt4K6nLtWVDCTSUJEmGKj0+GIRi8cg4N/B0MSrYqQrEKdhYNU/8rt6F
	QvqxuQs7lbjbKiPUj73Db12US9fLUG9s0KGMpvJ2SGtOjy8w==
X-Received: by 2002:a05:6a20:9397:b0:3bf:82c5:ed13 with SMTP id adf61e73a8af0-3c3ad8eccf3mr10908276637.38.1784470175969;
        Sun, 19 Jul 2026 07:09:35 -0700 (PDT)
Received: from UbuntuOS.. ([49.34.211.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20bf96sm26738331eec.28.2026.07.19.07.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:09:35 -0700 (PDT)
From: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Subject: [PATCH 1/2] staging: media: atomisp: Remove unused and unwanted debug module parameters
Date: Sun, 19 Jul 2026 19:33:49 +0530
Message-Id: <20260719140350.8266-2-prajvalchaudhari733@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260719140350.8266-1-prajvalchaudhari733@gmail.com>
References: <20260719140350.8266-1-prajvalchaudhari733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused module parameters 'dbg_level' and 'dbg_func'.
Additionally, remove the 'pad_w' and 'pad_h' module parameters
to prevent userspace from overriding internal ISP hardware padding
boundaries, leaving them as internal driver constants.

This addresses the 'Remove unnecessary/unwanted module parameters'
task in the driver's TODO file.

Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397409..5c2f5996a03f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -44,17 +44,6 @@
 /* G-Min addition: pull this in from intel_mid_pm.h */
 #define CSTATE_EXIT_LATENCY_C1  1
 
-/* cross component debug message flag */
-int dbg_level;
-module_param(dbg_level, int, 0644);
-MODULE_PARM_DESC(dbg_level, "debug message level (default:0)");
-
-/* log function switch */
-int dbg_func = 1;
-module_param(dbg_func, int, 0644);
-MODULE_PARM_DESC(dbg_func,
-		 "log function switch non/printk (default:printk)");
-
 /*
  * Set to 16x16 since this is the amount of lines and pixels the sensor
  * exports extra. If these are kept at the 10x8 that they were on, in yuv
@@ -65,12 +54,8 @@ MODULE_PARM_DESC(dbg_func,
  * the chosen solution is the next best thing.
  */
 int pad_w = 16;
-module_param(pad_w, int, 0644);
-MODULE_PARM_DESC(pad_w, "extra data for ISP processing");
 
 int pad_h = 16;
-module_param(pad_h, int, 0644);
-MODULE_PARM_DESC(pad_h, "extra data for ISP processing");
 
 /*
  * FIXME: this is a hack to make easier to support ISP2401 variant.
-- 
2.34.1

