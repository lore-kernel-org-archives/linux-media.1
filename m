Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008541;
	b=dmLizxUa51X6nI4ahDDEupCt//F0tDHRuQSncJarHMgXrXI6oq8SgbTNy2YqaVg4C8vf
	 Q+FHPXm3+fU3kB9yK5oKknAm2E3L9ZNvzERjgbzu84VIB5msuPXBErSCrnh5mKi3axg2Y
	 MZNYtpc0EzqSsBt57GsGMSl+05r+lMuXkvvpI21OKZQVOmgo4DcNJZ/g4k/oXc12AudRr
	 baSNnMEUXfYEkJ4tmCHs3hkJLB7AJhGtJqSW6n9bjmvEQYk3kGAiK6tx8YDfUX6Awe22i
	 CXnRm2bQWvEeL7lW5ipqnRqnHcxZALIkYVk/j96cipHCQTdN+9OvffzhryqHT8pDDeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008541;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=02xi9ArYOBxqv/n+uOri8qILu+XBnoCOoDCXSJHW7x4=;
	b=RZu+hXaX4Qkj0s9MMnfEQ4NmcaJOE6Hb3XvLg6Hbwag1pca4hYoLiXMSESc8Ym3kJJBg
	 6gsR+6Def5RAQJvnLPHKVbeVudlSkQOc844tXuGZ36Xm4zvdxHxTj8w8PZRVBUYvh71zE
	 VjX7ofqyS/qhHcbbKEJi3qPCH0JYqFNSy3UqUZJ7wAz8zvlzvCM/kZHTNgeRs/K9ncHY+
	 b03Z7OslFwX04I9M6lGc9AzmLk9tzf44rieb3u/WVr5DrrTxtyTNyeyb7gKWNfoSumv1S
	 r6nBxnyyOIvSREuBVYi04GHG7iD0lwgPgC5+ko8UHJmxbEllZN6C1bkQNRq1+HKdLkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c3GYyFS5;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A20060A2625
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A20060A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c3GYyFS5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008541; x=1826544541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wf4c32AvD6EOM2rWHVB0GX64b5nUqKdbVs616iH81js=;
  b=c3GYyFS5N9PVKFtUQh6yyXmIgM3jc5dCT1Sy5bFbedDaNijKCvnbz07D
   j6FAbujbj1Z1IAmz4O/kIvx7L5K2EbTopO/Ksmqa6x9sd6poUqF7dk8Ld
   oZLvIuQuvW2NGe2j/ZmueUziksZyD1bB60uYVWVeUeoBxt8WksWstwDGc
   BXcUGxd4gXusa9QGNrUtptQ91RQxd9adDCtNIvA4btFuHOoao3/ZBJrqq
   7sFK4I0VCerOzarIT529gsgB07PT+BiJopXG5Y0uIB7HpcDet9WFfa7oV
   JW11O+HcWcp/JkVxMpgV+B7b1yM75OinV23BzaFuBlr88ldvF1UsNs7KD
   w==;
X-CSE-ConnectionGUID: s+C9fPcpQXKS8XvLo/kwJw==
X-CSE-MsgGUID: +a6z1pMaReq5HT+C7oSMXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808752"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808752"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:57 -0800
X-CSE-ConnectionGUID: VhPLRgsTQ8m74rrSaxD0yQ==
X-CSE-MsgGUID: i0oEFut3RAW6g9c5J++Ghg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376713"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:49 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 51924122E8E;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000taj-3xY6;
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
Subject: [PATCH v13 17/73] media: uapi: Correct generic CSI-2 metadata format 4cc
Date: Wed, 18 Nov 2026 15:27:23 +0200
Message-ID: <20261118132819.213473-18-sakari.ailus@linux.intel.com>
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

Rework the pixelformat 4cc for CSI-2 generic metadata, the 16- and 24-bit
variants are not specific to CSI-2. This can be done as no driver uses
this yet and the interface is disabled.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/metafmt-generic.rst             | 40 +++++++++----------
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |  8 ++--
 include/uapi/linux/videodev2.h                | 12 +++---
 4 files changed, 30 insertions(+), 32 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
index 7226b4810088..07147b4d0dd2 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-generic.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
@@ -2,7 +2,7 @@
 .. c:namespace:: V4L
 
 ********************************************************************************************************************************************************************************************************************************************************************************
-V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_META_FMT_GENERIC_CSI2_12 ('MC1C'), V4L2_META_FMT_GENERIC_CSI2_14 ('MC1E'), V4L2_META_FMT_GENERIC_CSI2_16 ('MC1G'), V4L2_META_FMT_GENERIC_CSI2_20 ('MC1K'), V4L2_META_FMT_GENERIC_CSI2_24 ('MC1O')
+V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MECA'), V4L2_META_FMT_GENERIC_CSI2_12 ('MECC'), V4L2_META_FMT_GENERIC_CSI2_14 ('MECE'), V4L2_META_FMT_GENERIC_16 ('METG'), V4L2_META_FMT_GENERIC_CSI2_20 ('MECK'), V4L2_META_FMT_GENERIC_24 ('METO')
 ********************************************************************************************************************************************************************************************************************************************************************************
 
 
@@ -29,7 +29,7 @@ is used on CSI-2 for 8 bits per :term:`Data Unit`.
 
 Additionally it is used for 16 bits per Data Unit when two bytes of metadata are
 packed into one 16-bit Data Unit. Otherwise the 16 bits per pixel dataformat is
-:ref:`V4L2_META_FMT_GENERIC_CSI2_16 <v4l2-meta-fmt-generic-csi2-16>`.
+:ref:`V4L2_META_FMT_GENERIC_16 <v4l2-meta-fmt-generic-16>`.
 
 **Byte Order Of V4L2_META_FMT_GENERIC_8.**
 Each cell is one byte. "M" denotes a byte of metadata.
