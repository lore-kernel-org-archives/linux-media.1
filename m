Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F443AD511
	for <linux-media@vger.kernel.org>; Sun,  6 Sep 2026 09:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788686677; cv=none; b=rEAkCjJMo5TNSLjGEGKywcmRMoEyM848skAoT28o7S89Ken881ED/+t7ZdzwNNRim73GpMhxWy6W3sC7yxp/hhDfRPuTzz7fOc+rxera1DOJDI4PmSSPbMeSIfs7XzNZWRWtctFvH95Y5F3msLMLOwfIY+7EcRzIm0LJgXDpiOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788686677; c=relaxed/simple;
	bh=R0d2I2oFbcaISY9HYkvAh+fEqUo/dGsfYd8ObVhTkvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KutgOa789qfQl8tDhNgB5kE6wULQG+zhVF1hcptOIBgxB3JO/KRlEr85e6tI64UL+eQJZC+Mt+OL/yeHN6+4S61Er+wN3SsxoOHCWPdz0+o6BVCmzxouG/IAk4TwJXmsFYYNWxKrC7A/sih/zl4IquRlGMG2cn//P2yM0keD6Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnQSFFXk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnQSFFXk"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so18562955e9.3
        for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 02:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788686674; x=1789291474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ey8A+s9kaQEFouzsUcbahf9veFscS+cZ76Rl/QxLJxk=;
        b=jnQSFFXkR/0qcrK3lHgwdPUq2hNZM1k/7SFaLadUSy71AQkijIARUM2Y3k2H7+VkOf
         /W0oaWRb6OjC7zvJoaeSCSQfsD+oz51UIHcpohSGuzheP5BHQIpy0/9BeCU1shlZk39e
         RooxDPi6JwbJm9K7cD2ehwXKKx+pB3K1kjkLin+6KC1h8qT+ECs95Jy+PysMc6Wi3+5C
         RM/YWbggagJXvk4qmHTeD5n1CcNEpG/9xT3SPvfUrvwNzInFMy8E96bdwEhIUZjRmt+P
         pO20M5p3uruJt/+l9vVEWuVdZ8Xa7MHFVpis/CDTpuR0nDXrjusffyLjVD8q5b/pQGNs
         7aXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788686674; x=1789291474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ey8A+s9kaQEFouzsUcbahf9veFscS+cZ76Rl/QxLJxk=;
        b=deibq/TZT0HxK0eIDHKud5jUpdHxE3P4ueg7vKYht2yPF6WnZVHKBP/sP83edCbVI5
         YsQWiHSQGbM+4qZGbp7Xs+VCZ1T+MGAggaweAl3cotXjgRe2xsXaJZTsnE3RCZ9R3ZgE
         Wrfs58xgRaumnCJnBgAEYm6sesezRlculIiIYymQCrdGL0CjH4/axC4k87o3qIErMPPy
         UxSN3bXT0nvc63KvBkIeO2IQjd1FhJuqdvNJGk68O+XtCZ+/Ghj/ka02T2fvEslmMvQr
         ZbLDeHFbvNzQPFIWhAaCWI+wcJ+IAA+zd5mLOtShXT+zS4baZoZQ9mJHN1XJqDB+P/df
         XhNA==
X-Gm-Message-State: AFuF++kNR0p8wE3vXbCAmmqW3X/Eoact7ztCsASha68ld1Wwc1nmMPlW
	6x8UPjVom7ROZxqMOGX1cDSSnaW1UdRa1wMgbsgHM/ZGEpvuGo9CG//mBtnKHA==
