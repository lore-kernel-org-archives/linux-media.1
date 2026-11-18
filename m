Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008522;
	b=Ofs8KhXWgFu6kkBct/+yy10aTvqC3zkhc/sZiZ7oa+M2YdFw6QEchpuVEvvWNg20lRl7
	 KE6zNIIu7WO+4jiTJFHvu41WhoyHiPftxwBve3YZ8BmNorlNP2pPlWBoq6700nDTfAaiC
	 cwVgtq8GPRqEJMuVOvh43WM3I1RCBMJmGDvuq9SoFMnpP47IpVDfurdGgoeKoMmoOUX06
	 7q6Pinrt8RShhTM7D2ClGKnlMr/Rq2lkIG+QLHgbRHBgfFJEfK2sXVC9RcvHkb9g5XkUl
	 a/DXwtl4otTqnrgQzNSDptTkGbo4x57+z2mDZajPS7sLdcpQ13GvQp3RO7kVM4o9YIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008522;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=jA/zy89DN0yho9LQj1ogTDjHoFWd/VSF8gsDVMmd7YM=;
	b=U1bXr7UuIqdlNhwMvGjbMjWps7sD21Kd3b+8kf21pMB1kMrg4c01HVLD4Q9sxUFk3g4p
	 kaRIbGl4TXXzNYw5xqeijwydZoT6PXxeiUNCX+4CV1t8QzOSG+lcG4NZE3erJ72pyL0YZ
	 IGU9mmMwGbdCheILHr54ux58C5GaWfIiNAhwbh6oVwnpyPdZaAOUmY2j0msQH3QsH+WmJ
	 xolZX128K+ymxCpbt+1DYfB5C5VbcEEb61wJPK1IrzeGAuS/lQxhZNmzWOkG5Iw7dOt2s
	 te5dyzuhaz5Emo8OPNzD3dRZ9+L2HjngA/yfFgDAI/QfR0UmfHrGMfHUJ3Pv3vsSaVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="oKqXh/dg";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D05606A337
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8D05606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oKqXh/dg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008522; x=1826544522;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BymWmYyWlFvYxWlKJQSTwHtYo6V2mlE5lNBFUzWVtfo=;
  b=oKqXh/dg8pJJFbMcsP0MQi98AmXcHgxC48d848D5hAt3Dk+3V0Bn97vO
   u8ucCXL7u/gNX5SAyotLJqNGVJsQco34ueaWA7xo09hrFb8Gc4Nj1+xfD
   doYrxHq5IXjm0kOfdw9YPbDlCRmqQCbJ/6v6x0V5DUKDH2dnwFpGy3Oro
   sW+Evaq5GDo4QPqAmyoiR04P+kPY7pQl3X0pc46uG+BbcanoKFjZKlDSs
   E5IoLv5s7UMeV/zFuqmoKXjpXG5hllItP+yBp7Fycx8/noJIIRVQggIZS
   NqhajSCOv484/Cifcsg6rQblVThYWwz2KkNqG3CaeVp2oGD8bAwSaQA1l
   A==;
X-CSE-ConnectionGUID: Tm7WcJznSb2yAG427/F/Nw==
X-CSE-MsgGUID: LkYvb8oYSx+gkcm7/3plgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3702737"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3702737"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:39 -0800
X-CSE-ConnectionGUID: wIj6oE0uSTmCHW2D92OUnw==
X-CSE-MsgGUID: yX2vq3EATxKN70nrfb2SgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10678032"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:31 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EF0F3122BF3;
	Wed, 18 Nov 2026 15:28:20 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tdi-2c4k;
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
Subject: [PATCH v13 61/73] media: imx219: Report streams using frame descriptors
Date: Wed, 18 Nov 2026 15:28:07 +0200
Message-ID: <20261118132819.213473-62-sakari.ailus@linux.intel.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Implement the .get_frame_desc() subdev operation to report information
about streams to the connected CSI-2 receiver. This is required to let
the CSI-2 receiver driver know about virtual channels and data types for
each stream.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 882dabe2f2d8..f61dd3a25ac6 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -23,6 +23,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -697,6 +698,24 @@ static void imx219_free_controls(struct imx219 *imx219)
  * Subdev operations
  */
 
+static unsigned int imx219_format_bpp(u32 code)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+		return 8;
+
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	default:
+		return 10;
+	}
+}
+
 static int imx219_set_framefmt(struct imx219 *imx219,
 			       struct v4l2_subdev_state *state)
 {
@@ -1090,6 +1109,34 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 	}
 }
 
+static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+	u32 code;
+
+	if (pad != IMX219_PAD_SOURCE)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					   IMX219_STREAM_IMAGE);
+	code = fmt->code;
+	v4l2_subdev_unlock_state(state);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	fd->entry[0].pixelcode = code;
+	fd->entry[0].stream = IMX219_STREAM_IMAGE;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = imx219_format_bpp(code) == 8 ?
+		MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
+
+	return 0;
+}
+
 static int imx219_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state)
 {
@@ -1161,6 +1208,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.set_fmt = imx219_set_pad_format,
 	.get_selection = imx219_get_selection,
 	.enum_frame_size = imx219_enum_frame_size,
+	.get_frame_desc = imx219_get_frame_desc,
 	.enable_streams = imx219_enable_streams,
 	.disable_streams = imx219_disable_streams,
 };
-- 
2.47.3

