Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851543;
	b=yaDzYom8wOfehbkyD2bGwAERloFMFkj8ITWxL+4XFA0pByHWTJ7AsbickkmSXoxi9hJL
	 9jh8LajZiGSHNHgaWq6SskbW4yUzzXnDa5S87NObL1alba6efor+gVN/ajB/7O8Er6bMm
	 yx27yLqulgeN+dqo2zOL+Ld255C906Y+24NPZgpr99Xop9jwJ30FkCCMbUJ0P8NTtbgca
	 na3gPsQVPdE+pbW1smpi2xB7/UFunMlxrcsKEEhm6D0ffCvFEE+6Q1QxaycxHDeVjc5kf
	 9ESuw7KUyTHm4UwGMTdNf2wN0sQHwmtHV5sq3LrTNFTK4s8TR+/fc4GURoe75lQG5Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vZEHtU93vQZ80dtXQhFOBXZa9D/fCGl5OPLeGmvGY9I=;
	b=zNcx564vb3ShYgGxwOp7RXlt35WFiacLct+zqA5k53plLTYzz5SjDtwUMHCboAoXzUVN
	 sIYOb4+/z3ssZ1TQ8KnH1NtYJuXgZLDJ8DcFrlrefqTGduILH0ve/mHFDqI5ZMGgmC2eN
	 z7oeZ+yFTDgYE1AgSDjZVHokqtHOE1akOh8mHzZdCBtJl345+opbQXbbhCkib7v+pcUzY
	 wTJTYyNWgPG+16hWv73I+/gtkMAkcSNulFzAm/ZS1hUxtlu7EBXI+FkQc/JkQBwULpdHk
	 fy857l+SU0dycfENTZoP1a0goEeqg+ZINo98/Xj547sRSkuUW6obTn4bLex+82IlE5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="GNdP/Eid";
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261A3606A8B7
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 261A3606A8B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GNdP/Eid
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c14f7768acso3066799e87.3
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794851539; x=1795456339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZEHtU93vQZ80dtXQhFOBXZa9D/fCGl5OPLeGmvGY9I=;
        b=GNdP/EidSOjtCjEa8KNI14Lh9Gu5uvd/WWBf/4BrYTOMEyIOWVG4qaSx7JsZ2bXo5e
         FM8P/2NjzQ5lQ8zLwrrx4jTsFifvXPOCjEL3GeIQX/nfWnlFMScdHavK9N4wLXYk87Ls
         bv6zvssaNOrSYju3pjraPr4T9k+B7z/llngos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851539; x=1795456339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZEHtU93vQZ80dtXQhFOBXZa9D/fCGl5OPLeGmvGY9I=;
        b=h0mK+w2lC+W9qTN93+25O40o+PcDQqkb4OVMnYLGKlAU4Fv5Nix5csI1JWMdj2TSSL
         mAUGRLUj8hL2QnqjBWEnBJ/tpM93B+nQcdlFfdaWqUCpfqsKi+8mNrAJXVGxtFmFtX+o
         xQhWaAsllvYKv2Zf2k+HkHm3pGkTCPPvjQ32wbn+8/T9pu+wCIsC8cqDTif7AFiVQXn8
         4kebVW1QIGINUyii9IZgFs8sjAEG3H1SgOD1QafUcUD4WEGZu/nr0On9kPEhXpTq1UhO
         23rTz5XSDfCOeLeG3tyHIZG7zIHycLeKaUGAnT3A2ae2QigxyTVvFnnqLP7CjQF7xDEt
         Vt4g==
X-Gm-Message-State: APuU4Z+kOxe0A1jWocL4RkcxldSyZJfgjbxxuSVZRlOQDXQwTItUMjyW
	UWmvRZ5YP8xnBLTvc+mqmV6CWTUekz+P6ujOWbb7J1Kiz7+WqaFL0suWa7TPHHZQZA==
X-Gm-Gg: AYBFou1pMryq9JcNk87cpETg44IOPogV/KTwyDKNIwQeqDXTgyM+vNeo8370/cs1qXb
	XpbjKvGjwGRvUlUM561GM/+u4qKeBe7vOZIa8sufmlqCsghYkrOtkC0iyQe5muxkQqsS7UTH0Sp
	jWt9PMOICOguXrq6BCZfw2IamGDibJgStovhd/LZ58liEz6YHO0U27tffTJn6ok5ROZxnKWBFCN
	Pm3Cw49HKlsNt1AuaNZJd2hWkwAalF1aIsW5ulFWMy4Allv2tRUUoA4NLGQppNHvVl1HjnaD0B1
	HN2//S5Dn8QAqJrcOoqEV+gdAWStXMa1tjNVdbn3bnQKsIfZg9DfE94u2Z36PgqmMaIY8O0yfdR
	dxsCmvASmPCLOpd3bXokPvqm/b+j6qh3hCmAwzjDp23nKxFbSGtFKwoNuJ0Byeb6kWVE/BoDTAa
	vAURNi3K7EiSRqxCmyZ+dQFD+IkGx/1C8EDXi4CfBcBssp5c4AVLbD+tfvTg6KPeHPEj+yXwrU8
	zv3z9yYEZfchKTNgqJcTRLuDJYYMIWYGQUiRC5xlc75PfH/VOf9nCOvIU24NS/HPU8sQt1tKWCi
	LrqGXnEsFZZxUv8gE4cy6gcc7LhEye3fE6Z7abqsGzs7Pnn0FZWX7mDa6KXdNi3GKU2PRIySZW1
	qn/agolcMdA==
