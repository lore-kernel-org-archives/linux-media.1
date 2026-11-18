Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008531;
	b=hJdyo2tJ8e8dRqx+AyaiAYwqBBn3l5x/mymLSkr88qe33xsSKwGXkLE7BzFAe1Yj/z5n
	 RJjQZ2ht3QRCDQEZ2AwxVXZJVtX+Vx0ecmtbX+8rfWPxSFi1/0+Cdpa7huJ06XH6Vj6DK
	 KkfceZlpI//VaRC3n5D/VcBG3A8Gmdv5j8HsBumlKQuDjLo+q/VZLeyKDFTK2Ug1Y/pIz
	 AgSC0xkJz4aAbMyXndL8JR975q35S/L8/5Lkc4tM8QTKfHhhN9s6G2KkN8LCn3HUddDHd
	 NV3xojU0fjOcx5y6qBFPk8ICQkQVyA56pM5fW3vw64bJ0e3RLGIvgyTE5w+08UzsC8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008531;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=957e2A/bujzB1V6W+NA1Ipl15XO/irnhIX7X1vwJa60=;
	b=TF+5nBPdZoALw61l7ky6wuJ8vFEsOzY3P1ogCc78LwyjDk1in19gr1OOlgUsM7A/mz50
	 U5fzTumyp1fYtwGhvRVCH2rePF4wKeFogYOgsE3mqcD+nR++vXRVO5FD3Hhd9V2uB2P+K
	 3QwhCADF0HbF+eCbnaeK9C7BZSvWYS9SYK6Z0FuX1ZqIZ3EjquROKQYkfWGBkClF5wV3Q
	 roZm3z2RXm+l3HktIvBkKoNLC75AjINcEvhp6IXw4Xo2LHsySt+8X5+8/O1udTjn9DtUS
	 ST4Oa12ZnNe12AR3GlRoSLMhcb1+XzyOV0w0HrtacWPALWpm6WNJuvTDOvFZYX7dvVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QT2mdFdY;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CADE60A2616
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CADE60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QT2mdFdY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008531; x=1826544531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tZDQwb64QNFrtbiHokZjPUDOASruYx7JhjLXC3Qshz8=;
  b=QT2mdFdYuW6l22vMdM2kzMBzPYwcjlNXW+fzYtmALSi87v6VEGrjXTmf
   XH3HnKNNAaoitDxDphXfXdLSQnnMoqTBjVfvKbQ0m1rNgq1Pqneg1ZEE5
   If9Ys3A2I3/UBupCix1pMY9XXOZsu3yJ/0Rx9gHN/km6u8Qhiw/Laoo8Z
   M+1hdvB0r9v2SlT/Hz0zt4XujBWMg+OG908OnzKr9gd0/srMtBC3sgmN0
   1Mumr2UZ4A3UAmHJsXu375UOulE3ErpZnBo+eQzDSKgX/ATVxK5M6Kyrv
   mISacFlzZq9CwqSejx2oEzSIhuSlSR8EdYGpfTf+3cw2hOM13b4FGZswH
   w==;
X-CSE-ConnectionGUID: 4keFNqg/SLWXbA9O3EhKrw==
X-CSE-MsgGUID: 1yzJOKxoQimqufN/GsFzlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738886"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738886"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:48 -0800
X-CSE-ConnectionGUID: Z17vNjivQlmkSY4uf3v2VA==
X-CSE-MsgGUID: 5DU+B0K4Qf+2IJ1PHjehtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076071"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:40 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 28904122D42;
	Wed, 18 Nov 2026 15:28:21 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000teg-3O7S;
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
Subject: [PATCH v13 73/73] media: uapi: Add generic CSI-2 raw pixelformats for 16, 20, 24 and 28 bpp
Date: Wed, 18 Nov 2026 15:28:19 +0200
Message-ID: <20261118132819.213473-74-sakari.ailus@linux.intel.com>
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

Add generic raw pixelformats for bit depths 16, 20, 24 and 28. These
formats are CSI-2 packed, apart from the 16-bit and 24-bit formats.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/v4l/pixfmt-raw-generic.rst          | 169 +++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   3 +
 include/uapi/linux/videodev2.h                |   3 +
 3 files changed, 172 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
index 88cde68bf3ef..9ccb750b8e4f 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
-************************************************************************************************************************************************************************************************************************************************************
-V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10 ('RACA'), V4L2_PIX_FMT_RAW_CSI2_12 ('RACC'), V4L2_PIX_FMT_RAW_CSI2_14 ('RACE'), V4L2_PIX_FMT_RAW_10 ('RAWA'), V4L2_PIX_FMT_RAW_12 ('RAWC'), V4L2_PIX_FMT_RAW_14 ('RAWE'), V4L2_PIX_FMT_RAW_16 ('RAWG')
-************************************************************************************************************************************************************************************************************************************************************
+****************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
+V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10 ('RACA'), V4L2_PIX_FMT_RAW_CSI2_12 ('RACC'), V4L2_PIX_FMT_RAW_CSI2_14 ('RACE'), V4L2_PIX_FMT_RAW_10 ('RAWA'), V4L2_PIX_FMT_RAW_12 ('RAWC'), V4L2_PIX_FMT_RAW_14 ('RAWE'), V4L2_PIX_FMT_RAW_16 ('RAWG'), V4L2_PIX_FMT_RAW_CSI2_20 ('RACK'), V4L2_PIX_FMT_RAW_24 ('RAWO'), V4L2_PIX_FMT_RAW_CSI2_28 ('RACS')
+****************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
 
 
 Generic line-based raw image data formats
