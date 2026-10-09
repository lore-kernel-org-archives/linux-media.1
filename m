Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930C2381B01
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 08:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534147; cv=none; b=RwfER6+3TrwaOSMnGTeRfCdlgRfqNp4RWmfG1mo1JCBelyNVdsKRNQ51ug2vlfm0O3eUv74dnPTs9Ek9It4H+w1F5mkdwlkIfI3hLlyesU2llSQ2/i8Nhu84vNqSmV6NoJDimLjLv+33l9sCbaHaJ1BQwpBonrPyo5JZfl2iFhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534147; c=relaxed/simple;
	bh=nIxbGBORUvEPkCw5722TGeEy2hYU/5E0LWBRlalxL+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ArfkVbWXfgDGbARh6Xz3VLuPKx0ibPfzzJMl3UrYvT0HIi3Mrk2qxcyqmvClNTefmSoN5GEwSsIUkZ18vHTAjsibFB8FI3OIjtHWFcUJAgGN1P7b0FBHuvRr8Z3HJrUEL9MMJUIEdX2NazlP4eIPHAnGPI4NntnOIo8wSbeFBm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6bAEOxf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6bAEOxf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791534145; x=1823070145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nIxbGBORUvEPkCw5722TGeEy2hYU/5E0LWBRlalxL+A=;
  b=L6bAEOxfbOU8BlWNZX1puVh/PQ6ScnCNU7oAzGyKUwEVJ7uylkShmpKn
   +7rTN01K8UdqpXmg+TooTrnt7IkCUNMchqPracvRWMPzM72H6SdJUurvj
   Stwix9tI2EpqMdvz9rGF6+ohw5HB6rZvFKqlWkNie8yrfy30CIYtOaNCp
   Tj9o+EsJPv6L4p2GdO0A5B4bqc3C0+de2xgR0TygsrH12HIpZP9FvgTDj
   3pLRpb/+qJ+Ceru9djayALi2zl5fpWwZ+SREgnqO4ILw8y/toUUc1dVXU
   6F4B5tZNj6Dq2wa2BbxtfjuKzT0udre312mutusPtgU4AIACO/lvl0tUz
   w==;
X-CSE-ConnectionGUID: HXIiFMg0RSaY8J9wb0y0ag==
X-CSE-MsgGUID: EZVQaM8eQI+vYrpXhO2Jwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="235414"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="235414"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:22:22 -0700
X-CSE-ConnectionGUID: qF/yMoG0ShqqYdiKD2CiEQ==
X-CSE-MsgGUID: 7YeYpG92SpiNExmfjeQy1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="2068675"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:22:20 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E6142121BA6;
	Fri, 09 Oct 2026 11:22:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xF5pT-00000009FOE-1WgP;
	Fri, 09 Oct 2026 11:19:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	"hao.yao@intel.com" <hao.yao@intel.com>,
	"dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH v2 1/4] media: ov05c10: Small cleanups
Date: Fri,  9 Oct 2026 11:19:44 +0300
Message-ID: <20261009081947.2204092-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009081947.2204092-1-sakari.ailus@linux.intel.com>
References: <20261009081947.2204092-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Use dev_err_probe() instead of dev_err() in probe() path
- Don't set event handlers just for controls
- Don't set HAS_DEVNODE sub-device flag
- Coding style improvements
- Use container_of_const()

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/ov05c10.c | 46 +++++++++++++++----------------------
 1 file changed, 18 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c
index 2f2c49bac13f..0256e5514ade 100644
--- a/drivers/media/i2c/ov05c10.c
+++ b/drivers/media/i2c/ov05c10.c
@@ -108,7 +108,7 @@ static const struct regmap_config ov05c10_regmap_config = {
 	.disable_locking = true,
 };
 
-#define to_ov05c10(_sd)		container_of(_sd, struct ov05c10, sd)
+#define to_ov05c10(_sd) container_of_const(_sd, struct ov05c10, sd)
 
 static const char *const ov05c10_test_pattern_menu[] = {
 	"Disabled",
@@ -320,7 +320,7 @@ static int ov05c10_test_pattern(struct ov05c10 *ov05c10, u32 pattern)
 static int ov05c10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov05c10 *ov05c10 =
-		container_of(ctrl->handler, struct ov05c10, ctrl_handler);
+		container_of_const(ctrl->handler, struct ov05c10, ctrl_handler);
 	struct i2c_client *client = v4l2_get_subdevdata(&ov05c10->sd);
 	struct v4l2_subdev_state *state;
 	const struct v4l2_mbus_framefmt *format;
@@ -439,6 +439,7 @@ static int ov05c10_init_controls(struct ov05c10 *ov05c10)
 			  OV05C10_MIN_ANALOG_GAIN, OV05C10_MAX_ANALOG_GAIN,
 			  OV05C10_ANALOG_GAIN_STEP,
 			  OV05C10_ANALOG_GAIN_DEFAULT);
