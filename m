Received: from mail-vs2-f1.google.com (mail-vs2-f1.google.com [74.125.227.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690D841837E
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574835; cv=none; b=ZJ0vsww1sZ8Sg3858Nzoy1a6T8yvG/SKGjdkc6WHdT5vFqUqs9HKlsVUvdQ9jUEvBlhz1Sl0weCQZXKsgHQdHSdEDIRRWGdAtrwQooynglNISJMafERL694zGPz+r5JQt6VL3Jrmuqt3GGVRaThJvjChZTF4j6myZJsSgY/+fp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574835; c=relaxed/simple;
	bh=mWpgqaMLVdNvQ2B3v8Q4neGT8ctPXaZcrlTsdG2yvw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CO/672R/9qzjjMvnDIZbn38jNSBy4CJLWWQGmzBsMOc2MKQ6dcmtUwDCfS5iSWdVFquwKMpATip93Fvyvi6H+zRn26W7pUsRxBGHIM8vkqF7wMEoPCJBwAZ+zYe2TegniWEHt6JuAbyzfGeV/L3qILRGQqUjbggvK+zkuvTP5e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com; spf=none smtp.mailfrom=stromback.com; dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b=EQf0PESi; arc=none smtp.client-ip=74.125.227.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stromback.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b="EQf0PESi"
Received: by mail-vs2-f1.google.com with SMTP id ada2fe7eead31-76b25485ad2so3469581137.0
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 05:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stromback-com.20251104.gappssmtp.com; s=20251104; t=1787574832; x=1788179632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vy3utfX9ByqYEMM3pMYn0qisP+l1r21CJwxU5HY/mK8=;
        b=EQf0PESiXOHaZd09PCisBxfK5xBhtrJje6lW+wuIx6xaGsV1Iz66FAPUvqs97KRZij
         5hUgyjercM27zvjEWM63oQoy6zQt+rwzB4czMGgKb0ateTqRdJILulH4IVZnyjLr+CMn
         i1OY4dfOxsRxKeYwr1UF4npx0SUvWbrcTI25hy6bM2xvoUpaJhbXcEPTElmjJQEBJ6ob
         0D4gdZ0Eqgg0peBoPNtxiJfFNJ+6iN8JcbzQgsv/LGgpuH60UBOWQCwo+y+WaW9AULMk
         WUobreIJUyOiUFZ9BDfKCAvaW36Vy3GojJpRHNrPDgk0urhVRMxc+yXZSCj8M7aC/umA
         GcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787574832; x=1788179632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vy3utfX9ByqYEMM3pMYn0qisP+l1r21CJwxU5HY/mK8=;
        b=MKERGfpDSFyvplnrzNeexrtlajNLuWdYm8kPh2kxes0c5b4XNvKcanna8/tEvMz/jC
         TPXRV5zpWwd9IEJq436m5u3O6trm91PPpFHjuxPEpiqlxoMV6J0I3rOmlmO4IchWgEy0
         5NxqX06Va+6pvB9/aSn/QzB/fLhbzU/F7HHU0fCd8HrOoRFNt4Le54F1+aOu3UU7zD49
         6/e5H1/ReHwOVfXWaSSUOUq8o3dGXXZgpRUyddMgqCMbirmY3x2KKVfIc6zIL7qO3YCl
         Cv8CZgj70rCoTpszjjA9eE2llWNKqE0ghXFiWWmgninvMTvcZsZNmdfoCKYpts+YeqTP
         Uw0w==
X-Gm-Message-State: AFuF++megb3j3OLLpsch16G+AEn+9msDzUd3TuHbFS6zsdj+CM+dJ7Qm
	UBSiKQUgkEd5uJTSkEsdYOYX1rcGwlQP4mTMGkGtplXORUYFkfjouyVBlx6STn5q/pHweSEnNhZ
	yAAePHSyGPRStqWMXlQ==
X-Gm-Gg: AR+sD10Ti/TjD5066YCkF39Wkp7oCWtiGLISPHuoEY8YBgfbl+YNLKZZdw+8jnEKRWE
	i4N5SgXhQkZba2Xazyogo9Q3HakrF+CC6dRZk6iYU84Md5bgpR1xUfJzP/xoVsETdbsp4z/Iev4
	zt3n02ybEUKpixAAY4QdNYAk7QDcL98kGsCv7HrxDOKXtQ97QMtGjoKte7BnpucM7sQ2rnKvmWl
	hzp68bNTpPGtOc0M3uRCgfsvj5sLe8sLquv86cBl6Vs7v+04WIrHIGtesjLgm+g/jjU1th/hYw9
	URKfpthhBmdjdCvTFvwQ/KbFD/JIQEgKz6UZtvjXYyk3vHJk2rsMB/iaw9JsSsHAyeEjHMyeZgw
	MP4W1OR/WAt8X0WpKV6LG1nvtv+AiI2i65IGQ5A/KkyIULVFp8nx9YzoHRcGQgHA6QC5aoA+r/3
	MPRVOMu5RrkJco0Ti0DhqBCNK0deAPVHLW26sIOsa54r0jaaeYPhVMbTtbMY/c6mlmqUcvJdVy/
	bAyB16OGQE2c+dY/vjGgL4rnS75mT3zKcn2WlNJj4nXJrGM/MpisahM+MHKgBC2lPGHhHfzZ8fp
	/GdlcVLJfKMoHlkHvt9l8BZ9E9d0d3naGQUcVpqZ1O2N7jI9btmqjxBGRAG3/+gvkk0IORrnekK
	4HvBssRd548zc1w2K1hZmOQM3MjUoHUXkYxbfGaQEv6DT9iRWQ5r3wlSEOa1yD4M=
X-Received: by 2002:a05:6122:1792:b0:567:4e8a:fb13 with SMTP id 71dfb90a1353d-5c5ff772c86mr10140109e0c.8.1787574832240;
        Mon, 24 Aug 2026 05:33:52 -0700 (PDT)
Received: from customer.mmmiflx1.isp.starlink.com ([66.9.164.90])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623f3ea39sm3461367e0c.18.2026.08.24.05.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:33:51 -0700 (PDT)
From: John Cronin <john@stromback.com>
X-Google-Original-From: John Cronin <john.cronin@opcenter.com>
To: linux-media@vger.kernel.org
Cc: hpa@redhat.com,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	john.cronin@opcenter.com,
	John Cronin <john@stromback.com>
Subject: [PATCH v5] media: i2c: imx471: return 0 from get_selection after filling crop
Date: Mon, 24 Aug 2026 08:33:48 -0400
Message-ID: <20260824123348.3761049-1-john.cronin@opcenter.com>
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

Compute analog crop in set_pad_format: 2x binning, centered in the
native array, same idea as imx219. IMX471 2x2-binned 1928x1088 then
reports CROP as 3856x2176 centered in 4672x3512.

Tested on ThinkPad X9-15 Gen 1 (SONY471A / IPU7).

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2454119
Signed-off-by: John Cronin <john.cronin@opcenter.com>
Signed-off-by: John Cronin <john@stromback.com>
---
v5: drop extra braces; declare crop/bin vars at start of
    set_pad_format (sorted by line length); wrap to 80 cols;
    keep only the bug/feature in the commit log
v4: add Signed-off-by for john@stromback.com
v3: rebase on media-committers next
v2: compute analog crop in set_pad_format; return 0 after switch

 drivers/media/i2c/imx471.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index 4053aed84..0ea18fbb9 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -421,6 +421,8 @@ static int imx471_set_pad_format(struct v4l2_subdev *sd,
 {
 	struct imx471 *sensor = to_imx471(sd);
 	const struct imx471_mode *mode;
+	u8 bin_h, bin_v, binning;
+	struct v4l2_rect *crop;
 	int h_blank, ret;
 
 	mode = v4l2_find_nearest_size(imx471_modes, ARRAY_SIZE(imx471_modes),
@@ -431,6 +433,18 @@ static int imx471_set_pad_format(struct v4l2_subdev *sd,
 
 	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
 
+	/* Analog crop: 2x bin, centered in native array (imx219). */
+	crop = v4l2_subdev_state_get_crop(sd_state, fmt->pad);
+	bin_h = min_t(u32,
+		      IMX471_PIXEL_ARRAY_WIDTH / fmt->format.width, 2);
+	bin_v = min_t(u32,
+		      IMX471_PIXEL_ARRAY_HEIGHT / fmt->format.height, 2);
+	binning = min(bin_h, bin_v);
+	crop->width = fmt->format.width * binning;
+	crop->height = fmt->format.height * binning;
+	crop->left = (IMX471_NATIVE_WIDTH - crop->width) / 2;
+	crop->top = (IMX471_NATIVE_HEIGHT - crop->height) / 2;
+
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
 
@@ -468,7 +482,7 @@ static int imx471_get_selection(struct v4l2_subdev *sd,
 		sel->r.left = 0;
 		sel->r.width = IMX471_NATIVE_WIDTH;
 		sel->r.height = IMX471_NATIVE_HEIGHT;
-		return 0;
+		break;
 
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
@@ -476,10 +490,13 @@ static int imx471_get_selection(struct v4l2_subdev *sd,
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
