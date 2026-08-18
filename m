Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67403418347;
	Tue, 18 Aug 2026 08:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040016; cv=none; b=ZFdT1dYCI440L0iLmVct9pP8R5DC6onKB6lIFpBFTxJyXCnDYPmxFaGflr+X0o/2r/vn4enENBXCnuKGuBzrbO4CGi3tG7D4qGS2VPvUaf2UEP8SohJ5Nlsduo713tPJ+gHmLjSgxGYQRdVUHFjueRyFzDJlihyiGsA/s6Yuc/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040016; c=relaxed/simple;
	bh=i4Fl6x2axhMFq8Imyw13saugpxXUuyZW4joxRnBPjeY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rGhfT0S6ob20FT+QUdKB42KVgfcJ439cRdJyqsqj5WD7taqGkDC3ybILV91i7fN8yvmnjh7Mu6oNSHW+BNhm6JAvRAPFXDGgwRbx62BwS5JnOidMIa9icDoiEGGsYGZByR9h3ZiwJ6oGf5QTvyq79SQLDRcDU5FLL5T/sJUczlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=ZBb1fcEu; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="ZBb1fcEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1787040009; x=1787299209;
	bh=N5xLDuF3oSnVdR4JrqvFYQ6H3Kd4fPkAIkw6t7hVuWg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ZBb1fcEuNwDMKPziU1R82yGum/nX6s1lrwxfVT0CWlhn13c5PjC12RjtUlBegww3J
	 l5Y514/HYHzD1U710w7CBnRrIrtwh71NSFLf1fKE/2xqUZmDpFrFEUj++LSqAWPGn4
	 2AOYAsG4M5QTHa036Z3zWUx8xwnbDC/cSbjHC/A7adkL4BbfKPC/Xwb/PSy+cY6GZ1
	 TjvUR9dRifay38yvwUjO0spUqB+lsRn+CWjo5mgIhkksZQJqoaJyUvwyIJKuqshnzl
	 A77RMCQgYBDChUUUMCdiXOwxs6ixpV9hfGsiC87I9kjXzZrNix+CJrYLmjgpOo1Atj
	 WgtPQM1z5IqFw==
X-Pm-Submission-Id: 4hPMYx1Kjmz2SdlL
From: Natasha Klaus <natalie.klaus@runtimeverification.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: ribalda@chromium.org,
	noambs2999@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Natasha Klaus <natalie.klaus@runtimeverification.com>
Subject: [PATCH] media: uvcvideo: Skip frame descriptors with a zero computed size
Date: Tue, 18 Aug 2026 10:59:56 +0300
Message-Id: <20260818075956.212624-1-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260812103251.18309-1-noambs2999@gmail.com>
References: <20260812103251.18309-1-noambs2999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For uncompressed formats uvc_parse_frame() recomputes
dwMaxVideoFrameBufferSize from the frame dimensions and the bits per
pixel. All three operands come from the frame and format descriptors and
none of them is validated: wWidth and wHeight are read at
uvc_driver.c:254 and uvc_driver.c:255, and bpp at uvc_driver.c:382.

The computed size is therefore zero whenever any operand is zero, and
also whenever the product is below 8 and truncates to zero on the shift,
for instance bpp=1 with a 2x3 frame.

A zero size is not harmless. It is copied into
ctrl->dwMaxVideoFrameSize by uvc_fixup_video_ctrl() and reaches
uvc_queue_setup() as the vb2 plane size, where it trips
WARN_ON(!plane_sizes[i]) in vb2_core_reqbufs() at
drivers/media/common/videobuf2/videobuf2-core.c:951 and fails
VIDIOC_REQBUFS with -EINVAL. On a kernel built with panic_on_warn that
WARN is fatal.

Such a frame can also become the active one without any application
asking for it: when no frame matches the device's default bFrameIndex,
uvc_video_init() falls back to frames[0] at
drivers/media/usb/uvc/uvc_video.c:2298, so a device that also has
usable frames can come up unusable.

Skip the frame descriptor instead of rejecting it. Rejecting the
descriptor would discard the whole streaming interface, including every
valid format on it. Skipping follows the convention introduced by
commit 81f3affa19d6 ("media: uvcvideo: Don't expose unsupported formats
to userspace"), which drops a format descriptor the driver cannot use
rather than failing the parse, for the same reason: to keep an unusable
descriptor from reaching userspace and triggering a WARN_ON. Extend the
existing "return 0 means skip this descriptor" handling from the format
loop to the frame loop so parsing continues with the next frame and the
rest of the format survives.

Frame based compressed formats are not affected. They legitimately
carry a zero dwMaxVideoFrameBufferSize, set unconditionally at
uvc_driver.c:265 because the frame based frame descriptor has no such
field, and they never enter this branch because it is guarded by
!UVC_FMT_FLAG_COMPRESSED.

Signed-off-by: Natasha Klaus <natalie.klaus@runtimeverification.com>
---
Applies on top of Noam Ben Shimon's v2:
https://lore.kernel.org/linux-media/20260812103251.18309-1-noambs2999@gmail.com/
It sits directly after his overflow check and will not apply without it.

One consequence worth naming: if every frame of the default format is
zero-sized, nframes ends up 0 and uvc_video_init() fails probe at
uvc_video.c:2286. This cascade is not new here. 81f3affa19d6 already has
it one level up, where skipping enough formats leaves nformats == 0 and
trips the same guard at uvc_video.c:2226. Such a device has nothing to
stream either way, but the outcome is no node rather than a node that
fails at REQBUFS, so it is a judgement call I would rather leave to you.

This does not cover compressed formats. For UVC 1.10 and later
uvc_fixup_video_ctrl() does not overwrite dwMaxVideoFrameSize, so a zero
in the device's probe response reaches vb2 unchecked and no parse-time
check can see it.

Not tested on hardware or a UVC gadget. Built and verified against the
isolated expression only.

 drivers/media/usb/uvc/uvc_driver.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 29e23f94751c..e5858cec7ee4 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -309,6 +309,20 @@ static int uvc_parse_frame(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
+		/*
+		 * A zero-sized frame is unusable: it reaches vb2 as a zero
+		 * plane size, and it is reported to userspace as a 0x0 frame
+		 * with a zero sizeimage. Skip the frame descriptor, the
+		 * caller moves on to the next one.
+		 */
+		if (!bufsize) {
+			dev_warn(&streaming->intf->dev,
+				 "UVC non compliance: FRAME %u has zero size (%ux%u, %u bpp), skipping it.\n",
+				 frame->bFrameIndex, frame->wWidth,
+				 frame->wHeight, format->bpp);
+			return 0;
+		}
+
 		frame->dwMaxVideoFrameBufferSize = bufsize;
 	}
 
@@ -506,6 +520,11 @@ static int uvc_parse_format(struct uvc_device *dev,
 					      buffer, buflen);
 			if (ret < 0)
 				return ret;
+			if (!ret) {
+				buflen -= buffer[0];
+				buffer += buffer[0];
+				continue;
+			}
 			format->nframes++;
 			buflen -= ret;
 			buffer += ret;

base-commit: bae860246e920a7d24256858b69133c9c5f1f6a1
-- 
2.34.1

