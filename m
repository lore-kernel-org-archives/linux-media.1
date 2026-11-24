Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540084;
	b=VC4hOjYTQ2jmIHBygXYAjOLBn2iI83ED+ccHbDfX8puFrejTRki3ZMsJGEaJUTknyjUF
	 RGqN9Z0aMqI8b17/mSV0EMPjqTwcKUEFKpwJH5gR0ffwAhtphi8N6DwoSmDAm/xiwUFMn
	 Pud65E/qiS5y82sh2hF8xlJCOk5GP+vMbAxppfIzb927/9qiDFNmsEsJ6atwjPdSEowGU
	 Uc1pFknC6jiOxs5bpMbGYYs45myXQTbRLqXY/9bchx6AXetKyVvULm5rpE3YLRxZxft21
	 otNb5XYctc5RUqZbEMCQAtlVBSSUikvRQEru5Hn0LBlVXptKz0WvtHfXlVL8OpEicnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540084;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ac4HQgRrh030Q7KsFFIZ7pcRQeZ9l3kHRvjl2f4/5WU=;
	b=cG5AvPrwpwhmzC01qMIec8OECERr86+Fwa0L+UfCKPy2YvST9gO6THTVOtYWNJpNqZcs
	 OVXuaZr/Rx1tjcoZr0XMsG9QTdBcfa7LNnSXMnPcf6LVq7Zuw07x4N9FSq42CBAg71cDJ
	 LC4Mz9UJzD0PNs/Rc4qA02h1fiV+lRWlf1nbja8CU1ka/6JyXgGqDxBmQTIlynqQKDH1E
	 kJSzXFH3PqBgdo8vfEXB1cBEY0PAub2oDC+aprfuRJ13LB4mlWDQ5NVGCVFpeC9Jmfron
	 LjPQhwn/GWlWUCzv4apZkV9hRhQ1LJV6AJQ076kK7Vr0w91qZq0VNXm1NyQCZENfyEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=iwyVu0H0;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98054606A31E;
	Tue, 24 Nov 2026 17:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98054606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=iwyVu0H0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A454A497;
	Tue, 24 Nov 2026 09:07:59 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 601F93F763;
	Tue, 24 Nov 2026 09:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540082; bh=JYHWC9vW7QhzNeim9s022o1djp5tzvYf6V+7U5+LH7Q=;
	h=From:Subject:Date:To:Cc:From;
	b=iwyVu0H0d/FWuCUJc/wVHAadzQrVfY2UwcGEQgHdDo80Mu8ZgoYo4WDdKyUDWKSYl
	 VClBj1LwfcxyTo2dS0MEguFEyxvPFL2tHzJgE1WZ+DJYUTzVarD38gL0fGxVakqlrU
	 W65xGnaqU9szfd9SQjBJfo7fF7rkRPsQRdqfDIq8=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Subject: [PATCH 00/24] Add Arm Mali-C720 Image Signal Processor Driver
Date: Tue, 24 Nov 2026 17:07:28 +0000
Message-Id: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFDEBWsC/x3M0QrCMAyF4VcZuTZoOhnoq4gXaZu5gKsjrSKMv
 btxNwc+OPwrVDGVCtduBZOPVn0VBx06SBOXh6BmN4RTGIiox3hGLdqUn/heajPhGROXrJmb4Ji
 ELoGG3u/gjcVk1O/ev93dkatgNC5p+ldnycrHfWHbfubVDlWNAAAA
X-Change-ID: 20261113-b4-initial-upstream-candidate-fce192163026
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anthony McGivern <anthony.mcgivern@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <konstantin.babin@arm.com>, 
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com, 
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Anthony McGivern <Anthony.McGivern@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540078; l=58244;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=JYHWC9vW7QhzNeim9s022o1djp5tzvYf6V+7U5+LH7Q=;
 b=saMFNkUW54vIJFABjZRLGnmW1YDyPYwar3Iza0lYfqekOe5vaPGqtKkWVg69IdajqXD0ukoTa
 x7PIbzQvhQeD89oOqJjb0I0GshrNQTC6eAI8nYSG2dIT0zUYzwrSKPH
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

