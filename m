Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717783;
	b=S7cOEHTGPI+znsRWZepy/6lqm34GUDQlrMeKcmE+aTlcDh/AUPFcqJXbSshMVTZ5QqaF
	 V7MUjKDpsHbtpWL3wb6iuvtVwAdJHNDgT+rM9wdjSBXfkTwza+FcmjMO1C//2iSwnnvri
	 wh9t/M5bcL1nrZxYfDXCgBBo4SwIpORUbLxp+J6t6dQG9fWUML5dquDVzDby92XZh1ss7
	 rAYa/ZT71AynBcT4zuGGYn0Fl+0qVoYSPrvGJNvTMahr6SBqfe8MYGh/2HZatSdzJIa8Z
	 zmUrFTyry56j2WAyeI0E/t4k9dUHVYTvnAJTEOQ/nEsuHbB2eH3PRdLd6bI8q3xrXMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Nw458AYygpBUOgZm4R301vL8YgobQsniyT5zQPxeQlQ=;
	b=tTevYc48JzHJ9ZlCXveafJ38a9UpidPU7brbgsX9llxk9znh0f54XK/uW4l9pe5adFjV
	 eMxgu/qtVGJEamWT8tMzaAGM9pzlNFDZtVg4A6MG1qCW8d4nJta9Geaa8eh2nJ9WENM+6
	 iiZP9THt9psF3dfO9qQCOORsexCjSF5vTtviyTOrmg+Hbi6zjTc/n+ETGmYec2WsXtQxv
	 mznpuVN02glEhtQR2IqRioFcBkfcsRMuS3tlJ6bxlTN5GLpxRKiE+YVHtUODCYoOvO9Cv
	 qHlxRnBbbCyUswNbMrqnzinOIwzu8s0R4GifsdVSRXqLI4lVjL7tUCYmJTxtaVzoFUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VyRB+ycY;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CBD606F63C
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 14:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2CBD606F63C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VyRB+ycY
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba3b1199f6so4336766e87.3
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 06:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793717781; x=1794322581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nw458AYygpBUOgZm4R301vL8YgobQsniyT5zQPxeQlQ=;
        b=VyRB+ycYz+4E5IQV5qEKCD//lUdKzuii8IlXOcynpcRZtFw3Kdj1AYL6PZ0YnKRF42
         0jhbxFedoZq94uooOLCDG8jbpdkRmxcgXnfjX31YXWiZEw7peBWRHlidaNFgr+ulcd2h
         6KiIxcTo5TiJszSPpcY/52bjNKw6p4bBqBuWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717781; x=1794322581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nw458AYygpBUOgZm4R301vL8YgobQsniyT5zQPxeQlQ=;
        b=zmIm4DmKm1qAqLDX2/ZA/m31yHoR0gzMDqOrU36dGrkuGRGV14jfGk+VzEVsB2tLPL
         Sa1xOn2J2Ipl6NcN/IEMznibBkcrx868gMNgliFPYyj730rO1R48355e6kYINw+oVI3Q
         MSBKdzm38Lg3t36PFwHI65JMWrwD/jw+dY1BQ+GZFTGXVCLtx1NzY/78AoBacO7NWZhL
         O/fiLCNhVAJwdjNdr504mby5OYWkMQfNFuk9V/1ZeAHCpR6V7jtc9+ccTyETnGHa/uKL
         1HDlDuEkwl0ICPQnz0lrbJ4h+27F3fMVUHkofz/r5IdpgLqwaq48pCExtxClqBKCQnMs
         1UUg==
X-Forwarded-Encrypted: i=1; AKwUvBza4drcBrbbAxQnGhFfSUmayqssZnVM8voI93vqmKz+7+1/ds8TF9mcIhf2MoAz5iAFyUt+VgzWfNhTCA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/pejD/u/f+3bigDsNFzVY7j6/mx5TLgJ5aToGjd2ynizxlDxC1
	2FwSsBX7uZrpuunwWOrYKIKYJlHkI8wk42QWvHOKYM5o/fo54uTDwBEQnDHKzNT5lg==
