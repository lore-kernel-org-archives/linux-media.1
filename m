Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0F03BBFA9
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482293; cv=none; b=IYJKxcC5PHGGXTBadnk9IQbegknAySLYxAD1FPeDv26j7dzCrYBrbt9cnepN14MnGJtAsTknw6MXAuQUa/RisSC2ExRkd5ZNaLNOWSAqapayVY3kG5MkQ8kxDv5o8YMbJdLp51m0IX6FVFAttPt4AB1rWkg5dRYqYFiBYKiTSBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482293; c=relaxed/simple;
	bh=2HZbCyaAvqbokY/BOOc/70K6krlluqOOSO0k1/nacus=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qe89YwWK6I5plRXknqTsELM19CSSJL00/X2DBrkNRAJR2QCBjmTjbRU5MwLCL3excbOKcYYPlnGbfqOeGXDdVUGeLKX+QZw7H8jKncLyuD4EOSMSO2UMMI7cBiSWGtd/4hpQ9Vzh7MLglJ3ZLdG5l5J0Oqc112ZsTNGF6n+n7aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GshXuRFH; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GshXuRFH"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4cacd3409so304466a12.2
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 07:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789482290; x=1790087090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ghbBZ9hREMOL1TKz7qCR2XRWwuSisruDUockpfq4d7c=;
        b=GshXuRFHqm4zLwrV3zR8zX5F8UoIj4xSEgUSn/7dIxDhosCKeANT/IxaS5imnnONrN
         IV70YsDVAzWCI0IEmKDKxtJVzqKefytv/5yUKWvy9r/m8NcOEPR1+hgaJHFTBATeP1RH
         k9Xq4iNsKFOVY0Yr01HCV/XZbf1EgavCn8RkbO/x/C5Y1QXxFO3ffu6WxiyUK1B0mAXc
         hUTgYVE7/aKqJz3qLNVt3T/RIU6jEf60jNywW3GmrZQAuu9WYYK06Iko5HzclPc7eyjv
         MUxwoI9ZqAWGjkACp27EDLG+IcHgLowS0LpqvPQbXEAx6PfSD74ISGcVrxtRhDuX4c0P
         Z5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789482290; x=1790087090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghbBZ9hREMOL1TKz7qCR2XRWwuSisruDUockpfq4d7c=;
        b=iUS935sj3DPbQobJRLRT5qlHOZCaObVbjEWspw9/AhDIHt7Llhkv9P8a8Lr/aWLnCP
         m3Z1e4kVx8X6RFuUby7Bcr/Oh0FV+0UNfv7kK+fBtff4kx+8DNUhLzBDTNcz4z91Lqtv
         UXGvBDMrYXRCc15tvEqvmtQrkVElEwvqBU+AqKuLepS+C5ceTfTzs4zKt4TMBpBQqu7s
         a/YMIN7B1sk094xo2+S2mPpPkWpXL3jxD1roerikEUww4tY+43AhZ4zctXZfpZv5Yeii
         SUWP1aQjWxPV1kgQvXA3eOLdSvP0NnrOuBQeHOusBoyA8UfaQ8CjQ44yl3vCaDJEC3Q6
         r3TA==
X-Forwarded-Encrypted: i=1; AKwUvBygwRYAWucMA0A8eArYllkbepHjgBN41sAY2WlC3kTe/S0EKaB+3X7pHXPN3Js4Q4pv+EXnq/sY36pBhw==@vger.kernel.org
X-Gm-Message-State: AFuF++mDDPjiol5ylOBDU0/bUmDUbgBONSYez0axjaU9E+20Jvi+mg2r
	k0Xcp9LUzn7drUpW6lB4DZyrGVUvIRwMo4INVKwzcKhA+FLantohFSaC
X-Gm-Gg: AYBFou2TLIB8/5Cfbhkx47nZSeuSBIXl8ncfrez7Zl17rl/Gt7sGmfr5ATR1ab1wB2B
	zBsrOnCBIhyXXNiC0vuoUqkIAZZQhX9pa3ESA8Sd5cRZ8WX0GAlgtYUIL9oBt1nH182y/7pQPYa
	piufvcSVYTuH1pRg55oB0eRUVOI/1GKKgwzSlxDUFVFJEisFHsOjL3wJofoX0y2xOqndIaO+ixo
	1D7CYBouRH7WNr1CuQsMVh87WoCY/rUbzbsjTIAAlBQ2ys1xCEiRwLRfHzUZFOi9V26uEiHOMuN
	ptuZ2K8REV1sXGdLJNp8RpnnI35fUGwD4xu7V7dxEXRdJQGFTL0xb1rRUY77LGK1/KbN0leuK9D
	svppw9y2ws1uWZ2dGBo9WiErXkkMNNYy3ndOJaJPuEqd9BAhIG55JdInSNodMrWM+QEgYgkr6UY
	5xT7M9XoqY6Lk5h9CR/0DhTxXfLAaSLPT6uupcUSs4ykSzuyo44lJxsg==
X-Received: by 2002:a17:902:e74b:b0:2db:210f:c111 with SMTP id d9443c01a7336-2dd837b0f5amr21821025ad.2.1789482290368;
        Tue, 15 Sep 2026 07:24:50 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfdc15esm68401415ad.66.2026.09.15.07.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:24:49 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ti.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] media: ti: omap: release DSS compatibility layer on remove
Date: Tue, 15 Sep 2026 22:24:40 +0800
Message-ID: <20260915142440.2442011-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

omap_vout_probe() calls omapdss_compat_init(), while omap_vout_remove()
does not call the corresponding omapdss_compat_uninit().

The probe failure paths release the DSS compatibility layer, but the
normal remove path leaves it initialized after the video output device
has been removed.

Call omapdss_compat_uninit() during remove after releasing the video
device resources, matching the cleanup performed by the probe failure
paths.

This issue was found by manual code inspection.

Fixes: a9ee9f08b615 ("OMAPDSS: use omapdss_compat_init() in other drivers")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/ti/omap/omap_vout.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/ti/omap/omap_vout.c b/drivers/media/platform/ti/omap/omap_vout.c
index 8d0319a37ba8..0efaff4d343d 100644
--- a/drivers/media/platform/ti/omap/omap_vout.c
+++ b/drivers/media/platform/ti/omap/omap_vout.c
@@ -1586,6 +1586,7 @@ static void omap_vout_remove(struct platform_device *pdev)
 		omap_dss_put_device(vid_dev->displays[k]);
 	}
 	kfree(vid_dev);
+	omapdss_compat_uninit();
 }
 
 static int __init omap_vout_probe(struct platform_device *pdev)
-- 
2.43.0

