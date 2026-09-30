Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4384E0B70
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 15:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783329; cv=none; b=eN+xBkIQ3Wj/ecBg/vGDkZci2xsjAskEkNnqNcTddpeJpUXELaBtffaNPsue2Rtn5Doua0Q3a4iJCpA8dk4p01y+4VJsbjOw1mZGggHFgJiTym83OgB4+FtMSgnuRy2f0WIpjpgG7P+IkLrYDniffAL3Neke57wiJzTurIoFO4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783329; c=relaxed/simple;
	bh=dzcZghBPmnTB1zssneiqrhDsxLxLllhQZh0w3KCwek8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pv5D9Nen/nEa3ZPM2Y0cgsMKT7ZzEtQhopXpPaFtFWjdglFytDBLk2T0ITKWPm6bStqoWJxz11IA0r5AJcZeR6jIAjEIU3WOhhRUhPpcvRuI5v4rTf5dUywKg+n4mVGz/LDPzQyxB8ItjtwmSE7VUqkXEhcGEOeZUC2PhjYmTOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=2D6RsmZE; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="2D6RsmZE"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a498cb99b3so1168895a91.0
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 08:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790783322; x=1791388122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8rVfIZm1UEZzV/AFm0LxYX2Nm7h6LK4rTf9eW5RPJY=;
        b=2D6RsmZERBT3NHGFl2R11RaJoCWmWQE2N8ajJeOvujwexRJqS0N/Q3P1sFJ1wVaSyh
         D5lz/2DVLt+3fSorfe1xNp67KojhQW0P7EyCBuS9KoPptVFCHG7Bh77fSA5BVyCxhN1D
         9uEj1FpQpta8ru48ekQtFYVgCe8GrDka1YwiaETKqzctd/hMYGngP6GK4CNtbYr0ZyFR
         QEBuW4Ccm4SjPUBX3BCBLlozmC6xgifFhihYYeU7+0BSXUi3OZ/tiHGNq71h2V9O/Hm+
         cZQsJDcnDSkydfpguFUYdQC6w82o3dJyQF9oQoAdDSy5ndLACwjZDZ7A+aMbXnBpn44x
         CudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783322; x=1791388122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8rVfIZm1UEZzV/AFm0LxYX2Nm7h6LK4rTf9eW5RPJY=;
        b=22H9gAQC3EdS8YcgWa/VUaaErBCNDSzDcgCUGPUwxe/w3T+e7MPPSInZYb6tQq2/VM
         LtrQGw+eGXGYdD4GRdxwIX2Il48bGaKOA7l91blkIcGO1RGbHCb8/czVMY2pPNE9Pk4M
         ocBXZUTGRsZhP5yqE2AOwEQZV2/2kiMGNX8PqvfN0ows4vLR1wEXFUQHPGK4V6NEQcEn
         dzAaGXgU4qGKQ8k/Hc9vOI0HcvnLSa399FCrkn/pjd7JeMQjFYdAZBjHkN0Vga7IKkmH
         PZpLWHwDbXaSrOut+0cIOAHjsUv2Hz5oVqfwYQYqeEostqwx9j9Uw6ynkTg2RV8rLXIV
         x/wg==
X-Forwarded-Encrypted: i=1; AKwUvBw7rFXy0U0F8Q7X9vGOJ02nrOYcmFnLURj1k3xSt7JxF/hkKHSmXtNY0j+9/3J8Xn3ozUFIA+rYV5P/Kw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK+5N2b+sc1pOf7ff2bBDwpnWmINK03gBwMduIgT8uYjPx8EL6z
	RU71ILZHOKkuPqD1bjsh2bxehYwsm7Qvjn/R81Fy+weQNezMhLKTP8II9Rvj4U6PPqHb
X-Gm-Gg: AYBFou1LzTbG895RR9ZAF/IaEwMFJzUGgYKFoiDil2hw49L9ppwEZVavgWB2bz8KtxD
	isBwmUko9RfuFjXRsP8t3jDI26S5Ep1D8si2TyCNJk+J3F5wrQ0V5PB3J7ebFhBDYy6xjbmCyGn
	STCDgHK2P2LDmX5et4aCzhSQYZWzJGQomTM593P6v0G3OvsX1C+nMmUjUQT2YjXWnixhtBDRdF+
	/IuNBr5VXuqldzE9qBAtAjy0mAlq89i4Nw2qZlTUsQ8BlDZaSQBknNMiVnJd1yg7EnrLj7Jw/2n
	xGKp2FzPR1BWrr30AB/Xnvlc4PxTsxtRlGmcL+31wh8jZUf2Dn9n0PCpa9QPtVz4j0sqAZy7njf
	j1WEUaMCpN0dbwoBS6fUQdvWFMsY6aUcy6eNUftBATs2baOfaP08vVMPrzRmqCrR3rKsHqjdziJ
	0Qz6PkAdLnOP0+GrE9Web+q/TtlDOSb3YcMzDI8oU2r2UEyVhgoQQX/MPYQgRUBj6GNBR7/ZvyQ
	jPiucmF
