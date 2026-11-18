Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008532;
	b=fnt/RV+Y0auZ4UKcs7D2UDXv0eSg5d/CN79YDuNVz10lKwOaKJFjNVc2P9AWwJnm4M49
	 BSbBw29/NaE4zgHvTgBNi5dwUrOFbqMW8WLXHN3ZhT99egugF9Caq4Y+dfXuwcQDLWhag
	 MujOh+LjQrznyNCR7UI20S3VqfPTttE7rdgCBG8Q1EjqDQfc+q1ZnFhOknvJGEBOjFIsR
	 07t8vv650H3iInA0TDZf1pgORYfAtAFB1cnJaBC9ghR+95Kwkq7mnyRYfbfnWxxyUv2C8
	 WE8RPP5JUSl15k+TfgL5LiCOu+v1Z+v2AU9/gODe8wdlonPmGbDdYNGJ4ik80BX1OIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008532;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=6o2qcpX7UDrrT/V6Jmdn2VSf4d6cKwFftIvk7vYIgFI=;
	b=m70f0HLu9D0r5c0AUcbyz1ePTLxioQlofpuPNbzD/XKdnYxfmxxpKKMNxhziBlERdHIN
	 408VWJFAEt2IQBZePZHmAbPnp7MAP6qbktqWTOUAbEuIMivx4i5oMWojVPbibNAmF5/qy
	 cdYgY9gCETqViruCqzdES40+WIHI34wd4436G02X6VSX2IdfOUc3UGFaIiD2beuLtrJcK
	 G/Kiy3zm7fp+VG8s7qruaITsKS19Rg2KA2jKheEZesbpMS2xFQMBxGyav2zJXZOKZqOgc
	 qq7T2rsjOJAH6qmFZyyDbDhk57sfMowc6TME8M9S0+wBifgLHO3QMxIdOgjw60XGkmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="eQb45/x2";
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DE360A2615
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13DE360A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eQb45/x2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008531; x=1826544531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I6R/kmILG/640dUddAutSWiOChJ9WsLsvrQbC8/JGoY=;
  b=eQb45/x2/QaZwVsHHczyfFcIeAIQ8l6p+l6mpz1v650qrcL6OGWmmYHt
   ZAmhCEh1/RsidwhC9Gw6OWB/3C+hUlmuN8dBpW0TWnDu6d2oqPdlCjN7O
   uepyI4iiCCZo5ju7bsTVAWl6CquLY6L4sOYxfG0ctTdn9O+yTqem3jcoU
   2HwO89uotTnIc1jwRhFToT5lXxBrwPyMiIzls9BkoCUFoq74KcWimh/vF
   A94b10NhpNqA03ks64H7WoI/zxAtzU0xNzT69jDkxCpMTzFR43wyxgodS
   S1iuzxiTRtD8h8j7QHLzdyFlsrmFhPPamkD5BQNYuvZ44EgiCsyEFunju
   w==;
X-CSE-ConnectionGUID: 2lMJVYa/TsqoTAYc7HENKA==
X-CSE-MsgGUID: 84I8WB1yRQKvjCexviZ1jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738873"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738873"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:47 -0800
X-CSE-ConnectionGUID: I73a3jFGQtCIvzaRjiAmnQ==
X-CSE-MsgGUID: QFNOcS6eTMmtxAgB09eJLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076069"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:40 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1181B122C6C;
	Wed, 18 Nov 2026 15:28:21 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000teC-30PF;
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
Subject: [PATCH v13 67/73] media: v4l2-common: Add helper function media_bus_fmt_to_csi2_(bpp|dt)()
Date: Wed, 18 Nov 2026 15:28:13 +0200
Message-ID: <20261118132819.213473-68-sakari.ailus@linux.intel.com>
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

From: Frank Li <Frank.Li@nxp.com>

