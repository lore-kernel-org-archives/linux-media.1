Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233367;
	b=Y8rtmx5+iu41alpQapLgymw7yzVzgDRAtuUGh+pR0fEJCIwnMpxSbIkSAZNO8PfdpWuU
	 i9V11u7s4d0b/CQj2OUlZK6xuFfkjxH/PrMpi9y+eun49cXOe9QhREFU9YPUjGn190U35
	 TMVXM1m0/uiL/BlwON4yBf3FKY/46zVOQ7TD6wj4NlCPFEp6yNN0H4rIJpE8kFtlMVYjr
	 oCHmr7HOEJ/GUMOHiYqMJNTG2fOfFgHwF/Ta5RbXg7mVGgQxhIntAFMslJzAxyX20Jfud
	 5muo0E3FLR0nlbQiUCLjUnNTHhZJrSu3y2CozusnKoAeLELHzBbQKBzIoxgmyx4yftA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JKQ9f3vNFqQ/p2IKdmnFvGUTbkyzoerNwSUU9f9lkho=;
	b=HW8AGsx4DVhOSTwQInq2Tott/H3/Ww2mDhPZxJlMk3ITXiz9QgFIEAe4BFxX6cSpd6PZ
	 hSC+0NsOTmNZWnhXvh6IihuCOrC3TebKFFKKApz2K+KM5m9OL31tJciQMkJJWT05xFllm
	 O1UhI9q0QaVd+AKrrJ1LFCUF2cSVje4ZKPTj/fmP5HUmabLcjJ1KX1wTgzFzK5OZqlFQ2
	 rXIdxumYGLwBuoluXgKId3UzvUjHLjL6xurGnRP2oIbJmOyTW0sZiiJxzKgBiBe43Bidk
	 jye2qRRdgkXM3kfru1WR3DmKTQkoRr7QkZelEnIzS0hHpi3mO510MDsUmxawTXCHCug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzIBXYVK;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F47A606A682
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 03:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F47A606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzIBXYVK
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-71b47eede22so393923eaf.2
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233364; x=1795838164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKQ9f3vNFqQ/p2IKdmnFvGUTbkyzoerNwSUU9f9lkho=;
        b=rzIBXYVKzyx2bT/g7H6yV/0k17GfSmi3xJEEbzpShS8bvLiYExXd5tkSJvZnyfdRUT
         EDiXeYUF5FPpgYI1MZRTra+l4I9+xYd7aWd4n++ncb7UnJQjb4ZVvIY+brhpR4khkAeY
         2pyH84RZtvYagmhXHht68aQcu4WTI8/uictiO7Yk09MO+Wuf+HJKg2doiw6Z0cDeXJY3
         sqSkuzrwdpF4ViMAIVvOJ+re0EHIRS9dsTUO1GBAahznq9dQAqHbmjkndMm+dyJdMPgw
         7z/jMWGLZrx/4IQQMLBpN+rKTvHyhFq93kW4OG3J6MSO5ltwOlurHas+3cDzdalMQS80
         KHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233364; x=1795838164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JKQ9f3vNFqQ/p2IKdmnFvGUTbkyzoerNwSUU9f9lkho=;
        b=NEKQFVMQ7SKs/kd338pwrqlGYWF6TA92UAvlig3LKPIZGwZPggKcC39t0X02AaGMkT
         vLAmiYJKFW6hoNZaTwD1diyO3k5iHGNFjqA3uiMheDLTCAiq3p7vSJyNZnVPSYG5yEOX
         p5nZwn90I26ZbkriJtNfZ3eFQENfgOgjP0JkIAPCuyV90C6S3xpapi41vV0m56hTN8Da
         A/4/PXLqt+zc/rbKuPK3P8z7nbtTFSGSfSU7pm5v6d+IObxoOEe0krJQ9qsWuSmJk0L2
         I4rQn+tESX39FonvTvOUDmLHacmipfqJHr2QUZzUz27/bFx86VoNBESEa9OIcudRh8QG
         uSJg==
X-Forwarded-Encrypted: i=1; AL+hErExwthRaAljmRHH4ZO/OpclmlKnKbY+cyc1Huwc60n4gET+h4E/sbh0wHNaJMJXvGpjJXZZkApojr2v0Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+OYwpeKLC794MzEbYKHbDSYXWr5315uLwjwm3yz8I02b2yNeK+
	v2sLJPGNhT1VhPEiF5bVPmOklDsm/nxMTbtNqW1U1wUupWi6Dy6JgTQ=
