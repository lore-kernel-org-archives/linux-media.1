Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03423C8732
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 07:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787212541; cv=none; b=muHQYHAi75k2QfCpafXj0T0cDVxjFAYLhbpzt4AB4BA5VEAFROpl8tMbFO0UDEyhSjVPcDxADtlO4S7S6wuT8DcEJwPunuEg1IDZKfhlQHBYsEbtAVeQCl5prbizQqttym0wU20uHpNdRKBjqIvjuj5ZxzBZ3vB/wAZXmDWtTl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787212541; c=relaxed/simple;
	bh=xmMHX8X58zmAa1SfHePlIZqrcUFk2iMcnCX2kK5gSX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=scDjDu34DrBP9tjGeGltMItO4ZlwgGv2Ui27NLOmCD8yOpVTe28fFmRv9Q+ZxrqRu6fByvqW2Y3wCSrep+41K+naWYMyh7w8YvYOzIMpOJrCBiTqbzofOxsoyln/fogq8Cj7TTm0TakjBUg8ILUsl02EtPQaxy4EYa0WADy3NTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9rsnQ8p; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9rsnQ8p"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a12ffc112cso6936821fa.0
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 00:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787212538; x=1787817338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=604gPXL7bVZKZDFwmLIC5+XnR8BH2kFYECxuf0yXyaY=;
        b=R9rsnQ8pBB02TdzgnnD1H2F2WyyZLLLoVqi6S242ekdjmBiq1mknumpKmVm8W3j3qW
         9YBplpMCzmXrKqJoT8Sk9TuEalTyY2/7kiCS1L6DZt3S1/m6akrKYevX39uIBXSCN7sY
         x/0mcxEHQmWDkt2QGdtU3wzFcBs2goJ0rXc4j8arzztduv7EMF90e/g2lrYjLHTv9pqi
         2LZEU5W6FlWAegXC25Ki09UWv+iH3z0z3RcRKocUoiDpW7R16Tl5TmFY29myloeJftKT
         ZMfk1fo1xIibKzNSab+yFgcbHw3CghMbKWjbo7W10LYxGjAxSXUD5HBCv3ARMcpf9hhg
         Fsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787212538; x=1787817338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=604gPXL7bVZKZDFwmLIC5+XnR8BH2kFYECxuf0yXyaY=;
        b=BXQsGLLTYStysId+p/wv8s7P5EAKEu4prNAbJtepW+etUz9mITL2CD7qLJIz2G+Tua
         hoDOPLJ4e5m8xXTtXWJx9qB9uVD1vez+LopI7y51KBTAynZdv4CBdELNb6UBl2WBHNNn
         phcTBaM8j0a/bHmzc/Z0iNN+SdUiFU+RoGE1q4AtxvJNAcfDQxAgDbcIYtu/VE5a78mY
         1opDsqYA0frsPMaOXm59k22MtOIBx7bFBj4kFu4Tm6Gt5KETLHKhL+izwH8e3Uv0SDRR
         0az+972Slb/Zh4B/XjHIbq0UkR2GW7IyNKzGjX3ImAdl/lXZPKhfd8XfKWsxjWDdMIod
         dAHg==
X-Gm-Message-State: AOJu0YzmGxK4Dzc5PueS6GaBRRAOza2ac92gSeeA/3h4uOFH6bD2V+AT
	Ygqc4o2bmgR7yOKXhUU/FkKqUzaWWraidBn/sBsL1tc0iNoA9DEZPnO+RNzWvRUJ
X-Gm-Gg: AR+sD13J3VmREX2usCjWAhXRkh8xEBJ572yeGAr2R5w+D2w1Xt4+5E3Jvr3qdlFCtmH
	iofPQXxzXWVVS4IiGprD/fbov+O+51jl1rwS6eNve8IA4mBWaEHjYSeFVJdu5ohWQKnfG2c013A
	dXUS+3fW6A3R5jRul+1GuKnmyP1kSjC9gXxAbty3vO57KVfMO/1KgGSs6YOD2SptlV+M9UQIXcT
	yeIq20fHyV364Y0A74hjjrfS5s0dDeXMgtIcd/VurZRajwHRIKpN5+1GmEzKxlS2JoJh2bujHz4
	CD2soFa1z54f/ofvPS62XmpgMmltScDhUkqmVwejSqBN1EhUD2T7Phv5qJAYuTSy5EHygVEVHxs
	l7PNGD1mC2MQ1H/18b3U18JWaQitbcew91Zp6soVGFNcRBgoou+Oro81E3mZa9X2xP0teezS2QF
	oWOTMw1LK6/9mxA4PXZOlLBb2dGJgrQac7MScfzHE4ehel/xps5loAlTjs+sWqFtEGEgUslWgAn
	MX4
