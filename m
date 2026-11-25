Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636253;
	b=ENL15yL1iiEl/J+3B1e6EN/521kYrl+/NsXNlFoXISIq2R3eZNnUrpHGsUajWQCYU+yI
	 1WPz326yFuIIIt0F7Sbxe6oJqAECtc9KIxNTDN/O1mKrYAXSUqMOxqGJdMl8BurDHwJ3o
	 OFHUMUIW+lyWYe4TO0QjtPSGuR6A8Bq0pHQMS9tRF35QBiGeV/a6/rtFqQmHbZwJHMoma
	 0l8isw0w2Iljz5LhAaVc9ViyaqlVRm/WxaybT/C0lZdfozCTyMUpZi1N7xNiDaK07dC8Z
	 +zPYzdYFx1w2PApugIJf6iSkjsVlI6c7rZqV1ZkL7l8JZ/pZo8twUZIyVEv9bB/Ap3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tltDCiy5cuzdulawCOgmvyY3l0pK0A9bj1d/Pm/aQJI=;
	b=0S02SnssQXbfUs+JZXVjbZwHnc1fx447Bkt0gy5TBgcZpP/aEynHYXKIFNGJARseARzD
	 KN4jX8eyp+oRKBAawVJDDX/FlFoovJxo6JKUj1+MABuyh+SeipdXbAWJSBX1WIjap4b6+
	 xdaBKUicuomWfA4C22z7wWXsfbsCWI0S9gQ3fs5thNx/T4EKbR8jFf9PO/iGRGXG5uC0G
	 OOO9t1bS3vBFrGieBqB+8v282kqkSjktdQ5eJ3bDtaUIS0qpRUA/f3vh3zgxifWeV6E06
	 YANdU1uClmeg+184IrLUQ4vpHMRuMVpxCm59nCcwMLyD3pBzS6Tr6HQD9kkduiwWQcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kDtYqbC8;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52332606A330
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52332606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kDtYqbC8
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-55650fe1f0dso3457463b6e.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636252; x=1796241052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tltDCiy5cuzdulawCOgmvyY3l0pK0A9bj1d/Pm/aQJI=;
        b=kDtYqbC8wUOKZswZvJNXof2OkFcXoXWCKVUU7lXS9T4ZCABijNSO2KXRbtTYlutbPs
         /TyVCD72oNO7kyzxrOT8uHctF4VsX1XnRWqeNiUzTEyccKmxkopc0D/fK9j2Fgva98Tq
         Jecr2FCnbicPpHrgXEQka6gS5etD6qqgjm47nGgYfrBwosoGtbJlXIHe5cjISnkX2V1g
         HdMB2GQ++wRuy+zQQK3WY5RxSEX/xlKFv9kds773hpI+WzlvwZ4FANkJmPr3bVy8gXVn
         sBtCUWuWYuOyV5hfjIR8DdrbbNyqG5JGi6dBieiAHcFz3HQXqFqtisdcWS3AhAPPyuvC
         3SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636252; x=1796241052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tltDCiy5cuzdulawCOgmvyY3l0pK0A9bj1d/Pm/aQJI=;
        b=u7uomPi4G3zIV53UFxca2VVwjr9uS07hIHPrTcWcc02SGR6wqoQ9bcYdOM9DcElRRK
         o5jWGZOHHRmhA0UpfusQIM0m3UUBcBQlDUiSn6dNTKjuXomQlkTxPy3fX6k1i+df3hoo
         cGUcFB+HNabAkxDl+Pq9l77fNYGjwwle0jDueLfx85zv+TwKlnlAxUMXH1jRKLuifiaJ
         MNmp5tzG3AvRP8f8nluJMTYrZL5KNfS51x9owmC8eNrnYjFd8wHm21k2E/V2MU1KwheT
         HBK308k64i3S3KXbDu7Qc/+g9KJCit5jaQHu5A/UxbvpzRcE3CVMrAkBDpXyKVikyUVu
         hAnA==
X-Forwarded-Encrypted: i=1; AL+hErH+irDIZuP9vrcORfn/DY3yxT7OflWToCPpt0MUdEcRc5tj7c9tZA+mesOg6BhOv94BYbOS9gjJRSotoQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9p6vKCOJYpKc9sX9PK2N6pUyZa6WSgyzhQjh6yR4tDQGKxMkvb
	B589VE3/zEQ15h19T7CMee0guNcaBXgs+CpkG6faIJNVqxvM4iqVpT4=
X-Gm-Gg: AZFdTZeseqUsFR/pf8WLl4fKJErNGYOOj7eQo+WsyjD/TYqLEaafTVOhNsba8y3jy4G
	4O82mjUvT0OchJWvKKFThu/4j5dgWb3rriKozBArzFWC3VMOSZCivVVF+/fvPILXeIDRMHYsi9Y
	HDEIE5ui/dRHAeSfq6690TB1Hpi1FalFoZTkAnnXizT2qe5X0y+mqtH6hbrtxa8x9XsjCwP6Eox
	LoTzuL50THjgSglfr9OCQfTfW3T5q7Af5m/BF5EBOA7Nqq2cSxbRDOfL0zzVnKjxFE1HE3xxaMp
	Dul+IHqShjqXIcRZ29ofkGKBCntEe8fQFz9PEvyGZSmqzCcVK3GCgCgjb/VidEKYT3FlXT8a+pH
	OC1AXIWCYcZtHG4pkmSsyxNaTpiJHxTYaesmgsJ+B8BVS2HahvWMETPSZ5aOx5s2apvAn+tLK3J
	6To2xGap3bEU3547nkSgAxHVAXxrf4Ak5/zywgZF3N6Kzp+WBjzNJ1Tz3BacvsWAxRDjsXO4CYz
	R+KqFMxvy731+zAHXrkt9UTSR6C8lZaXbbFRmPTq6G2IKUXxZXBiocndVxeCJ6pRfS5nndfGiLo
	CT6jTovT5iFoMjoul5krvIT48HEmuIN2+ECYfrmBiwZBXzeVnlX8QZUj
X-Received: by 2002:a05:6808:4fe3:b0:4b9:e6ab:d07a with SMTP id 5614622812f47-57a0a503358mr19175915b6e.26.1795636252312;
        Wed, 25 Nov 2026 11:50:52 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:50:51 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 03/12] media: tw9900: accept the TW9910 chip ID
Date: Wed, 25 Nov 2026 13:49:42 -0600
Message-ID: <20261125194951.19072-4-matthew.laux@gmail.com>
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

Allow tw9900.c to accept the tw9910's chip ID and revision fields as
well as the tw9900's. The tw9910 is a superset of the tw9900 for the
functionality used by the tw9900 driver, and USB3HDCAP/XCAPTURE-1
capture devices can have either chip.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index e9d384039b50..df8c7b1f3450 100644
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

