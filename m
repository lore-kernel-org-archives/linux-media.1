Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F003449B5A9
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 10:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370234; cv=none; b=dKz1bxf3zE4GdVHBnpHeGEl14f1ivFAI7SbBPyG2NHHKyID5NDLTF4mIjOQtVSwfcA7uky6b5f14qrV1pKELyAsGREqj+Ll9X0poWE2LkzCUkFNSazX8LrswtSQdfPRqFWT1MJtdv7exPsdx9rg/XFyORo0qpTv7i+ttYZ7IgRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370234; c=relaxed/simple;
	bh=jlxL5+mbWXP8K77XchM8lW3LCVFpuiszpfwSWbXi6xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cU7E4rEY/sPzJvQlK+UfBw1PwUhVbcnVoH9Qu4Ituk3d+nqT5U7i620MsoiBui/4eRv+r4SPIzS78EWmCRcXqH5JJPqAKfeHXiBh79TRu557gep+F0WwAI9B/qPOuuhjs6zR+BNadfbo0dbATKInQv/S41B+Izfsw02pJ/vovWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bol3ZsqC; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bol3ZsqC"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-888b8fe095aso1698461b3a.2
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 03:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791370198; x=1791974998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KA2DWK4h1sH8yjfR9BrVxNR11p9An71w1a1CSOAHpQA=;
        b=bol3ZsqCFElDn3i+wmDWkWjPikqqKeHad16PiBZtShYSCfhOqpK6Iy3Rud3jVW8Fiz
         NxPBYJXPWfvXuyCzJPEfzc6ILBMfS5jd4deEI6929QAXHlD857oOekac6N72pdCW8VdL
         int2oLtzErOxbg+P+imZTShOuJEEI1mZuLNWup6V9O3oH8kxh2SUTbcYU8R7iZENOFfh
         Wz2NRIjB5XVW0uwmcaXYAfihOOipLLN28e3uBM6hLUlvDqJgINpjQoK/ArNP+wJigu0P
         cxFM95uKS3ZHJhQhU+FXCHsI99bWuQRdIctruFOnegXtkgIplYtM7vx0Upj78B/uYHFr
         JEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370198; x=1791974998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KA2DWK4h1sH8yjfR9BrVxNR11p9An71w1a1CSOAHpQA=;
        b=RcbIUEYSCbFfC9lFka+Fs1Nxy7lqC+7lvVKiTRZwpxWhBMmct9nInJcMozJvjt2w2r
         nRZ85l8e3E/yLKh+pbmU9YNu8gFEr3T0emS0bWi9m3ALtyg3nrrzdG118QLUQ2IZ73sU
         PDRqEzGdE2oiPuOw/FqlI2N1VpHHJlo/OmsEdzP8gbTv89n4gqXjsbWS2jHtjXEp2zdY
         fOubXwOCsByFx2VEfMQwVntk7S9NM3woLL2zZOnG0mKeLQgIr6gyMA+LRxhednkazdzT
         bSkbF8rWJf/vNHmIBRHdLENIaiVhmAGldpOxtLCZALS2hHPNDPy4KyECPOkbAAOUbRSv
         CFBw==
X-Forwarded-Encrypted: i=1; AKwUvBxPmbca5gyT9ef4NXRcKJQ6H/RSxGspRwid1vFwXzUthquH33qQnLzpCCqHRePLPQecuOrb/W+x4uu+IQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mGHd6lFyvFffCaGh/Ku08UKXBJ41JRwtkfuO0XyewBHd5JZdxE
	12TX5bdHfgWy5sUaYg8ZmXPtkiplypNskRl1+AobCKmiw7+F5SfIFFEd
X-Gm-Gg: AYBFou0FAMPuzzafSUQQjY3GZ0qrAhtv/UtOLOabu+tDPZkp3raUCz5x1Kj2ckMwJth
	cCysmVkti3FaGBO0CSU8gT3vUDj+spDZIT/aWxFSzpz0i9mtS/TZjMT4pw35N63xqA/7C+f8hOH
	axSbg3lEJHPWNYCNvCmkB4bfWRysBXHkUbydpfBd7Wglw6cQass6kUPrGI4h0BG7n7hBOuoDnNf
	6TeMZ3wEBrstuVlS8aGLsPvuhTvhGoKVlFnH87Bzr4ia1pJOGZ7JhA3/6RQfo+TT9fzWKF2cGmk
	hVxhgHpRBjKqDvay6+hwRMet0yS1CD/TKveNZL6cOX5pHPcosrVIXS+kgtWC1PgRI79WDWjPhiF
	sFicy+093hVTHMQHyHPVY+HdHkUc1TaTW5xOd5g7/8/Bp+kP+fJK1ljqOAmwsVDxZDhBjlCHQ/q
	1oJAZoz2707Dq5cconwtTtCHuK+odLKIR41oeElMgL9GDE6jKmab6TEfEySrF+0E3+lba1Yo1+f
	MRgbXsCUq3KlmNyaRDDgNnWlt5AKyuL7ZU4evcI2T7quJogDf8say8GaIaXpavl9CS6oaA2hSPM
	eYCjpA3JOeqt+w==
X-Received: by 2002:a05:6a00:929e:b0:891:a63c:df97 with SMTP id d2e1a72fcca58-891b354d63fmr1433538b3a.15.1791370198208;
        Wed, 07 Oct 2026 03:49:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8918891808bsm1197898b3a.10.2026.10.07.03.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:49:57 -0700 (PDT)
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
Subject: [PATCH 1/3] media: i2c: ov2685: propagate reset GPIO errors
Date: Wed,  7 Oct 2026 17:49:37 +0700
Message-ID: <20261007104940.507820-2-phucduc.bui@gmail.com>
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

devm_gpiod_get_optional() may return -EPROBE_DEFER or other errors,
but ov2685_probe() currently converts them all to -EINVAL.

Use dev_err_probe() to propagate the original error from the reset GPIO
lookup.

Fixes: 0482fbb1c1cc ("media: i2c: ov2685: Make reset gpio optional")
Fixes: e3861d9118c8 ("media: ov2685: add support for OV2685 sensor")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/media/i2c/ov2685.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
index 4911a4eea126..92d0f90b3d37 100644
--- a/drivers/media/i2c/ov2685.c
+++ b/drivers/media/i2c/ov2685.c
@@ -793,10 +793,9 @@ static int ov2685_probe(struct i2c_client *client)
 		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
 
 	ov2685->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(ov2685->reset_gpio)) {
-		dev_err(dev, "Failed to get reset-gpios\n");
-		return -EINVAL;
-	}
+	if (IS_ERR(ov2685->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ov2685->reset_gpio),
+				     "Failed to get reset-gpios\n");
 
 	ret = ov2685_configure_regulators(ov2685);
 	if (ret) {
-- 
2.43.0

