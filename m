Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B873914E2
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 07:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530875; cv=none; b=FzZekPRUrqh1CbxsqqFiOOCyknY29J1g34zYD3EnIcItuowmnMNLyjnyfoP+y0yjQ7McwKA1HT+TNVxnbwVBLcPPnCDntqna4sifMeg3qI5A51C87SNINxvxVlgueRHj7nhsU7UkzOuP9LOjHSwm4rAFRI1OB2qyg7iCwaEgKfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530875; c=relaxed/simple;
	bh=hAbUZwuj3Le1qOhcA4KwdsAZIxEY2ntll6qIGO2qBFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JizWWD8jYVGkGN3AlGN7+kkGXchG4pr/Ed/iGLFgtR3oD086cGw4ajCqAfUjPadv0pxyt4CQV28iIgk9cycjthp1Pewws6Nd5gM7FvZc6mfGh9T4FQOd6N+DSSfAq9G0nGFkuQKk14AMmeRcr1DEjliS3Chv3wv3ImlvNNdXraw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuqNwq7u; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuqNwq7u"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so9955775e9.1
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2026 00:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791530872; x=1792135672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IfvBkAbgi6hNYJ2Pfy9m5gY/SS7LE/POyUTc/Wa2L5U=;
        b=FuqNwq7uPB/jS1TEFnpPkWPg+KpK1jhXpnQwWNESMkLbU4di5uMo9MRt6dp3P3lid/
         ZfgD2z1sWePMGyefM78YaT60RnONi1Kw7W5oxcG8zOeQPgGBucjNgcCFGWHfNyz6CjC7
         ujSEnPqiE0Tug/TXFD+DoG91Do8x+Ysev9LPN3xFpriTI3zy7a8rbB2uMbkPZ10UCHtM
         u8Ob/K6GL+MOkMdjjVAT9AkkRgvz2JNyf9wOblNZ/iIDH71aGqPTXnLk1AMWPV0qIjCr
         7qQg0wC0eUMkGwDUzC5SVaMJewVSrLcoFnF55Jfurro3A3s2T/TqZ3CsnQC3w0yI+CAs
         V7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530872; x=1792135672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IfvBkAbgi6hNYJ2Pfy9m5gY/SS7LE/POyUTc/Wa2L5U=;
        b=qERbVyYBciRoyN45tZ/Fp87c2QdlcVLKxTF522XMT8VrRj8rg7ojPayKk/6AFwEvDO
         hxdRFfWQ1uiU1BjrTdxdaoUMh/NIrlm/eB35Akdtv59EK+ghOYu3Pv2rP0y4DGU8+L76
         aMbzSpDZ5mh6uxZ955WHcc35FtkSmOfcp2TyQlMNniZpoUX3pRCc/5XDRRVZVA/t+McE
         SOeAbb2eHTLMUHmnCQGd9YuPKQXD5q7AHxr2kaOwzQY9ghegV4HEz5HhPqM0aQ3P5hB0
         BFM7/AcZ2SRJFr/igR0+sbSEscH/6lM//bmuLBLw/h3EdiJsTXqkTCwuwRXvxAbHXgcX
         Z8NQ==
X-Gm-Message-State: AFuF++lp7woqRIX8hzwNS5bK3fUe284+yHLEyb3Vj27A/1haAGcXvGUt
	LyInQCJRIYRNirQJLXKPDrF5NWWhmataRQkbsf4+yfPwqfIxMv+DLsccAOaLR62T7Ws=
X-Gm-Gg: AYBFou3EqNebX/lwrQtR7WU3dy0EnVpM3fN3aiatQPIeut118NFs1eQB+jse0JIlGU0
	z8c+vJGUaIV9AOGiQw218Q51WS70rv54NkJHDLBfL8KxjpLR6qgI7RsrYxfBV8osejzsiiyT1vW
	W1++DYBMRRHQXheCQZm0K9IYMM/yio7x4A7zHaN0MmXqAPgk/nqkcH+tffjTKCtcVxTVxeDqU1c
	/EyoODXhr7L1qlbYRz79/Yi2aMiR47YX01HHTWIx45YAwQarA1xlzp4pUagkAz6oNdS9FptER2+
	Dawz17OsAtb+7tSMJNX4sP6OyxSuy8mThUBazlzA8Pf7KwX0BtYUfLkESqI4WfVXaH2+1TbzlMY
	L8HXUIdsd2iNoe2jkPoOCmEQcl42MX5pwFtWwi+BetTa8e6DaagLzhPtp41NAWNxZHJv6ruKuPd
	6uRLPrs/iJt5tOWmWv9se/PZ/dWUwdMvGqUk1Zn4dmSs+tuMMXIKSW/2C9RHzeTrxAloEC6MD7c
	dzkxB8uBExAP1NX6pkV8JtoKJkg+hw9HDsLZ/+dugbKjntVrXAm9oa/9w0u+af+R6bWbksbK4Mn
	gpLc7IQXQd/Wmvr2SX5CARK2mpbPTFcGddvzVBYnXqAnzvKUZYBL2kEt0XUtY1QnKI5ee0dEMG/
	6PM1W4W1ucW9KPgjd2PjAjpoeRdoRp7H7Ct3fv95Rcfw/K0a2YBvFnA==
