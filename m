Received: from mail-vs2-f1.google.com (mail-vs2-f1.google.com [74.125.227.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377693921F6
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787397913; cv=none; b=qaXXlqvSAQLGPGRDYSln5GiPe89LsDIs/n0ZQQefWHUPwk8XRayU4/vVQh3eGhs4COnKEDc3kC2dhS+QZZYKS/XtGRRfdqD7CmU2/XYn+Gbxy4B/xPiuIp0ypaEGRamVVlKGhI26AXLhLuURzZBKPwzSI5Sspzlhe7wFUwwrBHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787397913; c=relaxed/simple;
	bh=Hbis/+CTDGpFkXzFogO7rGTeGe5kuXmq8DhWn3s1kBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZf4+1dpcb1Lj5GBBPhquOvGK1cjYgDJESYdN1MtMN/Kuy4aYFGRfZ29zqtzrYXHVFsed+ODB7igDtgE/G/PSnqmyH76JrKxtKidqmrstpIpuhpXYPMuiNT/MZ2Xn1jnh7FX1jk7/6NuulvJa+tN/lk+BDhq6eIBeEveEP2NfQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com; spf=none smtp.mailfrom=stromback.com; dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b=m247t8XY; arc=none smtp.client-ip=74.125.227.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stromback.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b="m247t8XY"
Received: by mail-vs2-f1.google.com with SMTP id ada2fe7eead31-74acc945b83so1991109137.1
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 04:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stromback-com.20251104.gappssmtp.com; s=20251104; t=1787397910; x=1788002710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CY72CJ/Z5XC97BsJ2Sgr+g+L1Z5Xk6xMzRig/Sqcj0w=;
        b=m247t8XYcDY/TzQB5qJQNzd7VFfQKt8CJSSH9ppzTfUSubaoFL1ql0vwewlYqLEvHb
         gxJhZG7bJ1E7QWJsUxkqXUabOFkVAfVFpJBbBYAXGCP5yfZmS2orTW2Wy3N+jMpkbGaG
         GWo9XOkiAOulwvcd3P+KPETbcRaaF6IAUv7oa3GCLZuDh50/nKxoK3dRWcE12Pj0FmLJ
         HGrMuHT7MZRugVEG8llCoVxw8sz20YU/WCTl8iMFKYmQQHHP8OT+3O+p/iM5NNKaDx41
         v9omsde10/WtNnUsgIyuMlHf6Boji/hOiPlTpIJ16z0EwHP/viAmu0ABULBGNDHUe+yJ
         0tXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787397910; x=1788002710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CY72CJ/Z5XC97BsJ2Sgr+g+L1Z5Xk6xMzRig/Sqcj0w=;
        b=OeA2R9n+KLB9T2591xNZYtDfZ84YavuO69TNMYVFYCoG0KcASjTKzeuiHzJH49aS8Z
         tNxVdpu3Tuay/A1j25WFWJMnn4lPpDoWbkoVGu9chjKjJZnJhIza4O/PvEf4sZ/v+290
         xgD76hYUTpWaHHL7gvuscUsodBbyyr0RzNSyidzZ4LgoL/TiOSq5gQleDww0hEuf28mB
         lQ1amFG2eijnNmeox51C2ZXe4U3IA6lPQ1q/yyhDFCP4Zj0VHLkB/rzuBH6D5sMsgr6R
         EDn6pvzVNI9QfMJpH9DydAlOUjDZgkqqhPDIjnTmfj8MCFCubtXfK2q77buXeqdNNS0m
         NzCA==
X-Gm-Message-State: AFuF++ld734YRV8Ojbow/hNYcmqcQ9tuwFidoSrMEQFLx0XkU1OliFwo
	2ledfYGOOLJQYGEiQRAzym0HGZL4tWKanjZviWSv1qMoS0AZjHERITmPgSokx3lvP3Ya8mbcESA
	MgFGWHxOrDK8F/fBcNA==
X-Gm-Gg: AR+sD13ZMqYogz/0Esj7Xj3cKqhoy/4+VhTf4gKOJqnRa2nkkozvZnYhLLx1RBbr8bD
	h+YlhTm8es2+M1LU4Wwoeq+HS8+FEcKJE5y+H66cPB+7inZe2VgB4TsfMqH4LJGVx4pdEHU9w0u
	6UHItNCpN0PnjCg43yn7TsM8fJ11rarYIWph2Zyb74/i83bBVrNXPpY8n1cNNjO7RVwptZbeREQ
	rvYihEPi6sowo3sDzsQem+1Us2OX5DZO2Z8KrgD0gcMgwH8dHa8nZ9uX0V6lJZoYJJtZpbuP44U
	e9SJMRy4rRLziaS5FYbDKfPk+nN2g6W5rrQ9f8yv9mGZnyKLyBgwxOpNfBNCCa4vgBNxG3AGBaT
	nt+9qURGLlDuWrHJclePyb1ejQ+AK+BTMPw7LrE3yRMMgaKk5FryaUlkRiGp2/3IkY3cG+YEkVB
	WCuUDtX8cL4PPDrxmz5q34jsVS62bV60qGpnR95yoVT94Yhq93YE5Z3EKRTwp0vibqZI0apPZHl
	Zb4UZeaXEeBixeO2PXzOWRPhKEdRyD3XB75Togw5bVnfY9iFTm8j+j0F53NG9WHHeC+zrZbvuLu
	qqkd5aAdZ+0B3yPwAYDYkFmf/N+LdKGvGiwrcgv2ybRpIze4JNzGDhCBHCJDa3mIgMSQJBYI9ko
	tKyWd5JaokVre9lnNKfdWEEZlZPRvpAJq5Vf2sNlkl4JRnWRAxj53Kvzv9Net2yMePZw=
X-Received: by 2002:a05:6102:2c88:b0:772:5acc:b849 with SMTP id ada2fe7eead31-77a636413f6mr5552344137.5.1787397909736;
        Sat, 22 Aug 2026 04:25:09 -0700 (PDT)
Received: from customer.mmmiflx1.isp.starlink.com ([2605:59c0:13a1:0:944a:ce13:a83e:cdc8])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777d823dbe4sm11693233137.0.2026.08.22.04.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 04:25:08 -0700 (PDT)
From: John Cronin <john@stromback.com>
X-Google-Original-From: John Cronin <john.cronin@opcenter.com>
To: linux-media@vger.kernel.org
Cc: hpa@redhat.com,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	John Cronin <john.cronin@opcenter.com>
Subject: [PATCH v2] media: i2c: imx471: return 0 from get_selection after filling crop
Date: Sat, 22 Aug 2026 07:25:05 -0400
Message-ID: <20260822112505.3493870-1-john.cronin@opcenter.com>
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

Compute analog crop in set_pad_format instead of storing a static
window on the mode: 2x binning, centered in the native array, same
idea as imx219. IMX471 2x2-binned 1928x1088 then reports CROP as
3856x2176 centered in 4672x3512.

Tested on ThinkPad X9-15 Gen 1 (SONY471A / IPU7), Fedora 44
kernel 7.1.8-200.fc44.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2454119
Signed-off-by: John Cronin <john.cronin@opcenter.com>
---
 drivers/media/i2c/imx471.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index a0d7d7f..cab9797 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -430,6 +430,22 @@ static int imx471_set_pad_format(struct v4l2_subdev *sd,
 	imx471_update_pad_format(sensor, mode, fmt);
 
 	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
+
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
 
@@ -467,7 +483,7 @@ static int imx471_get_selection(struct v4l2_subdev *sd,
 		sel->r.left = 0;
 		sel->r.width = IMX471_NATIVE_WIDTH;
 		sel->r.height = IMX471_NATIVE_HEIGHT;
-		return 0;
+		break;
 
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
@@ -475,10 +491,13 @@ static int imx471_get_selection(struct v4l2_subdev *sd,
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

