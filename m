Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A2A37DE9F
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 21:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775166596; cv=none; b=bSrXeXl77VperVEahpivZyTssDFjDbPQXeC4GgLC2Tz4rZlQxhIxzhCNMUJIO4tl0ME5K1MJL9Zv0H3xW5AS9v4YkFRh9mv/QeOqs3vVqWdNLVrN65SULkVgyz2/XDy14lZzJmHIjpJicqd9+BRmS+sErT3livcXrs6kLAqx22s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775166596; c=relaxed/simple;
	bh=sMx1BAC0rTQO9irSYSSFp0Fn4NTWHvNZN/sAKLa7bpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BlHdeuE+ve4JOJfDnFX+S9L8R6ZUCDSJN3QZG6S0TGh9BumnwrNx2WW8XhCK56QDWkNP8lhs+b2nsnZq6sWBwTjbBs0+T/HaoJoXTLB+qIuOIw0v13Q/QKqKXVpsbc8bK1mlEnlXeH49zMZGe+f9ANjzjB4Ore0YssZYuU9Xelg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GH6dY6Ha; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GH6dY6Ha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775166594; x=1806702594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sMx1BAC0rTQO9irSYSSFp0Fn4NTWHvNZN/sAKLa7bpI=;
  b=GH6dY6HacPqhwR+A09cWLzeW+E4jP/Bujt/uX6iJsCNnEyHf4MwCaXfn
   pH3xxd/WCkgJpOuzqVCtp/lBRobyIfMAXuPner9nqqBKMJulfWYZk8k0o
   EoBILTR/BiTbH9KcpGtuLyX7UMCKmx2WK6Z7e8dWUamMG9z7YZti8TWj5
   RNyBwuVRAdvX0pteclAm5/E6h3rmKZbsIypl9IQNKpgFcXqEF8sQv2TVN
   FnIdY5PvFkBJISIKPbU1oYQvI+dHGoRFVSJKSnM+lGShifk3gVXcvg7d3
   B57vgEFHSQTPJ/Qh7DXrHjkIzJPvuxoxkd9/Zy2OmHVZU9UQRRPFR4WVj
   A==;
X-CSE-ConnectionGUID: 9WlIJlyUQl21bXQgG1umZg==
X-CSE-MsgGUID: R4iC7SspRGqfAbZCS7M4HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75405636"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="75405636"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 14:49:48 -0700
X-CSE-ConnectionGUID: SAhEKQzRRGarjadsEsUi/A==
X-CSE-MsgGUID: +snIqwKmQHaewggP+AHGRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="250154326"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.118])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 14:49:46 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C4AD6121FED;
	Fri, 03 Apr 2026 00:49:54 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w8PvG-0000000G3gt-0qOC;
	Fri, 03 Apr 2026 00:49:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Leon Luo <leonl@leopardimaging.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 2/6] media: imx334: Remove redundant kernel-doc comments
Date: Fri,  3 Apr 2026 00:49:50 +0300
Message-ID: <20260402214954.3827408-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402214954.3827408-1-sakari.ailus@linux.intel.com>
References: <20260402214954.3827408-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove kernel-doc comments from regular callback functions. These comments
have no information value.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx334.c | 93 --------------------------------------
 1 file changed, 93 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 9654f9268056..553a16b84f4d 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -566,18 +566,6 @@ static int imx334_update_exp_gain(struct imx334 *imx334, u32 exposure, u32 gain)
 	return ret;
 }
 
-/**
- * imx334_set_ctrl() - Set subdevice control
- * @ctrl: pointer to v4l2_ctrl structure
- *
- * Supported controls:
- * - V4L2_CID_VBLANK
- * - cluster controls:
- *   - V4L2_CID_ANALOGUE_GAIN
- *   - V4L2_CID_EXPOSURE
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx334 *imx334 =
@@ -678,14 +666,6 @@ static int imx334_get_format_code(struct imx334 *imx334, u32 code)
 	return imx334_mbus_codes[0];
 }
 
-/**
- * imx334_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
- * @sd: pointer to imx334 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device state
- * @code: V4L2 sub-device code enumeration need to be filled
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -698,14 +678,6 @@ static int imx334_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * imx334_enum_frame_size() - Enumerate V4L2 sub-device frame sizes
- * @sd: pointer to imx334 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device state
- * @fsize: V4L2 sub-device size enumeration need to be filled
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fsize)
@@ -749,14 +721,6 @@ static void imx334_fill_pad_format(struct imx334 *imx334,
 	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
 }
 
-/**
- * imx334_get_pad_format() - Get subdevice pad format
- * @sd: pointer to imx334 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device state
- * @fmt: V4L2 sub-device format need to be set
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_get_pad_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
@@ -776,14 +740,6 @@ static int imx334_get_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * imx334_set_pad_format() - Set subdevice pad format
- * @sd: pointer to imx334 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device state
- * @fmt: V4L2 sub-device format need to be set
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_set_pad_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
@@ -815,13 +771,6 @@ static int imx334_set_pad_format(struct v4l2_subdev *sd,
 	return ret;
 }
 
-/**
- * imx334_init_state() - Initialize sub-device state
- * @sd: pointer to imx334 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device state
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state)
 {
@@ -856,15 +805,6 @@ static int imx334_set_framefmt(struct imx334 *imx334)
 	return -EINVAL;
 }
 
-/**
- * imx334_enable_streams() - Enable specified streams for the sensor
- * @sd: pointer to the V4L2 subdevice
- * @state: pointer to the subdevice state
- * @pad: pad number for which streams are enabled
- * @streams_mask: bitmask specifying the streams to enable
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_enable_streams(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *state, u32 pad,
 				 u64 streams_mask)
@@ -929,15 +869,6 @@ static int imx334_enable_streams(struct v4l2_subdev *sd,
 	return ret;
 }
 
-/**
- * imx334_disable_streams() - Enable specified streams for the sensor
- * @sd: pointer to the V4L2 subdevice
- * @state: pointer to the subdevice state
- * @pad: pad number for which streams are disabled
- * @streams_mask: bitmask specifying the streams to disable
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_disable_streams(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state, u32 pad,
 				  u64 streams_mask)
@@ -1067,12 +998,6 @@ static const struct v4l2_subdev_internal_ops imx334_internal_ops = {
 	.init_state = imx334_init_state,
 };
 
-/**
- * imx334_power_on() - Sensor power on sequence
- * @dev: pointer to i2c device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_power_on(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
@@ -1101,12 +1026,6 @@ static int imx334_power_on(struct device *dev)
 	return ret;
 }
 
-/**
- * imx334_power_off() - Sensor power off sequence
- * @dev: pointer to i2c device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
@@ -1206,12 +1125,6 @@ static int imx334_init_controls(struct imx334 *imx334)
 	return 0;
 }
 
-/**
- * imx334_probe() - I2C client device binding
- * @client: pointer to i2c client device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_probe(struct i2c_client *client)
 {
 	struct imx334 *imx334;
@@ -1311,12 +1224,6 @@ static int imx334_probe(struct i2c_client *client)
 	return ret;
 }
 
-/**
- * imx334_remove() - I2C client device unbinding
- * @client: pointer to I2C client device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static void imx334_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-- 
2.47.3

