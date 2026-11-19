Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102709;
	b=19KhVMvKbrqfzqyGTMBsHSnLZsxNsndQe+aS0NGLr8ME7nRUsFvdex+wFrOx3l3zHvya
	 4U1bz2Yy3mE9hZWCg4kfup5kaIWATPUPk3xt5r9mNvKCaAkGPohoZ+zdkZJViDO1Rkim1
	 eBwCPqaurWFhjpYgQoQ8ZWUAHPxknF/ow9Hole0lv2nu3J2qU+1wh4j/WNBsq6iOdfiWo
	 FP5fgbSV5jaReEPU3HFCwK29DGM31lfuMRQB5X2t1yT2szjzpk4ycInjSVAtnP1Hg72Lp
	 5nUsg3P0jXlxF4GAiM8TAb7IwLMhaMd0O+6gzw5DG3CPzrGd2cMoXbdY9PG5vxK9rLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102709;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Ql0Lbr/kbPJ4gI++NO6Ny6cleONNaOYelhJZtHFUmXA=;
	b=vCwRiBhgv3DasXwaugC9iTJyiG0XdyyaAXjnKiV5+dcvK7Xql29eA1HP6tELX6KDcg4A
	 r3JFt+EnbIO7aGLsSeJlzrsaqoOjhhvlfvLpVE0EQzXk0PmNeMJiFp7pKyAO3bAg5rbuh
	 oVIVOXAEsjtBspkIINlF9pU+PikX+pIRIy8D8Y5/Gl56W/xe+tJ4l9iOO6t62tGg7U59r
	 W5FczFQsq8x1p5K0pO3mgjO0bep/fwlrY/LnL0tnQpPJLB7b+m1Pe+Nu37ZqpO8nkyyhV
	 Xi3NiO9fDr5G/mGLYheWu/pTaxgv7a+QoKtKKBPBFz2c+Mes2ZzX+miq9ybIolsTHBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="m/wg8U5q";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDE660A262C;
	Thu, 19 Nov 2026 15:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CDE660A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=m/wg8U5q
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79B6F1C01;
	Thu, 19 Nov 2026 07:38:24 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5DD63F959;
	Thu, 19 Nov 2026 07:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102707; bh=f2/4pxU6Zv4W6hzYidigySZuTPh2CRn+kohxWnBUQX0=;
	h=From:To:Cc:Subject:Date:From;
	b=m/wg8U5qehFFg9IsdTQLnWTvAktIK9MiWrRpR9KSS005XqbeD+dZbD5MlwPCHOWEt
	 CtcJ2WXSK3BGS1MCK82opFteHIHkaz+H8je7Dds0ho858eoBT7gRQP4VkcKXqNV9qP
	 U26B4Olfty3COaYhVhy7EdMYxe77qrY0weO1a28I=
From: Charvi Mehta <charvi.mehta@arm.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Charvi Mehta <charvi.mehta@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
	Shobhit Pandey <shobhit.pandey@arm.com>
Subject: [RFC PATCH 00/28] media: add arm Mali-V76 video decoder driver
Date: Thu, 19 Nov 2026 15:37:30 +0000
Message-ID: <20261119153758.1426673-1-charvi.mehta@arm.com>
X-Mailer: git-send-email 2.43.0
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

This series introduces support for the Arm Mali-V76 Video Processing Unit
(VPU), providing H.264 video stream decoding through the V4L2 stateful
memory-to-memory interface.

The Mali-V76 offloads video decoding from the application processor. The
host driver loads and manages the codec firmware, communicating with it
through asynchronous message queues, interrupts and RPC requests. It also
manages the firmware address space using the V76 internal MMU and controls
hardware resources through the LSID and job-queue interfaces.

The driver currently supports:

- H.264 decoding through the V4L2 stateful memory-to-memory interface.
- Multi-planar capture using V4L2_PIX_FMT_YUV420M, V4L2_PIX_FMT_NV12M
  and V4L2_PIX_FMT_NV21M, with MMAP and DMA-BUF buffer support.
- Variant-specific definitions of supported formats, frame sizes,
  controls and hardware resources.
- Explicit management of decoder and firmware states throughout
  stream setup, decoding and teardown.
- Asynchronous firmware loading and caching, with interrupt-driven
  communication for commands, buffer completion and firmware events.
