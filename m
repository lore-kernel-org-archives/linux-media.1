Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09C54854F6
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 08:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940965; cv=none; b=Le5cJHYfiOjKAJcSoD7N72Z6oI14j+zo6/iXQffon3yQPVkkZ73kfcy7UVpFXxqy/bgj6akqKRG2Mqp05xUvUVOXhald7l6tfqhcLpoi/zx1S5SMmZZzPCWDZhLpF33e2kwlMbhAlN8ebO2E74fXn5+4NGxZDAUBtIJVaYHer0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940965; c=relaxed/simple;
	bh=Mvt3ZfbxN2EZTNrZNa1t1/S6/6X9opcfGpDnBhE4aVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LiAwaeQJ8Cgqwz/FXpr026AVWRuTmaMGd0DUOIXqAyaMXORrxvjA812RXVskL4Vkz3suVdhAzToGeXWiQBdMi6AUNqF0Pl+Ceetn98svuihrzDAol1t5sMymnfkMzemZmWKY2PmdGG0DUSXh5/gg7Iih+GjqO7cIzIIX0s0fbQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oyFmBC3k; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oyFmBC3k"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso59895045e9.3
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 01:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940962; x=1789545762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LX3djUYrG1AMjG6o/03rqJKEBPTLs3HZVWxqrxj6VsA=;
        b=oyFmBC3kOE5nuRzJoLpNyI04H/D385mXSfILvhN6hrlVl1qTIUdI0W7TcMM2oH3kFB
         SaJuF0oJjzws+ejJlmeAPx0iiIjPq0RLSgoAUHpCY/TGLmIiAkKQl9DmaZfFTTBxIHKV
         iB3Yc6RsmD3y7y376iaCVFITXbQmZoUXb5vYV6uhzneHWkugT9leNwGczJlDceLn39rc
         yfCqZ4SCSecY8AaJa/FKGrnUDu3USntz11ZAt3N9f4l9xgjSPpGj5DkknUxHxMm+TXNm
         w+TwQr6cXEjQBLq2FTElkvgwAR9T6sKMuHESyOLmdclC5xrmWsO7KAL9BuFSG4yL9Smi
         TuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940962; x=1789545762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LX3djUYrG1AMjG6o/03rqJKEBPTLs3HZVWxqrxj6VsA=;
        b=ByZh9sWPYJfb11CCw9AEFAfaLx25A0FghyKsfoSW0uC1JOMD6aydRr19/yPYWCBsDs
         jaU7C0BKTNv74K5Zc9Io/rQAdXmfhi55H4qXtuHMuyzqdPmQF4nDrLoN5XidAo9j+TCR
         /TscX1Q+xhusvxAFYg+hHFFubVS9VASWaCdWwnpWXjmlInOnGNlUkRV3BEDQu8aXORil
         A75ij5tQMqnjZYJhi0zFwlsRSQE8IZLpJvfzUtrBX7hWjravD1MRioaWvgzkXwqWnGNQ
         WFw4LQT4Rja8G3ftvQt2aDKYWoDNR5a1BLpSJHRHORgSHJXPPEtyqGNvfkEX8AvsTT5q
         8Veg==
X-Gm-Message-State: AFuF++m6FkmOQh2+wVKzeYTSztYfW31LD61vPFq1FWrlDSzCnz3T9Fcp
	U8q/GHvgJ958FOXpHfP5Wpz5Qpv1PsLvqnH7rf5r8pf0mkpzzdGDPCA8
X-Gm-Gg: AYBFou2e/IDndrCasP3Lb8UTIiLKT/AUaF8r6dwirGOivf2r1t3wpx1ulbHpZs+9jRT
	qpnbwIlphGTQbmbZ5GZTiBeuUpUNkOsdxQqzBaJLzAeUIVNJI73XzenmCzYZW+imlJiFKVFL8Fa
	s4VwIAi7uIV+I5ZGp/8T3x6i8ReNyWfpgbuG3X5B0jyzHM8hQRwRZqUs3yNt3UHWsmNj0VxrgHC
	6sP9PBv6Zr97nC4QO1FteaAPCuzDKNHx+5V1wUePFzaJD9gZpCARw991zFrUF+cBWjnLkrG3rRM
	RRjRn6Sv3R/iStI+vpWLFEvUhhzUV2RpfBBEICcCFQAzzgAQvQo03YVVcX+UfU4xYOU4dExzXiD
	aelrjQDy4+nmizmqDJag/GNMgTlOe+cZSTCxrIMstSs14aEbljvqwoxpMwdtdctS3BLSJN/PP3U
	vhmj+oxqLON9Di0Egb0on1PzEkCDToplQauZjHK4XoGcvA9PCVFZ/6UG45e2F5Ev3HS2pPKc0xR
	+HrX4crg56Po3wpdPACCPTudjuDTqs=
X-Received: by 2002:a05:600d:8490:20b0:49c:f89b:f82 with SMTP id 5b1f17b1804b1-49cf89b1bc2mr518048925e9.12.1788940961836;
        Wed, 09 Sep 2026 01:02:41 -0700 (PDT)
Received: from chubuchnyi-ThinkPad-P1-Gen-4i.lan ([158.173.155.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm412817125e9.3.2026.09.09.01.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:02:41 -0700 (PDT)
From: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	mani@kernel.org,
	michael.riesch@collabora.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/5] media: i2c: imx296: Add missing v4l2_subdev_cleanup() call
Date: Wed,  9 Sep 2026 11:02:23 +0300
Message-ID: <473ee7933c3a0b83d0e8fe9359c47b5c7697bf97.1788940469.git.chubuchnyi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788940469.git.chubuchnyi@gmail.com>
References: <cover.1788940469.git.chubuchnyi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The subdev active state allocated by v4l2_subdev_init_finalize() is leaked
on unbind.

Fixes: cb33db2b6ccf ("media: i2c: IMX296 camera sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
---
 drivers/media/i2c/imx296.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
index 69636db11..855137b5a 100644
--- a/drivers/media/i2c/imx296.c
+++ b/drivers/media/i2c/imx296.c
@@ -870,6 +870,7 @@ static int imx296_subdev_init(struct imx296 *sensor)
 
 static void imx296_subdev_cleanup(struct imx296 *sensor)
 {
+	v4l2_subdev_cleanup(&sensor->subdev);
 	media_entity_cleanup(&sensor->subdev.entity);
 	v4l2_ctrl_handler_free(&sensor->ctrls);
 }
-- 
2.43.0

