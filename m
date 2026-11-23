Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399256;
	b=zSxgRbD+ufsZQSXJcdCx0SGVhT8nEfbx8GIrWiz2zleiiH+/N1HJ+Bx8pmyjud87E2DB
	 9CQvt3W7dVdXAcayxRd5wZttRgzy1L9B+gZdXB1ud75K7483LsPWYVykgIg0iIDZj+9UK
	 4zYajk0yiBrRCfRA+TFY9niIG53hi0P5RGwYnSZdiY1p3KdHthLc4Z1qlmFmSTFrgj7Ph
	 1xDo+H/wzBrcZR46GlZw+ebqwtbM3nzn9d5BiSgnnYFUjw1gqKvcn+Qi/MTPfPQbB5MFq
	 JH5yYbsAO8XLe43DNrXb8Bx8AlAoT//lQbgkkfr2a+YLU0kMgAR8zmeNCt9NFBdqnhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399256;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=abuHts2iLCDIlqg/UOb0cnFGjClC7OODd7kpb0gel4Q=;
	b=vq6UD8s2Zjnx5hCwN4pP7jyFDkDG01JdXk5UVGRRBaMJ2Isvc9IRFPJsAijDEkHiBiHy
	 lViNhjNkvkLRRcNWEe9WmehuH8gnMazFpidOC75giwR21LNmcHnqM3hLeqD48edTbC0S8
	 WYY/GVoli26z7oUMzrxIfGR7uAvhp3QYmn8qYVZHfzoBk6tggaBnjfo2cfIWOgJyeEK34
	 Fcq2yUyQHdfWpQd1m2Z6liHLej7ahfbuWio3jqV9oyP1QfaunjOc0sngsqYUhf2B1yVe9
	 3Tsk1hLnQ3wyEQCrPktKqpwpzo1Y/Cl/ZJ09t/M6EkWlGareiCrPax286/b9Q8qsCDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=mNzfWYi1;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83D0606A31E
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 02:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E83D0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=mNzfWYi1
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BCA7177;
	Mon, 23 Nov 2026 02:58:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795399102;
	bh=4pT1LtwoS4OSxPyQLZ0golaCvmGhRONJYsbX0worwcg=;
	h=From:To:Cc:Subject:Date:From;
	b=mNzfWYi18y5AZcO42KHO3WHT+MmGriLw1Ps7xmW/8ienXLIrm9cOfOnehfsYIKDub
	 Fsf0TSZEAaIosFOhUrQ/8PkMX0iFBOWgtXnVUii6lQJrWQ81DQrCdT7LAeYsP1bwxf
	 ZumRxqvP8/+rx526chvPmQlyd+JEt+9dQQgO+iGs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH] Documentation: media: Document API requirements for complex cameras
Date: Mon, 23 Nov 2026 04:00:52 +0200
Message-ID: <20261123020052.2990492-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.56.1
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

Complex cameras use the Media Controller and V4L2 userspace APIs. While
those APIs are standardized, their broad scope provide lots of freedom
for drivers to expose features to applications. The lack of guidelines
for driver developers has led to confusion, with drivers exposing
identical features in different ways, increasing complexity for
userspace.

Add a document that explains what API elements drivers for complex
cameras shall or shall not expose to userspace, as well as requirements
for suitable test implementations in userspace.

This document is a starting point and is expected to be extended over
time to address architectural issues noticed during review. The
userspace requirements are inspired by the DRM userspace requirements
(Documentation/gpu/drm-uapi.rst).

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
A recent discussion regarding the tegra-video driver ([1]) reminded me
that documentation about what APIs drivers for complex camera should
implement is still missing. This is an attempt to start such a document.
I have tried to keep it relatively short, and focus on the issues that
immediately came to my mind. As the scope is large, I believe extending
the documentation as issues arise is a good strategy.

Part of the userspace requirements is not specific to complex cameras.
The section could be generalized and moved to a different location, but
I wasn't sure what a suitable location could be. I would appreciate if
this patch could get merged without first refactoring large parts of the
V4L2 documentation :-)

[1] https://lore.kernel.org/linux-media/20261120213116.GB2472094@killaraus.ideasonboard.com
---
 .../driver-api/media/complex-camera.rst       | 82 +++++++++++++++++++
 Documentation/driver-api/media/index.rst      |  1 +
 Documentation/driver-api/media/v4l2-isp.rst   |  6 +-
 3 files changed, 87 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/driver-api/media/complex-camera.rst