X-Gm-Gg: AYBFou1vIGgHM2bAI7VFW7rJve912gQmruTg75Pvymb4gmOVf9ltyeiRTgahaDXtLtg
	WADlxqt0E/W6+hdXZBaaMDVKC3VLGZcBZz8yHVG+Q8d99C+JUYu1nHUErII2+Yg3c3ZqnkiorIN
	g/WxjSwQtsNChMkhFtiVo7r9CWGMIA9aaF5DI9nG4Z80CGXjBC3bJg+9/weDu3WjC/Aq3I02VKO
	/kB8aHA3WYK4VwbzWiGaCrVSveAdAfjRrHGm0uBxhU/Qr0YCSPFANN/icdwH94HN4webPWAj8zo
	GrTyffj8qAdzDeKGmJrOw/8TRDLmAtnsSbtvPiOwS+QDThw0sV/SliyXpL0OUvov4CD4vfJUM+C
	dBZhWYmr22xHPPQ9FjY96Rf/s+gzzi9u1UeJTDc1hxbnoK4lMcmiF+I7Gak8r6wZBhVDXdbjNjn
	jz1T0RW+M0B0yhG0TeZhn3VhnXP/RPhJqTpcpDLIEXMaLKAB1vQ6c+B04sP9yR3NvT0kTk5fOF5
	rHuHiWlMh5fKcT3FdK2WtqLgOvaEaGi1mA+ulBaksQCiE2ZdU6zvyULHtiDKFKOvQV9O1ZYiSia
	7HPvMMle1GCH7eip1pq4xEXUJ4BNr8xgZNP7tzioLEKt8NNSHqS/mUQihDF+QCbNVzUJjf04zlt
	rpg==
X-Received: by 2002:a05:6820:c5cf:10b0:71a:f794:49ac with SMTP id 006d021491bc7-71b395bd407mr3249629eaf.89.1795233364075;
        Fri, 20 Nov 2026 19:56:04 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:56:02 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v7 10/12] media: tw9900: add S-Video input and progressive source detection
Date: Fri, 20 Nov 2026 21:55:21 -0600
Message-ID: <20261121035523.26764-11-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121035523.26764-1-matthew.laux@gmail.com>
References: <20261121035523.26764-1-matthew.laux@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the S-Video Y/C input of the tw9900. Also, use the NINTL
bit of the Chip Status II register to correctly report when a source is
240p/288p instead of 480i/576i.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 117 +++++++++++++++++++++++++++++++++++--
 include/media/i2c/tw9900.h |   4 ++
 2 files changed, 116 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index f4f07f060083..be939ce92c0d 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -29,12 +29,19 @@
 #define TW9900_REG_CHIP_STATUS			0x01
 #define TW9900_REG_CHIP_STATUS_VDLOSS		BIT(7)
 #define TW9900_REG_CHIP_STATUS_HLOCK		BIT(6)
+#define TW9900_REG_CHIP_STATUS_VLOCK		BIT(3)
+#define TW9900_REG_INFORM			0x02
+#define TW9900_REG_INFORM_IFSEL_MASK		GENMASK(5, 4)
+#define TW9900_REG_INFORM_IFSEL_SVIDEO		BIT(4)
+#define TW9900_REG_INFORM_YSEL_MASK		GENMASK(3, 2)
+#define TW9900_REG_INFORM_YSEL_MUX1		BIT(2)
 #define TW9900_REG_OUT_FMT_CTL			0x03
 #define TW9900_REG_OUT_FMT_CTL_STANDBY		0xA7
 #define TW9900_REG_OUT_FMT_CTL_STREAMING	0xA0
 #define TW9900_REG_CKHY_HSDLY			0x04
 #define TW9900_REG_OUT_CTRL_I			0x05
 #define TW9900_REG_ANALOG_CTL			0x06
+#define TW9900_REG_ANALOG_CTL_SRESET		BIT(7)
 #define TW9900_REG_ANALOG_CTL_CLK_PDN		BIT(3)
 #define TW9900_REG_ANALOG_CTL_Y_PDN		BIT(2)
 #define TW9900_REG_ANALOG_CTL_C_PDN		BIT(1)
