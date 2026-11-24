Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521969;
	b=PNDcq5k40VJPO+uDrOI0swfCMftLigcJH3mU7NfaKyXwPHF4UnO7thNQ8RCR7z78XB9N
	 ymN/31C/seHzVgIRu5tclDvN8Jm8lp9kl4Tnj6YAX2SLXNs0bVfTTR+Nz87dw9n29GyY7
	 aK0j/3X4Bci7cs6m7CslzBpwpdG3Dc5sfbvtqrB3qO9HwziA+6713GqAeeIxsvlEB3Wn4
	 1ueODsFEALCe6fhe9i4e4YYhMBocy77AOH5xDtkZlCZoAYK6HK29+6xl70IAnZ6hNq8m6
	 wJXlFSaaGxsvec1I9CBbLvdaf27SC4gFqrwmM4w8JR9PcT/ZrfqDNbAdr9dUtctjiDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=FowArMSorhehwd66hZPNEOpPYmolYsFPd3fHPYFoqLg=;
	b=ng9tTMPDg6y/oHoRuQSp2jolmYjxdlXRhm1Fn5/AfxDUpJmiaxZj739tSghRd6l0ug/u
	 OPgQ+vvMikfTx3SGrldilWBbKyrhvWj915cwvILThsRN6IqtETo0J7M47/OPtqp/X24gm
	 7ABYpDuWh4T6uyiJHHqldYytqgyjTS89M9etDpwlPSW3cTMAJbCdPN5T1hfA2QYYrtJw/
	 SJkeXkskUf/Dr5lF1ZbxPeLPjLE+gAdnBGUva8HLiNch5NKIni/g7AyXPwmeEUr68mmzl
	 G5ArBwrHXPZqv6wLL5LwOjwDRd1FNA39/AZ+hALv929r4x3KhyMulprKfsH0W0bYG3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="NcUeM/a2";
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7C9606A33D
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 12:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F7C9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NcUeM/a2
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae25c9f857so46923491fa.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 04:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795521968; x=1796126768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FowArMSorhehwd66hZPNEOpPYmolYsFPd3fHPYFoqLg=;
        b=NcUeM/a2llWn0/CpChtJnRNTF4yDcB1QkwvEu8HXRj2Q1GHRynF4I/P5rBLWGpV27v
         IPKudErBDxhqvlf3xOVaSG2DYfbHDO4kyc88Eds6yYkAEwlNMxqstb96t1HCbuSKaRWM
         ljuGqoKRQaDrP5kFtxKw3A2oQuQWxaY8iOJ48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521968; x=1796126768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FowArMSorhehwd66hZPNEOpPYmolYsFPd3fHPYFoqLg=;
        b=FRGly/rGQP0eDr/FvJFbmTj5DCN6/h397hoVJmd51FzfTgQqLM+pT8PHDnmKmOQ/3S
         SGNOUr5bghoRcC4HqxbhuZhess8s39g8jteG13ECtUE77DsgBYpl4tniPG1idoDeTba+
         aZWYYCBLbtVaXXzEjEjRLGTYl8aHojb676y2J1YI7NX1/lhBZlOzvqbrakqlB76m5qzU
         VD+Baa3NCB8q+u7GiGZrumi5tYCJMYPKytKg9JjWmhUw9qCSTmmBjKCXnDCGB+zFFjp2
         NoXr2z2xS9I1n67nU5VzXZIhsT8EjLf24+zaeADYgP8RPubDb4yF1lBu5v0fftAAA8O6
         SmPg==
X-Gm-Message-State: APuU4Z8ULzlPt+wmcekA8tsH0OO4Dw+8cy9E2bGyety8rYP8vmVHITkW
	vVPhmGLkcF8X4cJebthAHaNEbAE+OsNY5Tr71GQu1ceo5orfAnc1fr7a6mNomBnONQ==
