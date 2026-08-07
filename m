Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78073433053
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 12:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105484; cv=none; b=sxMEMnG8hqgaGYb0enfBC/hDFWAlDWUln3LWVSdOkBRGOh8JOndCcQChbgZ0kc4LuGPK+ar4VsS9fh7GMm+6mwyazyqaKizBzkW3pIWvEwVOlMQ53xuKGVKzzvwiOW76O00L5RHK1rxkZvDjpwgpacCzwGN4RSuqN6+TI2LeLUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105484; c=relaxed/simple;
	bh=VKSdYQvaqWvz1EoYz+h5ycoljt06DA1ZZ3DWNEN7DLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aT+o7aShMsiD3yoSaekWmg2nzfgcLW2kPHb56zzv+Vm6gfP80MMwSY9vXz2fOrcG69CvGFSjOrPoZXyKH2QMjHBah0rMoer8ePAake9ePQpEV7237RU+Nyubl2eeNeYuwFyfY+WI0+8GpUW0S+WwCHYvgIhNUFZTlqDjnnMjIjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gIeTQkQm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIeTQkQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786105476; x=1817641476;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VKSdYQvaqWvz1EoYz+h5ycoljt06DA1ZZ3DWNEN7DLc=;
  b=gIeTQkQm/y5BnHEY6C7kYEXLpI2h23x+jhWcBUK0QrPJxjcKDH8Nxpiv
   nBB3qqJ6Fo7y/HuQcgrzVqyVUv2SWumNHKwIS+5oEyJoKJtHqjx1f3njO
   5rMl40oGOvKVVXu3m+aELnK+Z+uPmhsCZBzc8Qi0+Sq3m6Vs6UQxNQBco
   cWl5NpA4g1Kq692xnBkiI3WKRaDtAnKVtlZ3ettH9TgnHkRv5nK5JBgtA
   DNLo2fiBJHm2IUYaC1u3CBErPEOHYo8r3qWb7WCwy0bM2Q6uaKnT5kvEu
   06r8EskzrndBVdf2TtLu9L6xyjUR/9fCs6EAWPvFyT67QSGlf89PgQfl2
   g==;
X-CSE-ConnectionGUID: rWqH83XBSnmwF4ThNtjlOA==
X-CSE-MsgGUID: IQn4LcldQT6fn0xd4D38ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90591913"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90591913"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:29 -0700
X-CSE-ConnectionGUID: G4nVAs/SR36WW/+KX/yIew==
X-CSE-MsgGUID: 4lIUN8LwTYmfe/FV3kJNHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259779637"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.179])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:23 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 90184121CAD;
	Fri, 07 Aug 2026 15:24:20 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wsJcP-00000000Bvd-2x4Y;
	Fri, 07 Aug 2026 15:24:09 +0300
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
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v7 02/14] media: imx219: Account rate_factor in setting upper exposure limit
Date: Fri,  7 Aug 2026 15:23:57 +0300
Message-ID: <20260807122409.45807-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
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

