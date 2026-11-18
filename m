Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029745;
	b=uBw/oaGfrGHGcFB38DLFr8ovu2uU3iurTRx+8r17c3ONkHA0ivpH2v+a2HQ2zi6psFCB
	 4ka8k/HDWxUSM7O6XXl2qz7MIST9ruUOoySVmqIf2adGtp+reSBsh12QpPgY5zzfPbYlO
	 yjU/YP3/6EHgObnGi4H8s/tzKFg6+rHwa7FxmS/0F1zcm6gch4sJHIoS/JzCdLVd0s4Jl
	 9IAY2fNDk9EgeuO2AHToD0NMAxwGdpp2jn9vBXfDiPZkkBvNyJsFZ8u2cGHKorIM9mVgX
	 45MqNeToSyruAowaLCnMypRwD7uBLkJmxO5/rsfa0eCnIW1xEJRsaHgpiJsAvGe0uZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n0YXGGo330R1yn4K8suGNVhNQKravXREW1JGSVmLJ9o=;
	b=TyzNAHTaJaQA4HFRmaZ1A/Pf5iAhNhLbkO96Y628/Hx9QBiGUeRcCbYtjwFUvXcq3bF5
	 X9qNigLgTYLRrTYel6JJjlOVv7v7QEm+N/cHho4Nmslecs73F7Pi4SXO3nTwN+xVhfSTw
	 M01o+5i+R+BgdmgteC18SI5bnE75mVDWboYAMT35rOfeGlnwr2GuCnr7BXixl/jPm/PJO
	 tx8dMqaW98UfNPm4Vzy6GxITiw/0RqDmGYvB/vCu0XOgBBQihNcJ1ugQfVezbaLFwgGmO
	 Wa3ell28v1XFOGiZNwiNvZ5JBplfbcwuAQCSsD3P/hR9tMPSHsJTESV+JKOKQz70Exw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHAlfH3r;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B4D606A337
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 19:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16B4D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHAlfH3r
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-706113e92f9so844822eaf.2
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 11:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029744; x=1795634544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0YXGGo330R1yn4K8suGNVhNQKravXREW1JGSVmLJ9o=;
        b=jHAlfH3rXRENDJxsESVtTFc9i4LWeBULHIckHA1CdiobxlovAz/qR8Ypv1serhbH+N
         5uy3OlhyEzGAVhwAcwJwwqCKepkH1Qkx50lkiErSfjOdjj1B/9uRf9ES0Ep/ov6nGi5w
         hMEXUtdZDta/fuf+/afwGaq0cYeDmsuOQe0FdECSqDDrxVog3RlJSzn/4VdvBhDdkyzK
         TsMGNUDuMFf3uJWkPYFB0myXmT8/ZNoBfH84CLEFKquTx9IyRKOdnn7EsjD7ZFJae1yQ
         jBSgJl1hxV/4A330QnBWwSbsR7EHqlLAvpLKe3ki0YJiwAb4eNkDauwouBq4WRa3qsPu
         051A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029744; x=1795634544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0YXGGo330R1yn4K8suGNVhNQKravXREW1JGSVmLJ9o=;
        b=hElgFSBp3AK9kUVS74eTekvxGAN4ThA7hEnti3I5JmGC/9ZnQ3rp08tiSD6khK0URd
         3IVmMk0Cri6Idw0At5IPeiQfi5Y5bRDLfAZ0nDbpojNGNMvNaWzlAtQhahT5wktVLUPu
         pEtagYejFU0T/LARubW7GZvVa1mHQnzmIm4Gvz/+KXLwQQAogAofz4HncaP75FE8T6rK
         X+hqNM32VDBMjcXztTewwWgCmywQM4cdj3feVLQTW6JLTiVeFwaiSfHM4O93UDrX+wxS
         BgSnVGZH+QkKqvqbhiIGt2JtZh7eH7S/eQy7qIpBADkx9Bu5FAJmafe4Ol6/sREbkNp/
         WG0A==
X-Forwarded-Encrypted: i=1; AL+hErHF8Htcq146rlHJ2uT7UGMD08kcUuQUyCcRmWEO9dL/5NVySVCR1kIcvurJscs9JE5JaaS2sOmnL3KULw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8vDvUecIwgU+7ANPn7zz2CqQGBdmC/+yKKuJEMZuxuJzz9MWOp
	opL2PyujJV0Z6vAi0qehrGHMhKtjP4JKLZdrJDOjNyDQtRMFiVz/APE=
