Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57037448B81
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 06:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791527689; cv=none; b=C1vg7Oh8GOxSWlIEztO3gDJUcHg9+a9rG+FQhPTruQhQwEs/qCFcG7mPeIQ9aHHzUVHRYGymnxjV4n/igo61A4ZCfFfdL6ZT3QkSOTi4xI9mO9owMXhDLBc2TatS6mQu5b+QkhpWbwb4yO+Z62WrDGhROgf9uL3hm5/ACNTI53c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791527689; c=relaxed/simple;
	bh=ro/ic/vsKCEpCz/T2m2SZHX3DPlyK7OVbpXKy10IK+s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LMVlwOUBa7p7WLY8TeMIuk5akIvULqOq1oZAZx6HFQPr3Kc9G+1xOZMCwNHw698uwKlr4TITTEuKfyJ++EDazeiomfZhtTJWeUNqlEykpq+P/2I+ubySaf0rewBdF21Kmt9zK3xrtDXEoSjny2FPqEVg8bfMY3LJTIP1OvfKqk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNok3SbP; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNok3SbP"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3115c4451c8so5211278eec.1
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 23:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791527687; x=1792132487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iUpYYLLItdOrvPTmFBwuTL2yJS4jOONcdBareKtSIxE=;
        b=mNok3SbPp3ormoDDiRS9hnpMA7mssCyREiYLPCWFi6rmn4nYx/I+rkkiyK3nFpTT3L
         bZEhOc1Td0zdF4BaG7i8O01P362rKCEINM2MPmyOjn9SQ1W8mWTHM2xHq3+Nt7ZzqdBo
         zEsGO6KP2lGOHx/9AIdz8jHHxOS0EYYlS9ACNRI9n61CrHS7Js6wDSMjzZrxgnr+rgH9
         y4tZaT57HpIIeP3heunkg+07DJJXBL+mrq+mwYtQ38//bSkb++9mI+NaLK6favQolMMJ
         HrCsYfoE4VlL36bG8nhawZlH3YnUYLCNHqISQGgEF0F2vrv8sQjJ3P/TIFrQFrYz1H2J
         VsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791527687; x=1792132487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iUpYYLLItdOrvPTmFBwuTL2yJS4jOONcdBareKtSIxE=;
        b=LAlI8B1dlAsTYnA2CaAtHyVvWwLOSe4dA76lZoBBJIWUrx55GGRsK8VhCeInKdRIN2
         i1um0tw/bxA+0wNXHzUdOBGgJH+b6/NJHItqjJZAKUIkKbfhNzGAecoqGnZ5Gi14eS9R
         tffmV6ZLlWa9F8yHM+0TgCRUmqdEriePfFhQurS/pcmMoklvrD1EWcUBvqrIyFF7Pj72
         ObdYXh3s9tp+lwvNmPy9hiLG3lJXeq9TMpdrsBZ/YISbQdHOTxslajIsfNmIFNDHNEr0
         YNrm8yecV3ok9ioY76/T2PsxE8ePM5Yd01pjOHyL6p0s9we0EFQBs5GS9TE6Y1noWrjD
         JTtg==
X-Forwarded-Encrypted: i=1; AKwUvBwUrpth2eNHwM58zL9IdInTP4Y8EYZefmF5PsjPhJRN6B//zPcu7Zk1IEUpXr73vxl9iSlqXX7ZW3iR0A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKYQDeKrzjQYwXxIrkVjNq7/o7cfgYitesSHzO3UdJGsXIEVaqT
	4h0DSGR1jAX7e2yQaw6wsjvWtU5zPfI7gUVXhEpW/1lu69WYMulBOzqU
X-Gm-Gg: AYBFou0Wc0ZQ11n+1tOwPr8WpH2qojIIzlA7v1kfQasLcHFjcukibc9HFCdjFqWlXG5
	dExT7rHQ354L6GBFPk/D5qCP8SWWjSHZPRUyK8fxk2/r7Xq8b1TzqJZjp+lLi9DT0pYpC2Zphnr
	xorDaDseSSwrjE3qanrkYm+QIOXHmBcDkFtxEaCkiAWNNFb9ozm46onDkitanmsUvFuN1GIqT1+
	hy/Xe7qTKO4zFNcBTdBHmR4VKvzCfSf2bfKdrlrRQNStCAm1FZJouRCrIztHY6H5AAzR+LYiRy5
	+Y/ZwLeBV1r28a475oyU3y6MSIy5NVtlvKu+LkQS4lGqB3oN1exQK9r6qKWLk/4bSgqP+h+4tGg
	7WpGp2srubGgOv4gv8J2nz87TVdu2+YPmYOf1113B9QhBvMfizvRptNbRmPgIpt+uwqpCHv+Fp0
	VRXQF9iWTbN/XkjHEm4smSGK16buQk9bes4lsIINpsAUCHBWUm4xUDxEWyVOiZ2sxHldaFpLL1Z
	Vsb41pxdCj9F4m2r1Aznms=