@@ -335,3 +335,166 @@ Each cell is one byte. "P" denotes a pixel.
       - P\ :sub:`31 bits 15--8`
 
 .. _v4l2-pix-fmt-raw-csi2-20:
+
+V4L2_PIX_FMT_RAW_CSI2_20
+------------------------
+
+V4L2_PIX_FMT_RAW_CSI2_20 contains 20-bit packed image data, with four bytes
+containing the top 8 bits of two pixels followed by lowest 4 bits of the pixels
+packed into one byte. This format is typically used by CSI-2 receivers with a
+source that transmits MEDIA_BUS_FMT_RAW_20 and the CSI-2 receiver writes the
+received data to memory as-is.
+
+The packing of the data follows the MIPI CSI-2 specification.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_20.**
+Each cell is one byte. "P" denotes a pixel.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{2cm}
+
+.. flat-table:: Sample 4x2 Image Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8 8 8 8 8
+
+    * - start + 0:
+      - P\ :sub:`00 bits 19--12`
+      - P\ :sub:`00 bits 11--4`
+      - P\ :sub:`10 bits 19--12`
+      - P\ :sub:`10 bits 11--4`
+      - P\ :sub:`10 bits 3--0` (bits 7--4),
+        P\ :sub:`00 bits 3--0` (bits 3--0)
+      - P\ :sub:`20 bits 19--12`
+      - P\ :sub:`20 bits 11--4`
+      - P\ :sub:`30 bits 19--12`
+      - P\ :sub:`30 bits 11--4`
+      - P\ :sub:`30 bits 3--0` (bits 7--4),
+        P\ :sub:`20 bits 3--0` (bits 3--0)
+    * - start + 10:
+      - P\ :sub:`01 bits 19--12`
+      - P\ :sub:`01 bits 11--4`
+      - P\ :sub:`11 bits 19--12`
+      - P\ :sub:`11 bits 11--4`
+      - P\ :sub:`11 bits 3--0` (bits 7--4),
+        P\ :sub:`01 bits 3--0` (bits 3--0)
+      - P\ :sub:`21 bits 19--12`
+      - P\ :sub:`21 bits 11--4`
+      - P\ :sub:`31 bits 19--12`
+      - P\ :sub:`31 bits 11--4`
+      - P\ :sub:`31 bits 3--0` (bits 7--4),
+        P\ :sub:`21 bits 3--0` (bits 3--0)
+
+.. _v4l2-pix-fmt-raw-24:
+
+V4L2_PIX_FMT_RAW_24
+-------------------
+
+V4L2_PIX_FMT_RAW_24 contains 24-bit packed image data, with each three bytes
+containing the value of one pixel. This format is typically used by CSI-2
+receivers with a source that transmits MEDIA_BUS_FMT_RAW_24 and the CSI-2
+receiver writes the received data to memory as-is.
+
+The packing of the data follows the MIPI CSI-2 specification.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_24.**
+Each cell is one byte. "P" denotes a pixel.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
+
+.. flat-table:: Sample 4x2 Image Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8 8 8 8 8 8 8
+
+    * - start + 0:
+      - P\ :sub:`00 bits 23--16`
+      - P\ :sub:`00 bits 15--8`
+      - P\ :sub:`00 bits 7--0`
+      - P\ :sub:`10 bits 23--16`
+      - P\ :sub:`10 bits 15--8`
+      - P\ :sub:`10 bits 7--0`
+      - P\ :sub:`20 bits 23--16`
+      - P\ :sub:`20 bits 15--8`
+      - P\ :sub:`20 bits 7--0`
+      - P\ :sub:`30 bits 23--16`
+      - P\ :sub:`30 bits 15--8`
+      - P\ :sub:`30 bits 7--0`
+    * - start + 12:
+      - P\ :sub:`01 bits 23--16`
+      - P\ :sub:`01 bits 15--8`
+      - P\ :sub:`01 bits 7--0`
+      - P\ :sub:`11 bits 23--16`
+      - P\ :sub:`11 bits 15--8`
+      - P\ :sub:`11 bits 7--0`
+      - P\ :sub:`21 bits 23--16`
+      - P\ :sub:`21 bits 15--8`
+      - P\ :sub:`21 bits 7--0`
+      - P\ :sub:`31 bits 23--16`
+      - P\ :sub:`31 bits 15--8`
+      - P\ :sub:`31 bits 7--0`
+
+.. _v4l2-pix-fmt-raw-csi2-28:
+
+V4L2_PIX_FMT_RAW_CSI2_28
+------------------------
+
+V4L2_PIX_FMT_RAW_CSI2_28 contains 28-bit packed image data, with four bytes
+containing the top 8 bits of two pixels followed by lowest 4 bits of the pixels
+packed into one byte. This format is typically used by CSI-2 receivers with a
+source that transmits MEDIA_BUS_FMT_RAW_28 and the CSI-2 receiver writes the
+received data to memory as-is.
+
+The packing of the data follows the MIPI CSI-2 specification.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_28.**
+Each cell is one byte. "P" denotes a pixel.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}
+
+.. flat-table:: Sample 4x2 Image Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8 8 8 8 8 8 8 8 8
+
+    * - start + 0:
+      - P\ :sub:`00 bits 27--20`
+      - P\ :sub:`00 bits 13--6`
+      - P\ :sub:`10 bits 27--20`
+      - P\ :sub:`10 bits 13--6`
+      - P\ :sub:`00 bits 19--14` (bits 7--2),
+	P\ :sub:`00 bits 1--0` (bits 1--0)
+      - P\ :sub:`00 bits 5--2` (bits 7--4),
+	P\ :sub:`10 bits 17--14` (bits 3--0)
+      - P\ :sub:`10 bits 19--18` (bits 7--6),
+	P\ :sub:`10 bits 5--0` (bits 5--0)
+      - P\ :sub:`20 bits 27--20`
+      - P\ :sub:`20 bits 13--6`
+      - P\ :sub:`30 bits 27--20`
+      - P\ :sub:`30 bits 13--6`
+      - P\ :sub:`20 bits 19--14` (bits 7--2),
+	P\ :sub:`20 bits 1--0` (bits 1--0)
+      - P\ :sub:`20 bits 5--2` (bits 7--4),
+	P\ :sub:`30 bits 17--14` (bits 3--0)
+      - P\ :sub:`30 bits 19--18` (bits 7--6),
+	P\ :sub:`30 bits 5--0` (bits 5--0)
+    * - start + 14:
+      - P\ :sub:`01 bits 27--20`
+      - P\ :sub:`01 bits 13--6`
+      - P\ :sub:`11 bits 27--20`
+      - P\ :sub:`11 bits 13--6`
+      - P\ :sub:`01 bits 19--14` (bits 7--2),
+	P\ :sub:`01 bits 1--0` (bits 1--0)
+      - P\ :sub:`01 bits 5--2` (bits 7--4),
+	P\ :sub:`11 bits 17--14` (bits 3--0)
+      - P\ :sub:`11 bits 19--18` (bits 7--6),
+	P\ :sub:`11 bits 5--0` (bits 5--0)
+      - P\ :sub:`21 bits 27--20`
+      - P\ :sub:`21 bits 13--6`
+      - P\ :sub:`31 bits 27--20`
+      - P\ :sub:`31 bits 13--6`
+      - P\ :sub:`21 bits 19--14` (bits 7--2),
+	P\ :sub:`21 bits 1--0` (bits 1--0)
+      - P\ :sub:`21 bits 5--2` (bits 7--4),
+	P\ :sub:`31 bits 17--14` (bits 3--0)
+      - P\ :sub:`31 bits 19--18` (bits 7--6),
+	P\ :sub:`31 bits 5--0` (bits 5--0)
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 131ca3f85a83..1a71f56f951b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1442,6 +1442,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_RAW_12:	descr = "12-bit Raw"; break;
 	case V4L2_PIX_FMT_RAW_14:	descr = "14-bit Raw"; break;
 	case V4L2_PIX_FMT_RAW_16:	descr = "16-bit Raw"; break;
