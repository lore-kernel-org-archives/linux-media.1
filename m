Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03393C3F42
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 07:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784533006; cv=none; b=XHpo+LbNrjbIahNpXGKj+AC++VtBwhGMm8XSyUiL6A/Fdvo5t/QHP7J2KGsH8ZhkOnFaYFOJMygdsteaA1CbRHnWA2RRitiQY5iFLYppO3VVVgQDoukdIjyYgAdwi7vB0IvdGO9WmmtlI2tsqtPVeVta13GUVTiNRQ7Ca1B6RNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784533006; c=relaxed/simple;
	bh=v4hu2FVUIuRbMMjwhNK2gl5VcK9IOatLjIj1RyOdY+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oPMFpKydjJn/0/PMc4t3fcM4EJPN863rHeVRYESwg3EadbK5u2dZ+yIWt5JcGLDsjYG5FjJmRFzPjT2D7RnAePfyYMFxYh0hq9NurjCFwYKfJ4zGWzhwy06mJUuebusjvE3pQzjJIjopGf67inJMtHNIqTSXZfSnWhmbhZX/+uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i71ykvIV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i71ykvIV"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E60E1270;
	Mon, 20 Jul 2026 09:35:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784532945;
	bh=v4hu2FVUIuRbMMjwhNK2gl5VcK9IOatLjIj1RyOdY+g=;
	h=From:To:Cc:Subject:Date:From;
	b=i71ykvIVcDWYkfKfF3nfib6qA8XxaZRyvDpnt63ArmYAntQKMqEdrqQ3SM/Wi05v4
	 jL5yJBcD+3kYobAtGSJSqOlvUxh4hPss0zSQHkHsZfsuu6SFLOtgp7rSFvDWqPIj5h
	 pOa2OAshRrzEhNqY8ee9NEye9tAG+dGafyKLTZ3k=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Miguel Vadillo <miguel.vadillo@intel.com>,
	Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH] media: i2c: cvs: Pass link frequency explicitly to csi_set_link_cfg()
Date: Mon, 20 Jul 2026 10:36:42 +0300
Message-ID: <20260720073642.2290315-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The link frequency, retrieved in cvs_csi_enable_streams(), is stored in
the icvs structure to then be used right after in csi_set_link_cfg(),
called only from the same function. Pass it as a function parameter
instead to improve readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
This is a drive-by improvement, compile-tested only.
---
 drivers/media/i2c/cvs/icvs.h |  2 --
 drivers/media/i2c/cvs/v4l2.c | 17 ++++++++---------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/cvs/icvs.h b/drivers/media/i2c/cvs/icvs.h
index cfa8ef5d975c..17beb0920dd2 100644
--- a/drivers/media/i2c/cvs/icvs.h
+++ b/drivers/media/i2c/cvs/icvs.h
@@ -432,7 +432,6 @@ enum icvs_state {
  * @freq_ctrl: (future) frequency control pointer
  * @pads: Local media pads (sink/source)
  * @nr_of_lanes: Active CSI-2 lane count
- * @link_freq: Current link frequency (Hz)
  * @ipu_link: PM runtime device link (IPU consumer, CVS supplier)
  * @res: Resource capability (light/full)
  * @caps: Reported device protocol capabilities
@@ -458,7 +457,6 @@ struct icvs {
 	struct v4l2_ctrl *freq_ctrl;
 	struct media_pad pads[ICVS_CSI_NUM_PADS];
 	u32 nr_of_lanes;
-	u64 link_freq;
 	struct device_link *ipu_link;
 	enum icvs_resources res;
 	struct icvs_dev_capabilities caps;
diff --git a/drivers/media/i2c/cvs/v4l2.c b/drivers/media/i2c/cvs/v4l2.c
index 3a1ec0059ef7..9fadca7a3bee 100644
--- a/drivers/media/i2c/cvs/v4l2.c
+++ b/drivers/media/i2c/cvs/v4l2.c
@@ -46,6 +46,7 @@ static const struct v4l2_mbus_framefmt cvs_csi_format_mbus_default = {
 /**
  * csi_set_link_cfg - Program default CSI-2 link parameters
  * @ctx: CVS device context
+ * @link_freq: Link frequency (Hz)
  *
  * Populates a HOST_SET_MIPI_CONFIG command using current lane count and
  * link frequency, then submits it to the device.
@@ -53,12 +54,12 @@ static const struct v4l2_mbus_framefmt cvs_csi_format_mbus_default = {
  *
  * Return: 0 on success or negative errno.
  */
-static int csi_set_link_cfg(struct icvs *ctx)
+static int csi_set_link_cfg(struct icvs *ctx, u64 link_freq)
 {
 	struct icvs_cmd cmd = {
 		.cmd_id = cpu_to_be16(ICVS_HOST_SET_MIPI_CONFIG),
 		.param.conf.nr_of_lanes = ctx->nr_of_lanes,
-		.param.conf.link_freq = ctx->link_freq,
+		.param.conf.link_freq = link_freq,
 	};
 	size_t cmd_size = sizeof(cmd.cmd_id) + sizeof(cmd.param.conf);
 
@@ -91,7 +92,7 @@ static int cvs_csi_enable_streams(struct v4l2_subdev *sd,
 	struct v4l2_subdev *remote_sd =
 			    media_entity_to_v4l2_subdev(ctx->remote->entity);
 	struct device *dev = cvs_dev(ctx);
-	s64 freq;
+	s64 link_freq;
 	int ret;
 
 	/* cvs_set_link_owner(ICVS_CSI_LINK_HOST) */
@@ -99,15 +100,14 @@ static int cvs_csi_enable_streams(struct v4l2_subdev *sd,
 	if (ret < 0)
 		return ret;
 
-	freq = v4l2_get_link_freq(ctx->remote, 0, 0);
-	if (freq < 0) {
-		ret = freq;
+	link_freq = v4l2_get_link_freq(ctx->remote, 0, 0);
+	if (link_freq < 0) {
+		ret = link_freq;
 		goto err_rpm_put;
 	}
-	ctx->link_freq = freq;
 
 	if (ctx->i2c_client) {
-		ret = csi_set_link_cfg(ctx);
+		ret = csi_set_link_cfg(ctx, link_freq);
 		if (ret < 0)
 			goto err_rpm_put_sync;
 	}
@@ -345,7 +345,6 @@ static int cvs_csi_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 	if (freq < 0)
 		return -EINVAL;
 
-	ctx->link_freq = freq;
 	cfg->link_freq = freq;
 
 	return 0;

base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
-- 
Regards,

Laurent Pinchart

