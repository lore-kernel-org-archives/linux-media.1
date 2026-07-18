Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BF731326F
	for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379791; cv=none; b=uDAE1nF/R+WPgEd+p3sO9fyf0WB/CZfX3WA6qRn6FLSGR1HEdafD6Xqu1LNYZPO50LnT0E1wom3aQh+eP8qZyvMlT7F0/tw2NP2LcJyZcyklmkbbQJBqV2cYxeZz/vkVIOpM0yPn3hwOhJor1k0iqlHcJ3R5C5vpMIUnZXkub1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379791; c=relaxed/simple;
	bh=HlHEfXFZJ5xtln/j37UOuB0TCVYBSKyfl8up/yiI9+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uVNrUurgCt+HTQ/Qx2ao983NS4ptQTl0aN16IQilqWr8QArHWmC3euoERUSkb8pXnIUsOJ6CUb2Z87+sW9IJmJv7za44noHUImtPMXRd5MxVLpkaQTKRQ+zVOAQTFukRHWuitCmBi41I4qyTLOqQRIcQ1Lzij31PcvZGOq3hay4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=So0S9W0U; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="So0S9W0U"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca913a601fbso5942241a12.3
        for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 06:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784379789; x=1784984589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPoS/KPRuLJigSPtx3g2dwPFdKf+p/6hoW4Ckw2zIVg=;
        b=So0S9W0Uev/I3CNjPIlevzhMbRGGW5107rKfsN+lKn27Vwo1wNsNZ0i7psVnW5arRY
         OONwn81DCPmU6gTvWH0zJlfLd5mYPznsGjZMlZ0iPQhtXRYtl1qERUwW8d0yA97EXaAL
         0oALfgwfcFlLjYle/V0qqFS3+y9CEBDlcU9wFEB40jVq1Fp6/B3LZ9fPNoowByElW6n+
         ywGRISeybHTzRJ7PT+9edrwUDup2QfPIdqWjybtXgt3U8eSbMzSums1BstuBhtg3ckmb
         klUSG0Q/N4BSddhuu0qgI7gP5jgTD8tWMuU0Bfo1YgdL6avJRedvaRrCp01/dfz2BFQe
         mLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379789; x=1784984589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPoS/KPRuLJigSPtx3g2dwPFdKf+p/6hoW4Ckw2zIVg=;
        b=mLjuln9LNPHf8R04sOdhUO49eiiHp8Wja6KCpA1+ra3WIZgxONuNbVVzKuyohRzgXz
         F8OUuJKIA0GhpN24sMOpUVZnkuGQfrbtsc+VDzC8CKO7aDVt5IBi8gd/2i8zn8nX9B1B
         XixEg5FYlgZQb8fs1Cb425KnPgRvnwBZ0OW2SGn0w/dVYEfMRNipzd6+ZFZlQc92JSz/
         nHEVhjppOEQ8a0Oe5r3dXdORZOPa4Y9n0UW+NssFHX44zT5q4SAEzBdgm/tKIja696e7
         wdxDnEIZG2LeA9poA4PVFQMqHVNL9ANi/w/MEzvvew0XomTzjIm4RGLdcFSDIoAaNG2j
         e3Tg==
X-Forwarded-Encrypted: i=1; AHgh+RpTf9Xd7KLS0swrHxhvBPQ04c9qYTZe7bFZN30jWPur+DvxkKQIiRIbEEXhUPtJul8mm6jJa8/Q6aCRFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7mqNrbIEeLQ2KRRtsDLfXsCwT/vfWkv64Y0dRYXOeAp++8QfZ
	yMIv42rzUdRZQ8NgqniahKGhXZDfSd5C2g9Gfw4FSsZRMZIB9wc0BEPg
X-Gm-Gg: AfdE7cmmCDxcZOLW3URPBljjKNyRqLc0+aBpM8opfWOBdAEoS7r6QtP7WlR3FXlF99c
	lMKxDEGcB3clzYDXe8s/UiqGSxSAX4Ta+hocK5bd2Qym9TBTuq67yR6mJTNKbxcSjiQUehLGXpi
	qWpzZlBr1DVAto+Bu5Sh7bz+HJSP3L+CNxaIbx5jqdaAMYrqpq+8tRHLfsRPHo0FwPuZ6Jmf0vc
	x6TdFv963/Go9mbiTT5HYBrxBchG2qt/ulIRhs1LAkzCmCVxcF3RZNKgk/Ej5ERHp64uPE9u0r+
	YFO1oKvoSGcPjS+j9piR7Rx7yn+e+WA7a9sUvQfU9EYEZYkh2+oI5PLO5qt5URcWTiBpnGbeUnf
	x/5711qaCLmOEVmlAfdmB7aPmtS/lqq2mFvtMsKziMaoLyCwV15v9BsBpKv+GLk+VFlkfGE0=
X-Received: by 2002:a17:90b:2f85:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-38e4b3e1015mr6893997a91.1.1784379788951;
        Sat, 18 Jul 2026 06:03:08 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4aff383dsm2766845a91.8.2026.07.18.06.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:03:08 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH v2 2/2] media: chips-media: wave5: Check decoder runtime resume errors
Date: Sat, 18 Jul 2026 21:00:37 +0800
Message-ID: <20260718130037.3306626-3-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260718130037.3306626-1-lgs201920130244@gmail.com>
References: <20260718130037.3306626-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The decoder start_streaming, stop_streaming and device_run callbacks
resume the VPU before accessing hardware, but do not check the return
value from pm_runtime_resume_and_get().

If runtime resume fails, continuing can access the VPU while it remains
suspended. Since pm_runtime_resume_and_get() does not retain a runtime PM
usage reference on failure, the later unconditional
pm_runtime_put_autosuspend() can also drop an unmatched reference.

Check the return value in all three callbacks. Return queued buffers as
required by vb2 when start_streaming fails, clean up buffers without
touching hardware when stop_streaming fails, and finish the current
mem2mem job when device_run cannot resume.

Only call pm_runtime_put_autosuspend() after a successful runtime
resume.

Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime suspend/resume")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 .../chips-media/wave5/wave5-vpu-dec.c         | 36 +++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 03d108b808ba..bb59bc962603 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1380,7 +1380,11 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 	int ret = 0;
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
-	pm_runtime_resume_and_get(inst->dev->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0) {
+		wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
+		return ret;
+	}
 
 	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
 
@@ -1544,9 +1548,29 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
 
 	bool check_cmd = TRUE;
+	int ret;
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
-	pm_runtime_resume_and_get(inst->dev->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0) {
+		struct vpu_src_buffer *vpu_buf;
+
+		v4l2_m2m_update_stop_streaming_state(m2m_ctx, q);
+
+		if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+			inst->retry = false;
+			inst->queuing_num = 0;
+			while ((vpu_buf = inst_src_buf_remove(inst)) != NULL)
+				;
+			inst->eos = false;
+		}
+
+		wave5_return_bufs(q, VB2_BUF_STATE_ERROR);
+		inst->empty_queue = false;
+		inst->sent_eos = false;
+		return;
+	}
+
 	inst->empty_queue = true;
 	while (check_cmd) {
 		struct queue_status_info q_status;
@@ -1659,7 +1683,13 @@ static void wave5_vpu_dec_device_run(void *priv)
 	int ret = 0;
 
 	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
-	pm_runtime_resume_and_get(inst->dev->dev);
+
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0) {
+		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
+		return;
+	}
+
 	if (!inst->retry) {
 		ret = fill_ringbuffer(inst);
 		if (ret < 0) {
-- 
2.43.0

