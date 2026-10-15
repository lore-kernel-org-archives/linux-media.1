Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9690D542EED
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 15:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079875; cv=none; b=Wt8dn96KbF+7rLy60C/YivFRA1i1m3v/CYt/Yn4MoaP3Zq9TItFysT2rXj4jS8HFMr9+3lKoI+po4amehQpumlY6j2ixCYCOVSykgOhEeQ4iCpFbmh7/qqkaX0Izjyx4uyAs4SoXCpAJbwmr6OJQrzm+DUWRbr+Kxq2rXmllPag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079875; c=relaxed/simple;
	bh=zKSuXRI8aMna5pQ3QoL4QnTlDfII69cLtILjo3bnSvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=une1qLcyzDkfW3IB4gJBG8tVi8XjhTKRqg5cON43dw/JZ9/00Xw5H2yX9PV8xGFffS/hggmvHiU0UQYEHMZ37bcQ+2qhGMTv3NKYdYyHi/0KnJVLCkeW4y/oEq6kxZqrQ10lC7XD5EqfmzyZTifKI8ZtZLTgTgF3SQIRA9nF9cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=bdVv/nnT; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="bdVv/nnT"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so43289585e9.1
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 08:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079858; x=1792684658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4qkq2Ot5KdEpoUe+1OGX5HpRdoidJ8DEnSvKe5Kbn0=;
        b=bdVv/nnT0TWRYBsu8qMDYMEMbhkUHp4+4SENDSp1jSD6BScBr4+OuOqbdwBz8eQmgp
         lW0Jn0vJZcFFMQQ9VhsA+Vwc9st6oFknMCDduXt+sZvs4FYSqPaGS5e5rypTdlR2cCG5
         hlQtMn8cMlFGtA+LNmftZiwCzL8mk1xrAGbBIZwoF8Rg2A/ZEDnkUARfvJ5uU7wMTGoF
         uK5QcGIEgsccf9/VebidNitFzjNemMV/ZSYGXm/X+H1fSihMivWIoN12re9AGpOMDQcA
         AMLdrTybGfTWgOl7DqD9FOwumwGcFwnSZIwbKxKlzH6xzQ18nIMOBLpT915ixG8Qag6g
         UMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079858; x=1792684658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4qkq2Ot5KdEpoUe+1OGX5HpRdoidJ8DEnSvKe5Kbn0=;
        b=ZUXLcZHBNX9V7erBkjkUI8YLMHvJtuU+XV2sQH7oQXxxXapjs4ZUELL6Dio5ga/zvc
         Oq5W1lGoKq/WT6gd5Fj2NQTBm1llX+orqAgU7np35OcSw+MHsXCXMHrko/YyO7XGz1Tg
         PKuiec0iicJknDSpx8/cakseyqLaKc8SfNTJlqllfOo9zpYMGdc8JL9ag08pDO193K09
         J5ElZB0cp/qdyI1t6SU/HtZ/R3/kdrOZcINRKenccS2K/WPL/isEiTLp8MVbQs5ZI3yC
         VhZET8VRNvP74pQv4k2TYMJtCi2qwJdU6HZUjaO1GOrppXI8BugPeWVfA4bqr8Qu8Y/3
         1J/w==
X-Forwarded-Encrypted: i=1; AKwUvBytIbGMY8bTO+4Y5XPfK4y2OTrkWQ0pXsmjIpdcaCmq3PEJbSmxv66n64kZKOj+v7XI18b9/VKmmPVm+Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJX1BW83DPTVU+Ho/wobw9/lj5P8O7YCZ3eXbkebCqHiHMJgZNs
	uMZ/QZG1HUWyY3pJolkVe82KW6PXasmKYUoKfdZbpdHiaoV79ITK9uR/jgINzVtmkYM=