X-Received: by 2002:a05:6512:1395:b0:5bf:a2fd:c713 with SMTP id 2adb3069b0e04-5c1705d895bmr4037875e87.4.1794851539343;
        Mon, 16 Nov 2026 09:52:19 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171333630sm3391252e87.19.2026.11.16.09.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:18 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 17:52:13 +0000
Subject: [PATCH v2 6/6] media: uvcvideo: Add uvc_video_parse_pts_stc_sof()
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
Message-Id: <20261116-uvc-shortmeta-v2-6-62d4a8176fb8@chromium.org>
References: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
In-Reply-To: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

The timestamps in the UVC headers are unaligned and in little endian, so
it is easy to make mistakes when parsing them.

Create a new helper function that parses PTS, STC, and the 11-bit SOF
counter, so header timestamp parsing (and bugs) stays consistent across the
codebase.

Note that the SOF value is now always masked to 11 bits, as the remaining
bits of the SCR are reserved by the UVC specification. This slightly
changes the behaviour of the stream statistics, which used the raw 16-bit
value, and of the duplicate SCR detection in uvc_video_decode_meta(),
which compared the raw 6 bytes of the SCR. Compliant devices are not
affected.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 127 ++++++++++++++------------------------
 drivers/media/usb/uvc/uvcvideo.h  |   3 +-
 2 files changed, 48 insertions(+), 82 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 4e32600d9326..91fa8c21995f 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -565,33 +565,32 @@ static unsigned int uvc_video_min_header_len(u8 header_info)
 	return min_header_len;
 }
 