This patchset introduces a driver for Arm's Mali-C720 Image Signal Processor.
The driver uses the V4L2 / media controller API and implements the following
ISP features:

- Input and human vision pipelines:
	The ISP has numerous processing pipelines. We implement support for
	the input pipeline as well as the human vision processing pipeline.

- Full resolution capture pipeline:
	This capture pipeline supports both cropping and downscaling, as well
	as simultaneously outputting RGB and YUV data.

- Basic statistics and parameters blocks:
	We have implemented a small set of the ISP statistics, covering
	pixel intensity histograms across both the input and human vision
	pipelines, as well as color statistics. We also include a small set
	of parameter blocks for digital gain, white balance, black level, square
	and square root transforms, and lastly decompanding.

- Basic output format support:
	Currently we provide support for RGB24 and NV12 output formats.

The ISP supports much more functionality than this which we wish to include
in future patch series, some of which is possible in the existing framework
while others will require further development.

Alongside this we also have a series to enable support in libcamera. Both
branches can be found on our GitLab [1]. We also have branches present for
features currently in development that are not included in this series [2].

The features we would like to implement in the future include:

- Multi-context:
	The ISP supports up to 16 contexts, plus 4 additional contexts reserved
	for functional safety. This series only adds support for a single
	context, though infrastructure is in place to configure the ISP's
	context manager unit. Please see our GitLab where we have implemented
	a temporary solution for enabling multi-context by duplicating the
	media device [3].

- Additional capture pipelines:
	The ISP has a number of capture pipelines that can be used in parallel.
	This can include up to four "full resolution" capture pipelines, a raw
	pipeline for Bayer data, a "foveated" pipeline for three separate ROIs
	of the same image, and lastly a Gaussian pyramid pipeline. The latter
	introduces a challenge with representing the image format since the
	output data is four levels, each being a quarter the resolution (half
	the width and height) of the previous level.

- Dual image processing pipelines:
	In addition to the human vision processing pipeline, the ISP has a
	separate processing pipeline that targets computer vision applications.
	This allows the same input frame to be processed for both human and
	computer vision applications in parallel, and be output simultaneously
	through separate capture pipelines.

- Multiple input ports:
	The ISP input frontend supports up to four physical inputs and each
	of these can carry up to four virtual channels, for a total of 16
	inputs. This series only enables support for input 0/stream 0 until
	userspace routing ioctls are enabled to configure a route from the
	desired input/stream to the input source pad. You may refer to our
	multi-context implementation where we must split this frontend to
	provide each context its own input, which limits our flexibility.

- Additional format support:
	This initial candidate supports a basic set of output formats, with
	further support planned in a future series.

- Processing modes:
	The ISP can operate in various modes: Streaming, TDMF fix, TDMF flex,
	and memory-to-memory (M2M). This series uses TDMF flex mode with a
	single context. Support for the other modes is planned for future
	series.
	- TDMF fix/flex: Frames are written from the input frontend to DMA
			 buffers. When a buffer is written, that context is
			 marked as schedulable. For flex mode, contexts are
			 then scheduled on a first-come, first-served basis.
			 For fix mode, the processing order is strict and
			 preconfigured.
	- Streaming: Used for low-latency operation with a single camera.
		     Frames are fed directly from the input to the pipeline.
		     The DMA buffer is only used if internal FIFOs overflow.
	- M2M: Allows frame buffers to be provided directly, bypassing the
	       input frontend.
	The mode of operation is configurable per-context, meaning it is
	possible to have one context running in TDMF flex, while another is
	using M2M mode.

- Multiple exposure:
	The ISP can support up to two exposures, using a pipeline frame
	stitching module. This also requires input routing support, as well
	as the ability for sensor subdevices to output multiple streams.

- RGB-IR support:
	Our ISP can receive a 4x4 RGBIr CFA pattern and internally split this
	into separate RGB and monochrome images which may be independently
	processed in the pipeline. Support would require describing the RGB-IR
	CFA pattern, potentially using the generic raw formats and CFA controls
	proposed in Sakari's metadata series [4].

