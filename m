Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008552;
	b=whJP9am7RRTM578GrtK8rAbAEFbjG9x4ZTdNKldwEx+Dot3dG6wGAz3uNAPTcxyjCs/I
	 9+hzHwD7YUK7jj8L31j2uFOOZdu8Aa8eBZeWwtwc2WpkYa4TC3W9wfeuu7Qjz3464qTco
	 frdpKVP5o3x9WrGxi/dsWjfFSQwoCe4smLD0LaxJbPXdmR5Mu6oddmFmMvq4gA/O/1lqs
	 b7E9dyHmtq6gAtZNKoxG02yGgpISB1QwlVsSMfWTIRHgM5n1uNEvIYrEGkimLx32N/8cU
	 1vJjlp2vbeGFofk12j3hOWT6zxKeGi7E9B8v3yE5eTBLtT1dCLk3xL0WKkZP6r6R9gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008552;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=B6gVT3JhW9x4QeVqWg8xFc4E4Ihujjmg255OwaI7gS8=;
	b=KIkmaZseeE4GdLU509i2UsjJ+wfBpE3x9gfeEf6a6C4BBd84cgRFKkkyBl+iQQihd3hK
	 mywZYAWiC6Kf26A9dU1xKRNfJoQ33DB3PT3UaGPq9t+fEemekyESgKQgk7afnwaEKNhUB
	 Kb85BTDEB2RaZJxsw9ZZHWPa5/E/DsBZdn+MhO9lQVnjicrPqzJhh9nicE2l97hDsnowQ
	 XRBsN9ddJIF7Y8P1NzYfLRg95oiWU7W24okLRIKMcg3E/bdEqgTaeD8A6jv8bI9z4CeKg
	 HfGXrgGa5KgsLnrHyBEAGM4+E2xY2c8h4zhm7G6EOSONn88nkzGJ5WxD90AX7s1aymg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RfluxsSn;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3F260A2610
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E3F260A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RfluxsSn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008552; x=1826544552;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G1BIKmVo53L48hejmHJ8p1DgS19ilfn6+38Gao2oP+s=;
  b=RfluxsSnavCxHytBkx9U8pttmgaAso2C2egKmIpCP4W5EtGH5L9uZF8n
   vtG7504kj9DA5ZqOFh2050juRiwiH0hMe22Uy8twwHYgmqB8Xp6jG2gzc
   g4P+dTSoB11nCfqMwrpt0B33KzSTr+aDJi4HCFqXJQdqLwViKHeFvzWNU
   c2Rb7FofqsIg3CjblTV+Dt1B5b/Z4fxOfLASWZorgpt3bpVxaEgfEpxw3
   11TCg4Jo/wfhbL9nbc3dtR+VBio6n4JCBeir8/u6w+KQpLj/PMOWQlq88
   u9m4Pb9uoFxwLj1bi8tgn9e7iLhp3SwrX5PhNdTqhJuQxe0FZfwDUEqUo
   A==;
X-CSE-ConnectionGUID: FZteRsmQS8KS/7W9WBlDMw==
X-CSE-MsgGUID: m8+fRLRiRGuvBqiDVXZgyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3809075"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3809075"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:29:05 -0800
X-CSE-ConnectionGUID: F3tdGecBRA69fUaYPrgejQ==
X-CSE-MsgGUID: eUJtV/UVRNSJ2W1Cs+x9qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376809"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C08AA123139;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tcf-1hj6;
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
Subject: [PATCH v13 47/73] media: ccs: Add support for embedded data stream
Date: Wed, 18 Nov 2026 15:27:53 +0200
Message-ID: <20261118132819.213473-48-sakari.ailus@linux.intel.com>
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

Add support for embedded data stream, in UAPI and frame descriptor.

This patch adds also a new embedded data pad (2) to the source sub-device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 342 +++++++++++++++++++++++++++++--
 drivers/media/i2c/ccs/ccs.h      |  15 +-
 2 files changed, 338 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 40866215f3e1..e8706267b6e8 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -899,7 +899,7 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 	struct v4l2_fwnode_device_properties props;
 	int rval;
 
