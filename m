Received: from mail-vs2-f1.google.com (mail-vs2-f1.google.com [74.125.227.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4402DA768
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 17:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787420533; cv=none; b=BVgUund3C+wXnhUpF+eZ9/FNTdzxZWBU7811A72h42/4il2m/0Z+JNyNhYAZ4uIDAq69y8ASn5bRhEPsBPltn1JV74B5dMlas2/sw2SK/+rjJRTEjt5oJp4vp4XKP/TC4R//iOgM5dJPJ32wHUIJaU9XuG/I/OBzuut7TyXiSNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787420533; c=relaxed/simple;
	bh=ctyBFFWV7LPzBp9MOwSa/JKry2KLdLIYnebNOP4Te9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avOMtT5aleZ2GO651I4uRtbPSM3d8rhR38lzf/Kzu5iZFonX4nMuYilxqHz/eUxs0AgNtll7q7Q/p3HnOjD727j0g7DbRAW4Gvw/oYoIyOZbHlME/7prOY8WGQfV0TcvgFQikve3L5pnvomq1iILibmQ1dsTxO54FsMmwyjtRXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com; spf=none smtp.mailfrom=stromback.com; dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b=wVfSfhvw; arc=none smtp.client-ip=74.125.227.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stromback.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b="wVfSfhvw"
Received: by mail-vs2-f1.google.com with SMTP id ada2fe7eead31-760c4e95660so413830137.1
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 10:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stromback-com.20251104.gappssmtp.com; s=20251104; t=1787420530; x=1788025330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylP9yvvZ4VBkeFZCREVJRCP23pOO5RBRVT1bKhHvRGo=;
        b=wVfSfhvw/7Onb3Lz0NIbPUzSu6Y6PV6M5bMxzmgQYIFSGfMajCB8Ch3HjJQuociLKo
         S1jD1I/osuAjQATRnqIB+NVyRLcLzCY/fzIqaOuM6zdvw+25DlikQAjnbLfpkgPyb2Dq
         7ubc4F5M3YOhpymRakxSO9DOptm1ZcuzjzD5NyXqUjvZfeUOFINauE4qX8Lz/38/ZCkb
         i9zrSByPUrZypQu4VLQuJBzGQNdrbt5P7UGej2wKgqTYaozwkFyID1RGWSy2eeuA8WZx
         INXBOHKzsUumoNwZeEOd3ehA97O/jItFNj6gr3eiVk8hsT66apkEFXR2OL9RD8bjjVVC
         JAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787420530; x=1788025330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ylP9yvvZ4VBkeFZCREVJRCP23pOO5RBRVT1bKhHvRGo=;
        b=s0d4CJfNgo8/i5ZbuVj1SXtmJ1D9Pfc7aXc4/6UFOM5kHaKNP3N9rDzZwsXV38O7we
         tOGMRlmocHR4mP4e5Ir0r+FcjE5Tkm/psT7o++fcG/kzab3SjCmYX1+TpdHawmAewU6e
         rqx1MpD7tow9IH8jrhErP8rSyYYRcd5L7DZlPY7KLEQiMPjm/koElioAhXhlmfWyp6p5
         r1QnGGBy/ix9EO/9mUmcVKUYgie5jzTVRM1grs0P4GMw2tQf2ZGBt+lV5ZuZhrJVyido
         0IQOizDFQ2K6XF3UtEe9ZHptIRv528DIhXVFgvFVxdFUFUK9O/Pe1iXmxcNwMA8TfR3j
         cmmg==
X-Gm-Message-State: AFuF++nG9kgwkOlvBTO2a48Pm6aRTmnlJn+k5uT/smY/96RKVoUA0oxE
	gR4pFN73Q8rrvz9J4knzlaAddmWv9AdPAY7gQtUkwogfwKSmXYHdo4V0zVjz/LkpBA1S1v5f1+y
	/oq6XapvyM3nxYAvjZQ==
X-Gm-Gg: AR+sD11b/9IJufpNJkxIweDpVhi5jQLlCMrAL63kozrVBVplpC8xxBS6qLhVy1i2MDM
	hs6PJuB//xi9Lffk3QB7lz3eCmp7GokVZKLqqubNz8O1aFa0zZgPfxgelqwNgCfmN0dyFf8YIDo
	/5ugBtt3vpNVlvNua5nYQowORpjgdb3tBMBErdLC6sIiV2N2NNMBjvoi5D8lAbfXs01vQbXbkI+
	A1pryzQWQhnqNJvZNmyzsY/dOVwSTXuFsYE6IWnFVWYOkfO2fTeDlgxAvQPCPUoYDIe/B4Gw6CQ
	5xK3reJ4Fv8ArvdsTjV1fLzep9yIDxJr5zLAPuixutOiy0decSgCyoztcCaw+5CbDCL3hS+Wegh
	TD6pHVbqtjn5kar3za12E7xHQhjAF77DTW08DJLNNKN0EeHrH530FVJcDimcED32be2/miE1zQe
	d7S5W1SoUxTfBKNun3TrcBm/r7yc4M5ZRDvkvdwU7XCekNVaZP3uGCBuqHysjdVKQBsnIgd3sf6
	RGo/NUB2DFWO1t8qSZokQHw8EDx7N9qfOLLNEOJIC3JqpxCHClTBgvktYWAr2L2djf5gwGnKYlw
	wrsKG5dzFfYSM0ZIuQQ8SQZPWh1oFPj+0mLJX0AhUkJz/khhCvwCjqLHv4p5J9ubeQU39DLKFbS
	dKGC2f8CjnOHmncGXgemqTXCQfD612u5GAJ/Eys4D0iDEiKhaODULnzUuaSJ1UZAgiqbCzzrMwg
	==
X-Received: by 2002:a05:6102:6a83:b0:778:459:f0cc with SMTP id ada2fe7eead31-77a62948509mr4333532137.4.1787420529599;
        Sat, 22 Aug 2026 10:42:09 -0700 (PDT)
Received: from customer.mmmiflx1.isp.starlink.com ([66.9.164.90])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777dd4a7fb1sm12033447137.8.2026.08.22.10.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 10:42:08 -0700 (PDT)
From: John Cronin <john@stromback.com>
X-Google-Original-From: John Cronin <john.cronin@opcenter.com>
To: linux-media@vger.kernel.org
Cc: hpa@redhat.com,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	John Cronin <john.cronin@opcenter.com>
Subject: [PATCH v3] media: i2c: imx471: return 0 from get_selection after filling crop
Date: Sat, 22 Aug 2026 13:42:05 -0400
Message-ID: <20260822174205.4092670-1-john.cronin@opcenter.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822112505.3493870-1-john.cronin@opcenter.com>
References: <20260822112505.3493870-1-john.cronin@opcenter.com>
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
---
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

