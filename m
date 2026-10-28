Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186520;
	b=Akh/JiD+RtM7PvQhmzTMB8e9qLp2gzSiCLqKi+cF4LqX7jTeL9UU5IFU0tOSLe/AC3y5
	 Y01+KVGmAOnVJZK/wo28xE71uzvpqZo7iqEwoaoXZz+6Bx+BCOpqxJfO2L5lZYcGkvv9x
	 4OeefOGgtNqMXDZexl6FWjDlDB5+7QYhBzNEZYCNn+wVZ0g7CU/lhh4Lw5ZzeDtX+IMC6
	 xK0wiXnnvMiaKnSWw6sfnjSFTdreWsfrxJO2JLeRRoy7DQpoUj7ruS5Q8OrOGiN3M0Vwd
	 85+rQecxkRdY2yDCLNabOgnXpHNv7C/rjGtZZAUphi3XbdJVy+o6IGL/Gb7Hos1dmAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=nxIae98zDVY6PJLzZH0rbHlhoy2I3FG3UuF6SelgCus=;
	b=Cs4cm2bne2JmcW1bTrAPoO19Z79iy4hlWHb5m8gbXjXijAFmKAs8RIwia3hf1CGiVnM7
	 auoQ7k1j5eM0vd1+sJwEjFJgm4kak7OAsiHKuAovLKphUxPHGlgQ1YA/S7eE5MXVjuAnI
	 tnbkNrHIV5+IEX5JIbbpp4gC/S0BdioYUr+ECrx1Ob7zVgBfr12Rmm7bPM2D3S3uoX6g+
	 pv5OCwUY+Q8LIBbQHInIGfovZiuK/e6DiYNtZCoIwPAjetNslDyW67O7TpItP8jwODPsc
	 myBtyXuODe3yjDsGHjpo8qh0fu3LZhoGo6kd5+AC1lWm5YMCIrz6Bo/vsiEJqQXesSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D81ng3aI;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E7D606A31D
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 11:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97E7D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D81ng3aI
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8ad5b2f61so2299245ad.2
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 04:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186519; x=1793791319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxIae98zDVY6PJLzZH0rbHlhoy2I3FG3UuF6SelgCus=;
        b=D81ng3aIWRJF0Dn7Mf/zKViiAg7py7RwSLhIu6rqK0inevjj0zw0T59Cvh0829lOFL
         rtB3KQpCrte2eouOdB2AvdVsqvjuXk6DMQkMSg6F2LcuooARPBdo10JInnBdaNHUc4B1
         YQ9SKnOQiu3yXoxJzwj1doFlr2mY47sM9qJPDEPoxExYPOE4wteLCmpuM3N8iG87yEe/
         ALryLAK4I9dwqLoKpgnb8iBOiuaFPEMLrFm1R5jD4FG3E5I8tSruQXVUMMcpzpn9cwfn
         PRluAS0HN7wl9NxrXBYAk3E6yWvdNveu3UaZW/+vVFrcwWtVBsn4oHRRGC6xMQnCgAMx
         YODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186519; x=1793791319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxIae98zDVY6PJLzZH0rbHlhoy2I3FG3UuF6SelgCus=;
        b=aQn9Cwa8S4vCk0UqtewvcUpoYiUQS2My/O4t1c5tKGfpa06cpsVPRKVDc4oNxu6OcS
         12M+OVvlNEo7OlkdxnJWW30G/05LG8k+0kM0q5Qhv/ZrspOYvE3Bb5iX8OPp2wUJ3phA
         /33LAbnh3RZ/v9c4M5vRpMhPX74Gi3dDqUJUsqW4Zlj5lxBqsKTXz543zyoujB7NDflz
         XAeLb76bt8qQqdvFCsPWIQMChNMyS50846roe4gdJmBSGpz8xiieNb0X4usTD/8n4ZFN
         ORLR4liY+5cXrGtBeSB0Qnt+fEM/dTLGGMly8hMsdUd+4juNB/rSnoVNkHxmM+KZVOpF
         nmeQ==
