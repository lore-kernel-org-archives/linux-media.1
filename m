Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFD9381EBB
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 16:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791475639; cv=none; b=S+uSxlogUwn42DPC3ymqmyLN8ducsQRW1e3r4rGqHiCee9DkdnBG1ES+KIcNFxnLzlLQsPPjHkAJKZSxqjnl5WbCRIGshHg6rVRtxI9XtBktbLCzi33JIIzN+jPrHZ2v/GDr4nr6pwyto0V5vHsN6E8NOLLWTqSPlezCas9dqhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791475639; c=relaxed/simple;
	bh=vOKHNcAPhBIJhsHcwjfO3NU8p1rc/qCMPRMq2Ks+mbQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nWOzb4MWW/tyxxUI42kBx1MSSGRrSClYNlKUFZJWHdDLMaSwBFe0zbgbeIULsBf4H6HDZIH149jQo5bHczqkF4X4xQJ+ar/5G6iLH18jSAUFxag42IFaulGlFI1k3UcZ8oq1FF9FFy+QwP2dn9LaJn+QJ2o8U/8fsnY89ibBNBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=AOtkFsPT; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="AOtkFsPT"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3a0aa5e2b20so1375850a91.1
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 09:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1791475636; x=1792080436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gXIdHUETdOrFzdkDSgL8Eu3MeGwhdpssz2LX5b544u0=;
        b=AOtkFsPT4aAM6jS4imt3CEkDyTKhXo2YVzjKk8ErjZPeXtu2BbLAQvvy5ff/kDNiQN
         CJxLvh32WX2/UddHJydrk/DrOW0V5ns/P0+6VgNp+bS1Gd/iQHF8y/GhsuRDJhl5o7te
         888JFLMziBCQtdCTC04mrJWfo/ezfw7gdY6bW0SOdgjMPn837M5IYfFzQw74qaehsNQM
         UvyOjDAdCE91KZ8GIuOJwdz8rqba/MseVeza834hW+mB+qjcQ15ZoiW1hPt/JqJyY0ZW
         j9bWBZ68y9drDJO3Fv3IS1zlJ7vZToVpF2RxBVetYMk0XyhkPi2QafiAOF7iXd70EYH5
         DCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791475636; x=1792080436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gXIdHUETdOrFzdkDSgL8Eu3MeGwhdpssz2LX5b544u0=;
        b=ofCo98e9BjzdofByKYjk0RpcpETrMm93NZiTl/Mx9w6VKwD7bjB2qEGiCKPaJKUhF/
         l/CPefQJDM7hRNo9ZR9N9g6fLUH5Zr4/LpzmX1UbOaZHFNX3PjHOkpihczukhPWxO0jD
         enpyhQSCU/hSADGmQeEkuS055sbbfOl+Xz/qBC2rvZRdP1fDcU5dgloMPiKKchssx17O
         mCxfDTke4DBYnp7G+BR/s85e88s2TT3ztrxmZ//PdHKigBuB/DIQsgFKyBbrlNLIFLPR
         u73ylsweK0KSg/mgtjiQLUPTKEjFYuAvUsurpauwWwAh3od3cRBQ69tftXQrU3sZXb7U
         En3g==
X-Forwarded-Encrypted: i=1; AKwUvBz668WAc8k7d34cANbDhOwrOyc9TgTEqvIXjDhJeZTV0Cy7j0G+j6YGgcZkRGeUY7qWOTbadfEdkB9F6A==@vger.kernel.org
X-Gm-Message-State: AFq9FYK5T2G9wLV9eLmM0xD/4Y6somYHoIJDR0VK3RQN03Du8Kt1tbIH
	Quc1FrGFxXNXeR7EyzNqf02YTFR8l/jGUZ+M+e2P8QKLZjxIaPLGYmLWjJlZDPcbjC7S
X-Gm-Gg: AYBFou1DoZOYdNsF1+9RnJU/5RsBCEQxMyc3LZeVdYfcFqQ1BcZFPiM6gtRaHlbeIYO
	PWBxI5ouRLUTJtc8UoUfSnjGv+iC6KaOjSP96vwkpVtmtL/mc+TLuHkNo0OFSp86Wfbkn1zHttq
	qSax7IpI/KYJdTEv7kBKRGkti2F0lAgTIk9qxXWPZhxA5c7QeeT7GvG14T/SkXVAEIkB91A36LV
	HYBEWYaC+g/fzX0CloVW8IzcdeXJJSltsUKQDbniDz4swKd3YWO+sxTdICvmsA9J0hTwEZbLR60
	3bKWQ8C47MTWj7Sm7Qrl8j9xfob27sALDIg8wWRzT+I3YaeOTVtnq6BCOMD76DO7bkUzGWFpRhi
	6W3c1bDiHyFMHskoDzR5WpTcyAVLJ44TcA+MMsQsj/UG/TKHJRMwYxfMXu45Tp4L1pUNpJI9Goy
	dwNRpK8qvjazeBZNbe6KRCN/dn0xBdLNgYLwQ6qb+0gFBDAeg9qcaHy4AQ1niq0VO6ynnV88NST
	lku8u+NnSONHkR+QQ==
X-Received: by 2002:a17:90b:17cb:b0:39e:6a81:5a90 with SMTP id 98e67ed59e1d1-3a8a1b0ecc0mr5282885a91.36.1791475636407;
        Thu, 08 Oct 2026 09:07:16 -0700 (PDT)
