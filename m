Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008549;
	b=NcRTKWDMGBxBeNXCrg38ZAE2YDjFkoIDIkG2HvzRytcPlGQ7ejoxxj1rabSvJgce4uO7
	 uecYggOKSWbmTUtVrHBOVasCCsCLjHYB2hQBuZyNYwBOVB+tQYb+EmStdA1l/ibucpSrC
	 9jfm3Lw7qyvYIBLOcStR1STJAcgcdu2y0M2WF//Xjrq6LP6GryhfzE+5kEO/oqQGsf1uD
	 5mXBwrICfELDP3ChlUdS9Vt0RaV7SsUCEb2B7FQRW2cBicz8Jo4RvZ1HcL17WqUBE20tM
	 OWUHtDvWV59HCKEXTuulDtI/SkD12z9ZsPZWzqeKoDNNHZYryRSC/wTuP2Mhz+tiRMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008549;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=RxfvktPFyanRNRPp1VpME/Hpg15R63/TIt8fdLjDuCA=;
	b=UGXX1kuWX2MeiiVqJyrgK9CHFDfvKDxN/RxA2V73knGvXB4Rq1g5no4b9uCw6FmgrWLR
	 KiaKyhMssw/LjGbgRKcIa5rZFI4Dt5k38QHwXQQKAYFEZs2gV0rd484S9XmCxWiaoUA7l
	 sjJExXvdPppRtI8NtzB1xzuw2tpxHZ4BQL2YX3+OH54/3vmbRGcG5n1g6YCOXeMxfVIR5
	 TMPOZWyabjQPyFC1+WXJnWS6MVzoaNNd/nzGrr+ickC7byYAV49YYHJ0RIImoqLHqp7wh
	 AcCJrh7E/KQANzhgrxbfo063XzoJE0QksBaWsAQxybDCC7ONJHMDLDrTkCDNZSFK5Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ql8P83K7;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FB760A2624
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19FB760A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ql8P83K7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008549; x=1826544549;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JG/Nwi/RYYMHAYpGVBH15Z/VnAMffnV9DVo3XYCgVBE=;
  b=Ql8P83K7fSBGfwaFmVkUvEYmDo1MAga1I3abR+hfI8i/aXAzgfoP9HB3
   s3qUrI0yvbBI/oTgJzC/E97Jb4dtMk54PRbiL+ituWvibwIlh/vBMlYGS
   x7SSkKNOGXErR+nJSM33Q2bp1y1mStIbFOUIUkfRTy1JhZ01EB2zN2vtA
   Ueij8ZfLX6tlDWRVbBuOExX+xd8tRn86h11vugfug6exWzlWJjg5fgX5S
   dnDmkNaZxPzYeqDmi8I4t9uE/QF8s6b0VfqspWKBGkGRkRp8AYWtZK7/I
   sosqONK4xORhS8GQhzL6q5McGgsnfwwbdQoIhSkgyuxUNy7k5QM2qgd5L
   g==;
X-CSE-ConnectionGUID: +dbyTLdBSQGY3HlNBfqc9A==
X-CSE-MsgGUID: reYiJiTiTXafF8/f5Z2MwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808998"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808998"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:29:05 -0800
X-CSE-ConnectionGUID: 5yn0shDPTN+9oXt5tcNoEQ==
X-CSE-MsgGUID: XsAyDY33Q+apToAd/XHN9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376795"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A17881230C6;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tc9-19dH;
	Wed, 18 Nov 2026 15:28:20 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v13 39/73] media: Documentation: Add sub-device internal pads example
Date: Wed, 18 Nov 2026 15:27:45 +0200
Message-ID: <20261118132819.213473-40-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118132819.213473-1-sakari.ailus@linux.intel.com>
References: <20261118132819.213473-1-sakari.ailus@linux.intel.com>
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

Add an example using sub-device internal pads, with the Sony IMX219 camera
sensor.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst    | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 3472b0591d79..f6c4dfcff06d 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -726,3 +726,132 @@ To configure this pipeline, the userspace must take the following steps:
    :ref:`V4L2_CID_METADATA_LAYOUT <image_source_control_metadata_layout>`
    controls are present on the source sub-device to obtain the pixel array CFA
    pattern and metadata layout.
