Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029741;
	b=MHXeCWd/owvTtr84w6sngssilao6wgsGCZIIB8QgX/Zk4piQTkNfO7R7e/tZoh7OP15L
	 q7Z8lp+6q4XbVezWLAeeAeKuKZuG2ChBYtqh2Oi3dFvV0skdv8A+Zv6iP+iT1UyBQ4xDi
	 IHpS5IBxRtuI5/v9SByKLmsRsZ2mZ5d8Ug2keVIDh5GLk5FxPIarJAKeED9LLhHzJEu34
	 965VvZ7BWYpnVVwuKAFCitSQ/lcGKSmCVFo4wz8kWyN/By02BzXh80h9/N8/uU4EjASXm
	 lNdDqfcz8H9u4M8dilYBygzGy0urqym8HTVLvuhet/9dtjYt4v6wKhe8X5gsLiYzUlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rwmZr5W4nZSsOTe0w97y5anuT6JfQ9DYmBD/J9o88lc=;
	b=5fUm+D9Dj9xW1vjL/w9RWrb7t1IBzIWIOzE/rcibsEWH/sQaMYmLBDECvefZ0t2Lhoex
	 5CPZFXu4mayrxsgDIGZ9v/4ztZ+IGBOd7ryL38TfWf3eg1KE3Ut/ZaZyB0IQyBt9QYMBH
	 FBjMU1pLA+Am/sOvSR69Kx4pF4KG8vVvm6k4JxJQ9+Q3mdB8x2pvkU4TuD0PVUSqP2pBI
	 WeqizMK5Rl+UMFpYkGbN5BDvR/gNKBKmnGnLlm5mVfPZWoz77apaPcq0KQUwRHHQf5qWq
	 n0dZ0k49gL7a8uZniMz8ktoZ6lus9komTlEG6uBECmuUgb0K/jGUyZ4fCTIFxVstCWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wYv/LqR6";
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BEA606A338
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 19:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34BEA606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wYv/LqR6
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6ddef424972so1193366eaf.3
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 11:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029740; x=1795634540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwmZr5W4nZSsOTe0w97y5anuT6JfQ9DYmBD/J9o88lc=;
        b=wYv/LqR6fz5vDhRycfRmAGof5bnUVT/8UNQAmqn7BpUB2CevoqAzvjkBExCdBd0J4e
         Sy/z89Jc1pVlV4R5SZkXVkGETWa058tIoBEulILKyljZWy0UfGlyepO3vMHU9cIQn9Gh
         lWxl51NUebzCQaE4fXTzHuw2LoC4u5P11vx6uoWePbKzhZ1vPyWVlEeqQ6/y57kzUTOa
         sIrIGkGyb6i1K0KuNfBfWvK+I9UActNt0DAlnn6ilPVceCgaZs3L/v2ai3GWPHusRJzO
         3hGDDZBkkmZyTQ/kjGxKDSTtwoMPCJOlDN11KqijfVANVw8P6wzP3S3WaPhaOZ4cTV8D
         lRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029740; x=1795634540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwmZr5W4nZSsOTe0w97y5anuT6JfQ9DYmBD/J9o88lc=;
        b=FstIgbGfMwBK8+y0Zfkptdcy8/aSS2ggtQRQwK4RDc0NpVzc970uLg4vvnbLtyT6lZ
         XDSvPgnjcn8Tqk8D+anaallN9lGJetpWIG2D29Ia6TMVM6VmHLGF5/Er/Hv/7g/MfuAt
         1Z0o3EFSocemcqKmtpCJUfBWtX2Bq68HYJKY5u76M58eIT0rPOjMqsKjsEm0YizwP1iT
         IWb5HfBxR5fTa2Rw69mxObPIg9Mn0w/oVxnnJdXSgc1zt3xoMU/hAyWvEl+Vkus6GiCZ
         UhrhjqgPjNsMFdKllwBnbtD8rXgV3qzOFrMVb5dZUAkP2SL6YiEVcpee+dX5oOQ+8Tyz
         PJdw==