Add helper function media_bus_fmt_to_csi2_bpp() to get media bus fmt's bpp
to reduce codes such as

	static const struct imx7_csi_pixfmt pixel_formats[] = {
        {
                .fourcc = V4L2_PIX_FMT_UYVY,
                .codes  = IMX_BUS_FMTS(
                        MEDIA_BUS_FMT_UYVY8_2X8,
                        MEDIA_BUS_FMT_UYVY8_1X16
                ),
                .yuv    = true,
                .bpp    = 16,
        },
	....

.bpp can be removed from pixel_formats with this helper function.

CSI2 data type is defined by MIPI Camera Serial Interface 2 Spec Ver4.1.
See section 9.4.

Add helper function media_bus_fmt_to_csi2_dt() to convert media bus fmt to
MIPI defined data type and avoid below duplicated static array in each CSI2
drivers.

	{
		.code = MEDIA_BUS_FMT_UYVY8_1X16,
		.data_type = MIPI_CSI2_DT_YUV422_8B,
	}

Only add known map for dt type. Need update media_bus_fmt_info when new
mapping used.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
[Sakari Ailus: Add generic raw formats with bit depths 8, 10, 12 and 14.]
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 187 ++++++++++++++++++++++++++
 include/media/mipi-csi2.h             |  24 ++++
 2 files changed, 211 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 35eafde9d73b..a13f2f1ce269 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -46,6 +46,7 @@
 #include <linux/uaccess.h>
 #include <asm/io.h>
 #include <asm/div64.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
@@ -928,3 +929,189 @@ int v4l2_sensor_fll_llp_set(struct v4l2_ctrl *fll, struct v4l2_ctrl *vblank,
 					exposure_max);
 }
 EXPORT_SYMBOL_GPL(v4l2_sensor_fll_llp_set);
+
+/**
+ * struct media_bus_fmt_info - information about a media bus format
+ * @code: media bus format identifier (MEDIA_BUS_FMT_*)
+ * @dt: data type define in MIPI spec (MIPI_CSI2_DT *)
+ * @bpp: bit width per pixel, which is suffix from MEDIA_BUS_FMT_*, no pad. no
+ *	 compressed data.
+ */
+struct media_bus_fmt_info {
+	u32 code;
+	u8 dt;
+	u8 bpp;
+};
+
+static const struct media_bus_fmt_info media_bus_fmt_info[] = {
+	{ .code = MEDIA_BUS_FMT_RGB444_1X12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB565_1X16, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_BGR565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_BGR565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB666_1X18, .bpp = 18 },
+	{ .code = MEDIA_BUS_FMT_RGB666_2X9_BE, .bpp = 18 },
+	{ .code = MEDIA_BUS_FMT_BGR666_1X18, .bpp = 18 },
+	{ .code = MEDIA_BUS_FMT_RBG888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_BGR666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB565_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG, .bpp = 21 },
+	{ .code = MEDIA_BUS_FMT_BGR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_BGR888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_GBR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB888_2X12_BE, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB888_2X12_LE, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB888_3X8_DELTA, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG, .bpp = 28 },
+	{ .code = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA, .bpp = 28 },
+	{ .code = MEDIA_BUS_FMT_RGB666_1X30_CPADLO, .bpp = 30 },
+	{ .code = MEDIA_BUS_FMT_RGB888_1X30_CPADLO, .bpp = 30 },
+	{ .code = MEDIA_BUS_FMT_ARGB8888_1X32, .bpp = 32 },
+	{ .code = MEDIA_BUS_FMT_RGB888_1X32_PADHI, .bpp = 32 },
+	{ .code = MEDIA_BUS_FMT_RGB101010_1X30, .bpp = 30 },
+	{ .code = MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG, .bpp = 35 },
+	{ .code = MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA, .bpp = 35 },
+	{ .code = MEDIA_BUS_FMT_RGB666_1X36_CPADLO, .bpp = 36 },
+	{ .code = MEDIA_BUS_FMT_RGB888_1X36_CPADLO, .bpp = 36 },
+	{ .code = MEDIA_BUS_FMT_RGB121212_1X36, .bpp = 36 },
+	{ .code = MEDIA_BUS_FMT_RGB161616_1X48, .bpp = 48 },
+
+	{ .code = MEDIA_BUS_FMT_Y8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_UV8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1_5X8, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_VYUY8_1_5X8, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_YUYV8_1_5X8, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_YVYU8_1_5X8, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_VYUY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_YUYV8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_YVYU8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_Y10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_VYUY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_YUYV10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_YVYU10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_Y12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_UYVY12_2X12, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_VYUY12_2X12, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_YUYV12_2X12, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_YVYU12_2X12, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_Y14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_Y16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_VYUY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_YUYV8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_YVYU8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_YDYUYDYV8_1X16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_VYUY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_YUYV10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_YVYU10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_VUY8_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_YUV8_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_UYYVYY8_0_5X24, .dt = MIPI_CSI2_DT_YUV420_8B, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_UYVY12_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_VYUY12_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_YUYV12_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_YVYU12_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_YUV10_1X30, .bpp = 30 },
+	{ .code = MEDIA_BUS_FMT_UYYVYY10_0_5X30, .bpp = 15 },
+	{ .code = MEDIA_BUS_FMT_AYUV8_1X32, .bpp = 32 },
+	{ .code = MEDIA_BUS_FMT_UYYVYY12_0_5X36, .bpp = 18 },
+	{ .code = MEDIA_BUS_FMT_YUV12_1X36, .bpp = 36 },
+	{ .code = MEDIA_BUS_FMT_YUV16_1X48, .bpp = 48 },
+	{ .code = MEDIA_BUS_FMT_UYYVYY16_0_5X48, .bpp = 24 },
+
+	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_RAW_8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_BE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_LE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_SGBRG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_SGRBG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_SRGGB10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_RAW_10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SGBRG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SGRBG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_RAW_12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SBGGR14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_SGBRG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_SGRBG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_SRGGB14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_RAW_14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_SBGGR16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SGBRG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SGRBG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SRGGB16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
+
+	{ .code = MEDIA_BUS_FMT_JPEG_1X8, .bpp = 8 },
+
+	{ .code = MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8, .bpp = 8 },
+
+	{ .code = MEDIA_BUS_FMT_AHSV8888_1X32, .bpp = 32 },
+
+	{ .code = MEDIA_BUS_FMT_META_8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_META_10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_META_12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_META_14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_META_16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_META_20, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_META_24, .bpp = 24 },
+};
+
+static const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_fmt)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(media_bus_fmt_info); i++) {
+		if (media_bus_fmt_info[i].code == bus_fmt)
+			return &media_bus_fmt_info[i];
+	}
+
+	return NULL;
+}
+
+int media_bus_fmt_to_csi2_dt(u32 bus_fmt)
+{
+	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
+
+	if (!info)
+		return -EINVAL;
+
+	/* Check bpp because 0 (MIPI_CSI2_DT_FS) is a valid data type code */
+	return info->bpp ? info->dt : -EINVAL;
+}
+EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_dt);
+
+int media_bus_fmt_to_csi2_bpp(u32 bus_fmt)
+{
+	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
+
+	if (!info)
+		return -EINVAL;
+
+	return info->bpp ? info->bpp : -EINVAL;
+}
+EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_bpp);
diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
index 40fc0264250d..86601c9824bc 100644
--- a/include/media/mipi-csi2.h
+++ b/include/media/mipi-csi2.h
@@ -8,6 +8,8 @@
 #ifndef _MEDIA_MIPI_CSI2_H
 #define _MEDIA_MIPI_CSI2_H
 
