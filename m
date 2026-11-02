Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657038;
	b=iyk2ydiq32FcT0oHFT2hRGbpyy8cYO8SRL0tDknYu4ric8xFleTsR3fdTntgUa9XZiim
	 3ZUoUWWQgpcPeg/TPGM0bCR8m+WtTUYgNrGzERid0IsYrtJue8MR+m0j6wCpVOV1pCWZT
	 hIaKfNkBRTLtyKbF7h0mMM/ZiITpeHB5dXPqSeTkc6YXKfBeSecso45/djCKTjX0KN3JZ
	 p9jBlR3vEe1/yCHir/VzO/8t9MC/BnvxEL008tWL/k6I2yTg2IXsli3W+HomxvPtUjbBq
	 YplMBQDpGWCORilwkUft5vI0JJhBJuxaB4PCR26kcbBoJukjdTQ8UQNajGWf0d2d2QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DncHvoOx1Bk3VdBYZQNnZtb51zAHtz3xGgwwKAZ+m10=;
	b=qCBPt9OC1w0QhHyUL244O7nISZfUya/S5W2GsA2x0OrDksf86pdJmIT7k2KgpPtly82F
	 /pLDYzRnVZk5RDEbtjCve4UHSP77Fw9ndCIPQ/Gc6Hella/EhxJb1HhQxDJy5w5gJkPR4
	 LuTtBvITXZ5eOEbwEu3DS5PrRh5ZuiqBbVrBCdRyho7hB9diMIWpw1QwVggGqS687/3kV
	 nLYr0UuywsSIBnp35LHxKjWmiVDQitsPvgodYtDzd22WsuOR0J9djabbjF58nOKrs8FMh
	 u9+6hicfR7LSGxx9zHqf3hmQkP9+P3TdOXGa9kiY8pyk/e9zfZ5C64vWp1tQB+2lZpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zvXhj5/7";
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89731606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 22:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89731606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zvXhj5/7
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso428780866b.3
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 14:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657036; x=1794261836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DncHvoOx1Bk3VdBYZQNnZtb51zAHtz3xGgwwKAZ+m10=;
        b=zvXhj5/7bYQ1aS0bJasF2TTeW+DTwO5l+SM+ohcKISP1lTX3qrfls0Bim79gb2jNPY
         9WmY4s9l/SYQsMuibZ2+faYa31Lweq9COWu2QMfBy8bktkDgKI6sg+3JtJEM9yLiKFm1
         wbWaTgAnmvXuFIhHlAGkXmKgUOOrSYRmuJIYKWeXgxX2YQCGjNDo7GTIZFEoNt8VC4VI
         a996NZJsZs5Do/4aWDjlljs+dQdS3DCvYQiKDpcm48urgkzbB3qGUSuh8ok2yNfIXH7d
         vt5HGzgUk/djYRLGAYc1/Bg0O7cEWoJbA8nvhptrol0GEETPI+EbdP81uJwEZ2UFnMfU
         P0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657036; x=1794261836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DncHvoOx1Bk3VdBYZQNnZtb51zAHtz3xGgwwKAZ+m10=;
        b=s6ARAVBguvynHVwjBO0j+pkyAY5qRA6av23v8ZzHqFjkn2LCUlfRLTHlu4E0o3bG4f
         7pT2HF6CV/Fjrw2poSaRtaVX066q/7SzSv/9i1TVGaHig/oXGXoL74yjwxm46o4hpEN+
         suVz70CcDH+k4FvWUx8PraxpuS6GEAza1bpMmWsgXTZarOP4xx0mTMShp/25U+7YUboN
         nUSKIDwt8EaHSZU2CP9VAladmUmvcniCR/9+xqwC1Rle5e/YIdOEE1W3jWwfJCxeMFjs
         MN0OmJtiV+qHPBpVZOT69kMIoK0zxqeI6e8lN+5L/sBmzeSReKNAk73xcCI977MCSOq0
         0TNg==
X-Gm-Message-State: APuU4Z8N1/Dcx+gQnyOckA6WKAvVCQcXS2tU5NG2aXpBuGnIr3p8J/Yf
	VEELdicdkMHL1b/YcZfFWJRDKop6uJlpLxngZVs6ulZevL9l3f1q2JP4qWorExrz
