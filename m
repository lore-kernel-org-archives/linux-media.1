Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850933C3F4E
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 21:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197846; cv=none; b=KgxfIWdsDzKfFvYN3Pya+uUcp0FELat/lxcnVcJfON5CAd0mFyh7vCEfofJhW0LaoSm1qCRs3XENVeGNbMeNqHRHkZQS2y3OrEs97ohhuUYBhaarJ/IvL66BfaybxBL9xs5x12/PuWv6a6wJuSu/VEq4xNYUgtBqUL6xFBNNQhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197846; c=relaxed/simple;
	bh=9PC6XhLt3Kbmv7lIKCXg/ka+Ke9dZ1denNpq6EaIcDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BtUTODkuq3edU/te82IZk27+unEnx3R9/p2I8J5tGg9yRj6DwWUhPLq9REoupxnqpMaFpt1VqzvOkAOLVvqzRWuNLUA0WdAUVPZSr2ScIkIVAtPKHCebP1VE0d2yBXQdH/RLgkHRUO13S6ifgXQecxM/sJxZJHkNQ+P86ZZnHEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGtVNd9s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGtVNd9s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06511F000FF;
	Wed, 23 Sep 2026 21:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790197840;
	bh=xwfBikidnUMiposJzDLn1u6lh4riE2wRGjaw3IbXFJ4=;
	h=From:Date:Subject:To:Cc;
	b=eGtVNd9sh6mEPrq5FTsgWCfXxqFCI/K6V65OUKawS/SKlRkedgw3PtCiLuzoOlFOL
	 3Hp1SWYsE8OWD8D8ZLOO5Tk59VchZwQIkaWtWiS1bDVgOHSCpdwtkPKC7nwDp1rWpK
	 gGoVZG8ySlOCPnKPhJh2xm1drYhXN8G163r6t5HqFTrgS51sHW8t5rzKJ24W5YIE6J
	 WWama85JVg1vAvutw8rSUp5ATVRxGJgOvQzJGRBtnsnwjHb+9fibFDNxY748Vcnrl1
	 BJykfbPqmkrX2nnxKsrK6c+6xrxxRp9ruxgC/ST0NarNJBd+ABEXLuAQqRQ1NCCy62
	 z04k7EC5vJJKA==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 23:10:33 +0200
Subject: [PATCH] media: mali-c55: Ignore disconnected queues when checking
 readiness
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-mali-c55-tpg-capture-v1-1-7c79bc9e98da@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0atI1gZqRUGvIi5ijBrwU1oVoXh3i
 8u3mIkQxKsEaLMIXm4NeuwJRZ4BL7TPgjomgzW2No0tcaNVkasKTzcjkzsvLziIsQ0TMRcCKXV
 eJn3+bde/7wcmI8waZgAAAA==
X-Change-ID: 20260923-mali-c55-tpg-capture-be029caacc1e
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Nayden Kanchev <nayden.kanchev@arm.com>
Cc: linux-media@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

mali_c55_pipeline_ready() waits for every video queue to enter its
start_streaming callback, regardless of whether its media link is enabled.

When libcamera uses the TPG, it disables the statistics and parameters
links and queues only image buffers. Although STREAMON succeeds on the
metadata nodes, videobuf2 never invokes their callbacks without queued
buffers. The ISP and TPG are therefore never enabled and capture hangs.

An unused full-resolution or downscaled output can similarly prevent the
pipeline from starting.

Only require queues connected through enabled media links to have started.

Use media_pad_remote_pad_first() to check the video node pads, retaining
the capability check before accessing the optional downscale device.

The shared readiness check also keeps stream-off consistent: the first
active queue to stop disables the ISP.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Wait only for video queues connected by enabled media links. This allows
TPG capture without metadata buffers and capture through a single output.

Tested on the Renesas RZ/V2H:

root@localhost:~# cam -c 1 --capture=32
INFO Camera camera_manager.cpp:340 libcamera v0.7.2+152-0024628d
INFO Camera camera_manager.cpp:223 Adding camera 'mali-c55 tpg' for
     pipeline handler mali-c55
WARN MaliC55 mali-c55.cpp:1878 Unable to find CRU for memory input
Using camera mali-c55 tpg as cam0
INFO Camera camera.cpp:1216 configuring streams: (0) 1920x1080-RGB565/Unset
cam0: Capture 32 frames
30.914700 (0.00 fps) cam0-stream0 seq: 000000 bytesused: 4147200
31.132789 (4.59 fps) cam0-stream0 seq: 000001 bytesused: 4147200
31.241978 (9.16 fps) cam0-stream0 seq: 000002 bytesused: 4147200
31.351047 (9.17 fps) cam0-stream0 seq: 000003 bytesused: 4147200
(...)

Also tested with camshark, but only solid black test pattern works,
because of something random:
to_bgr888 failed: No backend could handle RGB565 with given options
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index f28e9f4354ac..ab2ad51c9e0b 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -510,11 +510,16 @@ bool mali_c55_pipeline_ready(struct mali_c55 *mali_c55)
 	struct mali_c55_params *params = &mali_c55->params;
 	struct mali_c55_stats *stats = &mali_c55->stats;
 
-	return vb2_start_streaming_called(&fr->queue) &&
+	/* Only wait for queues connected through enabled media links. */
+	return (!media_pad_remote_pad_first(&fr->pad) ||
+		vb2_start_streaming_called(&fr->queue)) &&
 	       (!(mali_c55->capabilities & MALI_C55_GPS_DS_PIPE_FITTED) ||
+		!media_pad_remote_pad_first(&ds->pad) ||
 		vb2_start_streaming_called(&ds->queue)) &&
-	       vb2_start_streaming_called(&params->queue) &&
-	       vb2_start_streaming_called(&stats->queue);
+	       (!media_pad_remote_pad_first(&params->pad) ||
+		vb2_start_streaming_called(&params->queue)) &&
+	       (!media_pad_remote_pad_first(&stats->pad) ||
+		vb2_start_streaming_called(&stats->queue));
 }
 
 static int mali_c55_check_hwcfg(struct mali_c55 *mali_c55)

---
base-commit: 5316e507dc6ffa668122d000ac83e2daf2a2a865
change-id: 20260923-mali-c55-tpg-capture-be029caacc1e

Best regards,
--  
Linus Walleij <linusw@kernel.org>

