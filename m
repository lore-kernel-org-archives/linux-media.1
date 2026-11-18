Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008531;
	b=yG5vX7ebxksY8FcRUj24t2f8Z5rZa2HQwJsxA38vzMrZ1N9aqTRXtBo/YH1gth7b9oWs
	 Zf2K/ZPGdGDjB7ZNqnP2yXWwNw2Rqk73SNxDILLHweQNs4iImAyuISthWzyiYkOhGedLa
	 668tpq/Kay4F6JmK2CD22mla86fAtG/JKJZs3NS/HM0JBtT6UoCrTNtkyypB0XKFBj/38
	 wPQpZsavUc+Dt+8HxOIzjyATjOEOPuKkMBDXnQz1VA8pRN0/T+med3vBC1Z/vgw4KctyQ
	 9TerQ6XDsp7zYZqasDuHY1KRUItmRuFUGutK68riOC/v4KKtXcaWxpwCqMK6GoQmtMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008531;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=BGR6TpPkbhNtDNzykeQSXXjnTU2s+zMT0qkygMdI2+M=;
	b=iwJlXHwMAQll+D0pSQEdwHEaHQqEHC/dG9qOGyyB8Rqxx9YHuq0d/nhxKRtnhiN2ANcO
	 yjA/zySoBmyqvGOhr5blrsWrbno6afO8e5yu0+GmGt+AqaTuNt17Htw8B4dDHvoTYopQA
	 0dcMb0vi3Jftu7hATen7E0ECT8BsbcKMSmMFAAUEysd5Q32cO8ZSlHyKw13qk+qiX3BgA
	 IaXvtDHEl85pS9E3XgyDEUd5GHnmJSC5SDDoux2kq508hj6q7JcpvDCd1fBeW9PmoXSJD
	 ShpSVBhls4yhPbgnzaVq/jz9PhS/D2Rc3B529Hz3nz1rr3z6yNKYSK/qW4V9icHVVKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HU3tZhXG;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7FA60A2602
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C7FA60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HU3tZhXG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008531; x=1826544531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7+yODYIh63uD91LFiufE9D4wHf4m0/BqruDr3KdIOBk=;
  b=HU3tZhXGLmVrgodfP/sn62Ky/jqq9ChfI0Z4/JMdWp5B7Q1ZPynU/gXJ
   SA0NMs57Ie75pGy0vopOPUqVTN5upKxJ1wjQQUdZsvR/cHEI85mwAwkua
   /nUl+qOa3AFdtt0oYiSwmcwOjlDn+7eiZMW23AudhNdPw2XkxDzDp0qLi
   dcu3nxqslynjsEWhqBOd++TXJBVBqEVWofpW3lIrYJ8dSe8su6Bxb/nsM
   KgwYAZ3EK4todfhg6BE6VGwdCZXNFfYfVIk45+G7kAY0Up/WVgdFxqGlV
   qi2IPmZQQYBSv+cvkANuDvOK7Gddm8WsN+opgawkla+8LTaS8MxyVLyf8
   g==;
X-CSE-ConnectionGUID: 9DkEHurDR/Okiga3hrs8Qw==
X-CSE-MsgGUID: jlRQI+YHS022J8Moxr+OOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738898"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738898"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:48 -0800
X-CSE-ConnectionGUID: xGEKx4rITF+KoI2ngY1lhQ==
X-CSE-MsgGUID: KOZbwV6AQBWjiSZMOhJwDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076075"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:40 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 23F1C122D12;
	Wed, 18 Nov 2026 15:28:21 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000teb-3Jvi;
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
Subject: [PATCH v13 72/73] media: uapi: Add generic raw pixelformat for 16 bpp
Date: Wed, 18 Nov 2026 15:28:18 +0200
Message-ID: <20261118132819.213473-73-sakari.ailus@linux.intel.com>
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

Add generic raw pixelformats for bit depth 16.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/v4l/pixfmt-raw-generic.rst          | 49 +++++++++++++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
 include/uapi/linux/videodev2.h                |  1 +
 3 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
