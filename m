Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6C349B5BC
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 10:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370241; cv=none; b=neFF90XTinBfDaTkKi0miNv7ZV/u9rLkC7BZfQ5DObnsSdXal5gP1HDPSJeS3AUXtzsqGSlYQ+wbmLkMLiSPlCMqKNeCVGWrFnI8Jw3Nfkk3i10r575NoJrByBpjTDvmersmV7KrKYEgtSSGzCIGR+Oj88KVHURo67T1ZAG+flk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370241; c=relaxed/simple;
	bh=UeOYdAgNJbhl8HXcJG32XHcuWeuRzfkXTfN2CC/Z/wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=la3oTBy5HL4vt98EBK6j6PLD3InvOxGykA6feSXy0cRhEe46zOCM/araKbnr+qHLFUFJ7jcf5ek2g5lC9WlW/zabbkFLAaodpexrHbz7aj5Ao1oBgSAK0xzwptbI8vokFhoLD6P9Ny0e6npIp9Sw2X3jol9wi1u/K/2hSTxenZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIUQehoO; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIUQehoO"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-85377c8bc96so1034193b3a.3
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 03:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791370204; x=1791975004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fC7NqtIJTHyhvDivfZbpCmHmRF+i/jxBDQHBauVmSS0=;
        b=TIUQehoOJCE9kV9K0pbKF1iy8Sgu8Ms3UwT5puxDMakNT+OO9FP2b4VC5g8OSTgcly
         KnG5Oj2nYAmA6ux/lXaHSPD4iD+G0sSkqg6BhgcSC7Wl3q8jjz+phBEcWYLismCjQj0b
         RFzU9L2nwXq5uxGenDsq7Ic7zYoIFoIZ0JD14/b8F9W7eohfO5DsDWNj2moT5NCZIbXx
         8E+njSqBBHbKuMFRMbOp/t+wrA87n3WNdN9niv9Wa/FpFy4dJNLXJ3AUcUmt3oq2gsgi
         EZ8MG2XS6QOQJsE6xKwNJJ4bzPiDEM3FB+BlOUatGGg6mXJ4/yzM1qZIHhFdinQxJd2T
         392A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370204; x=1791975004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fC7NqtIJTHyhvDivfZbpCmHmRF+i/jxBDQHBauVmSS0=;
        b=CLWwulZDqltXfZ8KxB8QoWTd+0YkowGEd4vgNodScvhpuYpCMPsPNjQLT35qsq+iZt
         0YdKDYYCBUZwpQn9BwJ8b5MasXZkz1fpfVgB6NCPUJKy4KGYxHdvuex5YtIU0jMquHuY
         WnKYJofM+T6Z2IbZap8UhFfXT6yZ0tpZ2640w76xjU7B4X+0QjW4t9EQVBldcKGBWfdX
         rCqA7F8XENndajaMPrMQVbTUTw7emItKGK2XTLg3ZlGiX9JQxULEK/XfD2uOdcK7amXG
         omoxawybigJDb3J68y8PShEiVA1y7+FN0AcGob7Yj6aCrTJ+JCf5Svc2Nv1YJzp0x9k3
         9zCw==
X-Forwarded-Encrypted: i=1; AKwUvBwvF39NG0lTopXu/kKhIHYzqIkSbd9fWZpUi+/F0dymmkibbtm4sASPTKKi9gy1NRBqv0xyBD32s8/M1Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nh0sCyIFsxJ5tZkm6fDoALoSGZ8YHSwZGcCazQcj58lcVzKEw3
	zvtwu11n7Hh980gEn4yAA4Chj7jyI+UK7vNGyzP+wRJD6xFVTQsTKNuA
X-Gm-Gg: AYBFou1lEQafonysmHa4yeMP3oZFdl1ke1QHOA0qLujexRdVYjHVEApO3cSK5AvFkYA
	1qlycL60F1Ho84zp4DE03DqHs81Ap25GYtqGJ3zsBg8szzBAbjR2Cay4o9dXnCS0OwtbM290Qb8
	DQf2pLe/1PARyQRIJFzSZyQJsUAU93I1e2iXjQzzU+lQ/XmBSpEDT66UrNCK++LnTgdyxObcoIH
	mC4dRi0U8vzBN65V/dBrAD3y4Qg6wqyo64SQ+shnJEZlUblACZiBxv11G2s2oB5WmxDJb56T7O9
	G1vyae4A1oI3vvJ4xpOoOAutWjBgkQY9tPyiEbLvt2/zl7bJN4woG+wkO22zXfb8Quc6WRMcRsy
	liYr8aV6x0DSZZ+qsmi17v5w7leV67P00KIisG8tRGuWp6fRYknsUIFOx/im3y1Ln6CVCoc4UGH
	jAP0TyczaqtoXlW4z9IGcSCdGif+ru/OVf9oOSgoLqmmTtOQeeUUIkIdnD+U3JtY8iKUfYDxAG6
	uvyf0NfWrElsslvR+a6IN5chmWo1F+hamkRnKotsyiv1Cs/+pciWRPL4w8CyQT+68ywNifYSAJz
	rEnI2km299XELiQ=
X-Received: by 2002:a05:6a00:4405:b0:878:3538:8f77 with SMTP id d2e1a72fcca58-891b1b706acmr1692236b3a.37.1791370203645;
        Wed, 07 Oct 2026 03:50:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8918891808bsm1197898b3a.10.2026.10.07.03.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:50:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Luca Weiss <luca@lucaweiss.eu>,
	Hans Verkuil <hverkuil@kernel.org>,
	Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] media: i2c: ov2732: propagate GPIO errors
Date: Wed,  7 Oct 2026 17:49:38 +0700
Message-ID: <20261007104940.507820-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007104940.507820-1-phucduc.bui@gmail.com>
References: <20261007104940.507820-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() returns NULL when an optional GPIO is not
present, but may return -EPROBE_DEFER or other errors.

Check the return values and propagate errors from the powerdown and
reset GPIO lookups.

Fixes: 247b8b855876 ("media: i2c: Add ov2732 image sensor driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/media/i2c/ov2732.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/ov2732.c b/drivers/media/i2c/ov2732.c
index 40035320fec6..b8009c392d4d 100644
--- a/drivers/media/i2c/ov2732.c
+++ b/drivers/media/i2c/ov2732.c
@@ -665,9 +665,15 @@ static int ov2732_probe(struct i2c_client *client)
 	ov2732->powerdown_gpio = devm_gpiod_get_optional(ov2732->dev,
 							 "powerdown",
 							 GPIOD_OUT_HIGH);
+	if (IS_ERR(ov2732->powerdown_gpio))
+		return dev_err_probe(ov2732->dev, PTR_ERR(ov2732->powerdown_gpio),
+				     "failed to get powerdown GPIO\n");
 
 	ov2732->reset_gpio = devm_gpiod_get_optional(ov2732->dev, "reset",
 						     GPIOD_OUT_HIGH);
+	if (IS_ERR(ov2732->reset_gpio))
+		return dev_err_probe(ov2732->dev, PTR_ERR(ov2732->reset_gpio),
+				     "failed to get reset GPIO\n");
 
 	ov2732->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(ov2732->regmap))
-- 
2.43.0

