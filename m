Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163CC4B7A55
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 21:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680595; cv=none; b=MzeCgs5KbiwiURySgMEfCtyPasy2q8YuFEof0qadhG2tSstWC3LbSHE+r6oI5XKLzchap3i37OJOCOyQ9io18S8MkUfbV9dZFxhB2e4WdEugEFUJcH+rVbWvWLFfy2lYQ/Fh3dZU051PX7Rvdi2EZ1425KCL7F9EYCnWk5jtxd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680595; c=relaxed/simple;
	bh=ucQye2B+H6wFivyC6OorOnv4UKxi5gKZEXt7bb+u/q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k9BFr9MFuwdcqGUNBNyQb8WUG6Iyps1bduqQiD0lZXMdI7CH8FoYRI3Guic7y9/HygleGAMB4LWjXZuH8hmlmifj1rYFEaGm6pp9M6NoMtymvx/NMuCl+WvzTbgds/+gkOLdDDo3yAEDRYVb+VKUyPtUelUoNFJSN8SzL0kqCzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrQFPiBc; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrQFPiBc"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so97073a91.2
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 14:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789680593; x=1790285393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DANMGqGjQRJK06dbUTcEvdwBQZbNV6u9IBjVo5P9NY=;
        b=BrQFPiBc6cUL3ZwNU2K+sYgKpqWI8iDeB6o+w6+/Hkaap46VVt9bPp9lfmjqII1hFQ
         kmpVWkHW+K9a6LkDmcUXVqtRALuHtHDVdg9XIBDqsHlE/VzgAhXdrC3FcTW3uOC4h76Q
         GMzcmU0czPIUYuvZxIS433ywGrhoC0PkaEeu0hAhFnIWaVlwGfecDz0bNwUFp+ebNYDu
         0Nk95azZyhcQ7cp+Lhqr+KQbIczgonHTVLcruFR6ykHlq8b/7TQXy46VMu3c8qznKKxQ
         W+KE1qltd5hSZf3ALdS2QzGHOoqfjkiclbcZc8BaeVXmQv2i34M/z4fHe4rQoJV/JSwj
         NgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789680593; x=1790285393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DANMGqGjQRJK06dbUTcEvdwBQZbNV6u9IBjVo5P9NY=;
        b=q61SlnJFdw14mEwLooHIZ0Drh8JRllTp89LCv0ilxwk/bqzx5Ht0nhQS1gdy/fkMYE
         NLQVw9L/Z09c3g7LjyVpf6wapCW1+tBDZIa4aWYOcZZAuvmEHGhDsoxGNvvR9NdFlUlA
         SHEzzKOe0Vb9SY+Gq/jWbGU2bzv2d2FVTYX89YhvPQuHBeZI/5ZYIiWdwE6+9DGqEAOK
         57U1en/iVV6BN+3jppU7IxY2eDLoId4fKc0uBuMaYhUOPVa5CoZbdD/BxcLl4BeH9V8e
         eGCBc98iCwhG0hwIhty8RVkGPaPSRkWDU9gRyc1oip8pIlKw3J0JUVglqlO2gZBKz7R9
         +kvg==
X-Gm-Message-State: AFuF++kXic6cAZsVdz57AWKc+v5wqyoYA70chRBK0/Xk+yoaKf9HHYvj
	pbIKi3BEDSyObXU0Sv3KRNLeXkE/0P5//wlfaD3hcIw0teqEtKJnUmBK
X-Gm-Gg: AYBFou3dMNNVqLi1rb4kVOAyl28uV8H8wc7uZWnuuj22+K+3b+i9b1GWw5hr+DZTaps
	eWdnGG310JjhfNN+nRpqE38jwq/EQ+Efs3C1ntZor7TCS86CrYY2gTnlt+4b1ELeykrjIEjgcUk
	ZGXwAB3SNRKWY8JpSCAseRqeBpMTLem3/HoHAiq8CmLnpio3mitJMbx9NdVqmTP62WlJuvcTkJ1
	NVKLighnFYXSf+t4/NdufXGa/9Dgpe9U6EG7Xu3jY4uLx8WYP8lhPqFPlMMF4Y7h9y0ni0m/3lb
	JqKUrLBa9IecDXRB0/ewR9hNbjRoIIigq6sgAyClIVhWg1oyU8qAKO1Z7Nlrr0CMypxDmgBOqAx
	QFBlzFGRW6Y1i77ysjt5p4HCxuZ9zu4opPFBi2p7y16ch7vT1jcUt/YpHCe+q/AaY05/zfJ3bgO
	IodQB3ySomboNCfVPSJROrisXpMkHigHZYeA/lvdeldL6KN2wetlMDw0GlNy/CRmkPkxgLNJ8cg
	Ph6JJqq9Rr34QbMS2J3+g7qjH/M91dfAJpU7pf14recB6NZa/SKFxnWO4Vaj30tHVcAbdMrpIwD
	+3Huelvz