+
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
 			  OV05C10_MIN_DIG_GAIN, OV05C10_MAX_DIG_GAIN,
 			  OV05C10_DGTL_GAIN_STEP, OV05C10_DGTL_GAIN_DEFAULT);
@@ -693,13 +694,7 @@ static const struct v4l2_subdev_pad_ops ov05c10_pad_ops = {
 	.disable_streams = ov05c10_disable_streams,
 };
 
-static const struct v4l2_subdev_core_ops ov05c10_core_ops = {
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
-};
-
 static const struct v4l2_subdev_ops ov05c10_subdev_ops = {
-	.core = &ov05c10_core_ops,
 	.pad = &ov05c10_pad_ops,
 };
 
@@ -720,7 +715,7 @@ static int ov05c10_parse_fwnode(struct ov05c10 *ov05c10, struct device *dev)
 	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
 	fwnode_handle_put(endpoint);
 	if (ret) {
-		dev_err(dev, "parsing endpoint node failed\n");
+		dev_err_probe(dev, ret, "parsing endpoint node failed\n");
 		goto out_err;
 	}
 
@@ -743,16 +738,13 @@ static int ov05c10_identify_module(struct ov05c10 *ov05c10)
 	int ret = 0;
 
 	cci_read(ov05c10->regmap, OV05C10_REG_CHIP_ID, &val, &ret);
-	if (ret) {
-		dev_err(&client->dev, "chip id read err");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "chip id read err");
 
-	if (val != OV05C10_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%llu",
-			OV05C10_CHIP_ID, val);
-		return -ENXIO;
-	}
+	if (val != OV05C10_CHIP_ID)
+		return dev_err_probe(&client->dev, ret,
+				     "chip id mismatch: %x!=%llu",
+				     OV05C10_CHIP_ID, val);
 
 	return 0;
 }
@@ -871,35 +863,33 @@ static int ov05c10_probe(struct i2c_client *client)
 	full_power = acpi_dev_state_d0(dev);
 	if (full_power) {
 		ret = ov05c10_power_on(dev);
-		if (ret) {
-			dev_err(&client->dev, "failed to power on\n");
+		if (ret)
 			return ret;
-		}
 	}
 
 	ret = ov05c10_init_controls(ov05c10);
 	if (ret) {
-		dev_err(&client->dev, "failed to init controls: %d", ret);
+		dev_err_probe(&client->dev, ret, "failed to init controls\n");
 		goto probe_error_power_off;
 	}
 
 	ov05c10->sd.internal_ops = &ov05c10_internal_ops;
-	ov05c10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
-			     V4L2_SUBDEV_FL_HAS_EVENTS;
+	ov05c10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	ov05c10->sd.entity.ops = NULL;
 	ov05c10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	ov05c10->pad.flags = MEDIA_PAD_FL_SOURCE;
 
 	ret = media_entity_pads_init(&ov05c10->sd.entity, 1, &ov05c10->pad);
 	if (ret) {
-		dev_err(&client->dev, "failed to init entity pads: %d", ret);
+		dev_err_probe(&client->dev, ret,
+			      "failed to init entity pads\n");
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
 	ov05c10->sd.state_lock = ov05c10->ctrl_handler.lock;
 	ret = v4l2_subdev_init_finalize(&ov05c10->sd);
 	if (ret < 0) {
-		dev_err(dev, "v4l2 subdev init error: %d\n", ret);
+		dev_err_probe(dev, ret, "v4l2 subdev init error\n");
 		goto probe_error_media_entity_cleanup;
 	}
 
@@ -909,8 +899,8 @@ static int ov05c10_probe(struct i2c_client *client)
 
 	ret = v4l2_async_register_subdev_sensor(&ov05c10->sd);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
-			ret);
+		dev_err_probe(&client->dev, ret,
+			      "failed to register V4L2 subdev");
 		goto probe_error_rpm;
 	}
 	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
-- 
2.47.3

