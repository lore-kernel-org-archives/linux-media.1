Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C0841A937
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970408; cv=none; b=o/DNqkOQVsoUEam8ExJ2W29u1txtI3J6PwVVplTdwmMXbIeVDwxYAdWb8TYZo2xY9DxxvfhqSHD1QwZ7/EMqI1MxpTaD6o96/pQp1xdyPxKhtleYMaNiiJP20bwr6BcjXpKDUrVMW9ZyMsL8ZsJCuw95+joZmdqS3MqtgtcySvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970408; c=relaxed/simple;
	bh=Af+mvd2yE3V7IL4Fv7DEQ9gIVPAuc16Zx+pRHzLk9Oc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QS4eZO/Xt7Hc/esP2BjHQgKQPWsqfCaCsJMKwzWYgZkrLWEdyOnRxkuXPNKLjsPVtSoLbDq3tHLJdJhSk7ZHxa9tTrV49JOcdcVw5vHB6YcqyXyEDFs7N9/CRFjeQLkzk3k/8xo+fHBhm/PPzMSUX91xOqxK7V2zF9w6IYF51mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=o2ExukvL; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="o2ExukvL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1786970403; x=1787229603;
	bh=xkPSf1HhxmOhImb0btIjjGvZxky97xdXD5eMzbBxCg0=;
	h=From:To:Cc:Subject:Date:Message-Id:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=o2ExukvL557mGqorU6Gi4bDCo7Xi8zJRBDk+IX0EO/t9ZSbQ5lHXcGbemGCNRc40Z
	 FIjKntAd/9inBMVxezg67wWrS2bdnyO2zx4cNuqs7SHgfkfrNMYlkaBnHYKVgIuv4I
	 sAMbDOdtICPTOn6ytWqozh5VbyDU87DzIuwWYwKw+Ff0duimFKsB6iN+bGc4kbBTOA
	 QD2DgZ4yihrsEfdz8FivwuXVQdcXWaj3S+avOMrZIgEIruzg46p4hjR8ZqFQxyn7xm
	 WKz9kfQMBS8zf2+uHVn2bVF8Fy2zN3pcdKRWQyGkQaEgwqxUDm1VngYoqLndclmujB
	 sZ5/V+igD4B0A==
X-Pm-Submission-Id: 4hNsqM3KnDz1DDs0
From: Natasha Klaus <natalie.klaus@runtimeverification.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Natasha Klaus <natalie.klaus@runtimeverification.com>
Subject: [RFC PATCH] media: uvcvideo: compute frame buffer size in 64-bit arithmetic
Date: Mon, 17 Aug 2026 15:39:41 +0300
Message-Id: <20260817123941.1701962-1-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uvc_parse_frame() computes the default frame buffer size as

	frame->dwMaxVideoFrameBufferSize = format->bpp * frame->wWidth
					 * frame->wHeight / 8;

format->bpp is u8 and wWidth and wHeight are u16, so all three operands
promote to signed int and the product is evaluated in 32 bits. All three
come from the frame descriptor and none of them is range checked, so a
device can drive the product up to about 1.1e12 against a type that
holds 2.1e9.

The kernel builds with -fno-strict-overflow, so this is a defined
wraparound rather than undefined behaviour, but the stored value is
still wrong. A descriptor reporting bpp=207, wWidth=18501 and
wHeight=43738 has a true frame size of 20937965595 and the driver
stores 27. For bpp=233, wWidth=63435 and wHeight=58989 it stores 0, and
uvc_queue_setup() then hands vb2 a zero plane size.

Evaluate the product in 64-bit arithmetic by casting the first operand.

Signed-off-by: Natasha Klaus <natalie.klaus@runtimeverification.com>
---
This is RFC because the patch is deliberately incomplete and I would
rather you pick the remedy than guess at it.

The cast fixes the arithmetic, but dwMaxVideoFrameBufferSize is a
32-bit field, so the assignment still truncates and sizes above 4 GiB
are not representable. The zero case survives too: bpp=32,
wWidth=32768, wHeight=32768 gives exactly 2^35, the 64-bit quotient is
exactly 2^32, and the stored value is 0 again.

So the open question is what should happen when a descriptor claims a
frame that does not fit. As I see it:

  1. this patch, accepting that oversized values truncate
  2. cap at U32_MAX
  3. reject the frame descriptor, on the grounds that a device claiming
     a 100 GB frame is lying
  4. range check wWidth, wHeight and bpp at parse time, which would
     also cover the two sibling computations

I am happy to send whichever you prefer as a proper patch.

Two other places take the same unchecked operands the same way:
uvc_v4l2_get_bytesperline() in uvc_v4l2.c, and the bandwidth estimate
in uvc_fixup_video_ctrl() in uvc_video.c, which is clamped only from
below. If you want those fixed I would send a series rather than fold
them in here.

How this came up: we are building a memory-safe Rust rewrite of the UVC
descriptor parser and proving properties about it, and the Rust and the
C disagreed on this field. Standalone reproducer, one command, builds
under gcc and clang with and without -fno-strict-overflow:

  https://github.com/runtimeverification/uvc-frame-size-overflow

Two caveats. This was measured on the isolated expression with the
kernel operand types, not on a running kernel and not on a UVC gadget,
so the vb2 behaviour above comes from reading the code rather than from
observing it. And I was unable to search the list archives from my
environment, so apologies if this has already been discussed.

 drivers/media/usb/uvc/uvc_driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e289cc71ba98..5dfbd487732d 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -297,8 +297,8 @@ static int uvc_parse_frame(struct uvc_device *dev,
 	 * the value from the frame size.
 	 */
 	if (!(format->flags & UVC_FMT_FLAG_COMPRESSED))
-		frame->dwMaxVideoFrameBufferSize = format->bpp * frame->wWidth
-						 * frame->wHeight / 8;
+		frame->dwMaxVideoFrameBufferSize =
+			(u64)format->bpp * frame->wWidth * frame->wHeight / 8;
 
 	/*
 	 * Clamp the default frame interval to the boundaries. A zero

base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
-- 
2.34.1