X-Received: by 2002:a17:90b:4c46:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39e54922644mr1317373a91.0.1789680593294;
        Thu, 17 Sep 2026 14:29:53 -0700 (PDT)
Received: from localhost.localdomain ([47.156.168.118])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d4cbc9sm14551132c88.11.2026.09.17.14.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:29:52 -0700 (PDT)
From: Henry Paradiz <henry.paradiz@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: uvcvideo: add capture quirks for 1e4e:7102
Date: Thu, 17 Sep 2026 14:29:51 -0700
Message-ID: <20260917212951.558283-1-henry.paradiz@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The eEver Live Streaming USB Device HDMI capture card (1e4e:7102,
bcdDevice 1.00) exposes two problems when HDMI is connected but the
input signal does not lock.

While idle, the device disconnects shortly after entering USB runtime
suspend and repeatedly re-enumerates. Keeping it runtime-active stops
this loop. Enable the existing UVC_QUIRK_DISABLE_AUTOSUSPEND for this
USB ID to avoid the repeated USB, UVC and USB-audio discovery messages.
Normal USB disconnect handling is preserved.

On each enumeration, VIDIOC_TRY_FMT takes about 920 ms per call because
uvcvideo negotiates with the device through UVC probe control transfers.
PipeWire queries nine MJPEG frame sizes for colorimetry on its main loop,
blocking unrelated audio mute and volume requests for roughly eight
seconds while audio playback continues on a separate thread.

Add UVC_QUIRK_SKIP_TRY_FMT_PROBE to answer this device's TRY_FMT calls
using the parsed format and frame descriptors. The advertised frame
buffer sizes match the observed probe results for all nine resolutions.
S_FMT continues to negotiate with the hardware, and other devices retain
their existing TRY_FMT behavior.

Both quirks are enabled by one device-specific entry. The card can still
provide diagnostic frames without an HDMI signal; HDMI signal recovery
and capture configuration continue through the normal driver paths.

Signed-off-by: Henry Paradiz <henry.paradiz@gmail.com>
---
 drivers/media/usb/uvc/uvc_driver.c |  4 ++++
 drivers/media/usb/uvc/uvc_v4l2.c   | 19 ++++++++++++-------
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3055,6 +3055,10 @@
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_def },
+	/* eEver Live Streaming USB Device HDMI capture */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x1e4e, 0x7102, USB_CLASS_VIDEO, 1, 0),
+	  .driver_info = UVC_INFO_QUIRK(UVC_QUIRK_SKIP_TRY_FMT_PROBE
+				      | UVC_QUIRK_DISABLE_AUTOSUSPEND) },
 	/* The Imaging Source USB CCD cameras */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -241,7 +241,7 @@
 static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	struct v4l2_format *fmt, struct uvc_streaming_control *probe,
 	const struct uvc_format **uvc_format,
-	const struct uvc_frame **uvc_frame)
+	const struct uvc_frame **uvc_frame, bool probe_device)
 {
 	const struct uvc_format *format = NULL;
 	const struct uvc_frame *frame = NULL;
@@ -336,10 +336,14 @@
 		probe->dwMaxVideoFrameSize =
 			stream->ctrl.dwMaxVideoFrameSize;
 
-	/* Probe the device. */
-	ret = uvc_probe_video(stream, probe);
-	if (ret < 0)
-		return ret;
+	/* Some devices stall on probes during idle format enumeration. */
+	if (probe_device) {
+		ret = uvc_probe_video(stream, probe);
+		if (ret < 0)
+			return ret;
+	} else {
+		probe->dwMaxVideoFrameSize = frame->dwMaxVideoFrameBufferSize;
+	}
 
 	/*
 	 * After the probe, update fmt with the values returned from
@@ -432,7 +436,7 @@
 	if (fmt->type != stream->type)
 		return -EINVAL;
 
-	ret = uvc_v4l2_try_format(stream, fmt, &probe, &format, &frame);
+	ret = uvc_v4l2_try_format(stream, fmt, &probe, &format, &frame, true);
 	if (ret < 0)
 		return ret;
 
@@ -649,7 +653,8 @@
 	struct uvc_streaming *stream = handle->stream;
 	struct uvc_streaming_control probe;
 
-	return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
+	return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL,
+		!(stream->dev->quirks & UVC_QUIRK_SKIP_TRY_FMT_PROBE));
 }
 
 static int uvc_ioctl_enum_input(struct file *file, void *priv,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -81,6 +81,7 @@
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
 #define UVC_QUIRK_MSXU_META		0x00040000
+#define UVC_QUIRK_SKIP_TRY_FMT_PROBE	0x00080000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
