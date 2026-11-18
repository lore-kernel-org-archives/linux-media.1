Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008550;
	b=rO2bwO272PXPSTahfpBYv88fSYB5xGxnsCG2+fnLJ/Sw0vmdfcPAT2c0P+GLtVwZABHe
	 X3ENjYKUgdHd/T9BNvgGNsdbD+K7jCPUFuXjXeRxdMxokpKzUfD2oSGdUV/1AsYQJtUSk
	 A55p9hQ/QguorwvNQgAgQ0YfQPTw9jZ27pK04hd/+2StvPeYTzB1XLSoZROKDwrb8kYj4
	 3JMUunFMUjPKwCdhkOWnyzmE0HHXx9nJX00+c2A+nZU+Y6DvW+yOTNcHzQdoN8J3BA6Vd
	 tuFPo+SFh4PcS7J3wnU82gXK8Wt5d1Lrfmj7Rfpc1gH/R1rB/y1og5wNyRkzxlXkw1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008550;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=3xYA9lAKdpHzHcvsMSdphliHKkRKYLpYrAwVWX4SMHc=;
	b=Tc0rDnoEcN3SN2OgtxGeqVqr9sFkln4z4U4fIqNndtFn27CxSh8hv7i71ZyjJ0cOJyoX
	 +c9uPyU8KGw0zXm0RtWq1TZw7Th9qxuMEGa2xgWdRFHBW19Axp0D5kYGviXIl34ejZxap
	 Hbsq9jI1jXgCE2BG4ZyRvbO2WZXkXy6WT81SBIkfuh9cz3VT6o6Wu4QPmvbLCOuvQx2vs
	 qDxDdJj91YBOD4q5ZC5NTOvwZAPF7TH6YsjA3Sh9SH8cOz6tICbN2sMbQTGFkGPIEJikv
	 KRGiMgUGGl0O4fr2lpW5QRGMXSdB5p3XpwvnRWPEKXPLPICVHW+qE8W7ZhgT9VMy9Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ijyGhTDG;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B150A606A325
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B150A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ijyGhTDG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008550; x=1826544550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jWNvycdcT8RNp56TKSF+OlAxA0jlDK9hE1gu5m5GLoQ=;
  b=ijyGhTDGGnlrT9j30mJ9auHvhMe1vyUj8IXj+Z4kVIgYAWfYIcynemPo
   JYds+jCFTu49D5iVwWny/ZemuvfuYP5XB3QXxml+UMkgHptyhcKxZhfbq
   V2nAhshPlwZFClrSvm4ogUELUKxK3k2TnNqdE0a84PEs3ZqRN1k8FJKws
   YCJrqXTnogydDVwvjNiQonwgD1I2mAv1xCfwOt1ZUTvXnfYvYM0SzRVZc
   Unzkho94jANpRF2BNq6+WJSr6aFC4OFeFJWpZnvSozQ/USP64Qw3M84g6
   +BYAfpYEoF4Q9tWeNM6OgMaDvHn3tNk2yeFqvxSZ8ZclnXVVqmH0ypIj/
   Q==;
X-CSE-ConnectionGUID: EaoWqTNfT4yIHmYAHO/5Mw==
X-CSE-MsgGUID: 8jTTVPl/Q1Gb5s8m1xN2Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3809026"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3809026"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:29:05 -0800
X-CSE-ConnectionGUID: wjjYO7dbRSG7jprEPV/9xQ==
X-CSE-MsgGUID: 5Cw3250GTbWkXgvUcPHFXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376801"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B841F1230F0;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tcT-1VjY;
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
Subject: [PATCH v13 44/73] media: uapi: ccs: Add metadata layout for MIPI CCS embedded data
Date: Wed, 18 Nov 2026 15:27:50 +0200
Message-ID: <20261118132819.213473-45-sakari.ailus@linux.intel.com>
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

Add new metadata layout (V4L2_METADATA_LAYOUT_CCS) for MIPI CCS embedded
data.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/ext-ctrls-image-source.rst      | 12 ++++++
 .../userspace-api/media/v4l/meta-formats.rst  |  1 +
 .../media/v4l/metadata-layouts.rst            | 39 +++++++++++++++++++
 .../media/v4l/metafmt-generic.rst             |  2 +
 .../media/v4l/subdev-formats.rst              |  5 +++
 include/uapi/linux/v4l2-controls.h            |  1 +
 6 files changed, 60 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/metadata-layouts.rst

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 4e307957c80a..335d38271d2c 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -164,6 +164,18 @@ Image Source Control IDs
     :ref:`generic metadata formats <media-bus-format-generic-meta>` formats to
     specify the layout of the data.
 