X-Gm-Gg: AYBFou2We40BWs1HfAoYrNIFn4aPgJdQ5BRCf3TqNFVvXBWjcRgKnnGYZDwGl1/2j9n
	IVIGXqiQhosNGxh/ivSPV1DhyYGzJ4+qUd403nodkRhK8IjqOfhq2eaEUtmqY0nNbP/Qhn4YpXG
	1EdzNfKEzxgcgoxQeP49EdH44ZgVqsoCQl+cCpjonxMsi4m+bS6YJEPxVZ52SPocgRDXqWnNFQP
	nlFFcIZe/trxpYPyZPtmfTnLoMilcvVewO9clTjccBe5vw6oCwV3fCgF2jsI3N3U11dWCdaNPqW
	/t2Z2oOC9UEb5Emdb37aOT50wTGjeDZzD++YlJ4bdxsAAVDuHWLGWfGuaDIm6ohW/K71pEjPBvn
	gSiTAbeLA/aEuDZjpP7v9b4TzslihcPiI56Eoi5ktp/A11IgybeEFjUHwSjPBA7KvwLEIESl2W+
	uSlYW0J16H3UDHfaSIQzDYs913fMyqLRJsuEJCEKAOtPugCU8Vz+E+pIHiX2Pt70afEo4kL5dqJ
	ENuReDjVofd1bAKpXO9xnAMK0JpYCQVcsMyhQizhOhi2dTV
X-Received: by 2002:a05:600c:37cc:b0:499:ad2e:f7bc with SMTP id 5b1f17b1804b1-49cf823f107mr175775965e9.10.1788686673822;
        Sun, 06 Sep 2026 02:24:33 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm216768265e9.0.2026.09.06.02.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 02:24:33 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org
Cc: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	nayden.kanchev@arm.com,
	hverkuil+cisco@kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH 2/2] media: mali-c55: Check the statistics buffer address before filling
Date: Sun,  6 Sep 2026 10:24:25 +0100
Message-ID: <20260906092429.50046-2-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906092429.50046-1-devnexen@gmail.com>
References: <20260906092429.50046-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mali_c55_stats_cpu_read() copies the metering registers into the buffer
returned by vb2_plane_vaddr() without checking it. As for the parameters
queue, a DMABUF whose exporter cannot be vmapped yields NULL, and the
memcpy_fromio() then dereferences it from the threaded interrupt
handler.

Report the failure to mali_c55_stats_fill_buffer() and complete the
buffer with VB2_BUF_STATE_ERROR.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 .../platform/arm/mali-c55/mali-c55-stats.c     | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
index 655e52a5f288..a9c28b090b2a 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
@@ -200,9 +200,9 @@ static const struct vb2_ops mali_c55_stats_vb2_ops = {
 	.stop_streaming = mali_c55_stats_stop_streaming,
 };
 
-static void mali_c55_stats_cpu_read(struct mali_c55_stats *stats,
-				    struct mali_c55_stats_buf *buf,
-				    enum mali_c55_config_spaces cfg_space)
+static int mali_c55_stats_cpu_read(struct mali_c55_stats *stats,
+				   struct mali_c55_stats_buf *buf,
+				   enum mali_c55_config_spaces cfg_space)
 {
 	struct mali_c55 *mali_c55 = stats->mali_c55;
 	const void __iomem *src;
@@ -211,12 +211,18 @@ static void mali_c55_stats_cpu_read(struct mali_c55_stats *stats,
 
 	src = mali_c55->base + MALI_C55_REG_1024BIN_HIST;
 	dst = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
+
+	if (!dst)
+		return -EFAULT;
+
 	memcpy_fromio(dst, src, MALI_C55_1024BIN_HIST_SIZE);
 
 	src = mali_c55->base + metering_space_addrs[cfg_space];
 	dst += MALI_C55_1024BIN_HIST_SIZE;
 	length = sizeof(struct mali_c55_stats_buffer) - MALI_C55_1024BIN_HIST_SIZE;
 	memcpy_fromio(dst, src, length);
+
+	return 0;
 }
 
 void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
@@ -224,6 +230,7 @@ void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
 {
 	struct mali_c55_stats *stats = &mali_c55->stats;
 	struct mali_c55_stats_buf *buf = NULL;
+	int ret;
 
 	spin_lock(&stats->buffers.lock);
 	if (!list_empty(&stats->buffers.queue)) {
@@ -239,8 +246,9 @@ void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
 	buf->vb.sequence = mali_c55->isp.frame_sequence;
 	buf->vb.vb2_buf.timestamp = ktime_get_boottime_ns();
 
-	mali_c55_stats_cpu_read(stats, buf, cfg_space);
-	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	ret = mali_c55_stats_cpu_read(stats, buf, cfg_space);
+	vb2_buffer_done(&buf->vb.vb2_buf,
+			ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
 }
 
 void mali_c55_unregister_stats(struct mali_c55 *mali_c55)
-- 
2.55.0

