Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283523;
	b=uwjoGsqkXovnS93PftyZ4/gPllwlbHn4THHOW58KrQQP3n4WCr2tdsNq5J9q3izlpB2j
	 3k0t/KtRsvea9AGrheT6u8/+plFKJtkk+k7x5HdHItStG2YEg7PW8xzWmzvtOibyQAxLd
	 DfnPfFxsKiE/96bt3sButNRvBZcgS27MXcilD6d6pozOjg5j0NdENA8/yRx77/7o9WW56
	 Nbeb2uUV3sbtZIx7Zfzd6vb0YCWKrv8Td7yxUOatHNjtdcfXLaBLKRi1XPOsHeaNfJv+y
	 MX0A8LaDFPyJBDhnb/nFr0iQMlDkKkEoyX6E4+JfPhrmZW8Q7LGc0f0CT1xgoneX70w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=g2Q9s7RMNeWpcW6ZkkIYUa+Y/Qr4kaBiQvLPfc53Zu8=;
	b=xE0sUAf6BgImhboR4w4LMoGkLaXWrMHTEJRtvBT9Axjkqo4HkMiN0rv5+8RK6koQRXhL
	 tF3Hr3K8MAEujewS4i14zjbR15VHcd4f0wEUss1wd9ysaR46Pd6iQyCXalcp06i2zebI6
	 fvcbFNDNaVDK89Yl9tATfbIZm7pEmFqfiZgDtaLgEOqpT6bKFfasR9gMlbVomZEoFXf41
	 YrjAW/YTthe73bQ7wond+QRCOcIPfn+KkBcU1Q02w5nS754ariJiyU7CVqYIHkIrVfLnu
	 nQ1vAEYWADQr5351B6Uu+9t/97fQ39AL7BFw5FHft1Olmjl/uT8bObRVf2oCF0bJqMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=fuxRwIQv;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F43B606A32A
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F43B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=fuxRwIQv
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so20860065e9.2
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283521; x=1793888321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2Q9s7RMNeWpcW6ZkkIYUa+Y/Qr4kaBiQvLPfc53Zu8=;
        b=fuxRwIQvb3e976FiXVMdg6SHXixOXVRaowr68nVfAqH8eD5NAp5N9yZfae163nCeAK
         3VirG4pkwprxkCJreXcIvis41yC6wxi7VWOkv+APQpjpUzAM0N++7QQJcsXzvb5y6Ozl
         EjCL2Xg6QcxRyFG8voCKTvgHx6FBsfIwMNHinOlbHx1tFFBtavnBVBB/dWcoXh20jHnp
         o/pH6f7lcEE6v/5O21q+fdCZietQeyCAo7Fm5DglMPsFgNAeI7k8J44sh7SWip7dCaPW
         /29H05Tz0/gRPDACaQVTwMyLLejGxTm7UcbHWs31e3QN8nqz+zvl1F0U6MomISgO9s0E
         ykKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283521; x=1793888321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2Q9s7RMNeWpcW6ZkkIYUa+Y/Qr4kaBiQvLPfc53Zu8=;
        b=Gm0mG10kzPWG4tmVws/7pi7S8p+pI+U3fGsehDmVpVQmfRAwgVnIKW0S+6Ggju1pJa
         nk1Nv+gOKDNolc1UuVYojrol8XiIvtDHqL0qU7KDER0c25X5w+k7qIVxHKtGz0tIc590
         m15dWgkfWhbhgZI+DUotXPaR6T6JlJFqiJqA1gy0KyDamiLbtIbpDcKQV736OaXeNW5F
         ow/oiqxofvZfBydUzVOw3GsNFyZ25ISBbv5apZoKBuJeKlWdlT6aYoKHeQY4k5cQZW4V
         RcmcuqYw9FsJSt+PMwI1bvWKtJNR2q0wTnCNKLCZhKIXIVLdaVFpBT4vS9+lQTNHekCz
         f6eA==
X-Forwarded-Encrypted: i=1; AKwUvBxv2cyFxDUE99daTJkSluD2Km5KCOLAkKn6ckszmq2rR+TOgn9ouFe+NgmVfK1FyYhDVTeGN0jsVIk3jg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIehGQxSt3e2JJEGmCypQz0r0qqR29Wuqu47Q309lKBXpoRfEuc
	MKMsTwsDB7zzSEQqLZ6moPjYfCgZjEm2BQhhbWGaQm+kg+Dz4afE3CuQSw62sJp3b2U=
X-Gm-Gg: AYBFou1IusMASkodlt3LGpeZ+m/hJtuEtJ9DIqfuzTqC4DXmXvJEdeSDgok9gBUbeBZ
	Dh7abo6kend85nAIH0Bl0K8AHmq9VNx40/zZ/0pVosZS7sHN+Meg8hOS96l0a0Abj3KCkbWqFwd
	kjxiTYvV+xDxfS+FtBdNppj/Mya/lFdZq5RLMRkufWajDsgnel61RKhlXvGBrgCYZy9OAiUWOZO
	UZiDQFdIksO2BysuWkq40X21SfZthTrOhDcd41ohmJwGfE7f5gFtPU24kFbJpN+bl009hUwJOzx
	tNh+dfaDGS5eVqxPchk7Dju/iolXP+7fhADMe38rPRD5kwex7yfw2z/17oWoZbKCE5d1C3ruX62
	QZbGqPd1+uoWJDJ9sjR7+gyWEE50PuU2m/3CamNOZQ69vchMpofxF2nXiOl5F340YA6kZ1Cd1EL
	2HrIkVHFsjztkXYMLUA6M0Zw+hXjZCb0D5qHDvU3JnRk3HxEiDHsH532E7bhwE0wfz5zm9fKMmC
	tbqLaEAI/9heBuve06R4Qyt3FyqMrdJWWfw5W8R3bYjNRo6ioGkx777qSQ/vlNgdpb0jjwhl4zS
	Oubh09BN/7GKFMpRcXovMonHN/12TzkxzfrgZfxQjlKo9Kx6uNLezZMG4/MyfRANbroxfkfCyK0
	A5O1u
X-Received: by 2002:a05:600c:354a:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4a9662a0c02mr123628385e9.9.1793283520731;
        Thu, 29 Oct 2026 07:18:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:40 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:23 +0000
Subject: [PATCH v7 02/18] media: sony-starvis2: Reorder link frequencies to
 remove lookup
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
Message-Id: <20261029-media-starvis2-v7-2-b33a1332fdfc@raspberrypi.com>
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

link_freqs_reg_value is table that just reverses the order of the
link frequency enum.

Reverse the order of the link frequencies so that the table is
redundant, and remove it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index e62cde583324..134fececac5c 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -187,25 +187,14 @@ enum starvis2_lanemode {
 
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
@@ -914,7 +903,7 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
-		  link_freqs_reg_value[__ffs(starvis2->link_freq_bitmap)],
+		  __fls(starvis2->link_freq_bitmap),
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
@@ -1177,7 +1166,7 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
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