@@ -112,8 +112,8 @@ the data is defined in the MIPI CCS specification.
 
 This format is also used in conjunction with 24 bits per :term:`Data Unit`
 formats that pack two bytes of metadata into one Data Unit. Otherwise the
-24 bits per pixel dataformat is :ref:`V4L2_META_FMT_GENERIC_CSI2_24
-<v4l2-meta-fmt-generic-csi2-24>`.
+24 bits per pixel dataformat is :ref:`V4L2_META_FMT_GENERIC_24
+<v4l2-meta-fmt-generic-24>`.
 
 This format is little endian.
 
@@ -185,16 +185,15 @@ Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
       - x
       - x
 
-.. _v4l2-meta-fmt-generic-csi2-16:
+.. _v4l2-meta-fmt-generic-16:
 
-V4L2_META_FMT_GENERIC_CSI2_16
------------------------------
+V4L2_META_FMT_GENERIC_16
+------------------------
 
-V4L2_META_FMT_GENERIC_CSI2_16 contains 8-bit generic metadata packed in 16-bit
-Data Units, with one padding byte after every byte of metadata. This format is
-typically used by CSI-2 receivers with a source that transmits
-MEDIA_BUS_FMT_META_16 and the CSI-2 receiver writes the received data to memory
-as-is.
+V4L2_META_FMT_GENERIC_16 contains 8-bit generic metadata packed in 16-bit Data
+Units, with one padding byte after every byte of metadata. This format is also
+used by CSI-2 receivers with a source that transmits MEDIA_BUS_FMT_META_16 and
+the CSI-2 receiver writes the received data to memory as-is.
 
 The packing of the data follows the MIPI CSI-2 specification and the padding of
 the data is defined in the MIPI CCS specification.
@@ -205,7 +204,7 @@ Some devices support more efficient packing of metadata in conjunction with
 
 This format is little endian.
 
-**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_16.**
+**Byte Order Of V4L2_META_FMT_GENERIC_16.**
 Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
 
 .. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|
@@ -287,16 +286,15 @@ Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
       - x
       - x
 
-.. _v4l2-meta-fmt-generic-csi2-24:
+.. _v4l2-meta-fmt-generic-24:
 
-V4L2_META_FMT_GENERIC_CSI2_24
------------------------------
+V4L2_META_FMT_GENERIC_24
+------------------------
 
-V4L2_META_FMT_GENERIC_CSI2_24 contains 8-bit generic metadata packed in 24-bit
-Data Units, with two padding bytes after every byte of metadata. This format is
-typically used by CSI-2 receivers with a source that transmits
-MEDIA_BUS_FMT_META_24 and the CSI-2 receiver writes the received data to memory
-as-is.
+V4L2_META_FMT_GENERIC_24 contains 8-bit generic metadata packed in 24-bit Data
+Units, with two padding bytes after every byte of metadata. This format is also
+used by CSI-2 receivers with a source that transmits MEDIA_BUS_FMT_META_24 and
+the CSI-2 receiver writes the received data to memory as-is.
 
 The packing of the data follows the MIPI CSI-2 specification and the padding of
 the data is defined in the MIPI CCS specification.
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 129016e57446..165c840e92a3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -105,7 +105,7 @@ const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10, true },
 	{ V4L2_META_FMT_GENERIC_CSI2_12, 12, 12, MEDIA_BUS_FMT_META_12,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12, true },
-	{ V4L2_META_FMT_GENERIC_CSI2_16, 16, 16, MEDIA_BUS_FMT_META_16,
+	{ V4L2_META_FMT_GENERIC_16, 16, 16, MEDIA_BUS_FMT_META_16,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16, true },
 };
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 13139ebf71f3..5c4cd5bd65b1 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1491,9 +1491,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_14:	descr = "8-bit Generic Meta, 14b CSI-2"; break;
-	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8-bit Generic Meta, 16b CSI-2"; break;
+	case V4L2_META_FMT_GENERIC_16:	descr = "8-bit Generic Meta, 16b"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8-bit Generic Meta, 20b CSI-2"; break;
-	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8-bit Generic Meta, 24b CSI-2"; break;
+	case V4L2_META_FMT_GENERIC_24:	descr = "8-bit Generic Meta, 24b"; break;
 
 	default:
 		/* Compressed formats */
@@ -1581,9 +1581,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_META_FMT_GENERIC_CSI2_10:
 		case V4L2_META_FMT_GENERIC_CSI2_12:
 		case V4L2_META_FMT_GENERIC_CSI2_14:
-		case V4L2_META_FMT_GENERIC_CSI2_16:
+		case V4L2_META_FMT_GENERIC_16:
 		case V4L2_META_FMT_GENERIC_CSI2_20:
-		case V4L2_META_FMT_GENERIC_CSI2_24:
+		case V4L2_META_FMT_GENERIC_24:
 			fmt->flags |= V4L2_FMT_FLAG_META_LINE_BASED;
 			break;
 		default:
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c9aa21e1a870..9cdb0fa3120b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -905,12 +905,12 @@ struct v4l2_pix_format {
  * adding new ones!
  */
 #define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
-#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
-#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
-#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'C', '1', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
-#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
-#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
-#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'E', 'C', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'E', 'C', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'E', 'C', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_16	v4l2_fourcc('M', 'E', 'T', 'G') /* Generic 16-bit 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'E', 'C', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_24	v4l2_fourcc('M', 'E', 'T', 'O') /* Generic 24-bit 8-bit metadata */
 #endif
 
 /* priv field value to indicates that subsequent fields are valid. */
-- 
2.47.3

