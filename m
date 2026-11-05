Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793919922;
	b=ujCkRpuvRQUl3YhTpYc1cUBRbxi0vpVMfJLHgZw59BrR+6+v0yS+7vT+GmuQSXEJb82I
	 pH5UFa4GiaarM3VHJB0Fi58QlDjLTLpFm0CRm6z3hiTWxH1B58wr7UzSZ7NMZxG/xStdx
	 LklGlxRgoYNLToS3rgdolrWEbIXx8e4DpC8oA4RLhswx+YrOERCz+In7Khy8ghYwI6EgG
	 /kBlSoOyVndUAMsPR6pupVNfVGkpnKchASAwgDuHQN13s7wuFZyORvc1dBXCGM1OAxI7f
	 MNuDQtqp7wsxgsKtweso3RHVJOnVUqJdVOexYcJUl0gzV5aaXWBKjQE5viwl1BBKMUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Lyv+baRV8EbIAxpFEiLHk8SX2iVCBH1VZctlTVfik6k=;
	b=l+wKLTiyrGHZATQ8XybjY4yJ4OKF88bOROzfnkOCDn+QmFdktH2dRa31/FuO/lDzRGGi
	 5oIyyXPdsWF4C810uAwT7fdR16N0MJS8ASsGs9auoE1KVa3hEzu9vr2OM8ACferTndV47
	 ny2kEcGFMcBavhvKcRIec9vFQw8wY2COa0nYf981FHrIMaZikgjeZ7Q+cnFHSmFH9UAR9
	 GDidhC9pIKqsXhKCFGGA2o4QBCr7yW6EGI/bNZlGOn6NJSljDCNLN+UprLccGlF4bVyh5
	 C7xAZyOG8JkRrEl9TRIQttVxxfdU5b06NJiNRhkZNl6GP51PrSA2i0h25Y0uevoL+uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="riD8/TAM";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C46B606A339
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 23:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C46B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=riD8/TAM
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so717695e9.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 15:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793919920; x=1794524720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lyv+baRV8EbIAxpFEiLHk8SX2iVCBH1VZctlTVfik6k=;
        b=riD8/TAM+/ZDub0PLi56rElzjuU+/Zyk9qQWcmw9XV7qPLAmiX75v8tQPj8Ea9ivQ/
         IOlcqUwH86aGv4f120SfYc3erLkAXGt9wAyc3pb+KPPfK3Ticn/q+rWDAQ7e+URtiywD
         NdkEiEZm3REafkJo+NUrlYnAxrmD8djdTnkneSUR5wjjt8Gh/3cxmZxDVi1cS+/3Lq24
         JwzxYEfrbyonA0c8kFflh/GUI3QWQy95fi9H65E+/D6j5m2gponXYc/14qZ9Il1bkJJJ
         0MepIIjsJt6cyatW7GFNzfljP5lSp33mJV0xPYjrXtder+sb6Mr1YHbHeIB40+yLOU6R
         29+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793919920; x=1794524720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lyv+baRV8EbIAxpFEiLHk8SX2iVCBH1VZctlTVfik6k=;
        b=qZjMMBEAPxpqoL638hZBcIhBvQcrZB5YAe7HlUOhPd0dor22sKDVZ7CJT8wCfulpRC
         Q6IYXaJVAsuSJfjB+Zqqr+mYnp32UKEmKjp36nEWO2abCtR2sKlWsr8nEXDgZasBvfoF
         7hpbKy5gqI/4UB83bU5sIKK9pyRTjo5YQ9Q0/fEP5p21LzJVyY2elYU/b/4k1v+XG30W
         3rdGpNYRO2yz7OIlUftzgiPuUirF/2ebSlyTHbOwcEWljMZku0N3yl7MfOOqdWNzKNMW
         jXiGz4RgOyW83tmxax33RPPJGG+yHV4abmEeTkY6O6rYV9Arzv2RZbLNGgUqcN8luLfP
         xb4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxTA7W88c/SpCfEgAUPxo+VCcGkOJi4zAuuPBJuGRnvfuCz3n1OylA3qgBaCFWbJFrRAAIw5qn4hRkf9A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8EM1v3I75BnGKAqZUHLfmOz/puV8VeinxNW6cWk+bK6MohVsP7
	xMw1UwosaWt5yxtbJeDioGxCqaetlN/e776Doso4L9ojc5KjknC+tkyg
