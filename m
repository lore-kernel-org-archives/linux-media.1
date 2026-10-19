Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E01D572E88
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420113; cv=none; b=dNqnXLYXoCRsD6jRebNEitfhfZoi96yaPkzbHSnlQcHqQPC+XufrAK1k0pV+xKkl4SnWvEdT6foQTqXHwJn4eYnTM0ezJrEuXKMMmSvmzdJhrGPQE9WG4/KEbWutaOKcQXrzymAaxCtsNdKFrPng/BE96FqqNEe2OTHIXjLIo5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420113; c=relaxed/simple;
	bh=hHFS7weOeh7MlbVnimcj23nbQxnv9YYKvm4fxJDnZJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=twj0VxhWiYwYNVQRjYNKIY6A/5BwDezoAXjai7fseWjYQCH10ytD9T3luGCdrZ+3PfyDEubrMGj7E/g4kUH2EuXWhKiXLasjRZI5D8DXmN2kOqfPGXPXSJYRsl0SpRvSRW0xGwX0IXxJNd0mLFRytza5nWiTuHfZqKj1U6lKlKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=kr8CAAae; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="kr8CAAae"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1165823f8f.2
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 07:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420109; x=1793024909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=znN+FpH/h7hzZPlrBC031EXR7woraq5BiA29QTDHt8g=;
        b=kr8CAAaeWCG2l8EoLw22NZdGS28mOfHdyznKBhAPHoVDSyZGF8IHjeIOLA9dzOYOTR
         /ByYuEvC2vdo9fLzgPp3ttHs9CMnEdnpY72Z7qiaY+vEZwgLw6wqMc69M/f8ZwwCLYfZ
         r4mwQEURuwVmLO9yjwj4W2tUSGifSkRp6M2DHCk7O9Q2ncPgdJZUaJVUxfujzwZsP/EZ
         xjAGukufgvaGyWqmSQ2UWaflHQcFW0udJ26jy8I8pOuDLAsZQ0y7uW31oPnvvsT1GN2C
         5J1NddNQsrXTt5kIJdHMIjFv0sg2XIZY6Qgh7xjn3Wibr0O8t2LCldfcIae9zMTGzrz5
         1H1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420109; x=1793024909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=znN+FpH/h7hzZPlrBC031EXR7woraq5BiA29QTDHt8g=;
        b=CTr4vhLj0r6hhUjirp3vs8+EelpFr4vhKAgMoK0rT4CLTucIBg6IB+tX2kJcGOyTO2
         pMACxurRt50dziCnSLAhkhLRleTdvdW6fml0qzwYpgSRdeLfEQBlYH5Nw7qWOs4Cehf+
         KdHSgBj+A7kGd53SWW7kYr6hhZkhl4KspoBrlsQlXwbdWkT724J08gK9JfDqOfWDSwQM
         2ijb8wtOyEAndGWXHi6xAC5d04C/P3dWPo3Hxsqq1ka9Q8yvIDBvHtJ4vo2WEt4t6xX3
         HmeCjltvICgqakTHw8QCqAZ02Ab97StaCzZ+DFzv18cuEqIyuTMiHvEg+OLvuAtS0VTK
         Rm7g==
X-Forwarded-Encrypted: i=1; AKwUvBz4rKihEEpLtXt2euvtXUnsJlhGxYy+RmcUFvNT/lfdMmjID/Ydb1P1mt3bPi+POLNyyYrCyJVztzOc4Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIgP99LJ7GJvfv7W0b+kW6W4X+yjaPiYYrPX1/KVRvb/lb103hd
	1478nXcyt20van8sk2497fypoOUONLcw/CulSoG9XbmYAZnZmka+CQNbMOETyzVFGb8=
X-Gm-Gg: AYBFou1ThOrPY/wW499c+4NcRZvtgwvi7EerdB677lEXcEd47VzdWuKS0oVaeQMQaJe
	E2ufi0KUIfn43rwJxmiv+CRCvlWwW+tLZAhF+MLhAPSuSvdfSWYQU+yBVnvn2Z3jdm26QhiNe2u
	oatV8hRIxhh6hwBDk/q4ZWQnEqLDQA1joOg+6skHrxSVD54gsSK3HHz6nTZ/W9a3FCCjj+6QFvc
	sxJP/NEPJ90HvF3dG0BytpaflIv4EE3Vwu9UvyteQQKxAPNJedi1G6+WW70nWfsaD1nlPIPsvNP
	lfLCQ9DfHxkZQfgDk7qZ8z/1rTUcOX/i6pyISCN9YnuArra5zw83lfTnsK02kYb6vtTKIOjt+SH
	DQzXBjmPRcvHFphMQ5GH7+7Bl8Ky6bwIaJ1+0xbxxbfjt5j8RtNegICLk0jcdU5N0+QnJNdlnim
	eXv2qIw/uKYz88Nx0qjDcqlFCDfcECNW7ZyAn1wk7dxf6Wav3w/YaxOxgog1Sy4q9RfAp2Znwf+
	Mjwg06Oy4DQgv22KtmlfEzARhqXINsVCzRkrGD5JXUfGNQv6qtoxLCGBmOD
