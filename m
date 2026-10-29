Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283525;
	b=DCi/MF+uX/0etXWk5zr5QQOjCFHN+1nNpFfRRmLygPp3ldxowyTMrz9lGbtGdSIZqKv8
	 uwy7VeScMNYSm9GFQS4j6Y8dTFHJisZ61phH3648ExS1gO1y3ErPIRxBy3zx5RhxmcbWm
	 vQ0xFyZ2ymWg42dEdhzagSnutsPRXf6ARtB5mEEgh8RuQlu9yjoFcOMiBJ4ZA90UCDSVU
	 OLnMWIJ5M+yQzNKQ2T9G9Y4ui6pkadYD157K/CGmrGAsAeeKRDhi4HFp/7k5E5u/S52jn
	 kmUGT9oWTMzxc+ZiD71vEv1EyWehQ3Dg4+BOkNpWGTbcruw96wPSAkIpbhe9zGFp0+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=feAclFqGqANXGk5ANej1oUGx0E55rEkA+ZUZcmvKBcM=;
	b=IHSRM4CSvTKq4JtAoCAWnCYtMQqj3QBL6DTfVBkpVko1cxwuYrH7DeNKd6g/y32vLm3A
	 COXBeGa7T2uOhuNfJXEWLTIbBUs+cJ4X6m5LRO/Fr2F4Du06veIkf1JKk2pgVP6VAflox
	 Gr8oXS//dzpoemG2qqghwFQCizzEUkHFKucNLqiHcGK9KuKlfN8dF4j9K8MGfE4fW0DLL
	 swvM3Eh7Sni0bS7TW/AsNVeK02ipfD0dylL/x3lUMh7gAmI61JHltksAV2yJxFMA3YSGO
	 IHMz4jPDimw0f5L3s+JJZX5XjXEi3yh7CgZX6cUH0tZCxJLkjDhAKVBThS5AqHXcPTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=D9bqhAwT;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC8660A262F
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDC8660A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=D9bqhAwT
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so22863125e9.3
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283523; x=1793888323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feAclFqGqANXGk5ANej1oUGx0E55rEkA+ZUZcmvKBcM=;
        b=D9bqhAwTjUreboS+Y2SDyLVCsHDfEKR4fwP8eUIlHEaeJbUvJNQd2JxuFsITZLMPRH
         fchxd5hpKCJ+n75TIaWFPzc0xISn1LGkaFC++PLBiX1PogG3ncv9SbIjPDjaJ5IXTkXr
         wLV4ocPUmGnSURInwpLuXkyvlPRUrm4A8CBti4RCyyjqVun+xx9qngRG1B1QjNEEpUK7
         vIikImjy7teud8Qhs7l1PeaOA0DiMRkIB457AM/k1yGUXGSpwZ8ja23QIrrXDqyEYiP5
         ElVVIfyv9A08p5Ov6SpxO2zusLcp0Tv2wBPq/pcKmP4MGDS/vurYAMnr7RHJvhXo2c9g
         KsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283523; x=1793888323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feAclFqGqANXGk5ANej1oUGx0E55rEkA+ZUZcmvKBcM=;
        b=EMAPVrx05FSUKDPhtudjc4qdqBQ8ECM/4BqJz3gB50Ncfa1G734egwsNiphecck0Fr
         WibjHLljI/sUcmulW5rewYKt4tzDjhi/zX6hN0fFjrHwLwg/yEJaBWSgXtOs1EmsZ8M6
         /PvH3HZZ7W8vZO0bTowaXJYgqrFIFHAVp6myQx5CloiwPbWNWHRJjXO8EXWnEaYIVj8Z
         +tBcRyEJlmd793GcU7OOpisUA4+EsN9tiJqj0Kkb84id5WPzQ59seRwwSKDGcd5ymseh
         kT1OCvKa2LXYtlYwcHwc+RiUw+pBiha54o0ICXjJPzIFMycQWUMccnaBjx06JOoYC+Tx
         DFYg==
X-Forwarded-Encrypted: i=1; AKwUvBybhiZ3LqV67T5fkmcaCSaZg1lSql0Ta+0g4Fz1tRbWm5Sh/d41oeclUqXytGkBOEnxOQbgIUFayGPaNw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKID54hAgPautQ4MLjjmsqBRmO2JHmLY7KIFyBVycCHzZ60zOI5
	eMoncC1JAWRK0HjrjgyXzy47e46iAKSbLkYcqKMOi56xvN+GbCDCG6PrFq2TUpY8Bh0=
X-Gm-Gg: AYBFou2RWP96jW9RNYUtKfZTVxtdM7DhLs2QBWYLe9LDmS7qFumjuOqO1GuXeFit313
	Qg4ffHRwZ8G4EQZBbIkAtK2q2c++jLHQahilLYooTjT7yTq4k07smofgjCObuYnk/pzgakcWPqd
	GlTa3rdlC7ttzc88P5027BMVyoaTUqPfk5kB1ef0b+M2enPxLGiWun0sHSS9vUY4a3bySZ88i28
	6s8FFgdVVr/GfqUYDlCqujDfUJ2e5Cb5au1CIC7zmmraMZkT5r/otASlR0OPcGSMtAPv0D+yAPp
	P7K2ziN872RN1BU+Tut9UbRnmvcBrnFSxueWDY3GIzJ9u59hXZiU/ZUsw1fRlewoseSlZaO8vzh
	kvD9lGv8IZ5vL+m+Wy8OQUCPA6Qt1rDn1aN+wJD2qfq0Qc9Q7NA6irOiGLi09hHsFMP17Gbj9wK
	+sBDdoHUXyohjpbxlOmA9v9hnmZ8G+Nn5cg3lpb/nwA6n+u23363rfZzAjiFMQzzTGmZjekVg2W
	t429zBw411Eu7NCyJou+dJXsO+TFnAj1Uwyd4QWZtIaz5R24TiP8WxnKEbGvaRjGKbFJJTcp3Bz
	M6F2kyf018jXUVubx2xLbAOK6h5HqOm1iLRxUW7o9XYlXpH7R3LvKjOxeHVnYLrib4yCCafjjPV
	C00UAOHD23zzuz4JMYc1eE85XMQ==
X-Received: by 2002:a05:600c:b99:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a9676d42d9mr119898525e9.32.1793283523465;
        Thu, 29 Oct 2026 07:18:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:42 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:26 +0000
Subject: [PATCH v7 05/18] media: sony-starvis2: Rework 2 lane support for
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
Message-Id: <20261029-media-starvis2-v7-5-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
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