+/*
+ * Parse the PTS and SCR fields of a UVC payload header. The caller must
+ * ensure that the header is long enough to contain them.
+ */
+static void uvc_video_parse_pts_stc_sof(const u8 *data, u32 *pts, u32 *stc,
+					u16 *sof)
+{
+	unsigned int header_size = uvc_video_min_header_len(data[1]);
+
+	*pts = (data[1] & UVC_STREAM_PTS) ? get_unaligned_le32(&data[2]) : 0;
+
+	if (data[1] & UVC_STREAM_SCR) {
+		*stc = get_unaligned_le32(&data[header_size - 6]);
+		*sof = get_unaligned_le16(&data[header_size - 2]) & 0x7ff;
+	} else {
+		*stc = 0;
+		*sof = 0;
+	}
+}
+
 static void
 uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 		       const u8 *data, int len)
 {
 	struct uvc_clock_sample sample;
-	unsigned int header_size;
-	bool has_pts = false;
-	bool has_scr = false;
-
-	switch (data[1] & (UVC_STREAM_PTS | UVC_STREAM_SCR)) {
-	case UVC_STREAM_PTS | UVC_STREAM_SCR:
-		header_size = 12;
-		has_pts = true;
-		has_scr = true;
-		break;
-	case UVC_STREAM_PTS:
-		header_size = 6;
-		has_pts = true;
-		break;
-	case UVC_STREAM_SCR:
-		header_size = 8;
-		has_scr = true;
-		break;
-	default:
-		header_size = 2;
-		break;
-	}
+	u32 pts;
 
 	/*
 	 * Extract the timestamps:
@@ -601,20 +600,20 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	 *   kernel timestamps and store them with the SCR STC and SOF fields
 	 *   in the ring buffer
 	 */
-	if (has_pts && buf != NULL)
-		buf->pts = get_unaligned_le32(&data[2]);
+	uvc_video_parse_pts_stc_sof(data, &pts, &sample.dev_stc,
+				    &sample.dev_sof);
+
+	if ((data[1] & UVC_STREAM_PTS) && buf)
+		buf->pts = pts;
 
-	if (!has_scr)
+	if (!(data[1] & UVC_STREAM_SCR))
 		return;
 
-	sample.dev_sof = get_unaligned_le16(&data[header_size - 2]) & 2047;
 	/* If the sample SOF is identical to the previous one, quit early. */
 	if (stream->clock.last_sof_raw == sample.dev_sof)
 		return;
 	stream->clock.last_sof_raw = sample.dev_sof;
 
-	sample.dev_stc = get_unaligned_le32(&data[header_size - 6]);
-
 	/*
 	 * STC (Source Time Clock) is the clock used by the camera. The UVC 1.5
 	 * standard states that it "must be captured when the first video data
@@ -948,9 +947,8 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
 static void uvc_video_stats_decode(struct uvc_streaming *stream,
 		const u8 *data, int len)
 {
-	unsigned int header_size;
-	bool has_pts = false;
-	bool has_scr = false;
+	bool has_pts = data[1] & UVC_STREAM_PTS;
+	bool has_scr = data[1] & UVC_STREAM_SCR;
 	u16 scr_sof;
 	u32 scr_stc;
 	u32 pts;
@@ -959,33 +957,8 @@ static void uvc_video_stats_decode(struct uvc_streaming *stream,
 	    stream->stats.frame.nb_packets == 0)
 		stream->stats.stream.start_ts = ktime_get();
 
-	switch (data[1] & (UVC_STREAM_PTS | UVC_STREAM_SCR)) {
-	case UVC_STREAM_PTS | UVC_STREAM_SCR:
-		header_size = 12;
-		has_pts = true;
-		has_scr = true;
-		break;
-	case UVC_STREAM_PTS:
-		header_size = 6;
-		has_pts = true;
-		break;
-	case UVC_STREAM_SCR:
-		header_size = 8;
-		has_scr = true;
-		break;
-	default:
-		header_size = 2;
-		break;
-	}
-
 	/* Extract the timestamps. */
-	if (has_pts)
-		pts = get_unaligned_le32(&data[2]);
-
-	if (has_scr) {
-		scr_stc = get_unaligned_le32(&data[header_size - 6]);
-		scr_sof = get_unaligned_le16(&data[header_size - 2]);
-	}
+	uvc_video_parse_pts_stc_sof(data, &pts, &scr_stc, &scr_sof);
 
 	/* Is PTS constant through the whole frame ? */
 	if (has_pts && stream->stats.frame.nb_pts) {
@@ -1476,34 +1449,27 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 				  const u8 *mem, unsigned int length)
 {
 	struct uvc_meta_buf *meta;
-	size_t len_std = 2;
-	bool has_pts, has_scr;
+	unsigned int len_std;
 	unsigned long flags;
 	unsigned int sof;
+	u32 scr_stc, pts;
+	bool has_scr;
 	ktime_t time;
-	const u8 *scr;
+	u16 scr_sof;
 
 	if (length <= 2 || !meta_buf || meta_buf->state != UVC_BUF_STATE_ACTIVE)
 		return;
 
-	has_pts = mem[1] & UVC_STREAM_PTS;
-	has_scr = mem[1] & UVC_STREAM_SCR;
-
-	if (has_pts) {
-		len_std += 4;
-		scr = mem + 6;
-	} else {
-		scr = mem + 2;
-	}
-
-	if (has_scr)
-		len_std += 6;
-
+	len_std = uvc_video_min_header_len(mem[1]);
 	if (stream->meta.format == V4L2_META_FMT_UVC)
 		length = len_std;
 
-	if (length == len_std && (!has_scr ||
-				  !memcmp(scr, stream->clock.last_scr, 6)))
+	has_scr = mem[1] & UVC_STREAM_SCR;
+	uvc_video_parse_pts_stc_sof(mem, &pts, &scr_stc, &scr_sof);
+
+	if (length == len_std &&
+	    (!has_scr || (scr_stc == stream->clock.last_scr_stc &&
+			  scr_sof == stream->clock.last_scr_sof)))
 		return;
 
 	if (meta_buf->length - meta_buf->bytesused <
@@ -1520,8 +1486,10 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 	put_unaligned(ktime_to_ns(time), &meta->ns);
 	put_unaligned(sof, &meta->sof);
 
-	if (has_scr)
-		memcpy(stream->clock.last_scr, scr, 6);
+	if (has_scr) {
+		stream->clock.last_scr_stc = scr_stc;
+		stream->clock.last_scr_sof = scr_sof;
+	}
 
 	meta->length = mem[0];
 	meta->flags  = mem[1];
@@ -1531,10 +1499,7 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 	uvc_dbg(stream->dev, FRAME,
 		"%s(): t-sys %lluns, SOF %u, len %u, flags 0x%x, PTS %u, STC %u frame SOF %u\n",
 		__func__, ktime_to_ns(time), meta->sof, meta->length,
-		meta->flags,
-		has_pts ? get_unaligned_le32(meta->buf) : 0,
-		has_scr ? get_unaligned_le32(scr) : 0,
-		has_scr ? get_unaligned_le16(scr + 4) & 0x7ff : 0);
+		meta->flags, pts, scr_stc, scr_sof);
 }
 
 /* ------------------------------------------------------------------------
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 278c7b0e535c..b416a4ae0de0 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -525,7 +525,8 @@ struct uvc_streaming {
 		u16 last_sof_raw;
 		u16 sof_offset;
 
-		u8 last_scr[6];
+		u16 last_scr_sof;
+		u32 last_scr_stc;
 
 		spinlock_t lock;
 	} clock;

-- 
2.56.0.679.gc527c65306-goog

