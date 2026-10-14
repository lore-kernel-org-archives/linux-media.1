Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E0F56E07E
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 17:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000487; cv=none; b=SVYAIrHWK6iUzfQQne2Pm3uVHrSLZ1vR4Ygwr1EB72meU/YHUjS9LBNf97+p1IXgdej6QY/zhpnimvMXD+lhtTM4Up4pOqZDWb9HSpEW5AwXRpdQFDSNrdtox+4jIk4SOSNVJ0+CZtrBcfOXcV9Qq8zbCD4in5+GASL1Crnxl0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000487; c=relaxed/simple;
	bh=HTrAGHETX4NwVwD3ff2mI5wDmyBYJjTn7RcHEOh/lew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OVusIt2CLuZVIvcwFmjdoUuiAWO6Uy6nMQlfxRmhPgwJKsO9rrry+8m8D5LhJ4d61iDpYAQad9f9hfbUmNmyNApWLiZc18oYrqcj61w7fP3egTRGE+m8pY6Lj3JmGPM1DTCCUotmki1PpYJcWcYCMr8QMOOlK7UnEHzl0/onxEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=V/09A4FA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="V/09A4FA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so42665345e9.0
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 10:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000482; x=1792605282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ViIVmTZUdmlxWYXsGU1CE+hwNheK1q+T3VMuwTzQPFY=;
        b=V/09A4FAJYHzqnpGB/oT2BeXomxIcqPfNlewAAcQC3UhtRiXsLSbbHV/s5fKq9xfCT
         v9uwk/7QaEj9dRrkCA8M0wiLLjSjDmzJS9YWF9kkDjkSiwQyCSJNw/ZJ7fh0KOqt6C9i
         Sxa4IDgjOw9F4dnO/sI/mEMCqoAOzediHfszD4/E5B9Z11N0YjldDRRS1BGSs6hWsIpj
         PaqjdfAXZ6OP3kb3OWiDRrKkDiUVu63x+jE6/VXdxyMxzGkWJtv17Y4c4sZfGA4oLOk6
         /acGE8iDznWG6WCmZHcQuxm9v8azC1LBr/xaLdh//SumW1NvFYDLRFOWitre7h0qCNwd
         1B8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000482; x=1792605282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ViIVmTZUdmlxWYXsGU1CE+hwNheK1q+T3VMuwTzQPFY=;
        b=UjWHgQDJ2h5MvnMCew+NJOxd6GPLvwy5cYZ1jEkylxP4cNvKD7E3rKE0eFg7pjO4lo
         ZpUjAWPTJcbtUGYfv3rvfWeAfBlNHKUeMqkuKOGQBZdEY83N1i1HsGiot5E5FA0KdiEE
         CyRtrTun3SdRk+irMuSD2LcICnHzoop94GczBaPFla0fdawifFgqDriv+CwovUvd7AXt
         huGq9TXbi81/iqRpmwqhzDRwEtylh6tpLJ2KA85yuETwUpb+YHud64OB9+8fTY5Fsply
         +Ie/bFkfy4TUP3bm6nIJoFdO1guvjOIhnchC6oAvQyk+Br4bhsDAAp7UHQ6+s/u6LK8z
         XqQw==
X-Forwarded-Encrypted: i=1; AKwUvBwWSefvxK4Tp8k14+fySHzlDKHIYqr07SfCjQUf5HdjHHgJ3pHq5bLqtd4tNrOJVKomAnHlU1DR9z0Nyg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJxk90jIrohBT/DOaiVMNPeUw9akj7p+OeL+lInpaAmYMv9TzaU
	xEC3GDyDOniLv3P1QUujWAJKrL5nW15SCNF4P1dkWhXlmmKHuWVqVxkEcSIC42b367E=
X-Gm-Gg: AYBFou0C9MlCabhNvRxGcvhFH/UF/SvNbNX+384mqzxdLvg+z8B7xZj0zkZowJ0WzOn
	Ps3gJxQNMe4tWLYshjEyrVOq/Ajr6Lp7w804qk/IGVVjYrHjdOK0X60qtPyB8cRnxMUiyFwK3Aq
	J3/Px6yjJobhWt4bb9L9XH+cJNujuMNCLi3cijvjAHpGWEg9UT6ouC1OXv9hv/OCW/GZgrG/gg2
	KkuWzSjmtC3UB2BsMwxl2oOUY4hd+9jDsAjh6iIcvXpxMT11mDJaa5IJMhy/0Bik2EfdbVKeJWb
	m1gR0BjkYT+n8c35aDNINbm3RnafrbEHEEAcF8AMZpIQzTV8G6XeXK/5e69WkGGukwhobmwnrXY
	OtlOOEfGYQFde5fJSYUJsGxIVrPGy4oIsyC8BVxKL999NQwkzzI4k6sAU6GrO5atR5vC/8K08Rw
	dfcCgQ7lOJwrsnqZI3pvJr8LVbwa10qFVtoNIlmnWBLdvEp03rG1hQdJ9duEUFiIk558C8hPu+P
	lvILvZ91Xzzs+I47X+INi6MbW2u7yQ9F2OJlqMCEpbB/rkang==
X-Received: by 2002:a05:600c:e556:10b0:4a1:93fd:8f2 with SMTP id 5b1f17b1804b1-4a193fd0a16mr186725595e9.6.1792000482364;
        Wed, 14 Oct 2026 10:54:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:41 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 18:54:34 +0100
Subject: [PATCH v3 13/14] media: sony-starvis2: Parameterise exposure min
 and step
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-starvis2-v3-13-c958362b5d06@raspberrypi.com>
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
index 86f740e10402..0fc62a99bedc 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -67,11 +67,8 @@
 
 /* SHR internal */
 #define STARVIS2_REG_SHR                  CCI_REG24_LE(0x3050)
-#define STARVIS2_SHR_MIN                  4
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN             1
-#define STARVIS2_EXPOSURE_STEP            1
 #define STARVIS2_EXPOSURE_DEFAULT         1000
 
 /*
@@ -640,6 +637,9 @@ struct starvis2_variant {
 	unsigned int vmax_default;
 	const u16 *hmax_min_link_freq;
 	u16 hmax_min_pixel_array;
+	unsigned int exposure_min;
+	unsigned int exposure_step;
+	unsigned int shr_min;
 };
 
 const struct starvis2_variant imx678_variant_def = {
@@ -666,6 +666,9 @@ const struct starvis2_variant imx678_variant_def = {
 	.vmax_default = 2250,
 	.hmax_min_link_freq = imx678_min_hmax_2lane,
 	.hmax_min_pixel_array = 550,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 static const struct cci_reg_sequence imx662_common_regs[] = {
@@ -796,6 +799,9 @@ const struct starvis2_variant imx662_variant_def = {
 	.vmax_default = 1136,
 	.hmax_min_link_freq = imx662_min_hmax_2lane,
 	.hmax_min_pixel_array = 990,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 static const struct cci_reg_sequence imx675_common_regs[] = {
@@ -983,6 +989,9 @@ const struct starvis2_variant imx675_variant_def = {
 	.vmax_default = 2024,
 	.hmax_min_link_freq = imx675_min_hmax_2lane,
 	.hmax_min_pixel_array = 528,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 static const struct cci_reg_sequence imx832_common_regs[] = {
@@ -1076,6 +1085,9 @@ const struct starvis2_variant imx832_variant_def = {
 	.vmax_default = 1136,
 	.hmax_min_link_freq = imx832_min_hmax_2lane,
 	.hmax_min_pixel_array = 990,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 struct starvis2_model_info {
@@ -1247,12 +1259,15 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -1770,10 +1785,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 
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

