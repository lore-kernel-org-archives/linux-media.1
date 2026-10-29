Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283535;
	b=oL4GtyzrCx0scJTFiupaTV4vogHLjOyMFBADFE+d7+NdG1pcu+m4Pt1XaHQpjW69tVas
	 dSepRQk9HH9/T4UrxttPclEHdsckCzsbSumPbi5d96p3zR3OwePuIzRXwihtpuWUdkGDV
	 RS19J5VlJWT9in+2+WhVUs2LRzNRvswrVHWSSB+nYY/8lwnabtHdoZMEnk/Aclqt16kEt
	 X7ZPbckOjhAjmVBtraLg8wpoy+CN6aDHN6ZUWsx0wWeqQAXFYRAaJUI8Ab/wBtWaFBW+n
	 lJFfbuzKmmqtC3l4iIMOFjOa4+KhmVqhyewgQFQd+5p00oEOa+Hydc90cXzHjnCKstw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dLYCwHkfWndTyUICgstRm5AOeTm77IFTdEwOfyWPNH4=;
	b=YXw1jQoXAk3mIS/satG8AbK4/cq+Y+eUjIwrINsDD/tnhLZh0FAmYtUIshGUlBBG+c4M
	 oGoHLKOx1hDNBdSbfp5LwU3sRad0T394sOi0iql0Scw7bW1N/LRvcJB/i6fNZGkVBPa43
	 wk1x1kmkjcE7SOC4ph7uIuCnGvicscbRZSq2DtjBtS93wKMsoi/s5FOToJlHyhpgH16jQ
	 km4FbF9AJAsCCkjOna5sXyeNJQS9JcXEkq0xAycLX60egEcJFzFdBvZmCj8FLEuVrjnNv
	 1ObiUEH7JTeYjTtNPY1hXmNtwTBhvMUus7LQMxGxcrvCGnf8cNS5qAVBApAgJD4/Rjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=qyAenD7U;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CC7606A909
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28CC7606A909
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=qyAenD7U
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so16494445e9.3
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283532; x=1793888332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLYCwHkfWndTyUICgstRm5AOeTm77IFTdEwOfyWPNH4=;
        b=qyAenD7U1JWfYC6mdM4EqSFF/f1+Y9d//m7euYPHBInTSeSh1DDKUMqOHwYq4tllA2
         67ueDt+/M1gJ4/V9DjwtmrpZ5G4nwhI2hSy8aml3AMKtdNJ4nVNdZjSPPtvzPGG1PUKG
         JlWZhMItvGs27gK6qOocRrFce2QExMqObcDqunqFHa6RQ5yCcuSAGG4srKdE7OXwPI1W
         raF8QrqiB+/wiw61ojEwCnkFTkxxjoBUMG9sMgq0lZ5y5eboTpYE3FYw9MrZRTlnavp9
         w4JEyKTNR5e8G/fncEnUKoW36D16Xb2Be5qHeaGMfX+PHlZ82NAIw++A2ULpHlVd2Z/b
         I05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283532; x=1793888332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dLYCwHkfWndTyUICgstRm5AOeTm77IFTdEwOfyWPNH4=;
        b=BEe5QA5mZZkgS0yjUuRs1037jjsrxy9HsgFaP2MX9PwaCkK6++HW3utl/QykV1HPiN
         OFyL70qpKd+t7jTv+Sq1NGKpBQ08bS9f97No1jey6rZC8UdZPPsXWbS375uPncdbU0UO
         zJFt3o77OfNd/+ruH7WUj912TpYs6VXQPySYWbNWt574JssU2fHTpHfUd+EP/MiPEmTx
         LWlA+O77c3vXNVzHa/Qc4IGiGqxafZyjSd6EytQBGLhL4xcSrImF4ukzYE4oT8M86x9H
         tc4Y2rHye3KS77W65crY4P8Yto0+0fkJtSvmtpjiZzCXTPLx4hqJXkO7QumFUeWRoKSA
         Bi0A==
X-Forwarded-Encrypted: i=1; AKwUvBz/Xwymp1fXoo1VNYje1jsui6fLDKYG8C1ST/jrs7RJ3ofKdOkcb/GkawrocAwP18leByYeMarLTFGJKQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLAetTkSaAy5zysKj7qf9bkfn1IzcAexgQrnclNH+vI9IOjwhSB
	qZaFJEztDVKYfJwrJ35p2apFuH5s7DMciDoOs5ZAIlsxxynNUVqk53wI00DBLr9fkbo=
