Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008550;
	b=jQw5sJYu2FWGsNv4h0ncuAL+Wq3dsex06e2aINMPpXjBmS4DD4q4OZSKxHwkA51kGbAl
	 a1A1mkcV34EpjaeB/AM+XUEOvYrDcbT+yXhHKWe5BeaK9Zn1toqXt5b558g+1mRkYxL4l
	 rHEWBD2Qetn8HVQy/5xW9g4xIY5EGwW/yDYaGcNl4Y5QXfX0GCh58iurSkthiLJiFQB0T
	 81kHpuO8SLuBjhYtWpWLKvy065qVgf4iz1kE7z6WCyBKogbyLidjNUfFwYIDLq1fNEATk
	 KD0KrIHj9Z5UW/Iq5/YzpFs/6aZJisE9bk2VWePhhIERIA+/JJm840yakAy4IaenauQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008550;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=JwFoirlJeI0VtF8buUCRs2GQsH9UUIK8t+U+CjiORgs=;
	b=fW5OXQI6vyVaDi8zDbyhu2NahOqyxqC7oSYsQAQRVK+iG/09BIIMZEHbAoxlo0VQjtBg
	 8DP9aYCseh+Wr2oR3fR9WeJUT8eG2JfiA9fYpxYrDiUm84zfwVHrYTrWhaV4N89gR2WE5
	 v5GTUE58zmp9zAk33BFJN85nXSkj7wTWl7tHvIcLPXFWgpgk1HB9man3eY9lKB3eWOSAf
	 0Ynyl3auQR9qnN6MmqMArsmQxy0xe2wG6nB6wj+7vIGfPIrZ2wIOZB3gJJEHu/NXIT1H/
	 xgC2okU/kk0MUg/t6eCg3JdKyftwySSorN6fR15Y/+g3LxKpKa8Keyt0aTCL8y5xE2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BA3eqNQr;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF8C606A336
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AF8C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BA3eqNQr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008550; x=1826544550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1tREQrFdgP6GOppzodXChjI+HbcpLWrJq90+I5lQlYQ=;
  b=BA3eqNQrjMzp2UOAkjMIt88IbTrp4zc9guh7Ul0LnzXZI+UgHnAN3HQh
   gP54k0Hl7wF337GOautoYx8q7uNzHdRbzYNyc/hDTdg8bAycQUP03IgY9
   +lbBmPrddrF6+QH+scHv7io4DiV84WmSKJLlSjqQbvrcWcWb0KEcn/4ZP
   Aq0TZorluSs2ZEtYLUxeUo5oGWsIBpoH3Wcyt89JgzAE3FfTO/vqGWto3
   2fKDT/azGRaOEDadtDgOoLhYcUGcbxEzViauj0vJ6dBe+D53m7afbrc7O
   f14kb7DPrKmnNJzSTe4nGxu2COIoX7uuMm2mArUCs/gUyAhi+5wD+v7Jl
   Q==;
X-CSE-ConnectionGUID: CEjPFwowRo2oFKe6W5rpsA==
X-CSE-MsgGUID: PX2xjJswTNKATm6h7KjESQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3809046"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3809046"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:29:05 -0800
X-CSE-ConnectionGUID: p6Sv7pUeQrGHfkBpE9makA==
X-CSE-MsgGUID: Lv02/LC8SA+f/WSkZRnf1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376803"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BFC92123121;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tcb-1dSE;
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
Subject: [PATCH v13 46/73] media: ccs: Add support for generic raw mbus codes
Date: Wed, 18 Nov 2026 15:27:52 +0200
Message-ID: <20261118132819.213473-47-sakari.ailus@linux.intel.com>
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

Add support for generic media bus codes for 8, 10, 12 and 14 bits per
pixel.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 54 ++++++++++++++++++++++----------
 drivers/media/i2c/ccs/ccs.h      |  2 ++
 2 files changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1cc4350856fd..40866215f3e1 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -642,13 +642,18 @@ static const struct ccs_csi_data_format ccs_csi_data_formats[] = {
 	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8, 8, CCS_PIXEL_ORDER_RGGB, },
 	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8, 8, CCS_PIXEL_ORDER_BGGR, },
 	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8, 8, CCS_PIXEL_ORDER_GBRG, },
+	/* Generic formats are placed below. */
+	{ MEDIA_BUS_FMT_RAW_8, 8, 8, 0, true },
+	{ MEDIA_BUS_FMT_RAW_10, 10, 10, 0, true },
+	{ MEDIA_BUS_FMT_RAW_12, 12, 12, 0, true },
+	{ MEDIA_BUS_FMT_RAW_14, 14, 14, 0, true },
 };
 
 static const char *pixel_order_str[] = { "GRBG", "RGGB", "BGGR", "GBRG" };
 