- Streaming outputs:
	Alongside the traditional memory outputs, some capture pipelines have
	outputs that physically connect to a downstream device. This may
	already be possible with a downstream video capture device and V4L2
	async notifier callbacks, but there may also be cases where the ISP is
	connected to a downstream subdevice that consumes the data directly and
	thus requires no capture device or any allocated buffers. In such a
	case, this subdevice should be able to start the media pipeline without
	a video device that traditionally exposes STREAMON/STREAMOFF ioctls.

Our ISP is also configurable at synthesis time. This means that certain ISP
features may only be present depending on the customer's implementation. Our
driver tackles this by parsing the ISP's "capability discovery" table, which
provides details about available pipelines and the presence of particular
modules within a given pipeline. Some details are not fully exposed by this
table, in which case we use hardware identification checks.

Details about the ISP can be found on Arm's support page [5].

The driver exposes 6 V4L2 subdevices:

- mali-c720 tpg X: 2 test pattern generator inputs
- mali-c720 input: Frontend for receiving sensor inputs
- mali-c720 isp: Represents the ISP input pipeline
- mali-c720 hv pipe: Vision pipeline for human vision processing
- mali-c720 fr 0 pipe: Full resolution pipeline with downscaling and cropping

Along with 4 V4L2 video devices:

- mali-c720 fr0-rgb/yuv: Separate RGB and YUV capture devices for the FR0 pipe
- mali-c720 3a stats: Capture device for statistics to support 3A algorithms
- mali-c720 3a params: Output device for parameter buffers to configure the ISP

Support is implemented in the parameters video device code for a few of the
ISP's hardware blocks, with more support planned in future patch series. The
buffer format uses the v4l2-isp extensible parameters.

Statistics support follows a similar pattern, in that we currently only
support the pixel intensity histogram present on the input and human vision
pipelines, as well as HV's color statistics. We make use of the v4l2-isp
extensible statistics here, allowing for additional blocks to be supported
in the future.

The driver exposes custom V4L2 controls to enumerate the supported statistics
and parameter block IDs. This aims to account for hardware being synthesised
with or without particular modules, as well as future revisions including new
modules or updated modules that require a different register set. Userspace
should query these to determine what algorithms it should enable based on what
statistics it will receive and what modules are programmable.

Below is the v4l2-compliance report for the driver. The failures reported
relate to width and height being set to 0 for MEDIA_BUS_FMT_METADATA_FIXED
in the ISP subdevice. This appears to be a tool limitation as seen in other
drivers.

[1] Upstream submission branches:
  - https://gitlab.arm.com/media/isp/linux/-/tree/mali-c720/r0p1/v7.4-rc4/mainline-v1
  - https://gitlab.arm.com/media/isp/libcamera/-/tree/mali-c720/r0p1/v7.4-rc4/mainline-v1
[2] Development branches:
  - https://gitlab.arm.com/media/isp/linux/-/tree/mali-c720/r0p1/v6.18/dev-v1
  - https://gitlab.arm.com/media/isp/libcamera/-/tree/mali-c720/r0p1/v6.18/dev-v1
[3] Multi-context temporary implementation:
  - https://gitlab.arm.com/media/isp/linux/-/tree/mali-c720/r0p1/v6.18/dev-v2-multicontext
  - https://gitlab.arm.com/media/isp/libcamera/-/tree/mali-c720/r0p1/v6.18/dev-v2-multicontext
[4] Sakari's metadata series - https://lore.kernel.org/linux-media/20261118132819.213473-1-sakari.ailus@linux.intel.com/T/
[5] Arm support page - https://support.arm.com/compute-ip/mali-c720ae

v4l2-compliance 1.33.0-5455, 64 bits, 64-bit time_t
v4l2-compliance SHA: 95ad25f6a77a 2026-03-17 13:08:36

Compliance test for mali-c720 device /dev/media0:

Media Driver Info:
	Driver name      : mali-c720
	Model            : ARM Mali-C720 ISP
	Serial           :
	Bus info         : platform:60400000.isp
	Media version    : 7.4.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.4.0

Required ioctls:
	test MEDIA_IOC_DEVICE_INFO: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/media0 open: OK
	test MEDIA_IOC_DEVICE_INFO: OK
	test for unlimited opens: OK