X-Gm-Gg: AYBFou39Xb+O2S/CTfDhmj/Sw89dxwkiEkyKj6k+61mWA/ScTVNP/YXwLUkTIcRLTuV
	tNt4PPXx/mgkZ36ExVAgeyX8v8ZIj36XrKt54OLinMIZf9GAmtP1bC/9Lbu7DziQ4ChYhuhBYqD
	7zfJnLYMOqiPec4UijhaXKnfYrHeKrdDDgBXC7ICuHnXdotdYGpGdZ6v1kxtDrfABNMRZJbLQKI
	xRih8iC0g6Cq4hsYZPdUBW+Nj+jIUI97WB73564/iJUG/7/tsVb4hxOm+YPmhv4T3UISrV7eiy1
	vHDrZfp9v+r+Q+RSb02cpEHeeC5oLMDTx8EJ1Oiie5pBcFs/j69KSPs7NGfSv9DnCiqZcaZID17
	ZgUuVY1u5yhmLQI5n4dX6vPovgRkOMFXwA+UietU/cY0+kJaRDyhv/EApX5nPg6wjLneq2K6Qqs
	CLycGckkgKVU8ARr8wktJwB3ZgN+1WU+VJ+OKQUxJBJ76OpJREheQcVdKVebkCo+CMOr1IGlKA+
	7iA4rTw2YIDLQBll0I+WQmTdwmv/Vp3vT2j/Sw1Bfns0IiKpW/0x+7EcT+mfUdYEnRT8zSg2Ere
	EMmMuk86Bt1dFSlY2LRRg9PDFeqTdravWmvUVCzUuLgo+KFbAW1+3Jw1ZkEJd1Fza+D+QQ==
X-Received: by 2002:a05:600c:3e85:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4b6e035ef86mr7748765e9.32.1793919920021;
        Thu, 05 Nov 2026 15:05:20 -0800 (PST)
Received: from figssurface ([176.223.29.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6df5eab6esm14181195e9.1.2026.11.05.15.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:05:19 -0800 (PST)
From: Afonso Figuinha <afonso.figuinha@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] media: i2c: ov9734: Support control events
Date: Thu,  5 Nov 2026 23:05:17 +0000
Message-ID: <20261105230517.12782-1-afonso.figuinha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105230327.10852-1-afonso.figuinha@gmail.com>
References: <20261105230327.10852-1-afonso.figuinha@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver exposes V4L2 controls on its subdev node but does not
implement event subscription, so v4l2-compliance reports a failure for
VIDIOC_SUBSCRIBE_EVENT.

Set V4L2_SUBDEV_FL_HAS_EVENTS and use the control event helpers for
subscribe_event and unsubscribe_event.

The change and this description were drafted with an AI coding
assistant (Claude Code, model Claude Opus 5.5). The author reviewed
them and tested them on a Microsoft Surface Laptop 1.

Signed-off-by: Afonso Figuinha <afonso.figuinha@gmail.com>
---
 drivers/media/i2c/ov9734.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index bf19ea56f..095dae964 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -13,6 +13,7 @@
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 
 #define OV9734_LINK_FREQ_180MHZ		180000000ULL
@@ -803,7 +804,13 @@ static const struct v4l2_subdev_pad_ops ov9734_pad_ops = {
 	.enum_frame_size = ov9734_enum_frame_size,
 };
 
+static const struct v4l2_subdev_core_ops ov9734_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_ops ov9734_subdev_ops = {
+	.core = &ov9734_core_ops,
 	.video = &ov9734_video_ops,
 	.pad = &ov9734_pad_ops,
 };
@@ -1013,7 +1020,8 @@ static int ov9734_probe(struct i2c_client *client)
 	}
 
 	ov9734->sd.internal_ops = &ov9734_internal_ops;
-	ov9734->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov9734->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			     V4L2_SUBDEV_FL_HAS_EVENTS;
 	ov9734->sd.entity.ops = &ov9734_subdev_entity_ops;
 	ov9734->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	ov9734->pad.flags = MEDIA_PAD_FL_SOURCE;
-- 
2.53.0

