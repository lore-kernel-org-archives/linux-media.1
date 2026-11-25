Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636268;
	b=Unv3dSEPqkJIAHc7R0nZT4Sup4hXnTaZNFeMoV23YYZiEWGI2cz4zaxr+FDl9FJSQQ4U
	 pd4Px2qdfoeGmYi6G1NYIfA3Xvg9L6OMXIIogS9kndzcrGc5+aVa7hrr7Q33tAWJCU3nn
	 Aq3atCeYZ1dZVj53BplkKVx56mj7EZiCefdgxnKI13hPYuKunYdQMekScFwfCzEdL7caK
	 MfN4zQSJbFvPSUCic5xnbfh0bbUFa6RhnbEHrFvabqMVs6uC/aZ3bjRyFH1rFzeiOQZYi
	 B4lK0iT8PAu4XjJEjAmeuThIH9Gew6G6CeL5EuxiDoRRwpPOD0/WDL3MbXhmuwApjUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=psqHHNogAijzU4ovxDdhAiBJy4EcIWwdu5O96XVgXRg=;
	b=disfW4K7UVhIbEYJ+/d7nu6JC50mkOjUfPMh+cztrQZ2QWjQ7oKCc20L9UozL/ToNwUO
	 fmcm3RBHfwg9ABbDcBVMfOuiuBr9U/unv1C6Fj63fFvzR9jugNa6BUSnyprzLQNrc6dTI
	 y3ol6MgtKriq6ZBJaZQYX34sYln6nBrLmuwZEF3T3ILRe/eZ5EtcCJqhuDJpbJKyF8sIX
	 Rqya5rYfLG6PJJi3LAp3dipAMbgqsMLernWVdb3RKfCcVFjzMtmir/RuiLTcLsL5zC0/H
	 4nKh/8JnRQ15WImNkVeSPjvP57vSEiTZDymfM1a6b2CXDsLtKFPvsO0R7VIhqGE/dfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RgNwNrrp;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADF0606A337
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ADF0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RgNwNrrp
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4f14642adb4so3788785b6e.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636267; x=1796241067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psqHHNogAijzU4ovxDdhAiBJy4EcIWwdu5O96XVgXRg=;
        b=RgNwNrrphB89S+Jif55BBZ2AcpLPz7JS/m1jb7tf0HJTg1r5FFYyPZIOpDbc3XJin9
         7sEaD4ngZ1+f/NEIiZ0vmNai8QRveJ15ilFYR2+XLzJxauGjIVVgwfk6Ad7m4u2UxxMI
         xgrfoyRazc42x03+EXZCH4PlksnXWtR/CGc9foM8rvnCvhRRrqyHU5I9ieNV8eNQ3f02
         Qd2gvqNw0A6H8c66LuOb7Dtoyn4lA1eh0zMRvDOZhrHoXFN54WMmO7wbAlJ/gOXVetfX
         cteM6DhZu5tPH4TKsIsbRvsnb2yu80e41H3M3aXFUkUbfOSjHaMKUtq1TX7Et6WSaXk7
         a/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636267; x=1796241067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=psqHHNogAijzU4ovxDdhAiBJy4EcIWwdu5O96XVgXRg=;
        b=C4Y0kYdyNmNs8e9xpXVl50znkKCyHUYpZyUpb8Z3hevg88GZMcxHj/O16ppvP3Mcnh
         bKzlqiMCR+ntOYCK0IZVgyysYb/4IQtRKxK+LgPVHQ2sN70FbvBlkEoANiNP6X/iBiZz
         lNcxnYhOe+L5N2oFoQeQ//y5N6SSGmlABuRGqXyaXGi8wgUTPztAOPFnFW2KHJS0Zj2m
         eWnCz2mvvi87FVw2wAAr/UbBQOPn0dQNYTjU8yJPk2P3et6+1kHBTFbwWqi5DAjvaecZ
         XC/BS20f6tlqDy0cptCuXVAp0cIENNJSbaQMchdhQOHwP2UKoK7zfgo2CVJacKxXprN2
         nByw==
