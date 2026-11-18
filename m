Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008523;
	b=1OcHvQDvTDiELgPNpTT6N0YSZbTZNyYLjgy3NCuZXbxvXLrk2QKtg1r3v/qR8NEE6Lfj
	 F2Y96gxn0lNaMe/K8zszxQ/SK74sFMiiaLl4tf5OBx/jYSsdNhUh9ntPy8ZVp3hRfnEQE
	 hGEHpIZwFlqDxxK57UcrpzaNLaN4THtSEMBfLUSjKhZv4Nai0ceNSz8woTapAChNgQUsp
	 nEM2cbfCfZf91jaD0PyQ4N08hQlk1F8vkGtk/4BZ6KaG8fWaKzQal/4jtZ+hwPtCAA6FA
	 EpGGoF1kAgHtQkHMgSPIri+HqOGNgmNs2hqcRrrczDcyMQq3AT+X9B2d4e3kuYEgfBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008523;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=tZOeg2xDWs9Tum9Ou2nCbSBBmP1dIs75gpitHXitnSk=;
	b=bJxAqn3GlE0xrg18PqUeLdxXV/wMHYoGOMzpDGOSbyN+cSXYpU/enAX0Fd6nRNKXL/Mb
	 ZU5CcuiEwp0DZF/YsLgWthTG1snz7695Y2MgI8KYFoleQ4lXFTHQ6hJWie/Dv/RHqzGxe
	 c0HURwJbezRnkdmwS67WcJjm1J6n2SY9SXcMz2BlAB6b8cvGuLNlzxZeTOcnsBsLnoPJ6
	 ywydAcgrWPc0lwE0RKwOb/PfqNEJ+r9JRW+ycnOirpUvdzAH7ebIVHYF8cuTiRP/x7d1o
	 ZYiMJ6SEHG1EVY/5SPaO4M8SOX+6V+t8BFbk6/Id2jtOWYRB3B7P3UvNnTyoKhqSyXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="J975vkW/";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DE5606A33E
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85DE5606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J975vkW/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008523; x=1826544523;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lT3V6dwOtL/EJma+Vjh9VdBGojkkIFeLGYLX1IZjZLc=;
  b=J975vkW/ufPvehSk/uoJA0gxcE3y6vyL+yRmIiSaJYpLoh1Om1EceSPN
   QRZZREPt3uua1K7rfHXkh2Shv3quLnXJDvQKli+MYrHpTfPUmFtK2cvxw
   qYg/NFr12EoT9zEh0/amdL2NtgcWRJFq/fWs4Au74KqICr5PTWYJu+ouK
   OLn6b6OoLsR4Z7qRqLkeSbig04HoPkyzjvELkRoxFuACXYOithxiSwZmD
   fS6OPUgg/X+U6nxZ+QH16FqWsC7L0hDWAqqA5BaPWbT23VRibvawS92tO
   HLcuYaEfMt/eQAEUW2D4bcXnMjuDZD165yVFP88rh9e1QFkc/pZL1ru0w
   g==;
X-CSE-ConnectionGUID: Sf8GRqq5R3WkJpod8zghZA==
X-CSE-MsgGUID: Hv99eHFeSc6BGxcRlLRUBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3702762"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3702762"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:40 -0800
X-CSE-ConnectionGUID: U6pBjOU9R7iYAXQmvFTTIg==
X-CSE-MsgGUID: 8LQ5VqwJQvOw7056uxXq2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10678038"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:31 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 020EE122C17;
	Wed, 18 Nov 2026 15:28:21 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tds-2kAT;
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
Subject: [PATCH v13 63/73] media: imx219: Add support for generic raw formats
Date: Wed, 18 Nov 2026 15:28:09 +0200
Message-ID: <20261118132819.213473-64-sakari.ailus@linux.intel.com>
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

Add support for colour pattern agnostic raw formats, including controls to
convey the colour pattern and the configuration model (common raw sensor).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 40 +++++++++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index d0dad5c4eb46..e073e34df96b 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -306,6 +306,11 @@ static const u32 imx219_mbus_formats[] = {
 	MEDIA_BUS_FMT_SBGGR8_1X8,
 };
 
+static const u32 imx219_mbus_formats_generic[] = {
+	MEDIA_BUS_FMT_RAW_10,
+	MEDIA_BUS_FMT_RAW_8,
+};
+
 /*
  * Initialisation delay between XCLR low->high and the moment when the sensor
  * can start capture (i.e. can leave software stanby) must be not less than:
@@ -408,6 +413,10 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
 {
 	unsigned int i;
 
+	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats_generic); i++)
+		if (imx219_mbus_formats_generic[i] == code)
+			return code;
+
 	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats); i++)
 		if (imx219_mbus_formats[i] == code)
 			break;
@@ -428,12 +437,14 @@ static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_RAW_8:
 		return 8;
 
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
 	case MEDIA_BUS_FMT_SGBRG10_1X10:
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_RAW_10:
 	default:
 		return 10;
 	}
@@ -447,12 +458,14 @@ imx219_get_embedded_format_code(const struct v4l2_mbus_framefmt *format)
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_RAW_8:
 		return MEDIA_BUS_FMT_META_8;
 
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
 	case MEDIA_BUS_FMT_SGBRG10_1X10:
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_RAW_10:
 	default:
 		return MEDIA_BUS_FMT_META_10;
 	}
@@ -688,6 +701,20 @@ static int imx219_init_controls(struct imx219 *imx219)
 		/* The "Solid color" pattern is white by default */
 	}
 
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_CFA_PATTERN,
+			  V4L2_CFA_PATTERN_RGGB, V4L2_CFA_PATTERN_RGGB,
+			  1, V4L2_CFA_PATTERN_RGGB);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL,
+			  V4L2_CID_CFA_PATTERN_FLIP,
+			  0, V4L2_CFA_PATTERN_FLIP_BOTH,
+			  0, V4L2_CFA_PATTERN_FLIP_BOTH);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_METADATA_LAYOUT,
+			  0, V4L2_METADATA_LAYOUT_CCS,
+			  1, V4L2_METADATA_LAYOUT_CCS);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_CONFIG_MODEL,
+			  0, V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR,
+			  0, V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR);
+
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
 		dev_err_probe(&client->dev, ret, "Control init failed\n");
@@ -912,10 +939,17 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->stream == IMX219_STREAM_IMAGE) {
 		u32 format;
 
-		if (code->index >= ARRAY_SIZE(imx219_mbus_formats) / 4)
-			return -EINVAL;
+		if (code->index >= ARRAY_SIZE(imx219_mbus_formats) / 4) {
+			u32 idx = code->index -
+				ARRAY_SIZE(imx219_mbus_formats) / 4;
+
+			if (idx >= ARRAY_SIZE(imx219_mbus_formats_generic))
+				return -EINVAL;
 
-		format = imx219_mbus_formats[code->index * 4];
+			format = imx219_mbus_formats_generic[idx];
+		} else {
+			format = imx219_mbus_formats[code->index * 4];
+		}
 		code->code = imx219_get_format_code(imx219, format);
 	} else {
 		struct v4l2_mbus_framefmt *fmt;
-- 
2.47.3