X-Forwarded-Encrypted: i=1; AL+hErEOV0f+km1epbAZZ5LV5eEx2Qj1Gsfuqws3wInC+FJzu3eSUzlrY/sbiGeTDj26xuKq0tdJFqFxdbMSeg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/urYM46CXa+XIsmafxkIdcReQHMVZtHE7lwSPa8GLMQkTIV90F
	s38YgQaCqhjec1grUgjHMdefJNmFu9tM6tQz2xxrCBTTmZuTsp9kEY4=
X-Gm-Gg: AYBFou1+fl5Bm3DoMTBq0WeteOi+Td4vDn/ZVi2vM0BlBQX+/ehodcZ/5/RWeSwN600
	/pr2Lri2E3TyP2Miqvb650IxLZ6oUv9LSecU+CJA1T6fJbSYYOqLW1VgYPIVQ+aIXoV+XDjhRVa
	YUAt9RXPu3SO0rUnh6rakpPxXx9IgnYuPibXLHmhsqA4SbJiDNvvJ1ACF5+t6YEKeif6RcG4ast
	Z2bfpjPeFI6sb9tqnp6UFd8pMhQxFTq4ld2e//zqQmoJ/0JAwBwE0D89ohjcKfVcfWHZclHF8I/
	fWJd8CRQtsiNtM3SUJ4eadZTUgBskuRqi0XHATPdcswZ8SaEtcfq5FSaS9098olPrfFZ+jeSDju
	rLt4eQikFskofHLwSv2ZupN6YtPJ7pFVStbZW1RUQ2cGxQyLT+t/beyUtsrB0y0Xkohzw+8fTzd
	4Wf/duSeiInAbIBOWsqakm7Nlcks2qEcCiHBWSZnYJbe2kLuTxFYZ2lBqkOk71VVuICAIyp7Y91
	hrDYFxLyPAUuyF+Ns3afSucKi259rZNSoNnpJILlfpyZNhX7Se7uInCOx0OZN2cunnpiXNIk/8z
	kqO7k+8QjvD9dT2Nkx5QNjzQGy9W/5FXyTSIdr9WO6ulna3aqdtT6w74
X-Received: by 2002:a05:6820:83cb:10b0:712:c3fb:b4e2 with SMTP id 006d021491bc7-71b187c0ee5mr1992374eaf.66.1795029740105;
        Wed, 18 Nov 2026 11:22:20 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b195c0bafsm2376912eaf.14.2026.11.18.11.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:22:19 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v5 4/8] media: tw9900: use runtime PM autosuspend and power down on suspend
Date: Wed, 18 Nov 2026 13:21:20 -0600
Message-ID: <20261118192124.23330-5-matthew.laux@gmail.com>
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

Add support for autosuspend to the tw9900 driver. This is so that initial
bursts of register writes for configuration don't suspend after every
write and cause the init to take a long time.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index d365432e8f89..4d0d437d02f3 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -34,6 +34,9 @@
 #define TW9900_REG_CKHY_HSDLY			0x04
 #define TW9900_REG_OUT_CTRL_I			0x05
 #define TW9900_REG_ANALOG_CTL			0x06
+#define TW9900_REG_ANALOG_CTL_CLK_PDN		BIT(3)
+#define TW9900_REG_ANALOG_CTL_Y_PDN		BIT(2)
+#define TW9900_REG_ANALOG_CTL_C_PDN		BIT(1)
 #define TW9900_REG_CROP_HI			0x07
 #define TW9900_REG_VDELAY_LO			0x08
 #define TW9900_REG_VACTIVE_LO			0x09
@@ -48,6 +51,7 @@
 #define TW9900_REG_HUE				0x15
 #define TW9900_REG_VBI_CNTL			0x19
 #define TW9900_REG_ANAL_CTL_II			0x1A