-#define to_csi_format_idx(fmt) (((unsigned long)(fmt)			\
-				 - (unsigned long)ccs_csi_data_formats) \
-				/ sizeof(*ccs_csi_data_formats))
+#define to_csi_format_idx(fmt)						\
+	(((unsigned long)(fmt) - (unsigned long)ccs_csi_data_formats)	\
+	 / sizeof(*ccs_csi_data_formats))
 
 static u32 ccs_pixel_order(struct ccs_sensor *sensor)
 {
@@ -669,27 +674,25 @@ static u32 ccs_pixel_order(struct ccs_sensor *sensor)
 
 static void ccs_update_mbus_formats(struct ccs_sensor *sensor)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	unsigned int mask = sensor->csi_format->is_generic ? ~0 : ~3;
 	unsigned int csi_format_idx =
-		to_csi_format_idx(sensor->csi_format) & ~3;
+		to_csi_format_idx(sensor->csi_format) & mask;
 	unsigned int internal_csi_format_idx =
-		to_csi_format_idx(sensor->internal_csi_format) & ~3;
-	unsigned int pixel_order = ccs_pixel_order(sensor);
+		to_csi_format_idx(sensor->internal_csi_format) & mask;
+	unsigned int pixel_order = sensor->csi_format->is_generic ?
+		0 : ccs_pixel_order(sensor);
 
 	if (WARN_ON_ONCE(max(internal_csi_format_idx, csi_format_idx) +
 			 pixel_order >= ARRAY_SIZE(ccs_csi_data_formats)))
 		return;
 
 	sensor->mbus_frame_fmts =
-		sensor->default_mbus_frame_fmts << pixel_order;
+		(sensor->default_mbus_frame_fmts << pixel_order) |
+		sensor->default_generic_mbus_frame_fmts;
 	sensor->csi_format =
 		&ccs_csi_data_formats[csi_format_idx + pixel_order];
 	sensor->internal_csi_format =
-		&ccs_csi_data_formats[internal_csi_format_idx
-					 + pixel_order];
-
-	dev_dbg(&client->dev, "new pixel order %s\n",
-		pixel_order_str[pixel_order]);
+		&ccs_csi_data_formats[internal_csi_format_idx + pixel_order];
 }
 
 static const char * const ccs_test_patterns[] = {
@@ -896,7 +899,7 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 	struct v4l2_fwnode_device_properties props;
 	int rval;
 
-	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 19);
+	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 21);
 	if (rval)
 		return rval;
 
@@ -1091,6 +1094,17 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 
 	v4l2_ctrl_cluster(2, &sensor->hflip);
 
+	v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler, NULL,
+			  V4L2_CID_CFA_PATTERN, sensor->default_pixel_order,
+			  sensor->default_pixel_order, 1,
+			  sensor->default_pixel_order);
+
+	v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler, NULL,
+			  V4L2_CID_CFA_PATTERN_FLIP,
+			  V4L2_CFA_PATTERN_FLIP_BOTH,
+			  V4L2_CFA_PATTERN_FLIP_BOTH, 1,
+			  V4L2_CFA_PATTERN_FLIP_BOTH);
+
 	rval = v4l2_ctrl_handler_init(&sensor->src->ctrl_handler, 0);
 	if (rval)
 		return rval;
@@ -1199,15 +1213,21 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
 			const struct ccs_csi_data_format *f =
 				&ccs_csi_data_formats[j];
 
-			if (f->pixel_order != CCS_PIXEL_ORDER_GRBG)
-				continue;
-
 			if (f->width != fmt >>
 			    CCS_DATA_FORMAT_DESCRIPTOR_UNCOMPRESSED_SHIFT ||
 			    f->compressed !=
 			    (fmt & CCS_DATA_FORMAT_DESCRIPTOR_COMPRESSED_MASK))
 				continue;
 
+			if (f->is_generic) {
+				sensor->default_generic_mbus_frame_fmts |=
+					BIT_U64(j);
+				continue;
+			}
+
+			if (f->pixel_order != CCS_PIXEL_ORDER_GRBG)
+				continue;
+
 			dev_dbg(&client->dev, "jolly good! %u\n", j);
 
 			sensor->default_mbus_frame_fmts |= BIT_U64(j);
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 58952c5bf06b..df044dbde23f 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -170,6 +170,7 @@ struct ccs_csi_data_format {
 	u8 width;
 	u8 compressed;
 	u8 pixel_order;
+	bool is_generic;
 };
 
 #define CCS_SUBDEVS			3
@@ -226,6 +227,7 @@ struct ccs_sensor {
 	const struct ccs_csi_data_format *csi_format;
 	const struct ccs_csi_data_format *internal_csi_format;
 	u64 default_mbus_frame_fmts;
+	u64 default_generic_mbus_frame_fmts;
 	int default_pixel_order;
 	struct ccs_data_container sdata, mdata;
 
-- 
2.47.3

