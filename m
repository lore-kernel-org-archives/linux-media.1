Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC2B41F5EA
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 10:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097658; cv=none; b=aMN2nyBx2xYAYAiF12jrV8u5eCDrMLaTY6imoFz7+PJtOU7nnHEHXSxf7sUtSnMDxcuG1CAVkLV6RFMP+5/OuQLsfmkOQUkjM8zLjMLQ+C0MAROq6gKR2YkBMfT7CTRi8Jev0ntdAi4xu99NIwKRPUacnf9VH1Z4Ry09IwitSdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097658; c=relaxed/simple;
	bh=ghBWfrgtRQcEmr9V6zkgDLfR+kSbJqfZ+kj0H7kkEgo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DD/8DDMLU4m4KeMgC3iZWTQD18c8RkyFcrMUFuUPAykQo76Pkg6YjGo+usSg669Upz6hkOC0e0ZOyJey+essxgOTsdfV/2IZLAwNou14xLe6lIwLzUqEnZXGnGfaq0eSGQlgW9qIYk1xGFkABCULwIlCyVL601s9pxMPIT3ViGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuzfEXPq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuzfEXPq"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso14214975e9.0
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 03:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786097654; x=1786702454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fCmJ7V9mYpgyM9qqojJ7zamTNRxKN8QjnRiKGjxJdDY=;
        b=UuzfEXPqNe+1n/3aLwVgTMnAQh+OXtRG3CKF5JfylhagK0LUzq9tIu0MA+E9yWxGyz
         pOdROtjET/6hg8l0E106SsVn+4rDxyGxb7sbjjCCL2cCSr38xwYEev2U/XL0S1RqaHIE
         Evw1NRiKN6xAlg+li+D7aot3XSn1MhytTfBiVlxMFUQ1pICg663Do5jpYeri2pOwEgJy
         0z0iioSkvB3BNnwJuMdIPpEcKM4j5AaYePuZYeze+76plw2t5RvnKvN3ymRFdEZef4BV
         R4L/g/M7SYSoWEhGosQdiH3I+6AxPWnBNeqdQsZ3N4iltluImCK4NOjp8NAS7+YX48Gt
         5bhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097654; x=1786702454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fCmJ7V9mYpgyM9qqojJ7zamTNRxKN8QjnRiKGjxJdDY=;
        b=quzDRRCUEHqRYYUqzG745rxo/iRikGP8yTEnWv3llvTwSnkPedPHtCR5YImYwEkuMb
         dckMyVzZM3mDWPRu8sem8PjTUjgkbJMJ/Hki777Z7mC2E0A+vtvhLoYI64GM80uLBvHR
         rI8PUQvydsOAynfaWH213oeFJ9lnpkeAK5sXwtTfSFyT1nSSczH9gh93dbM66hZ/gu7h
         XTdaAGReiRsxpZ2XYue8Q+StgsGetFSNQHrwQzSQy/1Q5SAZp7W6v2cVbnJFeWvJ7M3x
         YwLrlCID6+7l2gVgYYcyUrjMh3ijtJDNWH2UwGtyKNThXLl0nHyYm6xSvsT1k5smJjXG
         kFvQ==
X-Gm-Message-State: AOJu0YySBarqdp+AadoBxQh61pQayUTB2dh4Biu/ez18QMII4rD/3uxN
	HxCo+D8OEW34J6ZG0JvfSq/nc350atgV4M7vvTd3hTfkWw5DozUL9UCi
X-Gm-Gg: AR+sD11RoLXQvYFSTAZ9T6CrLbJETS4bSXFvnNR4SFGln6IXjsCSRQy9qo931h7TxeP
	2H1/OZqpf4jAc3mL0lTx0mRM+8oKYktypyjHi+pefyaIVqpPohrp/ZJTsO7odSdpA5N5JSkYLdP
	oTVDRxcJfmDfqHiIna5/eLSw17+Dwfa2CvoAOdOX3+k34QfVG4B6Ww91pOGtk/ny4fXW3h5byee
	uMnBrS7d2K5bsaUTC8igZwCSy/YV3xYDjB69AIaAl4/gfA66Q311RPpHxhXtdsl0DZFchWb41sJ
	ubQOLn+GH01t1MkFOoPWrSmxZxzKmGZ0Q4xIIBbkjfunZmC3uhNxwubmnL/9cNkWum1nyDYohBc
	Aqq2zvDUuN6hP0S80OuKa/wHLj0I1ElxOw8Hd2OlJ1U8z4wJKAApZpTOtIA4jXvWZJ+JA9VQBYb
	k2uRBvFqpNjSXuuY8jsuE431AcWrsR8n4hqhSz2VtSFvAR8CWGV8eKZMFVaMc+dr4WHtH2H+AzP
	wXFFeG4sPchLHwhNmrEhUJPOMf49kgqqi5KPsvamxo=
