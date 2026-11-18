Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034600;
	b=eKF4rOZ6/uMoMyctHGpWGtU+wFM122V/oJFwBAC9sMRzBkSLiI2OURuZE+z/HN3avWbc
	 oOFGfTKOIvwf8FDTi/qiW201PZEikjK6FmxrDOXcBHcU2TboIHzOeakE4hjC8oK0G73Sv
	 iGatVnyRIveu7b2pqjT3yHQPTVRIqmEiRE4CDToQ91NzgYeOkFgxKb/CZBLIa/SEkez7S
	 1flxx+pOgl/ixjAJcIXcHoxrveFrE+B1sSJrjVrxbodmw6JUn78cmx40jJOzd/RyqOm8L
	 I+X7hX7S4UuhvxEc+EfixR6NWoA9bHg6f2BD1Eo4Gip+XHNQIJxngovwJMc8Q51W3Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=14SBEOmGTjg8LS7k3t1iUMs1kWnigFsCdcytzLwbka8=;
	b=fAcJlti9azNB+XYg/FPvwDOSW3U6xl2ltLK6/QFJ/xYG2YAyu3inXElWYhQrlkw+gj39
	 4aMwlQOoAtfFrFTu624/SvmtMWBZY/gKKTlt5Mut4Tq72rlsPh9ePvEHjtyIQNZ/6XkIu
	 K0EkjW0yVCvB/xdQ6GgmrS5tAir+HcYoV85tqJ0RdPZLmLa2rdtIirr07l09KVnpJkWJH
	 IhwbVdfBdOB8/ZhfY7P9hREOavQIGIMtKtUzubIgncdvJJp7O5SFUbR1BCU1NE2VukPEl
	 ldPbDU4r/3AhpQUF9iU8ON0tLlefTDDF8/7wU0bgKPOEZFu7NmYVfi9qYlwkR6D55nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gGYjOrtU;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC34606A33E
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 20:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFC34606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gGYjOrtU
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-843cf077f10so1886626a34.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 12:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034599; x=1795639399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14SBEOmGTjg8LS7k3t1iUMs1kWnigFsCdcytzLwbka8=;
        b=gGYjOrtUC42JDCtKYouI+yWFTzU65mRkfpDFqaCp3GL0+bAavQKebnigPaoJPHkL8q
         Vq0HFOS+Dw2TYrQuXyPPWN+qoP+VCqWJqiUZhf5iqFqDI0vHok7G7Bdh6LP/N6PlKe73
         T84lZlmiL5YIoH0IHxgnbpiUOGSufqakHmsDVJGNWCA4K4Oig6j1+DkrJ1tkPGGe5ULi
         B5rqA/PNRva4rO8bamKmNR1Cs0/AQ2Eck6syeB1V1meQF1Q9oTCVR6QueReiCIudlEEp
         dZii16aV7J9fsScdWz3hziS3qnEYoyq+w/t6CK98G15DD8oshhB+/C8B/XZNQ+yTXp9k
         Xi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034599; x=1795639399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=14SBEOmGTjg8LS7k3t1iUMs1kWnigFsCdcytzLwbka8=;
        b=cvc2uXfjyIVw5eDZTLopaiWJ9QnNtDIirL59esm8ITHAid793jwEAsMrsTk47qmlCS
         W0KREZXCq4+O/rwRuR1x0g+IyOqdVzDf4P6CJxdJURJFVKFWkKZlkwBRVlz7XpeJcFF5
         BQ8747fgFGBBOPImHtWTesgswhZC+Om/3mXaxPLmeEMLf8cEPehVD0lYJvW2Awz32uxz
         iTuJXuVbvN/tIg5m7jptDJGzOANyjS8nalfstvyjqYW8O2ybp6ZpyKAnKhpw4nrcZTI1
         OWnT183Gvua3mhfYThmzBC+fiorHKGQ8xIcmG++uvIjbcOUDqvBDrFOoe+uVo39MVnpO
         yvXg==
X-Forwarded-Encrypted: i=1; AL+hErEiNtqUsHB/eHX75VKVtHvptrYjFGTpZHdmR1tHyRzU+pSOPcL5IJtXLvT/nx1t/zt52jea22072UoDPg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9hTFoJCPwHHI3X1Q5+4MOHdo87RUh+bH4H1ptdfM8QnFbkJuVw
	//f3hPChDyvoheDX9ubMF8mUwqLFt50jXdi4s8M18a29Cc5IwI6M3kfXe58B4bw61Q==
