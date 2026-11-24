Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540130;
	b=AQcCrVLn2IH4kjuavsBXGNgygLuHr9SRL9uTj/DBBvvs4Sx72bK0dkGvAsOcaoGNpXxH
	 U+C+kt+/jlOpvQDtdtPa59XFd3WLT+mtTtOhYoC6cJVK8NbWFBkC2PLHzrLHCGb69D5HY
	 REtumfnbNyD6277PpoR4zVC2Zh7wqGfJV2yIFnVFWXPGPRMrKYOu0Qpu6/Bf+s3FB1mWi
	 yXIpC1xUXx17Me2KlhI2lqpBqTnVPOfNHU0X0HrjyQaO9j+z0FZ7PmLulkxQ3h2bGd0no
	 49YYGXKE+uAB/N/uJN80Ovm6ldcanCRvuFztqeD+Y9HgmPYEPRVvy1GdNKa2Urg/wbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540130;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Yy7vtnpIdF/Maa5GpXOit3+s5nVLvB+TIDK5jvNgUYA=;
	b=s2pZFHDeHprpTByYoYJb/uFK0tH/AqK3SRYCfwhsZ2SevOIRJMCXQ58+VxQS0ZJRGy97
	 8Gdz3T8+bwdHzUCAU+/x/VFTDACfrx9bZKo3OodFaD1idOPx+C/hm/Plhqk6AXURBcxE5
	 QAfswZgEhHkA62IuOktBQfr6V9aLmztEVG2GeCDTLClrE3jKMgT/7gZ9UjfR7keY+Hzl7
	 T2cJa9fBkSmCnU+cEchfsrL6f43GDBPLPplPoRRQQsAofkOvfefdPm/OJ3oiK8ihLH8/R
	 GWIGpHrkbeelsqp2kEbjEGDavyNEjneTWgt7oBSIsXsbUoomtY7XHE9R/QL/MZw9GOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Z57IpTqa;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9335460A380F;
	Tue, 24 Nov 2026 17:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9335460A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Z57IpTqa
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1134F1BC0;
	Tue, 24 Nov 2026 09:08:46 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 372593F763;
	Tue, 24 Nov 2026 09:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540128; bh=Cq7i1wn0HcwfiuqcMvWdQyo1SC7aOjy5ss1gHB67a4c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z57IpTqaAFajd74sIdd6PCAxhbwvXeDMtijjXzBImkWiTrfWv62XwV7/XKmwTwOyZ
	 X9teAXHyTIg2ap0ebAsH0q+Plj/kg3UKUYcZZDnKjXXCjNj1mDVOCBN/mARUGVs2eN
	 WP/bCxpt00e0JU5WmZizcMSCssq1vNY7gupd6X/E=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:43 +0000
Subject: [PATCH 15/24] media: Documentation: Add Mali-C720 ISP
 documentation
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
Message-Id: <20261124-b4-initial-upstream-candidate-v1-15-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540078; l=18457;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=Wd0Fpbvh/omq4DQjiIRd226DQOi7aYVFWienwAkQoYQ=;
 b=XD6yvBNajRyfdAC6otPZJZYqKBUUWYm7Zq2RztIv5BiKwrGNp7FyjX7/kmB4HK3yoNnF56i4C
 JQbUYEmAnbvCmOEH5sBRIVHhnopxkE8ePW4j881u79IJBWfu8AYg0uK
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

From: Anthony McGivern <Anthony.McGivern@arm.com>

Document the Mali-C720 ISP hardware, configuration DMA engine and
media graph topology.

Provide examples for selecting an input source, using the internal
test pattern generators and capturing RGB and YUV images. Describe
the input and output resolution limits and how to configure scaling
and cropping.

Explain the different frame scheduling modes, including free-running
capture and the use of Media Requests for atomic buffer queuing.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 .../admin-guide/media/mali-c720-graph.dot          |  22 ++
 Documentation/admin-guide/media/mali-c720.rst      | 370 +++++++++++++++++++++
 Documentation/admin-guide/media/v4l-drivers.rst    |   1 +
 3 files changed, 393 insertions(+)