X-Gm-Gg: AYBFou0tNMofvpr5p2qLBhTNnnFRHVs9fSDJCiW5E9yxKr9Ap5eupW1zCIwBOvepwYw
	/0hYycAq3qSdjP/mFBhofFAI38bLflM3i0sDIm928sKpYe6tpoXOm9vI41z0TDKzbbg6K+QKDWR
	ELzyNrHPWY6i6lhaJbtA+KGsFmv+KkQs0Aez/AkFRmEdjUKZC2LaXFV9Be4jLs5YeRNZTxV4hGY
	qCJlf8bV3HFmdelIyTOsO1U8FB7tc2iuHyiqbOZaGj0VoYwZ3Ke8LVMlYizcm0H9mfrQRlCv0ik
	ph8VwnndoP51SIEP2zpeHtwupcp+8CGa6Lo/mjeelFCSuSlgwXPWRQ7VoHko7ttHoWUjJ7ViGtd
	P8fzWa8KkLsQDKHnHP4A25NGW6s61eLTm52XgJiw7HkgcIgcJLwBclNClBe57YAReCtKAh3hR5m
	gAXHyPzsAOGvxxvAW7OKr+T6VceiKRvUoLQY4izjVLYimYJPzWO3pyVBolZA1dp4SDeN4d1KY4c
	kTEQsZNKdkiQW2YY0s1AQUwYoYmQ29VuE8YqOb/9FQNkFqJgboFc9Kl40HIjRHyp46DdPq1VIZt
	t9bVGnSRI4AKrQfyX8CuccXbjq0RqmuuM/4ry/TXaUo4G8ftuoWm4nrDVFwciESH6WU2sEGeBt4
	A+WwfSUwyFawtpB+5+NxcEGZB9Q==
X-Received: by 2002:a05:600c:4687:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4a96552db93mr128360465e9.3.1793283532552;
        Thu, 29 Oct 2026 07:18:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:52 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:36 +0000
Subject: [PATCH v7 15/18] media: sony-starvis2: Parameterise exposure min
 and step
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
Message-Id: <20261029-media-starvis2-v7-15-b33a1332fdfc@raspberrypi.com>
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

All the Starvis2 sensors supported to this point have specified
the range for the SHR (exposure) register as being 4 to
(number of line per frame -1).

Newer sensors are deviating from that, so parameterise
these into the sensor variant, replacing STARVIS2_EXPOSURE_MIN,
STARVIS2_EXPOSURE_STEP, and STARVIS2_SHR_MIN.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index e64d943369b1..15d5a066a556 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -68,11 +68,8 @@
 
 /* SHR internal */
 #define STARVIS2_REG_SHR		CCI_REG24_LE(0x3050)
-#define STARVIS2_SHR_MIN		4
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN		1
-#define STARVIS2_EXPOSURE_STEP		1
 #define STARVIS2_EXPOSURE_DEFAULT	1000
 
 /*
@@ -641,6 +638,9 @@ struct starvis2_variant {
 	unsigned int vmax_default;
 	const u16 *hmax_min_link_freq;
 	u16 hmax_min_pixel_array;
+	unsigned int exposure_min;
+	unsigned int exposure_step;
+	unsigned int shr_min;
 };
 
 static const struct starvis2_variant imx678_variant_def = {
@@ -668,6 +668,9 @@ static const struct starvis2_variant imx678_variant_def = {
 	.vmax_default = 2250,
 	.hmax_min_link_freq = imx678_min_hmax_2lane,
 	.hmax_min_pixel_array = 550,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 static const struct cci_reg_sequence imx662_common_regs[] = {
@@ -798,6 +801,9 @@ static const struct starvis2_variant imx662_variant_def = {
 	.vmax_default = 1136,
 	.hmax_min_link_freq = imx662_min_hmax_2lane,
 	.hmax_min_pixel_array = 990,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 static const struct cci_reg_sequence imx675_common_regs[] = {
@@ -985,6 +991,9 @@ static const struct starvis2_variant imx675_variant_def = {
 	.vmax_default = 2024,
 	.hmax_min_link_freq = imx675_min_hmax_2lane,
 	.hmax_min_pixel_array = 528,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 static const struct cci_reg_sequence imx832_common_regs[] = {
@@ -1078,6 +1087,9 @@ static const struct starvis2_variant imx832_variant_def = {
 	.vmax_default = 1136,
 	.hmax_min_link_freq = imx832_min_hmax_2lane,
 	.hmax_min_pixel_array = 990,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 struct starvis2_model_info {
@@ -1249,12 +1261,15 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		starvis2->vmax = format->height + ctrl->val;
 
 		current_exposure = clamp_t(u32, current_exposure,
-					   STARVIS2_EXPOSURE_MIN,
-					   starvis2->vmax - STARVIS2_SHR_MIN);
+					   starvis2->variant->exposure_min,
+					   starvis2->vmax -
+						starvis2->variant->shr_min);
 		ret = __v4l2_ctrl_modify_range(starvis2->exposure,
-					       STARVIS2_EXPOSURE_MIN,
-					       starvis2->vmax - STARVIS2_SHR_MIN,
-					       1, current_exposure);
+					       starvis2->variant->exposure_min,
+					       starvis2->vmax -
+						starvis2->variant->shr_min,
+					       starvis2->variant->exposure_step,
+					       current_exposure);
 		if (ret)
 			return ret;
 	}
@@ -1778,10 +1793,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 
 	starvis2->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
 					       V4L2_CID_EXPOSURE,
-					       STARVIS2_EXPOSURE_MIN,
+					       starvis2->variant->exposure_min,
 					       starvis2->variant->vmax_default -
-					       STARVIS2_SHR_MIN,
-					       STARVIS2_EXPOSURE_STEP,
+						starvis2->variant->shr_min,
+					       starvis2->variant->exposure_step,
 					       STARVIS2_EXPOSURE_DEFAULT);
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,

-- 
2.34.1