+	case V4L2_PIX_FMT_RAW_CSI2_20:	descr = "20-bit Raw, CSI-2 Packed"; break;
+	case V4L2_PIX_FMT_RAW_24:	descr = "24-bit Raw"; break;
+	case V4L2_PIX_FMT_RAW_CSI2_28:	descr = "28-bit Raw, CSI-2 Packed"; break;
 	case V4L2_PIX_FMT_RAW_CRU20:	descr = "14-bit Raw CRU Packed"; break;
 	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
 	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 74052ecbe780..6b884f8af5c4 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -754,6 +754,9 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_RAW_12 v4l2_fourcc('R', 'A', 'W', 'C')
 #define V4L2_PIX_FMT_RAW_14 v4l2_fourcc('R', 'A', 'W', 'E')
 #define V4L2_PIX_FMT_RAW_16 v4l2_fourcc('R', 'A', 'W', 'G')
+#define V4L2_PIX_FMT_RAW_CSI2_20 v4l2_fourcc('R', 'A', 'C', 'K')
+#define V4L2_PIX_FMT_RAW_24 v4l2_fourcc('R', 'A', 'W', 'O')
+#define V4L2_PIX_FMT_RAW_CSI2_28 v4l2_fourcc('R', 'A', 'C', 'S')
 
 /* HSV formats */
 #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
-- 
2.47.3