diff --git a/Documentation/admin-guide/media/mali-c720-graph.dot b/Documentation/admin-guide/media/mali-c720-graph.dot
new file mode 100644
index 0000000000000000000000000000000000000000..f1d481b98aebd6ab5424fb78331337f2d7479c1f
--- /dev/null
+++ b/Documentation/admin-guide/media/mali-c720-graph.dot
@@ -0,0 +1,22 @@
+digraph board {
+        rankdir=TB
+        n00000001 [label="{{} | mali-c720 tpg 0\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000001:port0 -> n00000009:port1 [style=dashed]
+        n00000003 [label="{{} | mali-c720 tpg 1\n/dev/v4l-subdev1 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000003:port0 -> n00000009:port1 [style=dashed]
+        n00000009 [label="{{<port1> 1} | mali-c720 input\n/dev/v4l-subdev2 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000009:port0 -> n0000000c:port0
+        n0000000c [label="{{<port0> 0} | mali-c720 isp\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n0000000c:port1 -> n00000014:port0
+        n00000014 [label="{{<port0> 0} | mali-c720 hv pipe\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000014:port1 -> n0000001c:port0
+        n0000001c [label="{{<port0> 0} | mali-c720 fr 0 pipe\n/dev/v4l-subdev5 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
+        n0000001c:port1 -> n00000038
+        n0000001c:port2 -> n0000003c [style=dashed]
+        n00000038 [label="mali-c720 fr0-rgb\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+        n0000003c [label="mali-c720 fr0-yuv\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+        n00000074 [label="{{<port0> 0} | csi2-rx\n/dev/v4l-subdev6 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000074:port1 -> n00000009:port1
+        n00000079 [label="{{} | imx415 1-001a\n/dev/v4l-subdev7 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000079:port0 -> n00000074:port0 [style=bold]
+}
diff --git a/Documentation/admin-guide/media/mali-c720.rst b/Documentation/admin-guide/media/mali-c720.rst
new file mode 100644
index 0000000000000000000000000000000000000000..3ff2cb3170f257748878e78b85366b6462f76ff2
--- /dev/null
+++ b/Documentation/admin-guide/media/mali-c720.rst
@@ -0,0 +1,370 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================================
+Arm Mali-C720 Image Signal Processor driver
+===========================================
+
+Introduction
+============
+
+This file documents the driver for Arm's Mali-C720AE Image Signal Processor. The
+driver is located under drivers/media/platform/arm/mali-c720.
+
+The Mali-C720 ISP receives raw Bayer data from sensors through an input
+frontend. The driver uses the first of the hardware's four parallel input
+interfaces.
+The ISP features an image-processing pipeline targeting human vision (HV)
+applications.
+
+Output images are written to memory through an internal DMA engine. The
+full-resolution (FR0) output pipeline supports cropping and scaling, with
+simultaneous RGB and YUV outputs.
+
+Two independent test pattern generators feed the input frontend, allowing the
+ISP to produce images without a connected camera sensor. The driver module is
+named ``mali-c720`` and is enabled through ``CONFIG_VIDEO_MALI_C720``.
+
+The driver implements the V4L2, Media Controller and V4L2 subdevice interfaces.
+Camera sensors and receivers connected to the ISP are expected to expose V4L2
+subdevices.
+
+Mali-C720 ISP hardware
+======================
+
+The ISP exposes a set of hardware ID registers. The driver matches these
+against a set of supported hardware versions and rejects unsupported versions.
+Different hardware versions may expose different functionality, including
+available image formats, pipeline topology, and supported statistics and
+parameter modules.
+
+The ISP is also configurable at synthesis time, allowing certain pipelines and
+processing modules to be included or excluded. The ISP exposes a discovery
+table describing the resulting hardware configuration. The driver queries this
+table during initialization to register the appropriate subdevices and
+programmable blocks.
+
+A high-level functional view of the Mali-C720 ISP is shown below. Live inputs
+and the test pattern generators feed the input frontend::
+
+  +---------------------+    +---------------+
+  |  4 parallel inputs  |    | TPG 0 / TPG 1 |
+  +---------------------+    +---------------+
+             |                       |
+             +------------+----------+
+                          |
+            +-------------v---------------+
+            |       Input frontend        |
+            +-----------------------------+
+                          |
+                          |
+            +-------------v---------------+
+            |       Context manager       |
+            +-----------------------------+
+                          |
+                          |
+            +-------------v---------------+
+            |      Input processing       |
+            +-----------------------------+
+                          |
+                          |
+                 +--------v--------+
+                 |  HV processing  |
+                 +-----------------+
+                          |
+                          | RGB
+                          |
+            +-------------v---------------+
+            |             FR0             |
+            |        Scale / crop         |
+            +----+-------------------+----+
+                 |                   |
+                 | RGB               | YUV
+                 |                   |
+                 v                   v
+              Memory              Memory
+
+The FR0 pipeline has simultaneous RGB/YUV outputs. All image outputs shown
+as Memory use the internal output DMA engine.
+
+Configuration DMA engine (CDMA)
+===============================
+
+The ISP hardware includes a configuration DMA (CDMA) engine that loads ISP
+configuration from allocated memory into registers and stores computed fields,
+including statistics, back into that memory. Configuration is loaded at the
+beginning of frame processing. Computed fields are stored as they become
+available, typically around frame end.
+
+The CDMA engine also includes a scatter-gather unit that transfers ISP
+registers and internal memory tables to and from selected memory offsets,
+with configurable transfer sizes.
+
+For each context, the driver allocates a contiguous DMA region for the ISP
+configuration and initializes it for a default use case. At stream start, it
+configures additional fields such as the frame geometry and colour filter
+array (CFA) pattern.
+
+The driver uses the scatter-gather unit to store ISP statistics blocks in the
+queued videobuf2 (VB2) buffer. The UAPI structures for these blocks reflect the
+data packing produced by the CDMA engine.
+
+Media Controller Topology
+=========================
+
+An example of the ISP's topology (as implemented in a system with an IMX415
+camera sensor and generic CSI-2 receiver) is below.
+
+.. kernel-figure:: mali-c720-graph.dot
+    :alt: Mali-C720 media controller topology
+    :align: center
+
+The driver has up to six V4L2 subdevices:
+
+- ``mali-c720 tpg N``: Test pattern generator (0-1).
+- ``mali-c720 input``: Sensor input frontend.
+- ``mali-c720 isp``: ISP input pipeline.
+- ``mali-c720 hv pipe``: Human vision pipeline.
+- ``mali-c720 fr 0 pipe``: Full-resolution crop/scale pipeline.
+
+The driver has two V4L2 video devices:
+
+- ``mali-c720 fr0-rgb`` and ``mali-c720 fr0-yuv``: FR capture devices.
+
+Input formats
+-------------
+
+The ISP input is limited to resolutions between 256x256 and 8192x4608, and
+this is reflected in the ISP subdevice's .set_fmt() operations.
+With further crop and scale configurations, the minimum output from the ISP
+can be 64x64, reflected in the full-resolution output pipeline subdevice.
+
+Using the driver to capture video
+=================================
+
+Using the media controller APIs we can configure the input source and ISP to
+capture images in a variety of formats. In the examples below, configuring the
+media graph is done with the v4l-utils [1]_ package's media-ctl utility.
+Capturing the images is done with yavta [2]_.
+
+Before configuring the graph, stop any capture applications and disable the
+existing links. The driver enables an image output link by default. Resetting
+the links allows us to enable only the devices required for capture:
+
+.. code-block:: none
+
+    media-ctl -r
+
+Configuring the input source
+----------------------------
+
+To use TPG 0, enable its link to input port 0 and connect the slot input to the
+ISP.
+
+The first step is to set the input source that we wish to use by enabling the
+correct media link. Using the example topology above, we can select the
+TPG as follows:
+
+.. code-block:: none
+
+    media-ctl -l "'csi2-rx':1->'mali-c720 input':1[0]"
+    media-ctl -l "'mali-c720 tpg 0':0->'mali-c720 input':1[1]"
+    media-ctl -l "'mali-c720 input':0->'mali-c720 isp':0[1]"
+
+This links TPG-0 to the input port, and links the slot input to the ISP sink
+pad.
+
+Test pattern mode selection
+---------------------------
+
+The test pattern generator offers various patterns:
+ 0 (flat field), 1 (horizontal gradient), 2 (vertical gradient),
+ 3 (vertical bars, the default), 4 (arbitrary rectangle),
+ 5 (random data), and 6 (white frame on black field).
+
+We can select the vertical bars test pattern as follows:
+
+.. code-block:: none
+
+    v4l2-ctl -d /dev/v4l-subdev0 --set-ctrl=test_pattern=3
+
+Configuring the image processing pipeline
+-----------------------------------------
+
+The example below shows how we can route the image data through the human
+vision pipeline of the ISP, and from there to the first full resolution
+output pipe:
+
+.. code-block:: none
+
+    media-ctl -l "'mali-c720 isp':1->'mali-c720 hv pipe':0[1]"
+    media-ctl -l "'mali-c720 hv pipe':1->'mali-c720 fr 0 pipe':0[1]"
+
+Configuring which video devices will stream data
+------------------------------------------------
+
+The driver waits for all video devices connected through enabled links to have
+their VIDIOC_STREAMON ioctl called before starting the input source. Enable
+links only to the video devices that will be used. In the example below we
+enable the link to the `fr0-rgb` video device.
+
+.. code-block:: none
+
+    media-ctl -l "'mali-c720 fr 0 pipe':1->'mali-c720 fr0-rgb':0[1]"
+
+Capturing Bayer data and processing it to RGB
+--------------------------------------------
+
+To capture 1920x1080 Bayer data from the source and push it through the ISP's
+full processing pipeline, we configure formats from the input source towards
+the output.
+
+The TPG produces 16-bit Bayer data, the input subdevice outputs this as 24-bit
+Bayer. The input pipeline, represented by the ISP subdevice, transforms the
+data into the square-root domain and feeds 16-bit Bayer into HV. Within HV,
+the debayering occurs and then produces the 12-bit RGB input used by FR0.
+
+For our example, the formats are configured as follows:
+
+.. code-block:: none
+
+    media-ctl -V "'mali-c720 tpg 0':0[fmt:SRGGB16_1X16/1920x1080]"
+    media-ctl -V "'mali-c720 input':1[fmt:SRGGB16_1X16/1920x1080]"
+    media-ctl -V "'mali-c720 isp':0[fmt:SRGGB24_1X24/1920x1080]"
+    media-ctl -V "'mali-c720 hv pipe':0[fmt:SRGGB16_1X16/1920x1080]"
+    media-ctl -V "'mali-c720 fr 0 pipe':0[fmt:RGB121212_1X36/1920x1080]"
+
+Images can then be captured from the FR0-RGB video device:
+
+.. code-block:: none
+
+    yavta -f RGB24 -s 1920x1080 -c10 /dev/video0
+
+Capturing from multiple outputs
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The RGB and YUV outputs can capture images at the same time. For example,
+enable both FR0 capture nodes:
+
+.. code-block:: none
+
+    media-ctl -l "'mali-c720 fr 0 pipe':1->'mali-c720 fr0-rgb':0[1]"
+    media-ctl -l "'mali-c720 fr 0 pipe':2->'mali-c720 fr0-yuv':0[1]"
+
+Starting the first video device validates the entire media pipeline and
+prevents further format changes. As such, when capturing from multiple outputs,
+formats must be configured on all enabled subdevices and linked video devices
+before starting any streams. For example, set both capture formats using v4l2-ctl:
+
+.. code-block:: none
+
+    v4l2-ctl -d /dev/video0 --set-fmt-video=width=1920,height=1080,pixelformat=RGB3
+    v4l2-ctl -d /dev/video1 --set-fmt-video=width=1920,height=1080,pixelformat=NV12
+
+Then run the two capture processes concurrently:
+
+.. code-block:: none
+
+    yavta -c10 /dev/video0 &
+    yavta -c10 /dev/video1 &
+    wait
+
+Cropping the image
+~~~~~~~~~~~~~~~~~~
+
+The full-resolution pipeline can crop to a minimum resolution of 64x64.
+To crop the image, configure the pipe's source pad crop rectangle and set
+the format on the video device. The FR pipeline has one shared crop for
+its RGB and YUV outputs. Setting the crop on either source pad updates
+both source crops and output dimensions:
+
+.. code-block:: none
+
+    media-ctl -V "'mali-c720 fr 0 pipe':1[crop:(640,300)/640x480]"
+    yavta -f RGB24 -s 640x480 -c10 /dev/video0
+
+Downscaling the image
+~~~~~~~~~~~~~~~~~~~~~
+
+The full-resolution pipeline can produce full-size, cropped or downscaled
+images. Downscaling by up to ~16x is supported, provided the minimum 64x64
+output resolution is adhered to. For the best image result the scaling ratio
+for each direction should be the same. Scaling is configured with the compose
+rectangle on the pipe's sink pad. RGB and YUV outputs share the same
+scaling configuration:
+
+.. code-block:: none
+
+    media-ctl -V "'mali-c720 fr 0 pipe':0[compose:(0,0)/640x360]"
+    yavta -f RGB24 -s 640x360 -c10 /dev/video0
+
+Cropping is applied after scaling. To combine the two operations, set the
+compose rectangle first, then the crop rectangle.
+
+Capturing images in YUV formats
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Within the full resolution pipe there is a colour space conversion block for
+the YUV conversion, but its design permits the RGB and YUV to be output
+simultaneously. Enable the link between the pipe and the YUV video device,
+then configure a capture format like NV12:
+
+.. code-block:: none
+
+    media-ctl -l "'mali-c720 fr 0 pipe':1->'mali-c720 fr0-rgb':0[0]"
+    media-ctl -l "'mali-c720 fr 0 pipe':2->'mali-c720 fr0-yuv':0[1]"
+    yavta -f NV12 -s 1920x1080 -c10 /dev/video1
+
+.. _mali-c720-frame-scheduling:
+
+Frame scheduling and Media Requests
+===================================
+
+Frame scheduling depends on whether the streaming videobuf2 (VB2) queues use
+direct buffer queuing or Media Requests. Use of Media Requests is optional.
+
+Direct mode
+-----------
+
+When all streaming image capture queues use direct buffer queuing through
+:ref:`VIDIOC_QBUF`, the driver schedules frames in free-running mode.
+Scheduling starts only when at least one image output buffer is ready.
+Once started, it continues scheduling frames using the available buffers.
+Empty image capture queues disable their respective capture for the
+scheduled frame.
+
+Request mode
+------------
+
+If any of these streaming VB2 queues uses Media Requests, scheduling starts
+when a request is queued. Each subsequent frame also requires a queued
+request.
+
+Applications allocate a request using :ref:`MEDIA_IOC_REQUEST_ALLOC` on the
+media device.
+Image buffers are associated with it through
+:ref:`VIDIOC_QBUF`, setting ``V4L2_BUF_FLAG_REQUEST_FD`` and ``request_fd``.
+The request is then submitted using :ref:`MEDIA_REQUEST_IOC_QUEUE` on the
+request file descriptor.
+
+Controls cannot currently be associated with Media Requests. Requests
+containing controls are rejected when queued.
+
+A request does not need to include a buffer for every capture queue.
+Queues without a buffer will be disabled for the scheduled frame.
+
+All buffers associated with the request are usually applied on the same
+frame, but a request could span multiple frames if multiple buffers are
+queued for the same buffer queue. Completed buffers are returned to userspace through
+:ref:`VIDIOC_DQBUF <VIDIOC_QBUF>`.
+
+It is permitted to queue buffers directly in other VB2 queues alongside
+those operating in request mode, with requests still driving scheduling.
+Whenever a request is scheduled, available buffers from these queues can
+be used for the same frame, alongside buffers associated with the request.
+
+References
+==========
+
+.. [1] https://git.linuxtv.org/v4l-utils.git/
+.. [2] https://git.ideasonboard.org/yavta.git/
+.. [3] https://support.arm.com/compute-ip/mali-c720ae
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index 4621eae9fa1edf3686c2fc7228c7f4784bd79d5c..d47c3de7dbea2a42816c8de6e7544be5d681d11a 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -21,6 +21,7 @@ Video4Linux (V4L) driver-specific documentation
 	ipu6-isys
 	ivtv
 	mali-c55
+	mali-c720
 	mgb4
 	omap3isp
 	philips

-- 
2.55.0