X-Gm-Gg: AYBFou30UWnDQlorns2kAUi960lQbY0VkDeD/Ukbyi77MKDKaVfiTVmjKZRGixXQFqN
	jUeGg137Qu9B5vmZs5sQslBXxSMEC+LV9ptFczKVO36cGzySCIRfRT5Ui7dCBa6Xwl1byZcCuMn
	y/OF/PbePsUVuXGzqmLJwl4JkNvnJGegLCtXD0PkZXNZ1Hkd9x61N0q2nwuFrtYxy5b3Eh3TeOB
	cV1kBNaZoRzCBpigNRFx2HtosYyRESDKnU8GIeQmpPJDuO8B+ULrUpZYbQHSEdKGNh0WDM0vEwB
	CANzgC3dLrMgwAT8X78dF0B+lY6KqMtPPSQtqKLXV8QriiA0u/vl01osvMFOH6HHWS7+hu6s0Ry
	nzStVN0J4RE8xGpdyTUmYZ1cvTRnoUgFbjx7Iz5mmDOOkwbyNhaof7cW8K1phahr+tN7sF1RzBR
	SSOM1WTEehuopUx8UBGV7N5fFV2I4qRAVKJND4HcZ6AKGgFa0JjT4mjazyHDzR+ijdBLCEzDtjQ
	rJOS6VH3WHYI+PKBF2iZ5ASNX9HjQNgp6E5nou7DcvVFECPovCm+wbvGMXti7GPsxH4ijcH25a1
	x82jTrIcYRDEpyRu7zL0+LRuc9RvjcDlyjBYvy2SjKcOlVLP14nbNXL9JNDZMLH98qgOhkmM8AD
	4Qkaqqm5+YMPnO8tUHEbLK6BJPT90cG4=
X-Received: by 2002:a05:6512:2392:b0:5ba:37c1:645c with SMTP id 2adb3069b0e04-5bfd9575266mr4211587e87.40.1793717780774;
        Tue, 03 Nov 2026 06:56:20 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe1b1ddb3sm2037346e87.27.2026.11.03.06.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:56:20 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 03 Nov 2026 14:56:04 +0000
Subject: [PATCH v5 2/2] media: uvcvideo: Automatically handle cameras with
 invalid uvc_version
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
Message-Id: <20261103-uvc-version-v5-2-f23b6d103c51@chromium.org>
References: <20261103-uvc-version-v5-0-f23b6d103c51@chromium.org>
In-Reply-To: <20261103-uvc-version-v5-0-f23b6d103c51@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Currently, the driver expects that cameras properly implement the spec
version that they announce, and if they fail to do so, we do not continue
probing the driver.

To make drivers more fun, some vendors decided to announce that they are
a UVC version that they are not. Until now, we handled those cameras via
quirks.

Unfortunately, reality has shown us that there are more cameras out
there with an invalid uvc_version than we initially predicted.

This patch tries to handle these cameras with an identity crisis
automatically. We still shame them in dmesg. But now they will work.

Tested-by: Edwin Gatier <edwin.gatier@protonmail.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c |  8 +++---
 drivers/media/usb/uvc/uvc_video.c  | 54 ++++++++++++++++++++++++--------------
 drivers/media/usb/uvc/uvcvideo.h   |  2 ++
 3 files changed, 42 insertions(+), 22 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 7f9f829ca6c3..6a71e1472006 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1169,9 +1169,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 
 	case UVC_VC_PROCESSING_UNIT:
 		n = buflen >= 8 ? buffer[7] : 0;