- Separate control of OUTPUT and CAPTURE streaming, allowing CAPTURE
  buffers to be reconfigured during dynamic resolution changes.
- Decoder drain, end-of-stream and dynamic resolution change handling,
  including source-change events and LAST buffer signalling.
- Timestamp propagation and buffer metadata handling.
- Firmware error and unsupported-stream reporting.

The initial implementation supports a single active decoding session, with
hardware resource management handled through the V76 LSID and job-queue
interfaces. Support for additional codecs and concurrent sessions is
outside the scope of this series.

The series is based on media-committers/next.

To simplify the testing a tree with the new patches on top has been made
available at [1].

[1] https://gitlab.arm.com/media/vpu/charvi/linux.git mali/v76/v1

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Signed-off-by: Rathinavel Sankaralingam <rath.sankaralingam@arm.com>
Signed-off-by: Shobhit Pandey <shobhit.pandey@arm.com>

Testing
=======
The driver has been tested on Mali-V76 pre-silicon FPGA.

Static tools like checkpatch, smatch, dt_binding_check, sparse, checkstack
and Coccinelle run successfully with this driver.

The driver has been tested with v4l2-ctl[2] and Gstreamer[3],
v4l2-compliance [4] and Fluster [5].

[2] v4l2-ctl -d /dev/video0 --verbose \
--set-fmt-video-out=width=1920,height=1080,pixelformat=H264 \
--set-fmt-video=width=1920,height=1080,pixelformat=NM12 \
--stream-mmap=4 --stream-out-mmap=1 \
--stream-from /media/CrowdRun_1080p.264 --stream-to decoded.yuv

[3] gst-launch-1.0 -v filesrc location=/media/CrowdRun_720p.264 ! h264parse \
! v4l2h264dec ! filesink location=decoded.yuv sync=false

[4] V4l2 compliance was tested using v4l2-compliance 1.28.1:

v4l2-compliance -d /dev/video0 --stream-from /media/CrowdRun_1080p.264 -s 200

v4l2-compliance 1.28.1, 64 bits, 64-bit time_t

Compliance test for mali-vpu device /dev/video0:

Driver Info:
	Driver name      : mali-vpu
	Card type        : mali-vpu-decoder
	Bus info         : platform:6f030000.video-codec
	Driver version   : 7.4.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected Stateful Decoder

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
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
	Standard Controls: 2 Private Controls: 6

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK
	Video Capture Multiplanar: Captured 632 buffers
	test MMAP (select): OK
	Video Capture Multiplanar: Captured 632 buffers
	test MMAP (epoll): OK
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for mali-vpu device /dev/video0: 52, Succeeded: 52, Failed: 0, Warnings: 0

[5] Fluster was run with

GStreamer-H.264-V4L2 decoder:

Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2
Ran 78/135 tests successfully.

The failing tests:

52 test vectors fail as they are interlaced clips which mali-vpu does not
support.

List of these test vectors:
- cabac_mot_fld0_full
- cabac_mot_mbaff0_full
- cabac_mot_picaff0_full
- CABREF3_Sand_D
- CAFI1_SVA_C
- CAMA1_Sony_C
- CAMA1_TOSHIBA_B
- cama1_vtc_c
- cama2_vtc_b
- CAMA3_Sand_E
- cama3_vtc_b
- CAMACI3_Sony_C
- CAMANL1_TOSHIBA_B
- CAMANL2_TOSHIBA_B
- CAMANL3_Sand_E
- CAMASL3_Sony_B
- CAMP_MOT_MBAFF_L30
- CAMP_MOT_MBAFF_L31
- CANLMA2_Sony_C
- CANLMA3_Sony_C
- CAPA1_TOSHIBA_B
- CAPAMA3_Sand_F
- cavlc_mot_fld0_full_B
- cavlc_mot_mbaff0_full_B
- cavlc_mot_picaff0_full_B
- CVCANLMA2_Sony_C
- CVFI1_Sony_D
- CVFI1_SVA_C
- CVFI2_Sony_H
- CVFI2_SVA_C
- CVMA1_Sony_D
- CVMA1_TOSHIBA_B
- CVMANL1_TOSHIBA_B
- CVMANL2_TOSHIBA_B
- CVMAPAQP3_Sony_E
- CVMAQP2_Sony_G
- CVMAQP3_Sony_D
- CVMP_MOT_FLD_L30_B
- CVMP_MOT_FRM_L31_B
- CVNLFI1_Sony_C
- CVNLFI2_Sony_H
- CVPA1_TOSHIBA_B
- FI1_Sony_E
- MR6_BT_B
- MR7_BT_B
- MR8_BT_B
- MR9_BT_B
- Sharp_MP_Field_1_B
- Sharp_MP_Field_2_B
- Sharp_MP_Field_3_B
- Sharp_MP_PAFF_1r2
- Sharp_MP_PAFF_2r
2 test vectors failed because FMO is unsupported.
Test vectors: FM1_BT_B FM1_FT_E
2 test vectors failed because SP_SLICE type is unsupported.
Test vectors: SP1_BT_A sp2_bt_b
1 additional test vector, CVFC1_Sony_C completes decoding but fails checksum
verification due to a stride-handling issue in GStreamer 1.24.13. GStreamer
replaces the driver-reported 150-byte planar chroma stride with 152 bytes,
causing the decoded chroma planes to be read incorrectly.

