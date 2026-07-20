Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793DC367B8F
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 11:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546900; cv=none; b=BY40mEEfIoGrqfQSpQkOLhZUWvMtsKwbDMl+JECIuBpOGQISc1oMydAqr3+vuhiO1H917PG1NZY630baSRsmng8zDMLBe9ykN285Y17CtiyPWHAc4Mo3hbzmctVjNjktpZOqLYJIQQ6E8VUjx29am2ls4zX5viyCXYRTvBh7CMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546900; c=relaxed/simple;
	bh=gYqI5EtspGPwx5u8iW3Fmzod1dv9OA0p12udKiIMvME=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MICggHw4pd3lGNeDTlr3eSddfdnQ5z0uULPcKV1HzGweofjU7eL96k00GnQWkXL9ZUZ45kdA6weTxzMnsf4UFUP0XUoCbbvwFmQKyDXuH32+W+ad7RKcJYnaT/iNblT9nqIq4pWwbFK4hE4P8ddkjkZ2AgK07+LStmzvDN1KXSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwamvRO9; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwamvRO9"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e88b60121so324095a91.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 04:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784546899; x=1785151699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQgOhqe+fAH2CG7iQ5S0HRBskMHSjjsvcQe+rh+kcis=;
        b=JwamvRO9bYgRhU0dL3jEA9yREI3WkzNOPfB8/co0WE8SC/GuJgyOEGpUIPyAc8jSZ1
         YxzicDf4mDq8SQCD4adrslZWBnD+yuYRBsezES2m/7tQtv8V6K1pDTxm2GnITJtYf/fY
         fWzAeGJvuCLhKmS9wEvi7X/J+tU5g0Mv9yTo5r7IyPZ3K3uewBKdxBCaeZ6IuiNQKNQ7
         9WdGDX0Pmbvcn+xNOZ4j6uSDm5ONgyLVdhIUmcUTGwowfitT3IZTdMJpyZRhoP+Wn9/G
         SzdsJoin57MEjwUxpmlnAxB0C6jxQ4Q/sfA1ncgQFZVGg9NNysBAWaE5O94pD+cviGRg
         vfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784546899; x=1785151699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQgOhqe+fAH2CG7iQ5S0HRBskMHSjjsvcQe+rh+kcis=;
        b=F6xl446+oZwaQxxd3/Y5LyY2u49pe7mEjhWgBs8os8/c2qc6E0cKXngPsvv7PP2o6Z
         ifoSzHgTcgzIf7jBviv5HpXMcyUd4Rfkjd2iGtLl0uwZDpCYtNz23z6E3nkJcnrZr0q0
         z8CJPE9yi00o/Hm2HsA3W0p9PH6tQUx6NijMQFL5GLbEXVigwLYzqHGHZQrK6dJzYni5
         vybFArZE+Txmivwa9zplNwKLb89zVgymmIWdFdHGxZrRdszVXmO+F00ZViPs1xXCfLGN
         yZG+Qs99iFwu30PpXrkSiYflD1XhhpX+IMGOc6mYYO6zlSmlx0G4NuKVN3RN98iSZq9G
         1WPA==
X-Forwarded-Encrypted: i=1; AHgh+RoQ+z8/okIMHqxktoddnfWymlti21WHbgAQ1XJfVvoZQ5rIVoQVeHYwdwJF67V0raDFJA3l3SSF9bSaLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUE73/JllkoXdtU/Ndpf42rvfHFxAOTlmSfYxzc1UH04ReFBpr
	2jq9TZNWz1s5/FN/aYBaide+l4B4et6InPkNeJWdc+MsHEb4XD6sEcSI
X-Gm-Gg: AR+sD12K3kuMjE0QIqsLHbDSWD+jO2aVRVvbS55hoxx8YDGCPtG6g7ccrqo/ZPurxFu
	s9XJ+I77Ae0TtA6u2LTqyiIy9qR+qcn1+3noPkYou84Q8so3DwqqF3ur4da6KZsLxJS01CqGzam
	qLpRMr4eJUPrB3SA1ZiTXRmxpMvBYI4ByZHoPe3eveKWW/mPue4HlAbje1cl8veaNxZkr+l23CG
	RYAez1c1B/eWxB8futS8G3lWfXo9FWHsu0Wsptw7cojgpAovE9AyhALDZ748sgc/K4oV/ZUhDG0
	atT0pdQFv30GmVmTcvygFZBDzuM85k48JEr0HHe4/BB2RjSTgVocBwEHqZMAxVJOSKHkbGguDfD
	uUfpZSFUFhF+If60+C3nUbdNc/hIDpxKPU5xKK6XZxDc7qm496vdDzD6sE++uIXGfKxYN5jxR+0
	ErvyC1X3BLJWRpanabkBnpof6Gmw==
X-Received: by 2002:a17:90b:58d0:b0:381:c500:b0d1 with SMTP id 98e67ed59e1d1-38e4b530574mr14528440a91.20.1784546898632;
        Mon, 20 Jul 2026 04:28:18 -0700 (PDT)
Received: from UbuntuOS.. ([49.34.174.103])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29ffb13sm30500198c88.6.2026.07.20.04.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:28:17 -0700 (PDT)
From: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: error27@gmail.com,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Subject: [PATCH v3] staging: media: atomisp: Remove pad_w and pad_h module parameters
Date: Mon, 20 Jul 2026 16:58:07 +0530
Message-Id: <20260720112807.6348-1-prajvalchaudhari733@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy, Dan, Hans,

Thank you for the review and catching this. 

In this v3, I have completely dropped the changes to the debug 
parameters to keep the staging debug facilities fully intact as requested.

This patch now strictly focuses on removing the 'pad_w' and 'pad_h' 
module parameters and converting them into internal driver constants.

Remove the 'pad_w' and 'pad_h' module parameters to prevent userspace
from overriding internal ISP hardware padding boundaries. Convert them
into internal driver constants instead.

This partially addresses the 'Remove unnecessary/unwanted module
parameters' task in the driver's TODO file, while keeping the debug
facilities intact as requested by maintainers.

Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_common.h | 4 ++--
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 8 ++------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_common.h b/drivers/staging/media/atomisp/pci/atomisp_common.h
index a2462fc306fb..7c6c0124ff72 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_common.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_common.h
@@ -22,8 +22,8 @@
 
 extern int dbg_level;
 extern int dbg_func;
-extern int pad_w;
-extern int pad_h;
+extern const int pad_w;
+extern const int pad_h;
 
 /* Minimum padding requirements for ISP2400 (BYT) */
 #define ISP2400_MIN_PAD_W		12
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397409..d117fea2860c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -64,13 +64,9 @@ MODULE_PARM_DESC(dbg_func,
  * output res, and isp output res. however since we do not have this yet,
  * the chosen solution is the next best thing.
  */
-int pad_w = 16;
-module_param(pad_w, int, 0644);
-MODULE_PARM_DESC(pad_w, "extra data for ISP processing");
+const int pad_w = 16;
 
-int pad_h = 16;
-module_param(pad_h, int, 0644);
-MODULE_PARM_DESC(pad_h, "extra data for ISP processing");
+const int pad_h = 16;
 
 /*
  * FIXME: this is a hack to make easier to support ISP2401 variant.
-- 
2.34.1