-		p = dev->uvc_version >= 0x0110 ? 10 : 9;
-
-		if (buflen < p + n) {
+		if (buflen < 9 + n) {
 			uvc_dbg(dev, DESCR,
 				"device %d videocontrol interface %d PROCESSING_UNIT error\n",
 				udev->devnum, alts->desc.bInterfaceNumber);
@@ -1189,6 +1187,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 		unit->processing.bmControls = (u8 *)unit + sizeof(*unit);
 		memcpy(unit->processing.bmControls, &buffer[8], n);
 
+		if (dev->uvc_version >= 0x0110 && buflen < 10 + n)
+			uvc_warn_once(dev, UVC_WARN_VERSION,
+				      "UVC non compliance: Missing bmVideoStandards from PROCESSING_UNIT\n");
+
 		uvc_entity_set_name(dev, unit, "Processing", buffer[8+n]);
 
 		list_add_tail(&unit->list, &dev->entities);
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a92a986ab714..3c67fa8aa485 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -211,11 +211,14 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 	if (frame == NULL)
 		return;
 
-	if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) ||
-	     (ctrl->dwMaxVideoFrameSize == 0 &&
-	      stream->dev->uvc_version < 0x0110))
-		ctrl->dwMaxVideoFrameSize =
-			frame->dwMaxVideoFrameBufferSize;
+	if (!(format->flags & UVC_FMT_FLAG_COMPRESSED)) {
+		ctrl->dwMaxVideoFrameSize = frame->dwMaxVideoFrameBufferSize;
+	} else if (!ctrl->dwMaxVideoFrameSize) {
+		ctrl->dwMaxVideoFrameSize = frame->dwMaxVideoFrameBufferSize;
+		if (stream->dev->uvc_version >= 0x0110)
+			uvc_warn_once(stream->dev, UVC_WARN_VERSION,
+				      "UVC non compliance: Missing dwMaxVideoFrameSize from video_ctrl\n");
+	}
 
 	/*
 	 * The "TOSHIBA Web Camera - 5M" Chicony device (04f2:b50b) seems to
@@ -273,6 +276,8 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 	}
 }
 
+#define UVC_VIDEO_CTRL_MIN_SIZE 26
+
 static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
 {
 	/*
@@ -280,7 +285,7 @@ static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
 	 * on the protocol version.
 	 */
 	if (stream->dev->uvc_version < 0x0110)
-		return 26;
+		return UVC_VIDEO_CTRL_MIN_SIZE;
 	else if (stream->dev->uvc_version < 0x0150)
 		return 34;
 	else
@@ -290,7 +295,6 @@ static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
 static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 	struct uvc_streaming_control *ctrl, int probe, u8 query)
 {
-	u16 size = uvc_video_ctrl_size(stream);
 	u8 *data;
 	int ret;
 
@@ -298,13 +302,13 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 			query == UVC_GET_DEF)
 		return -EIO;
 