X-Received: by 2002:a05:600c:42d4:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49959fddc5emr61573625e9.1.1786097653412;
        Fri, 07 Aug 2026 03:14:13 -0700 (PDT)
Received: from USERUSE-R7PLK0L.localdomain (IGLD-84-228-188-63.inter.net.il. [84.228.188.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995ea3361esm25946735e9.15.2026.08.07.03.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:14:12 -0700 (PDT)
From: Noam Ben Shimon <noambs2999@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Noam Ben Shimon <noambs2999@gmail.com>
Subject: [PATCH] media: uvcvideo: Fix integer overflow in frame buffer size calculation
Date: Fri,  7 Aug 2026 13:14:33 +0300
Message-Id: <20260807101433.54886-1-noambs2999@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the function uvc_parse_frame(), it recomputes
dwMaxVideoFrameBufferSize for uncompressed formats. This helps working
around devices that report it wrong:

	frame->dwMaxVideoFrameBufferSize = format->bpp * frame->wWidth
					 * frame->wHeight / 8;

These three arguments originate from the device's own descriptors, and
therefore can be decided by it. bpp is a u8 and wWidth and wHeight are
u16. The expression is evaluated in int, and the maximum value is
255 * 65535 * 65535 (which is roughly 510 times INT_MAX).
A device that declares large dimensions therefore overflows a signed
int here.
The kernel is built using -fno-strict-overflow, so this wraps rather
than being miscompiled, but the wrapped value (which is often negative)
is then divided by 8 and stored in a u32 used as a size.

Two examples for this (using legal field values):

  - 32 bpp, 16384x4096: the product is exactly 2^31 and wraps to
    INT_MIN. After division and conversion to u32 the field has the
    value 4026531840 rather than 268435456.

  - 16 bpp, 16384x16384: the product is exactly 2^32 and wraps to 0.
    The field holds 0, rather than the correct 536870912.

I don't think memory corruption is a consequence of this. The value
reaches uvc_queue_setup() as the vb2 buffer size, and every copy on the
decode path is bounded by buf->length, which uvc_buffer_prepare() gets
from vb2_plane_size() rather than this field. What a wrapped value does
instead is make the driver describe the stream inconsistently.
For an uncompressed format uvc_fixup_video_ctrl() copies it into
ctrl->dwMaxVideoFrameSize unconditionally, and that becomes the
sizeimage reported by VIDIOC_G_FMT. This is while width, height and
bytesperline continue to describe the full frame.
This also makes uvc_video_validate_buffer() mark error on all frames,
because it is comparing bytesused against the same number.

Compute the size in 64-bit, and if the result does not fit in the u32
field then reject the frame descriptor. An uncompressed frame this
large is probably not a real device and rejection is consistent with
the other checks over malformed-descriptors in this function.

Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Signed-off-by: Noam Ben Shimon <noambs2999@gmail.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e289cc71ba98..d319368f9d21 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -296,9 +296,21 @@ static int uvc_parse_frame(struct uvc_device *dev,
 	 * information. For uncompressed formats this can be fixed by computing
 	 * the value from the frame size.
 	 */
-	if (!(format->flags & UVC_FMT_FLAG_COMPRESSED))
-		frame->dwMaxVideoFrameBufferSize = format->bpp * frame->wWidth
-						 * frame->wHeight / 8;
+	if (!(format->flags & UVC_FMT_FLAG_COMPRESSED)) {
+		u64 bufsize;
+
+		bufsize = (u64)format->bpp * frame->wWidth * frame->wHeight / 8;
+		if (bufsize > U32_MAX) {
+			uvc_dbg(dev, DESCR,
+				"device %d videostreaming interface %d FRAME %u: computed buffer size overflows\n",
+				dev->udev->devnum,
+				alts->desc.bInterfaceNumber,
+				frame->bFrameIndex);
+			return -EINVAL;
+		}
+
+		frame->dwMaxVideoFrameBufferSize = bufsize;
+	}
 
 	/*
 	 * Clamp the default frame interval to the boundaries. A zero

base-commit: f9a2394a23482bfd330911e9c8295b71724feacd
-- 
2.34.1
I was working on a certain device that had a variation of the Linux kernel.
During my work, I had searched for memory mismanagement and misallocation in media 
drivers. At some point I stumbled into the `uvc_driver.c` and found a flaw that is 
not a vulnerability, but still a flaw.  I figured that it was worth letting you 
know rather than shrug it off.