X-Received: by 2002:a5d:4dc6:0:b0:487:1575:ebe2 with SMTP id ffacd0b85a97d-48e07fa9d89mr11874163f8f.44.1792420109347;
        Mon, 19 Oct 2026 07:28:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:28 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:12 +0100
Subject: [PATCH v5 05/16] media: sony-starvis2: Rework 2 lane support for
 higher link freqs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-5-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

With some Starvis 2 sensors, the link frequency on 2 lanes is sufficient
to achieve a lower line time than the 4 lane value divided by 2, as
the 4 lane value hits the minimum that the pixel array can handle.
That can't easily be handled with the way the values are currently stored.

Storing the 2 lane hmax alongside the pixel array's minimum allows the
4 lane support to divide the value by 2, and then clip to the pixel
array value as a minimum.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index eb7662c43989..b0b1716a86e2 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -176,15 +176,15 @@ static const u64 link_freqs[] = {
 	[STARVIS2_LINK_FREQ_1188MHZ] = 1188000000,
 };
 
-static const u16 imx678_min_hmax_4lane[] = {
-	[STARVIS2_LINK_FREQ_297MHZ] = 1584,
-	[STARVIS2_LINK_FREQ_360MHZ] = 1320,
-	[STARVIS2_LINK_FREQ_445MHZ] = 1100,
-	[STARVIS2_LINK_FREQ_594MHZ] =  792,
-	[STARVIS2_LINK_FREQ_720MHZ] =  660,
-	[STARVIS2_LINK_FREQ_891MHZ] =  550,
-	[STARVIS2_LINK_FREQ_1039MHZ] = 550,
-	[STARVIS2_LINK_FREQ_1188MHZ] = 550,
+static const u16 imx678_min_hmax_2lane[] = {
+	[STARVIS2_LINK_FREQ_297MHZ]  = 3168,
+	[STARVIS2_LINK_FREQ_360MHZ]  = 2640,
+	[STARVIS2_LINK_FREQ_445MHZ]  = 2200,
+	[STARVIS2_LINK_FREQ_594MHZ]  = 1584,
+	[STARVIS2_LINK_FREQ_720MHZ]  = 1320,
+	[STARVIS2_LINK_FREQ_891MHZ]  = 1100,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 1100,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 1100,
 };
 
 struct starvis2_inck_cfg {
@@ -631,7 +631,8 @@ struct starvis2_variant {
 	const struct cci_reg_sequence *common_regs;
 	unsigned int num_common_regs;
 	unsigned int vmax_default;
-	const u16 *hmax_min;
+	const u16 *hmax_min_link_freq;
+	u16 hmax_min_pixel_array;
 };
 
 static const struct starvis2_variant imx678_variant_def = {
@@ -656,7 +657,8 @@ static const struct starvis2_variant imx678_variant_def = {
 	.common_regs = imx678_common_regs,
 	.num_common_regs = ARRAY_SIZE(imx678_common_regs),
 	.vmax_default = 2250,
-	.hmax_min = imx678_min_hmax_4lane,
+	.hmax_min_link_freq = imx678_min_hmax_2lane,
+	.hmax_min_pixel_array = 550,
 };
 
 struct starvis2_model_info {
@@ -1204,11 +1206,8 @@ static const struct v4l2_subdev_internal_ops starvis2_internal_ops = {
 static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
-	const u32 hmax_4lane =
-		starvis2->variant->hmax_min[__fls(starvis2->link_freq_bitmap)];
-	const u32 lane_scale =
-			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
+	const struct starvis2_variant *variant = starvis2->variant;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *link_freq;
 	s32 hblank, max_hblank, vblank, max_vblank;
@@ -1225,7 +1224,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 		return ret;
 
 	starvis2->vmax = starvis2->variant->vmax_default;
-	hmax = hmax_4lane * lane_scale;
+
+	hmax = variant->hmax_min_link_freq[__fls(starvis2->link_freq_bitmap)];
+	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
+		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
 
 	/* PIXEL_RATE is fixed and read-only */
 	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_PIXEL_RATE,

-- 
2.34.1