-	data = kmalloc(size, GFP_KERNEL);
+	data = kmalloc(stream->video_ctrl_size, GFP_KERNEL);
 	if (data == NULL)
 		return -ENOMEM;
 
 	ret = __uvc_query_ctrl(stream->dev, query, 0, stream->intfnum,
 		probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
-		size, uvc_timeout_param);
+		stream->video_ctrl_size, uvc_timeout_param);
 
 	if ((query == UVC_GET_MIN || query == UVC_GET_MAX) && ret == 2) {
 		/*
@@ -319,7 +323,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 		ctrl->wCompQuality = le16_to_cpup((__le16 *)data);
 		ret = 0;
 		goto out;
-	} else if (query == UVC_GET_DEF && probe == 1 && ret != size) {
+	} else if (query == UVC_GET_DEF && probe == 1 &&
+		   ret < UVC_VIDEO_CTRL_MIN_SIZE) {
 		/*
 		 * Many cameras don't support the GET_DEF request on their
 		 * video probe control. Warn once and return, the caller will
@@ -330,15 +335,24 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 			"Enabling workaround.\n");
 		ret = -EIO;
 		goto out;
-	} else if (ret != size) {
+	} else if (ret < UVC_VIDEO_CTRL_MIN_SIZE) {
 		dev_err(&stream->intf->dev,
 			"Failed to query (%s) UVC %s control : %d (exp. %u).\n",
 			uvc_query_name(query), probe ? "probe" : "commit",
-			ret, size);
+			ret, stream->video_ctrl_size);
 		ret = (ret == -EPROTO) ? -EPROTO : -EIO;
 		goto out;
 	}
 
+	if (ret != stream->video_ctrl_size) {
+		uvc_warn_once(stream->dev, UVC_WARN_VERSION,
+			      "UVC non compliance: Query (%s) UVC %s control had a size of %d instead of %u.\n",
+			      uvc_query_name(query),
+			      probe ? "probe" : "commit", ret,
+			      stream->video_ctrl_size);
+		stream->video_ctrl_size = ret;
+	}
+
 	ctrl->bmHint = le16_to_cpup((__le16 *)&data[0]);
 	ctrl->bFormatIndex = data[2];
 	ctrl->bFrameIndex = data[3];
@@ -351,7 +365,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 	ctrl->dwMaxVideoFrameSize = get_unaligned_le32(&data[18]);
 	ctrl->dwMaxPayloadTransferSize = get_unaligned_le32(&data[22]);
 
-	if (size >= 34) {
+	if (ret >= 34) {
 		ctrl->dwClockFrequency = get_unaligned_le32(&data[26]);
 		ctrl->bmFramingInfo = data[30];
 		ctrl->bPreferedVersion = data[31];
@@ -381,11 +395,10 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 static int uvc_set_video_ctrl(struct uvc_streaming *stream,
 	struct uvc_streaming_control *ctrl, int probe)
 {
-	u16 size = uvc_video_ctrl_size(stream);
 	u8 *data;
 	int ret;
 
-	data = kzalloc(size, GFP_KERNEL);
+	data = kzalloc(stream->video_ctrl_size, GFP_KERNEL);
 	if (data == NULL)
 		return -ENOMEM;
 
@@ -401,7 +414,7 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
 	put_unaligned_le32(ctrl->dwMaxVideoFrameSize, &data[18]);
 	put_unaligned_le32(ctrl->dwMaxPayloadTransferSize, &data[22]);
 
-	if (size >= 34) {
+	if (stream->video_ctrl_size >= 34) {
 		put_unaligned_le32(ctrl->dwClockFrequency, &data[26]);
 		data[30] = ctrl->bmFramingInfo;
 		data[31] = ctrl->bPreferedVersion;
@@ -411,11 +424,12 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
 
 	ret = __uvc_query_ctrl(stream->dev, UVC_SET_CUR, 0, stream->intfnum,
 		probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
-		size, uvc_timeout_param);
-	if (ret != size) {
+		stream->video_ctrl_size, uvc_timeout_param);
+	if (ret != stream->video_ctrl_size) {
 		dev_err(&stream->intf->dev,
 			"Failed to set UVC %s control : %d (exp. %u).\n",
-			probe ? "probe" : "commit", ret, size);
+			probe ? "probe" : "commit", ret,
+			stream->video_ctrl_size);
 		ret = -EIO;
 	}
 
@@ -2229,6 +2243,8 @@ int uvc_video_init(struct uvc_streaming *stream)
 		return -EINVAL;
 	}
 
+	stream->video_ctrl_size = uvc_video_ctrl_size(stream);
+
 	/*
 	 * Alternate setting 0 should be the default, yet the XBox Live Vision
 	 * Cam (and possibly other devices) crash or otherwise misbehave if
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 7f4f11824dbe..0ad04213d89a 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -459,6 +459,7 @@ struct uvc_streaming {
 	struct usb_interface *intf;
 	int intfnum;
 	u32 maxpsize;
+	unsigned int video_ctrl_size;
 
 	struct uvc_streaming_header header;
 	enum v4l2_buf_type type;
@@ -660,6 +661,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
 #define UVC_WARN_PROBE_DEF	1
 #define UVC_WARN_XU_GET_RES	2
 #define UVC_WARN_QUERY_CTRL	3
+#define UVC_WARN_VERSION	4
 
 extern unsigned int uvc_clock_param;
 extern unsigned int uvc_no_drop_param;

-- 
2.56.0.385.gac671c819a-goog

