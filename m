Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792947785;
	b=RH2WnRi+VMAwDbX/DLJ1b5Hj7lD9TBMhHYFd8337w8nF9IP5VLbN1b46eRjXJJh+gu8f
	 U93itsNKrwCAmm4UxZm/leh3biPch7/aCdREJ/GOqKrsRJTDMY2dpFUjGTFFGOsgc9hCX
	 4JiFL4Jx1dPyOinIcjy6iBh3H7mS/u5BWkU7FE3+Tu/viN+VG7G0l6AcO/880f6eqjfcK
	 TZw5SnbnBHBKDotVUYgN0026Cm6j7sH2w1+mgULrFGk4Ce/uedzgws5REQUeBQjt4u+8K
	 nBW+usqMUDwBn9ozRoT2AsR2X9lcvq1Wt19l3ruEiuXqmUQnDqzlbrtqwglAR9V79eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792947785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=kC3S9vfk+9HNOv9jfdZLUrraKoDLRqNEKJ5fR821mwc=;
	b=yChp6WRMd6a2ERjn/OjctWWdwTybV8u5UIFfSLJ5bFW9zipsxmtb6eVy053YQasFHTsY
	 2w+rFvCIwoBBh/0oJ0h50ZO1vyMrFACZvRa4rp+GLuUFAkFW9NLGgtwzZhw/t3BsTJy+L
	 HF0CLOY5Pbza1ZTB0X/asptP8q3P/wb4u9zhUAd3vsZX0a/raCb5cuk8QKgcbHbjFHyJv
	 8xDD2gt9N4mTJEjLIYKbEApb9nC3o++3Sluk5vsCftZOsdB/GDEoB96Axib9Wm/ytUOlj
	 Byf/WTn7JON1Yv8rOOcli2oacQj1Pkf6kJZZ3JWZj091GxrnWSfLm/WhbBaBOGwXGoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dmSZGufx;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD76E606A31A
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 17:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD76E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dmSZGufx
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so5635485e9.2
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 10:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792947783; x=1793552583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kC3S9vfk+9HNOv9jfdZLUrraKoDLRqNEKJ5fR821mwc=;
        b=dmSZGufxSL1aS806Zv3m8Aht8d+aW9mDD4govkS/G3wi/jt5aW5fZNqKbUd/ApM0V/
         D5vc/YfbBwqtgppXEvHqGJ/gHj5k8cBZPlPC2tNNb/o1HrvM4AfA7UnRrkRXXwB4YTsW
         eMRt4byM+PnTEM7BIk6S3zz9VJPmfzX7hVNjS4Q3nLG7sqM9bsJc6xnfUT453gdv6UDS
         vGfk/+1Tp3D2H437d3DJSZHGQ3E6Kj+g0VEUCULNlYo5/zVxYz1nI04ySNGhCNuR5t4q
         PMlr10f9DFxURoviSao7ibPfzJuRCmASyQXJd0OcKBrHepxP6CoH6HbirfL5JXdtwV8M
         ljSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792947783; x=1793552583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kC3S9vfk+9HNOv9jfdZLUrraKoDLRqNEKJ5fR821mwc=;
        b=U2P929sY1bmN/xFcgsvoCJxkW/MFoIADVlovJjbF3vxTMH0eEjzEVP7dWct4R2xl6q
         U7IPliEhXEJNqvAupgj3kMENJbW9z5hofgtbLUBFSgTfBHMdCROg3mVFGNlU+2cSdGTb
         ROtis9iDHYPbBpMDnbDxSF0QyX4hnL7XTC311jQ499oPh7GHuy2pl0FyJG+2G1Il3kXF
         k4asN45erqO2j0OXWtOAwtqgCknKSOKGVSXi5hQBywMtqDlHsWoF6sWwt7LJAfH6FhH4
         lCzgS7oaCuZsseRKBuqnFJAOcmPWRKyy3AugFE3n2pXVT554Xm7daI03ZJG6ybycSSzE
         OX5w==
X-Gm-Message-State: AFq9FYLWEO3vcZEa1x1+X8ih9T6ryQ/ohIUcVGctehLpM03iBjhAtvnc
	DvOpqkCjQHa89anNjkIEoqTDGsBOTGxhVmOOl7wkcMHs92AKWSCtY6AFxXS9+WCbCJY=
X-Gm-Gg: AYBFou0+3BxHwZ3+YFWdrlYsw41i3fcsy4ef+FqI9Me6HebrrIonrpEOd84XXM5ugjA
	jAmY0NToGXQdGVUALJCHkRs+aDukeShT5shB62fHNdMjt0imKXA7uI19bmP0jpRgoaaq+eEj62m
	rEEh1Sp8GdKjyDwSbCxwjoS/SoiqLNhIIgAeCJut+JKYvv9S/qwCv0KG5VPmzDDmhO+dZNyAJz3
	D5T6ymYsDx295Du6PzOS1BJe1cbwdHQ8k5rvqeNCGADwEoURjG9R27pbHCfkXYKfTG7H0HTIm3e
	Vbc2S4lwzeBg73MvmbhDUxnqGvmlI+IY9V3S2pDlZIylB2PdPzEi+CmvOu1eAucrkDscLxees3T
	DMVucH9Cyh5xlDyCUwk4i7YFvHygPhWQeT00zrJ4QcTYkfIG6pGV3LWYqtw5WNbCx5gZPZQBMij
	7VWRnNdo3Kqrqh/J+CnkqQs93fcprWl0cLA5XWjF0Q2GeZMWvjNJv6bmR3kTvM6wosf6hId40M+
	8MVbzUohYHwum5bwWMM+c4MbTT7okxKYzDf/yTJCEZPnqKg
X-Received: by 2002:a05:600c:a00c:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4a35aca4b9emr76082455e9.20.1792947782930;
        Sun, 25 Oct 2026 10:03:02 -0700 (PDT)
Received: from fedora ([39.51.119.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a5ea0df763sm35723235e9.3.2026.10.25.10.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:03:02 -0700 (PDT)
From: Muhammad Waleed Badar <walid.badar@gmail.com>
To: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2] media: uvcvideo: Handle payloads starting in the middle of a bulk URB
Date: Sun, 25 Oct 2026 22:02:15 +0500
Message-ID: <20261025170220.42789-1-walid.badar@gmail.com>
X-Mailer: git-send-email 2.56.0
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
Assisted-by: LLM
Signed-off-by: Muhammad Waleed Badar <walid.badar@gmail.com>
---
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
+			struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
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