X-Gm-Message-State: AFq9FYK8cfcSAKqWqCKKci7OYrnsS7Fd+8Tadtllpj3LWy5MlLMXUC+V
	ZyURXF1E3Q0jqeWM1yL7WQZy4Yj7xrWJvEX9BJWmalbzfW+EM3HOGXCtFJAy4kY/zCU=
X-Gm-Gg: AYBFou1C/XYF8hraPRhHzBnDpab90jzz8n2MD9xxy13DVHAN6O0NCRZ4caT96akgp6f
	aZ/EYRRBXgKvqJsRkU/rheJMsNszTWVgSH9aLU3T6OMPGeDnmHnNy7TxTOl/fjq8LSkQHm198bF
	MSe8MSLVnpl3m+N1GypR0TUxs1ikLtZ5J3enH0ev9cyPWKugrmcYSIoS79r22FB+q93E4SVWd/v
	o5fCw1WQ7oh7D8gtcW+c7LUinrNKp/B/DOiJS018CJcolCevlBw9nBmJ/ngZGLw4jKOrtlQChCq
	1jhCZiqq9gRzSeqkZiGdmbgBKpjyV4aG8hsBDNhpYDS+4cQWjrMefPCQEO7pYJ1ZpUOSjOT+NAS
	flzOtmUpRf7wkQK40BXe58niH07teA7+Vn9r4y5rtqYXdI4Cz8NCgOys+67R5kZRzXCu+Vzp/5h
	I8wVGLyK12AavPBDiYReH5vdRnALYP8RcmVqhHN0WV17P7Y6JoZiuwBPFacEP7ZWi4nMy2xEjC8
	kqixB0fQ21NbdyRcz8g0ass3y4L7atUnHdOnRp9jVLgrm6xV2eDtYztAcmoHTd4YWU3Be6d1Vzb
	3f8sX5+ocYfkiNyOHyZJQ+xaTq946AD0dcj07jiwHrrLrCy0iQebJL8xvMAOcW8sl4jQGjnDgFG
	jqRjcfhozDwHRrjj5ED+LK7V/C+f9uLEsK7Xmhrjqd4WqP02OhbHF0kAiqpBY2cQMOzNWng243Z
	N2QaGfGWMkvEjoJ959CBI=
X-Received: by 2002:a17:903:37ce:b0:2e9:4f73:83d4 with SMTP id d9443c01a7336-2eb005b6602mr30886385ad.4.1793186518836;
        Wed, 28 Oct 2026 04:21:58 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eafcdb52e6sm10157945ad.74.2026.10.28.04.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:21:58 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] media: i2c: ov7251: fixes and infrared strobe for Surface Book 2
Date: Wed, 28 Oct 2026 20:21:45 +0900
Message-ID: <20261028112154.855185-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Microsoft Surface Book 2 has an OV7251 infrared camera (used by
Windows Hello) next to its front camera, both on the Intel IPU3 camera
interface. Its 850 nm emitter is wired to the sensor's STROBE output
pin: the ACPI tables describe no LED, GPIO line or regulator for it.
With the mainline driver the camera streams, but always unlit.

Patches 1 to 4 fix bugs found while testing on this machine and on a
Surface Pro 7+, 5 and 6 rework the driver's state handling and add the
placement controls:

- 1: the 19.2 MHz PLL table for the 319.2 MHz link multiplies the
  clock before dividing it, which runs the PLL's VCO at 2553.6 MHz
  against the 300 to 800 MHz the datasheet allows. The Surface Pro 7+
  drops most frames at that setting; the Book 2 copes. Dividing first
  keeps the link rate and brings the VCO to 638.4 MHz (Fixes, Cc
  stable). It goes before patch 2 because patch 2 is what makes the
  driver select this table.
