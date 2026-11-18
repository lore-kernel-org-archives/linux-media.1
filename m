Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008534;
	b=IMbdG4md3kCt4cgrZkMzPCpr1rFB0JstQ250RKDlwIn8UqB9P5RyKTkpPSIfkkPadkR1
	 4A+sYbYAN3lYGrP4WckntSYLhUJz7b4f3QUC3uCX5jkDNgpXGGeg+RYacKEiXO+JoWS7/
	 NGXq0iwD1GamxeYFrIcbtI7tIJrVTK3qZhhYK55R9ck00femkTokz+SVSuZ4atWEJTUT/
	 3D+o2jaRH6OHin29AEn0SG867/axUMckR1Ridha9tkBwHrnGIyIM786Mp1VgEdIRtHLp7
	 nOfb299WkZWFXmjLp8hBqaTmwj99PM/sqBZb1KxFSYKhNNWiZvmW9gfvmLgl2dWJ4iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008534;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=5UJpxJhLkerNB/7/PXCOG7hFJUT0V92tMmAhYGYmuGE=;
	b=koPAT82Ka8IF6P3snL/SoVbHwPypiDDXNfFzEQ+0q4pY+PIGrDIwPiX3jNLjKEFT/AAw
	 K8hNDFKbj+55+CG8D+EwDnMHAPOPEQupaTx7bbIVXSVlJGLVfew2JExYRV3R0uKXUjJUJ
	 5hdHsgruAdr+xEGzsWAyZLYF8yMddZs2+yAApXiWm2MUVkyrVMWDLdMGyrtLkzbQ7cuEz
	 oHt3ZX4/A2Jt3BBEQrh8NsVLJ87o+ZDDFD2+uN4P3D657VArwXiCZMe/L3U7wGmF1sC1Z
	 hHSgSclWzJdDvEZytmQgj3lZoCJ9qBiI1lP2eOuEE8OIDq0yHuugVYXXOyiy5RVI0WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QRXbkKxV;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E799060A2628
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E799060A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QRXbkKxV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008534; x=1826544534;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HG96XDZpfumEpIDIQRgmvAa/Ul0p2Ebu5PprzZhpHmA=;
  b=QRXbkKxV1UOWPPkbk2D8177VBp+fd7jJoDBoJOS7eVIViWyHK/S7eUyh
   C82j8zuIzdNlnjlxuUmDgyuhldiigkEwA8PI1Y/O/iXG3DHPGiZRLmDzR
   rNBeWK6uPqMu7DslEfvGeusdz334p7KwEH+0EDnD4Qw1HQC9lqi/qkWau
   BUfnzyJybNKDIUy4Lb47rgnw4WUV2Z+wbc7wEsBaKljYCVdGpoflUJRKU
   nvkArx9GkIHywwmQus84dpTHuLb2m+tA75O+F94woqBZs1qy8JpT40+mG
   xBeoy3LTu1OF6hOLOWnfuoYfLFV9a4reXUmLI0cLRIFgGhFBfaQFnvFv2
   w==;
X-CSE-ConnectionGUID: 9kxVXQmmSru+1SJ0AKiA3Q==
X-CSE-MsgGUID: dEuTblZJQx6M/pGKlbN6lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738988"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738988"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:48 -0800
X-CSE-ConnectionGUID: BSKXBd+LTf2rpVJYVlCf5g==
X-CSE-MsgGUID: ZycnFSyWSUGbRQSIFB46YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076088"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:41 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2333A122D4B;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000ta1-36bp;
	Wed, 18 Nov 2026 15:28:19 +0200
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
Subject: [PATCH v13 06/73] media: uapi: Add V4L2_CID_CFA_PATTERN for describing color patterns
Date: Wed, 18 Nov 2026 15:27:12 +0200
Message-ID: <20261118132819.213473-7-sakari.ailus@linux.intel.com>
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

Add V4L2_CID_CFA_PATTERN to tell the camera sensor's native Color Filter
Array (CFA) pattern.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 .../media/v4l/ext-ctrls-image-source.rst      | 43 +++++++++++++++++++
 .../media/v4l/subdev-formats.rst              |  2 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
 include/uapi/linux/v4l2-controls.h            |  6 +++
 4 files changed, 52 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index f9c0b7ad3b4e..d4ba8bd066f3 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -93,3 +93,46 @@ Image Source Control IDs
     representing a gain of exactly 1.0. For example, if this default value
     is reported as being (say) 128, then a value of 192 would represent
     a gain of exactly 1.5.
+
+``V4L2_CID_CFA_PATTERN (integer)``
+    This control determines the color components and native pixel order in the
+    sensor's CFA (Color Filter Array) when used in conjunction with
+    :ref:`generic raw mbus codes MEDIA_BUS_FMT_RAW_x (where 'x' is the bit
+    depth) <v4l2-mbus-pixelcode-generic-raw>` pixelcodes. The native pixel
+    order is constant for a given device, it is not affected by cropping or
+    flipping.
+
+    This control may only be used on V4L2 sub-devices.
+
+    This is a read-only control.
+
+    Available patterns:
+
+.. flat-table:: V4L2 Color Filter Array Patterns
+    :header-rows:  1
+    :stub-columns: 0
+    :widths:       1 2 1
+
+    * - Macro name
+      - Synopsis
+      - Value
+    * - V4L2_CFA_PATTERN_GRBG
+      - Bayer pattern (2x2 macroblocks). Each macroblock has a green filter in
+        the top-left and bottom-right pixels, a red filter in the top-right
+        pixel, and a blue filter in the bottom-left pixel.
+      - 0x00000000
+    * - V4L2_CFA_PATTERN_RGGB
+      - Bayer pattern (2x2 macroblocks). Each macroblock has a green filter in
+        the top-right and bottom-left pixels, a red filter in the top-left
+        pixel, and a blue filter in the bottom-right pixel.
+      - 0x00000001
+    * - V4L2_CFA_PATTERN_BGGR
+      - Bayer pattern (2x2 macroblocks). Each macroblock has a green filter in
+        the top-right and bottom-left pixels, a blue filter in the top-left
+        pixel, and a red filter in the bottom-right pixel.
+      - 0x00000002
+    * - V4L2_CFA_PATTERN_GBRG
+      - Bayer pattern (2x2 macroblocks). Each macroblock has a green filter in
+        the top-left and bottom-right pixels, a blue filter in the top-right
+        pixel, and a red filter in the bottom-left pixel.
+      - 0x00000003
diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index fecb786cb8af..7d34c2991f81 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -3855,6 +3855,8 @@ organization is given as an example for the first pixel only.
 
     \endgroup
 
+.. _v4l2-mbus-pixelcode-generic-raw:
+
 Generic raw formats on serial interfaces
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 66ec7b911e4f..85ebd025c630 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1158,6 +1158,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
 	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
 	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
+	case V4L2_CID_CFA_PATTERN:		return "Color Filter Array Pattern";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 6b97ee905c43..d948b2c0cf41 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1258,6 +1258,12 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
 #define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
 
+#define V4L2_CID_CFA_PATTERN			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
+#define V4L2_CFA_PATTERN_GRBG			0x00000000
+#define V4L2_CFA_PATTERN_RGGB			0x00000001
+#define V4L2_CFA_PATTERN_BGGR			0x00000002
+#define V4L2_CFA_PATTERN_GBRG			0x00000003
+
 
 /* Image processing controls */
 
-- 
2.47.3