-	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 21);
+	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 22);
 	if (rval)
 		return rval;
 
@@ -1105,6 +1105,12 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 			  V4L2_CFA_PATTERN_FLIP_BOTH, 1,
 			  V4L2_CFA_PATTERN_FLIP_BOTH);
 
+	v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler, NULL,
+			  V4L2_CID_METADATA_LAYOUT,
+			  V4L2_METADATA_LAYOUT_CCS,
+			  V4L2_METADATA_LAYOUT_CCS, 1,
+			  V4L2_METADATA_LAYOUT_CCS);
+
 	rval = v4l2_ctrl_handler_init(&sensor->src->ctrl_handler, 0);
 	if (rval)
 		return rval;
@@ -1871,6 +1877,57 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
 	return rval;
 }
 
+#define CCS_EMBEDDED_CODE_DEPTH(depth, half_depth)			\
+	depth,								\
+	CCS_EMB_DATA_CAPABILITY_TWO_BYTES_PER_RAW##depth,		\
+	CCS_EMB_DATA_CAPABILITY_NO_ONE_BYTE_PER_RAW##depth,		\
+	CCS_EMB_DATA_CTRL_RAW##half_depth##_PACKING_FOR_RAW##depth,	\
+	MEDIA_BUS_FMT_META_##half_depth,				\
+	MEDIA_BUS_FMT_META_##depth,					\
+
+static const struct ccs_embedded_code {
+	u8 depth;
+	u8 cap_two_bytes_per_sample;
+	u8 cap_no_legacy;
+	u8 ctrl;
+	u32 code_two_bytes;
+	u32 code_legacy;
+} ccs_embedded_codes[] = {
+	{ CCS_EMBEDDED_CODE_DEPTH(16, 8) },
+	{ CCS_EMBEDDED_CODE_DEPTH(20, 10) },
+	{ CCS_EMBEDDED_CODE_DEPTH(24, 12) },
+};
+
+static const struct ccs_embedded_code *ccs_embedded_code(unsigned int bpp)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ccs_embedded_codes); i++)
+		if (ccs_embedded_codes[i].depth == bpp)
+			return ccs_embedded_codes + i;
+
+	WARN_ON(1);
+
+	return ccs_embedded_codes;
+}
+
+static u32
+ccs_default_embedded_code(struct ccs_sensor *sensor,
+			  const struct ccs_embedded_code *embedded_code)
+{
+	if (CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+	    BIT(embedded_code->cap_two_bytes_per_sample))
+		return embedded_code->code_two_bytes;
+
+	if (!(CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+	      BIT(embedded_code->cap_no_legacy)))
+		return embedded_code->code_legacy;
+
+	WARN_ON(1);
+
+	return embedded_code->code_legacy;
+}
+
 static int ccs_enable_streams(struct v4l2_subdev *subdev,
 			      struct v4l2_subdev_state *state, u32 pad,
 			      u64 streams_mask)
@@ -2003,6 +2060,22 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 	if (rval < 0)
 		goto err_pm_put;
 
