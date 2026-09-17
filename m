Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F058A563FCE
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 14:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656441; cv=none; b=T3YttJuobpukHQ6Mqf+LlwMK2SPQFi7w+/bdD/bQtaHvrMysC9cXtl5qbjCLxQltuDiA99Lo/H0YDJNqa0p77b8lrVooHG9EUn7fP1GHfJlkZ38vsdiyVCYS0wX7YneWx5oXlKbRX76YH8YE6jtsKCxB+hfQD27zretR1MM0x+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656441; c=relaxed/simple;
	bh=JTVOOqBLxjQeWLPSh9xRNLuLQ6DPdJMZGlzu92p69p0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dd9U/vj0wOONh9YlLDErSjv5Fc6EocFe4en+aZtOn5UyP553OV0NMggQ0pBnb141AAqItetyraYa4Kq0rrPzV1lbGsxn6f2y5G3l3mZEnKhVfhYmi12ekYFxy5ZaMhOTTdHMcvVVGrPl2ZWufo4LWo1KlDekfScZyhRn4Txulo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkMgz6F2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkMgz6F2"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2db710396ffso6675185ad.1
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 07:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789656423; x=1790261223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ujNOkUzuREKqEPDzBdRIyHN6iqZeIKccbajh8FSPByA=;
        b=bkMgz6F2hIzZJ5EOywaLr5v9UyQ59MiCdPT1n3jP7ctHg1qdKfmkAMcE2KMEm4vd3b
         PIWe3Rx45yoSBpNc62e48nFmf0/7ZdNbR/1ZEKbTHoCqrDhDF31sCA06WMFeJHEhuzWV
         zV1iy85FxleDKk3qM/cZkj/hroVusEUodtuxnpcPZ0LzptZ1pyFkbv1Zo1/T2EU+WuKX
         C1mcN/GFc8YJRlEf+7YlwL0PDrCCWjtK6WN+uMqItLor9eoWWbbtfUkPWegaar88yDVb
         arKfQ5nU2WsRCMydH5Amuz1M/AduxVYgWVyCCu6ISTZtA3E8Akty2T4fmE1adIqT/ek1
         JNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789656423; x=1790261223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ujNOkUzuREKqEPDzBdRIyHN6iqZeIKccbajh8FSPByA=;
        b=B9TlpDUuwS1JI826lVT9iMp1ovxF+fKzNmHe1IyX+sZ6SN64dJIIFgliavtagLnrb3
         Mmb77am3/s99kEh8mIdcO5BkahYbXTnUDDWD0DEZ919eRT6l1L1sR7raDGl1u9RaCzrZ
         gwrLttn2j0wS1gQlcZlEjATrPSuyGYFDnHPLPgXFYQxwTY0CJqckeqf0OTLfKCRrv1AQ
         0bGy+mZH9aZ2JyzrWAVXj6TUSqj1hGH2RHUQC9H01DxIECTcyBs+lqY6vT7bosJbz31H
         VYTHlWL7hkVXfKnXWJ6QtjuaOTuVSABjQszrcFWLGyxmfjK8BXU/Z0DTpGcxGrjBipQS
         uTUA==
X-Forwarded-Encrypted: i=1; AKwUvBwZeX3DJ9IoKAHSCIrBPicgShEQUFTNjb5AyeGSJOZrBx8Fo+0qjiqhUU3Hc370xkajxSI3p2GLNmqBBA==@vger.kernel.org
X-Gm-Message-State: AFuF++k/E1MIdNU6breYtfI47QHk0LzvuyK4yQ0XAfAno0RRoeLgZO3I
	GwkBlUblOEhxXz/pxDGLqLVh81BsqUHuOtxJkMFXfR8hClrpJO3I56LJ
X-Gm-Gg: AYBFou3mKM6b2M0TC3ZOkt5gh6f1XlMiOFBrvah4LCbZZPwOQSnQ6AGRMdzHi2hCSjP
	X7LF7KxDnyjp9gGFENOP5417hes5Cix7rQcHjdn/0PktQpva0qbldFFxPmOLoo9/rY2Gqxi5NQ6
	TYP9SkmaT3jQFRopp6svOSIJuLZJzN8ASBPMBLTBI+t9u+bfVZbMj1Qf+1xbMAPSBtiSrDg5bJR
	J/RSKUADhDtET77EiSwegHr2rx1dJFE40uNuIQ1cfBOxpBDOMWgFKevQikJmYJC2y9r6J8rxz8r
	8liq2FQmkb3X2HZuIKSiSferXlFFuIKKlIDvvCZ8/EvqmmbDhjopkGKaxuQwcuS4OByadyRHq7C
	9+VvZ9ArAfB1HUkrkfVWEQPdbtPh+VY8XbfW6X8Wm1gVC3AtcA+LvBZDxWVP3oqxMwHV4XSWKOJ
	uKoxpylJw1ykSpIDhqynw4xTlUHi+/b/6sh3vWOo3EI0ErOzOvMTQiXXx8gZ7FK2js8JtLCvrh6
	o/32hcJ/dbt3BncXseV/kc=
X-Received: by 2002:a17:90a:1188:b0:39e:39a0:b5b3 with SMTP id 98e67ed59e1d1-39e39a0c33emr2951779a91.1.1789656418637;
        Thu, 17 Sep 2026 07:46:58 -0700 (PDT)
Received: from XP-PC-huhb1.xiaopeng.local ([98.98.122.134])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e360ddfc2sm5481434a91.16.2026.09.17.07.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:46:57 -0700 (PDT)
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
Subject: [PATCH v3] media: uvcvideo: defer cancelled buffer completion until copies finish
Date: Thu, 17 Sep 2026 22:46:30 +0800
Message-Id: <20260917144630.16923-1-huhb04@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903131141.6368-1-huhb1@xiaopeng.com>
References: <20260903131141.6368-1-huhb1@xiaopeng.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uvc_queue_cancel() returns queued buffers to videobuf2 directly via
vb2_buffer_done(). This is unsafe because asynchronous memcpy workers may
still hold a reference on the same uvc_buffer. Once vb2_buffer_done() has
run, userspace can dequeue and requeue the buffer while the old worker is
still running, leading to the same list_head being inserted into irqqueue
twice and corrupting the list.

The crash manifests in two ways depending on the drop-corrupted-frames
module parameter:

1. With the default (drop corrupted frames enabled), the old worker's
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

Introduce a dedicated bool cancelled flag in struct uvc_buffer,this keeps
the cancellation semantics explicit regardless of any later state updates
from the packet decoder.
Cancelled buffers are forced to complete as errors; normal malformed frames
continue to be requeued or dropped as before.

Fixes: 01e90464e42e ("media: uvcvideo: queue: Support asynchronous buffer handling")
Cc: stable@vger.kernel.org
Signed-off-by: Hongbing Hu <huhb04@gmail.com>
---
v3:
- invoke uvc_queue_buffer_release() while holding the spinlock to keep it simple
- Set/clear the new cancelled flag in uvc_queue_cancel() and
  uvc_buffer_prepare() instead of overloading buf->state. 
- Force cancelled buffers to complete as errors,
  so the returned buff->state is UVC_BUF_STATE_ERROR.

 drivers/media/usb/uvc/uvc_queue.c | 17 +++++++++++++++--
 drivers/media/usb/uvc/uvcvideo.h  |  1 +
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 3c002c8f44..1026d7def3 100644
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
@@ -356,7 +364,12 @@ static void uvc_queue_buffer_complete(struct kref *ref)
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

