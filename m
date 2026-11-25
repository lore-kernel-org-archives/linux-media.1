Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636266;
	b=UW7VlL2btkP3/Bom2WfaB9yJrM0Rf+IjdKa/5rNzjMsGRC7QoxVfBIrgino1F7O9ChFr
	 h5V4lLPjDb+cRswh6B5Y68+D7edZwhBYQPsJucivXmFHvACgHcarYPcwVzg4sOSx8OPpK
	 RisrqAt8HZJHOjfwCMKyCeI92mJSMakeE+zqpLQ1NruyKcTk2xsWvyEb3dxiN7YCYTsf3
	 M3jstJmeR2RtWbYW+GT3CqwHAABxvB37gkkVkPCdFKWMDFkWefIdCPCviv2Or3+ahZJg0
	 IDbCxyFPl91C7tJ+n0WqcgdjiO+oFV5iXZ2RQ7ufPDaDGgaoeJn/SNN/2z0fToBkVHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7eqTUenxtATZH3mauJ4DkkeHABSU5674/8EXtC84wS8=;
	b=Mvxvvg0V6WpCfENqmL7u3gf/RWuy0KTk/MAdPlUC+cfoTyK/7CFvrp/GxKlL50lVGkub
	 I92LeGkxY5gIK6Zj+7V+KVoBpGI2AVJgtCYaRMlpHZe8ghT/5Xc4mdridKpQQkliQWRqE
	 ajLP77RKGh6MwqghmgmBcSK+WZXBF+T6AkW9IrFHI9FasGwR1RpaPaDPAaRCW6SMmgg/M
	 h/46ytgTw8te5CChaRQ82Y2e7QJ1HMkzyXDv5qSeankfIuVnHwkMDSyNxorg7l6HvnTiz
	 TVFZiEXA6mYgGmyvY7Iav7GpqwfSR23V38LMzD8NwiixlOfaK6g5sL7KfYk68537hfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VQz1E2xf;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42783606A337
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42783606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VQz1E2xf
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-57728d87699so2501769b6e.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636265; x=1796241065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eqTUenxtATZH3mauJ4DkkeHABSU5674/8EXtC84wS8=;
        b=VQz1E2xftr3x1fRtI8k/6Ydgmh9W3QdW7EMtM6tywkLbZVUrR+jsD0A/pvv+qIy37r
         5iiZ2CZUDqvpJsD4w2ljLRT38umS2V1EpZguz5wkxwOC8+Gbr1LutR+M3AeJ/9Pg6j0u
         OpsPqkH3YbQiWn0WkqWp2o0SHQATnz9UrVTegDLmgbEWQh+p7a0KpL6S65C6kPIRligy
         /yNNdZ5xOHGY6NmePCllPkXsDgq+vhaDRurnMUD7Y79+tD7KlrSxjnMhpzXiBINkeb/T
         q1Tm8EeWIKovKRPcipz71bK/gscDRHyukzJ+Lkn5fXf3uikhR8oMKUn2+E25zqCfjCJn
         vvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636265; x=1796241065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7eqTUenxtATZH3mauJ4DkkeHABSU5674/8EXtC84wS8=;
        b=ec4mjggLY908HazFVmo0qzjjHEzbthpOOjQ3R8KUEJzu+PYQ3hOEcrs6qmUNYB0+Oe
         mkCjko11BA31reTrGcDVl99D36dyyZUdSL2TpjyVvUsWMC9LKJk259euZh3b1/4rYVsq
         A6Jh85ohEy+zqNKllmeiq6JKTcHZnrDAZ5YpiQMyLx0wvaLEZC4DwCW6ZYC9wPII3rHc
         bKRWdZlrEmAdGRWNHR5pm034y2Y+2CfSw6VWHwJSVRxAXucDYPN3Jfh3f1ghRzgTaMP/
         8M/XeYGobILX5e0wW496/mBUTc8i3ppXd8unFWZA+0aE1QBMTJBQ1y7QKYmXi2VH/6aH
         ARoQ==
X-Forwarded-Encrypted: i=1; AL+hErF8VlBnsVMgAZ7Z6WgS0AKkr7SBzo0I1ThZyHt16SaD8c5ydejr6jprVyWwaeGxfpA89JDXw3qvQq6m5g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/RVdF9Am0c2V5DQnXxBoDeWrVGqlnm7cwW3GXtnizbz15M9Q0m
	7hEu3gDHE1D3Qa40JRB9llSv9mmWfLEjjzD1zVOr14pjjI28wGjrKtk=