index 1599ce26f698..88cde68bf3ef 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
-******************************************************************************************************************************************************************************************************************************
-V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10 ('RACA'), V4L2_PIX_FMT_RAW_CSI2_12 ('RACC'), V4L2_PIX_FMT_RAW_CSI2_14 ('RACE'), V4L2_PIX_FMT_RAW_10 ('RAWA'), V4L2_PIX_FMT_RAW_12 ('RAWC'), V4L2_PIX_FMT_RAW_14 ('RAWE')
-******************************************************************************************************************************************************************************************************************************
+************************************************************************************************************************************************************************************************************************************************************
+V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10 ('RACA'), V4L2_PIX_FMT_RAW_CSI2_12 ('RACC'), V4L2_PIX_FMT_RAW_CSI2_14 ('RACE'), V4L2_PIX_FMT_RAW_10 ('RAWA'), V4L2_PIX_FMT_RAW_12 ('RAWC'), V4L2_PIX_FMT_RAW_14 ('RAWE'), V4L2_PIX_FMT_RAW_16 ('RAWG')
+************************************************************************************************************************************************************************************************************************************************************
 
 
 Generic line-based raw image data formats
@@ -292,3 +292,46 @@ Each cell is one byte. "P" denotes a pixel.
       - P\ :sub:`21 bits 13--8` (bits 5--0)
       - P\ :sub:`31 bits 7--0`
       - P\ :sub:`31 bits 13--8` (bits 5--0)
+
+.. _v4l2-pix-fmt-raw-16:
+
+V4L2_PIX_FMT_RAW_16
+-------------------
+
+V4L2_PIX_FMT_RAW_16 contains 16-bit image data, with each two consecutive
+bytes forming a pixel value. This format is typically used by CSI-2 receivers
+with a source that transmits MEDIA_BUS_FMT_RAW_16 and the CSI-2 receiver writes
+the received data to memory as-is.
+
+The packing of the data follows the MIPI CSI-2 specification.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_16.**
+Each cell is one byte. "P" denotes a pixel.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|
+
+.. flat-table:: Sample 4x2 Image Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8 8 8
+
+    * - start + 0:
+      - P\ :sub:`00 bits 7--0`
+      - P\ :sub:`00 bits 15--8`
+      - P\ :sub:`10 bits 7--0`
+      - P\ :sub:`10 bits 15--8`
+      - P\ :sub:`20 bits 7--0`
+      - P\ :sub:`20 bits 15--8`
+      - P\ :sub:`30 bits 7--0`
+      - P\ :sub:`30 bits 15--8`
+    * - start + 8:
+      - P\ :sub:`01 bits 7--0`
+      - P\ :sub:`01 bits 15--8`
+      - P\ :sub:`11 bits 7--0`
+      - P\ :sub:`11 bits 15--8`
+      - P\ :sub:`21 bits 7--0`
+      - P\ :sub:`21 bits 15--8`
+      - P\ :sub:`31 bits 7--0`
+      - P\ :sub:`31 bits 15--8`
+
+.. _v4l2-pix-fmt-raw-csi2-20:
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 01ba6ddc885b..131ca3f85a83 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1441,6 +1441,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_RAW_10:	descr = "10-bit Raw"; break;
 	case V4L2_PIX_FMT_RAW_12:	descr = "12-bit Raw"; break;
 	case V4L2_PIX_FMT_RAW_14:	descr = "14-bit Raw"; break;
+	case V4L2_PIX_FMT_RAW_16:	descr = "16-bit Raw"; break;
 	case V4L2_PIX_FMT_RAW_CRU20:	descr = "14-bit Raw CRU Packed"; break;
 	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
 	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 1209c9f457ab..74052ecbe780 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -753,6 +753,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_RAW_10 v4l2_fourcc('R', 'A', 'W', 'A')
 #define V4L2_PIX_FMT_RAW_12 v4l2_fourcc('R', 'A', 'W', 'C')
 #define V4L2_PIX_FMT_RAW_14 v4l2_fourcc('R', 'A', 'W', 'E')
+#define V4L2_PIX_FMT_RAW_16 v4l2_fourcc('R', 'A', 'W', 'G')
 
 /* HSV formats */
 #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
-- 
2.47.3

