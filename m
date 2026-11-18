Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029748;
	b=uht5egvhW3Deg8bG4iw9G7OYRNnQKUHktB0WlBi3u3ef349zZOp67/DVyhvZx/imzH/h
	 u0sXiKcUQjIaD07tb2fWxGksfSISjDaC1ftEihKXRzVc8JeRrm9ydZEhv9OH55xYrh7Tw
	 xJnnjkbnFLqM29oE4FR258AUZJYh5uDscASCH94tZkuzlaTftQwGDLocmx39d3VV8XvOW
	 V/cvGfSzdWqqOrhGCJHAWZpykR9lVqZ9DT1pf4fsoylLfa1QmQbu2Rxg6T6EnMRiswOQc
	 XB4ScAHj1n3at7TXn6jcs/kzdILaBGQpEHJrbpy/kix6p7GDutZDzGIt2PtDx6QRMjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JjQKOjoi0YbVdKDaXTUg0ORZjwXbMMCDyN0aPYFrKQk=;
	b=DZXAlt5zxhA+EDsCkcwTht2ruHFP1BIYKyl3aWlQBffIK0PgZlEwJVlcQbRn4bIRoBxj
	 4n/l6XWK5HakEPhmXouJq9ZED71tHFkPrD6ynDo3mx6/fwofxYgctyNP28i1xdZgXxAjd
	 JKs0LVXY+1gYj6yF6Flf96kQxhXNQfqSn0gqpBjZ/jwjXP3EZpjk2WFAuSzDphhhyz/82
	 iSHjJMGLoCLUMJBLILyYex/IqpekRu1eVSzyJ4Md+C6OSNeHsmn+EUS9Oge6GkRNqjneC
	 BWyvYgZsnXHOZSWChtw/s9uz3JClCAgpJDAXyZpXTVHh1ZNlUYKPPXUrXxkPCqIBcMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XiMT7BC2;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5932E606A31C
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 19:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5932E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XiMT7BC2
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-71ac798b8bbso908090eaf.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 11:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029747; x=1795634547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JjQKOjoi0YbVdKDaXTUg0ORZjwXbMMCDyN0aPYFrKQk=;
        b=XiMT7BC2fEWCvyJmCFnTdRQy68dLZ+hIb+yQdsmPfCWVGAh36riCoLsLH6s/6BwBU4
         I6FW2Fi55gvaG0juJvVx1Tuq7StryhXCu3qRa0kQAxPHHL+IvwI4ZM5aQPqm+q8AExOd
         Tmmx4rALYarW6lS9W6DV1wapGWSGblPQ0gXKRmOqTYfcFhJppi0laSb2WLh4jTxIHzNA
         1Va9LoZzjBbGNGEKo2+cOtK7w4N8z6mXM1kJiCEhzDOyVwGPRHfYz4yg4wloUXSBmN8W
         x74hi6hwnEgyWHj8n3dzEdLA5CZaeP5S2JACGb6JMAlp3uQ6MWPqiZkDPjkDp5HHygUU
         U6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029747; x=1795634547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JjQKOjoi0YbVdKDaXTUg0ORZjwXbMMCDyN0aPYFrKQk=;
        b=m0Bes/aaRKqPnrdh2hz4XWs1LMO+q6rB/jaHOWJcNe8DHz+XvuLA7LhL4O2pG3I9Xq
         D8tC/WH8VGvzO+HlqcN9RGYcpYGyWDHvsGH3PzwTX9duAtyWsLQcFXBO2blriY7FsfQh
         5GNrYV3PjWU/2k5F9AQwXB1wh8uz/mdSNJkCwVTlWKOrbjRgNwu4ufxJ5rWUnLigVXH4
         mmkUpUimJuhgouqT1T9OecYpOJLe1XFczN67EmJ/AKZLKUxyr+KnhBHTmaCzaFJ31WXs
         qOighscCAA1KHlhRkkWq8djyPmjqEi2O2Y1LKjWrE4wzd3ohvrYRtYsE19enr/F0PifF
         VmqQ==
X-Forwarded-Encrypted: i=1; AL+hErFF0GIdgKonFkjLs87dJ32kJ10My6bprd/haZ5nlR2l0VbkZPcW4cr5LTK7XV7HZx8/Yy5+gKLQzZvtrw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8EoKuTUjxRE9/ImrEV8cxHSFRZ1rkn2lUjGjKpQp3c8bGtO5zQ
	HKGjG/azPE+aWBOvZm8zzDcBDxIE/lassfbtd+7V367w3saOW6J45Wk=