X-Gm-Gg: AZFdTZfeh/Q532NtTHbcjYU/lQsPxw44evMGbnYpRJSYPQgslhpc4bAisDswGe/Byvs
	Tar3P0xjklmFmDkTii4TU9CJQ8IB0uWgqn6WHo3leooFENw/yFy2CRDKf/kBEEjETjQsveSjEED
	vHUpAFlKJpnsMjkmC8EgQVxYyWWsaD8gC39OdrUiFlOYx2J7acLeS0jHruD0k17pZcZZLIjRv+b
	xmSCpesjG+iQqqJhOHib2qAue/KoSpDJKjaTfJ05rL+2+/FbrtWUbzU8HmcbIFaqJ0t/VLDV/Ks
	uuq/wQJJFVE2uq3yfdHrBYIe5OwTyf/Y9yA0Bw9W6MHK16ALytBBD2EPGECz+3Z9JM+P+uvgSks
	nSMk77YKRH0CmuVUasJN8KkocDIlnF3AbKkBwoxMonYetnNjde0BDUCNFTTjRdUC0enNSHKScxV
	ZhXw6h18/QMUVYDFTzbl9q7qJOgASoKaJYvZCq2Dl2exUljk0y99lu9yDp0Ndy/MM2X+gAR0YC1
	t/v/32M2NPQ8B0G2oaMJMvcMui0ND7fCK4rmxwJT7A8wTg87ZwW+O6BwOba2NpP5CAbs5sgSCA8
	OXttRWg+JFO82KN0bGYB6cDR5RdWyhXfZgKDEEbygL9srAZKT530n+m5
X-Received: by 2002:a05:6808:50ab:b0:4f0:1f76:8ca0 with SMTP id 5614622812f47-57a0be9d917mr21371774b6e.56.1795636265224;
        Wed, 25 Nov 2026 11:51:05 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:51:04 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 09/12] media: tw9900: allow board-specific register tables via platform data
Date: Wed, 25 Nov 2026 13:49:48 -0600
Message-ID: <20261125194951.19072-10-matthew.laux@gmail.com>
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

Allow bridge drivers to supply initial configuration data for the tw9900.
Behavior for the original configuration supported by the driver is
unchanged. Fall back to the existing initialization data if none is
supplied by the bridge device.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 MAINTAINERS                |  1 +
 drivers/media/i2c/tw9900.c | 49 ++++++++++++++++++++++++++------------
 include/media/i2c/tw9900.h | 34 ++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 15 deletions(-)
 create mode 100644 include/media/i2c/tw9900.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c08aade46f61..102362c386fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27505,6 +27505,7 @@ M:	Mehdi Djait <mehdi.djait@bootlin.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/i2c/tw9900.c
+F:	include/media/i2c/tw9900.h
 
 TECHWELL TW9910 VIDEO DECODER
 L:	linux-media@vger.kernel.org
diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index b2c30e84acb8..f4f07f060083 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <media/i2c/tw9900.h>
 #include <media/media-entity.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
@@ -70,16 +71,11 @@
 #define TW9900_VIDEO_POLL_TRIES			20
 #define TW9900_AUTOSUSPEND_DELAY_MS		1000
 
-struct regval {
-	u8 addr;
-	u8 val;
-};
-
 struct tw9900_mode {
 	u32 width;
 	u32 height;
 	u32 std;
-	const struct regval *reg_list;
+	const struct tw9900_regval *reg_list;
 	int n_regs;
 };
 
@@ -97,11 +93,12 @@ struct tw9900 {
 
 	bool streaming;
 	const struct tw9900_mode *cur_mode;
+	const struct tw9900_platform_data *pdata;
 };
 
 #define to_tw9900(sd) container_of(sd, struct tw9900, subdev)
 
