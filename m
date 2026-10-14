Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7CC566C41
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 17:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000478; cv=none; b=SJoRlIGygl62KzUxwA8cNPJf62j6CcCGtB8PlGT7IZk63c3F2xV4DnJcCpLiMETxii9TLppnt4w08yTs+NHIsm8srbmEnx6NEiH1RGCKFSEP7S74a4eRfFrGWEYiRmftHb6gmYlZRX/l5eBcFMJVf2qebw1CkSpDE5XZCuJL7Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000478; c=relaxed/simple;
	bh=EnXrYpjb/Z7UC1gkh9i1JTlCNPJwmwBCV3SYQzAiheY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KocZvdDcO4nv0h8k5IMdTf+KV8NQ1uwOnyNgq98sI17N30aEFxyGGm5MBYrUBvUXNyqjrDlJAfFsIBk+vX5OtMzFltLDaWXGHQvVBvw10fx4FnCn79P1K1F9sZzbNhQPhk5msv9eGZdb+PHz4anYJZMibPHr2RhVwdrD14BjEhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=d9YzjiKx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="d9YzjiKx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so16218625e9.0
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 10:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000473; x=1792605273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFQHGy3DBr6nmogFYNGxghtZmG8SFDTzSz89iDGAE4c=;
        b=d9YzjiKx6/GJoaPzx4mgOCdxZkuhzJGjdzwi4vapvDb/J2IiGm1q0fMkwCgO7m0nIX
         WPZ/b5QyWsnee92yBGuKdWFY3vsFhnYfM+l4rLAsrp4H4olsrmNTMQ8HbfPVZeGB/PYG
         jVoiL6wXP9U7ST9fUz3P4DM/l0ZyGNKe1uZAFFOmfBPsfLCXE7iA2mTpDdkMtzdW9mYD
         30YuSTsByJWLl4Ypn76SKzD6eM/zDY+s5K4Odp4XK6o0sMRw/+KZgRIlQAmYxqGqT7W7
         ipK8Uu33cP+XS/0InrMZNoDm+1HUR9SgJDGp16AC4/soUkRuSzFd8jDhXJv8Q68KDErb
         cdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000473; x=1792605273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFQHGy3DBr6nmogFYNGxghtZmG8SFDTzSz89iDGAE4c=;
        b=E8m6WsIqMYpM1qJZdrA52Jr7x4wwPV0p+gb/dJMOmlhmFqZS8BQehDW/jd49i63woQ
         NT7KhhcErmWnPu8gGgWg8k5yzMBOkKc3VSp/LYfyTP4eMcmnTdUeerrTXYENEFxNyDQF
         IwdMK08pGhcR03lDiMRswe1hS0kof76el55dLSzYYVhv4T423w9URhPlUKY0BlqSkW3G
         XHXDdOk41PZY/2UQAdmuKdEy6D91BQP8xZJGaTC0VtIvNTBWx1EOiuFELFuwA8QziqbB
         6Jw1ZEGEw2Getn9VqOHDLlc9I6IEQlqtcBuXHaHlQeuJswtsh34YjNIv7ojz5DG7Ym7K
         IOYw==
X-Forwarded-Encrypted: i=1; AKwUvBwGm3vlTPCrUgJM8r61Ygbu8dHAZESPybGIo3zED/fNORNKu1P8DRF8PlLwn8C5K7VipQjiTlEbOc4ojQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJF4CFNCLq+csTPtiqQLnzvdyfw86OiSvhP+vRlwTgdQXqjswyx
	r7QOP44ATWbKNV6W5841nhBLQcd2TSuB8p72AWK87tafWn5qWUZt8oIuO3WcT+F35hY=
X-Gm-Gg: AYBFou3kAyhf6OOri+AOnt18k4S6dNu6VfFQFAQP8SQ1M1UYFFtbKupuHNYFs8xXlMj
	0HrpZZj3vRbUNDdS33yzA7zf9VO/4RC2uYqmfNC1pUM4AX5SnMCtjQXJPT/A05Frsxg1nd8CMev
	8yFzXR9XSBIAaB0F3GOaHhurhokpnly+Lga/ZG5iXIvRW8o1eqCqUc9WbW0OQCT4cOtbmunfGQb
	s4s9NotOUuNN05Rfpw3DghDwr9MPslZOva4hmKlN/mw7QZvl2mg8G+YiRqTGMNOVTeIBa0B3KL8
	rLyToBYW8KE0yCrXIgbKRrpJJJiL8YBfrBqqoD3gx2CbArPn/q5w3AkrrtuIG2qLFOWQDS+cO8I
	EaDD7LcF6fS02OgvoD5fS+MPx4PVDhvAeWZwkfppnUS2H0TxVxZ8mX1ThMpGhjAuK15u6RJN3VN
	hQ92GJyMA4L/BlPiFmXjhqLt/rOEpAWIpG1gx/WjNBPepVccGwZ/wvqfqaI3topugdAVkwzOyQ1
	+YNMY86i70IT82YHs8+QEZGrMt9+o75TNebUjFTP5nRl0DGzg==
X-Received: by 2002:a05:600c:8716:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a18e44885dmr343536665e9.2.1792000472868;
        Wed, 14 Oct 2026 10:54:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:32 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 18:54:26 +0100
Subject: [PATCH v3 05/14] media: sony-starvis2: Rework 2 lane support for
 higher link freqs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-starvis2-v3-5-c958362b5d06@raspberrypi.com>
References: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
In-Reply-To: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
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
index 4f437f4c849b..1f3b33a5e44d 100644
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
 
 const struct starvis2_variant imx678_variant_def = {
@@ -656,7 +657,8 @@ const struct starvis2_variant imx678_variant_def = {
 	.common_regs = imx678_common_regs,
 	.num_common_regs = ARRAY_SIZE(imx678_common_regs),
 	.vmax_default = 2250,
-	.hmax_min = imx678_min_hmax_4lane,
+	.hmax_min_link_freq = imx678_min_hmax_2lane,
+	.hmax_min_pixel_array = 550,
 };
 
 struct starvis2_model_info {
@@ -1203,11 +1205,8 @@ static const struct v4l2_subdev_internal_ops starvis2_internal_ops = {
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
@@ -1224,7 +1223,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
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

