Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008542;
	b=XstIt9ZtPigZI4eWCPl+S1C8oVNdPH5NjoEt5bTpsk9AbHumdKOmr3DdyOIQZBpsZEOK
	 +Y4Qzr7Ya1qfiL+oEQClNt/DUaYMpeHDGa0OL1HojpUM2xMkb2YzZP0+QyiE/70rLNfPZ
	 riGcgMWle+AqKPIIjm4WZzXXLE7q4Uwul2k3WHFrebsuuPD2Y/IY0PTh8rLGSAjbDFos5
	 2g+Ht9THrN1RGgJO57UePbp++XfHQ3iyC6p+i+fBUCg1r6zNbDioowO/YDmVKcsulZXfx
	 aeVg4Uy+mwxPEa0gONvxMIVGC1jtyounuQzMEJ7fV4M6ni/yqw3X7mKgQ4uaje+L13g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008542;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=yrLCIe+W62IkGfcNTUO4F5+qDU8xySPPFn3PoKOukXo=;
	b=hLBYJOwNWBotzHlT9dKyah9TB1cT1ZcSR9UAgefkbwCiF6W3ZwlzKHcUgE8pQFDxboaR
	 dj9d+lJPp+SKX0LZS7RTUyHE3OpP41sWQHcN81Zv9Ca9E5wN8paYnBHMgcI36j8zgMNwT
	 muLXR1eWIIAanXSq5I8wqDcBXkUep9hxw46qGDc+vOkl6QpcpFV9Fu+U7yaUYh1qAA/vH
	 Z+ZQCoSMUxEROAAwOrd9Qxv/jmIB/CgX7yC3CWqNWHA4zKO84zCu9X4ZkoxHBa63cPbhh
	 Ux7/Z8vthA/j2NaiKHEIYZ9bfkIPnIGPe63CBul9wzqD780sEXxw9mk/5HL+yC6DyoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="FKlqd/6y";
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5352260A2633
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5352260A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FKlqd/6y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008542; x=1826544542;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MWpD2cpZpSk7OvarFhWIY23TXvLS8iXv9WRUc+kx73U=;
  b=FKlqd/6yj7Ovs2Tz8qNBW9va/pR6gx1Feo+9SihKGlS9WVeGgxAB2DkY
   pp/j5yteiYBv9MjPxwkQMz0kk3NiSMaz+UHfMfpmQnJrUSp4HieZzb0if
   p69uJWPFhTD0CpOdevOxGY6NDeKL3cseN98WDWDlW1QUBVZ+qkfdWrmUM
   MGVdZOx4Lf6Nl0E6wTp/ynKGZXH+PWtej/YeKJG99RXBsLZtNQwFmLQHr
   Lao1r7kUM2EWICHf4mVvFX1wBESWhn4SCuT6lLj7oR6Lo6oktKpvvpEQp
   ZuKnB+L8QVK66Pizt1odUoTqishB4VLsvxgKErcLItYkEMPHgFWP8D5EH
   w==;
X-CSE-ConnectionGUID: DjnIRd20RCONZRwE/AiYAQ==
X-CSE-MsgGUID: RFJKrCbORJqs8UVcrzG5Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808824"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808824"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:57 -0800
X-CSE-ConnectionGUID: deYvihuvTyKN71HNjWyyBg==
X-CSE-MsgGUID: 60dXk3bRRP69t8OszqAtfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376724"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:50 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7F8B8122FE3;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tbV-0Wmf;
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
Subject: [PATCH v13 29/73] media: uapi: Add V4L2_CID_BINNING_FACTORS control for binning configuration
Date: Wed, 18 Nov 2026 15:27:35 +0200
Message-ID: <20261118132819.213473-30-sakari.ailus@linux.intel.com>
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

Add V4L2_CID_BINNING_FACTORS control for configuring binning and
enumerating a camera sensor's binning capabilities. The control combines
horizontal and vertical binning into a single control as the two are
generally related.

New drivers should use this control to configure binning.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 .../media/drivers/camera-sensor.rst           | 12 ++++++++
 .../media/v4l/ext-ctrls-image-source.rst      | 30 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
 include/uapi/linux/v4l2-controls.h            |  2 ++
 4 files changed, 46 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 8002893f1c36..893aec08afab 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -120,6 +120,18 @@ values programmed by the register sequences. The default values of these
 controls shall be 0 (disabled). Especially these controls shall not be inverted,
 independently of the sensor's mounting rotation.
 
+Binning
+-------
+
+Binning has traditionally been configured using :ref:`the compose selection
+rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING_FACTORS
+<image_source_control_binning_factors>` control is also available for binning
+configuration and users should use it when it's available. Drivers supporting
+the control shall also support the compose rectangle, albeit the rectangle may
+be read-only when the control is present.
+
+Binning isn't affected by flipping.
+
 .. _media_using_camera_sensor_drivers_embedded_data:
 
 Embedded data
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index a9fd1458e391..d4f33e50ef97 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -163,3 +163,33 @@ Image Source Control IDs
     interface for metadata streams. The control is used in conjunction with
     :ref:`generic metadata formats <media-bus-format-generic-meta>` formats to
     specify the layout of the data.
+
+.. _image_source_control_binning_factors:
+
+``V4L2_CID_BINNING_FACTORS (integer menu)``
+
+    This control determines horizontal and vertical binning factors. Binning
+    combines several horizontal, vertical or both pixel values into a single
+    pixel. It is a way to scale an image. Binning typically produces fairly good
+    quality output.
+
+    Determines both horizontal and vertical binning factors for a camera
+    sensor. The values are encoded in the following way:
+
+.. flat-table::
+    :header-rows:  1
+    :stub-columns: 0
+
+    * - Bits
+      - Synopsis
+    * - 48--63
+      - Horizontal binning numerator.
+    * - 32--47
+      - Horizontal binning denominator.
+    * - 16--31
+      - Vertical binning numerator.
+    * - 0--15
+      - Vertical binning denominator.
+
+For instance, a value of ``0x0003000100030002`` indicates binning by 3
+(horizontally) * 3/2 (vertically).
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 950fb714dd5d..b1b852884545 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1161,6 +1161,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_CFA_PATTERN:		return "Color Filter Array Pattern";
 	case V4L2_CID_CFA_PATTERN_FLIP:		return "CFA Pattern Flip";
 	case V4L2_CID_METADATA_LAYOUT:		return "Metadata Layout";
+	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1440,6 +1441,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_HDR_SENSOR_MODE:
 		*type = V4L2_CTRL_TYPE_MENU;
 		break;
+	case V4L2_CID_BINNING_FACTORS:
 	case V4L2_CID_LINK_FREQ:
 		*type = V4L2_CTRL_TYPE_INTEGER_MENU;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index b61b047cf991..235a7e2b005f 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1273,6 +1273,8 @@ enum v4l2_jpeg_chroma_subsampling {
 
 #define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
 
+#define V4L2_CID_BINNING_FACTORS		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 13)
+
 /* Image processing controls */
 
 #define V4L2_CID_IMAGE_PROC_CLASS_BASE		(V4L2_CTRL_CLASS_IMAGE_PROC | 0x900)
-- 
2.47.3

