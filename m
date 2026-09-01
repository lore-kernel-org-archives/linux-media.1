Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C7F4A0EF1
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 19:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289490; cv=none; b=Wla6TxB6tEypsDOxYBeK554jpPdXDaZHiumIJGTqihHEUBPzhumgedZDBh3fiO+va9wXqRVKd+hnP+mS+7+IIsvbA1H5b5A+U2kBms/KOEhzvBrLTAHmqTvEP3rCeA2pTpU6KmLC3G1cz5tejVbBYVJnL+X0bIADK+dni2qWvOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289490; c=relaxed/simple;
	bh=a4oCgSJxVT+Yvyj6OvJRra4F7RQTRxH4QG/o8/Ybv3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gn4qLp0Svc0pB3h6fe11St4/paDzAnm9nwrmKLHudz8jPpR5CsV0+RCuvYuALs/p9ouRB5Th/2HaUAJ6/pWGdN7Zp7A812+ph8+3XG+DQPPTZXSqZJKOiHID55EyZUUmRQs6/od/unXyA+L+V7CR67zF2j2wENewV3KniZs7yK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8p6HHou; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8p6HHou"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so1044535e9.2
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 12:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289487; x=1788894287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mENIAbZRTvAZLCBtejhgUDs7AYKS8queXWQS6mtdC+Q=;
        b=g8p6HHouPjaphtlHw/gjwdNyM7g5uTt79pk3k3hanvH615n5QvMLdYpzJ5qRIvFZ/2
         l6CMwV3T2lo5mRWRfn5YW7EbwDZTx4mDwm/qEVgva3RGobrPa40nhFgQTSpvi1dIdMl7
         JraPKRWNdp26wMraNdUwjz4wRkYx0+P/LwNK+o8f+rN6lVzgUUspyz5e2K4tSia+ugYz
         a4QuYmx32fIRh0JOD5LGR2c5fTMnLEoj5STJkm2Mmz6QgM9f9CVVckrnMal9fLnr4zkb
         PWr3pKlbsJfXVflEB+AlphVZUVsanxu7ao+2D/0wR+Znx0/2UGpvklWC7+SkUeGsYGXT
         8KDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289487; x=1788894287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mENIAbZRTvAZLCBtejhgUDs7AYKS8queXWQS6mtdC+Q=;
        b=rlcHz2gFblElHqoJASGZAviZ7p1ur3/fJxzwI1h8Jb2q00MvPSPngupeJGlkgt9+uE
         9Sqs3PND/56c1bomqJeb+0aj62vttfT0iVc+osGJgBhLgxLCeJ4y7hzjj2pNwKakkSAy
         dDoEkzhjE2zcrCi7WIuowwW76prnz/vUwA56JVksktVF649iijoOmk81xcUwz1E0GaHp
         CL59UuDK27XW1aXu2EmMvEgc3TNr5Kw8IplRIja3W7Bi51n5Pi28IlOUqMoGSZ29XoX4
         +/uQJIss2R43qA3Tp3NWMzn5F/Y851quiN/KbWjtRbfXxinY7L5jgklsqZrVgqP8483z
         Phgg==
X-Forwarded-Encrypted: i=1; AHgh+RqtcBdamKXbjc2Yf21EvsETzoZZuoBQWth4B5r1bFgOZBlukfA3mUgMzHjCOrQclIswXqAR80I/U2ZNNg==@vger.kernel.org
X-Gm-Message-State: AFuF++kFPJGiJzSge13gcApDKVjRHFtl5aWPsdXE3+BS4U8pR2RD8C9H
	SNR31JXKCmW6v8UVNGv5MpeTPNioIyJgIFzp1aHFZOTiLKOXVwMeaOlW
X-Gm-Gg: AR+sD1072ZBv2vwnhngn4omZtgM0/fRWzsQW5QeJ78NhTv2hRq+Y9imCjxZLnTpwbO7
	YDxikW+MWALx5ZoeEPXLYHE5UHLgjOmjPWfTv/CGLtne59aDHSTxC2WEeaowBKVSWaeTX0rli/H
	5D/eYDquP6l2qljG2gcBYePSwDnkcj39HwmC4lyeVhtn3Qgbghqslb/QmlQwnT5vGN3mD+bhWer
	ONyUqXQnX/uYRHC81oWazTZi8A7lEWvzHOSJTsKKj2moxAWJ9rnUmTNm+22OOtZ+YTHRSZA0T/j
	jDubpHYM1pJ2Vmi7Z4nsMSM89alN6MdeTr71LaiA2x+bx63ZelBg6diFaz9HIe9usD0L/OiDFFO
	J01s5EgqkqhkRlXp+BTVXkDpWtsuWq7bW71hdk0L/w8SHWH+WRR+/lNWBYzqYukBDcCOEMfYoIx
	bcx3imwZ1LciS9Qmz2+cugbOJQP7NekSeagZ7AUeuSoYGGPIJh3mzf6vFpAKmJM9bxz+hgTRtAw
	nuBxT8WHOaiz3rpvtaaMwyKuuh0stv1FowhlTgYvQ==
X-Received: by 2002:a05:600c:870e:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49cdc43f461mr233470195e9.12.1788289486489;
        Tue, 01 Sep 2026 12:04:46 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:45 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 03/16] media: ov2740: Use C99 initializers for ACPI IDs
Date: Tue,  1 Sep 2026 21:04:25 +0200
Message-ID: <3071a34e3cfde59e408390b6056dd551d5639162.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use designated initializers and the standard empty sentinel style
before adding firmware IDs.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: LLM sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 39003c1632ad..8f0ad5dbb245 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1461,10 +1461,9 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 				 NULL);
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
-	{"INT3474"},
-	{}
+	{ .id = "INT3474" },
+	{ }
 };
-
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
 
 static struct i2c_driver ov2740_i2c_driver = {
-- 
2.53.0

