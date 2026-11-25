Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604186;
	b=t1r/923ZcspYEg200Es6HfCndadg8cG3UvzCPFF5NYvsCr0A1LdTHr/aHA+Vv3rCP5wE
	 DcaBM4t8rN03wDwdWXxZHVzQzcSjU/9eKKxMuwnPyDnGNgzRn4NpALHc260BBrEM9NpXh
	 AmcLWXsT+h3NpbulT8xZh4NSBkBAG5MN9qow0VHkPr16XTjFT2MJygE4CEi56pKExn7aA
	 KbsL9IgG8XHrIcBc7k84bGdNrtFzShA1zvBtDzXrNoMdRqVIEdciLP5ctQZ7y9HQPIa7v
	 0/25CCDWnIpjokhU7+86+URsYNvGCX6ywz6V1CPtheGVG5NQ8NcFqhgTBVmwBDWM4GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FJOKwoI4nZDDgERDFtfVbeF2wwjtESDm04yE6n76iXo=;
	b=Zmic42DOYxV7O50DupjIYHQS85+HDCe/d/qactECVZiRNp0P+TM4xp45asCoVqYF3tkL
	 cCgasHaZDICJwooDhEnV1PVieoLfKqFSJTxTg1VUHphDM6LOpsKV3qA7Qs7FBveQeqRm0
	 zwEnWCvN5Cn7rgAothPRtzobeF4tiNMJ7sFl1EdDBytVTBrbEjHhFlH2JRhVcfc8Z4tDc
	 Kt3a2kItvRo8mhKxGR7hr/K+EucyfJpp+kseB/9oF4to5PgNmS9t0pVPdTVqN48uemfL0
	 bhOXtkpg0q9PzeBzf/dn22PNkzE/vvmTkwaZMkV44kyuiG49AhX8DWA0NF0UzdfzyJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uG5AoejD;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65526606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65526606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uG5AoejD
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49412eb1474so3626528f8f.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 02:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604185; x=1796208985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJOKwoI4nZDDgERDFtfVbeF2wwjtESDm04yE6n76iXo=;
        b=uG5AoejDVEKJJavEqPbereLnAU8Ll13LSLVcUCL8eUYTpcVslYfWhSmEKwt3SBWjpb
         VUej4R5ove27BFmFWqgQEZgW/kNzN+bjCGHdXUE6tlC3w1o/eV4p90WX8hWQ7/io+dGL
         jGL5Hxye9Fr95U//0dvbKmKG3R3BhilpHedV9TYyzzK/SLE5Jzw1GJ48+/fvs5P+NO7D
         ygpvvQqTVAqqYwj06Vm97w0l+mh9kFaniPhDAltvmCyfpSaxzMMCeeRBgu8KDy5YBCBB
         lz35EdmvGAKf+duNIkwMxGLr3fa9S3bdVs0MDReCCjIPJ5iM7R3Ww5vdAOX+H6Y6YMst
         1dgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604185; x=1796208985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJOKwoI4nZDDgERDFtfVbeF2wwjtESDm04yE6n76iXo=;
        b=Eb/m6lZLXVFPbeyTnSeCkv67M4cNewOdC6o8AyRP7h9YZIrv50FXvbzEI/umuEL3cU
         YMZpAP+SaO4/ldB0+NQLQYcMf9NhgHTFqxI2012Sfuu4beZOXVMLVq3N8DZXgHHhSL2r
         yrvDEBeAc2kzsXG044QD1llD9KtKh5sSX/OGrsKTUqq/uA4AITgltOwqhAvsc0kKt8Az
         tOkAKrHeETPt5lkFsLfNsqhtRiO3eF2uBv90v8h9bquFk7HNMUJYco2bHPTsaZ6dOW6T
         j5IgObWhSgc0HEg6dqsEYK8yC86EyweQTqBQvvhtOsQA9gRZaqbbgI6OC8CZh/wVYvT/
         ZR9g==
X-Forwarded-Encrypted: i=1; AL+hErE3eY2TyWulzgFmukcDmADhYEcugf8fFeztt3mzauWyw+z5zg7pXqbn5UbPcHyVSeNZifCsZnqR1lJOfA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+1tAdJ54KU7Xu8SPJMnBMi3oXBrKvo1ulhZIHr0SF8QxLeYG8n
	GxloUOF6Q4fjiv2e9alhDA6eKobUYigY/4uROaz6PjyrUZ2edUZaCiUO
