Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008549;
	b=YoamFpPjYsR48Ry6ccy4QhkdVYDs4mgvd7oJ4Pm6wI3LMeQn1vZrmJe9VQwrSwXQzux0
	 OIDyuKXxvANJugPyre1MAB94zJLfN6TU++NIp5nWNkSCtSaZVusozGJZijdOURRMM7feA
	 HmTdsNI1gnK0gmn9Zq0oV0xRSYlpF1EMTbR7LV+SbhxPX9umtFE6q1dOm2VFjB5g8GkLo
	 /TwS4iNzhPrDmdW0fGocXXeHVN0o7npF83KVXlH8d9olT2naoplb01nw9ni0UNGggzH8W
	 cyydlmBYVlsYQHhK/5q65e8bj1owTMgsy9aCwA/HH9DTB5oHB739KOl3B2F8+6WOxxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008549;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=FmqbpGoxySm1B4cAdcxZUCqe1SXOxGXAZwD16dnSQGQ=;
	b=fiLjtiNAfWOVzp+j/ADVlkexwDBI9gHzNXrUgLsJmf+s9itnHjf0salIY3/pZa9G/7Ss
	 VcAplku0YtiUFVOsCcZwYg0bDiq1Tkp2fSYVqLfXkeHfQWFzZ9Dh3cZQgEq90cJ1K1ct0
	 S0CGCcc+XZRRVqUz/+HBgfsAOJbHlaJuUAW212oXo8WUz/tuAuBxfP1wYlVXD2lrXWCgn
	 8pvXqVpaS5Fsxf8F/zXeWzFEXKrxZCazj3n1a0jv9LGtfzU4AAAqe3RyNM8CxEZyBHHPe
	 j14LX5Mkdo0Z5KTQ/OSLjOumWw4vxfWepNPQGgo1xYFWI5nMB3UeEjy2l1cSXbNAtpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Re6YQkmp;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7430760A262C
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7430760A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Re6YQkmp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008549; x=1826544549;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JcE8ClzGY2+0QTG0bxTV6KwrFbPNiK+0ObVg8kKV9+g=;
  b=Re6YQkmpYypNlvI6dK3Fe2d94izDpOQf7zV7myuVJgNk6KbMYVNA/EV8
   OP7OXWySxeFiA3/4Uv/8Wh4TfL1KaLC3jmMzzdPwNQVdPSCLc8nNtK3Cx
   gD1k+KDx5xafTowbKscYvx0aR06DNjlFnz878ouJtFxasZXBFHylpewDk
   TnJxhUJN3M3AKk280hbjxFNDTZOvxaVjRqlwrztdaAAtXaD9K6iJDZQ1N
   EpTzQ2nhnJtds3EwzZA+z5WOCAWiaWI7cWyz9RlY+HwxIajALSi75rvh+
   cUQMGmUO6KjOrlkCRaUjtjflpIKOa7ntnDpxfoh3qnhVHBRcVorioqPhO
   g==;
X-CSE-ConnectionGUID: WwXonfRnSByMOGdvyLRKmA==
X-CSE-MsgGUID: lBGyeBuQQjKphb3PQIz0aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3809001"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3809001"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:29:05 -0800
X-CSE-ConnectionGUID: qiCbRuL+TuSIpEHg4jvvKw==
X-CSE-MsgGUID: MKpaoJHyQb+GSXoYfrWsKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376798"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AE42F1230E8;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tcL-1MIr;
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
Subject: [PATCH v13 42/73] media: uapi: Add generic raw pixelformats for 10, 12 and 14 bits
Date: Wed, 18 Nov 2026 15:27:48 +0200
Message-ID: <20261118132819.213473-43-sakari.ailus@linux.intel.com>
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

Add generic raw pixelformats for bit depths 10, 12 and 14 unpacked to 16
bits.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/pixfmt-raw-generic.rst          | 123 +++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   3 +
 include/uapi/linux/videodev2.h                |   3 +
 3 files changed, 126 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
index 708aa17b80b0..1599ce26f698 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
-************************************************************************************************************************************
-V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10 ('RACA'), V4L2_PIX_FMT_RAW_CSI2_12 ('RACC'), V4L2_PIX_FMT_RAW_CSI2_14 ('RACE')
-************************************************************************************************************************************
+******************************************************************************************************************************************************************************************************************************
+V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10 ('RACA'), V4L2_PIX_FMT_RAW_CSI2_12 ('RACC'), V4L2_PIX_FMT_RAW_CSI2_14 ('RACE'), V4L2_PIX_FMT_RAW_10 ('RAWA'), V4L2_PIX_FMT_RAW_12 ('RAWC'), V4L2_PIX_FMT_RAW_14 ('RAWE')
+******************************************************************************************************************************************************************************************************************************
 
 
 Generic line-based raw image data formats
@@ -175,3 +175,120 @@ Each cell is one byte. "P" denotes a pixel.
         P\ :sub:`11 bits 5--2` (bits 3--0)
       - P\ :sub:`31 bits 5--0` (bits 7--2),
         P\ :sub:`21 bits 5--4` (bits 1--0)
