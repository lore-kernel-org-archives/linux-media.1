Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034602;
	b=blrWt4PO15EQRspP2dl7fIBjnsM+EJAPzIE+Osb/JkdY8LYGd5AtWgl/X3dSPN64OPrw
	 rqLac5g6qLeXJvV3qJEDvXBsreJ3cwyAHI7HXSaxntankw7F15Yw0vmx+qMnDeq0NiAjl
	 clOW+JoAKJY7ew6iWjb/3caaLgS0nUXXzRJcolSi0naMKR0UwXudY8o++SMI0LeD/+mO5
	 s6ae5C9+hFS8EFFbBIsl8SjGbvnje7LhJS5VkfzA2b2nxu/9PheDXe9wkATsWLkB9Gtu0
	 2nK7ZFZBoET9haQ4TCQIQuY8HCEX8R45geNrzOXkIDhRWDcYUxyKZ8RnZKZfTDQ2Pmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rwmZr5W4nZSsOTe0w97y5anuT6JfQ9DYmBD/J9o88lc=;
	b=TnGS5cTc1fBgqV+oa6xBG7WKIn+1vPPoxetrhZcBCzf17wZ/F3k8KpWDkSEPlGMnvrWS
	 66dktSl3hPXRu0yAhiARmSk22p2IbS2LWkQ+DGxBQ8pbgojcU+/+51SWOaRkWHdOslUR2
	 g73DyEYA+4iXoK9EWjx3JlnPFy85FqMHPEC5ONixgqwYWEqGlsr4VERdePsg7SNJtxKGn
	 LK1/1kzZqNrdqkWn/Ol6F3PtvTKaz+u/BBCrh46ElSpEmeap8izaFvOtOSuBJmAAou+A1
	 36Mlc/GAiHQUwWNRM9mxAvgE26uhHFIuPUbedtYYeovumh4cgtE1mHs2TXSt5UkSDcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ozxoReIn;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB8560A2637
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 20:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AB8560A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ozxoReIn
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-862b76e3c8cso653294a34.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 12:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034601; x=1795639401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwmZr5W4nZSsOTe0w97y5anuT6JfQ9DYmBD/J9o88lc=;
        b=ozxoReInFNh7gZNXFixXoh0udU0H+HijDPfm/dljsugv+C3xP6qIuG7DuaK36ENoCz
         cPR5mwYRYM2Xfn+HVTUdjSDXp7eRw+CEpSyuIB6YbL6vOqw1TL6Ydwr00n3tqwOCa0I/
         u9qfmPrTPMcAP0w5Sw6CGd6hp9QmCI4cQstUIRbnCernfK9zVvKEBOxSF5VesnFkKg6T
         +fFK1XEoyhtPsqZYLIFau2wJLSm2iumOBcTMpdMToGeGujuBfIiug/DFyvyYLZxePjlv
         gMkqtRFs505uCs562SP007hjudId3kZDMbgNzE3jIl56f5bcEXk+IlDL9u52DOCe4/GT
         0m8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034601; x=1795639401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwmZr5W4nZSsOTe0w97y5anuT6JfQ9DYmBD/J9o88lc=;
        b=dCBcooWHB+rrwzad+kmgoBKsS4YFZB/sQaJ73QGwk35WkgzNPIHM1H/aLdsftf9es4
         hCD0Pb8yJR7bRL90b8To41K/f8hoMYymtYR2NxYj/WRyv6/M9TUNtK69EVmmkZh/aAlx
         rN07FE6/8BuNLFdVAHGLMyCwSVd5IdidhYjqGV3DCfwIiXHOOvgTuMj1ra4ISAk7SIil
         V1F/VF/KQd6lv5EEO7oPTQRaSV0u+xDT0F2aDJXjZgONM3A0RRa5K4IgLA3OWm9uSgp3
         CXS+iPTnBZXC3/id6b3R2vnLR8UjcN/oyBcRRUVP32IHxvY9Mc1UaAFbfTwLVw/glLyC
         69nA==
X-Forwarded-Encrypted: i=1; AL+hErHHQkMgFtynbfevEJFKsWDHFTI2K/SI0QmeQaEw3udwsLDYdUh+x3mh2iogLehQDJ4it/n1TWHSoTPPNw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Yz3kGS/1BzCTemzi6s3qm0oMpZ43PMYWIsTm7R3VSW6rxQU7X
	bA+bpomatEQAqFU7PVGMuPLkKXMvAgQfsfzJ6cIHoblPPavjgZvMFC8=
X-Gm-Gg: AYBFou1sgrlt0OnJWMlgqqohtK9fsnMC8WdFh/dlTkJyu7MYnfLO2WV7N1k28AMvcGI
	2MLOWWFw3t1vTOlyoI3N4GswDrwxeWTN2DeG1TnShYWzJzCnDBnMdfrVGM71jBwg0GWd8dJ8QGP
	HfW/yuw7b6d3DqfQQ53Tf6mVMluwSIz9EnozwjcEXXmoRyffWvImnePuNX5wE0pu9o3i2VZJ/fM
	4+61gdrJcZU2GJiUySCC4oZCkFTakAFv63MdtcPyBJqjntH9cwKf7bJSAUYjWzeasngvdzrdpk/
	3UNoBmnyNLwOPu1RgJ8WKHl6ioLNBLnsT06SSChuphyojSGGWg5fKFPu4TkodwHUpEBrxKUcajX
	rNxYbE+FbD/xOl2MVKTJ1GXDLuNVKZ2oNW6bEw8qViBmxakqjbkUzWObhnKZHWW7kF674g1k4tI
	+L1KbMpf3m5kYwC4Ej9uwfAgwF9tA/kRw6y2PCfzpTmrRpJbPgxUfRk+vUldxbwsoH7EdR9+6Se
	c75cNg9NsYfWqvOOVhgslrBUatVt8ZfilfLrK9toVLH42toPmK1dXWwJQKQTxTAV2Fz3U5L0knU
	f+M0oAxbXOS9JewQj11kpU9uBzA4Y0Or+6x5ywftH0UjFe0G115P3FbR
X-Received: by 2002:a05:6830:2692:b0:862:f05c:2fd with SMTP id 46e09a7af769-862f084c214mr3796319a34.3.1795034601189;
        Wed, 18 Nov 2026 12:43:21 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01381f5sm2764792a34.3.2026.11.18.12.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:43:20 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v6 4/8] media: tw9900: use runtime PM autosuspend and power down on suspend
Date: Wed, 18 Nov 2026 14:43:01 -0600
Message-ID: <20261118204305.28268-5-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118204305.28268-1-matthew.laux@gmail.com>
References: <20261118204305.28268-1-matthew.laux@gmail.com>
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