X-Received: by 2002:a05:7301:144a:b0:351:7cfd:21d4 with SMTP id 5a478bee46e88-3537dfb8620mr1449268eec.8.1791527687198;
        Thu, 08 Oct 2026 23:34:47 -0700 (PDT)
Received: from XP-PC-huhb1.xiaopeng.local ([98.98.112.197])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca67b21sm4127080eec.11.2026.10.08.23.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:34:46 -0700 (PDT)
From: Hongbing Hu <huhb04@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org
Cc: mchehab@kernel.org,
	kieran.bingham@ideasonboard.com,
	ribalda@chromium.org,
	linux-media@vger.kernel.org,
	linux5-kernel@vger.kernel.org,
	Hongbing Hu <huhb04@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] media: uvcvideo: defer cancelled buffer completion until copies finish
Date: Fri,  9 Oct 2026 14:34:32 +0800
Message-Id: <20261009063432.1781-1-huhb04@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The UVC driver processes frames in URBs. A frame usually is divided
into multiple URBs. The URB handler parses the header and the
metadata, but leaves the expensive memcpy to a workqueue.

At any given moment, while streaming we will have:
- the current frame with (0-N) async memcpys waiting to happen. The
  current frame is in queue->irqqueue. It has a refcnt of 1 + N memcpys
- Previous frames with (N) async memcpys waiting to happen. They are
  not in queue->irqqueue. They have a refcnt of N memcpys

With the current behaviour, when a URB completes with an error we flush
the queue->irqqueue irrespective of whether the buffers have any
pending memcpys.

There can be situations where the memcpy occurs after we have flushed
the frames and they are returned to the user. Instead, we should
exploit the refcnt mechanism to return the frames only after the memcpys
have been completed.

Fixes: 01e90464e42e ("media: uvcvideo: queue: Support asynchronous buffer handling")
Cc: stable@vger.kernel.org
Signed-off-by: Hongbing Hu <huhb04@gmail.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
---
v4:
- Reworded the commit message as suggested during review.
- Documented in uvc_queue_buffer_complete() that it may be called with
  queue->irqlock held when buf->cancelled is true.

 drivers/media/usb/uvc/uvc_queue.c | 24 ++++++++++++++++++++++--
 drivers/media/usb/uvc/uvcvideo.h  |  1 +
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 3c002c8f44..c491735cfe 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -122,6 +122,7 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
 
 	buf->state = UVC_BUF_STATE_QUEUED;
 	buf->error = 0;
+	buf->cancelled = false;
 	buf->mem = vb2_plane_vaddr(vb, 0);
 	buf->length = vb2_plane_size(vb, 0);
 	if (vb->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -289,10 +290,17 @@ int uvc_queue_init(struct uvc_streaming *stream, struct uvc_video_queue *queue,
  */
 void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect)
 {
+	struct uvc_buffer *buf;
 	unsigned long flags;
 
 	spin_lock_irqsave(&queue->irqlock, flags);
-	__uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
+	while (!list_empty(&queue->irqqueue)) {
+		buf = list_first_entry(&queue->irqqueue, struct uvc_buffer, queue);
+		list_del(&buf->queue);
+		buf->error = 1;
+		buf->cancelled = true;
+		uvc_queue_buffer_release(buf);
+	}
 	/*
 	 * This must be protected by the irqlock spinlock to avoid race
 	 * conditions between uvc_buffer_queue and the disconnection event that
@@ -350,13 +358,25 @@ static void uvc_queue_buffer_requeue(struct uvc_video_queue *queue,
 	uvc_buffer_queue(&buf->buf.vb2_buf);
 }
 
+/*
+ * kref release callback for uvc_buffer.
+ *
+ * If buf->cancelled is true, this function may be called with
+ * queue->irqlock held, as uvc_queue_cancel() releases the queue's
+ * reference on cancelled buffers while holding the lock.
+ */
 static void uvc_queue_buffer_complete(struct kref *ref)
 {
 	struct uvc_buffer *buf = container_of(ref, struct uvc_buffer, ref);
 	struct vb2_buffer *vb = &buf->buf.vb2_buf;
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
 
-	if (buf->error && !uvc_no_drop_param) {
+	/*
+	 * Buffers cancelled from uvc_queue_cancel() are forced to complete as
+	 * errors. They must not be requeued by the corrupted-frame policy even
+	 * when buf->error is set.
+	 */
+	if (!buf->cancelled && buf->error && !uvc_no_drop_param) {
 		uvc_queue_buffer_requeue(queue, buf);
 		return;
 	}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b6bcee4a22..1b611715fa 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -317,6 +317,7 @@ struct uvc_buffer {
 
 	enum uvc_buffer_state state;
 	unsigned int error;
+	bool cancelled;
 
 	void *mem;
 	unsigned int length;
-- 
2.34.1