Running test suite JVT-FR-EXT with decoder GStreamer-H.264-V4L2
Ran 25/69 tests successfully.

The failing tests:

21 test vectors failed due to interlaced clips. Interlaced decoding is not
supported in mali-vpu driver.

Test Vectors:
- brcm_freh10
- brcm_freh11
- brcm_freh4
- brcm_freh5
- brcm_freh6
- freh7_b
- FREXT01_JVC_D
- FREXT02_JVC_C
- FRExt2_Panasonic_C
- FRExt4_Panasonic_B
- HCAFF1_HHI_B
- HCAMFF1_HHI_B
- HCHP3_HHI_A
- HPCAFL_BRCM_C
- HPCAFLNL_BRCM_C
- HPCAMAPALQ_BRCM_B
- HPCVFL_BRCM_A HPCVFLNL_BRCM_A
- HVLCFI0_Sony_B
- HVLCMFF0_Sony_B
- HVLCPFF0_Sony_B

2 test vectors fail due to 10bit bitstream. 10 bit decoding support to be
enabled in subequent patches.
Test vectors: FREH10-1 FREH10-2

21 test vectors failed because 4:2:2 is not supported in this driver.
Test vectors:
- FREXT1_TANDBERG_A
- FREXT2_TANDBERG_A
- FREXT3_TANDBERG_A
- Hi422FR10_SONY_A
- Hi422FR11_SONY_A
- Hi422FR12_SONY_A
- Hi422FR1_SONY_A
- Hi422FR2_SONY_A
- Hi422FR3_SONY_A
- Hi422FR4_SONY_A
- Hi422FR13_SONY_A
- Hi422FR14_SONY_A
- Hi422FR15_SONY_A
- Hi422FR6_SONY_A
- Hi422FR7_SONY_A
- Hi422FR8_SONY_A
- Hi422FR9_SONY_A
- Hi422FREXT16_SONY_A
- Hi422FREXT17_SONY_A
- Hi422FREXT18_SONY_A
- Hi422FREXT19_SONY_A

Charvi Mehta (21):
  dt-bindings: media: add Arm Mali-V76 VPU
  media: mali-vpu: add Mali VPU platform driver
  media: mali-vpu: register V4L2 decoder device and add querycap ioctl
  media: mali-vpu: initialize decoder format state
  media: mali-vpu: add V4L2 mem2mem and VB2 queue support
  media: mali-vpu: implement format query ioctls
  media: mali-vpu: implement TRY_FMT and S_FMT ioctls
  media: mali-vpu: register V76 decoder controls and introduce UAPI
    controls
  media: mali-vpu: add firmware cache infrastructure
  media: mali-vpu: load firmware for decoder sessions
  media: mali-vpu: prepare firmware address space
  media: mali-vpu: add firmware message transport
  media: mali-vpu: route decoder controls to firmware
  media: mali-vpu: handle firmware RPC requests
  media: mali-vpu: add LSID hardware support
  media: mali-vpu: add single session scheduler
  media: mali-vpu: handle firmware interrupts
  media: mali-vpu: start decoder firmware through LSID scheduling
  media: mali-vpu: propagate buffer metadata
  media: mali-vpu: handle firmware event responses
  media: MAINTAINERS: add Arm Mali-V76 VPU driver

