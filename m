Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887FA486BB6
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 13:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441166; cv=none; b=IDqrLUQuAg0VRjM7we3V/W7RuWdl946ZMC5wKkG3CNiJgjRLxa/Qz7+B8AKtze8eSpj56/4+YobIAJ+Z7Z1xHGwwv79sSFxezUOpQzqGzh9fghI57y5gV/hejCUGG7tZq8iTePuUVnFQWyh/NzJLWutfcVow1/Zu1nze+fI6jZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441166; c=relaxed/simple;
	bh=6PpOaDvG7B4yvqN1w+kxiA04SVsuNsaPu4+LJMpskEw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N2hioXnnUj2bESCX+iO31AJy5NvZInWD7gh0tS69k4XAKIQSvmAG9UWgRWw3dHRbyPz6eY7KOo14xuqawI17HGdit3pZydmGNcXSH/xp6/1iftAEu1rpz/BBdZdAJkGOnXOlVsSkrlNG1Xy0F/Bc9CanY8mPmWS7w5HZYLvdIXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8s9A9xv; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8s9A9xv"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbee846deecso3042813a12.1
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2026 06:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788441145; x=1789045945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=emV5n6JyzwHHJDAPrwbCGMimUu0hxMHFjSvszb+s2d8=;
        b=G8s9A9xviegaRJ1PT8In18usvKg6pbJd0MfCSZiMPT/2NnsJ1cEcxgXvuCeAS+NWcg
         fPsXczn9AEtPOeEHL6YzuMH/eftJHUcF+rNIgpoaow7D0VQ3ysf2sMDA7hug+lStG3Im
         x3pRq+/Mx74F05QU5RLW/iQyXQ+qnc62SfwbAcLsEKdzbR5Rv/xWbWkR3vZzer8P9Lg8
         jT3/beCzSwq62YNpsZzLhYKti/YOzW4v1klTMeiJfJtKBgp0SGq93hSLtIhJCHvQ2SSk
         M+baGQmiNXFEZh03+tiV5pUOnpVyeO+Uuo0UYaeKUlvgmvEmhGBgW0i+d+vDaOTGHzDW
         EvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441145; x=1789045945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=emV5n6JyzwHHJDAPrwbCGMimUu0hxMHFjSvszb+s2d8=;
        b=nePKGLbP8r7erVA9T8Ei4c7H5xuGVZ7Cl+Hq9SJifb/woCiwbmx895IP4p5xPtKuRo
         3AMm8PdkPjJVMrlsnBr3PlKa4Lekd5rzKyX69aLmxyLy8iEK9xQCwnW6fHrCffpXRxeZ
         HuTTZpx2GDHfxn4r4dYhIZnEF1chxvkFoXl2CwuLFZSLrOEfxNNHiHIwWcxKX2HQTUFX
         j66jv4OVdWNJ+4aeBcnO7onV58wa2B5lOHv68qtBE4HOpN5quwnWptGmJurcsx/vpDwb
         WPkBRGHJrSzlHVGAWYdRknzqASKcjwbK95/UY4yt9lv6aXTL987CZgOGQyNXHvTm7fpg
         4xjg==
X-Forwarded-Encrypted: i=1; AKwUvBxedt6fusak8tq1eKcRT7p0TIyYEHNXPaGcKGtLANlyrH5zDe4l27HjIGPcqxHSgtvVPRCazb6x2UmuHA==@vger.kernel.org
X-Gm-Message-State: AFuF++mfN+jwi7VEZ5StA/3ORo+oFI3lxCQXsGQsIxlzqhebFKO6YpvR
	PAUxzwABR2MhKBv5e/fRAWox1xTOGnmtjWmcXaEgTNY+u/xhqQ8xsqQN
X-Gm-Gg: AYBFou2mPr1+5FQ1O4dFOW8EeWZ9S3J9FerDrGG8Hb5ECW+RxXfQwHex2NwigTR1vN9
	Wlbkcf5xnZlH8EpBf0x3DNI1asCHK8ckP6AXcMCx0Pch1hn8ODJKiNMG0KTVvV4YlwzrnTRDsCC
	iv23cMPQUdpLfqTP14053KwC8ZGUXjRU5Y245sTKsbVpPSWSVc/po10n6D8mXv4+B8cTbf9Iaet
	GQHR0sOWYUdHWMsr64gzQXnfGRJQ63u2RxMDTgYnLrKWhSnNLuLwKbNVRHACPRVRVGrQNgT1KRK
	MzoioFEw/UNK1uEktDA7b//iXNkw24j+GEGoUG0hj4ifVDfOqPn2xsYOw74LNsx0FmDmC8I2P0p
	TVcMpM/t/Pg+JP7x4HgPQuKxAm13rpsVFAlRk5DU+GmStJ3cjLhm5p1ruHNgbVTcyxv/sh5NQ90
	phkOLWwDpsmSAWB8Bw6zf1IXsbWGvC9dHtn/IH+tG+0rW0vxqWOVDREd/eebpUpo0TE9LWgkFgF
	Acy0fz74izp6sw=
