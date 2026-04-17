Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C15E3624B2
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 05:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776403179; cv=none; b=ApRHCXEen3obVVB9su2iYyD0MK4tSk4L2l79ymvbVZzaapmtC9l6h5FaptRjqQULHBYAJ0jnrcfhHHR6YzHFNTRp8q84NNWmCcbFmpAhcq/tHtAAcBVtnoq+4iNxMLPCIK59YGcUqHpBt01pU9kOUEYvqdYoV8zl8Q0oFmFUozM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776403179; c=relaxed/simple;
	bh=6cXnR11AY9ml1d9hIfJBq2oGPFWYViO0i3fyyo+E50s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q41yw7okeM0aEfAwQTSRcygeX5SqfiX4UxiKPJrMDLzUsziMFUOHNtQdjd/yUb2P+cIx5AAeo6BDBkMlCpC+K+gFW99rUiUGH+vgl1n098Rh+VwTPgy5hZ/ZCKws3ljt/ms/kH80FCtsHkX4V2zp1dnDdnRi8tZx6cXwUHZWq3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OfGHRxu7; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OfGHRxu7"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38e7c3a2deaso1790541fa.2
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 22:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776403176; x=1777007976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IoIm2efe3+/Yu0jHwJFHPW2lBg8zlPP9DqLMDf5q0Uw=;
        b=OfGHRxu7mYvMQDpY64sXDlWVDgldOYcA63RIJ1ftHBwNvJy5nVS+zv1gaBVrMZE/EN
         dKddqaxol8jnHwOMA4ooxQQf1nxwbTWaqWriUnggIR+wKlLry9S9HlPQPFBshVRxd7wD
         eh4titzNZFAuZEWC4gbfY9WqE3I2sbVBTByTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776403176; x=1777007976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IoIm2efe3+/Yu0jHwJFHPW2lBg8zlPP9DqLMDf5q0Uw=;
        b=nMnDMk4mmvKPtFUbW4eiEnUpP0z1onYsGZzjXr10rlcdCDIe8U4bxxZiK6B4+bZFRo
         H/fGoDKfsBFdGujzob05Vdls+CaHHizw5cVQQJ3Khc2C5TAti+x2Km1/NwQmwmW+TvVX
         Y2yEbekC/OTzU/K92VXIbcb2PO/xDfu8sJhcbmLr7as/uuuH8XyJDQilW2/LiNeG0Wlt
         KVHc0VA1+kYSGqz/WmvDLuHWV/S/RrsseZTX2+h5/Zlwy6dXtlnW5+2bfbvgY3ukLmGD
         VdJ1lfRgmCfdq83JWsLZAdF5Dgm0ZL75sayY+k1uZK3fXRzUfC78Uq0elsE64MqQMhSR
         Xhhw==
X-Gm-Message-State: AOJu0YzwKf/8wDWQUTaBxCD5w4kpJjaPYi7N1qoUfYK/UFCgAAtnVYb3
	8jrJ8mvc8/iykwm1G5OzCzSpE85J/CzTznPdaa+9At4uLZSeLNRvxVbhMgf3KtaD+Q==
X-Gm-Gg: AeBDietDeeuUnoQt1zaSsVjdBcLl6OJEcaPD9KsnijveIuqXODvOtX5W22tUNH2DWT2
	YBaJWGSDvQHURx+rtGC8Rd4jKv5/zJDbHc8/fyJ1vLn7RjCkza2nbCroR85v+V3FYE1Q59nMC4z
	bpf1WnqPtNHPeFvP75GYR+dBTQfVbFlGAmAKsQhRrhmAD7IXrG4FZwwEJgIG7SXAb2guGRF4yiQ
	ObdIOXoxNY+Oi7lGEHUgK3c2NBaw2MtsiNchXLUzT77DwcI9LPB9w9PlG61V3Rnk7Ue8tJPsXg0
	5KBA0UkCcGaJJXC9D7zMFtyaEKZDg5cFYnbWGRcwicmaXkms341tw6uK/0jSoRWIMpBJgZenYbB
	EkuKnZ4SVij3LRsRrTP1mDLLgt+lY14qtGqjmZIu9zwVFdcK4QHHHff65OmvdbLbcBRlOQ5Qk2h
	f0U2UXpEVV+060wbANhVaUBuh0nESurbNbBvCJ5H33Lo4b0iJV7TYyYBUEmjJb+k1jmwoXleOvg
	5RRRFusmR667EtZDw==