diff --git a/Documentation/driver-api/media/complex-camera.rst b/Documentation/driver-api/media/complex-camera.rst
new file mode 100644
index 000000000000..a6133b11575a
--- /dev/null
+++ b/Documentation/driver-api/media/complex-camera.rst
@@ -0,0 +1,82 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _media_writing_complex_camera_drivers:
+
+Writing drivers for complex cameras
+===================================
+
+Complex cameras are devices that combine camera sensors, transmitters,
+receivers, processing elements and DMA engines in ways that require control of
+those elements individually from userspace.
+
+Prime examples of such devices are "MIPI cameras" found in most phones and in
+many laptops, where a raw camera sensor is connected to an SoC over MIPI CSI-2,
+with the camera sensor, the CSI-2 receiver and the ISP controlled directly from
+userspace. Such system where all the components are controlled by a firmware
+that exposes a high-level, webcam-like API are not considered complex cameras.
+
+Complex cameras use the Media Controller and V4L2 userspace APIs. While those
+APIs are standardized, their broad scope provide lots of freedom for drivers to
+expose features to applications. This has historically led to drivers exposing
+identical features in very different ways, increasing complexity for userspace.
+This document defines what API elements drivers for complex cameras should
+expose to userspace.
+
+
+Architecture
+------------
+
+Complex cameras are made of at least one inline processing pipeline and zero or
+more offline processing pipelines. The inline pipelines contain at least one
+camera sensor, one receiver and one DMA engine, and may include other elements
+such as serializers, deserializers or inline ISPs. The offline pipelines
+typically contain processing elements such as memory-to-memory ISPs and their
+associated DMA engines.
+
+Each pipeline shall be exposed to userspace using the Media Controller API as
+one media graph. All media entities in the graph that require software control
+shall be exposed to userspace using the V4L2 video device API for DMA engines,
+and the V4L2 subdevice API for all other entities.
+
+Camera sensor drivers shall implement the API described in
+:ref:`media_using_camera_sensor_drivers`.
+
+ISP drivers, for both inline and memory-to-memory ISPs, shall expose parameters
+and statistics using the :ref:`v4l2_isp_parameters_statistics_api`. They shall
+not expose ISP parameters through V4L2 controls, and shall not implement ISP
+control algorithms such as auto-exposure or auto-white balance within the
+kernel.
+
+Video devices shall report the `V4L2_CAP_IO_MC` device capability (see
+:ref:`VIDIOC_QUERYCAP`). In accordance to the principles of MC-centric drivers,
+video devices shall not control other entities in the pipeline.
+
+
+Open-source userspace requirements
+----------------------------------
+
+Any addition to the Media Controller or V4L2 userspace API, regardless of its
+nature (new or extensions to IOCTLs, new controls or events, new ISP parameters
+or statistics formats, new media graph topologies, ...), requires a
+corresponding open-source userspace implementation in a suitable upstream
+project. That implementation must have been reviewed by the project and be
+ready for merging.
+
+Historically, proving the design of V4L2 userspace API extensions only required
+a test implementation in userspace, usually in the `media-ctl` or `v4l2-ctl`
+tools and in `v4l2-compliance`. Over the years, it became clear that test tools
+only guaranteed suitability of the APIs for test tools, not for real world use
+cases. This has led to APIs that were cumbersome to use in userspace, or too
+specific to a particular use case. Proper review and validation of APIs
+therefore requires a userspace implementation in a real project.
+
+Furthermore, maintaining kernel drivers requires an open-source userspace
+implementation to test changes and debug problems. As drivers need to be
+maintained in the long term, that implementation must provide quality and
+support guarantees that are not compatible with a one-off test project, or a
+vendor fork of a project. The userspace implementation must therefore be part
+of a suitable upstream project, and have been reviewed and ready for merging by
+project maintainers.
+
+For complex cameras, a suitable userspace project is
+`libcamera <https://libcamera.org>`_.
diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
index 08fc2cfc07a3..8fa6dac57994 100644
--- a/Documentation/driver-api/media/index.rst
+++ b/Documentation/driver-api/media/index.rst
@@ -35,6 +35,7 @@ Documentation/userspace-api/media/index.rst
     cec-core
     tx-rx
     camera-sensor
+    complex-camera
 
     drivers/index
 
diff --git a/Documentation/driver-api/media/v4l2-isp.rst b/Documentation/driver-api/media/v4l2-isp.rst
index 618ae614ff79..1736a1f139d8 100644
--- a/Documentation/driver-api/media/v4l2-isp.rst
+++ b/Documentation/driver-api/media/v4l2-isp.rst
@@ -1,7 +1,9 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-V4L2 generic ISP parameters and statistics support
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+.. _v4l2_isp_parameters_statistics_api:
+
+V4L2 generic ISP parameters and statistics API
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Design rationale
 ================

base-commit: b7ac871daee981f1963f632586ff9b9d898ce5dd
-- 
Regards,

Laurent Pinchart