+	/* Configure embedded data */
+	if (sensor->csi_format->compressed >= 16) {
+		const struct ccs_embedded_code *embedded_code =
+			ccs_embedded_code(sensor->csi_format->compressed);
+		const struct v4l2_mbus_framefmt *meta_out_fmt =
+			v4l2_subdev_state_get_format(src_state, CCS_PAD_SRC,
+						     CCS_STREAM_META);
+
+		rval = ccs_write(sensor, EMB_DATA_CTRL,
+				 meta_out_fmt->code ==
+				 embedded_code->code_legacy ?
+				 0 : embedded_code->ctrl);
+		if (rval < 0)
+			goto err_pm_put;
+	}
+
 	if (CCS_LIM(sensor, FLASH_MODE_CAPABILITY) &
 	    (CCS_FLASH_MODE_CAPABILITY_SINGLE_STROBE |
 	     SMIAPP_FLASH_MODE_CAPABILITY_MULTIPLE_STROBE) &&
@@ -2133,6 +2206,61 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 	dev_err(&client->dev, "subdev %s, pad %u, index %u\n",
 		subdev->name, code->pad, code->index);
 
+	if (subdev == &sensor->src->sd) {
+		if (code->pad == CCS_PAD_META ||
+		    code->stream == CCS_STREAM_META) {
+			struct v4l2_mbus_framefmt *pix_fmt =
+				v4l2_subdev_state_get_format(sd_state,
+							     CCS_PAD_SRC,
+							     CCS_STREAM_PIXEL);
+			const struct ccs_csi_data_format *csi_format =
+				ccs_validate_csi_data_format(sensor,
+							     pix_fmt->code);
+			unsigned int i = 0;
+			u32 codes[2];
+
+			switch (csi_format->compressed) {
+			case 8:
+				codes[i++] = MEDIA_BUS_FMT_META_8;
+				break;
+			case 10:
+				codes[i++] = MEDIA_BUS_FMT_META_10;
+				break;
+			case 12:
+				codes[i++] = MEDIA_BUS_FMT_META_12;
+				break;
+			case 14:
+				codes[i++] = MEDIA_BUS_FMT_META_14;
+				break;
+			case 16:
+			case 20:
+			case 24: {
+				const struct ccs_embedded_code *embedded_code =
+					ccs_embedded_code(csi_format->compressed);
+
+				if (CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+				    BIT(embedded_code->cap_two_bytes_per_sample))
+					codes[i++] =
+						embedded_code->code_two_bytes;
+
+				if (!(CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+				      BIT(embedded_code->cap_no_legacy)))
+					codes[i++] = embedded_code->code_legacy;
+				break;
+			}
+			default:
+				WARN_ON(1);
+			}
+
+			if (WARN_ON(i > ARRAY_SIZE(codes)) || code->index >= i)
+				return -EINVAL;
+
+			code->code = codes[code->index];
+
+			return 0;
+		}
+	}
+
 	if (subdev != &sensor->src->sd || code->pad != CCS_PAD_SRC) {
 		if (code->index)
 			return -EINVAL;
@@ -2171,8 +2299,11 @@ static int ccs_get_format(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
-	fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
-	fmt->format.code = ccs_get_mbus_code(subdev, fmt->pad);
+	fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad,
+						    fmt->stream);
+
+	if (fmt->pad != CCS_PAD_META && fmt->stream != CCS_STREAM_META)
+		fmt->format.code = ccs_get_mbus_code(subdev, fmt->pad);
 
 	return 0;
 }
@@ -2262,6 +2393,86 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
 	return ccs_pll_update(sensor);
 }
 
