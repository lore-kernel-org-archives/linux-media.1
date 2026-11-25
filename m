Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636264;
	b=AhbyAoLwCW4d3s/bDGuXn40RoiF5OTW+ZcMJgSjq2SNKwAbiN74r+pgMHsryU8/Pmw/m
	 9va4eqS+R2ujCFg6irxjRb5L2WwCQiLoOi+x+Xh5a+PQqmJ4DacPv/tcYE7ScLEVg4Mze
	 czHiAnZXVMLMacK5vtTYtS+m/gw3X4YfE3+if78y5bg2MoDi1B/thdID1Jg/ECb7YMC08
	 YKHwBTi7nJpkjGdpQOYg6d5+Uys2XtVOBsdMjyQ7HBbPdbsRzVQbWh6MHEmTEdOxextkT
	 O8FphbJ7/pwOZ9v2cUXy9uqvbBW09ccvwhNeYb/VB6U8Hwami0dQ6NMoaxZELKmn+Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DZHDPLNDBuON6r4+3mJFqDI1dwdMb/BwgwaZhh7obns=;
	b=j8H3WTx+DkJh+r8Y0bo3uBUhitA1R+S1nuffEpOtHGbhCnwuYBdSOfHKTnBFTF4RXGr3
	 bXgfKZ2vrqsG8lz/ikNFWbDrpgFmu21ao+FtvZHMbSAiTaBrBgaXZEq0DaHJPhQKRFvGB
	 v8Z0vJ7PM6LKcJ19z8Wcg0hC05rpwx363s0L/UyuFH8SlMplK2hdQI4gaz9O5mJ8BRL0f
	 nMeWxPIGEKrvDaEFj454vx6S1JBGd35C4Q+g6+2v/O6G4e/nf9T/zLX9aJY6VURRkeyJ2
	 E/Ntny6EzIw+yvFCG/+69bbeyNLEd5E3v3g7wMTpBuD2sH4AjH1IRDNrRq5G/uEN3sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PCtfbLhQ;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9158F606A33C
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9158F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PCtfbLhQ
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-862a5b64755so3525478a34.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636262; x=1796241062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZHDPLNDBuON6r4+3mJFqDI1dwdMb/BwgwaZhh7obns=;
        b=PCtfbLhQ8N8rEGJE4PguHE15cSR8G9QA6ZThAxlPDU/aiHuRw0pUl2eMQfPC6SbkFe
         aLMyByv68yj+hWQfUSh+DaDc1h0vk6BF8wKFLEdJTQhb716gePUds5atuFK2H/Of/8UJ
         SsZpIzOzEZAs/hB6SgKCVPsQ53PzsVboLx+ZCqqUKQK6G/jhchOyJarUSk/pxE/ALcPZ
         Bbehz77Nef7Vx6LAB71I471z9enCOt/wGQaRxl2r9ZhDYEOA4CDBLM/IRdGUIMq5UVrF
         Oc1VXHp2oobRBZXFgcITsR1mrrPQ3GwQw6MYKoTbWXW/uA2iu1EL76IEFfdxs3nAWmOZ
         Cmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636262; x=1796241062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZHDPLNDBuON6r4+3mJFqDI1dwdMb/BwgwaZhh7obns=;
        b=HwsV52a/HhLHTrl35t0yZXrXsmSpJuvjrpnyDUu+FYqAMQBwtI1OahMGyOHE06S99v
         Kr+RCwfnGkiiSzPQ7NA21tvlA0P7qpoLGrasq/HKDxkG8mRCjjRIAHOusMOPvO7tMTEa
         owMKuUXDQvhjeTjoXfSaKzQT1FwURbCui7H0+xIOhtpmlRCYRbQqeAgHXORDn7Q2Kq6C
         We6LjLnNDNohfOUsOV2lglNaV5LTGTZs3kgxFvIfEW6B3DFYhJAcewIqV3fc45ScNnDs
         K/zXawnJrXVUm8cMUZm/6MLmR3gFP9A/L6mwP4fPKqLaSd0QAp9JXy5M3h2mUT9KxVSc
         KMRg==
X-Forwarded-Encrypted: i=1; AL+hErFbAq47XWv1hzpa9o34RXstcVIxTcRkD0E2VEm/MLbOmVBHHvn1QPYutwhr7je3mPvpg8PqeFJ29Mc7mg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+BkEboCbcbU5UeEf3UogPQu9xWDIZbvailUMoqyfwgQMbFjA0F
	cTkTEME+dGvRiRpUzBlp6BKzgDrt+R5hIpV8UG6zkjjE8p78AlRl8OI=