X-Gm-Gg: AYBFou3PguxTrsUg8W79oeimh2dAH0krE6yvj1MQVA+eVPaODH8gQxD8JfXNj5jOeBq
	wHAmwX8lR6KOOKIsz7d3G9VBJjxcKn/U65Uxn1D7EP5yKeXgtC+bGzd+KuZOqNl5XSFONRgXKIj
	v7EwiWOxf4+aqPRb5TGqV/3h+Ef9I4PdLHV4ykUZzbTKKDlp4cnlP0kyLKRCoET7CN0aUeIOQql
	fdH39W9uPM3OWqpr93AI8lEgWfHqo+Lz1vC6m7GzQQ+0Uhhj5vMZKwcmBcpTkEOST5SWJbF/dqy
	BImv6h1WpseOlD3chXrtZSBo/wxK/7oTDTWYSV19pRjQvepil66E31++2TiaSBSADgD3lpAVD6B
	uyS0MkCClhUZ3/BJARpcbkIPwvXbcPax2/7YXipDeNS0nlBbl+xvxAeTz6F834Tq+Euzv6IGxUt
	P5BEOktDPOGuiNrPFeOQTqy8xUg9oTJvrKM0+K/iI5EuyWPuWy0el2cx39hGXiqF7PazQDPGLVO
	5/CdgFf4M8RfSaYWsqyuROi4WejYoF6kcmZ4wfBBSTRVDUZNo5VmOhddn57fhf1N6jhPGWDgk5a
	uAyIaZCAQqrCt3gzeZPsbngOLFJ9x9ZDDi79NOZoWVBNG/hvlzEkeyBmIQ==
X-Received: by 2002:a05:6830:903:b0:862:a0ce:f557 with SMTP id 46e09a7af769-862f082f273mr5386807a34.4.1795034598889;
        Wed, 18 Nov 2026 12:43:18 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01381f5sm2764792a34.3.2026.11.18.12.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:43:18 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v6 2/8] media: tw9900: accept the TW9910 chip ID
Date: Wed, 18 Nov 2026 14:42:59 -0600
Message-ID: <20261118204305.28268-3-matthew.laux@gmail.com>
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

Allow tw9900.c to accept the tw9910's chip ID and revision fields as
well as the tw9900's. The tw9910 is a superset of the tw9900 for the
functionality used by the tw9900 driver, and USB3HDCAP/XCAPTURE-1
capture devices can have either chip.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index e07924faa84b..60d5686716f7 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -23,6 +23,8 @@
 #include <media/v4l2-subdev.h>
 
 #define TW9900_REG_CHIP_ID			0x00
+#define TW9900_REG_CHIP_ID_ID_MASK		GENMASK(7, 3)
+#define TW9900_REG_CHIP_ID_REV_MASK		GENMASK(2, 0)
 #define TW9900_REG_CHIP_STATUS			0x01
 #define TW9900_REG_CHIP_STATUS_VDLOSS		BIT(7)
 #define TW9900_REG_CHIP_STATUS_HLOCK		BIT(6)
@@ -51,6 +53,7 @@
 #define TW9900_REG_VVBI				0x55
 
 #define TW9900_CHIP_ID				0x00
+#define TW9910_CHIP_ID				0x0B
 #define TW9900_STD_NTSC_M			0
 #define TW9900_STD_PAL_BDGHI			1
 #define TW9900_STD_AUTO				7
@@ -574,6 +577,7 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 			   struct i2c_client *client)
 {
 	struct device *dev = &tw9900->client->dev;
+	u8 id, rev;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(&tw9900->client->dev);
@@ -581,7 +585,7 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 		return ret;
 
 	mutex_lock(&tw9900->mutex);
-	ret = tw9900_read_reg(client, TW9900_CHIP_ID);
+	ret = tw9900_read_reg(client, TW9900_REG_CHIP_ID);
 	mutex_unlock(&tw9900->mutex);
 
 	pm_runtime_put(&tw9900->client->dev);
@@ -589,11 +593,17 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 	if (ret < 0)
 		return ret;
 
-	if (ret != TW9900_CHIP_ID) {
-		dev_err(dev, "Unexpected decoder id %#x\n", ret);
+	id = FIELD_GET(TW9900_REG_CHIP_ID_ID_MASK, ret);
+	rev = FIELD_GET(TW9900_REG_CHIP_ID_REV_MASK, ret);
+
+	if (id != TW9900_CHIP_ID && id != TW9910_CHIP_ID) {
+		dev_err(dev, "Unexpected decoder id %#x (rev %u)\n", id, rev);
 		return -ENODEV;
 	}
 
+	dev_dbg(dev, "Found %s revision %u\n",
+		id == TW9910_CHIP_ID ? "TW9910" : "TW9900", rev);
+
 	return 0;
 }
 
-- 
2.47.3

