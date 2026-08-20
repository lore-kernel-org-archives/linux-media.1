Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1233D411B;
	Thu, 20 Aug 2026 09:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219839; cv=none; b=WCjghPslj5GdFPSs2hu7hTCmo9Hs4OUs9mrds81QY/rKU3Jy8R807zdG1AC1aifNhm73eCfKxPsXGhCWFurHmZMSK3A7dMIVgVl6OzsXUK3qPqLwktpUgIiTWQGTBNgDrRYDUY42JI7kTo4jCI++/EE9MJ9pbjMzdrEL3OmRXkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219839; c=relaxed/simple;
	bh=BREFldm5bHv+jPap6o4U8fUw1FA1bRCthRfOi2ujMmo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r4SzA4moDo9FvPKpUOsnoVH35ouZGd8dLtTyCBLVqnrBL75wEz8BZB6KlpdBHdEhqtv/umuLzoREpnRgbC9OmP6gC1c8U0MYSAzeafjR7Uk8r2kiUjtM+tVBSXDtAiU+UqJypCN9tsaYqli1YCjrrEc3q/Bmg0abKp2pPrDZz7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=uj4u7Bg/; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="uj4u7Bg/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1787219829; x=1787479029;
	bh=5XE3pmRRZMmpDTsoOXOj+LLx6vfdON6mz2uOlQHPmWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=uj4u7Bg/6Kv9/lUKJNbO7BQpnkwjrwKf0y3CBaF4dC9L74eLp4eV2Ne6LssUFeXge
	 mXBr4iJnctacmLDw0JJMoptubdIOw8f78AQxR/vv5v2kAObGrFWrFef4PtYcCt4wp5
	 s2kOsXU2Vm7WZRLEZ5++CTCnDLD6ZEXpx8cHTQfDjng1wt4+jYcQga9AtD6gadTPyc
	 Fgy9Q1Xu3ZbfZQiONAW/chHCnAh9hZWc8d3XtaZmAKyU6gIuzTgsopzjWM8pIO80It
	 JJthH3SM8PRW4kgx6tdYazqZDbpibFykrzJ3qhnnQcEz96jIWXoFkdyBebE9ESxW6j
	 LF9g5HkIYQJDQ==
X-Pm-Submission-Id: 4hQf415Vp5z2Sccw
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
Subject: [PATCH 3/3] media: uvcvideo: Skip frame descriptors with a zero computed size
Date: Thu, 20 Aug 2026 12:56:26 +0300
Message-Id: <20260820095626.111196-4-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820095626.111196-1-natalie.klaus@runtimeverification.com>
References: <20260820095626.111196-1-natalie.klaus@runtimeverification.com>
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
index eb7177ea291d..3bd8d31e1378 100644
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

