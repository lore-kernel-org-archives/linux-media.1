Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E9C37757D
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 21:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787432604; cv=none; b=ZsOH34034+lPnWCVlz4gzd6ktCNLC9h2soxyMpA3nMfFe1+N8M/fA0osEfDWh0x132yaIwfLCPNK6OOJ8kBaUrl6NzhBG/tJgjVzwQ+KUiwmayusM1bcaQaZaxlJYVNwnCboZekPLtX3O9BTbdPQEQezE8hgiI426STMLDVupio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787432604; c=relaxed/simple;
	bh=ndo56FuAHli4Yq/rRFgEhqwFhjChvj2l1m9fC5MIEuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h25SQODz+gg7laAQjV1dsMP2O7YaJHu5czaNGmw5Sp+mFff1j0M/4Rrct/QOQZKpPmbS/dNenyYsZnLmmVNiXNPWghBuSLFUXnM4jaWr0N25xOce512nJhlnBvztSe/ijJFsqrCbo9hZDltF393zMY/wHdeKoQqKaQEs7c8F7d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com; spf=none smtp.mailfrom=stromback.com; dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b=wqQtSiXy; arc=none smtp.client-ip=209.85.221.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stromback.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b="wqQtSiXy"
Received: by mail-vk1-f194.google.com with SMTP id 71dfb90a1353d-5bfbbe5220dso1191925e0c.1
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 14:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stromback-com.20251104.gappssmtp.com; s=20251104; t=1787432595; x=1788037395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uPAw8L3s7ntVWQnsz44EV4AXS/34Pybezzyo+tUWPBw=;
        b=wqQtSiXyzJwehoFBzXuKKH9CvufI/0W/nI6kHHpRUbk2gmeUxZvNXqe1wcTsTh754e
         PdV8AWVprELImYNrII0HrQ0iP701+MXAhk3NC+rlOA48v/s4Hl17xFTceBL5yyWLpUHb
         Wgs9cnspXh/lyanYeSn6EDQGMgfvgmljfquLaoQfYaBrwgQZpv6c7XxmcYCKZBe5WDZp
         8eign4BlUdmpdQbgHyQ99qEpHLffV/vRZeOlWIZXfn27aag6XG2+a1YcEcH20S8BC4df
         UVDkJOfI5h06d1N5tNi1Wk6zAgPT+BBGSgy3lpTfkNXEsD9Qx4mLbG3o5g9YxmwWAogp
         IV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787432595; x=1788037395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uPAw8L3s7ntVWQnsz44EV4AXS/34Pybezzyo+tUWPBw=;
        b=rBft7ELvZK32XI1DU3jrjtXI+J/n9uVgnXCXFhmiRZEgRYteY0JEtZDGARnpcItcTs
         7BfaVHJm6X68LZ+4YRwFZZrEqXkHCwWaOjNgH/USzdw+FuftOQ9P1Fx0fq4VfL34nblM
         NLhaVIbw2TsjMBYjsJDa4UUKmlsk93XWm+jpOUN4YCUAo3pIat7aPaSGN0TRQmS0LCS9
         TfroEXiKKAOTpjJawvZpTjYrKezHMN2NfOYZFE22mqixpIXRv2qrKXb3G0kZB39+syMI
         tS6TJEuOSIXTkZExOVy6TApv1seVa0MdkQ6aDAiMWlXlAIACBoZpmI7PkE4J+KrnWYLr
         9AsA==
X-Gm-Message-State: AFuF++kO1DFa5cjotP/lVirpFTTj06psibfWCqdVN4swnAf7Zb9ujZMi
	eZ05pHVquT8/8byQwKE+xlc4Ezwg3RX9w369VhWmGF+YWe2E/4urlY4i+QlqSvitGxKkXQc+0hV
	DUCgBQWzIr3BR3xEQOA==
X-Gm-Gg: AR+sD108CtIubjcQOfc/O172mXUR28uymT/Bps3KidMe8PDvrgEyh6CM50lRuZYH5Py
	ypj9Bql6g8mQMHLV2Gifj5sDD8Wbjoa/iDdRrtU2HDETPms+6IxscwLhkX4+GhQFZ5Y20Cu6fBN
	wHDAvvGBnhapAVQ+aOtgwx8ZqQFKmAn9cZLkjMJcQRmqa9qTYBAkuyQFon8Od38EaFHZOGApD0z
	3QoS5wvfxoNWwDVF7LCQfzz+qWxSrdB5YmPK9E6HEIfTlvLHZ5YwD7n8OGLqtmWrJyz/xr61j6T
	S8077useGerji4ttMj5rqn/yZdKUmX08PHtQvSu66/GSoKg5LgKcAYtcMCu4secVgq5g1p6YnKQ
	zfT4XkDyCqvMvUBRC4f+aIqyajgpAYAmIGqz+b3uwmiafe+FuFSUqK+fF4QqN+MkIkp4SmczsG+
	9tJRXVerjnMqPdC4otXrjhHkifEJIFVBq7BLIQgg97bgctBwXMJ5XX6jwfrrRM/wt2QHVkvQlF3
	mYHYP5vj6A6FYpW5fAumSmn9CHmlfF1mOu7S8i69gdq0lj3UEPX8MHdRMj0wdDkyBXC32kH9U3P
	1GSg5rsT0tCkhiFgT74MeXRUqayD7H6icASnZUmDAL9Ud8euGlgXCmiY66DejxmVKUfcWIMCFAk
	l05BkcGCTUKFt8F6Kju4eE90zLNerPgpZ9Uzj/dtHjp8BwLj+7jIbux6aT4XiKOc=