Media Controller ioctls:
	test MEDIA_IOC_G_TOPOLOGY: OK
	Entities: 12 Interfaces: 12 Pads: 20 Links: 23
	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
	test MEDIA_IOC_SETUP_LINK: OK

Total for mali-c720 device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c720 device /dev/video0:

Driver Info:
	Driver name      : mali-c720
	Card type        : ARM Mali-C720 ISP
	Bus info         : platform:60400000.isp
	Driver version   : 7.4.0
	Capabilities     : 0xa4201000
		Video Capture Multiplanar
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24201000
		Video Capture Multiplanar
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mali-c720
	Model            : ARM Mali-C720 ISP
	Serial           :
	Bus info         : platform:60400000.isp
	Media version    : 7.4.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.4.0
Interface Info:
	ID               : 0x03000016
	Type             : V4L Video
Entity Info:
	ID               : 0x00000014 (20)
	Name             : mali-c720 fr0-rgb
	Function         : V4L2 I/O
	Pad 0x01000015   : 0: Sink, Must Connect
          Link 0x0200002e: from remote pad 0x1000012 of entity 'mali-c720 fr 0
              pipe' (Image Signal Processor): Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
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
	test Requests: OK

Total for mali-c720 device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings:
    0
--------------------------------------------------------------------------------
Compliance test for mali-c720 device /dev/video1:

Driver Info:
	Driver name      : mali-c720
	Card type        : ARM Mali-C720 ISP
	Bus info         : platform:60400000.isp
	Driver version   : 7.4.0
	Capabilities     : 0xa4201000
		Video Capture Multiplanar
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24201000
		Video Capture Multiplanar
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mali-c720
	Model            : ARM Mali-C720 ISP
	Serial           :
	Bus info         : platform:60400000.isp
	Media version    : 7.4.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.4.0
Interface Info:
	ID               : 0x0300001a
	Type             : V4L Video
Entity Info:
	ID               : 0x00000018 (24)
	Name             : mali-c720 fr0-yuv
	Function         : V4L2 I/O
	Pad 0x01000019   : 0: Sink, Must Connect
          Link 0x02000030: from remote pad 0x1000013 of entity 'mali-c720 fr 0
              pipe' (Image Signal Processor): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video1 open: OK
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
	test Requests: OK

Total for mali-c720 device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings:
    0
--------------------------------------------------------------------------------
Compliance test for mali-c720 device /dev/video2:

Driver Info:
	Driver name      : mali-c720
	Card type        : ARM Mali-C720 ISP
	Bus info         : platform:60400000.isp
	Driver version   : 7.4.0
	Capabilities     : 0xa4a00000
		Metadata Capture
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24a00000
		Metadata Capture
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mali-c720
	Model            : ARM Mali-C720 ISP
	Serial           :
	Bus info         : platform:60400000.isp
	Media version    : 7.4.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.4.0
Interface Info:
	ID               : 0x0300001e
	Type             : V4L Video
Entity Info:
	ID               : 0x0000001c (28)
	Name             : mali-c720 3a stats
	Function         : V4L2 I/O
	Pad 0x0100001d   : 0: Sink, Must Connect
          Link 0x02000032: from remote pad 0x100000b of entity 'mali-c720 isp'
              (Image Signal Processor): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video2 open: OK
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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0
	Standard Compound Controls: 0 Private Compound Controls: 1

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
	test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mali-c720 device /dev/video2: 48, Succeeded: 48, Failed: 0, Warnings:
    0
--------------------------------------------------------------------------------
Compliance test for mali-c720 device /dev/video3:

Driver Info:
	Driver name      : mali-c720
	Card type        : ARM Mali-C720 ISP
	Bus info         : platform:60400000.isp
	Driver version   : 7.4.0
	Capabilities     : 0xac200000
		Metadata Output
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x2c200000
		Metadata Output
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mali-c720
	Model            : ARM Mali-C720 ISP
	Serial           :
	Bus info         : platform:60400000.isp
	Media version    : 7.4.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.4.0
Interface Info:
	ID               : 0x03000022
	Type             : V4L Video