X-Gm-Gg: AYBFou0LWuQRUWmwU+VsLs+3485BS0auB1oatuZvcCBbgMFple8qHCUKNti/xo+LMh3
	Y4/1hyjJi31hFXdWx0EXOoMdcs0WvlrWR8dp7+pc4AY86lr8ChnCuInBRniF88PmtauP2oa2GOw
	ABeYmGkKCX7QmMoMqG1oDg1Kl2379R1giy6/nJWb3nRn1LsQkFW+SI39ONbt/4XzLXKWRz4BSUH
	B+D5m7XIro4QJe8ETtnKEYlpV+bpSarl1Vj3/xQHp+Dq0snxmQ/amVRS3B/j8igHpWoIDBXGuUg
	3zq3ZLy0bU7ad6hcrS2dk0C49rtNp1F4RlcP7sOpKIYimsZK1cdixMM4LF7hEm3pa6+RJ90boJN
	1MIv9ptOp2IC2xsoJMb+uN7gQZoaW88BsMO7p7qc8T4QDOQP9UF1Yv6IAEmo5tHJmUnpiNXF0VH
	AEoMWUpliskVccPpz//jiu0u7/YZidWDDlGmYH3GS3L83vcgrn96dvoAaBqGhmsdptuRzzdX9VX
	nfxSNsGo6LSVH1BZXEpeTptCw5Zi2zai11gTD2oon3JYn2h+Wv6VS5McEb+8UghPUWsRtpbyQdX
	p7Bpzl/PWEvrXX2DhnzPYg==
X-Received: by 2002:a17:907:3f9e:b0:c29:4fcb:2886 with SMTP id a640c23a62f3a-c4ca7ac023amr899897166b.39.1793657035537;
        Mon, 02 Nov 2026 14:03:55 -0800 (PST)
Received: from fedora ([39.51.57.121])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf009b8sm27470266b.42.2026.11.02.14.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:03:54 -0800 (PST)
From: Muhammad Waleed Badar <walid.badar@gmail.com>
To: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Muhammad Waleed Badar <walid.badar@gmail.com>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: uvcvideo: Handle payloads starting in the middle of a bulk URB
Date: Tue,  3 Nov 2026 03:03:36 +0500
Message-ID: <20261102220339.70218-1-walid.badar@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025170220.42789-1-walid.badar@gmail.com>
References: <20261025170220.42789-1-walid.badar@gmail.com>
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

The bulk decoder assumes that every payload starts at the beginning of
a URB. It detects the end of a payload either by a short URB or by the
accumulated payload size reaching dwMaxPayloadTransferSize, and then
decodes the start of the next URB as a new payload header.

The Realtek USB Camera (0bda:579f) integrated in Razer Blade laptops
sends payloads of dwMaxPayloadTransferSize bytes back to back without
aligning them to URB boundaries, which is not compliant with the UVC
specification. When a frame spans more than one payload, the next
payload header lands in the middle of a URB. The driver then copies
that header and the data that follows into the current frame, and
parses frame data at the start of the next URB as a header. This shows
up as "Marking buffer as bad (error bit set)" and "Dropping payload
(out of sync)" trace messages, and most frames larger than one payload
are returned empty or truncated. On this camera every MJPEG mode above
1280x720 is affected.

Add a UVC_QUIRK_BULK_UNALIGNED_PAYLOAD quirk for this device. When it
is set and a payload ends in the middle of a URB, split the URB at the
payload boundary and decode the remainder as a new payload, provided
that it looks like a payload header (EOH bit set and a header length
that fits the data and covers the announced PTS and SCR fields).
Otherwise the URB is processed as before. Print a non compliance
warning once when the workaround is used.

The quirk is limited to this device, and the header check is kept as a
safeguard, because other non compliant bulk devices append trailer
data to their payloads, and decoding that data as a payload header
would break them. Devices without the quirk are unaffected. The quirk
can be enabled for other devices with the quirks module parameter.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=207045
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Muhammad Waleed Badar <walid.badar@gmail.com>
---
Changes in v3:
- Align the continuation line of the uvc_video_decode_bulk() declaration
  with the open parenthesis, as reported by the Media CI checkpatch run.
- Link to v2: https://lore.kernel.org/r/20261025170220.42789-1-walid.badar@gmail.com

Changes in v2:
- Limit the workaround to the Realtek 0bda:579f camera through a new
  UVC_QUIRK_BULK_UNALIGNED_PAYLOAD quirk (Hans de Goede).
- Only split a URB when the remainder looks like a valid payload header,
  so devices that append trailer data are not affected, and print a
  non-compliance warning once (Ricardo Ribalda).
- Link to v1: https://lore.kernel.org/r/20261009165248.56440-1-walid.badar@gmail.com

 drivers/media/usb/uvc/uvc_driver.c |  9 +++
 drivers/media/usb/uvc/uvc_video.c  | 95 +++++++++++++++++++++++++-----
 drivers/media/usb/uvc/uvcvideo.h   |  2 +
 3 files changed, 90 insertions(+), 16 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e289cc71b..cfdcfd96a 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2887,6 +2887,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
+	/* Realtek USB Camera (Razer Blade) */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x0bda,
+	  .idProduct		= 0x579f,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_BULK_UNALIGNED_PAYLOAD) },
 	/* Sonix Technology Co. Ltd. - 292A IPC AR0330 */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index fc3536a43..8a1e4bc77 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1612,27 +1612,20 @@ static void uvc_video_decode_isoc(struct uvc_urb *uvc_urb,
 	}
 }
 
