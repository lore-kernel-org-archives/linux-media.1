Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8891390601
	for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 14:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470185; cv=none; b=b0ivSpamIO+k6BDhzx9ihppZNND31lCLuT9tudH5jS5nyrJg1BJ3qr9v3JTuDrEV88Kvm0VxVlv4yJqMibp5rbLBzFxBDCT5GSWt/KHUxyrZXSnUgV1IaBk6ptePWMlwuerLIjRxWo9vjDd95HtmxCocD2YcsOHB0b7lKSe3lqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470185; c=relaxed/simple;
	bh=JT5pBunVOED5YNd5Y/C35r+p54dGIHbbwJ/3rtqdFAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iWLKFvM9nB3UcEOkB6WzJfIznFFhtyO+IW5FaqyNb7XHEqP/rYG4BkMxzKqLV+WtkJyraAcTkD5wCkuBrMcAgRhxzGHNfRAazW63bOs9+wAn+5Fl3HqwdRN3wy1Ma8fEJoN9hpFJNnxwiZx+auxCzjkYiCOe6Ca2O+sT574Qvr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gulyygag; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gulyygag"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf41bab353so22705975ad.0
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 07:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470183; x=1785074983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvODTp626G7ayt7G642HB6l/p2dvUiPvXuiviwmOFoA=;
        b=gulyygagGZPmOKgsvLvfd089hgzymNc9NRLzUl0APKjO9Of0YZzzK/Xqzwrx0lnEbQ
         PNOy6xMaVsIkhBYX6N3+TvnaJYa2NUgeI7uDB7IE6zwGLx+wYrhYP2BttVkfhqdaGS2Z
         xoVUpdDQzOQKiGRa0Fgl6Oy8ViJgOedA8IFMIyHs6R0e6J4VG47QJnmnmHQ2BbjdtBw5
         txfUe2X/Ghy+bkmwsY/yC29oPdX+zP3Mk+bJWDGdC9SMQOvo2f0hFmJwxx2es429dbOn
         IjW9QivT9PFTJt6sJsJkOHCucHw8F8CTVz716rz9UMiHxfO8/FhGZ6Ox4XIMl2MfUg3d
         kp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470183; x=1785074983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvODTp626G7ayt7G642HB6l/p2dvUiPvXuiviwmOFoA=;
        b=WR6M6wsoVdDheVMCfneDFlJ6PGVMuVbi9m+fa9tfPBHGBIAycbTf0RCja57JlSAcYJ
         wCu5PGMXJE6vJZ9jYGrLAbaYdHz8YkNbQlzrLDyNHQjRVPpWUJ+voVZ9MFcNnbT0017O
         I7oFlM0fId7dbAZhJB+l0nM5HRRhLhozF3nbhDQOQXWAtVa5IyDP20Zj7/0vZXoQqcix
         I2TIMlB1qIxA3u8oyugYDPe+H3h7E9GF9+QUYl91j7ZAiotgJLpTgGEiSs1GNfpg/s/M
         FJKWRlkZTJUx0z9mUt9x0HGRY1dvzYScd4u1R54z3ptL997rfB5ZsehHw51N5bFLwwqc
         SBhA==
X-Forwarded-Encrypted: i=1; AHgh+RptNQRaIoe8lGSxI0dj6enbceknYCCuRte70V6IuXoKyJ313rvSQuPGEgZoz2hL+kshKKaiQZ2bnr+LgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTNRMJtKc73tLU191arPjTq5gQX4DJFJb+gEu5ucz6EQ+dKjap
	mMggwG37tZMNdxqGOwKqNMmmj1o0e2bbTj8D7iu3dnG8MG5ANcQKn+MT
X-Gm-Gg: AfdE7cm+M6Zj8pM4RPq7uIosRX4HGbmjGHJWkFRVSaobT8bXJtDeRbneyzeH8dgMPWt
	EACq3H/XH/X71D69CSys1OaUekBThsceAkJ2/rhnMuSP3oQkkLpy02gdkfoge3KYUxexrzxz2lu
	pBdxGKu++OrlDYrysiCOaLlvf/Rh6UmHL9ybhlb02j/skAd/tqODVKTmCJp7cyUbq1mQEpUC+/B
	UjmiwRjrKIO5rWJtmkoWRcG0fDDSEeZvgfYS6OrPwqI1/lThCwKFKLcTc/VHpUV15YgCTD6rfzE
	3iNJzqogOYoXX2ObrsMZd/rlzemNXjCdYscpDJHPMIb6zT6CRa+khLS1vc8AfvcgT1DzzL0Clxh
	c7U7xe01qSXvGngZFVOcsuyiNygvsGP2pJ/ix3Gt7O/lEJUpnpPV8S4sFzWZnYfZ4a2ryoVAVim
	SWFekVk8g9leG7jNNmeLrOxPbc
X-Received: by 2002:a05:6a21:7d06:b0:3bf:e24e:3afe with SMTP id adf61e73a8af0-3c3ad949d5dmr11182254637.43.1784470183117;
        Sun, 19 Jul 2026 07:09:43 -0700 (PDT)
Received: from UbuntuOS.. ([49.34.211.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20bf96sm26738331eec.28.2026.07.19.07.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:09:42 -0700 (PDT)
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
Subject: [PATCH 2/2] staging: media: atomisp: Mark pad_w and pad_h as const constants
Date: Sun, 19 Jul 2026 19:33:50 +0530
Message-Id: <20260719140350.8266-3-prajvalchaudhari733@gmail.com>
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

Now that the user-facing module parameters for pad_w and pad_h
have been removed, these variables are strictly internal driver
configurations. Mark them as const to prevent accidental runtime
modification and allow compiler optimization.

This completes the internal cleanup follow-up resulting from
addressing the driver's module parameter TODO item.

Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_common.h | 6 ++----
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 4 ++--
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_common.h b/drivers/staging/media/atomisp/pci/atomisp_common.h
index a2462fc306fb..aa230c3708dd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_common.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_common.h
@@ -20,10 +20,8 @@
 
 #include "ia_css.h"
 
-extern int dbg_level;
-extern int dbg_func;
-extern int pad_w;
-extern int pad_h;
+extern const int pad_w;
+extern const int pad_h;
 
 /* Minimum padding requirements for ISP2400 (BYT) */
 #define ISP2400_MIN_PAD_W		12
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 5c2f5996a03f..5ca7e79fd1e5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -53,9 +53,9 @@
  * output res, and isp output res. however since we do not have this yet,
  * the chosen solution is the next best thing.
  */
-int pad_w = 16;
+const int pad_w = 16;
 
-int pad_h = 16;
+const int pad_h = 16;
 
 /*
  * FIXME: this is a hack to make easier to support ISP2401 variant.
-- 
2.34.1