X-Gm-Gg: AZFdTZfHKG7csI5wexnVCQXwEw1iGqW9KoLwAPvZWc44V1qDiXcwo1+ESHoCgR1XJWi
	GK26xIBsyayRRTuaC+Q/xup7uQDuS365+aLb/QsbYRMDWiiQraLZt5VfsBz3Wo4O+vD9R1ZJ3KU
	brl2g0eZ9/LNlbZs9AwrOswtdhnTJ5wibJUHkmimkZrYAYbb9OisYMbEGI79neqTG2lCOBWMPxd
	GMh8oQ34YPnEB7gsZ4P2jXTvtMh5uuYVFmT71UDq/ZfTUIHS1/eeYPyXniJDrnmdz4dhqX8PdF2
	2jkDfC9EoI+0475A39HZfN49EhezpvXAGuBUrk/uT9Xtl1Ypg2c3LbHo0rxsKMmXZS+UzMjzGdG
	cYxQgvEakpaH71kafFXGu2K04zt1JbMa/qp4bL8F5pjkbYOIYAnHJgkdi4hU4KKVijubznv6odR
	MqQE1e36Lp6uHNDZWvj7vvw0LH+YpxLJyZcca1d1nI2z0bqEbzvyF14zPlZrKLQ7NuW7MjpYvnh
	JxhTXzKELy3MLM3PpR2grOZVmXmwA0xshHQGE+KdboJ2CTaoHwvC5ItRDk7dv8N0EBdQ6q4q2uQ
	moa8fiH00Arx36wq2jmQxRMO3y+GmKIs6OGed2OWcPG6mfwhOEqnMaKDm/HpgeTHIvnc5ITO6hJ
	J+mQ6Ocp4Bw==
X-Received: by 2002:a05:6512:b88:b0:5c1:4cab:2ce4 with SMTP id 2adb3069b0e04-5c1bc84e055mr4936072e87.42.1795521967663;
        Tue, 24 Nov 2026 04:06:07 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01772esm3654675e87.39.2026.11.24.04.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:06:07 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 24 Nov 2026 12:06:04 +0000
Subject: [PATCH v3 1/2] media: uvcvideo: Fix race condition for meta buffer
 list
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-uvc-racemeta-v3-1-f82822cbadb3@chromium.org>
References: <20261124-uvc-racemeta-v3-0-f82822cbadb3@chromium.org>
In-Reply-To: <20261124-uvc-racemeta-v3-0-f82822cbadb3@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Georg Neis <neis@google.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

queue->irqqueue contains a list of the buffers owned by the driver. The
list is protected by queue->irqlock. uvc_queue_get_current_buffer()
returns a pointer to the current buffer in that list, but does not
remove the buffer from it. This can lead to race conditions.

Inspecting the code, it seems that the candidate for such race is
uvc_queue_return_buffers(). For the capture queue, that function is
called with the device streamoff, so no race can occur. On the other
hand, the metadata queue could trigger a race condition, because
stop_streaming can be called with the device in any streaming state.

We can solve this issue by introducing two flags, stream->meta.streaming
and stream->meta.in_flight, protected by a spinlock. in_flight tells us
if the buffer is in use by the irq handler and streaming lets the irq
handler know if the metadata queue is streaming.

Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Closes: https://lore.kernel.org/linux-media/20250630141707.GG20333@pendragon.ideasonboard.com/
Reported-by: Georg Neis <neis@google.com>
Cc: stable@vger.kernel.org
Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_queue.c | 30 +++++++++++++++++++++++++++---
 drivers/media/usb/uvc/uvc_video.c | 30 +++++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvcvideo.h  |  3 +++
 3 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 3c002c8f442f..844e9baa8066 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -206,12 +206,36 @@ static void uvc_stop_streaming_video(struct vb2_queue *vq)
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
 }
 