X-Received: by 2002:a2e:a802:0:b0:396:6d94:4a4b with SMTP id 38308e7fff4ca-3a1969f6df8mr8790621fa.10.1787212537455;
        Thu, 20 Aug 2026 00:55:37 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a189e15d1dsm11757751fa.33.2026.08.20.00.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 00:55:36 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Quentin Freimanis <quentin@q-lab.dev>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH v3 0/2] media: i2c: Add onsemi AR0234 camera sensor driver
Date: Thu, 20 Aug 2026 10:55:22 +0300
Message-ID: <20260820075524.2056029-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a driver for the onsemi AR0234 CMOS image sensor.
The AR0234 is a 1/2.6-inch global-shutter sensor with a 1940x1220
pixel array, capable of 1920x1200 resolution at up to 120 fps.
It supports MIPI CSI-2 output with 1 to 4 data lanes, raw Bayer
(8/10-bit) and monochrome formats, as well as DPCM 10->8 compression.

The driver has been tested with 2 and 4 lanes on an ARM64 Rockchip
RK3588 platform with a 27 MHz external clock. Both 8-bit and 10-bit
raw Bayer modes are functional.

Notes:
- 1-lane mode is currently disabled; attempts to use it produced no
  valid image.

[root@diasom-evb ~]# v4l2-compliance -u 2
v4l2-compliance 1.28.1, 64 bits, 64-bit time_t

Compliance test for device /dev/v4l-subdev2:

Driver Info:
ar0234 9-0018: =================  START STATUS  =================
ar0234 9-0018: ==================  END STATUS  ==================
        Driver version   : 7.1.0
        Capabilities     : 0x00000000
        Client Capabilities: 0x0000000000000002
interval-uses-which
Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev2 open: OK
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

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 20 Private Controls: 0

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

Total for device /dev/v4l-subdev2: 45, Succeeded: 45, Failed: 0, Warnings: 0

V1 -> V2:
- Fixed bugs reported by sashiko-bot:
  - [Low] The `compatible` property schema contains fatal YAML syntax errors due to missing list hyphens (`-`), resulting in invalid JSON schema constructs that will fail `dt_binding_check`.
  - [Low] The `data-lanes` schema constraint mathematically allows 3 lanes, which contradicts the explicit 2-or-4 lane hardware requirement described in the binding.
  - [Critical] Incorrect clamping order in crop selection bounds calculation causes unsigned integer underflow, bypassing bounds checks.
  - [High] Incorrect validation of `pm_runtime_get_if_active()` allows execution to proceed on negative error codes, leading to a usage counter underflow.
  - [High] Static hblank lower bounds permit dynamic line length reduction below the absolute hardware minimum.
  - [High] Potential division by zero during delay calculation if the clock rate is zero.
  - [Medium] Unlocked V4L2 control helpers are called during initialization without acquiring the control handler lock, triggering a lockdep splat.
  - [Medium] Mixing goto-based error handling with scope-based `__free()` cleanup in the same function violates API guidelines.
  - [Medium] Changing the crop height fails to update exposure control limits reliably.
  - [Medium] The active format state is modified before verifying PLL configuration, leaving state inconsistent on error.
  - [Medium] Unlocked access to shared format state in `ar0234_get_frame_desc`.
  - [Low] Using `DIV_ROUND_UP` with a 64-bit numerator causes a link error on 32-bit architectures.

V2 -> V3:
- Fixed bugs reported by sashiko-bot:
  - [Low] Standard properties 'orientation' and 'rotation' bypass standard type validation.
  - [High] Incorrect initialization order of the V4L2 active state and control handler breaks lock sharing, causing lockdep splats, data races, and masking a self-deadlock in `ar0234_set_pad_format()`.
  - [High] Brittle and restrictive parsing of the 'link-frequencies' device tree property.
  - [High] Invalid rectangle clamping logic in `ar0234_set_selection()` allows crop width and height to underflow their minimum limits.
  - [High] Incorrect power-down sequence disables regulators before stopping the external clock.
  - [Medium] Unchecked return value from `v4l2_subdev_state_get_format()` in `ar0234_get_frame_desc()` may cause a NULL pointer dereference.
  - [Medium] Unconditional overwrite of the VBLANK control value upon format or crop changes.
  - [Medium] Missing `media_entity_cleanup()` in the subdevice cleanup routine causes media graph objects to leak upon removal.

Alexander Shiyan (2):
  dt-bindings: media: i2c: Add onsemi AR0234 image sensor binding
  media: i2c: Add onsemi AR0234 image sensor driver

 .../bindings/media/i2c/onnn,ar0234.yaml       |  121 ++
 drivers/media/i2c/Kconfig                     |   12 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ar0234.c                    | 1294 +++++++++++++++++
 4 files changed, 1428 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
 create mode 100644 drivers/media/i2c/ar0234.c

-- 
2.52.0