X-Received: by 2002:a05:6122:2c32:b0:5c5:924a:4616 with SMTP id 71dfb90a1353d-5c5eedf40b6mr4960157e0c.0.1787432594787;
        Sat, 22 Aug 2026 14:03:14 -0700 (PDT)
Received: from customer.mmmiflx1.isp.starlink.com ([66.9.164.90])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e25e3459sm13177891e0c.4.2026.08.22.14.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 14:03:13 -0700 (PDT)
From: John Cronin <john@stromback.com>
X-Google-Original-From: John Cronin <john.cronin@opcenter.com>
To: linux-media@vger.kernel.org
Cc: hpa@redhat.com,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	john.cronin@opcenter.com,
	John Cronin <john@stromback.com>
Subject: [PATCH v4] media: i2c: imx471: return 0 from get_selection after filling crop
Date: Sat, 22 Aug 2026 17:03:11 -0400
Message-ID: <20260822210311.165824-1-john.cronin@opcenter.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816194259.151947-1-john.cronin@opcenter.com>
References: <20260816194259.151947-1-john.cronin@opcenter.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libcamera issues VIDIOC_SUBDEV_G_SELECTION with target CROP (rectangle
0) during CameraSensorLegacy bring-up. imx471_get_selection filled the
rectangle then fell out of the switch and returned -EINVAL.

Fill every supported target, break, and return 0 after the switch
(default: -EINVAL), as Kate Hsuan suggested.

Compute analog crop in set_pad_format: 2x binning, centered in the
native array, same idea as imx219. IMX471 2x2-binned 1928x1088 then
reports CROP as 3856x2176 centered in 4672x3512.

Rebased onto media-committers next (4900cad020c0). v2 was against the
Fedora tree and did not apply here.

Tested on ThinkPad X9-15 Gen 1 (SONY471A / IPU7), Fedora 44
kernel 7.1.8-200.fc44.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2454119
Signed-off-by: John Cronin <john.cronin@opcenter.com>
Signed-off-by: John Cronin <john@stromback.com>
---
v4: add Signed-off-by for john@stromback.com (Gmail From) so
    media-patchstyle matches the author Patchwork records
v3: rebase on media-committers next
v2: compute analog crop in set_pad_format; return 0 after switch

 drivers/media/i2c/imx471.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index 4053aed84..96d96256d 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -431,6 +431,21 @@ static int imx471_set_pad_format(struct v4l2_subdev *sd,
 
 	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
 
+	/* Analog crop: 2x bin, centered in the native array (same idea as imx219). */
+	{
+		struct v4l2_rect *crop;
+		u8 bin_h, bin_v, binning;
+
+		crop = v4l2_subdev_state_get_crop(sd_state, fmt->pad);
+		bin_h = min_t(u32, IMX471_PIXEL_ARRAY_WIDTH / fmt->format.width, 2);
+		bin_v = min_t(u32, IMX471_PIXEL_ARRAY_HEIGHT / fmt->format.height, 2);
+		binning = min(bin_h, bin_v);
+		crop->width = fmt->format.width * binning;
+		crop->height = fmt->format.height * binning;
+		crop->left = (IMX471_NATIVE_WIDTH - crop->width) / 2;
+		crop->top = (IMX471_NATIVE_HEIGHT - crop->height) / 2;
+	}
+
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
 
@@ -468,7 +483,7 @@ static int imx471_get_selection(struct v4l2_subdev *sd,
 		sel->r.left = 0;
 		sel->r.width = IMX471_NATIVE_WIDTH;
 		sel->r.height = IMX471_NATIVE_HEIGHT;
-		return 0;
+		break;
 
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
@@ -476,10 +491,13 @@ static int imx471_get_selection(struct v4l2_subdev *sd,
 		sel->r.left = IMX471_PIXEL_ARRAY_LEFT;
 		sel->r.width = IMX471_PIXEL_ARRAY_WIDTH;
 		sel->r.height = IMX471_PIXEL_ARRAY_HEIGHT;
-		return 0;
+		break;
+
+	default:
+		return -EINVAL;
 	}
 
-	return -EINVAL;
+	return 0;
 }
 
 static int imx471_init_state(struct v4l2_subdev *sd,
-- 
2.55.0
