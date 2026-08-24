Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834A7414A2A
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573692; cv=none; b=VKblGJQA7zT3LU+J0FaqqAnre9hRB5zIEVLJNYuKlOOJdqF91KuzLdEyg127HWNEg9XHx1SBuuPThAiljGWa2bcUXIdVior5CHKSGCVK6lTe4Z114Av4V8VvLpEoSq2QwLb1m4aQ7Hh3YGjTKOH6bseDZ7jnGNuYQkZBKFm3QjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573692; c=relaxed/simple;
	bh=EBmzP53tlrfOidYDXx1mOP6fvmaRxjAO/ifxxSpGvOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J4JFALjbuRKTihNQDQ/HD4ERhBFAvJJ6NdW9wmBw0F7iseZq1k0+Ee2GPHgCM3W3ez6GGNsq+uCBMa+WCCogOgi8iGRJXG8781YGQAfpI+7rAXSsdr8dMNrquAeLyBgl9AcylxnR4q/VI6lM6GOdSH3fsDIgNtZ5QYic+vJ41ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fq+hyFRQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fq+hyFRQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573691; x=1819109691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EBmzP53tlrfOidYDXx1mOP6fvmaRxjAO/ifxxSpGvOM=;
  b=Fq+hyFRQNTUes+zeSGszOffKax/iZpV20KWngGqmXutqwskvUZxHvjYX
   30AITBlCFhcZzgIHcYyupQugdvzqMFJOAGkNmDVkTmahPgJaTtLJXJyVU
   93efd43EPN0mxjVvU+4Ui+nME2J5ap6RtkgCDuvwe+s/pDJ9vK3LTHIO+
   nUh89bAAd96IRwPWUiu5P9bq6WuHuQ2DlYYpcP2Fq94cfKcr59S7W9ELV
   Gy5Wq1kHTxIYaZz4hEBHLIms4YVFZtA4ZESIY80SsMKbjkhEfAheQK/rl
   7A4W2a24dLbnLZFi2Z6gbnZT2evFSFOQaMWbxdxzK/IyAlro92rQ2VZ2C
   Q==;
X-CSE-ConnectionGUID: LDoVvy3YRN+AAkAPGbc5JQ==
X-CSE-MsgGUID: gp7iGqmvScaTyIDGMmqraw==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036514"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036514"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:47 -0700
X-CSE-ConnectionGUID: Tcq0fJSSQBOIG5KU9Dxo2Q==
X-CSE-MsgGUID: SLTXk7yBQWO+bAwaRLBu2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787653"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 71197121E52;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E39M-2V27;
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
Subject: [PATCH v3 11/29] media: rzg2l-cru: Use v4l2_subdev_get_frame_desc_passthrough_csi2()
Date: Mon, 24 Aug 2026 15:14:33 +0300
Message-ID: <20260824121451.3348583-12-sakari.ailus@linux.intel.com>
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

Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to set
the frame descriptor type in the get_frame_desc() callback.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 21 +------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 6dc4b53607b4..472154c5ca9e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -722,25 +722,6 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
-				     struct v4l2_mbus_frame_desc *fd)
-{
-	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
-	struct media_pad *remote_pad;
-
-	if (!csi2->remote_source)
-		return -ENODEV;
-
-	remote_pad = media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2_SINK]);
-	if (IS_ERR(remote_pad)) {
-		dev_err(csi2->dev, "can't get source pad of %s (%pe)\n",
-			csi2->remote_source->name, remote_pad);
-		return PTR_ERR(remote_pad);
-	}
-	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,
-				remote_pad->index, fd);
-}
-
 static const struct v4l2_subdev_video_ops rzg2l_csi2_video_ops = {
 	.s_stream = rzg2l_csi2_s_stream,
 	.pre_streamon = rzg2l_csi2_pre_streamon,
@@ -752,7 +733,7 @@ static const struct v4l2_subdev_pad_ops rzg2l_csi2_pad_ops = {
 	.enum_frame_size = rzg2l_csi2_enum_frame_size,
 	.set_fmt = rzg2l_csi2_set_format,
 	.get_fmt = v4l2_subdev_get_fmt,
-	.get_frame_desc = rzg2l_csi2_get_frame_desc,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough_csi2,
 };
 
 static const struct v4l2_subdev_ops rzg2l_csi2_subdev_ops = {
-- 
2.47.3

