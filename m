Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636262;
	b=HyvjKAFBl6Qo1GI2lr4AZyASnqq/mhl0HEQBIl8oeUs3t3V+NE1oWpg8RaCTsiwLfLRW
	 nU/LWGUoXrPN6hge9bjKVX7Bwqgwvp8qc8B8TindOhyH/8lLdjSpUM3itNcxUDuRqvS6s
	 4kIDM2m3h5WnDuRuamHV74taX5rSEkxFEPBvN+NoEBS3NONqUVXvhp269T9z5C1o1yU81
	 MJEcjZAep6R8jxhxIRrMIQ59K12RIYzlZzxiQ6C7xK8+DJ3zb+0RW1p7nWKcg4QvHC9wI
	 e7UCSSM1VtnGb6zX72n1VNpXQaiD960e6qZmELzMNewCduzz6vRsftG8Et8n9gVPX4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZuGEAzWS3xcIcvSu/cuY37PG3g4bSwO/xoH2Fm6M/Eo=;
	b=1IdUhKvMfjw34gN9+wf1CqmpfQm8IR+uTwMICYQ1xT9sVvfvND9IsQ9K4NfUvbRKu/Sq
	 XfGvdoSYiKiFEEPOK+d6sToVjLAP1/4eYsM2P3fl6Xd5QRMRfCp0gBxzUcg39FIDIEWvx
	 Y0YUHQZ0c/MYqx9083S/aNGVSPaNZfOXzF4zsUvX+mepvwSPDNxC1QAfniHCQQ28pqjOI
	 jGDtIkyQZLno7xgwrIpNospBa6Czuv8VDIZaalfgA/pDbpy9rOJh4IHTd5bc5VAgIlUlC
	 23DNMA5xiIBoBVDAkzJqFim+c4XnPBTyB3nZyd6khELsnxGOqLn5ZPzGicKTuRVHI1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qMyTSypB;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE62606A69D
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE62606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qMyTSypB
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4b28d7c729fso4793251b6e.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636260; x=1796241060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuGEAzWS3xcIcvSu/cuY37PG3g4bSwO/xoH2Fm6M/Eo=;
        b=qMyTSypBvbs4gQ1+F3bFPW7VPlHr2GwAICXC7/K7ZudopacyXTW4/xyFfu/RQInevI
         3MKQAI4s6BiJlMkT2doW4hWFUfcNvjXJ1pC5TAOuljmR36AaQXcFTAY70XHws2LRypXd
         pbYGqe0WOF0TbkDduFtWacw3TK0EUyep6waaENj0YAcC2KkAUosw83QVzXkxf5c5fEAT
         CLaXEZN8RYBGKH/8G4RV4xs2rt0dAtHp26XCf4K0pqTgkKHaW6HiZiuV8V95EglfQhwk
         PO7AZhZCACvGiYlXQyw+pO7xuYNLz8XBDE5fU1oHnq20WdaHmPMjtfTogOOdh+dfM0BB
         W/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636260; x=1796241060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZuGEAzWS3xcIcvSu/cuY37PG3g4bSwO/xoH2Fm6M/Eo=;
        b=QTp76KOVX9wkMIhEQL+nbQx8IvUph7xMq0UJSSg0Z353WhEP9k24IfpMo+wtCb4/RK
         pzXSxu72S3iGtILP1J4VEwZrYUWUyG/lJqTg5JWuJ0GjmEskmfrj9AZplw57yraYxIAn
         I11jLZSt5Z++GSXQL9YggCbpez4NpeLacF4jwIbGMZA/UqLhCZUzR5piEk9coVVJqi4C
         qrEND1VLwYM55CBo934KGkHfHtcePJ5Vs8pfv9DirMg7atfdn7AuN4zO9YC6p93AMAHM
         ZTZ8PrN2QxQAVIYQ0P+Wpse9J3J5TmwXrWZl35xYnjaJ2cck07VQM8l8bAaYxK0DZCU0
         szEQ==
X-Forwarded-Encrypted: i=1; AL+hErGEF+puGhF9GYIg74Q6uoiTVcYvpRE9ZBpo7U/U3778dGuFk+XSAaBLRO13vSTTpaEKqdU/9DnVdloRsw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+BO1ogZmQ+NIvyqdbEYc2pCTuyobIhvePaLLZUlX5Gvd3eyVan
	kBRx/zBHDCav0+bU3TF/YuNI+UDouhAGpYOd0eV8mxNYSgRbh6v+J9Q=
X-Gm-Gg: AZFdTZdYUaxKP1p5Hf45MrKpennFNQAvgxdkdXHyie2/Yyv8Tj93gfPM7XgCE9MDx5V
	SPVy7D0dGWR/poPzP9/YyCulhNPbwZQ62R+Aj3kFJVU3ONsVfhCkobEpiaVyc+psnM+JrwMTC3+
	0U04NedlBaOwk8WqV5ndJBi6sH8BA46Xz2OHb+FZX7wkwTXbUOpOrzzPJiiI41uJ9O5S94SgfpY
	DeeluDGrlAVOBSyphBeKDVky1N/fmVoIJiSD0etmRVaJLoD0iH+sIBiW83yT9YlvwPEB2PWxQ4A
	pM2+CW+3REVpuMH4lDYtROa0LPFHmi8Jbnx2T3ZylrmSrvhpD1xIelW6UHWZiMo/X3i+tzKTNbj
	906SKitZR8DlGMJGmfOrnsjkzdq7TKbVHWKyjJTYSR0EVUutj7EMIn/yBjft37SfuPAGvikUPsp
	D9VmdzmzMyoRRguZ1HmFAZhNHj+et6JcHH479hhi9d8e62WdUneD+Ca2zWhkIF9az1VKxBPOYCr
	XCp2gs2d1pUzuBnqGHvDj9Qsd2fYzjxwDLrmnDu6fGRvnNBu8P8TVdovqHEHZtsa+RyH3Z0PjXs
	vYHMNXMIm8pyba7dLWH3DFfdkd5kynxiiAwNNwHARKDfD7wvrwxbPDQa
X-Received: by 2002:a05:6808:309f:b0:573:3cbc:9775 with SMTP id 5614622812f47-57a0900b93amr19406702b6e.27.1795636260017;
        Wed, 25 Nov 2026 11:51:00 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:50:58 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 07/12] media: tw9900: power down analog blocks in runtime suspend
Date: Wed, 25 Nov 2026 13:49:46 -0600
Message-ID: <20261125194951.19072-8-matthew.laux@gmail.com>
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

On boards without a controllable supply or reset GPIO, runtime suspend
leaves the decoder fully powered. Set the CLK/Y/C power-down bits in
ANALOG_CTL and the PLL power-down bit in ANAL_CTL_II before cutting
power. Runtime resume rewrites both registers from the init table.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 585509c1b41d..b2b754e898c2 100644
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
@@ -689,6 +693,13 @@ static int tw9900_runtime_suspend(struct device *dev)
 
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
 
-- 
2.47.3

