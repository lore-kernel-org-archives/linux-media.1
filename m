Received: from mail-lr2-f2.google.com (mail-lr2-f2.google.com [74.125.230.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFE7348C61
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 16:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922612; cv=none; b=h26MKI6KVOYHdH9OQZHsP6eTV/YUPC6Q+6FucwJX0d87KoWaEtZmQCNeSmc/gX9YAUkADVj9DzBjLnJ0iE90E6e1HhgqEJejOlLh/FhwoSV+/hRfPk6ulUxa6YGpTQjvH5PfA/SZ1bK2v+ND6AN8xq8xWuKQLjCxWXg9mJNMtyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922612; c=relaxed/simple;
	bh=k30cR6h+RPW1gcNU1BwUBkaFYa5qObX1UgigfxmYQ58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rCn4le6W758ub0LAyD8tpJ/r/NRYWlwbTScW47dK3yN3jSyZ02jUbjRcdX5A0Gr8FlL+xLsUNglaRbYHBJGLzu2v2VTEnjtRiA+j3R4HnhNTfDmTWdBgz7+sR3beODn9Pc4xZNKcWdwJ00yg1dNiG8TpuyG8xBZ/WkrwdoOxfgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fy0g04NF; arc=none smtp.client-ip=74.125.230.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fy0g04NF"
Received: by mail-lr2-f2.google.com with SMTP id 38308e7fff4ca-39b37733ebcso1252821fa.0
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 09:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782922610; x=1783527410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lg/4RBwTmkTv5jzQw0tnWKVvJ1Hf1WuMBjrfFGp6Qy0=;
        b=fy0g04NFmUOj9dvgHappKO3pJpAi3Xr6q5PIE8YZNpcY1kkdx4pBI2Wf6t7rqVgWdL
         zKAMd6wX82uzWEGr+M9xadgU2f3nYmiPh5+ZsWnO5/58SeHrc2zQOp9bwMONL5a7K8b4
         kqYVuUFOQjZ94tmE0/ljgzkBFxEfoNFefjAiBLLjhdOgc7ExKUGYPCC22PYSwweD/NqW
         GvDLw252l/ZGkoWarpx19MmAPsr7i6W884Biyy3q++ZCdneeiFudWyHpEb6ydsAJFKQZ
         bfO7ecLGXqUlkUfB+AUSg7sJY4z0YEMIbwUfY9K1GmKyCS/98ahjpq8jvGSLuBXAHjfX
         auNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922610; x=1783527410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lg/4RBwTmkTv5jzQw0tnWKVvJ1Hf1WuMBjrfFGp6Qy0=;
        b=raaG6BkfN9t9v31GUDr4gCzVAkZd2R7JQeN938tWAUPuKfsullNoZOzM9iB8bhhj6t
         arAN/1dQmPQmroGsoeUtEgz/HqHSFeKG5nJyxcfz1ikTvopx8AtAC3hvID7XLyFG0LTv
         l3b65QHRSjm9fcjGJ1f111JiT0ueAqGnqFLrqlMsAqf7jeGqDNklfiXuq3TABozxaJ+V
         FLyG+AGVaYCJSMa+cf0K49n+LhT7Mb4KB6+GvMyAjky+4JFJ81uh4vVDcknPOxh+8LTa
         P7nGgRbx87omLqfBWv5Dib4gD1RnLAvOhzXzFxlwMXc8SRipbGVawzmpEnIebSqvRyOr
         ld0g==
X-Forwarded-Encrypted: i=1; AHgh+Rr8t16oEW9IdgfeeW6spMj5ngc6c8RdhtlLCIXvqWi2Vf6Tolrm6q0KZpuJ9w4tG67Lx29sTmfFBUHWTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnM7TFkK6EwZla8+49h9GqrKVqMMyDGopp4sDu7oxXmiBw2LbW
	4JgT3Sqyf2ddw3fwyyiDV2Gzi3VgrHAPnwVKdm5nipEVXUgXSuXH85Si
X-Gm-Gg: AfdE7ckZ0pTZ6Lz7gkk77yZ1IBzVKjgzpOe84Krq3GxGeYEMLmihTAGZ+RoaLwzQUPF
	1lTW1ZcG0kGM0HTVuOwnUYY0HchkLiCgN8zea1zIWGh8ikKoblxZsqMkF29tsP4uhOCeo/jBFpq
	G2aU3utsORiPbpDrz+y0v2g0RJl9s2tpIioELQUXlUB1dPG0e8lFrwqzGc/qrObRKvIzfF92s+7
	REHP54R+V5W6L/lpOHfMdVZ5bkZXhl4j97fSGDeeeGE+3C9vkfLI1R2kFFsBdxZJ5Mb3RshfK51
	fLeS1ERZHvCQ1MJPNZC5Ru9VwvWVijtzURJdYrGm63kZ6jh+2fHxqI4/HatGtPW9D279fl4p2sQ
	LNo0rWJ8EK7Tat25b/55JDKya4nbe7fDPu/7clRvVTkxE0vjOkgMJQfCjK8w9lww2tlCG6Q==
X-Received: by 2002:a05:651c:1516:b0:39a:e29b:78f8 with SMTP id 38308e7fff4ca-39b3705c516mr3385071fa.36.1782922609467;
        Wed, 01 Jul 2026 09:16:49 -0700 (PDT)
Received: from arch ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b37ff0449sm964191fa.38.2026.07.01.09.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:16:48 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: error27@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Subject: [PATCH v4] media: atomisp: fix block comment formatting style
Date: Wed,  1 Jul 2026 19:14:51 +0300
Message-ID: <20260701161451.5442-1-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a block comment formatting warning reported by
checkpatch.pl in atomisp_cmd.c to conform to the
Linux kernel coding style.

Signed-off-by: Bohdan D. Marcus <bohdandmarcus@gmail.com>
---
Changes in v4:
  - Fixed code indentation (removed excessive tabs) as requested by Dan Carpenter

Changes in v3:
  - Fixed commit description line wrap to be under 75 chars per line

Changes in v2:
  - Fixed author name and Signed-off-by email mismatch

 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..d4c823f18cab 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2520,9 +2520,12 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		if (sizeof(*cur) != sizeof(dvs2_coefs.grid) ||
 		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
-			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+			/*
+			 * If the grid info in the argument differs
+			 * from the current grid info, we tell the
+			 * caller to reset the grid size and try
+			 * again.
+			 */
 			return -EAGAIN;
 		}
 
-- 
2.55.0

