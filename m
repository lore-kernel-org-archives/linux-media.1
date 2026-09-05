Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D862C3768
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 03:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577679; cv=none; b=Ly37R7A9j6k0+A25P3l5IiQ0a/aTk07YphTBVPj9a6SV93fAiuTL3mB7cxVIRSn1teyX+7nI94+wObf4pQaYw6mdxSk+KKVj8CgtaxXWQxFtfQ9VydxqO7vJkFIfrxKMJXhs/jBeZIr6XdDeMIFDmVaAy8/57aUMxCqcO7rGjbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577679; c=relaxed/simple;
	bh=DD+PcFrgh0CLzl1TtJOuYtxQ8O4ql5WaHyAPnUH52AY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rg1eO9XUr8KRj8ztVfZLuls0rqU/1I+t/6fabH3j9DA+xJmPOaDFMOSZpf7aEvdQ8SvDwUizgPN6+kkyqGekJkPhkO45Bv7QyaiekS0TiNoingrJGSEFvoSIBt/qmcJvB6xOYK0uTURECZG2E//EcKndQuSZ6SE7Ibs2lZb+evM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHkIWP5o; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHkIWP5o"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso1799336a91.0
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 20:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788577676; x=1789182476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Hi2yx5cTlZVvtKcNUSCfKMwRgeHBhkYcO/EEuYGavU=;
        b=fHkIWP5o1dViOySUamIYfB7uvB+O1CQwxBoSVuDgvXaapVve5NOJQwheBbcIBwUw7q
         t/MRGffZBTDnIAVU3zSPDoVEqXMw57ulJtqyPTq5ygl11HouzVAWiI5zZ9Lwz9y5DWVI
         jAm54amxVUiypyRUygMa/3gFNc4oUNZ7S0zrYICducJFT2oV+5YKKX7faGixjU7cb8TB
         rBPH8A2h6EGVI/dk52Si2eguUtB7HoiMv5NCUJIDoLpnGBFdR5vb3/8fiuf0IAHdmJQT
         PlgBaF3kwPHQzN5CK49+wmHyjQGKlVPEgCgW/u7RvovM3SfY1WBH/yTFes2Io2zt8x7D
         9bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788577676; x=1789182476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Hi2yx5cTlZVvtKcNUSCfKMwRgeHBhkYcO/EEuYGavU=;
        b=mcMQNOQS6F9YFzobfACDMjv0bHLJVxhk2FZ/IBASDnLI93yQ/MvksDlt6c/poLisHr
         1YzRw2q6uSe51/IpI8uH59tbs/uDFkXn5POl+z+bKCcfswZ1yJ6aXVwhibe9EsjltrTG
         7W3ehhya+2z9s7iIPUNkJSJqJ20HSZ/5VjbkNFouxa+2x16pzWHwy/3sZSH8b1ZksjE3
         ARDyNj06cYh+yfeXK41GuKmnVnPwLk0Lr8NMqi+vQRgjjyTOf/Ds665PF8FqelHTXk9+
         vIf7WpGC5cuqpb0rukLqt8Ugo1rygnJj0rhAvRV8JNbpiSdqSw2KxFICSv382I5Khxc+
         M4xA==
X-Gm-Message-State: AFuF++mC2QF9OAgvPk4KdF2l3p4zZhcdYBwPUvFgLuRhGuobWVNAvyBv
	Hqadk+95c8EZh6nn6G+izIkQn/XVfCY+8lGTT6MWgD5q4UZxEcPVXLWA4O/ijpXE8x0=
