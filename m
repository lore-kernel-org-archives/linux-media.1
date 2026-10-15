Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E7352E070
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 15:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079880; cv=none; b=M2Rz6T8vganfm6zMWL+ZmRXLp73AzKz9Ob6ti4uvgPsxuSAWmPEIab20NqassGm6QH51yxb5LExIX8x+QzC14RBtSTSR5mH9I5p9dP3D/tjUKPJDFzefG+QaKNzVz7cBd3WvY3tHmAvc2tCkguySremH73mtcsiSL2Co3UYbyfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079880; c=relaxed/simple;
	bh=eoAGtS5XufptMdU0CaNJ2RLnJ3OeUveINEeLfNUGNhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ntVew0yKIZtgoWW6LnGwYrYMRQvoQiSUXdkmX9yIGCzrSyReUXPqLTwuCyybX/ocJ3cHSDi6bZqY/j4TP7UrIELSCl64IeD6OmAH9ml95bJDU2AFMgfPDhUUsGS/dXuVgek0ZUCZ2qXkPIKa5or2bLN5c5Ytln5x4aSIiNJYFnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=oHLneqUv; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="oHLneqUv"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so92293f8f.0
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 08:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079861; x=1792684661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GS5ZrpkB0RsyL8XlpuODb/jKxfXfcHSKNBqSqEyqBwU=;
        b=oHLneqUvgFcAAVJYnGOPYU+8LqW5kh4Ims4gj5H8w4dKvuPc8Attsleqg6tRsellfp
         2RGqERUemPMW9Zr4FfCRcrQfe2/iztE+EiFTPeG3wkf49iR6SXTfv7UfFJ5+BRWsLuJH
         XA+iRFMjzXLIyANj8bmr9h5stGLMdW7Y+gAMhNOJLxqu43xGVFtJtFtAZAQhGpJvB78E
         pTPaiTSN8BR3M1JRpJoKZ3b0CeCZtt7WF08TkstWpv0vqpuVUyiny6pABYprQ4KlR1vp
         9JdyMaypvTzdz5QpBD4h5b/IlQv9wH/qphmeLCBuLMZ3nPTTmFm34sGimPK9vR8VYRxx
         7h+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079861; x=1792684661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GS5ZrpkB0RsyL8XlpuODb/jKxfXfcHSKNBqSqEyqBwU=;
        b=cyxDHFr2kldllstHQ4G2vI1OhuLyDT5VxGi/tpB3wzWaOc7FerlN18a6XcjaDkr4q5
         +F2iNLR8xRFmvaN9sA9poSKRsQlBQ6jDP66ul+GjdQ3GT5VvH1EFl+e4u8mDPLcS6+YV
         Y3sknD0z2bE0JyvYUR7TC7aRffz64gglgJvHWk3crNOwyGmduLJ0vkckKTC06YVB804U
         D4TrmVhQZZxBnJ7uBag2LMS2NjvvRAqmmOgsj2/PU7MkyPwq8qX0Lmzer/JYTJtK7X/W
         4n5V0zY+s+ba3Fz0jVTFyPkkWa5Dp0TlH/mB72WTwQ9q/1MdWOwEsflEDvFwcdQdaUfy
         FC/w==
X-Forwarded-Encrypted: i=1; AKwUvBwV0M6CGwJP5I5tk5ZEmz2uXoINgSiKtYpeDRlfYxoZSyDoSS76uP6yKSaQu/RafsT7RJhdbi6//FdPQQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI4C8mrwd0aEnZSPGlSWZGl9/mFzdRhTdF/NX5V0A6KBoaW2hND
	IAsebY67ya4q/NfY55B7W/uBzk2zsJUlg17B2xh74tWVEaIFw+/lwP8wNQh25Pv9nnk=
X-Gm-Gg: AYBFou0Kcm6zCE0aQjv1uTm1zOFMETY3vOS5FMoX6lyw6jbmmPMSMNTdKW1g4AAK14m
	nBdQk7uScHTK0G8I1S+3ondepKGrB4sab7UPIDZK3I7NsUF7x7DxFuPDTOZoe24/VLON3iBkiQ5
	ImBU7ashjyAkVBjP+CACgKXa3NQexuxg0n2gkLg1a2p5xH4D3UclHUGM5o7JxEQ0o5CcmW8JPgw
	+Mv8Z3zK5+clLfmayaUdZDkoewcyYNsEf3ZITTFT8W99iSVr9wS23v3o0Px9qy8h8B+Z9bWs63D
	uvwGR0NFcLRnJDVHen0dFod3EFF5ufzfuBW91wdWMF9+FB4mOFha/zRqvkdJcDnUl6hdcuIhbHp
	JHMuyWdkLCXIUKKqrCs5uoHO5m2AVPIk9zqVkfKHJBKgHSMyAw5+R3liCbf5HQeAaeBf3cQGtOA
	CgPfwnBPKzgbh/JSf2yyT38/4/J5MkBV0RtggEquA5DpKo0Bn0f7hBQ4iVR01GccQlh5a8fE4dW
	1yIbfsaa5wzXaa+8p717zazcD3M5g74Ad2HyI1YEIkq5W3QhQ==
X-Received: by 2002:a05:6000:26cc:b0:48d:fbd8:d598 with SMTP id ffacd0b85a97d-48dfbd8d5afmr390659f8f.17.1792079860981;
        Thu, 15 Oct 2026 08:57:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:40 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:31 +0100
Subject: [PATCH v4 05/16] media: sony-starvis2: Rework 2 lane support for
 higher link freqs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-5-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
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
index 189caac78066..0edb0b4dd25f 100644
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

