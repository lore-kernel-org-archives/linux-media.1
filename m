Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690474;
	b=rAroW7/BSCCMzsF+8FgnF5DHd8PI6nAiqjmEumyFvAIbpuIK15+spl3DrtXghvdvYCMz
	 jP1rudCNKFUVeKWoc5zyZz9+tE5ALkO3FdiBz276pvDLZyg8bC1MlnCl+I6NXg4s7F42R
	 rvNzQ0Ubc5CuMOXt/lB0Pr+/+0l4RzVMZtcYpzr3tXc4G1vdT76oBBB0qrtoVitYPxNRu
	 c6ONqxYzeWrqYMdRM6OY2JUcUwHa+nn+60Qyyr1z5Z/tBhj1mnsWOfM3Jg4PWau293RSg
	 yqUwZxaphUd73Gh6yBPL5rLN42m/Au42Y7xvCT6aEsGSJqpirR8gt/Ae3SbyHTiJNaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=feAclFqGqANXGk5ANej1oUGx0E55rEkA+ZUZcmvKBcM=;
	b=wvnmTGu/Z8AtaK/H4p5DjLA1n0Xuv/mg+Kvaa35W2qyuJDxUGE81UibYrQ/3PzYd3Lon
	 R4sBpGIqb4lZ1apZYUKZvogL5yyBgC+Are5wUyUHF6YLXle9QTcsk7ekDp1C+aChS66/g
	 SNETdMTKbPXUJxY8Fcw8HTgc17vmeawARXB21HEWLrtpoN2WE/n9O4kQl1BV/6y/01305
	 nCIxliW/OvPds9WZ9W8nGW0VYcyv7JjLTQuQGJE9OqA/6uWNFd3n9ceJw/YWuIMLKg6zl
	 Jt1f00SQbnAtBq/zyGuvSHaTDkTbrHhRm9BgwuHVoS5Uo2BXFJfoIIFuQBXK67Xk81A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=YKkR28ja;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42413606A336
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 17:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42413606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=YKkR28ja
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df4f540ebso26335f8f.3
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 10:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690473; x=1793295273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feAclFqGqANXGk5ANej1oUGx0E55rEkA+ZUZcmvKBcM=;
        b=YKkR28jaiLkadTQQSBEuU1h3lBa64XtFdB1ZbrGHfOEYJLG2wVb0hTKwFcM5seUfyz
         M0u4+5avHFZ8iAJWMD5bmnUoj/vhZWqDH7xJAAFRVN5rXhjg41Uceh6sBUhCEVoRVUBi
         cdiwgiRyWWCgxIFR+YqhVvfckfMQ/ovJo0WT1gfJTvZclf8OsSaJsTTotx27EPvN9/C9
         LdTM9afpk5EJjJjfhgb2EhHfOy/cqCIOPm1f6yo/oukX9zNUVZqWDL1ABHZyq1U/0NiT
         ItlzVpN6SOtLcT1zaj8MCgRMpOXZqCAVxlwmrFHl266Bqe51X6XvAq3NgnLQ1GorSvPa
         KnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690473; x=1793295273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feAclFqGqANXGk5ANej1oUGx0E55rEkA+ZUZcmvKBcM=;
        b=TPl8GHVWaSa+u+OIOWa9J6QeJ5dyYpSyJDHhgc9KvrJ4KEddQY856H2O7MYsEpuTlS
         5WWZ5vngxSnBd4+jXT0WdkBXPB5uzoKVZXGZZq8gGTO5FXapGgrjKwFpJ2Vf52VNRSs+
         fcaPlNc3B3XaHk0CCPqyIdKs85kMvM/82SazzMjr2qpEgjI6ns88EIDAbtUQMtcAyezY
         Ojmky6tvIttcYM7zd0zk9nDRB8GtSKMKgp1GNrAnoGeRyhtofeGN6unlbcLJqFkIftB3
         qgDDCmdrHcwCgyAk18IuUPw1a3f7UhhKnSLWh7i5RzaynT5FevCHbYM+XonX4n0gaoEv
         NUBA==
