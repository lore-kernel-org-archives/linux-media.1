Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE4D45C6EA
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462243; cv=none; b=nQ9lJOlOumuyMVtzkzJdTbwyxEZ+dVb0C3SbYSNQuamKb1do6540dGLOKWeRVOZHs6A4UP7QhY4oFsexF+CGUzDK9L0NDYbR/cK3yaZu6iIpH10mdsA9fCd2t9Kpe21mp4DfeDET8BNGWGLi6s3JsKUkHkvEwjig1gX+AqS/w6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462243; c=relaxed/simple;
	bh=aOycPQPzW1hoyp3VFb8uVa68Tk1zbSs3hp8DysdIXZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V0lBH/EUafcVWEMP+iENQzLulmyB1uqcY6+5ZVigvyojYwFjzLHug4lrpth+VnTsV1B693Qyc4ygLnqSrtKk8aqy6bfGTUutq92iaiY+Gvqu2lhlcLaobau1C2SuQoBgQ3qx+H86XuAj+NJNemrBBMa9xyOUWtTJu7KrROIu3qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akwQ9mg8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akwQ9mg8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d6e954afbdso33251675ad.2
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 01:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462241; x=1790067041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZwK4GxS0mTkcXMKP8dTYTElQEtFXQdtakQVWZWGWY8=;
        b=akwQ9mg89ZrMDBRUKanD+mVGTGgNbzRxMKlQScviLHR+k5NbO7kffI7WvuaaZsp8U1
         eqVWdTJhZ8zac9hWolYcpYW/ppph/8i9GVwd9WwhZWj02rf+scQyXw62AKheVW5UnDJA
         5jy4f2In7M/8YJthjEcVaX3ypism7aJnQG8mvqk0UiZhAo1vk4WSuyYrBJ46+Qv7jl6O
         qV9hGrFpY7CAm363jHF3B07QaiwfPg9jp/VSCaxZTkKIO2z9XPVwm2TjYgGlUK5iNl3V
         X/kCna+FJEKS/MDg90QIodyA4+27mnIYGc47RTugoH/6l04GbtFkNd0w10Uzv3HlRBbe
         FBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462241; x=1790067041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZwK4GxS0mTkcXMKP8dTYTElQEtFXQdtakQVWZWGWY8=;
        b=1x5OEKGmXpJo1wNxvcbvN/G5f2I65J4g4novUYR27k7U0TmftlS/XGEN1AACbzA1xJ
         XZjuw8pzyTYOj9WSwLpwg/C6hCWXPTYEk1f+kHlOodGMNGQO0e+g5xEbJHAzIQKeCiHX
         bWXhaLj+ZiESL7pfIoJ+JJmHN5pRDS6BIQMjeMx5Ubn4zWTDFVcwHSb/kD9qWQ+rjvB2
         oxyh3ymFKPaF6yfSzMakFvXHTk5Bqb4lw5QpGBgQ5I2uHwdntqGdDvgDY80Zei4L7QM+
         J+71OXnN+LYvggDIs0v/knAzAGOzshAPbgzfIa4rInhuku4GYrLoXKIsgcpkERy385r9
         M/+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxzqh3waGIUCp2C/qWivYF2smY8k3cNnfgmagFrvDRh9Ct2qNJHv/oqZrox+veTTUWnn8OkcRvRSSIpnA==@vger.kernel.org
X-Gm-Message-State: AFuF++mT8PWaeEXJTYUWtMoyBIHqOnnsRpx3SAuKsarRFUJc4luIdaiD
	SpzKX2+HhEp5fVGtHGqSETb6AWIYeNitBD9zzaPOntHfFQg/G2xOrL3i
X-Gm-Gg: AYBFou2R6qqyKeooQTuaAOICCC2B2j3NJt4h4udDaxlGVYqr8dbBVwoK50N0oVWiE2P
	YzEDYOYTROstRfwoph+eUv0QPdF6r9MewIjYk/yd312Aw3VUkbFkZ4/M0n7BXf6yBl8ruVKMOJp
	t77NvdG6vNcKwGMh2LErwtoW2rVvYk6HWqRl7myfbs0/ljgfbZYBk+W1a7KHGX7gXErM+2c5yf7
	JncfR2neswwLiULpqeu+mMAAeHEt/N9Rux3+n0xiLZ+Akc/Se1XVHdYI3bB0MVQPeb+GWUeGhOe
	gupTy6auXZtDFaj3uUBd/EiyART82u4NH5TbxH/4Mu6JkbcGbCAkcj2ezxAHAQCZmaqhLHB2OeU
	JPBlWlYl2GVb8Zzfrk8JPLenOvta0P+CSruRTtqQ14kQp2Vdmi83HXjs0SJosKHeGrnF7ZzEwuf
	XdhvMzX4F9M4wkasMLz5KKiqeFl1UjeFXyYXYvbCIEy/9yN8MwI6Inh8T6zAYzuXI6
X-Received: by 2002:a17:90a:d88b:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-39dec08fa53mr12246257a91.12.1789462240654;
        Tue, 15 Sep 2026 01:50:40 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm4003559a91.10.2026.09.15.01.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:50:40 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c: ov2735: fix power cleanup on remove
Date: Tue, 15 Sep 2026 16:50:31 +0800
Message-ID: <20260915085031.2331315-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov2735_probe() explicitly powers on the sensor before enabling runtime
PM. The probe failure paths call ov2735_power_off(), but the remove path
does not perform the corresponding power-off operation.

The managed runtime PM helpers only clean up the runtime PM state.
devm_pm_runtime_set_active_enabled() disables runtime PM and restores
the suspended state during device resource release, while
devm_pm_runtime_get_noresume() drops the runtime PM usage reference.
Neither helper invokes ov2735_power_off().

As a result, removing the driver after a successful probe can leave the
sensor clock and regulators enabled and the GPIOs in the powered state.

Call ov2735_power_off() from ov2735_remove() to match the successful
ov2735_power_on() performed during probe.

This issue was found by manual code inspection.

Fixes: fa9e6df636fb ("media: i2c: add ov2735 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/i2c/ov2735.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2735.c b/drivers/media/i2c/ov2735.c
index dcb1add1fd9f..2defcaa8b795 100644
--- a/drivers/media/i2c/ov2735.c
+++ b/drivers/media/i2c/ov2735.c
@@ -1081,6 +1081,7 @@ static void ov2735_remove(struct i2c_client *client)
 	v4l2_subdev_cleanup(&ov2735->sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(ov2735->sd.ctrl_handler);
+	ov2735_power_off(ov2735->dev);
 }
 
 static DEFINE_RUNTIME_DEV_PM_OPS(ov2735_pm_ops,
-- 
2.43.0

