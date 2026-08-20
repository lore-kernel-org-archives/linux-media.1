Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78FA41686C
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 10:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787222894; cv=none; b=trMiuDWtl2FxoSZ/X3EEGnJ3ARyebT5D2y//+x2zqa4NMYAta9kOPhIK2xGyJf3JBVqAVSJl13RyboqTpB+/+lmO3thppuPf25skYrO0VTFgS+uorqoLykSvnANxuLy/+2DFQ2LIhT7RX52Wh1W9kQy0eLjgMgK3qeOh0iaAYm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787222894; c=relaxed/simple;
	bh=WOUQ7OsTNvrcHbcluFU+Zq7r3YoiVj1LNQ5MMNDsQqw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sSNVbxoBZoUO3voI0tWqDELdf2X0vY/IS4C+owtkqYseSQ00JSfftilxo9J9vs7abpomX8bdKhjKt4ByILqBxiwfLJbxmmOrqjGooxub1zEBXXcs52elbQBeDcxCQSbXXy7ngSqX0n8xX0LH9z7X+S+N7vbqXKTEwqY7AK2YoDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=R4K5Heia; arc=none smtp.client-ip=79.135.106.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="R4K5Heia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1787222890; x=1787482090;
	bh=lXsN22J0iAiXYuJeIK+n9TdGbIhXayHmYdaOgl2m1qw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=R4K5Heiama99+gQGvf/uiK2+NThSPrYp6/9GcyQ+115q40jNINpShM9bgO6jkpotR
	 2onY7nIppfOb1llp22hkChoXV5MAQ/K2RbeiuGsI5u3vCcOU9koZ51o447uF2EOq4K
	 bIkWGc/jzUbqtOXQT07qtnNngaObSz2N78JIdwvsNlZEJPXbgmFVTvx0eXdlET9aVH
	 JWfv/K3pwrIgqJzNYezqSGctwDLQw7O0BevwoTjCr0CRWmu4LW5AIXhVOqSaRlyJR3
	 rDTHHA50j9vcMnLp0tVVPUAsdrQTVprLWQ5k2kyqhtS7swYoQZdZTty+1EZU+l2/Cc
	 tu1PcRoIhRt9Q==
X-Pm-Submission-Id: 4hQgBt1ppdz1DDWl
From: Natasha Klaus <natalie.klaus@runtimeverification.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: ribalda@chromium.org,
	noambs2999@gmail.com,
	david.laight.linux@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Natasha Klaus <natalie.klaus@runtimeverification.com>
Subject: [PATCH v2 3/3] media: uvcvideo: Skip frame descriptors with a zero computed size
Date: Thu, 20 Aug 2026 13:47:24 +0300
Message-Id: <20260820104724.191119-4-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820104724.191119-1-natalie.klaus@runtimeverification.com>
References: <20260820104724.191119-1-natalie.klaus@runtimeverification.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For uncompressed formats uvc_parse_frame() recomputes
dwMaxVideoFrameBufferSize from the frame dimensions and the bits per
pixel. All three operands are read straight from the descriptor bytes
with no range check, so the computed size is zero whenever any of them
is zero.

A zero size is not harmless. It is copied into
ctrl->dwMaxVideoFrameSize by uvc_fixup_video_ctrl() and reaches
uvc_queue_setup() as the vb2 plane size, where it trips
WARN_ON(!plane_sizes[i]) in vb2_core_reqbufs() at
drivers/media/common/videobuf2/videobuf2-core.c:951 and fails
VIDIOC_REQBUFS with -EINVAL. On a kernel built with panic_on_warn that
WARN is fatal.

Such a frame can also become the active one without any application
asking for it: when no frame matches the device's default bFrameIndex,
uvc_video_init() falls back to frames[0], so a device that also has
usable frames can come up unusable.

Skip the frame rather than rejecting the descriptor, which would discard
the whole streaming interface and every valid format on it. This follows
commit 81f3affa19d6 ("media: uvcvideo: Don't expose unsupported formats
to userspace"), which drops a format descriptor the driver cannot use
for the same reason: to keep it from reaching userspace and triggering a
WARN_ON.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Natasha Klaus <natalie.klaus@runtimeverification.com>
---
Depends on 1/3 for -EINVAL to mean "skip this frame", and on 2/3 for the
bufsize local.

After 2/3 rounds up instead of truncating, the computed size is zero only
when one of bpp, wWidth or wHeight is zero; the "product below 8 truncates
to zero" case no longer exists.

 drivers/media/usb/uvc/uvc_driver.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index d7d71418f875..0bb4e17711cf 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -308,6 +308,20 @@ static int uvc_parse_frame(struct uvc_device *dev,
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
+			return -EINVAL;
+		}
+
 		frame->dwMaxVideoFrameBufferSize = bufsize;
 	}
 
-- 
2.34.1