X-Gm-Gg: AYBFou1G/CiViQag13zUVqBq9Xj0thibadwPzNGuXx/YK8Q4F0tJAHV5nWVd0e/Fk2s
	3dH1oHBWf65n+3YnSOhnFxPFPqLtlToKiEMSTXWFm4B7AaK3NxjttkJjRAWB3zdYDjPGhRiTuH7
	DGbDWnquN6lXqotjPJB2PQdaO4qeOjnBGM8Ke80rrCJJoe2bIiG9DtXevowolVbMr8OUbsXvVKX
	ZYIfDic4aqQnMUdHNRgjgbQ4PJEOklCKVSnS8WoSDRU1AAnJrLn/7A1YfWtugO+Vj/Xgq0yL/ck
	izzkFM9G0MXMAVynfVYtffApEZgAZUh8M1YNiNBghwBpq3Sroy64PN1pJUjf3gRmykxdoPwBz/y
	XQKR7tfuotiemYNAEsDyYftacQZMxBROVGBAewaxRPGGQpqvVuaHrXFJg9ydyTw4qh/RpVW3W76
	ej5CjVQSsC1CcfAHwc4RLCWTDI8A5JtCYMCG7seMjHDwEWhXA8wJE+nN8egZGdmfV8lj11eVXB6
	BCK2eUj/XooexhOKdNeAigmVDmyTNxIROhPEo+LApNaIw674xaxpBK7wHH8G03vBFB8/FBLHGBk
	F01ZqstDYuwF5RY68IsND2a9xKP32/H3NYVk8GIuxQQJBuAhzAHHh/U+
X-Received: by 2002:a05:6820:338c:20b0:6d8:bba5:6589 with SMTP id 006d021491bc7-71b184bf355mr1839817eaf.48.1795029747180;
        Wed, 18 Nov 2026 11:22:27 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b195c0bafsm2376912eaf.14.2026.11.18.11.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:22:26 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v5 6/8] media: tw9900: add S-Video input and progressive source detection
Date: Wed, 18 Nov 2026 13:21:22 -0600
Message-ID: <20261118192124.23330-7-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118192124.23330-1-matthew.laux@gmail.com>
References: <20261118192124.23330-1-matthew.laux@gmail.com>
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
 drivers/media/i2c/tw9900.c | 112 +++++++++++++++++++++++++++++++++++--
 include/media/i2c/tw9900.h |   4 ++
 2 files changed, 111 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 95e8e306469f..88dba608fa5a 100644
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
@@ -180,6 +195,39 @@ static int tw9900_read_reg(struct i2c_client *client, u8 reg)
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
@@ -197,12 +245,14 @@ static int tw9900_write_mode(struct tw9900 *tw9900)
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
@@ -218,7 +268,7 @@ static int tw9900_get_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
 
 	mutex_lock(&tw9900->mutex);
-	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
+	tw9900_fill_fmt(tw9900, mbus_fmt);
 	mutex_unlock(&tw9900->mutex);
 
 	return 0;
@@ -239,7 +289,7 @@ static int tw9900_set_fmt(struct v4l2_subdev *sd,
 		return -EBUSY;
 	}
 
-	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
+	tw9900_fill_fmt(tw9900, mbus_fmt);
 
 	mutex_unlock(&tw9900->mutex);
 
@@ -381,6 +431,40 @@ static int tw9900_subscribe_event(struct v4l2_subdev *sd,
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
@@ -536,6 +620,15 @@ static int tw9900_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
 	}
 
 	ret = tw9900_get_stream_std(tw9900, std);
+	if (ret)
+		goto out_unlock;
+
+	ret = tw9900_read_reg(tw9900->client, TW9900_REG_CHIP_STATUS_II);
+	if (ret < 0)
+		goto out_unlock;
+
+	tw9900->progressive = ret & TW9900_REG_CHIP_STATUS_II_NINTL;
+	ret = 0;
 
 out_unlock:
 	mutex_unlock(&tw9900->mutex);
@@ -580,7 +673,12 @@ static int tw9900_g_input_status(struct v4l2_subdev *sd, u32 *status)
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
@@ -591,6 +689,7 @@ static const struct v4l2_subdev_core_ops tw9900_core_ops = {
 };
 
 static const struct v4l2_subdev_video_ops tw9900_video_ops = {
+	.s_routing	= tw9900_s_routing,
 	.s_std		= tw9900_s_std,
 	.g_std		= tw9900_g_std,
 	.querystd	= tw9900_querystd,
@@ -682,6 +781,9 @@ static int tw9900_runtime_resume(struct device *dev)
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