X-Gm-Gg: AYBFou31NOpoDZ1jD06BL8IjyOTt7lsi2OcXOEjRoHLOBUetbn//eYQ16YmfATdAplA
	hIk0l7sk4pPuAjjYNyhSWuHtYsqiHdaeyeLv9Bv35lLj5ZoHtUQ0ADeBfntyFJYqlzM+8hwtDQu
	Xz4N+gR3LM3nXfKa9WDCYOQes6Jf5/m+ERsH/x0iWVO1wezuB5JP//NG3zlEpuWPc6DkWrVcGLM
	KJ0eAUOE6qlDFwGMQUyFPnqx+0gtMSjtSXhppSHmDz1mPRJJeB17eV3tHR1/DTJuMT3ziNWRvn+
	F5JchKIeu0MHTUbHxriWcfh8fesqR6tCMJozlc9e6X0991FyhH7njMVLpKZlUWg/BA0eLu1B9v4
	asEb7kxjfVqkm25wgsI37SDUyZESoaCUBopSSlAJmvBQw2+KuRciHj3UsG4zmVoOVe8h3iPyENW
	BpNHKV3YKvfLs1bqZj5N/l1+8giEn6fqxzvmj3y6VWOuuYnrVdz1u7psKltM9L0mMLTLCPA3zSm
	i8FtYtaN48dKB61uJhzCMzQIs/hQa3ZUDlspI8li10jc/XT+5rHfzvWZAnu/W4dRh0l+p7bYoZ7
	nBh5Kzu4lxKBKfCEcU0M7MP1OkYPbZdLQ6Im/FuDzarB8+lZJHW/617Im4jDF9ljNGvrJJ24t1M
	zAjI=
X-Received: by 2002:a05:6820:c5c5:20b0:71a:d99b:e86c with SMTP id 006d021491bc7-71b1843fef8mr1875974eaf.21.1795029743752;
        Wed, 18 Nov 2026 11:22:23 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b195c0bafsm2376912eaf.14.2026.11.18.11.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:22:23 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v5 5/8] media: tw9900: allow board-specific register tables via platform data
Date: Wed, 18 Nov 2026 13:21:21 -0600
Message-ID: <20261118192124.23330-6-matthew.laux@gmail.com>
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
index 4d0d437d02f3..95e8e306469f 100644
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
@@ -116,11 +113,11 @@ static const struct regval tw9900_init_regs[] = {
 	{ TW9900_REG_OUT_CTRL_I,	0x98 },
 };
 
-static const struct regval tw9900_pal_regs[] = {
+static const struct tw9900_regval tw9900_pal_regs[] = {
 	{ TW9900_REG_STD,		0x01 },
 };
 
-static const struct regval tw9900_ntsc_regs[] = {
+static const struct tw9900_regval tw9900_ntsc_regs[] = {
 	{ TW9900_REG_OUT_FMT_CTL,	0xA4 },
 	{ TW9900_REG_VDELAY_LO,		0x12 },
 	{ TW9900_REG_VACTIVE_LO,	0xF0 },
@@ -159,7 +156,7 @@ static int tw9900_write_reg(struct i2c_client *client, u8 reg, u8 val)
 }
 
 static int tw9900_write_array(struct i2c_client *client,
-			      const struct regval *regs, int n_regs)
+			      const struct tw9900_regval *regs, int n_regs)
 {
 	int i, ret = 0;
 
@@ -183,6 +180,23 @@ static int tw9900_read_reg(struct i2c_client *client, u8 reg)
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
@@ -316,9 +330,7 @@ static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
 		if (ret)
 			goto err_unlock;
 
-		ret = tw9900_write_array(tw9900->client,
-					 tw9900->cur_mode->reg_list,
-					 tw9900->cur_mode->n_regs);
+		ret = tw9900_write_mode(tw9900);
 		if (ret)
 			goto err_unlock;
 
@@ -662,8 +674,14 @@ static int tw9900_runtime_resume(struct device *dev)
 
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
@@ -727,6 +745,7 @@ static int tw9900_probe(struct i2c_client *client)
 
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