Received: from ltu.. ([116.101.18.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9d94ef876sm4724657a91.0.2026.10.08.09.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:07:15 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	Hans Verkuil <hverkuil@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: i2c: Add OmniVision OV3660 image sensor driver
Date: Thu,  8 Oct 2026 23:06:48 +0700
Message-Id: <20261008160650.73927-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a driver for the OmniVision OV3660, a 3 megapixel sensor with
an image signal processor and a parallel (DVP) output. Espressif's
esp32-camera library supports it; Linux has no driver for it yet.

I have an OV3660 module on the 24-pin DVP connector of a MangoPi MQ-Dual
(Allwinner T113-S3) and tested the driver there, with the D1 CSIC driver
I posted last week [1] and the changes I have for its v2. This series
doesn't depend on that one. The values for the registers the datasheet
calls reserved, and the colour tuning, come from Amlogic's GPL vendor
kernel driver for this sensor.

The pixel clock is 108 MHz in the full-width modes and 54 MHz in the
binned ones. The binding asks for the link frequencies the board can
take, and the driver offers only the modes whose pixel clock is listed.
PIXEL_RATE is the 54 MHz clock that the sensor's line length counts;
HBLANK and VBLANK are relative to the output size, so the frame time is
(width + HBLANK) x (height + VBLANK) / PIXEL_RATE in every mode, the
binned and scaled ones included.

A few things aren't in the datasheet and were found on the board: the
system clock divider resets to a value that stops the pixel array after
the first frame, the parallel port clock in manual mode is SCLK2x
divided by 0x3824, and the sensor is back side illuminated, so the
driver sets the mirror bits for an unmirrored image.

XVCLK can be any rate from which the PLL reaches 216 MHz exactly. I gave
the sensor 8, 12, 24 and 27 MHz: each time the driver chose the expected
pre-divider and multiplier (read back over I2C), and every mode ran at
the same frame rate. 20 and 30 MHz are refused at probe.

All six modes run at their expected frame rates on the board without
errors: 2048x1536 at 15 fps, 1920x1080 and 1280x720 at 18.8 fps, and
1024x768, 640x480 and 320x240 from the binned array at 30 fps. With
only 54 MHz in link-frequencies the driver offers the three binned
modes, with only 108 MHz the three others. The colour bars come out the
same in all six formats. v4l2-compliance from git passes on media next;
the two warnings are about crop, which the mode fixes, so there is no
set_selection. The same tests ran on a kernel with lockdep, KFENCE and
slub_debug without a report, as did unbinding and binding the sensor
driver, idle and while streaming (the CSIC v2 stops the stream when the
sensor goes). Rebinding it in a tight loop while udev opens the new
nodes runs into the known subdev_open() race in the V4L2 core [2].

One thing I haven't solved: in the three modes that read the full array,
the image gets a magenta cast that grows with the gain, green with
vertical flip, and shows most in dark areas; in a dim room, at the AGC's
15.5x, it is visible over the whole picture. The green and the red/blue
pixels end up with different black levels there. It comes with the value
of a reserved register (0x4520) that the full-array readout needs; the
other values I tried shift or split the lines. The binned modes don't
have it. Reading the array at half speed (7.5 fps) makes the cast
smaller, but it doesn't go away, so the driver keeps 15 fps.

The MQ-Dual ties PWDN low and leaves RESETB open, so I checked the
powerdown and reset GPIO handling on a spare pin: asserted while the
sensor is off, released while it streams. Not tested: a sensor wired to
those GPIOs, and other receivers. The binding also describes the
sensor's 10-bit bus, which the driver doesn't support yet.

The series is based on the media tree's next branch.

[1] https://lore.kernel.org/r/20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog
[2] https://syzkaller.appspot.com/bug?extid=74de6401dbdd377b5746

v4l2-compliance from v4l-utils git, on media next, with vivid as the
DMABUF exporter (v4l2-compliance -m /dev/media1 -s -e /dev/video0). The
media device and the CSIC's nodes pass too (8/8, 61/61 and 62/62); here
is the sensor's part:

v4l2-compliance 1.33.0-5506, 32 bits, 32-bit time_t
v4l2-compliance SHA: 91dda32e4cc9 2026-09-28 07:58:16

Compliance test for sun20i-csi device /dev/v4l-subdev1:

Driver Info:
	Driver version   : 7.3.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : sun20i-csi
	Model            : Allwinner D1 CSIC
	Serial           : 
	Bus info         : platform:5800000.csi
	Media version    : 7.3.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.3.0
Interface Info:
	ID               : 0x03000010
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x0000000a (10)
	Name             : ov3660 0-003c
	Function         : Camera Sensor
	Pad 0x0100000b   : 0: Source
	  Link 0x0200000c: to remote pad 0x1000002 of entity 'sun20i-csi-bridge' (Video Interface Bridge): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev1 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device ioctls (Source Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
		warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
		warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 17 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test TIME32/64: OK
	test blocking wait: OK (Not Supported)

Total for sun20i-csi device /dev/v4l-subdev1: 55, Succeeded: 55, Failed: 0, Warnings: 2

Grand Total for sun20i-csi device /dev/media1: 186, Succeeded: 186, Failed: 0, Warnings: 2

Nguyen Minh Tien (2):
  dt-bindings: media: i2c: Add OmniVision OV3660 image sensor
  media: i2c: Add OmniVision OV3660 image sensor driver

 .../bindings/media/i2c/ovti,ov3660.yaml       |  121 ++
 MAINTAINERS                                   |    7 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov3660.c                    | 1319 +++++++++++++++++
 5 files changed, 1458 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov3660.yaml
 create mode 100644 drivers/media/i2c/ov3660.c


base-commit: 9a4dd8147c7a45e8579e58c101c25604e51117b0
-- 
2.34.1