+.. flat-table:: V4L2 metadata layouts
+    :header-rows:  1
+    :stub-columns: 0
+    :widths:       1 2 1
+
+    * - Macro name
+      - Synopsis
+      - Value
+    * - V4L2_METADATA_LAYOUT_CCS
+      - :ref:`CCS embedded data <media-metadata-layout-ccs>`
+      - 1
+
 .. _image_source_control_binning_factors:
 
 ``V4L2_CID_BINNING_FACTORS (integer menu)``
diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index b5455229837e..18d036750e1a 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -17,6 +17,7 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-c3-isp
     metafmt-d4xx
     metafmt-generic
+    metadata-layouts
     metafmt-intel-ipu3
     metafmt-pisp-be
     metafmt-pisp-fe
diff --git a/Documentation/userspace-api/media/v4l/metadata-layouts.rst b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
new file mode 100644
index 000000000000..cd190f453994
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
@@ -0,0 +1,39 @@
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+
+.. _media_metadata_layouts:
+
+Metadata Layouts
+----------------
+
+The :ref:`metadata layout control <image_source_control_metadata_layout>`
+specifies the exact layout of the metadata stream while the a :ref:`generic
+metadata mbus code <media-bus-format-generic-meta>` on the subdevice pads
+only describe the size of the :term:`Data Unit`.
+
+.. _media-metadata-layout-ccs:
+
+MIPI CCS Embedded Data Layout (``V4L2_METADATA_LAYOUT_CCS``)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines a
+metadata layout for sensor embedded data, identified by
+``V4L2_CID_METADATA_LAYOUT`` control value ``V4L2_METADATA_LAYOUT_CCS``, which
+is used to store the register configuration used for capturing a given
+frame. The layout itself is defined in the CCS specification.
+
+The CCS embedded data format (code ``0xa``) definition includes three levels:
+
+1. Padding within CSI-2 bus :term:`Data Unit` as documented in the MIPI CCS
+   specification.
+
+2. The tagged data format as documented in the MIPI CCS specification.
+
+3. Register addresses and register documentation as documented in the MIPI CCS
+   specification.
+
+The ``V4L2_METADATA_LAYOUT_CCS`` metadata layout value shall be used only by
+devices that fulfill all three levels above.
+
+This metadata layout code is only used for "2-byte simplified tagged data
+format" (code ``0xa``) but their use may be extended further in the future, to
+cover other CCS embedded data format codes.
diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
index 07147b4d0dd2..fb97fe4d3c72 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-generic.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
@@ -8,6 +8,8 @@ V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MECA'), V4L2_M
 
 Generic line-based metadata formats
 
+.. _v4l2-format-generic-meta:
+
 Description
 ===========
 
diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 4b832118060a..30dd26804776 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -8932,6 +8932,11 @@ content is more or less device specific but the data is transmitted and received
 by multiple devices that do not process the data in any way, simply writing
 it to system memory for processing in software at the end of the pipeline.
 
+The exact layout of the data generated by the device is reported by the
+:ref:`V4L2_CID_METADATA_LAYOUT <image_source_control_metadata_layout>`
+control. For in-memory formats, :ref:`Generic line-based metadata formats
+<v4l2-format-generic-meta>` are used.
+
 "b" in an array cell signifies a byte of data, followed by the number of the bit
 and finally the bit number in subscript. "x" indicates a padding bit.
 
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index da0123259b25..66f509ad105c 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1272,6 +1272,7 @@ enum v4l2_jpeg_chroma_subsampling {
 	(V4L2_CFA_PATTERN_FLIP_HORIZONTAL | V4L2_CFA_PATTERN_FLIP_VERTICAL)
 
 #define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
+#define V4L2_METADATA_LAYOUT_CCS		1U
 
 #define V4L2_CID_BINNING_FACTORS		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 13)
 #define V4L2_BINNING_FACTORS_MAKE(hnum, hdem, vnum, vdem)		\
-- 
2.47.3