Entity Info:
	ID               : 0x00000020 (32)
	Name             : mali-c720 3a params
	Function         : V4L2 I/O
	Pad 0x01000021   : 0: Source, Must Connect
          Link 0x02000034: to remote pad 0x100000c of entity 'mali-c720 isp'
              (Image Signal Processor): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video3 open: OK
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
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 1 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Output 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0
	Standard Compound Controls: 0 Private Compound Controls: 1

Format ioctls (Output 0):
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

Codec ioctls (Output 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Output 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mali-c720 device /dev/video3: 48, Succeeded: 48, Failed: 0, Warnings:
    0
--------------------------------------------------------------------------------
Compliance test for mali-c720 device /dev/v4l-subdev0:

Driver Info:
	Driver version   : 7.4.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : mali-c720
	Model            : ARM Mali-C720 ISP
	Serial           :
	Bus info         : platform:60400000.isp
	Media version    : 7.4.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.4.0
Interface Info:
	ID               : 0x0300003f
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000001 (1)
	Name             : mali-c720 tpg 0
	Function         : Camera Sensor
	Pad 0x01000002   : 0: Source
          Link 0x02000024: to remote pad 0x1000007 of entity 'mali-c720 input'
              (Image Signal Processor): Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev0 open: OK
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
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 6 Private Controls: 0

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

Total for mali-c720 device /dev/v4l-subdev0: 54, Succeeded: 54, Failed: 0,
    Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c720 device /dev/v4l-subdev1:

Driver Info:
	Driver version   : 7.4.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : mali-c720
	Model            : ARM Mali-C720 ISP
	Serial           :
	Bus info         : platform:60400000.isp
	Media version    : 7.4.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.4.0
Interface Info:
	ID               : 0x03000041
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000003 (3)
	Name             : mali-c720 tpg 1
	Function         : Camera Sensor
	Pad 0x01000004   : 0: Source
          Link 0x02000026: to remote pad 0x1000007 of entity 'mali-c720 input'
              (Image Signal Processor): Data

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
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 6 Private Controls: 0

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

Total for mali-c720 device /dev/v4l-subdev1: 54, Succeeded: 54, Failed: 0,
    Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c720 device /dev/v4l-subdev2:

Driver Info:
	Driver version   : 7.4.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : mali-c720
	Model            : ARM Mali-C720 ISP
	Serial           :
	Bus info         : platform:60400000.isp
	Media version    : 7.4.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.4.0
Interface Info:
	ID               : 0x03000043
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000005 (5)
	Name             : mali-c720 input
	Function         : Image Signal Processor
	Pad 0x01000006   : 0: Source
          Link 0x02000028: to remote pad 0x1000009 of entity 'mali-c720 isp'
              (Image Signal Processor): Data, Enabled
	Pad 0x01000007   : 1: Sink, Must Connect
          Link 0x02000024: from remote pad 0x1000002 of entity 'mali-c720 tpg 0'
              (Camera Sensor): Data
          Link 0x02000026: from remote pad 0x1000004 of entity 'mali-c720 tpg 1'
              (Camera Sensor): Data
          Link 0x02000039: from remote pad 0x1000038 of entity 'lte-csi2-rx'
              (Video Interface Bridge): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
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

Sub-Device ioctls (Source Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 1):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

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

Total for mali-c720 device /dev/v4l-subdev2: 61, Succeeded: 61, Failed: 0,
    Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c720 device /dev/v4l-subdev3:

Driver Info:
	Driver version   : 7.4.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : mali-c720
	Model            : ARM Mali-C720 ISP
	Serial           :
	Bus info         : platform:60400000.isp
	Media version    : 7.4.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.4.0
Interface Info:
	ID               : 0x03000045
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000008 (8)
	Name             : mali-c720 isp
	Function         : Image Signal Processor
	Pad 0x01000009   : 0: Sink, Must Connect
          Link 0x02000028: from remote pad 0x1000006 of entity 'mali-c720 input'
              (Image Signal Processor): Data, Enabled
	Pad 0x0100000a   : 1: Source
          Link 0x0200002a: to remote pad 0x100000e of entity 'mali-c720 hv pipe'
              (Image Signal Processor): Data, Enabled
	Pad 0x0100000b   : 2: Source
          Link 0x02000032: to remote pad 0x100001d of entity 'mali-c720 3a
              stats' (V4L2 I/O): Data, Enabled
	Pad 0x0100000c   : 3: Sink
          Link 0x02000034: from remote pad 0x1000021 of entity 'mali-c720 3a
              params' (V4L2 I/O): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev3 open: OK
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

Sub-Device ioctls (Sink Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 1):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 2):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
                fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width >
                    65536
                fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node,
                    fmt.format)
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
                fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width >
                    65536
                fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node,
                    fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 3):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
                fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width >
                    65536
                fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node,
                    fmt.format)
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
                fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width >
                    65536
                fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node,
                    fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

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

