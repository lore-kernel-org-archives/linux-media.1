Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008532;
	b=UD0X1aqnEJ/Zh24Wx5eCqNn47VxCV5T+96l6WEjvg3nndHVvN+zx8vScD7k9gnSNlhAK
	 TkrkINzPkE78W7GDkCDAnIOcgTfGny+LTxqpldFpQqyIoQ57YTHu9XKsIdo80RWBr0BaO
	 yNVtHsqmW4Kgc1S2ozmLNL0LZH8/VaW9Ae6LzKBfuJJNgH8kRh/0cukfRKgo+gMmKn+wm
	 7xswun9UcjeGrPY2EazqRY+SfLBXamhL9JqSwMDUsfiEh+euU2tAJBz6OSp69LnYuOd3Q
	 d1pJDdy6Us/U7D2IdQnR3HNuu+OMySQg+GK5tlH6RitomQychPAK9rQBUUPIBW/+ruw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008532;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=PnaKhWvL1ddEbQvav7g3UaknzYuC3c/OKrVvaE8Gr1g=;
	b=gYmvG5PdegRhfuGmtZJ/qOBEoWyLvHzXrg1C5Ds0YwfQmtgrb0al4NCJQ/dZJzoX5H2K
	 w9VNzGh/hrrtVs9fJkjVqVp04V1qiKAgqqTjg/7yFyeTNQo/hJxWpQwB3/MxByUbW3JIQ
	 hQDQPDaRkAgCDNajYAslhFspUje1u1FVlZ0Sa8ojqTPYHplAGcE/oDLhZbL7xEf/2xjm8
	 otK4oL0EfUn/Sl8g1R5MXoEZn02xG6TZmKbVPOLDAbHCoet6WrDj7Gm5fZAzHvZiiSjIQ
	 02Xe3qandMUVCkbO4KYZzriYWchjajVlRDCC4XR94zCkFOripFLdSumVp+0/mIPmBVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IKCYuiy4;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5248060A2628
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5248060A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IKCYuiy4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008532; x=1826544532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=syvx4oGMLwGmkaszSjWCV2zb5yctaqcqfJA7jPktxco=;
  b=IKCYuiy4wecrakJFSsZVUjFlYA9Ym32ax/9MF+He412Ixi+Nj1NXPYQe
   jinPk3p0wcuOEIh70Ezh50viRSY2VX2TVXHSTBMTAE34KYtEbO/kxqlJI
   TUYYJavar+LPKgAMmzHXGkvCxAsIY91mbpfP5zUCOfN8sSS5QFTPQELBk
   59XCij+RssiEwy55tPU5ngMPaKTQPGopU1ZtfeKv9KZP9t8WFvJnDEuvD
   CMxIvBOxv9KKe3YtUdr4mM/mUjoAxUOIove9GNhm/ZoSXQqlOVRj3nmO0
   fjZ0qmoWsIPBZmjxXqCuv9jApk4L8wJfpb+9MQqAkAV3VgXhdRpLWEHZv
   Q==;
X-CSE-ConnectionGUID: G/3BwAh7SH+aN5Wxiw0N+A==
X-CSE-MsgGUID: 68GVK5RATsu6NDXNQTxw3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738945"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738945"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:48 -0800
X-CSE-ConnectionGUID: oscjha8vRMGxKR9yRwr04w==
X-CSE-MsgGUID: mXmSWhmGQkWXAYqhARekXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076081"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:40 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 14442121D4C;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000tZp-2tAS;
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
Subject: [PATCH v13 03/73] media: uapi: Add generic CSI-2 raw pixelformats
Date: Wed, 18 Nov 2026 15:27:09 +0200
Message-ID: <20261118132819.213473-4-sakari.ailus@linux.intel.com>
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

Add generic raw pixelformats for bit depths 8, 10, 12 and 14. These
formats are CSI-2 packed, apart from the 8-bit format.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/pixfmt-raw-generic.rst          | 175 ++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt.rst        |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +
 include/uapi/linux/videodev2.h                |   6 +
 4 files changed, 186 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