+
+Internal pads setup example
+---------------------------
+
+A simple example of a multiplexed stream setup might be as follows:
+
+- An IMX219 camera sensor source sub-device, with one source pad (0), one
+  internal sink pad (1) as the source of the image data and an internal sink
+  pad (2) as the source of the embedded data. There are two routes, one from the
+  internal sink pad 1 to the source pad 0 (image data) and another from the
+  internal sink pad 2 to the source pad 0 (embedded data). Both streams are
+  always active, i.e. there is no need to separately enable the embedded data
+  stream. The sensor uses the CSI-2 interface.
+
+- A CSI-2 receiver in the SoC. The receiver has a single sink pad (pad 0),
+  connected to the sensor's source pad (0), and two source pads (pads 1 and 2),
+  to two DMA engines. The receiver demultiplexes the incoming streams to the
+  source pads.
+
+- Two DMA engines in the SoC, one for each stream. Each DMA engine is connected
+  to a different source pad of the receiver.
+
+The sensor and the receiver are modelled as V4L2 sub-devices, exposed to
+userspace via /dev/v4l-subdevX device nodes. The DMA engines are modelled as
+V4L2 video devices, exposed to userspace via /dev/videoX nodes.
+
+To configure this pipeline, the userspace must take the following steps:
+
+1) Set up media links between entities: enable the links from the sensor to the
+   receiver and from the receiver to the DMA engines. This step does not differ
+   from normal non-multiplexed media controller setup.
+
+2) Configure routing
+
+.. flat-table:: Camera sensor. There are no configurable routes.
+    :header-rows: 1
+
+    * - Sink Pad/Stream
+      - Source Pad/Stream
+      - Routing Flags
+      - Comments
+    * - 1/0
+      - 0/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE | V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
+        V4L2_SUBDEV_ROUTE_FL_STATIC
+      - Pixel data stream from the internal image sink pad
+    * - 2/0
+      - 0/1
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE | V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
+        V4L2_SUBDEV_ROUTE_FL_STATIC
+      - Metadata stream from the internal embedded data sink pad
+
+While both routes are immutable for the IMX219, other camera sensors may offer
+more flexible configuration options. Routing configuration is dictated by the
+hardware capabilities: camera sensors typically always produce an image data
+stream, but some of them support enabling and disabling the embedded data
+stream.
+
+.. flat-table:: Receiver routing table. Typically both routes need to be
+		explicitly created.
+    :header-rows:  1
+
+    * - Sink Pad/Stream
+      - Source Pad/Stream
+      - Routing Flags
+      - Comments
+    * - 0/0
+      - 1/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Pixel data stream from camera sensor
+    * - 0/1
+      - 2/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Metadata stream from camera sensor
+
+3) Configure formats
+
+   This example assumes that the formats are propagated from sink pad to the
+   source pad as-is. The tables contain fields of both struct v4l2_subdev_format
+   and struct v4l2_mbus_framefmt.
+
+.. flat-table:: Formats set on the sub-devices. Bold values are set, others are
+                static or propagated. The order is aligned with configured
+                routes.
+    :header-rows: 1
+    :fill-cells:
+
+    * - Sub-device
+      - Pad/Stream
+      - Width
+      - Height
+      - Code
+    * - :rspan:`3` IMX219
+      - 1/0
+      - 3296
+      - 2480
+      - MEDIA_BUS_FMT_RAW_10
+    * - 0/0
+      - 3296
+      - 2480
+      - **MEDIA_BUS_FMT_RAW_10**
+    * - 2/0
+      - 3296
+      - 2
+      - MEDIA_BUS_FMT_META_10
+    * - 0/1
+      - 3296
+      - 2
+      - MEDIA_BUS_FMT_META_10
+    * - :rspan:`3` CSI-2 receiver
+      - 0/0
+      - **3296**
+      - **2480**
+      - **MEDIA_BUS_FMT_RAW_10**
+    * - 1/0
+      - 3296
+      - 2480
+      - MEDIA_BUS_FMT_RAW_10
+    * - 0/1
+      - **3296**
+      - **2**
+      - **MEDIA_BUS_FMT_META_10**
+    * - 2/0
+      - 3296
+      - 2
+      - MEDIA_BUS_FMT_META_10
+
+The embedded data format does not need to be configured on the sensor's pads as
+the format is dictated by the pixel data format in this case.
-- 
2.47.3

