Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C636F365A1A;
	Fri, 13 Feb 2026 14:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991376; cv=none; b=J7XHHDv6ZFeZKk4wU720wiZoj6etHoIP1af0H+g9axL3Ht2l9uyiKNq/X1ox0VFEHyglwo1OcObJAKOxFJxReHQQNpvdBdZeVv2i3nTSCehowv63oyKOVCXDopVuI5smr5wOzqdKlGBUTxZQezRWGMyooDOY+acsq7C79MbMNeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991376; c=relaxed/simple;
	bh=Cggui14yqD+YsFkwc9xNRMRBNxVEcJohPeJ3RQ6/uVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=erlCgNbeI8Ysx1otKh4xDlgUnaKM5H9qjoHcik4sL0BVmsiifdHh+qcLyWWPeRCDDa94o7syFApi5ooAJLP5CrfZCwqWmMibXmnj45M6HErcN9mn+wapSoE0n58u1tZLNxfHi/zQd/syh6AGZNaZh2L2fu4vuqnFL4Y2q0sljHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QUBOcjey; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QUBOcjey"
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCA2D27F9;
	Fri, 13 Feb 2026 15:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991286;
	bh=Cggui14yqD+YsFkwc9xNRMRBNxVEcJohPeJ3RQ6/uVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QUBOcjey6Tt+nu/8KnCZPunWtVvslrAVCd5oEE3istL4MJWVFPGP+Shb8+gW3DXXi
	 ACCyocRi1GT13HgwLwYhhP1mEYc8KWGBzohutm1vtrZ+vTLHhlmDRBRQCQUAXaZMnS
	 jOEyd9DHUnAY9EaoqOSpcG6X0o6G5ocRMnmWB+M4=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:02:03 +0000
Subject: [PATCH v2 24/25] media: i2c: imx283: Update exposure range on
 blanking changes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-mainline-imx283-v2-v2-24-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
In-Reply-To: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
To: Umang Jain <uajain@igalia.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=2419;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=Cggui14yqD+YsFkwc9xNRMRBNxVEcJohPeJ3RQ6/uVg=;
 b=ZrhvsvwScr7lJbn31vR2sEsg1cwwujiJHB/L2Q359dthRaunD14NJBqR5+03ZFXjpDfW1i4bt
 L/lWBnI3Kh6AstgGUOWjvT6fBCvyanS3oBAUklsMpSUJF4SESOB71rA
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=

The exposure ranges are updated currently whenever the VBLANK control
is updated.

However, the total exposure limits are a factor of both the HBLANK and
the VBLANK durations.

Determine the hmax value any time the control is set, including
if the device is not yet streaming and update the limits accordingly.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 25e669370751..f0ede67921d9 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -857,7 +857,7 @@ static int imx283_set_ctrl(struct v4l2_ctrl *ctrl)
 	const struct imx283_mode *mode_list;
 	struct v4l2_subdev_state *state;
 	unsigned int num_modes;
-	u64 shr, pixel_rate;
+	u64 shr;
 	int ret = 0;
 
 	state = v4l2_subdev_get_locked_active_state(&imx283->sd);
@@ -868,15 +868,24 @@ static int imx283_set_ctrl(struct v4l2_ctrl *ctrl)
 				      fmt->width, fmt->height);
 
 	/*
-	 * The VBLANK control may change the limits of usable exposure, so check
-	 * and adjust if necessary.
+	 * The VBLANK/HBLANK controls change the limits of usable exposure,
+	 * so check and adjust if necessary.
 	 */
-	if (ctrl->id == V4L2_CID_VBLANK) {
+	if (ctrl->id == V4L2_CID_HBLANK) {
+		u64 pixel_rate = imx283_pixel_rate(imx283, mode);
+		u32 max_width = mode->crop.width + ctrl->val;
+
+		imx283->hmax = imx283_internal_clock(pixel_rate, max_width);
+	}
+
+	if (ctrl->id == V4L2_CID_VBLANK)
+		imx283->vmax = mode->crop.height + ctrl->val;
+
+	if (ctrl->id == V4L2_CID_HBLANK ||
+	    ctrl->id == V4L2_CID_VBLANK) {
 		/* Honour the VBLANK limits when setting exposure. */
 		s64 current_exposure, max_exposure, min_exposure;
 
-		imx283->vmax = mode->crop.height + ctrl->val;
-
 		imx283_exposure_limits(imx283, mode,
 				       &min_exposure, &max_exposure);
 
@@ -904,8 +913,6 @@ static int imx283_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_HBLANK:
-		pixel_rate = imx283_pixel_rate(imx283, mode);
-		imx283->hmax = imx283_internal_clock(pixel_rate, mode->crop.width + ctrl->val);
 		dev_dbg(imx283->dev, "V4L2_CID_HBLANK : %d  HMAX : %u\n",
 			ctrl->val, imx283->hmax);
 		ret = cci_write(imx283->cci, IMX283_REG_HMAX, imx283->hmax, NULL);

-- 
2.52.0