X-Received: by 2002:a05:6512:3d17:b0:5a4:3fe:9d41 with SMTP id 2adb3069b0e04-5a4172b7a9fmr341349e87.3.1776403176388;
        Thu, 16 Apr 2026 22:19:36 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f5035sm1293491fa.4.2026.04.16.22.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 22:19:35 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 17 Apr 2026 05:19:29 +0000
Subject: [PATCH v2 2/2] media: uvcvideo: Avoid partial metadata buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-uvc-meta-partial-v2-2-31d274af7d2d@chromium.org>
References: <20260417-uvc-meta-partial-v2-0-31d274af7d2d@chromium.org>
In-Reply-To: <20260417-uvc-meta-partial-v2-0-31d274af7d2d@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

If the metadata queue that is empty receives a new buffer while we are
in the middle of processing a frame, the first metadata buffer will
contain partial information.

Avoid this by tracking the state of the metadata buffer and making sure
that it is in sync with the data buffer.

Now that we are at it, make sure that we skip buffers of size 1 or 0.
They are not allowed by the spec... but it is a simple check to add and
better be safe than sorry.

Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 5d45c74c6041..cd77ca6f8136 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1149,7 +1149,9 @@ static void uvc_video_stats_stop(struct uvc_streaming *stream)
  * uvc_video_decode_end will never be called with a NULL buffer.
  */
 static int uvc_video_decode_start(struct uvc_streaming *stream,
-		struct uvc_buffer *buf, const u8 *data, int len)
+				  struct uvc_buffer *buf,
+				  struct uvc_buffer *meta_buf,
+				  const u8 *data, int len)
 {
 	u8 header_len;
 	u8 fid;
@@ -1278,6 +1280,8 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 
 		/* TODO: Handle PTS and SCR. */
 		buf->state = UVC_BUF_STATE_ACTIVE;
+		if (meta_buf)
+			meta_buf->state = UVC_BUF_STATE_ACTIVE;
 	}
 
 	stream->last_fid = fid;
@@ -1435,7 +1439,7 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 	ktime_t time;
 	const u8 *scr;
 
-	if (!meta_buf || length == 2)
+	if (length <= 2 || !meta_buf || meta_buf->state != UVC_BUF_STATE_ACTIVE)
 		return;
 
 	has_pts = mem[1] & UVC_STREAM_PTS;
@@ -1552,7 +1556,7 @@ static void uvc_video_decode_isoc(struct uvc_urb *uvc_urb,
 		/* Decode the payload header. */
 		mem = urb->transfer_buffer + urb->iso_frame_desc[i].offset;
 		do {
-			ret = uvc_video_decode_start(stream, buf, mem,
+			ret = uvc_video_decode_start(stream, buf, meta_buf, mem,
 				urb->iso_frame_desc[i].actual_length);
 			if (ret == -EAGAIN)
 				uvc_video_next_buffers(stream, &buf, &meta_buf);
@@ -1601,7 +1605,8 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
 	 */
 	if (stream->bulk.header_size == 0 && !stream->bulk.skip_payload) {
 		do {
-			ret = uvc_video_decode_start(stream, buf, mem, len);
+			ret = uvc_video_decode_start(stream, buf, meta_buf, mem,
+						     len);
 			if (ret == -EAGAIN)
 				uvc_video_next_buffers(stream, &buf, &meta_buf);
 		} while (ret == -EAGAIN);

-- 
2.54.0.rc1.513.gad8abe7a5a-goog