X-Gm-Gg: AYBFou3QD80dfpObhAaUy5UOk5oV6J3eDeHhg5C3/zykQrq6n3W81Ge17cKUQfwWXPt
	6M6FL8i2aIVM1mAk7xfNSMzdvCTz7WqukBT5gy/aPlzA9jLG9W1OVDEMs1DX3kadI5vQbyah93S
	DglcCp0eJFFVO4SvH3mXR12HILTuxOeJcb7JFQhYEw4kKolNN/2kNnt7jdffrdG2IvyomxJOjyy
	DF2ICEyb0XHw6wNit2Vmi8gmpM6XjG+Xs4McMK+4MiA+c8NCg75gZGxIpG51fH74t/8gSgPk9H6
	kSQsKdIkg4gxUPrWK70QXSSI8G3904wzzj5F8HC2h+aebfL+R0aa9ZvpdGEKNyk4Mo59Bh3Lfmp
	simSEXsp0gTMmmyQqRsV8kkB8jg8TdnN5ckuTlBP4QOLKUf2X9Ddk8A2zPcZ/a9lQVKLQE3kVvk
	S3jJ8Uu5gQrVJ31LDS/YH1kPvJk+K4IHG2sCcfIBlDgtTwQZ5sAbZxOaSrM3KDkCcdyt0Dcw9Ee
	eTg16+fJQyuAqJ1oHrR/GG0ERHIh8s07d/2zxbhlXwi0WhoOg==
X-Received: by 2002:a05:600c:c113:b0:4a1:985b:83a9 with SMTP id 5b1f17b1804b1-4a1985b87f5mr234591235e9.4.1792079858432;
        Thu, 15 Oct 2026 08:57:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:38 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:28 +0100
Subject: [PATCH v4 02/16] media: sony-starvis2: Reorder link frequencies to
 remove lookup
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-2-75fcdb4163f3@raspberrypi.com>
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

link_freqs_reg_value is table that just reverses the order of the
link frequency enum.

Reverse the order of the link frequencies so that the table is
redundant, and remove it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index b4733990d03a..3656658e18a4 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -186,25 +186,14 @@ enum starvis2_lanemode {
 
 /* Link frequency setup (DDR: lane rate = 2 x link freq) */
 enum {
-	STARVIS2_LINK_FREQ_297MHZ,
-	STARVIS2_LINK_FREQ_360MHZ,
-	STARVIS2_LINK_FREQ_445MHZ,
-	STARVIS2_LINK_FREQ_594MHZ,
-	STARVIS2_LINK_FREQ_720MHZ,
-	STARVIS2_LINK_FREQ_891MHZ,
-	STARVIS2_LINK_FREQ_1039MHZ,
-	STARVIS2_LINK_FREQ_1188MHZ,
-};
-
-static const u8 link_freqs_reg_value[] = {
-	[STARVIS2_LINK_FREQ_297MHZ]  = 0x07,
-	[STARVIS2_LINK_FREQ_360MHZ]  = 0x06,
-	[STARVIS2_LINK_FREQ_445MHZ]  = 0x05,
-	[STARVIS2_LINK_FREQ_594MHZ]  = 0x04,
-	[STARVIS2_LINK_FREQ_720MHZ]  = 0x03,
-	[STARVIS2_LINK_FREQ_891MHZ]  = 0x02,
-	[STARVIS2_LINK_FREQ_1039MHZ] = 0x01,
-	[STARVIS2_LINK_FREQ_1188MHZ] = 0x00,
+	STARVIS2_LINK_FREQ_1188MHZ = 0x00,
+	STARVIS2_LINK_FREQ_1039MHZ = 0x01,
+	STARVIS2_LINK_FREQ_891MHZ = 0x02,
+	STARVIS2_LINK_FREQ_720MHZ = 0x03,
+	STARVIS2_LINK_FREQ_594MHZ = 0x04,
+	STARVIS2_LINK_FREQ_445MHZ = 0x05,
+	STARVIS2_LINK_FREQ_360MHZ = 0x06,
+	STARVIS2_LINK_FREQ_297MHZ = 0x07,
 };
 
 static const u64 link_freqs[] = {
@@ -913,7 +902,7 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
-		  link_freqs_reg_value[__ffs(starvis2->link_freq_bitmap)],
+		  __fls(starvis2->link_freq_bitmap),
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
@@ -1175,7 +1164,7 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	const u32 hmax_4lane =
-			min_hmax_4lane[__ffs(starvis2->link_freq_bitmap)];
+			min_hmax_4lane[__fls(starvis2->link_freq_bitmap)];
 	const u32 lane_scale =
 			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);

-- 
2.34.1