X-Gm-Gg: AZFdTZeUrZ3LeqNP7hv9w1F1lGzR+sfKGKvO9OVt4u4WCOrFdub2iWfnuvfzLu4DgJK
	dHR4dQT5cys1mC65+ouIhBYGQaEqNOzc/k+v+ckpcxNDNO3FcvCD4pm2KS4l0OeEoxpdtetDlV0
	i7wViNvo+A/ihPGrqNNYQtjDmsTxtsy7wp2dGBE0GJQVdx553pebgVGhYqxzNZ92+TYEEU9Pa4P
	b6YbIbtY5S088bS96zsTpIiXOmN7S/pFj55zoWbBRLLQevr63K8P57+96XUtt4x+5E2kFcQts4w
	Uoh0KLcxuV8lF3mTQHIPcbZ/3aLpe+2sdP8bYSHsv7eWvbSwsY560tTsRJPx3kfSM+7ORNkxeMz
	OHaKk6nAx4SniSYTOk77WX653iRU6BVcdX/ggQKA3U/x2svyDv5hEknE+EUvW4gOUvAayI1sXDt
	BURobxvUbxvYU2UHfduA8aCo16CnCGogZ4vJePqulwbI/z6ivUrrGDN9Sa7SZ9dfk7R/onoybbp
	Q+RvyUf9UKe1RMRXFt9WYUP9nOkSzuAiFRdHqA7hCMqMGoTjhx5ggQRkAy57ZWWYp0qZ4FNuHvs
	BTFMqKR5UfxOvJEZ0Zki7T1AlSk3y4tJmhO1CrMyw0ZQTFC3O7aeLc89e/YfREcwKpOrL+UFNVc
	axrgqRlCyGd6/fQ==
X-Received: by 2002:a5d:6f13:0:b0:491:3fdd:af42 with SMTP id ffacd0b85a97d-4abb5cc19b5mr30289182f8f.37.1795604184433;
        Wed, 25 Nov 2026 02:56:24 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm33988993f8f.58.2026.11.25.02.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:56:24 -0800 (PST)
From: David Carlier <devnexen@gmail.com>
To: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com
Cc: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	linusw@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: mali-c55: Serialise the ISP enable in the params and stats paths
Date: Wed, 25 Nov 2026 10:56:06 +0000
Message-ID: <20261125105621.239518-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Only the capture devices hold isp->capture_lock around the
mali_c55_pipeline_ready() check and the ISP enable or disable. When the
last two queues to start are on different video devices, both can see
a ready pipeline and both enable the ISP. The second call fails with
-EALREADY and its queue's start_streaming_called flag is cleared, so
the ISP is never disabled again and every later start fails.

Take capture_lock in the params and stats paths too, and assert that it
is held in mali_c55_pipeline_ready().

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: David Carlier <devnexen@gmail.com>
---
v2:
- Add lockdep_assert_held() in mali_c55_pipeline_ready() (Jacopo)
- Collect Linus's Reviewed-by
 drivers/media/platform/arm/mali-c55/mali-c55-core.c   | 3 +++
 drivers/media/platform/arm/mali-c55/mali-c55-params.c | 4 ++++
 drivers/media/platform/arm/mali-c55/mali-c55-stats.c  | 4 ++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 241a625f7284..bf80935c20d2 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -13,6 +13,7 @@
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
 #include <linux/ioport.h>
+#include <linux/lockdep.h>
 #include <linux/of.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
@@ -510,6 +511,8 @@ bool mali_c55_pipeline_ready(struct mali_c55 *mali_c55)
 	struct mali_c55_params *params = &mali_c55->params;
 	struct mali_c55_stats *stats = &mali_c55->stats;
 
+	lockdep_assert_held(&mali_c55->isp.capture_lock);
+
 	/* Only wait for queues connected through enabled media links. */
 	return (!media_pad_remote_pad_first(&fr->pad) ||
 		vb2_start_streaming_called(&fr->queue)) &&
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index 16e895e3488e..6515c78c1bb2 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -762,6 +762,8 @@ static int mali_c55_params_start_streaming(struct vb2_queue *q,
 	struct mali_c55 *mali_c55 = params->mali_c55;
 	int ret;
 
+	guard(mutex)(&mali_c55->isp.capture_lock);
+
 	ret = pm_runtime_resume_and_get(mali_c55->dev);
 	if (ret)
 		goto err_return_buffers;
@@ -796,6 +798,8 @@ static void mali_c55_params_stop_streaming(struct vb2_queue *q)
 	struct mali_c55 *mali_c55 = params->mali_c55;
 	struct mali_c55_isp *isp = &mali_c55->isp;
 
+	guard(mutex)(&isp->capture_lock);
+
 	if (mali_c55_pipeline_ready(mali_c55)) {
 		if (v4l2_subdev_is_streaming(&isp->sd))
 			v4l2_subdev_disable_streams(&isp->sd,
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
index a9c28b090b2a..cbd2a2f77da3 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
@@ -146,6 +146,8 @@ static int mali_c55_stats_start_streaming(struct vb2_queue *q,
 	struct mali_c55 *mali_c55 = stats->mali_c55;
 	int ret;
 
+	guard(mutex)(&mali_c55->isp.capture_lock);
+
 	ret = pm_runtime_resume_and_get(mali_c55->dev);
 	if (ret)
 		goto err_return_buffers;
@@ -180,6 +182,8 @@ static void mali_c55_stats_stop_streaming(struct vb2_queue *q)
 	struct mali_c55 *mali_c55 = stats->mali_c55;
 	struct mali_c55_isp *isp = &mali_c55->isp;
 
+	guard(mutex)(&isp->capture_lock);
+
 	if (mali_c55_pipeline_ready(mali_c55)) {
 		if (v4l2_subdev_is_streaming(&isp->sd))
 			v4l2_subdev_disable_streams(&isp->sd,
-- 
2.55.0