-static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
-			struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
+static void uvc_video_decode_bulk_chunk(struct uvc_urb *uvc_urb,
+					struct uvc_buffer **bufp,
+					struct uvc_buffer **meta_bufp,
+					u8 *mem, int len, bool short_urb)
 {
-	struct urb *urb = uvc_urb->urb;
 	struct uvc_streaming *stream = uvc_urb->stream;
-	u8 *mem;
-	int len, ret;
-
-	/*
-	 * Ignore ZLPs if they're not part of a frame, otherwise process them
-	 * to trigger the end of payload detection.
-	 */
-	if (urb->actual_length == 0 && stream->bulk.header_size == 0)
-		return;
+	struct uvc_buffer *buf = *bufp;
+	struct uvc_buffer *meta_buf = *meta_bufp;
+	int ret;
 
-	mem = urb->transfer_buffer;
-	len = urb->actual_length;
 	stream->bulk.payload_size += len;
 
 	/*
-	 * If the URB is the first of its payload, decode and save the
+	 * If the chunk is the first of its payload, decode and save the
 	 * header.
 	 */
 	if (stream->bulk.header_size == 0 && !stream->bulk.skip_payload) {
@@ -1671,7 +1664,7 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
 	 * Detect the payload end by a URB smaller than the maximum size (or
 	 * a payload size equal to the maximum) and process the header again.
 	 */
-	if (urb->actual_length < urb->transfer_buffer_length ||
+	if (short_urb ||
 	    stream->bulk.payload_size >= stream->bulk.max_payload_size) {
 		if (!stream->bulk.skip_payload && buf != NULL) {
 			uvc_video_decode_end(stream, buf, stream->bulk.header,
@@ -1684,6 +1677,76 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
 		stream->bulk.skip_payload = 0;
 		stream->bulk.payload_size = 0;
 	}
+
+	*bufp = buf;
+	*meta_bufp = meta_buf;
+}
+
+/*
+ * Check whether data looks like the start of a payload: a header with the
+ * EOH bit set, and a length that fits in the data and is large enough for
+ * the PTS and SCR fields it announces.
+ */
+static bool uvc_video_bulk_is_header(const u8 *data, int len)
+{
+	unsigned int min_len = 2;
+
+	if (len < 2 || !(data[1] & UVC_STREAM_EOH))
+		return false;
+
+	if (data[1] & UVC_STREAM_PTS)
+		min_len += 4;
+	if (data[1] & UVC_STREAM_SCR)
+		min_len += 6;
+
+	return data[0] >= min_len && data[0] <= len;
+}
+
+static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
+				  struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
+{
+	struct urb *urb = uvc_urb->urb;
+	struct uvc_streaming *stream = uvc_urb->stream;
+	bool short_urb = urb->actual_length < urb->transfer_buffer_length;
+	u8 *mem;
+	int len;
+
+	/*
+	 * Ignore ZLPs if they're not part of a frame, otherwise process them
+	 * to trigger the end of payload detection.
+	 */
+	if (urb->actual_length == 0 && stream->bulk.header_size == 0)
+		return;
+
+	mem = urb->transfer_buffer;
+	len = urb->actual_length;
+
+	do {
+		int chunk = len;
+		int rem = stream->bulk.max_payload_size -
+			  stream->bulk.payload_size;
+
+		/*
+		 * Some devices (such as the Realtek 0bda:579f) start the next
+		 * payload immediately after the previous one instead of in a
+		 * new URB, so a payload boundary can fall in the middle of a
+		 * URB. For those, split the URB at the payload boundary if
+		 * the data that follows looks like a payload header. Other
+		 * devices may append trailer data to a payload, which must
+		 * not be decoded as a header, so leave them alone.
+		 */
+		if ((stream->dev->quirks & UVC_QUIRK_BULK_UNALIGNED_PAYLOAD) &&
+		    len > rem && uvc_video_bulk_is_header(mem + rem, len - rem)) {
+			uvc_warn_once(stream->dev, UVC_WARN_BULK_UNALIGNED,
+				      "UVC non compliance - bulk payload starts in the middle of a URB. Enabling workaround.\n");
+			chunk = rem;
+		}
+
+		uvc_video_decode_bulk_chunk(uvc_urb, &buf, &meta_buf, mem,
+					    chunk, short_urb && chunk == len);
+		mem += chunk;
+		len -= chunk;
+	} while (len > 0);
 }
 
 static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b6bcee4a2..59ad516ae 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -81,6 +81,7 @@
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
 #define UVC_QUIRK_MSXU_META		0x00040000
+#define UVC_QUIRK_BULK_UNALIGNED_PAYLOAD	0x00080000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
@@ -661,6 +662,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
 #define UVC_WARN_MINMAX		0
 #define UVC_WARN_PROBE_DEF	1
 #define UVC_WARN_XU_GET_RES	2
+#define UVC_WARN_BULK_UNALIGNED	3
 
 extern unsigned int uvc_clock_param;
 extern unsigned int uvc_no_drop_param;
-- 
2.56.0

