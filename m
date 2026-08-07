Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2192A346FB3
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 10:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786098552; cv=none; b=AOeJPqTLEMrsBNq9YMS05sD4aLuUuh4sg1JDKIZSJ9RCpAgdZ6bpz2D/cZHzsCus8mYnW1LMfxO5ZH04LjJoqUJMLkr11W3TC1NP2v64FTPQTrQq3U/wdyAsmUt1fUg9RCkGJhb9KjxVzV7fwl+JJvaHzcYTRNnmn2kxG2hZCdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786098552; c=relaxed/simple;
	bh=y1tLlMek28TMCEjGaWtcRk/xpz+gs6V3j4GxdYCRBDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JdE1/4DbvIXYS9CErKorEzWAT6XXsGN0lJ4KX1stGxSaxjp5Ji8aksN3LZi1JGnG6O5mgesQlB41EEQWUKF+V+0a0mnKN79AYk1NnWmZWuwEc0LICo7LZP383i8YWI8/j1rS0/xt83fOILXwWNKGPVVfk2ZZKIehVTwLBlwi1C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gc4v1gYu; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gc4v1gYu"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so3194569e87.3
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 03:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786098549; x=1786703349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dU/K9fyx5mxLUEJE5PMTRMAmnix/bdUYR+gmTXvxCzA=;
        b=gc4v1gYuTYKo9HGSnEw4cm+vHoyOii4W6rlh1Vz98pbjKAqyWZ99L8qHbvg1t0mlHz
         QjEsKmo0r2zJn/w1PV2CdrSrl+7kGmVzBur8JUBx3LsVHepbikeXSnUbYSU9SW60CjMS
         h70WE0Q9usa5iEvpAXnqNc1lyxLEUmHruUTQYCzs2FhP5mpE+xL18swA0TJmNdcaJte2
         u0YeIOMcUMC5fqg+2EzAbvGjfYUzyJPu2C2afmMDB92kcYxMfFj4TxVp112V6EDSr6G0
         t0ILBo9TFjDrqUW0TmZB/PhuamR+3yjw3vjpLT/dKgFcGAJdFDJlozHJAnTqfIlVdFBs
         wpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786098549; x=1786703349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dU/K9fyx5mxLUEJE5PMTRMAmnix/bdUYR+gmTXvxCzA=;
        b=WX9AqeXxXbB8YKPC2N9rpARV+0d9IZzXDQ+nvlSrhwyfUaj42uEBGDI6VJGXwTr6DX
         wglPpDtdhDdIPeqTgT5p7HsPmgMdKUVyl4cqDWBkUSqUmkrjRik6t8DzObtIeyOc2Q7R
         CrQtO746vqGnGs/ITZi7Fd3NC3+BwapS+z9lM7igWxDWmsTakGQZHa4rJNMRKQZaCVaE
         jvLOPnM8LqSCVxbtaP4Io/Pd/mteERn3dEZ9BNf7qDhSCgAVPnlGCil0WiskhCzcdxFh
         tCcpAKomBG8Yb9tFR7nnCurgYmuM5vrmok+SaVI3aANkPtwJDWBFf2zOy+KcaySRrI4s
         V0uQ==
X-Gm-Message-State: AOJu0YxzoTqqZjCt0l6/0YwyMu/QQtumM1eDZ04ahxSF9wqwpobW669h
	Y3fd87Gi/7m+Gmeen/m+LKNyEJUS4utFZHZivPLQHI1QCuxoNRMai6IoEWgIdVeU
X-Gm-Gg: AR+sD12UwBDU1BXI20OD+VcP2DlFOWusHhtG+jxsYbm09Ae4qFGi7DswI4J1V0JfFB7
	zC5T9jrMIgdZWbrkgosRAKWLbWf8vcBlP6hrQkNHzCfSv+9+zFn64xR/Chg5Ors5hXcg4vQSToe
	5z9AbvqjXiZ37dzzCOC3E+C+5X3KUWk1zMMBtTmPeFtho/pFXUNiXoy2yRvd3MPJZu+Y7dGAvm1
	EWYq1vQAy7O46EDr00VH7qtXzzm7a4hMMoYx/aSHWHls9pDuireEEMosLySnLtYfCgwUrO7o+Yi
	MqO6JYgDnZB/TFoB6PJW0oGMZaMvmkeVMbzybgSvf0LevHgKsQSlur/M/IzjhhjCMqdGNSCTLqj
	05d4gbdcT7h0/V30lwLdlwf/rOl/hMzf31hW0Cn8A/p9Qd0mUU4jkb6wm8y+bEDrUlK6KgVVOB4
	IB53G0DFW32kjZqSeP8YMgyalFFOpGwdBLZC3vH85IOaglrdFezdNZ7YhFnjqdOojaxJt1NZS5Z
	Sq3o6WLpyDg2y0=
X-Received: by 2002:a05:6512:628a:b0:5b1:589b:3579 with SMTP id 2adb3069b0e04-5b2f4b84a6emr3570956e87.4.1786098548833;
        Fri, 07 Aug 2026 03:29:08 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b304fd1d2bsm394811e87.6.2026.08.07.03.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:29:07 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH v2 0/2] media: i2c: Add onsemi AR0234 camera sensor driver
Date: Fri,  7 Aug 2026 13:28:45 +0300
Message-ID: <20260807102847.1813059-1-eagle.alexander923@gmail.com>
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
  - [High] Missing `v4l2_subdev_cleanup()` causes a memory leak of the subdevice active state.
  - [High] Static hblank lower bounds permit dynamic line length reduction below the absolute hardware minimum.
  - [High] Potential division by zero during delay calculation if the clock rate is zero.
  - [Medium] Unlocked V4L2 control helpers are called during initialization without acquiring the control handler lock, triggering a lockdep splat.
  - [Medium] Mixing goto-based error handling with scope-based `__free()` cleanup in the same function violates API guidelines.
  - [Medium] Changing the crop height fails to update exposure control limits reliably.
  - [Medium] The active format state is modified before verifying PLL configuration, leaving state inconsistent on error.
  - [Medium] Unlocked access to shared format state in `ar0234_get_frame_desc`.
  - [Low] Using `DIV_ROUND_UP` with a 64-bit numerator causes a link error on 32-bit architectures.

Alexander Shiyan (2):
  dt-bindings: media: i2c: Add onsemi AR0234 image sensor binding
  media: i2c: Add onsemi AR0234 image sensor driver

 .../bindings/media/i2c/onnn,ar0234.yaml       |  126 ++
 drivers/media/i2c/Kconfig                     |   12 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ar0234.c                    | 1290 +++++++++++++++++
 4 files changed, 1429 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
 create mode 100644 drivers/media/i2c/ar0234.c

-- 
2.52.0