- 2: the link frequency index is taken from the firmware list instead
  of the driver's table, so the sensor runs at 240 MHz while
  ipu-bridge asks for 319.2 MHz (Fixes, Cc stable).
- 3: V4L2_CID_PIXEL_RATE reports the CSI-2 bus rate instead of the
  pixel array clock, which is 48 MHz at both link frequencies (Fixes,
  Cc stable).
- 4: the 60 and 90 fps frame intervals are accepted but the sensor
  keeps streaming at 30 fps, the vertical blanking control not being
  updated (Fixes, Cc stable).
- 5: conversion to the sub-device active state, as Sakari asked on
  v1. The core then handles control events, which v1's patch 3 added
  by hand, and v4l2-compliance passes on the sensor.
- 6: orientation and rotation controls from firmware.

Dave Stevenson noted on v1 that set_frame_interval does not belong in
a raw sensor driver that also exposes VBLANK. Patch 4 only fixes the
current behaviour and does not stand in the way of removing it.

Patches 7 and 8 add the emitter. 7 moves the strobe registers, which
the three mode tables write identically, out of the tables without
functional change. 8 adds a V4L2_CID_FLASH_STROBE_OE control that
enables the STROBE pin, pulses it on alternate frames and makes the
pulse follow the exposure, from 52 lines up to 45% of the frame and
never more than 776 lines. This matches the Windows driver installed
on this machine (Intel ov7251.sys 30.18305.6.5127, read with a
decompiler): all four of its streaming modes enable the STROBE pin and
clamp the pulse to the exposure within 52 to 776 lines; the two modes
Windows Hello uses light alternate frames (0xaa), the other two every
frame (0xff). A register dump taken on a Surface Book 2 during a
Windows Hello sign-in [1] matches the 30 fps alternate mode. V4L2 has
no per-frame illumination flag, so user space tells lit frames from
dark ones by brightness; the dark frames give the ambient-light
reference a face liveness check uses. With every frame lit and filmed
by a phone at locked exposure, each pulse is 1.1x (default exposure)
to 1.2x (776-line pulse) as bright as during a Windows Hello sign-in
on the same unit; with alternate frames the average emission is within
the same ratio of Windows'.

A linux-surface pull request for the Surface Pro 7+ [2] instead turns
the emitter on unconditionally while the sensor streams, with a module
parameter to disable it. This series leaves the choice to user space:
the control is off by default, and the emitter is off whenever the
sensor is not streaming.

Patch 9 makes ipu-bridge report a rotation of 90 degrees for the
infrared sensor, whose frames show an upright scene turned 90 degrees
clockwise while the firmware says 0. It adds a DMI quirk table next to
the existing one for upside-down sensors, with entries for the Surface
Book 2 and the Surface Pro 7+, the two machines checked. A user-space
project for the Surface Book 3 rotates that model's infrared frames by
90 degrees as well [3].