+#define TW9900_REG_ANAL_CTL_II_PLL_PDN		BIT(6)
 #define TW9900_REG_OUT_CTRL_II			0x1B
 #define TW9900_REG_STD				0x1C
 #define TW9900_REG_STD_AUTO_PROGRESS		BIT(7)
@@ -64,6 +68,7 @@
 #define TW9900_STD_AUTO				7
 
 #define TW9900_VIDEO_POLL_TRIES			20
+#define TW9900_AUTOSUSPEND_DELAY_MS		1000
 
 struct regval {
 	u8 addr;
@@ -338,14 +343,14 @@ static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
 
 		mutex_unlock(&tw9900->mutex);
 
-		pm_runtime_put(&client->dev);
+		pm_runtime_put_autosuspend(&client->dev);
 	}
 
 	return 0;
 
 err_unlock:
 	mutex_unlock(&tw9900->mutex);
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -522,7 +527,7 @@ static int tw9900_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
 
 out_unlock:
 	mutex_unlock(&tw9900->mutex);
-	pm_runtime_put(&tw9900->client->dev);
+	pm_runtime_put_autosuspend(&tw9900->client->dev);
 
 	return ret;
 }
@@ -558,7 +563,7 @@ static int tw9900_g_input_status(struct v4l2_subdev *sd, u32 *status)
 	ret = tw9900_read_reg(tw9900->client, TW9900_REG_CHIP_STATUS);
 	mutex_unlock(&tw9900->mutex);
 
-	pm_runtime_put(&tw9900->client->dev);
+	pm_runtime_put_autosuspend(&tw9900->client->dev);
 
 	if (ret < 0)
 		return ret;
@@ -613,7 +618,7 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 	ret = tw9900_read_reg(client, TW9900_REG_CHIP_ID);
 	mutex_unlock(&tw9900->mutex);
 
-	pm_runtime_put(&tw9900->client->dev);
+	pm_runtime_put_autosuspend(&tw9900->client->dev);
 
 	if (ret < 0)
 		return ret;
@@ -683,6 +688,13 @@ static int tw9900_runtime_suspend(struct device *dev)
 
 	mutex_lock(&tw9900->mutex);
 
+	tw9900_write_reg(tw9900->client, TW9900_REG_ANALOG_CTL,
+			 TW9900_REG_ANALOG_CTL_CLK_PDN |
+			 TW9900_REG_ANALOG_CTL_Y_PDN |
+			 TW9900_REG_ANALOG_CTL_C_PDN);
+	tw9900_write_reg(tw9900->client, TW9900_REG_ANAL_CTL_II,
+			 TW9900_REG_ANAL_CTL_II_PLL_PDN);
+
 	if (tw9900->reset_gpio)
 		gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
 
@@ -693,6 +705,15 @@ static int tw9900_runtime_suspend(struct device *dev)
 	return 0;
 }
 
+static void tw9900_pm_cleanup(struct device *dev)
+{
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		tw9900_runtime_suspend(dev);
+	pm_runtime_set_suspended(dev);
+}
+
 static int tw9900_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -757,6 +778,8 @@ static int tw9900_probe(struct i2c_client *client)
 		goto err_free_handler;
 
 	pm_runtime_set_suspended(dev);
+	pm_runtime_set_autosuspend_delay(dev, TW9900_AUTOSUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	ret = tw9900_check_id(tw9900, client);
@@ -772,7 +795,7 @@ static int tw9900_probe(struct i2c_client *client)
 	return 0;
 
 err_disable_pm:
-	pm_runtime_disable(dev);
+	tw9900_pm_cleanup(dev);
 	media_entity_cleanup(&tw9900->subdev.entity);
 err_free_handler:
 	v4l2_ctrl_handler_free(hdl);
@@ -791,7 +814,7 @@ static void tw9900_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
-	pm_runtime_disable(&client->dev);
+	tw9900_pm_cleanup(&client->dev);
 
 	mutex_destroy(&tw9900->mutex);
 }
-- 
2.47.3