+static inline unsigned int ccs_embedded_data_lines(struct ccs_sensor *sensor)
+{
+	return sensor->embedded_end - sensor->embedded_start;
+}
+
+static int ccs_set_format_meta(struct v4l2_subdev *subdev,
+			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_mbus_framefmt *fmt)
+{
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
+	const struct ccs_csi_data_format *csi_format;
+	struct v4l2_mbus_framefmt *pix_fmt;
+	struct v4l2_mbus_framefmt *meta_fmt;
+	struct v4l2_mbus_framefmt *meta_out_fmt;
+	u32 code;
+
+	pix_fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC,
+					       CCS_STREAM_PIXEL);
+	meta_fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_META, 0);
+	meta_out_fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC,
+						    CCS_STREAM_META);
+
+	code = fmt ? fmt->code : 0;
+
+	meta_fmt->width = pix_fmt->width;
+	meta_fmt->height = ccs_embedded_data_lines(sensor);
+
+	csi_format = ccs_validate_csi_data_format(sensor, pix_fmt->code);
+
+	switch (csi_format->compressed) {
+	case 8:
+		meta_fmt->code = MEDIA_BUS_FMT_META_8;
+		break;
+	case 10:
+		meta_fmt->code = MEDIA_BUS_FMT_META_10;
+		break;
+	case 12:
+		meta_fmt->code = MEDIA_BUS_FMT_META_12;
+		break;
+	case 14:
+		meta_fmt->code = MEDIA_BUS_FMT_META_14;
+		break;
+	case 16:
+	case 20:
+	case 24: {
+		const struct ccs_embedded_code *embedded_code;
+
+		embedded_code = ccs_embedded_code(csi_format->compressed);
+		meta_fmt->code =
+			ccs_default_embedded_code(sensor, embedded_code);
+
+		if (!(CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+		      BIT(embedded_code->cap_no_legacy)) &&
+		    code == embedded_code->code_legacy)
+			meta_fmt->code = embedded_code->code_legacy;
+
+		if (CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+		    BIT(embedded_code->cap_two_bytes_per_sample) &&
+		    code == embedded_code->code_two_bytes) {
+			meta_fmt->code = embedded_code->code_two_bytes;
+			meta_fmt->width <<= 1;
+		}
+
+		break;
+	}
+	default:
+		WARN_ON(1);
+		return 0;
+	}
+
+	meta_out_fmt->width = meta_fmt->width;
+	meta_out_fmt->height = meta_fmt->height;
+	meta_out_fmt->code = meta_fmt->code;
+
+	if (fmt)
+		*fmt = *meta_out_fmt;
+
+	return 0;
+}
+
 static int ccs_set_format(struct v4l2_subdev *subdev,
 			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
@@ -2271,10 +2482,21 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *crop;
 
+	if (ssd == sensor->src && fmt->pad == CCS_PAD_META)
+		return ccs_get_format(subdev, sd_state, fmt);
+
+	if (ssd == sensor->src && fmt->stream == CCS_STREAM_META) {
+		ccs_set_format_meta(subdev, sd_state, &fmt->format);
+
+		return 0;
+	}
+
 	if (fmt->pad == ssd->source_pad) {
 		int rval;
 
 		rval = ccs_set_format_source(subdev, ci, sd_state, fmt);
+		if (ccs_embedded_data_lines(sensor) && ssd == sensor->src)
+			ccs_set_format_meta(subdev, sd_state, NULL);
 
 		return rval;
 	}
@@ -2526,6 +2748,12 @@ static int ccs_sel_supported(struct v4l2_subdev *subdev,
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 
+	if (sel->stream != CCS_STREAM_PIXEL)
+		return -EINVAL;
+
+	if (sel->pad == CCS_PAD_META)
+		return -EINVAL;
+
 	/* We only implement crop in three places. */
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
@@ -2575,7 +2803,8 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 
 	if (sel->pad == ssd->sink_pad) {
 		struct v4l2_mbus_framefmt *mfmt =
-			v4l2_subdev_state_get_format(sd_state, sel->pad);
+			v4l2_subdev_state_get_format(sd_state, sel->pad,
+						     CCS_STREAM_PIXEL);
 
 		src_size.width = mfmt->width;
 		src_size.height = mfmt->height;
@@ -2637,7 +2866,9 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
 		} else if (sel->pad == ssd->sink_pad) {
 			struct v4l2_mbus_framefmt *sink_fmt =
 				v4l2_subdev_state_get_format(sd_state,
-							     ssd->sink_pad);
+							     ssd->sink_pad,
+							     CCS_STREAM_PIXEL);
+
 			sel->r.top = sel->r.left = 0;
 			sel->r.width = sink_fmt->width;
 			sel->r.height = sink_fmt->height;
@@ -2723,6 +2954,18 @@ static int ccs_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
 	entry++;
 	desc->num_entries++;
 
+	if (ccs_embedded_data_lines(sensor)) {
+		struct v4l2_mbus_framefmt *meta_out_fmt =
+			v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC,
+						     CCS_STREAM_META);
+
+		entry->pixelcode = meta_out_fmt->code;
+		entry->stream = CCS_STREAM_META;
+		entry->bus.csi2.dt = MIPI_CSI2_DT_EMBEDDED_8B;
+		entry++;
+		desc->num_entries++;
+	}
+
 	v4l2_subdev_unlock_state(sd_state);
 
 	return 0;
@@ -3063,7 +3306,8 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
 	ssd->sensor = sensor;
 
 	ssd->npads = num_pads;
-	ssd->source_pad = num_pads - 1;
+	ssd->source_pad =
+		ssd == sensor->pixel_array ? CCS_PA_PAD_SRC : CCS_PAD_SRC;
 
 	v4l2_i2c_subdev_set_name(&ssd->sd, client, sensor->minfo.name, name);
 
@@ -3077,6 +3321,10 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
 		ssd->sd.owner = THIS_MODULE;
 		ssd->sd.dev = &client->dev;
 		v4l2_set_subdevdata(&ssd->sd, client);
+	} else {
+		ssd->sd.flags |= V4L2_SUBDEV_FL_STREAMS;
+		ssd->pads[CCS_PAD_META].flags =
+			MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
 	}
 
 	rval = media_entity_pads_init(&ssd->sd.entity, ssd->npads, ssd->pads);