@@ -60,6 +67,8 @@
 #define TW9900_REG_STDR				0x1D
 #define TW9900_REG_MISSCNT			0x26
 #define TW9900_REG_MISC_CTL_II			0x2F
+#define TW9900_REG_CHIP_STATUS_II		0x31
+#define TW9900_REG_CHIP_STATUS_II_NINTL		BIT(3)
 #define TW9900_REG_VVBI				0x55
 
 #define TW9900_CHIP_ID				0x00
@@ -94,6 +103,12 @@ struct tw9900 {
 	bool streaming;
 	const struct tw9900_mode *cur_mode;
 	const struct tw9900_platform_data *pdata;
+
+	u32 input;
+	/* Set once s_routing has been called. */
+	bool routed;
+	/* The source was 240p/288p as of the latest querystd. */
+	bool progressive;
 };
 
 #define to_tw9900(sd) container_of(sd, struct tw9900, subdev)
@@ -186,6 +201,39 @@ static int tw9900_read_reg(struct i2c_client *client, u8 reg)
 	return ret;
 }
 
+static int tw9900_apply_input(struct tw9900 *tw9900)
+{
+	int ret;
+	u8 val;
+
+	lockdep_assert_held(&tw9900->mutex);
+
+	ret = tw9900_read_reg(tw9900->client, TW9900_REG_INFORM);
+	if (ret < 0)
+		return ret;
+
+	val = ret & ~(TW9900_REG_INFORM_IFSEL_MASK |
+		      TW9900_REG_INFORM_YSEL_MASK);
+	if (tw9900->input == TW9900_INPUT_SVIDEO)
+		val |= TW9900_REG_INFORM_IFSEL_SVIDEO |
+		       TW9900_REG_INFORM_YSEL_MUX1;
+
+	ret = tw9900_write_reg(tw9900->client, TW9900_REG_INFORM, val);
+	if (ret)
+		return ret;
+
+	ret = tw9900_read_reg(tw9900->client, TW9900_REG_ANALOG_CTL);
+	if (ret < 0)
+		return ret;
+
+	val = ret & ~(TW9900_REG_ANALOG_CTL_SRESET |
+		      TW9900_REG_ANALOG_CTL_C_PDN);
+	if (tw9900->input == TW9900_INPUT_COMPOSITE)
+		val |= TW9900_REG_ANALOG_CTL_C_PDN;
+
+	return tw9900_write_reg(tw9900->client, TW9900_REG_ANALOG_CTL, val);
+}
+
 static int tw9900_write_mode(struct tw9900 *tw9900)
 {
 	const struct tw9900_platform_data *pdata = tw9900->pdata;
@@ -203,12 +251,14 @@ static int tw9900_write_mode(struct tw9900 *tw9900)
 				  pdata->n_pal_regs);
 }
 