X-Received: by 2002:a05:600c:3b2a:b0:4a0:2540:b46 with SMTP id 5b1f17b1804b1-4a18e4aca94mr16192385e9.12.1791530871388;
        Fri, 09 Oct 2026 00:27:51 -0700 (PDT)
Received: from localhost.localdomain (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bbbdd75sm32598895e9.1.2026.10.09.00.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:27:50 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-kernel@vger.kernel.org,
	Nicola Fiorillo <nicfio@gmail.com>
Subject: [PATCH 0/3] media: Add GalaxyCore GC5035 and GC8034 sensor drivers
Date: Fri,  9 Oct 2026 09:27:30 +0200
Message-ID: <20261009072733.39877-1-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds drivers for the GalaxyCore GC5035 and GC8034 raw Bayer
sensors, and the ipu-bridge entries needed to use them on Intel IPU6. Both
are found on the CHUWI Hi10 X1, an Intel N100 (Alder Lake-N) tablet:

  GC5035, 5 Mpixel, front, 2 CSI-2 lanes, ACPI HID GCTI5035
  GC8034, 8 Mpixel, rear,  4 CSI-2 lanes, ACPI HID GCTI8034

The drivers are ACPI only. I have no device tree system with either sensor,
so I have not added bindings I cannot test.

Link frequencies
----------------

Both drivers accept only the 19.2 MHz external clock they have been tested
with. The link frequencies in the vendor code are for a 24 MHz clock:

  - GC5035: Intel's 438 MHz is correct with a 24 MHz clock. For 19.2 MHz
    Intel changed the PLL but not the constant. With the new PLL the link
    frequency is 422.4 MHz, which matches the measurement.
  - GC8034: the vendor code declares 336 MHz for a 24 MHz clock. At
    19.2 MHz everything scales by 0.8: 268.8 MHz, and 24 fps instead of
    30.

The same values are used in the ipu-bridge entries in patch 3.

Gain, power sequencing and geometry
-----------------------------------

V4L2_CID_ANALOGUE_GAIN is the index of the analogue gain step, 17 steps
on the GC5035 and 7 on the GC8034, and the digital gain is left at the
1.0x the register tables program. The vendor drivers fill the gap between
two steps with digital gain; that is left to userspace.

No datasheet is available for either sensor. The GC5035 power sequence
follows the one Tomasz Figa described in the 2020 series (IOVDD first,
MCLK cycles before the first I2C transaction and after streaming stops),
the GC8034 one follows the Rockchip driver. On this machine only AVDD is
a real, GPIO switched regulator: DVDD and DOVDD are dummies, and the
GC8034 has no reset or powerdown GPIO.

The register tables read out a window slightly larger than the output
size and crop it: 2608x1960 cropped at (8, 8) on the GC5035, 3284x2464
cropped at (9, 8) on the GC8034. The size of the full pixel arrays is not
documented, so the readout windows are reported as the native sizes.

The GC8034 blanking register holds the frame length minus the height
and 36 lines. The 36 lines value comes from the Rockchip driver, and is
confirmed by the measurement with VBLANK set to 2000: the difference is
less than one line.

Provenance
----------

The GC5035 register tables come from the Alder Lake-M driver in
intel/ipu6-drivers, which derives from the ChromeOS driver posted in 2020
by Tomasz Figa [1]. That series got as far as v4 and was not merged. The
GC8034 register tables come from the Rockchip BSP driver (rockchip-linux
kernel, develop-5.10). The copyright lines of the original authors are
kept in both files. The register tables have been shortened: the GC5035
one from 323 to 160 writes, the GC8034 one from 233 to 182. Registers
written twice and those already written by the controls have been
removed. The final register state is identical to the one of the original
tables. There is no public documentation for the PLL and CSI-2 settings.

The driver code follows gc05a2.c and gc08a3.c: CCI helpers, subdev active
state, enable_streams/disable_streams and runtime PM with autosuspend.

Use of an LLM
-------------

I speak Italian and I use Claude to translate.

I used an LLM (Claude Opus 5.5) to collect the main points of the sensor
driver reviews posted to this list recently. Claude wrote the driver code
and updated it based on those points, and wrote the test scripts. I ran
the tests on the tablet with the hardware, and the results are listed
below. The code, the measurements and the notes (in Italian) are at
https://github.com/nic-fio/chuwi-hi10x1-cameras

The use of LLMs follows Documentation/process/coding-assistants.rst and
generated-content.rst.

Not covered
-----------

  - One mode per sensor: 2592x1944 on the GC5035, 3264x2448 on the GC8034.
    The binned modes of the vendor drivers have not been tested and were
    left out.
  - The sensor OTP is not read. On the GC5035 it holds factory register
    settings and defect pixel tables, which the 2020 series applied.
  - The GC8034 module has a dw9714 VCM, instantiated by ipu-bridge; focus
    has not been tested.
  - Tested on one machine, with one sample of each sensor.

Testing
-------

Based on media-committers next, commit 8e26d4c20ed2 ("media: hantro:
disable runtime PM before hardware teardown"), and tested on the CHUWI
Hi10 X1 with that kernel and these patches:

  - both sensors stream at full resolution
  - frame rate: the frame rates expected from the driver match the
    measured ones: 28.82 fps on the GC5035, 24.01 fps against 24.00 on
    the GC8034. They also match with VBLANK set to 2000: 14.67 fps on
    the GC5035 and 13.47 fps on the GC8034.
  - analogue gain, from the first to the last step: 15.6x requested and
    15.35x measured on the GC5035, 7.66x requested and 7.74x measured on
    the GC8034.
  - GC5035 test pattern: two consecutive frames are 100% identical.
  - v4l2-compliance from git (1616bf9e3c81), run with -z on the media
    device: 54 out of 54 tests pass on both sensors, with 2 warnings on
    S_SELECTION. The warnings are there because the crop is fixed;
    imx219, gc05a2 and gc08a3 do the same. Output below.

[1] https://lore.kernel.org/linux-media/20200902224813.14283-1-tfiga@chromium.org/

GC5035:

v4l2-compliance 1.33.0-5515, 64 bits, 64-bit time_t
v4l2-compliance SHA: 1616bf9e3c81 2026-10-06 07:30:20

Compliance test for intel-ipu6 device /dev/v4l-subdev4:

Driver Info:
	Driver version   : 7.3.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : intel-ipu6
	Model            : ipu6
	Serial           :
	Bus info         : PCI:0000:00:05.0
	Media version    : 7.3.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.3.0
Interface Info:
	ID               : 0x030000f5
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x000000e9 (233)
	Name             : gc5035 2-003f
	Function         : Camera Sensor
	Pad 0x010000ea   : 0: Source
	  Link 0x020000eb: to remote pad 0x1000096 of entity 'Intel IPU6 CSI2 2' (Video Interface Bridge): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev4 open: OK
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
	Standard Controls: 13 Private Controls: 0

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
	test blocking wait: OK (Not Supported)

Total for intel-ipu6 device /dev/v4l-subdev4: 54, Succeeded: 54, Failed: 0, Warnings: 2

GC8034:

v4l2-compliance 1.33.0-5515, 64 bits, 64-bit time_t
v4l2-compliance SHA: 1616bf9e3c81 2026-10-06 07:30:20

Compliance test for intel-ipu6 device /dev/v4l-subdev5:

Driver Info:
	Driver version   : 7.3.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : intel-ipu6
	Model            : ipu6
	Serial           :
	Bus info         : PCI:0000:00:05.0
	Media version    : 7.3.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.3.0
Interface Info:
	ID               : 0x030000fb
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x000000f7 (247)
	Name             : gc8034 1-0037
	Function         : Camera Sensor
	Pad 0x010000f8   : 0: Source
	  Link 0x020000f9: to remote pad 0x100008c of entity 'Intel IPU6 CSI2 1' (Video Interface Bridge): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev5 open: OK
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
	Standard Controls: 12 Private Controls: 0

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
	test blocking wait: OK (Not Supported)

Total for intel-ipu6 device /dev/v4l-subdev5: 54, Succeeded: 54, Failed: 0, Warnings: 2

Nicola Fiorillo (3):
  media: i2c: Add GC5035 image sensor driver
  media: i2c: Add GC8034 image sensor driver
  media: ipu-bridge: Add GalaxyCore GC5035 and GC8034

 MAINTAINERS                          |  12 +
 drivers/media/i2c/Kconfig            |  20 +
 drivers/media/i2c/Makefile           |   2 +
 drivers/media/i2c/gc5035.c           | 953 ++++++++++++++++++++++++++
 drivers/media/i2c/gc8034.c           | 969 +++++++++++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c |   4 +
 6 files changed, 1960 insertions(+)
 create mode 100644 drivers/media/i2c/gc5035.c
 create mode 100644 drivers/media/i2c/gc8034.c


base-commit: 8e26d4c20ed218db6c3123480a4a4e2545680566
-- 
2.47.3

