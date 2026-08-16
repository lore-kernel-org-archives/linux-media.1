Received: from mail-qk2-f3.google.com (mail-qk2-f3.google.com [74.125.230.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2A43B4E8C
	for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 19:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786909384; cv=none; b=Srfax5zJHiCLBBbUr9XPqjYK9j8dbEnz16XGV+pjf2iCBiM0LFPZPALDaLJUqgbCxW4GeZIbxiLig1GpMzAp2jBJYhyJP84QLj0cexqSEtAQVcErN3r6boRjcmzXkpjhQsvBExgNG9Lz/LjGTO4BoYBdD08wYBZCov8JUdwjeAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786909384; c=relaxed/simple;
	bh=XTjLywHHiODCI48vFYEaqMvzceHjRuHUbVBsoMeYusE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ow3mBQ/4FuUnQHirUYEvtWl1NF5gdsoH+irlGaa5TubrjCWT1fBCHNqwUuP2158/CNGQjkMquINv7+QWeJzGDZ2MKdFJwno8f+55Qwwn2xytAoEX4HUhQvibOjLuIOt0g9+205fhgN6jjLWKW7b1ihDJkFl7IbzPhc4RB1MwQOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com; spf=none smtp.mailfrom=stromback.com; dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b=IIsO6nXA; arc=none smtp.client-ip=74.125.230.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stromback.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b="IIsO6nXA"
Received: by mail-qk2-f3.google.com with SMTP id d75a77b69052e-51bfca7f85aso14300141cf.0
        for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 12:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stromback-com.20251104.gappssmtp.com; s=20251104; t=1786909381; x=1787514181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XucQrha8yA7YIcpcwylLEHitZj+12lRTWkmyyIoLFDA=;
        b=IIsO6nXAJDW5E4vnel2HlHUWgEuDtZ1y6Xhcuhnc/iUAKYTZvBvL/uAnnE5x2d6qCo
         Y8YHnjj/QZyROs1kY5tdx+YnIgrmNllUUrec+ZssRSURErwNwvJ8zFNA5EU5FKEKWefm
         voAH8LFgqbzq7sbJlROLbCHmsp64BiIK9GtUjh5cR19IpjvrFPhWTaPDM0yf3W8z2cGk
         JnIlnevBtLz/NHL53xDlOcaUG+y8xXE066Lf+IpWiFX3C4PSn0AcTfvm/jpWWOA73JoR
         tkXzvgezR7oxZCXHFjHsxAPHMEfqHO78kk4wrv3cjHZwqJw/2ZT9GSLaTjqcn+jRxVuo
         uCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786909381; x=1787514181;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XucQrha8yA7YIcpcwylLEHitZj+12lRTWkmyyIoLFDA=;
        b=GVNiHwEIqXKGjgu6wP6xaqe1TGxRubCzY+O83xGv/Jn5ejiMQcGGttU3EFlutGWHY2
         77CPeG3GB6FnxbBd9cPkSSXABYZtWqmhSpLhokBR+PrGiMM5ezeXFus8yS9FBgQptF/l
         ZZc0xa3HZyrHSChlPsL1rwxw4O8EQ4qHKQoEfurg69qLeNcPoI4EEZBH/bEHu0WmdhSK
         ANQpBCRjJm8ZaZP5HcvBetATrhBYTexLtFMO8XLsf7yyze1yTZhpVYbgV/4iNEMaFIc8
         +uRjXymUdJBr2UWNy916cS368qDsqdb1ivyzw0H1J0RiIFjd/gFn8hbFyS0p7lavBPbL
         o6Bg==
X-Gm-Message-State: AOJu0Yx7UC6Az5j6np92fmRae9DahUxtDcPPEqaBxU+x499oR69iDr8j
	Z+YAHy/zvHFUKjiuxV6HxmSOiEoSgCIcUNsJWYCSIiazwVmUFlZ+7d2j+8Gk3wlYj0WYiF9Ila0
	6m2NL7I6kpZA8
X-Gm-Gg: AR+sD13ooPGCXrVvx8I4eWZF3RwhXkAVA+LSU2BHdUBSQnRek/laoCqvlfef6mAXitG
	DwWwukOwCjIntg7Odysh4U+sapxSwFtN8T0C9TY2DmPdauw/SqEOKMeXWwDJgxQ9IJjcip03tgu
	3LnJQYqro6RZx/LMnFgTbFwuMzdsBdjbdTn9wxktKIrz/7rPzArjv5FzCihZmDkiEfMwcpAW1Zn
	e0pfs/u82KeUg2Wxus2YCTkIupuswoUWxI8zbDGxNZSYIX9KIykKbOwAjbuz4oZ9ELNykU7WvI8
	Vaz8ssH8BSD4UHM+oMW+fFJFS91d1MkN6tO04J0blSzsNDYiD2TeqvIAUARQqjh/Ng0WJdljQhW
	YxM9QUjGkDh+CeP1k+MymmS/SOS1SsqJg5/Wmg2jPAue6UyZkJ+7rY4II5UP2tP8/MU+JzTNi2w
	6mjL4sVawuj1zMd4lLr9IBKrayP34qvpQr5xuT7kSDYwSbi9BbTWLN8lTbCRGPdhYw1xNwMJUeQ
	rwTr1KtyQdtD3Jbxyrpc4efkGl48ddXsdczo0om6tkX0V+u6F2DXyI0REHIL3J3WMF7nmwpryGY
	2rDOsFu1ewn2la+WhOa9yrAMLaez16d1LamvtSuO6vpcUPgJmc7/0q8aO+5McVZLrGDCh4n9wVz
	EO2XkIhdC34sXLhbxc5wqk/Aj9HudU37aYwyYDUTzPWS6QR5J2IW2dB5NpdSZcUJkyhE=
X-Received: by 2002:a05:622a:c9:b0:52c:dde9:5cd5 with SMTP id d75a77b69052e-52d8542c8c3mr220349341cf.21.1786909381156;
        Sun, 16 Aug 2026 12:43:01 -0700 (PDT)
Received: from fedora (c-76-151-41-221.hsd1.va.comcast.net. [76.151.41.221])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d996acee3sm32818171cf.11.2026.08.16.12.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 12:43:00 -0700 (PDT)
From: John Cronin <john@stromback.com>
X-Google-Original-From: John Cronin <john.cronin@opcenter.com>
To: linux-media@vger.kernel.org
Cc: hpa@redhat.com,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	John Cronin <john.cronin@opcenter.com>
Subject: [PATCH] media: i2c: imx471: return 0 for V4L2_SEL_TGT_CROP
Date: Sun, 16 Aug 2026 15:42:59 -0400
Message-ID: <20260816194259.151947-1-john.cronin@opcenter.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libcamera issues VIDIOC_SUBDEV_G_SELECTION with target CROP (rectangle
0) during CameraSensorLegacy bring-up. imx471_get_selection filled the
rectangle then broke out of the switch and returned -EINVAL, so
libcamera logged:

  Unable to get rectangle 0 on pad 0/0: Invalid argument
  Failed to retrieve the sensor crop rectangle

Match imx219: return 0 after CROP. Also store the analog crop window
from X/Y_ADD_STA/END in the subdev state when the mode is selected, so
the CROP rectangle is not an uninitialized 0x0 box.

Analog crop for the 1928x1088 2x2-binned mode is the programmed analog
window 8,408 / 4640x2644 (native array coordinates).

Tested on ThinkPad X9-15 Gen 1 (SONY471A / IPU7), Fedora 44
kernel 7.1.8-200.fc44. After loading this module:

  VIDIOC_SUBDEV_G_SELECTION CROP         → 8,408 4640x2644
  VIDIOC_SUBDEV_G_SELECTION CROP_BOUNDS  → 8,8 4656x3496
  VIDIOC_SUBDEV_G_SELECTION NATIVE_SIZE  → 0,0 4672x3512

libcamera no longer logs "Unable to get rectangle 0 on pad 0/0".

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2454119
Signed-off-by: John Cronin <john.cronin@opcenter.com>
---
 drivers/media/i2c/imx471.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index ae0e4d4..18b81aa 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -131,6 +131,9 @@ struct imx471_mode {
 	/* H-timing */
 	u32 llp;
 
+	/* Analog crop window in native array coordinates */
+	struct v4l2_rect crop;
+
 	const struct cci_reg_sequence *default_mode_regs;
 	unsigned int default_mode_regs_length;
 };
@@ -283,6 +286,13 @@ static const struct imx471_mode imx471_modes[] = {
 		.fll_def = 1308,
 		.fll_min = 1308,
 		.llp = 2328,
+		/* X/Y_ADD_STA/END: 8..4647 x 408..3051 */
+		.crop = {
+			.left = 8,
+			.top = 408,
+			.width = 4640,
+			.height = 2644,
+		},
 		.default_mode_regs = mode_1928x1088_regs,
 		.default_mode_regs_length = ARRAY_SIZE(mode_1928x1088_regs),
 	},
@@ -430,6 +440,7 @@ static int imx471_set_pad_format(struct v4l2_subdev *sd,
 	imx471_update_pad_format(sensor, mode, fmt);
 
 	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
+	*v4l2_subdev_state_get_crop(sd_state, fmt->pad) = mode->crop;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
@@ -461,7 +472,7 @@ static int imx471_get_selection(struct v4l2_subdev *sd,
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
 		sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
-		break;
+		return 0;
 
 	case V4L2_SEL_TGT_NATIVE_SIZE:
 		sel->r.top = 0;
-- 
2.55.0