Total for mali-c720 device /dev/v4l-subdev3: 75, Succeeded: 71, Failed: 4,
    Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c720 device /dev/v4l-subdev4:

Driver Info:
	Driver version   : 7.4.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : mali-c720
	Model            : ARM Mali-C720 ISP
	Serial           :
	Bus info         : platform:60400000.isp
	Media version    : 7.4.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.4.0
Interface Info:
	ID               : 0x03000047
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x0000000d (13)
	Name             : mali-c720 hv pipe
	Function         : Image Signal Processor
	Pad 0x0100000e   : 0: Sink, Must Connect
          Link 0x0200002a: from remote pad 0x100000a of entity 'mali-c720 isp'
              (Image Signal Processor): Data, Enabled
	Pad 0x0100000f   : 1: Source
          Link 0x0200002c: to remote pad 0x1000011 of entity 'mali-c720 fr 0
              pipe' (Image Signal Processor): Data, Enabled

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

Sub-Device ioctls (Sink Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 1):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

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

Total for mali-c720 device /dev/v4l-subdev4: 61, Succeeded: 61, Failed: 0,
    Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c720 device /dev/v4l-subdev5:

Driver Info:
	Driver version   : 7.4.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : mali-c720
	Model            : ARM Mali-C720 ISP
	Serial           :
	Bus info         : platform:60400000.isp
	Media version    : 7.4.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.4.0
Interface Info:
	ID               : 0x03000049
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000010 (16)
	Name             : mali-c720 fr 0 pipe
	Function         : Image Signal Processor
	Pad 0x01000011   : 0: Sink, Must Connect
          Link 0x0200002c: from remote pad 0x100000f of entity 'mali-c720 hv
              pipe' (Image Signal Processor): Data, Enabled
	Pad 0x01000012   : 1: Source
          Link 0x0200002e: to remote pad 0x1000015 of entity 'mali-c720 fr0-rgb'
              (V4L2 I/O): Data
	Pad 0x01000013   : 2: Source
          Link 0x02000030: to remote pad 0x1000019 of entity 'mali-c720 fr0-yuv'
              (V4L2 I/O): Data, Enabled

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

Sub-Device ioctls (Sink Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 1):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 2):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

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

Total for mali-c720 device /dev/v4l-subdev5: 68, Succeeded: 68, Failed: 0,
    Warnings: 0

Grand Total for mali-c720 device /dev/media0: 573, Succeeded: 569, Failed: 4,
    Warnings: 0

