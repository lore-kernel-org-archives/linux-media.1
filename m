Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA10B447805
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 11:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386120; cv=none; b=D3pd5Xu9PldRFAtjfd9uTWZNOIdwFKBUZZ2uYqKdIF38l1lgFgkB0kp7xA/qHsXHdEbq3hTjxrBg/qsqqCmGjE9xweECIRTC8LXGqgZ38Sm5zFlklqdcUs88LmiE+SvKg+I/SC/546kadYOGNO97W2ZZvJi7JtvG/KWsK4N8OV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386120; c=relaxed/simple;
	bh=VKSdYQvaqWvz1EoYz+h5ycoljt06DA1ZZ3DWNEN7DLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o9pM93yKG7WF9amNqaJqsUvGYKTQovNzO1DDb3HozrxcxERYxnC2rXd+pUHxKbE3giNusgNiB2uh2fWLL0P786zLoSFbMj1aC8Wouk3CtccfUos6IKwfmMSa9vqnPuckpb79NRilszYHjKI962F5lKY/SFl6NktP9+OepWLP6IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLFyLdzf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLFyLdzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789386119; x=1820922119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VKSdYQvaqWvz1EoYz+h5ycoljt06DA1ZZ3DWNEN7DLc=;
  b=ZLFyLdzfsyOYLs/nXrioGzdUmD27QP9pbnxJbwZ1KxkWsYqMCCoQZIma
   YCbPtsPvrd2XaRvqhECADX/FqagRByVY+Ol2cXRW6tENdMRklzCI1+HZl
   EbnI7avWbhv13PW18kImRcKmTQQcmc2FpBG2C7h/xNVm5AbMADoi0Sg4n
   O3g1ia/Z4+qHzT9YVdu/eUdBnVou8M73tbMbGv8gL9xEeJJ4/w8L3WJyX
   T1Jhd/bqyiJMzQFGDx7Cg7kf91uOPUv63uDLv1qcOW+AHF3iQdmD+tvlO
   mWAbr6iGtpkeX8bPyyTSLJs7y+mKGg2L/R94ZHawWGgjmbC8tfccMeBb/
   Q==;
X-CSE-ConnectionGUID: EB0fWO+LQBiym+5V+i7lzw==
X-CSE-MsgGUID: 2g50GP8OT1OI32A2aL+8/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93431864"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="93431864"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:41:58 -0700
X-CSE-ConnectionGUID: GeBfHh3WT1K4FYaJQiRe6w==
X-CSE-MsgGUID: /s/xHa2OSvKL48V92EKf0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="270812719"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.61])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:41:51 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AA4CA121BB6;
	Mon, 14 Sep 2026 14:41:56 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x654D-00000002PXX-0V26;
	Mon, 14 Sep 2026 14:41:45 +0300
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
	Antti Laakso <antti.laakso@linux.intel.com>
Subject: [PATCH v8 02/13] media: imx219: Account rate_factor in setting upper exposure limit
Date: Mon, 14 Sep 2026 14:41:33 +0300
Message-ID: <20260914114145.574791-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914114145.574791-1-sakari.ailus@linux.intel.com>
References: <20260914114145.574791-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rate_factor multiplier is used to multiply a few values in the
sensor's timing configuration and the exposure time is one of them. This
also needs to be taken into account in exposure time margin: multiply it
by rate_factor so that sensor's exposure time margin is respected.

Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 9571f3622d2d..5184523de8be 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -466,7 +466,8 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		int exposure_max, exposure_def;
 
 		/* Update max exposure while meeting expected vblanking */
-		exposure_max = format->height + ctrl->val - IMX219_EXPOSURE_OFFSET;
+		exposure_max = format->height + ctrl->val -
+			IMX219_EXPOSURE_OFFSET * rate_factor;
 		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
 				exposure_max : IMX219_EXPOSURE_DEFAULT;
 		ret = __v4l2_ctrl_modify_range(imx219->exposure,
@@ -893,6 +894,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		int rate_factor = imx219_get_rate_factor(state);
 		int exposure_max;
 		int exposure_def;
 		int llp_min;
@@ -911,7 +913,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 			return ret;
 
 		/* Update max exposure while meeting expected vblanking */
-		exposure_max = mode->fll_def - IMX219_EXPOSURE_OFFSET;
+		exposure_max = mode->fll_def -
+			IMX219_EXPOSURE_OFFSET * rate_factor;
 		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
 				exposure_max : IMX219_EXPOSURE_DEFAULT;
 		ret = __v4l2_ctrl_modify_range(imx219->exposure,
-- 
2.47.3