X-Received: by 2002:a17:90b:4b11:b0:3a0:c85a:e602 with SMTP id 98e67ed59e1d1-3a4d14eee80mr1153811a91.9.1790783322165;
        Wed, 30 Sep 2026 08:48:42 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ee4d0af2sm308136a91.2.2026.09.30.08.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:48:41 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] media: sunxi: Add the Allwinner D1/T113 camera interface
Date: Wed, 30 Sep 2026 22:48:32 +0700
Message-Id: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a driver for the camera interface of the Allwinner D1,
D1s and T113, which the manual calls the CSIC. It is not the A31 CSI
that sun6i-csi drives: the parser and the DMA engines are separate
blocks with their own registers, so it gets a new driver.

1. The DT binding.
2. The driver: the parallel input and the first DMA engine, as a bridge
   subdev and a capture video device (media controller API).
3. The CSIC node in the dtsi shared by the D1, D1s and T113.

I tested it on a MangoPi MQ-Dual (T113-S3) with an OV5640. With this
series on top of media next, v4l2-compliance passes for the media
device, the bridge and the video node (streaming output below; the two
failures on the sensor's subdev are the OV5640 driver's frame size and
interval enumeration). With the sensor's colour bars, every converted
YUV format matches the raw capture byte for byte, and 640x480 and
1920x1080 run at 30 fps.

On the board's 6.18 kernel with the driver backported (only the new
set_fmt argument differs), 160x120, 176x144, 320x240, 640x480, 720x480,
720x576, 1280x720 and 1920x1080 all run at 30 fps.

The OV5640's 1024x768 and 2592x1944 modes give no valid frames on this
board, and I haven't found out why yet.

I couldn't make the FIFO overflow, not even at 1920x1080 with both CPUs
and the 2D engine keeping the DRAM busy, so the overflow path (the
buffer is returned with an error and capture goes on) has never run.
sun6i-csi restarts the block on an overflow instead; I left that out,
as I can't test it.

Not tested: a D1 board (build and dtbs_check only), BT.656 (not
supported yet), other sensors, the second DMA engine, the IOMMU and
system suspend while streaming.

The series is based on the media tree's next branch.

v4l2-compliance from v4l-utils git, on media next, with vivid as the
DMABUF exporter (v4l2-compliance -d /dev/video4 -s -e /dev/video0):

v4l2-compliance 1.33.0-5506, 32 bits, 64-bit time_t
v4l2-compliance SHA: 91dda32e4cc9 2026-09-28 07:58:16

Compliance test for sun20i-csi device /dev/video4:

Driver Info:
	Driver name      : sun20i-csi
	Card type        : Allwinner D1 CSIC
	Bus info         : platform:5800000.csi
	Driver version   : 7.3.0
	Capabilities     : 0xa4200001
		Video Capture
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24200001
		Video Capture
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : sun20i-csi
	Model            : Allwinner D1 CSIC
	Serial           :
	Bus info         : platform:5800000.csi
	Media version    : 7.3.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.3.0
Interface Info:
	ID               : 0x03000006
	Type             : V4L Video
Entity Info:
	ID               : 0x00000004 (4)
	Name             : sun20i-csi-capture
	Function         : V4L2 I/O
	Pad 0x01000005   : 0: Sink, Must Connect
	  Link 0x02000008: from remote pad 0x1000003 of entity 'sun20i-csi-bridge' (Video Interface Bridge): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video4 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

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

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test TIME32/64: OK
	test blocking wait: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test MMAP (no poll, REQBUFS): OK
	test MMAP (select, REQBUFS): OK
	test MMAP (epoll, REQBUFS): OK
	test MMAP (no poll, CREATE_BUFS): OK
	test MMAP (select, CREATE_BUFS): OK
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF (no poll): OK
	test DMABUF (select): OK

Total for sun20i-csi device /dev/video4: 61, Succeeded: 61, Failed: 0, Warnings: 0

Nguyen Minh Tien (3):
  dt-bindings: media: Add Allwinner D1 CSIC
  media: sunxi: Add support for the D1 CSIC
  riscv: dts: allwinner: d1s-t113: Add the CSIC node

 .../media/allwinner,sun20i-d1-csi.yaml        |  111 ++
 MAINTAINERS                                   |    8 +
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |   31 +
 drivers/media/platform/sunxi/Kconfig          |    1 +
 drivers/media/platform/sunxi/Makefile         |    1 +
 .../media/platform/sunxi/sun20i-csi/Kconfig   |   17 +
 .../media/platform/sunxi/sun20i-csi/Makefile  |    4 +
 .../platform/sunxi/sun20i-csi/sun20i_csi.c    | 1357 +++++++++++++++++
 8 files changed, 1530 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml
 create mode 100644 drivers/media/platform/sunxi/sun20i-csi/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun20i-csi/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun20i-csi/sun20i_csi.c


base-commit: 5f21cd9a4ae4a891b273178b40e0e9eb5b9ac650
-- 
2.34.1