-static const struct regval tw9900_init_regs[] = {
+static const struct tw9900_regval tw9900_init_regs[] = {
 	{ TW9900_REG_MISC_CTL_II,	0xE6 },
 	{ TW9900_REG_MISSCNT,		0x24 },
 	{ TW9900_REG_OUT_FMT_CTL,	0xA7 },
@@ -116,7 +113,7 @@ static const struct regval tw9900_init_regs[] = {
 	{ TW9900_REG_OUT_CTRL_I,	0x98 },
 };
 
-static const struct regval tw9900_pal_regs[] = {
+static const struct tw9900_regval tw9900_pal_regs[] = {
 	{ TW9900_REG_OUT_FMT_CTL,	0xA7 },
 	{ TW9900_REG_VDELAY_LO,		0x19 },
 	{ TW9900_REG_VACTIVE_LO,	0xF0 },
@@ -126,7 +123,7 @@ static const struct regval tw9900_pal_regs[] = {
 	{ TW9900_REG_STD,		0x01 },
 };
 
-static const struct regval tw9900_ntsc_regs[] = {
+static const struct tw9900_regval tw9900_ntsc_regs[] = {
 	{ TW9900_REG_OUT_FMT_CTL,	0xA4 },
 	{ TW9900_REG_VDELAY_LO,		0x12 },
 	{ TW9900_REG_VACTIVE_LO,	0xF0 },
@@ -165,7 +162,7 @@ static int tw9900_write_reg(struct i2c_client *client, u8 reg, u8 val)
 }
 
 static int tw9900_write_array(struct i2c_client *client,
-			      const struct regval *regs, int n_regs)
+			      const struct tw9900_regval *regs, int n_regs)
 {
 	int i, ret = 0;
 
@@ -189,6 +186,23 @@ static int tw9900_read_reg(struct i2c_client *client, u8 reg)
 	return ret;
 }
 
+static int tw9900_write_mode(struct tw9900 *tw9900)
+{
+	const struct tw9900_platform_data *pdata = tw9900->pdata;
+	const struct tw9900_mode *mode = tw9900->cur_mode;
+
+	if (!pdata)
+		return tw9900_write_array(tw9900->client, mode->reg_list,
+					  mode->n_regs);
+
+	if (mode->std & V4L2_STD_NTSC)
+		return tw9900_write_array(tw9900->client, pdata->ntsc_regs,
+					  pdata->n_ntsc_regs);
+
+	return tw9900_write_array(tw9900->client, pdata->pal_regs,
+				  pdata->n_pal_regs);
+}
+
 static void tw9900_fill_fmt(const struct tw9900_mode *mode,
 			    struct v4l2_mbus_framefmt *fmt)
 {
@@ -322,9 +336,7 @@ static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
 		if (ret)
 			goto err_unlock;
 
-		ret = tw9900_write_array(tw9900->client,
-					 tw9900->cur_mode->reg_list,
-					 tw9900->cur_mode->n_regs);
+		ret = tw9900_write_mode(tw9900);
 		if (ret)
 			goto err_unlock;
 
@@ -668,8 +680,14 @@ static int tw9900_runtime_resume(struct device *dev)
 
 	usleep_range(1000, 2000);
 
-	ret = tw9900_write_array(tw9900->client, tw9900_init_regs,
-				 ARRAY_SIZE(tw9900_init_regs));
+	if (tw9900->pdata)
+		ret = tw9900_write_array(tw9900->client,
+					 tw9900->pdata->init_regs,
+					 tw9900->pdata->n_init_regs);
+	else
+		ret = tw9900_write_array(tw9900->client, tw9900_init_regs,
+					 ARRAY_SIZE(tw9900_init_regs));
+
 	if (ret) {
 		if (tw9900->reset_gpio)
 			gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
@@ -733,6 +751,7 @@ static int tw9900_probe(struct i2c_client *client)
 
 	tw9900->client = client;
 	tw9900->cur_mode = &supported_modes[0];
+	tw9900->pdata = dev_get_platdata(dev);
 
 	tw9900->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						     GPIOD_OUT_LOW);
diff --git a/include/media/i2c/tw9900.h b/include/media/i2c/tw9900.h
new file mode 100644
index 000000000000..11e3bfe38e2b
--- /dev/null
+++ b/include/media/i2c/tw9900.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Techwell TW9900 multi-standard video decoder
+ */
+
+#ifndef _MEDIA_I2C_TW9900_H_
+#define _MEDIA_I2C_TW9900_H_
+
+#include <linux/types.h>
+
+struct tw9900_regval {
+	u8 addr;
+	u8 val;
+};
+
+/**
+ * struct tw9900_platform_data - board-specific register setup
+ * @init_regs: written each time the decoder is powered up
+ * @n_init_regs: number of entries in @init_regs
+ * @ntsc_regs: written when streaming starts with a 525-line standard
+ * @n_ntsc_regs: number of entries in @ntsc_regs
+ * @pal_regs: written when streaming starts with a 625-line standard
+ * @n_pal_regs: number of entries in @pal_regs
+ */
+struct tw9900_platform_data {
+	const struct tw9900_regval *init_regs;
+	unsigned int n_init_regs;
+	const struct tw9900_regval *ntsc_regs;
+	unsigned int n_ntsc_regs;
+	const struct tw9900_regval *pal_regs;
+	unsigned int n_pal_regs;
+};
+
+#endif
-- 
2.47.3