-static void tw9900_fill_fmt(const struct tw9900_mode *mode,
+static void tw9900_fill_fmt(struct tw9900 *tw9900,
 			    struct v4l2_mbus_framefmt *fmt)
 {
+	const struct tw9900_mode *mode = tw9900->cur_mode;
+
 	fmt->code = MEDIA_BUS_FMT_UYVY8_2X8;
 	fmt->width = mode->width;
-	fmt->height = mode->height;
+	fmt->height = tw9900->progressive ? mode->height / 2 : mode->height;
 	fmt->field = V4L2_FIELD_NONE;
 	fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
 	fmt->colorspace = V4L2_COLORSPACE_SMPTE170M;
@@ -224,7 +274,7 @@ static int tw9900_get_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
 
 	mutex_lock(&tw9900->mutex);
-	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
+	tw9900_fill_fmt(tw9900, mbus_fmt);
 	mutex_unlock(&tw9900->mutex);
 
 	return 0;
@@ -245,7 +295,7 @@ static int tw9900_set_fmt(struct v4l2_subdev *sd,
 		return -EBUSY;
 	}
 
-	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
+	tw9900_fill_fmt(tw9900, mbus_fmt);
 
 	mutex_unlock(&tw9900->mutex);
 
@@ -387,6 +437,42 @@ static int tw9900_subscribe_event(struct v4l2_subdev *sd,
 	}
 }
 
+static int tw9900_s_routing(struct v4l2_subdev *sd, u32 input, u32 output,
+			    u32 config)
+{
+	struct tw9900 *tw9900 = to_tw9900(sd);
+	int ret;
+
+	if (input != TW9900_INPUT_COMPOSITE && input != TW9900_INPUT_SVIDEO)
+		return -EINVAL;
+
+	mutex_lock(&tw9900->mutex);
+
+	if (tw9900->streaming) {
+		mutex_unlock(&tw9900->mutex);
+		return -EBUSY;
+	}
+
+	tw9900->input = input;
+	tw9900->routed = true;
+	/* A new input needs a new querystd to detect progressive sources. */
+	tw9900->progressive = false;
+
+	mutex_unlock(&tw9900->mutex);
+
+	ret = pm_runtime_resume_and_get(&tw9900->client->dev);
+	if (ret < 0)
+		return ret;
+
+	mutex_lock(&tw9900->mutex);
+	ret = tw9900_apply_input(tw9900);
+	mutex_unlock(&tw9900->mutex);
+
+	pm_runtime_put_autosuspend(&tw9900->client->dev);
+
+	return ret;
+}
+
 static int tw9900_s_std(struct v4l2_subdev *sd, v4l2_std_id std)
 {
 	struct tw9900 *tw9900 = to_tw9900(sd);
@@ -513,6 +599,9 @@ static int tw9900_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
 		return -EBUSY;
 	}
 
+	/* Drop the previous result; it is only set again on success. */
+	tw9900->progressive = false;
+
 	mutex_unlock(&tw9900->mutex);
 
 	ret = pm_runtime_resume_and_get(&tw9900->client->dev);
@@ -542,6 +631,15 @@ static int tw9900_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
 	}
 
 	ret = tw9900_get_stream_std(tw9900, std);
+	if (ret || *std == V4L2_STD_UNKNOWN)
+		goto out_unlock;
+
+	ret = tw9900_read_reg(tw9900->client, TW9900_REG_CHIP_STATUS_II);
+	if (ret < 0)
+		goto out_unlock;
+
+	tw9900->progressive = !!(ret & TW9900_REG_CHIP_STATUS_II_NINTL);
+	ret = 0;
 
 out_unlock:
 	mutex_unlock(&tw9900->mutex);
@@ -586,7 +684,12 @@ static int tw9900_g_input_status(struct v4l2_subdev *sd, u32 *status)
 	if (ret < 0)
 		return ret;
 
-	*status = ret & TW9900_REG_CHIP_STATUS_HLOCK ? 0 : V4L2_IN_ST_NO_SIGNAL;
+	if (!(ret & TW9900_REG_CHIP_STATUS_HLOCK))
+		*status = V4L2_IN_ST_NO_SIGNAL;
+	else if (!(ret & TW9900_REG_CHIP_STATUS_VLOCK))
+		*status = V4L2_IN_ST_NO_V_LOCK;
+	else
+		*status = 0;
 
 	return 0;
 }
@@ -597,6 +700,7 @@ static const struct v4l2_subdev_core_ops tw9900_core_ops = {
 };
 
 static const struct v4l2_subdev_video_ops tw9900_video_ops = {
+	.s_routing	= tw9900_s_routing,
 	.s_std		= tw9900_s_std,
 	.g_std		= tw9900_g_std,
 	.querystd	= tw9900_querystd,
@@ -688,6 +792,9 @@ static int tw9900_runtime_resume(struct device *dev)
 		ret = tw9900_write_array(tw9900->client, tw9900_init_regs,
 					 ARRAY_SIZE(tw9900_init_regs));
 
+	if (!ret && tw9900->routed)
+		ret = tw9900_apply_input(tw9900);
+
 	if (ret) {
 		if (tw9900->reset_gpio)
 			gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
diff --git a/include/media/i2c/tw9900.h b/include/media/i2c/tw9900.h
index 11e3bfe38e2b..4de03873aeb4 100644
--- a/include/media/i2c/tw9900.h
+++ b/include/media/i2c/tw9900.h
@@ -8,6 +8,10 @@
 
 #include <linux/types.h>
 
+/* Inputs for the s_routing video op */
+#define TW9900_INPUT_COMPOSITE	0 /* composite on Mux0 */
+#define TW9900_INPUT_SVIDEO	1 /* Y on Mux1, C on the chroma input */
+
 struct tw9900_regval {
 	u8 addr;
 	u8 val;
-- 
2.47.3