+static int uvc_start_streaming_meta(struct vb2_queue *vq, unsigned int count)
+{
+	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
+	struct uvc_streaming *stream = queue->stream;
+
+	lockdep_assert_irqs_enabled();
+
+	guard(spinlock_irq)(&stream->meta.irqlock);
+
+	stream->meta.streaming = true;
+
+	return 0;
+}
+
 static void uvc_stop_streaming_meta(struct vb2_queue *vq)
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
+	struct uvc_streaming *stream = queue->stream;
 
 	lockdep_assert_irqs_enabled();
 
+	spin_lock_irq(&stream->meta.irqlock);
+	stream->meta.streaming = false;
+	while (stream->meta.in_flight) {
+		spin_unlock_irq(&stream->meta.irqlock);
+		schedule();
+		spin_lock_irq(&stream->meta.irqlock);
+	}
+	spin_unlock_irq(&stream->meta.irqlock);
+
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
 }
 
@@ -229,10 +253,10 @@ static const struct vb2_ops uvc_meta_queue_qops = {
 	.buf_prepare = uvc_buffer_prepare,
 	.buf_queue = uvc_buffer_queue,
 	/*
-	 * .start_streaming is not provided here. Metadata relies on video
-	 * streaming being active. If video isn't streaming, then no metadata
-	 * will arrive either.
+	 * Metadata relies on video streaming being active. If video isn't
+	 * streaming, then no metadata will arrive either.
 	 */
+	.start_streaming = uvc_start_streaming_meta,
 	.stop_streaming = uvc_stop_streaming_meta,
 };
 
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a92a986ab714..5de7f215ee28 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1732,6 +1732,26 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
 	urb->transfer_buffer_length = stream->urb_size - len;
 }
 
+static struct uvc_buffer *
+uvc_video_get_current_meta_buffer(struct uvc_streaming *stream)
+{
+	struct uvc_video_queue *queue = &stream->meta.queue;
+	struct uvc_buffer *buf;
+
+	guard(spinlock_irqsave)(&stream->meta.irqlock);
+
+	if (!stream->meta.streaming)
+		return NULL;
+
+	buf = uvc_queue_get_current_buffer(queue);
+	if (!buf)
+		return NULL;
+
+	stream->meta.in_flight = true;
+
+	return buf;
+}
+
 static void uvc_video_complete(struct urb *urb)
 {
 	struct uvc_urb *uvc_urb = urb->context;
@@ -1767,7 +1787,7 @@ static void uvc_video_complete(struct urb *urb)
 	buf = uvc_queue_get_current_buffer(queue);
 
 	if (vb2_qmeta)
-		buf_meta = uvc_queue_get_current_buffer(qmeta);
+		buf_meta = uvc_video_get_current_meta_buffer(stream);
 
 	/* Re-initialise the URB async work. */
 	uvc_urb->async_operations = 0;
@@ -1778,6 +1798,12 @@ static void uvc_video_complete(struct urb *urb)
 	 */
 	stream->decode(uvc_urb, buf, buf_meta);
 
+	if (buf_meta) {
+		scoped_guard(spinlock_irqsave, &stream->meta.irqlock) {
+			stream->meta.in_flight = false;
+		}
+	}
+
 	/* If no async work is needed, resubmit the URB immediately. */
 	if (!uvc_urb->async_operations) {
 		ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
@@ -2328,6 +2354,8 @@ int uvc_video_init(struct uvc_streaming *stream)
 	for_each_uvc_urb(uvc_urb, stream)
 		INIT_WORK(&uvc_urb->work, uvc_video_copy_data_work);
 
+	spin_lock_init(&stream->meta.irqlock);
+
 	return 0;
 }
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index af8cef94ffff..26d4461f2774 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -483,6 +483,9 @@ struct uvc_streaming {
 		struct uvc_video_queue queue;
 		u32 format;
 		u32 buffersize;
+		bool in_flight;
+		bool streaming;
+		spinlock_t irqlock; /* Protects in_flight and streaming. */
 	} meta;
 
 	/* Context data used by the bulk completion handler. */

-- 
2.56.1.809.ga0b61035b5-goog

