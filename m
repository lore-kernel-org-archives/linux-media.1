Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5469946AA6C
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 21:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493665; cv=none; b=tD2uISMNMQ7MiVFK+IPwcuuTqwc4vFA1nNquzb6ww1aGNjCNPWFI8VUZn2NuuDspGfJbEmejoyEz1VUUw2tOiXVrCuH4vROuRDoPFYfloGBjhl0gZHEYlr16NborjNvc9rmMssFOC23vuknBg2Retku9xf6gMnBJlzMO2DxwRkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493665; c=relaxed/simple;
	bh=7UtC7OwXlslY1RJVnesZegIAXrZrs+ReGfAAfm8E9v4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NR0bU/3vzAvkRkc7BN5Qv7p0cH1HkAxZ1pTjFXm41dRUIY0VB1shVCOt3Y2JfXZaUyEbt/ZamhTKxDx4ijNZVLHI8tBbJTtv/ZVoJTHJgfnh/0dg00kYr1Ix32D/V8n336TOiVA/ImtBei2Fox1fnTtdi1Us2Y6jXKRpWtQbBpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TNhqmUuj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNhqmUuj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791493665; x=1823029665;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7UtC7OwXlslY1RJVnesZegIAXrZrs+ReGfAAfm8E9v4=;
  b=TNhqmUujiWp/cezFkBvoOkG3UyKR8xS5zX2z6pfat83QOIaAUQyXGuJs
   rIznZFyDv3pUz85xXGBjJTrnYVRPzHCG9jfWMC6U+uw4QYK9ZfBguOV+w
   WeCy04HAzZMaZzfGKYRktpNcjJsatSMGpOLlGbqQmAsfyyDMK/GHwXs/i
   94PItZXqgnSWKRvgie3yPyuaZJDHnzMY9c4GRzwyR+Fs8KlOObLpplo6v
   3SzycCmH4ij1I2Ahgzt5ZkkfxNEeZnTI5TQAXCF9nYzv1MRQ954ufA2+P
   K4uTRbOrInoET4y+4qzB8Kq1/ClEYBZVFuwrc7tv97LNSSMgRMnu3yzeY
   g==;
X-CSE-ConnectionGUID: TwQv9MtfSzSWAHW+LQn1cQ==
X-CSE-MsgGUID: 40wyTJ4HShualnRUOqDyrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="173202"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="173202"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 14:07:40 -0700
X-CSE-ConnectionGUID: 0Kw1UswZROuclBFnEXCXVQ==
X-CSE-MsgGUID: +zyC46+2RSyVkordG94piw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="135321"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 14:07:39 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D47D3121B94;
	Fri, 09 Oct 2026 00:07:39 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xEvIW-00000007sl3-0KIn;
	Fri, 09 Oct 2026 00:05:04 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	"hao.yao@intel.com" <hao.yao@intel.com>,
	"dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 1/4] media: ov05c10: Small cleanups
Date: Fri,  9 Oct 2026 00:05:00 +0300
Message-ID: <20261008210503.1878442-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008210503.1878442-1-sakari.ailus@linux.intel.com>
References: <20261008210503.1878442-1-sakari.ailus@linux.intel.com>
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