X-Gm-Gg: AZFdTZcFY7CFQinhNaf320rlO2GLFJ57+YBVWbiEYmVK1Uduhnq3bxrRHBD2kVLmz3D
	RchWf7HRnjf296E1weMDoBzP1e76u30UKqfQ+c2Yr/v/WtrqfErxQkkgHW9HyZZdblXm488PV8/
	GJCfgFKWAwp4tiasK3+YzTGfrShJjUFmTv4wwIiSGLgwhMGvfsG9oiPWKQjLVdi8wkkrxJz4mUS
	TsFogA/zUhiy9/1qsRJjpHep+W2UNpNnxSKNaKsAzDQ2pArqviLDtwseuQ9h63+jFsBJgPcLmGY
	45izPsp2bpg4nETaTRu8LWDUTZxVK9mfUYmZgEHWpV8khMjGLSOFRZlPvC6OF0P4JKe6uwjjGgn
	5lL2ECkmFgNIT/Yt1ffzKz4BM9S5EjLsSzkhH0B1x8ktqXrE1unWAmdFig9S5GjJW40fzpCTJEp
	aFm+D+oniuOZq46/Jlm3Rpx9Rj3qmO3tKJfAPFtxPiFVozXVu1pdxU8BUyAZocmmoKpZTGGbK4u
	SV/fUsf6yT9p4nyL3u13L80a4+gaEejiIrxrIENlT3VdCKiA/hf4bDaPDCCPy8Dr1rLa8mTA9Rb
	jznjQOx6u8ghMaxwnDPC34W1fSxsCTFJ2G7I1RRr8YQYobqkLvWXfApO
X-Received: by 2002:a05:6808:23c2:b0:571:c073:748e with SMTP id 5614622812f47-57a056c8709mr19910622b6e.3.1795636262563;
        Wed, 25 Nov 2026 11:51:02 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:51:01 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 08/12] media: tw9900: use runtime PM autosuspend
Date: Wed, 25 Nov 2026 13:49:47 -0600
Message-ID: <20261125194951.19072-9-matthew.laux@gmail.com>
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

Each runtime resume enables the supply, toggles reset, rewrites the
init table and waits 300 ms for the horizontal sync PLL to lock. Without
autosuspend, a typical chain of s_routing, polling g_input_status,
querystd, and s_stream would suspend and repower the device each
operation, which adds ~350 ms per call and discards the signal lock.

Use autosuspend with a 1sec delay so that closely spaced operations
share a single power-up.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index b2b754e898c2..b2c30e84acb8 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -68,6 +68,7 @@
 #define TW9900_STD_AUTO				7
 
 #define TW9900_VIDEO_POLL_TRIES			20
+#define TW9900_AUTOSUSPEND_DELAY_MS		1000
 
 struct regval {
 	u8 addr;
@@ -346,7 +347,7 @@ static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
 
 		mutex_unlock(&tw9900->mutex);
 
-		pm_runtime_put(&client->dev);
+		pm_runtime_put_autosuspend(&client->dev);
 
 		return ret;
 	}
@@ -355,7 +356,7 @@ static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
 
 err_unlock:
 	mutex_unlock(&tw9900->mutex);
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -532,7 +533,7 @@ static int tw9900_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
 
 out_unlock:
 	mutex_unlock(&tw9900->mutex);
-	pm_runtime_put(&tw9900->client->dev);
+	pm_runtime_put_autosuspend(&tw9900->client->dev);
 
 	return ret;
 }
@@ -568,7 +569,7 @@ static int tw9900_g_input_status(struct v4l2_subdev *sd, u32 *status)
 	ret = tw9900_read_reg(tw9900->client, TW9900_REG_CHIP_STATUS);
 	mutex_unlock(&tw9900->mutex);
 
-	pm_runtime_put(&tw9900->client->dev);
+	pm_runtime_put_autosuspend(&tw9900->client->dev);
 
 	if (ret < 0)
 		return ret;
@@ -623,7 +624,7 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 	ret = tw9900_read_reg(client, TW9900_REG_CHIP_ID);
 	mutex_unlock(&tw9900->mutex);
 
-	pm_runtime_put(&tw9900->client->dev);
+	pm_runtime_put_autosuspend(&tw9900->client->dev);
 
 	if (ret < 0)
 		return ret;
@@ -712,6 +713,7 @@ static int tw9900_runtime_suspend(struct device *dev)
 
 static void tw9900_pm_cleanup(struct device *dev)
 {
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 	if (!pm_runtime_status_suspended(dev))
 		tw9900_runtime_suspend(dev);
@@ -782,6 +784,8 @@ static int tw9900_probe(struct i2c_client *client)
 		goto err_free_handler;
 
 	pm_runtime_set_suspended(dev);
+	pm_runtime_set_autosuspend_delay(dev, TW9900_AUTOSUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	ret = tw9900_check_id(tw9900, client);
-- 
2.47.3

