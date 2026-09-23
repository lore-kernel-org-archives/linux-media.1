Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8776C5304AE
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 14:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174633; cv=none; b=jGlm9r8zoSOTJN3BhCn5o1tRowLJik2bL5YawcgtYPoNXarnpF5T0wMqrRJjPv3pU2dhF4+bIG7UBzJ3JkBs9qvDru+vGNcDT05SziGv9OaVjpVlaaLanv2f9ZhplxHKkKbCKBSqXQZxX/POVGCrABwtF5BG2sqUJfZy/UHzmJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174633; c=relaxed/simple;
	bh=wJgO7d+fHuOWvY3n5oV66gnjobfoBM0KIvfHm+HTvh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3S+SdgY79DmaSyADktFPer2GFWHys5qRlHVHpmCVs8ioq9MMTa7GHT1V2ATI01n9sNDwXlQYs5Gp7U+pZjKz3hNwcmUllw8374p9AlRVAnt4gVkKUqOGfmsnyhhbAfg6oVRP7LPjFcd2aLETmZlyYQvRqUeu+dfqSEHa83maCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYhn0Xp/; arc=none smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYhn0Xp/"
Received: by mail-vs2-f40.google.com with SMTP id 71dfb90a1353d-5c9a1536864so712943e0c.2
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 07:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790174627; x=1790779427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FX/p4nYY/p7jl8HMo2CeBSLuQT/9YvuBtl2IrPIDj5Q=;
        b=sYhn0Xp/s6YLT0s/r9co8pzwvsIPO4zLamcGyY6wEBrU2zYv4spiT9zkVIMEGs/fd/
         Oxh/Oc0bcTBUM18iI9BuzjEVkthXte+7VRphTndZ3b6HYrPRIEH5fJZ3A3Mxt4zone6w
         73Cfy6uCZMlm0ACTyUDTOO8ZzvdTFjpnWfmnlz9tfjQ5aD7FeNNpb0wdyd+wV6DRRdh0
         8/RmWpYvg0Dl8B4ARW1jTILX/4H7fk6LHT2tKIA1Alj3c7u38r5d0X3jkxk33X9iSbCx
         Cu2Aceu71fLsLnwVuVC61FwBr/aiOHPCFhS4UL7sECc27ns245p4Fa9zCGlLTfdPPaes
         iyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174627; x=1790779427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FX/p4nYY/p7jl8HMo2CeBSLuQT/9YvuBtl2IrPIDj5Q=;
        b=huGhAGVHhZZgymvZ3nUjljDjw8N1NQrdIWoAE5DkmE5rtPrPoV3kfhIqdIJ4o6zLMo
         1yBrH8C2JQ6sTxic2aU09x3fDZS44QE35sXBIamo0wR9dTUwahdi7PcyHRt+r9wREtAC
         yDM1N5+5EP7Gdaxwi1/9pxVnDbxYYQVve/7EyY1qndckBn/dfZoTE/2T7GfB5QJ5Xty9
         UG+A3snnKkMAmld1yag8j1dxqW55Pzv1cwaSELLxgTdNWPDyPY9Z7d+Tq9o8TWajLKB6
         Y/VBEAp5MdZoIVTpCC4ZU81G45RqL6AgiwnTnt8rqHrdHOJ5uZerBY5i2HsRpTNVJcmr
         faLA==
X-Gm-Message-State: AFuF++lwLJbMfN2M0TgoJjYvsjqRDv5LICYGeAPjRC1mT7KuK2tGWyEn
	XAaQSXRZRTLPqNNqc6NtjFAZfG4B2fIFSdAm3b28zw1poTPJ02uP4eQNsNMyg4n2sr8=
X-Gm-Gg: AYBFou1wy0tLDe9pJAgESL1YYpJvgOmMIz5XR10Jw6KJBekvWfmRIG7J7ndoOsnF9La
	cQTxDJwW9KkGRFZwmr6bqsNWlFEKlAAagol5ZG2IrkJXRbvfKhC1QDzbsS04D+Mic1PpRgKLeHD
	6jYuREIC2+33k85/BpQF08TH552gkxcDe1uSz0Wrk0Lj00G0Lr2UueWoW/o5yDRo0fwQgQvQvOd
	06poCf/FNijEfKzGNRkosBJNqjhheavAP0ERfbeQwJcN05uxoxdNKVPbCB8C6xRNgymaavquLTG
	ecAvoA9n6Vvx5H2+QZlGu8gZ/yDU89kNuVNadiWGMXHhXUCKB7WaV384mptauVGcp/vS9XFPxVv
	4Os21yrdLhw9e45i/Mw0XVOFAismLxAaHqpMTsw772IgCBorg19tb1dIiFQYdiKoRWH/5Fwoar1
	/2sbd0Wf8MT2kmuCUV2GFY3GYaoSkUbIrKdZq0nAkdLOVwhMeqtzPaAhx7L8VuWFX/TiaLGyU=
X-Received: by 2002:a05:6122:2907:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5c9f159bce9mr3390782e0c.5.1790174626981;
        Wed, 23 Sep 2026 07:43:46 -0700 (PDT)
Received: from archsung ([139.82.178.10])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04fb621sm3566169e0c.9.2026.09.23.07.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:43:46 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 2/3] media: ov02c10: Implement get_selection
Date: Wed, 23 Sep 2026 11:42:56 -0300
Message-ID: <20260923144257.119076-3-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923144257.119076-1-calliarifelipe@gmail.com>
References: <20260905030732.39196-1-calliarifelipe@gmail.com>
 <20260923144257.119076-1-calliarifelipe@gmail.com>
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Mars-Wave <tmorolias@gmail.com> # Samsung Galaxy Book3 Pro NP960XFG (github.com/MarsWave)
---

Changes in v2:
- Add the const struct v4l2_subdev_client_info * argument that
  .get_selection now takes in media next.
- Picked up the Reviewed-by and Tested-by tags.

 drivers/media/i2c/ov02c10.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 730a40e94..cdccbdef3 100644
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
 
@@ -768,11 +776,37 @@ static const struct v4l2_subdev_video_ops ov02c10_video_ops = {
 	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
+static int ov02c10_get_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
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

