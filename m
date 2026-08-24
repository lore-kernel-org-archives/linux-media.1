Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247CF411FBB
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573688; cv=none; b=MQ71eCIqJK93OpvnxNo2HeA5HR6utsvY12vghwnX9WoGN8fV1e1TUXJ1GRrzpbtFbHweudTmOH5zfv3Lz2N4WaQ300EAW30XvhKJvqkf7nnk1w8kCSqMGr/0v23oDecq3sPz8XBXe0d8qU7HL3ZrZIedzODabroEAMD1ppy1B0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573688; c=relaxed/simple;
	bh=62+6LIfyQA76tGX109/EkM3Zo8+JoY00bnlh3ZP7aJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MhQ9rQ3q/T3p8W+jtH0q/b2BAuqIV5qK40PyzSDLDPpKU1HL8W39hqoTs/11lAKNahtxWT8M8oZplrUJdEdKNLOBBBVwZEOS6bTu68Upv8IkOZqS6ok5CWO7tTr17VM3qpKUVPGAjC3hURBaK2stPC86MdLwuo5xdOG3Tql02ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PI2DKJY5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PI2DKJY5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573687; x=1819109687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=62+6LIfyQA76tGX109/EkM3Zo8+JoY00bnlh3ZP7aJg=;
  b=PI2DKJY5ufQca5wbHGX2hAfsEIhIAQ+mlGLuGX8EvOjLxqQOwkF3ZDnW
   iwrWoDLPMck+CnjU5F4GZoB9Qm6EwxtFxVd2vxTAoVxdPwGCc3To6EwT+
   /EzefDgFvawT4mNVT79Efg26CkIOjBWgOY4A2KMVJ87zHYsiv6mxM0kFf
   36tbekDWw7+Xz0JH6nON37KdUm0yXk/kNDq3BmPv6iFrOcwuuzUbQeL7y
   re25mWlSI3rN0PeFKdUiUpWQob3OMtFwSfFQRW8i6mhirO/JOqv409945
   B5qJ30571+pIDzdTD782mdDfEQFwssJ0/3Su4ci9buNO4KCnF+EGYLmOb
   Q==;
X-CSE-ConnectionGUID: hfca6ZHMS2ShJj70sa7JVg==
X-CSE-MsgGUID: 3hWOPvtWRxWepOYELKHbnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036465"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036465"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:43 -0700
X-CSE-ConnectionGUID: kK8uVgQkQfaW9gGCU1nD0w==
X-CSE-MsgGUID: osWUdGMcScSuLWo49BLiyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787640"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:41 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 56491121BEC;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E38a-1p5e;
	Mon, 24 Aug 2026 15:14:51 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: [PATCH v3 01/29] media: v4l2-common: Add helper function media_bus_fmt_to_csi2_(bpp|dt)()
Date: Mon, 24 Aug 2026 15:14:23 +0300
Message-ID: <20260824121451.3348583-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
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
Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 183 ++++++++++++++++++++++++++
 include/media/mipi-csi2.h             |  24 ++++
 2 files changed, 207 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 65db7340ad38..f9e7e730c42e 100644
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
@@ -867,3 +868,185 @@ struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
 	return clk_hw->clk;
 }
 EXPORT_SYMBOL_GPL(__devm_v4l2_sensor_clk_get);
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
+	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SGBRG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SGRBG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SBGGR14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_SGBRG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_SGRBG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_SRGGB14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
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
+	{ .code = MEDIA_BUS_FMT_META_8, .dt = MIPI_CSI2_DT_EMBEDDED_8B, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_META_10, .dt = MIPI_CSI2_DT_EMBEDDED_8B, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_META_12, .dt = MIPI_CSI2_DT_EMBEDDED_8B, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_META_14, .dt = MIPI_CSI2_DT_EMBEDDED_8B, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_META_16, .dt = MIPI_CSI2_DT_EMBEDDED_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_META_20, .dt = MIPI_CSI2_DT_EMBEDDED_8B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_META_24, .dt = MIPI_CSI2_DT_EMBEDDED_8B, .bpp = 24 },
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