X-Forwarded-Encrypted: i=1; AL+hErGlh6YTXm9ceyuNyXkQfInwBkc3DWM11r6wEP4Z1xs5zZnz+i6F+NsRSVss6visqxzabQaa9GqX0vv/1w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/NH+WUMiQGUNB7bWtIsv9j+AuAs174pGz88Pku9f4sza38fDHe
	4TmGwrAhZOjXHGZokzXNYTjaiw+eM31VnsdmldDiNmp1pDAeACNRsVw=
X-Gm-Gg: AZFdTZch87Lw64+NRkzyvJPaiMgIEOdxBDq8KhwmQ0xwLYxejfxyvx2FIYsx7yJaV9r
	o8Vn8AfQFH8l27TjJOmTJLzrNVcGnn09XZLcij5jgIuEwlBdiI06JwU2MSU0qd1DGbOLD171g8n
	upS6VBI3dWNDuHTenL9ZQzhGwXiIWUpszIYzHxArT3bmNv/3aYBVCoGMvaj+Uo0Iww+jiAYzjBu
	XRS4BMQf5fDGNM0kkJT5206wa05wdDoNTfaNISczo2LrGpRtSTVlO2tvX8a5afkQOXUM0wjBpsm
	LACsxIqkncQrLjG7paOJC9/ycQJFniV8bkC5T4RtZnUIZTnEOt92wFhqR1BRmFq3qYPkeUyPNpN
	uAMyrJVkIz8tredLsDff27eDpLW9u/v1vr8TiWMZfrsz8rslltL/GbUBL9ogEG+pxjRG+syIOah
	e6Reas8xciVl189HVLQQ8Qm5C84Td1NBJTezN+6MQ4N55kXyx5cvOZrRM32P8K6DfF/A5jNaVI6
	VGH6pyDZdzyTiUOO2fbVNorgPpsF+b5zdZTwuoy7fcEef7Aom2ouJIRUnvf1gAhWuFek8jFuFcv
	0zbgI94/KBf9gIEx8nUnMcA3FwDbPZyFjY5214NSban64z5Pg+xQHozYXPEbWC9YwvrerbXCZU7
	1tg==
X-Received: by 2002:a05:6808:1908:b0:572:8f69:6b0b with SMTP id 5614622812f47-57a0a927ff3mr21319492b6e.25.1795636266863;
        Wed, 25 Nov 2026 11:51:06 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:51:06 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 10/12] media: tw9900: add S-Video input and progressive source detection
Date: Wed, 25 Nov 2026 13:49:49 -0600
Message-ID: <20261125194951.19072-11-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125194951.19072-1-matthew.laux@gmail.com>
References: <20261125194951.19072-1-matthew.laux@gmail.com>
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
index f4f07f060083..64acfc4d0499 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -29,12 +30,19 @@
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
@@ -60,6 +68,8 @@
 #define TW9900_REG_STDR				0x1D
 #define TW9900_REG_MISSCNT			0x26
 #define TW9900_REG_MISC_CTL_II			0x2F
+#define TW9900_REG_CHIP_STATUS_II		0x31
+#define TW9900_REG_CHIP_STATUS_II_NINTL		BIT(3)
 #define TW9900_REG_VVBI				0x55
 
 #define TW9900_CHIP_ID				0x00
@@ -94,6 +104,12 @@ struct tw9900 {
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
@@ -186,6 +202,39 @@ static int tw9900_read_reg(struct i2c_client *client, u8 reg)
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
@@ -203,12 +252,14 @@ static int tw9900_write_mode(struct tw9900 *tw9900)
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
@@ -224,7 +275,7 @@ static int tw9900_get_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
 
 	mutex_lock(&tw9900->mutex);
-	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
+	tw9900_fill_fmt(tw9900, mbus_fmt);
 	mutex_unlock(&tw9900->mutex);
 
 	return 0;
@@ -245,7 +296,7 @@ static int tw9900_set_fmt(struct v4l2_subdev *sd,
 		return -EBUSY;
 	}
 
-	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
+	tw9900_fill_fmt(tw9900, mbus_fmt);
 
 	mutex_unlock(&tw9900->mutex);
 
@@ -387,6 +438,41 @@ static int tw9900_subscribe_event(struct v4l2_subdev *sd,
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
+	scoped_guard(mutex, &tw9900->mutex) {
+		ret = tw9900_apply_input(tw9900);
+	}
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