---
Anthony McGivern (24):
      media: uapi: Add 24-bit Bayer media bus formats
      dt-bindings: media: Add bindings for Arm Mali-C720
      media: uapi: Add a control ID base for Mali-C720 ISP
      media: mali-c720: Add register access helpers
      media: mali-c720: Add hardware identification
      media: mali-c720: Add format handling
      media: mali-c720: Add hardware discovery support
      media: mali-c720: Add context manager and interrupt handling
      media: mali-c720: Add input frontend subdevice
      media: mali-c720: Add ISP and human vision subdevices
      media: mali-c720: Add full-resolution output subdevice
      media: mali-c720: Add video capture nodes
      media: mali-c720: Add Mali-C720 ISP driver
      media: mali-c720: Add test pattern generator subdevices
      media: Documentation: Add Mali-C720 ISP documentation
      media: uapi: Add Mali-C720 statistics meta format
      media: uapi: Add statistics structs to mali-c720-config.h
      media: mali-c720: Add 3A statistics video node
      media: Documentation: Document Mali-C720 statistics capture
      media: uapi: Add Mali-C720 parameters meta format
      media: uapi: Add parameter structs to mali-c720-config.h
      media: mali-c720: Add parameters video node
      media: Documentation: Document Mali-C720 parameter settings
      MAINTAINERS: Add entry for mali-c720 driver

 .../admin-guide/media/mali-c720-graph.dot          |   26 +
 Documentation/admin-guide/media/mali-c720.rst      |  435 +++++
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../devicetree/bindings/media/arm,mali-c720.yaml   |  134 ++
 .../userspace-api/media/drivers/index.rst          |    1 +
 .../userspace-api/media/drivers/mali-c720.rst      |   47 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../media/v4l/metafmt-arm-mali-c720.rst            |  112 ++
 .../userspace-api/media/v4l/subdev-formats.rst     |  289 ++-
 MAINTAINERS                                        |   13 +
 drivers/media/platform/arm/Kconfig                 |    1 +
 drivers/media/platform/arm/Makefile                |    1 +
 drivers/media/platform/arm/mali-c720/Kconfig       |   18 +
 drivers/media/platform/arm/mali-c720/Makefile      |   23 +
 .../platform/arm/mali-c720/mali-c720-capture.c     |  775 ++++++++
 .../platform/arm/mali-c720/mali-c720-common.h      |  451 +++++
 .../media/platform/arm/mali-c720/mali-c720-core.c  |  985 ++++++++++
 .../platform/arm/mali-c720/mali-c720-ctx-mgr.c     | 1923 ++++++++++++++++++++
 .../platform/arm/mali-c720/mali-c720-ctx-mgr.h     |  327 ++++
 .../platform/arm/mali-c720/mali-c720-discovery.c   | 1172 ++++++++++++
 .../platform/arm/mali-c720/mali-c720-discovery.h   |  212 +++
 .../platform/arm/mali-c720/mali-c720-formats.c     |  452 +++++
 .../platform/arm/mali-c720/mali-c720-formats.h     |  132 ++
 .../platform/arm/mali-c720/mali-c720-fr-pipe.c     | 1178 ++++++++++++
 .../media/platform/arm/mali-c720/mali-c720-id.c    |  165 ++
 .../media/platform/arm/mali-c720/mali-c720-id.h    |   34 +
 .../media/platform/arm/mali-c720/mali-c720-input.c |  598 ++++++
 .../platform/arm/mali-c720/mali-c720-interrupts.c  |  436 +++++
 .../platform/arm/mali-c720/mali-c720-interrupts.h  |   34 +
 .../media/platform/arm/mali-c720/mali-c720-isp.c   |  456 +++++
 .../platform/arm/mali-c720/mali-c720-params.c      | 1450 +++++++++++++++
 .../arm/mali-c720/mali-c720-register-access.c      |  205 +++
 .../arm/mali-c720/mali-c720-register-access.h      |   55 +
 .../arm/mali-c720/mali-c720-registers-ctx-mgr.c    |  226 +++
 .../arm/mali-c720/mali-c720-registers-ctx-mgr.h    |  207 +++
 .../arm/mali-c720/mali-c720-registers-modules.c    |  148 ++
 .../arm/mali-c720/mali-c720-registers-modules.h    |  136 ++
 .../arm/mali-c720/mali-c720-registers-top.c        |  173 ++
 .../arm/mali-c720/mali-c720-registers-top.h        |  228 +++
 .../platform/arm/mali-c720/mali-c720-registers.c   |   57 +
 .../platform/arm/mali-c720/mali-c720-registers.h   |   84 +
 .../media/platform/arm/mali-c720/mali-c720-stats.c |  730 ++++++++
 .../media/platform/arm/mali-c720/mali-c720-tpg.c   |  581 ++++++
 .../platform/arm/mali-c720/mali-c720-vision-pipe.c |  260 +++
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 include/uapi/linux/media-bus-format.h              |    6 +-
 include/uapi/linux/media/arm/mali-c720-config.h    |  738 ++++++++
 include/uapi/linux/v4l2-controls.h                 |    6 +
 include/uapi/linux/videodev2.h                     |    4 +
 49 files changed, 15724 insertions(+), 4 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261113-b4-initial-upstream-candidate-fce192163026

Best regards,
-- 
Anthony McGivern <Anthony.McGivern@arm.com>