Rath Sankaralingam (4):
  media: mali-vpu: add MMU software page table manager
  media: mali-vpu: implement vb2 buffer queue handling
  media: mali-vpu: handle firmware buffer exchange
  media: mali-vpu: handle fatal firmware error

Shobhit Pandey (3):
  media: mali-vpu: add decoder EOS and DRC handling
  media: mali-vpu: handle firmware buffer parameters
  media: mali-vpu: add stateful decoder state machine

 .../bindings/media/arm,mali-v76.yaml          |   70 +
 MAINTAINERS                                   |   11 +
 drivers/media/platform/arm/Kconfig            |    1 +
 drivers/media/platform/arm/Makefile           |    1 +
 drivers/media/platform/arm/mali-vpu/Kconfig   |   17 +
 drivers/media/platform/arm/mali-vpu/Makefile  |   18 +
 .../platform/arm/mali-vpu/mali-vpu-buffer.c   |  426 +++++
 .../platform/arm/mali-vpu/mali-vpu-buffer.h   |  109 ++
 .../platform/arm/mali-vpu/mali-vpu-controls.c |  351 ++++
 .../platform/arm/mali-vpu/mali-vpu-controls.h |   71 +
 .../platform/arm/mali-vpu/mali-vpu-dec.c      |  226 +++
 .../platform/arm/mali-vpu/mali-vpu-dec.h      |   27 +
 .../platform/arm/mali-vpu/mali-vpu-device.h   |   72 +
 .../arm/mali-vpu/mali-vpu-firmware-cache.c    |  549 ++++++
 .../arm/mali-vpu/mali-vpu-firmware-cache.h    |  180 ++
 .../platform/arm/mali-vpu/mali-vpu-firmware.c | 1647 +++++++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-firmware.h |  324 ++++
 .../platform/arm/mali-vpu/mali-vpu-formats.c  |   95 +
 .../platform/arm/mali-vpu/mali-vpu-formats.h  |   39 +
 .../platform/arm/mali-vpu/mali-vpu-lsid.c     |  271 +++
 .../platform/arm/mali-vpu/mali-vpu-lsid.h     |   58 +
 .../platform/arm/mali-vpu/mali-vpu-mmu.c      |  699 +++++++
 .../platform/arm/mali-vpu/mali-vpu-mmu.h      |  154 ++
 .../platform/arm/mali-vpu/mali-vpu-probe.c    |  387 ++++
 .../arm/mali-vpu/mali-vpu-protocol-def-v3.h   |  710 +++++++
 .../arm/mali-vpu/mali-vpu-registers.h         |   81 +
 .../arm/mali-vpu/mali-vpu-scheduler.c         |  248 +++
 .../arm/mali-vpu/mali-vpu-scheduler.h         |   58 +
 .../platform/arm/mali-vpu/mali-vpu-session.c  | 1260 +++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-session.h  |  174 ++
 .../platform/arm/mali-vpu/mali-vpu-state.h    |  136 ++
 .../arm/mali-vpu/mali-vpu-variant-v76.c       |  188 ++
 .../platform/arm/mali-vpu/mali-vpu-variant.h  |   74 +
 .../platform/arm/mali-vpu/mali-vpu-vb2.c      |  187 ++
 .../platform/arm/mali-vpu/mali-vpu-vb2.h      |   13 +
 .../platform/arm/mali-vpu/mali-vpu-vidioc.c   |  365 ++++
 .../platform/arm/mali-vpu/mali-vpu-vidioc.h   |   17 +
 .../uapi/linux/media/arm/mali-vpu-config.h    |   47 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 39 files changed, 9367 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/arm,mali-v76.yaml
 create mode 100644 drivers/media/platform/arm/mali-vpu/Kconfig
 create mode 100644 drivers/media/platform/arm/mali-vpu/Makefile
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-controls.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-controls.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-formats.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-lsid.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-lsid.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-scheduler.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-scheduler.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-state.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.h
 create mode 100644 include/uapi/linux/media/arm/mali-vpu-config.h

-- 
2.43.0