+#include <linux/types.h>
+
 /* Short packet data types */
 #define MIPI_CSI2_DT_FS			0x00
 #define MIPI_CSI2_DT_FE			0x01
@@ -44,4 +46,26 @@
 #define MIPI_CSI2_DT_RAW20		0x2f
 #define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
 
+/**
+ * media_bus_fmt_to_csi2_dt - Get MIPI CSI2 data type from media bus format
+ *
+ * @bus_fmt: media bus format identifier (MEDIA_BUS_FMT_*)
+ *
+ * Return: MIPI CSI2 data type MIPI_CSI2_DT_*, or -EINVAL if no mbus code is
+ * found..
+ */
+int media_bus_fmt_to_csi2_dt(u32 bus_fmt);
+
+/**
+ * media_bus_fmt_to_csi2_bpp - Get media bus format's bit depth
+ *
+ * @bus_fmt: media bus format identifier (MEDIA_BUS_FMT_*)
+ *
+ * Return: bit depth, -EINVAL if fail to get from bus_fmt.
+ *
+ * Notes: this bpp is suffix from MEDIA_BUS_FMT_*, no pad, not for compressed
+ * data.
+ */
+int media_bus_fmt_to_csi2_bpp(u32 bus_fmt);
+
 #endif /* _MEDIA_MIPI_CSI2_H */
-- 
2.47.3