@@ -3102,9 +3350,9 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 	unsigned int pad = ssd == sensor->pixel_array ?
 		CCS_PA_PAD_SRC : CCS_PAD_SINK;
 	struct v4l2_mbus_framefmt *fmt =
-		v4l2_subdev_state_get_format(sd_state, pad);
+		v4l2_subdev_state_get_format(sd_state, pad, CCS_STREAM_PIXEL);
 	struct v4l2_rect *crop =
-		v4l2_subdev_state_get_crop(sd_state, pad);
+		v4l2_subdev_state_get_crop(sd_state, pad, CCS_STREAM_PIXEL);
 
 	ccs_get_native_size(ssd, crop);
 
@@ -3116,7 +3364,8 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 	if (ssd == sensor->pixel_array)
 		return 0;
 
-	fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC);
+	fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC,
+					   CCS_STREAM_PIXEL);
 	fmt->code = ssd == sensor->src ?
 		sensor->csi_format->code : sensor->internal_csi_format->code;
 	fmt->field = V4L2_FIELD_NONE;
@@ -3126,6 +3375,47 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ccs_src_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = CCS_PAD_SINK,
+			.source_pad = CCS_PAD_SRC,
+			.source_stream = CCS_STREAM_PIXEL,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		}, {
+			.sink_pad = CCS_PAD_META,
+			.source_pad = CCS_PAD_SRC,
+			.source_stream = CCS_STREAM_META,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		}
+	};
+	struct v4l2_subdev_krouting routing = {
+		.routes = routes,
+		.num_routes = 1,
+	};
+	struct ccs_subdev *ssd = to_ccs_subdev(sd);
+	struct ccs_sensor *sensor = ssd->sensor;
+	int rval;
+
+	if (ccs_embedded_data_lines(sensor))
+		routing.num_routes++;
+
+	rval = v4l2_subdev_set_routing(sd, sd_state, &routing);
+	if (rval)
+		return rval;
+
+	rval = ccs_init_state(sd, sd_state);
+	if (rval)
+		return rval;
+
+	if (ccs_embedded_data_lines(sensor))
+		ccs_set_format_meta(sd, sd_state, NULL);
+
+	return 0;
+}
+
 static const struct v4l2_subdev_video_ops ccs_video_ops = {
 	.s_stream = v4l2_subdev_s_stream_helper,
 	.pre_streamon = ccs_pre_streamon,
@@ -3138,6 +3428,14 @@ static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
 	.set_fmt = ccs_set_format,
 	.get_selection = ccs_get_selection,
 	.set_selection = ccs_set_selection,
+};
+
+static const struct v4l2_subdev_pad_ops ccs_src_pad_ops = {
+	.enum_mbus_code = ccs_enum_mbus_code,
+	.get_fmt = ccs_get_format,
+	.set_fmt = ccs_set_format,
+	.get_selection = ccs_get_selection,
+	.set_selection = ccs_set_selection,
 	.enable_streams = ccs_enable_streams,
 	.disable_streams = ccs_disable_streams,
 	.get_frame_desc = ccs_get_frame_desc,
@@ -3154,6 +3452,12 @@ static const struct v4l2_subdev_ops ccs_ops = {
 	.sensor = &ccs_sensor_ops,
 };
 
+static const struct v4l2_subdev_ops ccs_src_ops = {
+	.video = &ccs_video_ops,
+	.pad = &ccs_src_pad_ops,
+	.sensor = &ccs_sensor_ops,
+};
+
 static const struct media_entity_operations ccs_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
@@ -3162,8 +3466,8 @@ static const struct v4l2_subdev_internal_ops ccs_internal_ops = {
 	.init_state = ccs_init_state,
 };
 
-static const struct v4l2_subdev_internal_ops ccs_internal_src_ops = {
-	.init_state = ccs_init_state,
+static const struct v4l2_subdev_internal_ops ccs_src_internal_ops = {
+	.init_state = ccs_src_init_state,
 	.registered = ccs_registered,
 	.unregistered = ccs_unregistered,
 };
@@ -3305,8 +3609,8 @@ static int ccs_probe(struct i2c_client *client)
 
 	sensor->src = &sensor->ssds[sensor->ssds_used];
 
-	v4l2_i2c_subdev_init(&sensor->src->sd, client, &ccs_ops);
-	sensor->src->sd.internal_ops = &ccs_internal_src_ops;
+	v4l2_i2c_subdev_init(&sensor->src->sd, client, &ccs_src_ops);
+	sensor->src->sd.internal_ops = &ccs_src_internal_ops;
 
 	sensor->regulators = devm_kcalloc(&client->dev,
 					  ARRAY_SIZE(ccs_regulators),
@@ -3573,12 +3877,20 @@ static int ccs_probe(struct i2c_client *client)
 		goto out_cleanup;
 	}
 
-	rval = ccs_init_subdev(sensor, sensor->scaler, " scaler", 2,
+	rval = ccs_init_subdev(sensor, sensor->scaler, " scaler",
+			       sensor->ssds_used != CCS_SUBDEVS ?
+			       CCS_PADS_NOMETA :
+			       ccs_embedded_data_lines(sensor) ?
+			       CCS_PADS : CCS_PADS_NOMETA,
 			       MEDIA_ENT_F_PROC_VIDEO_SCALER,
 			       "ccs scaler mutex", &scaler_lock_key);
 	if (rval)
 		goto out_cleanup;
-	rval = ccs_init_subdev(sensor, sensor->binner, " binner", 2,
+	rval = ccs_init_subdev(sensor, sensor->binner, " binner",
+			       sensor->ssds_used == CCS_SUBDEVS ?
+			       CCS_PADS_NOMETA :
+			       ccs_embedded_data_lines(sensor) ?
+			       CCS_PADS : CCS_PADS_NOMETA,
 			       MEDIA_ENT_F_PROC_VIDEO_SCALER,
 			       "ccs binner mutex", &binner_lock_key);
 	if (rval)
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index df044dbde23f..122287ab5399 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -176,11 +176,18 @@ struct ccs_csi_data_format {
 #define CCS_SUBDEVS			3
 
 #define CCS_PA_PAD_SRC			0
-#define CCS_PAD_SINK			0
-#define CCS_PAD_SRC			1
-#define CCS_PADS			2
+enum {
+	CCS_PAD_SINK,
+	CCS_PAD_SRC,
+	CCS_PAD_META,
+	CCS_PADS_NOMETA = CCS_PAD_META,
+	CCS_PADS,
+};
 
-#define CCS_STREAM_PIXEL		0
+enum {
+	CCS_STREAM_PIXEL,
+	CCS_STREAM_META,
+};
 
 struct ccs_binning_subtype {
 	u8 horizontal:4;
-- 
2.47.3

