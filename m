Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B309F425872
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 10:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530791; cv=none; b=u4RrcNZ1xeQMvYBFytILX35kyXAaXI/UQM8whACEyZF1nA3FA9ugttTWtbwriWzVLRnFzZd9QdKZw7rnJU7Qe0FqI/yecQDVAYnBAC2mSPfksIL5WGFAjP+MbdqRw8BB40BE+AeMYLVOPODL42bED0BjdhXYza3yameNxUS0LAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530791; c=relaxed/simple;
	bh=B8ueUhG5tBGvwqhk81omzoqC2jILrshowUdeHW5IBPs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FjSHbz9+NoksstIUQCAoSUCWMNWrPdrx1KZAxJv5Y/yL2I33i9eRhj+d750ONvjZo58iqzfkl3F1lB4JkR7BbEoaBXrwoP3BnT9pH4WEvBgamajchLvImFOOGx9TZkaxujq1a14RXvku7+kfOtPtiLn7pNJuTJmPJuQNoOvyEY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DeznSG6m; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DeznSG6m"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49557167508so5640195e9.1
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 03:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786530788; x=1787135588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wfIp5NDU7PWeyYmfA4vACcCezJB2SbD/Br0L9G6eGm0=;
        b=DeznSG6mv9jKSk4rglFXT9baXJaPccQQoF298H1rMi9eKRZaQLeis2ANhZILTpUubA
         YrRQA1iY798aj8ds5VR6exSISLPjwmYqP+DG+tz94tcYPkT6mAZUB7kbssHFCdpJrbrS
         MCUTdS09XJPdK+KBcpxuseoGRZfp6WyADNlhzThMLO6LDm6rgCyk4W8ea05X6tiTbQJT
         /20IhicXqva+UNL9+RrbCub1KgLYeDadBctjxu5vsBdfR/Hh10fbPnYQDWXd32NatudW
         45tce91CO2JKm8bGCPhxwnrZsjbYL5l7db0+QSGVTIj8/8NGwCuK9849LZi7LL1r7ljF
         LXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530788; x=1787135588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wfIp5NDU7PWeyYmfA4vACcCezJB2SbD/Br0L9G6eGm0=;
        b=dPvcKmFwmOw82bZtBAjPLkG7hn/P8Y90QHh89IUed9jMNa02CnQhbk5XLXFb1KPeAQ
         7leM44tiqtDL9XP+2bf00TmbDJD/hLQku1Zqs591RZBNGZTaJ2LbgO2iyOoTFoVWvlBf
         oCocnfEXBJZu/6/AIzo+jNCE07LbsFjwUzlqrFYV2FbXdgFdEkopbsAXiZh2JVCrEus0
         VKQ+lxWcmuxKA+1zvUtPjVm3p85iRyAxKRUfE+qpyOJjdje+VZA0xLJhkGdXzX2Joyn7
         ilyfOpeNXWdWpQsCUUlPrmVbM1MshwtiG0cEP/8trfsMf8ebdbMq6ttsbTsmxJO+QJhW
         thVQ==
X-Forwarded-Encrypted: i=1; AHgh+RqhI4lKZI/w+lnabqC3dsbrUfsgzXi1ttIDjo6fusGdkYn95arBwFp1TGwfObBekM/BRRjO7XY8EpQ/Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4YAWNKWT1aViLAqWpF8mPnUM3PEjpSvbXS0aRkVdjBsfFVPOz
	ngoOQxZ1s+SX6ir0LZbbIR0e+k+0IRISSTZ8UuLVphYi3SpW8OGx908C
X-Gm-Gg: AR+sD12f08i1hNqD/56EnQ5sT97ug9sCpFsYbNWu8cBsvAltJFU6ALwR9uuwuaP+hwP
	OfT+Exe4q2VCgBjYSz00joD7EV4kqM7ZzhPccvz7fTKq4URvVfApsBKswp3wruTJ0NKG4g8W9dt
	0GQdKfRk/1cSPUcmdYMaPSSdCGUFSgjxJLrDv4vbHnhFk3vM40w3WlpGMhQZ666e78HZnCnk1sv
	rXNcrAFUxdAObCBVI9bMFm6uoyc0FrDzlqaKzRlg8gwiH2RNM0kX5lhPXDsU83ECus7l978XNbY
	YubEtLwz+CmNlhm7fBrY4pY18ZiPrsUG1XzqqLtcYN797ZtUZTVtWTU5G41g5hsl1bncDIG09k4
	KC8dVkeg5hAvq6b7G1jXFOWMivU1lBAD/PR6yQZ0JvkI+7i+sAuRVzdPowVVjnBYLqLDJBJdgZE
	v0vcA59ZaKRuNqAFSUNO0qKSAqoeR6oZlDz3Y341e+SoLrJNHH2zGVIsU59xJqkHwBrwFtyxt5v
	9ZSduYB4RjC1Y8BFAmUyzDkdoUmtgAlEd9PyaDKcd0=
X-Received: by 2002:a05:600c:2e11:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-4997c0e2ba9mr30739545e9.6.1786530787670;
        Wed, 12 Aug 2026 03:33:07 -0700 (PDT)
Received: from USERUSE-R7PLK0L.localdomain (IGLD-84-228-188-63.inter.net.il. [84.228.188.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997abf917csm73026875e9.13.2026.08.12.03.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:33:06 -0700 (PDT)
From: Noam Ben Shimon <noambs2999@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: ribalda@chromium.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Noam Ben Shimon <noambs2999@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: uvcvideo: Fix integer overflow in frame buffer size calculation
Date: Wed, 12 Aug 2026 13:32:51 +0300
Message-Id: <20260812103251.18309-1-noambs2999@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807101433.54886-1-noambs2999@gmail.com>
References: <20260807101433.54886-1-noambs2999@gmail.com>
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
Cc: stable@vger.kernel.org
Signed-off-by: Noam Ben Shimon <noambs2999@gmail.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Used a shift instead of division (Ricardo Ribalda) (Thanks!)
- Add Cc: stable@vger.kernel.org (Ricardo Ribalda)

Compile-tested using W=1 and no warnings.

Tested with a UVC gadget over dummy_hcd with WSL. A frame descriptor
declaring 32 bpp at 40000x40000 (computed size = 6400000000, which is
above U32_MAX) is then rejected as expected, and the streaming interface
is not registered:

  uvcvideo 1-1:1.0: Found format YUYV little-endian (0x56595559)
  uvcvideo 1-1:1.0: device 2 videostreaming interface 1 FRAME 1: computed buffer size overflows
  uvcvideo 1-1:1.0: No streaming interface found for terminal 32771.

I was working on a certain device that had a variation of the Linux
kernel. During my work, I had searched for memory mismanagement and
misallocation in media drivers. At some point I stumbled into the
uvc_driver.c and found a flaw that is not a vulnerability, but still a
flaw. I figured that it was worth letting you know rather than shrug it
off.

 drivers/media/usb/uvc/uvc_driver.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e289cc71ba98..29e23f94751c 100644
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
+		bufsize = ((u64)format->bpp * frame->wWidth * frame->wHeight) >> 3;
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

