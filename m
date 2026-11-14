Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674980;
	b=xAITCwMIWzPIZO77MjAT4zFjJl292tpytx7Eznr8GqeLiTtjjd8BeryPg4TAye7GlmUy
	 aUme6ZOSKderRf0gAWHG48CUsV1X1Sxene1ZBSRd+cbZVEYGYGafiK/0jiwgkeDZ8hHQX
	 NPUxSk16DZ/WFbYS2VuPpSL6fEJsn9RQ210q19gh+Hk0KEulgz4RC8Q5Fh+vNVL+W0NQ/
	 7DtQw1aFvnnMrD1ZHw4Vviy5Wc8eVTfrjb5jKuFk4A047tl5tftPEa8bKXfWD2F2n16zS
	 uC9HDwG29Ob+NG1ecW5VKguOXRAXxnHZn9KfPXeKJQBLE/YdfTnDFmntuW7jSrYw3iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=4MfgnZUAxYtPMdkCLogJEqW5pilJx/+POXbl7hayrsw=;
	b=njrI7QKtwlWos+/6FSeW6c9pHB8mv9NOuZoW4CvYbh6PCT7S5Cx9ouGRf81WmctwYcyL
	 9nIHPRtveNvyuZUyA1+KnJjDNbsE12MGqVUU+owJV7vv/RLxTiTwn44fACKhYw40vFpXP
	 kWxR9sPZ1AUyzb0ZQH99iLdrZyQvUyD2RRLNpmqx0kHCSwsOba06+kjot6gsBtRuiELyb
	 if0S7F0Hg/O2aG2jzn2fbFOspna/Ru7kVxeLfHfRm7i4k96f5uwqDvE2/tzQkpp7IA/I8
	 Cpqxgrulxbge5riFxqptz4SrKm7lAG8Wa7WXDYMYCFYU/FWWhDPpbTsI9giz0rdWcGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TdxsQxDx;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E57606A88C
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 16:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5E57606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TdxsQxDx
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490a0e72588so865894f8f.3
        for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 08:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794674978; x=1795279778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4MfgnZUAxYtPMdkCLogJEqW5pilJx/+POXbl7hayrsw=;
        b=TdxsQxDxZc0T9Cps6oqeJyMpBITPAEyoh+qpULe++WfWK+v6XZXF45CGxiluV9d3CE
         MVbEGey/x66s7G07TrCz9wReJwNoKcKgGqY7Sl3QUCKg1c8N3FAe66sBJ1rQzKBsNL3g
         Gxsye2duxBnaElcU9Py721YBQQrG1X8a7JH23KREZ1bOARkGNJ7ATX6K3f050R2/YIiC
         /E4L9/iHY7Z6o7RCNWg/RO2vq0t5LAxplcFAtvraVMUfchP8gK03JOxIc1fDBX1UvtoL
         jshd6CJm+X5WZiI9oEj3N8JpRm/VvnT7kvJdcHkIvi03KWLgkyzSbi70GVEqwiregruT
         MchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794674978; x=1795279778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MfgnZUAxYtPMdkCLogJEqW5pilJx/+POXbl7hayrsw=;
        b=pgEmIqeRo4iTOjpeL+qYclvHWd01E9wFJgPbxryq2ykuwhQ4H4mSs6JmfrUfDlfFEM
         KVXlDlrDsvRqRgRyxlTj/ZyNPu2tDEJWoh7gH4w1Ql/ncvwnOkBwgVx3oAxKKSrMP+Z6
         KIEy9bX5fSinmWKBhw3LL0pspa1UKkydynpsX1Nu0BpiTD4aVNa65V9imMqGXM7Bx7S8
         O8lspiuRfodP+qle/lWfWkRh6SsvmDHH6ICXZf0/LcIjOmCrOvl9lP3TF+Eivazq8avN
         TiWNNnvGa3BlYXIgfo44WBAMELEwGRMMquRLnAruhGpCQhbtdaWmslCRU05psp6Akqrx
         f+dg==
X-Gm-Message-State: APuU4Z/Bqm3d+E58hhc4pqKUrGxfm8+kSGy/wSBuQsWn48GqS8mASmEP
	E89LmmJyXGxrYrpggT9pckQVYi3JsRODYafmSn7W0htUvsTvKbt5QUpik0QuVw==
X-Gm-Gg: AYBFou0KFNx14X3RbDDlc4sfPrCmszn8R9D7ZnKnqYpwbgyH6k2TDBhPXTGZ20dyP9I
	M2h+uvrWNLe5cBfVndcPBMtazGxg4loyjkrKE4P0DbaKpIXzWx4W4LuM8/7/CzLS9wxTz1WAsQ3
	TJtu+/j+x+RS64kCQQcv2IH04/FeLanp0NG8Hv4UNC04A25oZMyjI0eUhbffJM7DUlrVvGCmoIm
	z/s/EeOQKnOv2rRP/bmnvu8PGlGZRNH50+KWgVfhmpwUrRvwiMqX8jVQa+8RBPtAFGV4vobbPyH
	utIytlnTP6LOUh3IAwj7mJAktYDcSh4Z51tLPfsyEoUraLx+b/IUOOYXuqNwGqiI6ixYjTZlywA
	I+STePhqLM/CqIYFUbGCF6JKGT1rw+gPVXl1YgvaJJ821/J7j3zjUcxqq8rNFZDfABpvoae4OQL
	SeGUtDjhmgKa9xEN6asrXQ54tzriChG0KjO2WJVh0kbjQ0Swl+FDUo2Jjv6D6RipZNHbGvmARMc
	UOGBF/bC5FOOpTl852riKLQpDdAgH/Br6WxgROd5SbQce50HLKG5C3AX1m3T4DML/qLhh15MJLj
	085OqqJBgoqEzFE+yzBGHNbLtgJ/0RWFUgKrdqhFmOvY786uV0a0yB6c6Ynj7xqT9BwxCX6j6Ag
	d86oq7iJmMfLI2A==
X-Received: by 2002:a05:6000:4918:b0:493:2eb8:e7fb with SMTP id ffacd0b85a97d-49c72ab0a38mr12067465f8f.41.1794674977448;
        Sat, 14 Nov 2026 08:49:37 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60d9fff8sm12107798f8f.52.2026.11.14.08.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:49:37 -0800 (PST)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nayden Kanchev <nayden.kanchev@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mali-c55: Serialise the ISP enable in the params and stats paths
Date: Sat, 14 Nov 2026 16:49:33 +0000
Message-ID: <20261114164933.2657337-1-devnexen@gmail.com>
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

Take capture_lock in the params and stats paths too.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-params.c | 4 ++++
 drivers/media/platform/arm/mali-c55/mali-c55-stats.c  | 4 ++++
 2 files changed, 8 insertions(+)

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

