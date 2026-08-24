Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521F241A4EC
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573700; cv=none; b=VQcJGfKqy8nRm7eSB298jPz4V49notIfwoOkGfGaNEkm1b+NnF3tCUREFAZ5U66oB8lei2t+gNPLJIjcLRtL8BITPpIFph/BFA6bgaCQ+zrvh+H5wy2myjGbn3AeC7Rh9diOSnW2D3C05nIqBjYwblmtGejwRp5sJNl4ZXASZGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573700; c=relaxed/simple;
	bh=hxLAtrSGrY3FgHUw2gbftC1FcLuDR05A+SVnaZkcj7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sILl3zSQFLXGl9163rCq0MaTpoZBect2gh3EYhYsl3P0zVnO/puCIWKI1hndjyg3jPwUKX+gxCfN/4cA6FsIpbxRv9oNlRFR3M8cx6X6wQ71POPhOiUQdJu6h5MCODcT1b5scQ0OoxorgdmOMS2tyCLS5k6+BmqUYfCYL+BPq/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xu3GUvpO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xu3GUvpO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573699; x=1819109699;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hxLAtrSGrY3FgHUw2gbftC1FcLuDR05A+SVnaZkcj7U=;
  b=Xu3GUvpOS6wd8jqLJxZMrlHmO/C+8nCcIEfJoIJD+nV926CyumqFRXVY
   IE4Pnfl+mB9toZPokLQswY1SJZug1fgCfK7Vbm1uVUxNA4kWPWE7sMH5j
   2902oY5Sn/i2iDzIDwj6IZ3DnSarIlPkz3jz7IXZPTHK+HmBTJ6suErOu
   bRAGNTEdShsu0pGe859YnTsT0LCXVcwveYQb0TFqHztZ5/vIilei0+VSi
   cmZ8zTpvzYfqEIPcQC9lF5heFwo22G98L0ysxoxP2UjaH1FUfzBJMb19Y
   seZxTv7A7yRTk67PNvNgUFpBe7c5XDi0lRE7nRikz1P6NYGvuaqIaof7q
   g==;
X-CSE-ConnectionGUID: r3ueW/maTJCNbGXDKwDCjg==
X-CSE-MsgGUID: DkeALUFKQ6WDtp9dlkcX6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036592"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036592"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:52 -0700
X-CSE-ConnectionGUID: Di395aCoR4GEqkvriYMlGw==
X-CSE-MsgGUID: Gu/ZVjaMS5SLWUTuS9Mggw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787661"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8AFA21225C2;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E3A0-2xKQ;
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
Subject: [PATCH v3 19/29] media: nxp: imx8-isi: Use v4l2_subdev_get_frame_desc()
Date: Mon, 24 Aug 2026 15:14:41 +0300
Message-ID: <20260824121451.3348583-20-sakari.ailus@linux.intel.com>
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

Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
preferred over calling the get_frame_desc() pad operation directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c | 19 +++++++--------
 .../platform/nxp/imx8-isi/imx8-isi-pipe.c     | 23 +++++++++----------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index e6c38a769205..5aef5cd179cf 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
@@ -32,8 +33,6 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
 	struct mxc_isi_dev *isi = xbar->isi;
 	const struct mxc_gasket_ops *gasket_ops = isi->pdata->gasket_ops;
 	const struct v4l2_mbus_framefmt *fmt;
-	struct v4l2_mbus_frame_desc fd;
-	int ret;
 
 	if (!gasket_ops)
 		return 0;
@@ -44,15 +43,17 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
 	 * to match the configuration of the CSIS.
 	 */
 
-	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc, remote_pad, &fd);
-	if (ret) {
+	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
+		v4l2_subdev_get_frame_desc(remote_sd, remote_pad,
+					   V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL);
+	if (IS_ERR(fd)) {
 		dev_err(isi->dev,
-			"failed to get frame descriptor from '%s':%u: %d\n",
-			remote_sd->name, remote_pad, ret);
-		return ret;
+			"failed to get frame descriptor from '%s':%u: %pe\n",
+			remote_sd->name, remote_pad, fd);
+		return PTR_ERR(fd);
 	}
 
-	if (fd.num_entries != 1) {
+	if (fd->num_entries != 1) {
 		dev_err(isi->dev, "invalid frame descriptor for '%s':%u\n",
 			remote_sd->name, remote_pad);
 		return -EINVAL;
@@ -62,7 +63,7 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
 	if (!fmt)
 		return -EINVAL;
 
-	gasket_ops->enable(isi, &fd, fmt, port);
+	gasket_ops->enable(isi, fd, fmt, port);
 	return 0;
 }
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index 934f7b356258..12b296d7bbe0 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -266,27 +266,26 @@ static int mxc_isi_get_vc(struct mxc_isi_pipe *pipe)
 {
 	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
 	struct device *dev = pipe->isi->dev;
-	struct v4l2_mbus_frame_desc fd = { };
 	unsigned int source_pad = xbar->num_sinks + pipe->id;
 	unsigned int num_vcs;
 	unsigned int i;
-	int ret;
 
-	ret = v4l2_subdev_call(&xbar->sd, pad, get_frame_desc,
-			       source_pad, &fd);
-	if (ret < 0) {
+	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
+		v4l2_subdev_get_frame_desc(&xbar->sd, source_pad,
+					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+	if (IS_ERR(fd)) {
 		dev_err(dev, "Failed to get source frame desc from pad %u\n",
 			source_pad);
-		return ret;
+		return PTR_ERR(fd);
 	}
 
 	/* Find stream 0 in the frame descriptor. */
-	for (i = 0; i < fd.num_entries; i++) {
-		if (fd.entry[i].stream == 0)
+	for (i = 0; i < fd->num_entries; i++) {
+		if (fd->entry[i].stream == 0)
 			break;
 	}
 
-	if (i == fd.num_entries) {
+	if (i == fd->num_entries) {
 		dev_err(dev, "Failed to find stream from source frame desc\n");
 		return -EPIPE;
 	}
@@ -294,13 +293,13 @@ static int mxc_isi_get_vc(struct mxc_isi_pipe *pipe)
 	num_vcs = pipe->isi->pdata->num_vc ? : 1;
 
 	/* Check virtual channel range. */
-	if (fd.entry[i].bus.csi2.vc >= num_vcs) {
+	if (fd->entry[i].bus.csi2.vc >= num_vcs) {
 		dev_err(dev, "Virtual channel %u exceeds maximum %u\n",
-			fd.entry[i].bus.csi2.vc, num_vcs - 1);
+			fd->entry[i].bus.csi2.vc, num_vcs - 1);
 		return -EPIPE;
 	}
 
-	return fd.entry[i].bus.csi2.vc;
+	return fd->entry[i].bus.csi2.vc;
 }
 
 int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
-- 
2.47.3