X-Forwarded-Encrypted: i=1; AKwUvBzLWKJt6z3w8bhAzt0YXNNjmOVJP/xgjCIPHhIbAOrNDTw9bx7SfnOn3btjUHJwBF23hztqfQt+298xRQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLRzZ5ASbUTIJD0e4IkUekdLITPiWvJPypnhXHqNL5AyGWstqFe
	wng4pGPdzjn/yjjmxToMu/qEgpeGLiWebdtH3DUSGM+CyxquKmAgFEs9NVlEVBKeqgg=
X-Gm-Gg: AYBFou2CHO8w5ZFdFRl+0FKUyawS1rEkiPmqN25OQ1djSOUyab6FWWY1Yp6GjiUGThE
	BML9l8y73Ky1YyPI920lgN3xae9YE9e/swavheI6QDG4KeF6GsTQKApRPSdUh5DJDhM3WftpgHK
	EC/hJQsi4hIzhbtlOxIxYfG2TW8gqEeku3nmvP3x+qtgzCh4P/Vzl3Z3KEoAxqa82YPYIFGhkMW
	Hqm1v7Gijd6Kj8OyqO9t7ixb3re8jTfX/1/QVDxUbqV8JdY/QHL/Kx0lbICRodtUPtWkY6qycmx
	GTTcUiIBkt3ee3FYEzkC1FFqBRv3DJy8EIsn1Qxeyr5qkBibw5EJAPJd9SvrAnODfbC82emmZEz
	Z5zGAaNBQS2a0RRJs1Ns+csHfKGx+D+6Lvgf+JPrWOqVHGWVp6AHcIwDjYwFuD5Ekkmvo3Kqs3j
	uIti+CI3LgmyxsqIjncglCJqSFGvYdS53fpb6eoD/R5oc47EY6bgNqW5UwiUm+6PPSbdXT05GfZ
	W7MqtsJcDgzwkWyHGCBJ9FQWydmxo7KihEjpRhwXgzrYavSKEpZkYrZ3G50lhqMQiqEJcIuUSV9
	yBNY9lHqcXRF/O3qwu7TTURQwiJeM+OxXRIexz3VllcPGe77u0oO
X-Received: by 2002:a05:6000:4213:b0:488:8931:b1b2 with SMTP id ffacd0b85a97d-48e264bd584mr14628357f8f.28.1792690472691;
        Thu, 22 Oct 2026 10:34:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:31 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:33:58 +0100
Subject: [PATCH v6 05/18] media: sony-starvis2: Rework 2 lane support for
 higher link freqs
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-media-starvis2-v6-5-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
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
index b54e1c68afa0..5dcd760c1a27 100644
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
@@ -632,7 +632,8 @@ struct starvis2_variant {
 	const struct cci_reg_sequence *common_regs;
 	unsigned int num_common_regs;
 	unsigned int vmax_default;
-	const u16 *hmax_min;
+	const u16 *hmax_min_link_freq;
+	u16 hmax_min_pixel_array;
 };
 
 static const struct starvis2_variant imx678_variant_def = {
@@ -658,7 +659,8 @@ static const struct starvis2_variant imx678_variant_def = {
 	.common_regs = imx678_common_regs,
 	.num_common_regs = ARRAY_SIZE(imx678_common_regs),
 	.vmax_default = 2250,
-	.hmax_min = imx678_min_hmax_4lane,
+	.hmax_min_link_freq = imx678_min_hmax_2lane,
+	.hmax_min_pixel_array = 550,
 };
 
 struct starvis2_model_info {
@@ -1207,11 +1209,8 @@ static const struct v4l2_subdev_internal_ops starvis2_internal_ops = {
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
@@ -1228,7 +1227,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
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