+
+.. _v4l2-pix-fmt-raw-10:
+
+V4L2_PIX_FMT_RAW_10
+-------------------
+
+V4L2_PIX_FMT_RAW_10 contains 10-bit image data, with each two consecutive
+bytes forming a pixel value. This format is typically used by CSI-2 receivers
+with a source that transmits MEDIA_BUS_FMT_RAW_10 and the CSI-2 receiver writes
+the received data to memory unpacked.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_10.**
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
+      - P\ :sub:`00 bits 9--8` (bits 1--0)
+      - P\ :sub:`10 bits 7--0`
+      - P\ :sub:`10 bits 9--8` (bits 1--0)
+      - P\ :sub:`20 bits 7--0`
+      - P\ :sub:`20 bits 9--8` (bits 1--0)
+      - P\ :sub:`30 bits 7--0`
+      - P\ :sub:`30 bits 9--8` (bits 1--0)
+    * - start + 8:
+      - P\ :sub:`01 bits 7--0`
+      - P\ :sub:`01 bits 9--8` (bits 1--0)
+      - P\ :sub:`11 bits 7--0`
+      - P\ :sub:`11 bits 9--8` (bits 1--0)
+      - P\ :sub:`21 bits 7--0`
+      - P\ :sub:`21 bits 9--8` (bits 1--0)
+      - P\ :sub:`31 bits 7--0`
+      - P\ :sub:`31 bits 9--8` (bits 1--0)
+
+.. _v4l2-pix-fmt-raw-12:
+
+V4L2_PIX_FMT_RAW_12
+-------------------
+
+V4L2_PIX_FMT_RAW_12 contains 12-bit image data, with each two consecutive
+bytes forming a pixel value. This format is typically used by CSI-2 receivers
+with a source that transmits MEDIA_BUS_FMT_RAW_12 and the CSI-2 receiver writes
+the received data to memory unpacked.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_12.**
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
+      - P\ :sub:`00 bits 11--8` (bits 3--0)
+      - P\ :sub:`10 bits 7--0`
+      - P\ :sub:`10 bits 11--8` (bits 3--0)
+      - P\ :sub:`20 bits 7--0`
+      - P\ :sub:`20 bits 11--8` (bits 3--0)
+      - P\ :sub:`30 bits 7--0`
+      - P\ :sub:`30 bits 11--8` (bits 3--0)
+    * - start + 8:
+      - P\ :sub:`01 bits 7--0`
+      - P\ :sub:`01 bits 11--8` (bits 3--0)
+      - P\ :sub:`11 bits 7--0`
+      - P\ :sub:`11 bits 11--8` (bits 3--0)
+      - P\ :sub:`21 bits 7--0`
+      - P\ :sub:`21 bits 11--8` (bits 3--0)
+      - P\ :sub:`31 bits 7--0`
+      - P\ :sub:`31 bits 11--8` (bits 3--0)
+
+.. _v4l2-pix-fmt-raw-14:
+
+V4L2_PIX_FMT_RAW_14
+-------------------
+
+V4L2_PIX_FMT_RAW_14 contains 14-bit image data, with each two consecutive
+bytes forming a pixel value. This format is typically used by CSI-2 receivers
+with a source that transmits MEDIA_BUS_FMT_RAW_14 and the CSI-2 receiver writes
+the received data to memory unpacked.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_14.**
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
+      - P\ :sub:`00 bits 13--8` (bits 5--0)
+      - P\ :sub:`10 bits 7--0`
+      - P\ :sub:`10 bits 13--8` (bits 5--0)
+      - P\ :sub:`20 bits 7--0`
+      - P\ :sub:`20 bits 13--8` (bits 5--0)
+      - P\ :sub:`30 bits 7--0`
+      - P\ :sub:`30 bits 13--8` (bits 5--0)
+    * - start + 8:
+      - P\ :sub:`01 bits 7--0`
+      - P\ :sub:`01 bits 13--8` (bits 5--0)
+      - P\ :sub:`11 bits 7--0`
+      - P\ :sub:`11 bits 13--8` (bits 5--0)
+      - P\ :sub:`21 bits 7--0`
+      - P\ :sub:`21 bits 13--8` (bits 5--0)
+      - P\ :sub:`31 bits 7--0`
+      - P\ :sub:`31 bits 13--8` (bits 5--0)
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 5c4cd5bd65b1..01ba6ddc885b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1438,6 +1438,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_RAW_CSI2_10:	descr = "10-bit Raw, CSI-2 Packed"; break;
 	case V4L2_PIX_FMT_RAW_CSI2_12:	descr = "12-bit Raw, CSI-2 Packed"; break;
 	case V4L2_PIX_FMT_RAW_CSI2_14:	descr = "14-bit Raw, CSI-2 Packed"; break;
+	case V4L2_PIX_FMT_RAW_10:	descr = "10-bit Raw"; break;
+	case V4L2_PIX_FMT_RAW_12:	descr = "12-bit Raw"; break;
+	case V4L2_PIX_FMT_RAW_14:	descr = "14-bit Raw"; break;
 	case V4L2_PIX_FMT_RAW_CRU20:	descr = "14-bit Raw CRU Packed"; break;
 	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
 	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c9dfd51bd328..1209c9f457ab 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -750,6 +750,9 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_RAW_CSI2_10 v4l2_fourcc('R', 'A', 'C', 'A')
 #define V4L2_PIX_FMT_RAW_CSI2_12 v4l2_fourcc('R', 'A', 'C', 'C')
 #define V4L2_PIX_FMT_RAW_CSI2_14 v4l2_fourcc('R', 'A', 'C', 'E')
+#define V4L2_PIX_FMT_RAW_10 v4l2_fourcc('R', 'A', 'W', 'A')
+#define V4L2_PIX_FMT_RAW_12 v4l2_fourcc('R', 'A', 'W', 'C')
+#define V4L2_PIX_FMT_RAW_14 v4l2_fourcc('R', 'A', 'W', 'E')
 
 /* HSV formats */
 #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
-- 
2.47.3