X-Gm-Gg: AYBFou2wNEU6RapY3UQRa/RHAW22KMZ/WXWN3PtQMF5MiigHTg1eXGGwaWDkarY2Wg3
	jPVSf8O1S4uw8pu2xY1wRLwVN0bDgw3sufi9wC4wE06Nn9kQ+CmYaeBinVFayNntA56vTa18cGL
	yH82THFgZNFFmN1V798v2z3nhghnh3vFs+LUvHO761JI1ZwWk6XtzOuq2tAEPd1AkPYx19WWEn8
	Cdveid7x7tpttyhTkX1XaPXiN6TyJOeeUsbNcQzGY/JH0u0r+Ymyi5IxCZuOcqA5gLEImPoi75S
	fGo1ncOn8wnOalLPhwXZksaJGT2oxl6DhLHZcc0ZN9Hdu/RIguOJ8PNQvD7qshRmrHiPk+e0Orv
	GP51FKarlYSZW6XY8a5MCF12ZsN7QrCzgECH0XCKCeBvU6ZhTZLYiWFgyLGfk20VEpCrpUQfCig
	r5iasYNN1nVHibpwM/GrKNNYXrHOzeDOVAg6hQ5VWHK7wi8P7NILFlSr+qnk3c0iAB0tQOS5LHX
	bnuRy1bZYQf02sFq10P02WDaw==
X-Received: by 2002:a17:90a:e7d2:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-39b260d296cmr13266422a91.3.1788577676357;
        Fri, 04 Sep 2026 20:07:56 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm10344142eec.13.2026.09.04.20.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:07:55 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH 2/3] media: ov02c10: Implement get_selection
Date: Sat,  5 Sep 2026 00:07:31 -0300
Message-ID: <20260905030732.39196-2-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905030732.39196-1-calliarifelipe@gmail.com>
References: <20260905030732.39196-1-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver does not implement .get_selection, so userspace cannot query
the sensor's native size or active crop rectangle. libcamera reports
"Unable to get rectangle N on pad 0/0: Inappropriate ioctl for device"
and "The sensor kernel driver needs to be fixed" (see
Documentation/sensor_driver_requirements.rst).

Implement .get_selection returning the fixed geometry of the sensor:

 - V4L2_SEL_TGT_NATIVE_SIZE / V4L2_SEL_TGT_CROP_BOUNDS: the full
   1928x1092 pixel array.
 - V4L2_SEL_TGT_CROP / V4L2_SEL_TGT_CROP_DEFAULT: the 1920x1080 active
   area, offset by (4, 6), matching the readout window programmed in
   sensor_1928x1092_30fps_setting[] (registers 0x3800-0x3807).

The crop is fixed, so sd_state is not consulted.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 6220461fd..114db38c0 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -10,6 +10,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <media/v4l2-cci.h>
+#include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -18,6 +19,13 @@
 #define OV02C10_MCLK			19200000
 #define OV02C10_RGB_DEPTH		10
 
+#define OV02C10_NATIVE_WIDTH		1928
+#define OV02C10_NATIVE_HEIGHT		1092
+#define OV02C10_ACTIVE_WIDTH		1920
+#define OV02C10_ACTIVE_HEIGHT		1080
+#define OV02C10_ACTIVE_LEFT		4
+#define OV02C10_ACTIVE_TOP		6
+
 #define OV02C10_REG_CHIP_ID		CCI_REG16(0x300a)
 #define OV02C10_CHIP_ID			0x5602
 
@@ -767,11 +775,36 @@ static const struct v4l2_subdev_video_ops ov02c10_video_ops = {
 	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
+static int ov02c10_get_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV02C10_NATIVE_WIDTH;
+		sel->r.height = OV02C10_NATIVE_HEIGHT;
+		return 0;
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r.top = OV02C10_ACTIVE_TOP;
+		sel->r.left = OV02C10_ACTIVE_LEFT;
+		sel->r.width = OV02C10_ACTIVE_WIDTH;
+		sel->r.height = OV02C10_ACTIVE_HEIGHT;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static const struct v4l2_subdev_pad_ops ov02c10_pad_ops = {
 	.set_fmt = ov02c10_set_format,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.enum_mbus_code = ov02c10_enum_mbus_code,
 	.enum_frame_size = ov02c10_enum_frame_size,
+	.get_selection = ov02c10_get_selection,
 	.enable_streams = ov02c10_enable_streams,
 	.disable_streams = ov02c10_disable_streams,
 };
-- 
2.55.0