Patch 8 needs V4L2_CID_FLASH_STROBE_OE, added in v7.0 by commit
5be4154f6255 ("media: v4l: ctrls: add a control for enabling strobe
output"), and is not meant for stable. Only patches 1 to 4, the ones
with a stable tag, apply to older trees on their own.

[1] https://github.com/linux-surface/linux-surface/issues/739
[2] https://github.com/linux-surface/linux-surface/pull/2252
[3] https://github.com/linux-surface/linux-surface/pull/2289

Changes since v1 [4]:
- New patch 1: in-range PLL dividers for the 319.2 MHz link. D.
  Manresa reported that v1's index fix made his Surface Pro 7+ (IPU6)
  drop most frames and stall; with the dividers swapped he measured
  13 clean runs of 13 against 7 bad of 10. Dave Stevenson read the
  same values out of the datasheet and measured on a 24 MHz board
  that the out-of-range tables do not produce their nominal
  frequency. The 24 MHz tables have problems of their own and are left
  alone: nobody in the thread can test a change to them.
- Patch 2: Reviewed-by from Daniel Scally.
- New patch 3: report the pixel array rate, 48 MHz, for both link
  frequencies. v1 reported 63.84 MHz at 319.2 MHz, the bus rate. Dave
  Stevenson saw the same on a Raspberry Pi, where libcamera asked for
  100 fps and got 75.
- Patch 3 of v1 (control event support) dropped; patch 5 converts the
  driver to the sub-device active state instead, following ov5645,
  which gives the same result through the core (Sakari Ailus).
- Patch 8: use PERCENT from linux/units.h and plain clamp(), clamp
  the span to its limits before applying the duty limit (Andy
  Shevchenko). The CCI register helpers are left for a follow-up
  after this series.
- Patch 9: entry for the Surface Pro 7+, whose infrared frames D.
  Manresa found turned the same way as the Book 2's.
- Tested-by from D. Manresa on a Surface Pro 7+ (IPU6, kernel 6.19)
  on patches 4, 6 and 7. He tested v1's strobe control too, with the
  same result after Andy's changes, and asked to re-run the v2 patch
  rather than have the tag carried.

[4] https://lore.kernel.org/linux-media/20261026111032.88355-1-antoine.pichot@gmail.com/

Tested on a Surface Book 2 (i7-8650U) with the series built out of
tree against linux-surface 7.2.12 (test suite, logs and a v4l2loopback
bridge for applications: https://github.com/antoine79/surface-ir-camera):

- link frequency 319200000, pixel rate 48000000, 30.0 fps measured;
  PLL registers read back as programmed while streaming
- 3 x 155 frames at 30 fps and 3 x 155 at 90 fps on the 319.2 MHz
  link: 0 dropped buffers, 0 CSI-2 error lines
- v4l2-compliance -u on the sensor: 0 failures (was 1)
- --set-subdev-fps 60 / 90: 60.16 / 90.46 fps measured (was 30.01)
- orientation front, rotation 90 (0 before patch 9); the colour sensors
  still report 180
- dark frames and the sensor test pattern unchanged after patch 7
- strobe span read back while streaming: 504 lines at exposure 504,
  776 at exposure 1704 (30 fps), 258 at exposure 552 (90 fps)
- mean pixel value of an indoor infrared frame at analogue gain 128:
  18 to 19 unlit; with the strobe enabled the lit frames read 526 at
  exposure 504 and 609 at 1704, the dark frames in between 18 to 21
- strobe off and sensor suspended within 2 s of the stream stopping
- 10 unbind/unload/load cycles: no warning in the kernel log
- Howdy face login enrols and recognises through a v4l2loopback bridge
  that passes the lit frames

The remaining v4l2-compliance failures are in the ipu3-cio2 capture
driver (buffer creation and mapping checks) and unchanged by this
series.

I developed this series with an AI coding assistant (Claude): the
design choices (alternate frames, the pulse limits, the exact SKU
match), the reading of the Windows driver and the measurements above
are mine, and I reviewed and tested every patch on the hardware
before signing it off.

Antoine Pichot (9):
  media: i2c: ov7251: Use in-range PLL1 dividers for the 319.2 MHz link
  media: i2c: ov7251: Fix link frequency index
  media: i2c: ov7251: Report the pixel array rate for both link
    frequencies
  media: i2c: ov7251: Reset vblank when the frame interval changes
  media: i2c: ov7251: Use sub-device active state
  media: i2c: ov7251: Add orientation and rotation controls
  media: i2c: ov7251: Move the strobe registers out of the mode tables
  media: i2c: ov7251: Add strobe output enable control
  media: ipu-bridge: Add a rotation quirk for the Surface Book 2 and Pro
    7+

 drivers/media/i2c/ov7251.c           | 360 +++++++++++++--------------
 drivers/media/pci/intel/ipu-bridge.c |  31 +++
 2 files changed, 209 insertions(+), 182 deletions(-)

-- 
2.56.0

