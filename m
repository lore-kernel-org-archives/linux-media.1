Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690471;
	b=cLtKL9oq1HitSwgJuFhIiDDJpcR/WUcZM5dDiSLje5/Zzv8tdJxU7BmJv7tSI4jbl2qa
	 bYNzKSfVMK1CtTlD3GxJqN30Lnn82svZGz98OYVszkEeDpZB43eDSFVY7ovMjvXwEZflN
	 kIhG/wPuRxnK9y6yqswrrfE/DQYBvNSLWXYrDkO6lj0zgur9KFKRoTXVx+wot1+59Jtul
	 saywnr6L23Kz05qB0zqJV/B4/qStZ/6upkuZTQt7+r6jsK59IDO0jAcwJymzvprm2PT8+
	 Gso5l81hebm01XsM254vbiHmfI2FcX0FpABs2rC9R+FUxN+bb3+M1e8vRRsfdCPonlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=g2Q9s7RMNeWpcW6ZkkIYUa+Y/Qr4kaBiQvLPfc53Zu8=;
	b=lf0OAGTbLJaPFcjJeDJcAsIWz0jqtNi76nCRxTEEJ1ywvZuud15XU6kLa89UqT7BYVLy
	 JGPk7D23j9LgygUblwp2neRTVfZLHb7hEcPjvyAnwj26/7ErDPMd9H41ZPIclgkGD8Mty
	 pnfJqnHDv4x6ariLiK5R6wQGWej//gngA0JtEpWkq3y+WWI0j4SWkRARSNG7NvpbruttA
	 VRoP9/MbSHebZ4V32AcL6jidkImS55nAoJ5+c2XWnZQgGwc1tgwIVf7iLlzKJJmFgy1jP
	 R9FA9EzmsM6f+X6HcczHUYupHBWzO/CgSKcH/6jDa4HoCZ76mLGVmcDTDO8fxrC0V3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=bgas6k85;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226A4606A324
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 17:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 226A4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=bgas6k85
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b0584ad71so53353f8f.0
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 10:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690469; x=1793295269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2Q9s7RMNeWpcW6ZkkIYUa+Y/Qr4kaBiQvLPfc53Zu8=;
        b=bgas6k85plq4qK7o8D+nY+Q1OOUJLT2FZsMDezlnz8GaTMY9Eg3NesEQ8SYQ0/1HmA
         BJPsgtKjU3nFeqc1sZlOiinJI/gMiF+9/JbxChw2ENC17eLFXb4VbBdCSst9+Bens5S2
         S8XpoTXqLee+MDHs6RNM6h1hWSpE68Rwk/5+R6sg2gOfab7t0PWr0+cIgVcYfC+IY4pA
         KeCqH9nuQUbxGWDVeBp+xXiz7lgbkQVQoFX+tIOkci4OSp9u9fU2Mq2flMACj/72nyMa
         Yb63uggzRSgJ0fvla8CP4OMy+P3S/upPLJsCwTXspu8eDfLJ4GBDotIzhRitJLdRSS5h
         7qTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690469; x=1793295269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2Q9s7RMNeWpcW6ZkkIYUa+Y/Qr4kaBiQvLPfc53Zu8=;
        b=wpEn/LuwmS0lPsO9RLDM7vu0NIPivPugeY9vXWbewf4JJT26Uk/KePKYPF5z4LSToO
         12y4LMgd8ZvNaugZp79PFvezpp4oyeC0e6U4WHaKVM3dYRSCeNCe+ISBcFvEtqZgfDa8
         EGgtQF/aazDvj2lhY2DFhP70VrzlvZkFu2iAQjOn18zGXLefCDivFq+S1CZlQCEOaHZv
         UK5bpBn56sxp1rlFb3waKJFVUye81Sk5gF8AGEV9yDA2eNJo02aR3m0lvyXvO1WkCobN
         Q2m+aq3uACzB8ZTJD6ye39MbSGy8jZqP7wwItxdX29LTf8Z0nKX5ErEmf5SfudYXhFXA
         XIhQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/LazFZOisMxxnDxFuKLBYjzlm1LnKSofPjVvswLx29VoWHZyyiADjZdo+823PF/OL5VXNm0NgI37myA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLc/i/m0I4VzxWCb6cKc8PqBt99wJT2b4vJXRA8RaFz2jokzX00
	4XAMbAssCtaYhgEbj122bCwxUJpAL3tttu/TDo/Z7Sazx3cBrm5/bR/ZKFwDcYG6SWg=
X-Gm-Gg: AYBFou3ENq0OUJqtRDIUbw9LEdJMBH+UMvEuDdTKXywlTYResZ5dJiE57oesAB2NkA3
	Phkf5O3cnmBxqlhMJKKrvUMI/+noTCyXSZLVZFT6DrjMRxffpkIMtsDIhJ/lp7PScU90cf0TP1j
	N9Gtst3h1rtrul/lty5mQoVVitg6EKvTI95Itbx1mNdVvxe1DRcYsJafRqI8dCaYpytrvVWjPCy
	JLPo9rUR3p/dRrONqPOOCJkCIBdM9eDWGkiYdVNWAMN8EBWMR46+N4j20lC6PGYwJvtqH4q9uPo
	Wkj3YqWBaEVA4yBUDUvHEo7b5hjdBWDch5ti5td/JIpYtaqVjd7KotMKWDzxa1xY06N9jtf/H6V
	63cciDXcpnDkm7KWJ1Z5AN0LFFcDKHD0eTwyTihys5R2mFpQ3Xk9H3cswOV+oktqF6nrcrOpwbx
	6896oWgP9PWxfJnMw3nUhPTTpDz0lBv91YMh/RR5JNwNom/M7u4aPtJa5mZGMl519pVIvjicgGc
	ZzNJddfr1R5KnHEFri4B6TiopWRG99/vu4Ij4b8eS4j5WrNkwRFSas/LLyL5TzNVKIRZko1QCbz
	RSeu3GiZeXu0ZLA4ZVVm4OFYgfPtCaw=
X-Received: by 2002:a5d:40cb:0:b0:48c:7037:aee9 with SMTP id ffacd0b85a97d-48e264e01dbmr9492451f8f.50.1792690469507;
        Thu, 22 Oct 2026 10:34:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:28 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:33:55 +0100
Subject: [PATCH v6 02/18] media: sony-starvis2: Reorder link frequencies to
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
Message-Id: <20261022-media-starvis2-v6-2-374343f55fd3@raspberrypi.com>
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