new file mode 100644
index 000000000000..254f8f18c7c5
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
@@ -0,0 +1,175 @@
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+
+************************************************************************************************************************************
+V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10 ('RACA'), V4L2_PIX_FMT_RAW_CSI2_12 ('RACC'), V4L2_PIX_FMT_RAW_CSI2_14 ('RACE')
+************************************************************************************************************************************
+
+
+Generic line-based raw image data formats
+
+
+Description
+===========
+
+These generic raw image data formats define the memory layout of the data without
+defining the order of the colour components or even the colour components
+themselves.
+
+.. _v4l2-pix-fmt-raw-8:
+
+V4L2_PIX_FMT_RAW_8
+------------------
+
+The V4L2_PIX_FMT_RAW_8 format is a plain 8-bit raw pixel data format. This
+format is used on CSI-2 for 8 bits per :term:`Data Unit`.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_8.**
+Each cell is one byte. "P" denotes a pixel.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|
+
+.. flat-table:: Sample 4x2 Image Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8
+
+    * - start + 0:
+      - P\ :sub:`00`
+      - P\ :sub:`10`
+      - P\ :sub:`20`
+      - P\ :sub:`30`
+    * - start + 4:
+      - P\ :sub:`01`
+      - P\ :sub:`11`
+      - P\ :sub:`21`
+      - P\ :sub:`31`
+
+.. _v4l2-pix-fmt-raw-csi2-10:
+
+V4L2_PIX_FMT_RAW_CSI2_10
+------------------------
+
+V4L2_PIX_FMT_RAW_CSI2_10 contains 10-bit packed image data, with four bytes
+containing the top 8 bits of the pixels followed by lowest 2 bits of the pixels
+packed into one byte. This format is typically used by CSI-2 receivers with
+a source that transmits MEDIA_BUS_FMT_RAW_10 and the CSI-2 receiver writes the
+received data to memory as-is.
+
+The packing of the data follows the MIPI CSI-2 specification.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_10.**
+Each cell is one byte. "P" denotes a pixel.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{2cm}|
+
+.. flat-table:: Sample 4x2 Image Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8
+
+    * - start + 0:
+      - P\ :sub:`00 bits 9--2`
+      - P\ :sub:`10 bits 9--2`
+      - P\ :sub:`20 bits 9--2`
+      - P\ :sub:`30 bits 9--2`
+      - P\ :sub:`00 bits 1--0` (bits 1--0),
+        P\ :sub:`10 bits 1--0` (bits 3--2),
+        P\ :sub:`20 bits 1--0` (bits 5--4),
+        P\ :sub:`30 bits 1--0` (bits 7--6)
+    * - start + 5:
+      - P\ :sub:`01 bits 9--2`
+      - P\ :sub:`11 bits 9--2`
+      - P\ :sub:`21 bits 9--2`
+      - P\ :sub:`31 bits 9--2`
+      - P\ :sub:`01 bits 1--0` (bits 1--0),
+        P\ :sub:`11 bits 1--0` (bits 3--2),
+        P\ :sub:`21 bits 1--0` (bits 5--4),
+        P\ :sub:`31 bits 1--0` (bits 7--6)
+
+.. _v4l2-pix-fmt-raw-csi2-12:
+
+V4L2_PIX_FMT_RAW_CSI2_12
+------------------------
+
+V4L2_PIX_FMT_RAW_CSI2_12 contains 12-bit packed image data, with two bytes
+containing the top 8 bits of the pixels followed by lowest 4 bits of the pixels
+packed into 1 byte. This format is typically used by CSI-2 receivers with
+a source that transmits MEDIA_BUS_FMT_RAW_12 and the CSI-2 receiver writes the
+received data to memory as-is.
+
+The packing of the data follows the MIPI CSI-2 specification.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_12.**
+Each cell is one byte. "P" denotes a pixel.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{2cm}|p{1.2cm}|p{1.2cm}|p{2cm}|
+
+.. flat-table:: Sample 4x2 Image Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8
+
+    * - start + 0:
+      - P\ :sub:`00 bits 11--4`
+      - P\ :sub:`10 bits 11--4`
+      - P\ :sub:`00 bits 3--0` (bits 3--0),
+        P\ :sub:`10 bits 3--0` (bits 7--4)
+      - P\ :sub:`20 bits 11--4`
+      - P\ :sub:`30 bits 11--4`
+      - P\ :sub:`20 bits 3--0` (bits 3--0),
+        P\ :sub:`30 bits 3--0` (bits 7--4)
+    * - start + 6:
+      - P\ :sub:`01 bits 11--4`
+      - P\ :sub:`11 bits 11--4`
+      - P\ :sub:`01 bits 3--0` (bits 3--0),
+        P\ :sub:`11 bits 3--0` (bits 7--4)
+      - P\ :sub:`21 bits 11--4`
+      - P\ :sub:`31 bits 11--4`
+      - P\ :sub:`21 bits 3--0` (bits 3--0),
+        P\ :sub:`31 bits 3--0` (bits 7--4)
+
+.. _v4l2-pix-fmt-raw-csi2-14:
+
+V4L2_PIX_FMT_RAW_CSI2_14
+------------------------
+
+V4L2_PIX_FMT_RAW_CSI2_14 contains 14-bit packed image data, with four bytes
+containing the top 8 bits of the pixels followed by lowest 6 bits of the pixels
+packed into three bytes. This format is typically used by CSI-2 receivers with a
+source that transmits MEDIA_BUS_FMT_RAW_14 and the CSI-2 receiver writes the
+received data to memory as-is.
+
+The packing of the data follows the MIPI CSI-2 specification.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_14.**
+Each cell is one byte. "P" denotes a pixel.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{2cm}|p{2cm}|p{2cm}|
+
+.. flat-table:: Sample 4x2 Image Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8 8
+
+    * - start + 0:
+      - P\ :sub:`00 bits 13--6`
+      - P\ :sub:`10 bits 13--6`
+      - P\ :sub:`20 bits 13--6`
+      - P\ :sub:`30 bits 13--6`
+      - P\ :sub:`10 bits 1--0` (bits 7--6),
+        P\ :sub:`00 bits 5--0` (bits 5--0)
+      - P\ :sub:`20 bits 3--0` (bits 7--4),
+        P\ :sub:`10 bits 5--2` (bits 3--0)
+      - P\ :sub:`30 bits 5--0` (bits 7--2),
+        P\ :sub:`20 bits 5--4` (bits 1--0)
+    * - start + 7:
+      - P\ :sub:`01 bits 13--6`
+      - P\ :sub:`11 bits 13--6`
+      - P\ :sub:`21 bits 13--6`
+      - P\ :sub:`31 bits 13--6`
+      - P\ :sub:`11 bits 1--0` (bits 7--6),
+        P\ :sub:`01 bits 5--0` (bits 5--0)
+      - P\ :sub:`21 bits 3--0` (bits 7--4),
+        P\ :sub:`11 bits 5--2` (bits 3--0)
+      - P\ :sub:`31 bits 5--0` (bits 7--2),
+        P\ :sub:`21 bits 5--4` (bits 1--0)
diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Documentation/userspace-api/media/v4l/pixfmt.rst
index 71b29267488f..520a8ec438c9 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
@@ -26,6 +26,7 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
     pixfmt-indexed
     pixfmt-rgb
     pixfmt-bayer
