Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029731;
	b=bruTJKIiDuIS9zeikKTtikRmCOlr09nBozUPBJj2vC1Shw4UAarM66mP6N++ZGB+i89H
	 IsB5zULPQICNVgfWWWJ7/G7aGL+/f0kePOoReaBlr0sgSnilVaqXtw82J+zLqyGobndBO
	 Kn+artBPZDiTU9GCeFioTnjdtrT1lTNRSDEYp9qpWbtzcWJcPBcMGPOKxUPl/8/GDU4vp
	 2tXI82A39qLTTL0+DpdDZ0CJSH0z4lW17a/c3Olu+sk0PKhLHd9QvbH5ZP9It4jYjoYYL
	 WJyf4A4u9OcsOiMmIu9VvxKLhPQL1gJvmWx0EDgOOk/hDJhVUo0YWXshJh2Cp2BLV7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=14SBEOmGTjg8LS7k3t1iUMs1kWnigFsCdcytzLwbka8=;
	b=KucuQy8J0agRarZRv35gmJE8zDsSjUqMLwYr7FB23x+aBTmFXn960zZmJh+mm7v8EQTk
	 h7I5QYlsOlkwhyRgti/VRwZlrmH05uEDhVuk6e71DKhyd0aFEj1ptW2rJUz2ccBJ4Q5xm
	 tU7TOcFYiOUhhuDHwTDKH9dYD3nrAQvLqJEChQyFRMBnNHgJdu4TnjbWjhXG6yrEefJvc
	 7JCpAFW1OY2pZHbT/GjVynj8lVjxEzLJNHRNfQ8UJv4PEWSqwecOtY1dufFfp8gd99ZBt
	 Kqt5bl/70QYuSCVVysaj91dtRPsaVut2eKuPnYULqa6ZluZrPwTPk/Y7sOuuQ+uCPGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AaU5Txn8;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474F8606A32C
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 19:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 474F8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AaU5Txn8
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-702fd86d674so966266eaf.2
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 11:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029730; x=1795634530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14SBEOmGTjg8LS7k3t1iUMs1kWnigFsCdcytzLwbka8=;
        b=AaU5Txn8U4YORy6HgRBLCwpbSGA4Us09yglJpqied3kQQ4jYr9IXcb0sXVXawU9xEQ
         dZSDEiioybh3Kd5lX2uLSp75uu7b63Q607h/3owJcw+7Safd+gdGCbWX0cPZj7RZwENO
         zzx5+1REpGErJsduW6Ind9iwlL7a2CKWLnrdQkCGbUTt8ele93T9dRHd+BufmwN/e3Os
         Zn7/HcG1hc6JFMKz+szqkSnErs7HsWNsDJphdUjw8Nz21ArLXkbTbEGsKJXW4u+zOFt0
         2Nz570t3zXs9uHK9eVIGRmUp3+pbpX4v5aL148oslmPBYuzM1Xp/pGZjWm3XAEZj4tbM
         QKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029730; x=1795634530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=14SBEOmGTjg8LS7k3t1iUMs1kWnigFsCdcytzLwbka8=;
        b=2tPsF0+HwB+Pv9SEdRb549jeeIjeFhr5VELFFK1CFsW2W/Xt+Q3HiYEk0buHm+MV6m
         xVSN+6taqmUv7nRWIKKLRgrCN3+HISlvAbDeQEl3HWc2ThEsaGw7/o2M+dDfswWdCErL
         1LSx1ZE5p01pRZtKFRiRjxs7X73NeFGyRxTcI7ad3rOt/KJA2Iy8hpTqr2CJdyZzIqbu
         Wv0DkOojbLhXa53hdK3NrH90d5x/YDPG10xMSKXf4TUWhecTNbVuzSEgf0i5Y0US5v+e
         /hsVJyvEhvIt8y69Tr6v/jPPXox4bRtuzQX7T81CSOYUtI3U5k2djdfbRj03GuTzeXjm
         OJXw==
X-Forwarded-Encrypted: i=1; AL+hErFU4LiR4GNtTMsgLFKrvM+Gbn8WxaBlkXDFKWMbzp6FaHWm59JOfaCrJ++IqcMGc+CmU+LeljN31n6DrQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8qM66umv/Ojp/bw7FzbkujTlqapBCZFgWNhozyhhy2jjmRSoQw
	86ySS8FZHn4nIknrFcW/ZtwGKgCeE+9O44ax25iKlHcxVim2kLmYxD3FvsvIi93Lnw==
X-Gm-Gg: AYBFou1I58xbxDtXqnvDrThkV7lY7vjg8VEGoJL/pXQodnapat7ko0LJqVdnYB8+HpO
	PAWZ9Qc0C7J2DT2nSNP/JokfUDbz9b9+/Dypas0vhU+s/9Zi6uwQlha7fbb/ltWSe9k+0ytD/am
	3Zpg8oB8i6MyQPVCWlZkCavO/FbkK5g70BpBzUbe93tRJWPtMsOTIiRAlawdkzkKmQvoInqa2Am
	F4q9y9NcBVY1Xz2t7F4BZjALNwW0hts4XnDqTYYrU8J/Wl1XNLI8JXbG93LBg3HK77IlbB8yrNy
	Ac0TQkxn7jxhiiON8zBfvo/OSRiye/sBBm726oQck0vuNeRKj3VGWmEGNUiFqQfeNC/n03DoKmq
	o8bQFX5P5fGN1CqfRJfDqr86DCMPsDZxThmM/1e9/aLnSosCxOO9OPb2UUa452qYgktnjMoc3wU
	A6jm+l9jVPHITQHQCXNWczlbF5XwrQpneI4I6QYJ6yuFp/54F0mh6BdrZnI6SDmjf4LSbyI4idC
	Bl8ZLyXebErqIiluWUzAp1MjHfUtfDF5E7Doj8Ee9dKCY8KI1kuT7jmJ5OHLpoxJXzovdN7qd2d
	nwNaMZ3I1iNSsfkTtRe2Lm9fm3SBgeZaxI9eIXGWbKK7MhUbEj6WSRY8
X-Received: by 2002:a05:6820:480a:b0:6d8:57bf:57bf with SMTP id 006d021491bc7-71b1842e2b8mr2146386eaf.21.1795029730168;
        Wed, 18 Nov 2026 11:22:10 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b195c0bafsm2376912eaf.14.2026.11.18.11.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:22:09 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v5 2/8] media: tw9900: accept the TW9910 chip ID
Date: Wed, 18 Nov 2026 13:21:18 -0600
Message-ID: <20261118192124.23330-3-matthew.laux@gmail.com>
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