X-Received: by 2002:a17:90b:2688:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39aee162e08mr21243652a91.16.1788441144840;
        Thu, 03 Sep 2026 06:12:24 -0700 (PDT)
Received: from XP-PC-huhb1.xiaopeng.local ([98.98.122.134])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae902354asm2692820a91.2.2026.09.03.06.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:12:24 -0700 (PDT)
From: huhb1 <huhb04@gmail.com>
X-Google-Original-From: huhb1 <huhb1@xiaopeng.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huhb04 <huhb04@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: uvcvideo: defer cancelled buffer completion until copies finish
Date: Thu,  3 Sep 2026 21:11:41 +0800
Message-Id: <20260903131141.6368-1-huhb1@xiaopeng.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: huhb04 <huhb04@gmail.com>

uvc_queue_cancel() returns queued buffers to videobuf2 directly via
vb2_buffer_done(). This is unsafe because asynchronous memcpy workers may
still hold a reference on the same uvc_buffer. Once vb2_buffer_done() has
run, userspace can dequeue and requeue the buffer while the old worker is
still running, leading to the same list_head being inserted into irqqueue
twice and corrupting the list.

The crash manifests in two ways depending on the drop-corrupted-frames
module parameter:

1. With the drop corrupted frames enabled, the old worker's
   final kref_put reaches uvc_queue_buffer_complete(), sees buf->error set,
   and calls uvc_queue_buffer_requeue(). This performs list_add_tail() on
   buf->queue even though userspace has already QBUF'd the same buffer and
   added it to irqqueue.

2. With nodrop=1, uvc_queue_buffer_complete() calls vb2_buffer_done() a
   second time. If userspace has already dequeued and requeued the buffer,
   the second completion exposes it to userspace again, and the next
   DQBUF/QBUF inserts the still-linked list_head into irqqueue a second
   time.

Both cases produce the kind of list_del corruption seen here:

    list_del corruption. next->prev should be ..., but was ...
    kernel BUG at lib/list_debug.c:64!

Fix the cancel path to remove buffers from irqqueue and drop the queue's
reference through uvc_queue_buffer_release() (i.e. kref_put()). The final
VB2 completion then only happens from uvc_queue_buffer_complete() once the
last async reference is released, so userspace cannot reuse the buffer
while an old worker still accesses it.

A buffer whose state is already UVC_BUF_STATE_ERROR is forced to complete
as an error and must not be requeued by the corrupted-frame policy. Normal
malformed frames are still requeued/dropped as before.

Fixes: 01e90464e42e ("media: uvcvideo: queue: Support asynchronous buffer handling")
Cc: stable@vger.kernel.org
Signed-off-by: huhb04 <huhb04@gmail.com>
---
 drivers/media/usb/uvc/uvc_queue.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 3c002c8f44..9206e0a355 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -289,10 +289,19 @@ int uvc_queue_init(struct uvc_streaming *stream, struct uvc_video_queue *queue,
  */
 void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect)
 {
+	struct uvc_buffer *buf, *next;
+	struct list_head local_list;
 	unsigned long flags;
 
+	INIT_LIST_HEAD(&local_list);
+
 	spin_lock_irqsave(&queue->irqlock, flags);
-	__uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
+	while (!list_empty(&queue->irqqueue)) {
+		buf = list_first_entry(&queue->irqqueue, struct uvc_buffer, queue);
+		list_del(&buf->queue);
+		buf->state = UVC_BUF_STATE_ERROR;
+		list_add_tail(&buf->queue, &local_list);
+	}
 	/*
 	 * This must be protected by the irqlock spinlock to avoid race
 	 * conditions between uvc_buffer_queue and the disconnection event that
@@ -303,6 +312,17 @@ void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect)
 	if (disconnect)
 		queue->flags |= UVC_QUEUE_DISCONNECTED;
 	spin_unlock_irqrestore(&queue->irqlock, flags);
+
+	/*
+	 * Release the queue-owned kref outside the irqlock. The final VB2
+	 * completion only happens from uvc_queue_buffer_complete() once all
+	 * asynchronous copy references have been released, preventing userspace
+	 * from reusing the buffer while an old worker still accesses it.
+	 */
+	list_for_each_entry_safe(buf, next, &local_list, queue) {
+		list_del(&buf->queue);
+		uvc_queue_buffer_release(buf);
+	}
 }
 
 /*
@@ -356,7 +376,13 @@ static void uvc_queue_buffer_complete(struct kref *ref)
 	struct vb2_buffer *vb = &buf->buf.vb2_buf;
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
 
-	if (buf->error && !uvc_no_drop_param) {
+	/*
+	 * Buffers cancelled from uvc_queue_cancel() are forced to complete as
+	 * errors. They must not be requeued by the corrupted-frame policy even
+	 * when buf->error is set.
+	 */
+	if (buf->state != UVC_BUF_STATE_ERROR &&
+	    buf->error && !uvc_no_drop_param) {
 		uvc_queue_buffer_requeue(queue, buf);
 		return;
 	}
-- 
2.34.1