+    pixfmt-raw-generic
     yuv-formats
     hsv-formats
     depth-formats
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 17ba1ae70735..13139ebf71f3 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1434,6 +1434,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
 	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_RAW_8:	descr = "8-bit Raw"; break;
+	case V4L2_PIX_FMT_RAW_CSI2_10:	descr = "10-bit Raw, CSI-2 Packed"; break;
+	case V4L2_PIX_FMT_RAW_CSI2_12:	descr = "12-bit Raw, CSI-2 Packed"; break;
+	case V4L2_PIX_FMT_RAW_CSI2_14:	descr = "14-bit Raw, CSI-2 Packed"; break;
 	case V4L2_PIX_FMT_RAW_CRU20:	descr = "14-bit Raw CRU Packed"; break;
 	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
 	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fa..c9aa21e1a870 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -745,6 +745,12 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR.. BGBG.. */
 #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG.. GBGB.. */
 
+/* Generic CSI-2 packed raw pixel formats */
+#define V4L2_PIX_FMT_RAW_8 v4l2_fourcc('R', 'A', 'W', '8')
+#define V4L2_PIX_FMT_RAW_CSI2_10 v4l2_fourcc('R', 'A', 'C', 'A')
+#define V4L2_PIX_FMT_RAW_CSI2_12 v4l2_fourcc('R', 'A', 'C', 'C')
+#define V4L2_PIX_FMT_RAW_CSI2_14 v4l2_fourcc('R', 'A', 'C', 'E')
+
 /* HSV formats */
 #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
 #define V4L2_PIX_FMT_HSV32 v4l2_fourcc('H', 'S', 'V', '4')
-- 
2.47.3

