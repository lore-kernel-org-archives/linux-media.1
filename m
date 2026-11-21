Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233360;
	b=tPFVAAQktM1Cp5S6GPkUQj8SbrmEwl34eoTMH0r2pKG9PrdlcYePofYnk4P84uySIqTO
	 qSnw4DBRA5fDyNbXRGTOzp+zjeVdXi8zxktoPVUoIULdXyPYL9kBDOTebNhXw/kt5sYE0
	 MXudXILcFzC/ZXcktJfhrfmHJcOh6IDDqbwdP3CFggHFnJmCGr1Tfj6hv+Z2LXWkmhhKH
	 hHUmGNqKbZNAm2uUum8TZXYdqAvFoSr0AV47+zeCrC5L+ml1lMuvjNSK+vN5Oj3rJgS+B
	 Pasjo046GJBriwS9fVdLZmxPtPRVsxY8P/Y77Eq8qSEZyuTOw7SvOd06+Msf8QPYKtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jRUECku9MtNUtuZiZnRtB0skHYIdA8uwyD4cqahMADo=;
	b=3gSieSFBRzCVTDfUhaMoc+7litdwfcfRZsQO6UCqKj87ZI0X1qPtnP83e/Un7X60HU1U
	 l3kJ2qnR7F2L8ZAiC/VEl2JE3iN3EOENL+SqDb2HdkbF+53QSed69Sa1XLtoRksD3w050
	 8RIcNBZazvWgo/2syTC+VbivAVmiaM34gxCBBNq38QshakEjFrVna0r7+9E8x/5LpCcZ4
	 53L9GMTBsrFPG0ZRLZ+N5mBSai0FCEki08azRan98TgUIfjzvVoVU5QoaA0a/R/7U0FjB
	 0/EexC89CbeGpJPGJhFJu/uyjprfEiwCft3Yes6RkJAoaIFeB2kYpCPLiL6d43b3nKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgL4PwRw;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB3960A2629
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 03:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DB3960A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgL4PwRw
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6df7f544919so964936eaf.1
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233353; x=1795838153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRUECku9MtNUtuZiZnRtB0skHYIdA8uwyD4cqahMADo=;
        b=QgL4PwRwcRxr+9m7sI6/MUDwX3W+V/RKxXrAUvK25MfG/WP69Am1BH5KlMvxTbfYRD
         qHpVk0DCQnNEblxwl1KHEF9vE08qoZwOv7FgMiMgHXDAx7cqcmI/LrFQQ3higzRh8QoM
         Rxz3i3raL95e5FkcoMLE49APrjeOA7mCQ4u35yZGLvqmIV6Ung7H4weoPWLG60JQTRsK
         knYR065jJobM3+SQsKaUi6Wp+cbR6HG7jQgFTFo4J6teAeJ1okGeF0nn/fN2w9APDHer
         4uFE1ouf4IOH5NygopYQf5NEkEAM4JBNeOpJZwZUcap7pNKVlX1MfWM1Utks7EpNfU+y
         7lUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233353; x=1795838153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jRUECku9MtNUtuZiZnRtB0skHYIdA8uwyD4cqahMADo=;
        b=Vq/gEibariql1PZ14jQ037Jxhcr7XF0CYdA9byULoVdtPBFgKeAEgZDmozSEGc6UjH
         FeBxz1lHzgj7LfWYf0NI9iHzQSFm2j55vb+aBvI7vOc1zGKo53aWgccQc2HmBZW4TH8n
         PhXEaEK3U4QKyOrviSbPfnjxdM5+dpTrQO6pU/Pye8AspKxrdmY049VWcw4l8bYzF40B
         vrS7i5khU0NfXTKvbJWpkNJgEx2uzu8GUZu2TWHM9KrDBbXt50GEl1BT+VeZqc+mltS/
         ltX3QRlX2PL58tE382ClPs8jVsrNJNsrxUp8RJOdFAQuVBs73oCH7MpdWcXiKgYzS/Zt
         V4Hg==
X-Forwarded-Encrypted: i=1; AL+hErGO/9UwDMl2dhalTf/Ft+KfU/g5PHKSn9iG+12VEqJ84h5jL7cJXTf/jRidIATLcXgb/3EuI4V+NvSg7g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9lYEU3Lj4SR/81o7FzsvB+GKCDQDkNDxpuOLSRi8sW16DZWfQN
	TSb9wswdOBruMHgy65DzTg33bRnm+kMNvCQwJ1X2HvkxIlI1pzCMvLY=
X-Gm-Gg: AYBFou3uc0J0Tltip3sRPCh6EDBmdTpZvPWRo1V1rW9ymVWAk6R/swpCVwTpUKQcTSj
	uqHIzLyM3P9qMnko09J2uOFg/TM+0E14+YEgzTtgzKPiL0rbxwsQJCK9vEWhCru5cxqZxpApFNi
	WLUdnVVj/kqGPCl4jr+fncb1FLT3ETRFrd+WDGfwl6RKyuKEc2DfReOsyc8jO4AoiLcfC5PV8in
	+wsoU8eFdMZ1SvpMSiX3h7xxShHFJwOC5VXCB288lOfxwvGT3P84RoQ/FYYk2zn6xG/pC6TYggx
	mTif6McxkmCmlT65ox3INDDXa9JSI2gZIgh607ODCKKxRa15AU3eK1vWtdszXMti6P8R6w3QAsd
	sN3kdJJ8SHdpizuR0IGRINPFgy42MAh4jfoIQGYqBxH+jMaZLMmYwAUVvhBzgTJ7a42dlzenlJd
	B/PROedkzpJ9bpbgW6YEGL2Ym58B9qhEvU6TcDzuG/OJ49Tur8+baldK/XxBJC1HyVKxUbXEXC1
	siAwrmDPPdt9OfXxn/8tk7zhWBlxIzo/KVhJyPk5xOT0lrtOKZKMpGEdBTRYnjZ40FQ3wBBRsQj
	TZoutmRdC4xc7nnkY0kAEw25xZny54jOhuiZmVq388ncW7RrpsyfPjEA
X-Received: by 2002:a05:6820:1ca7:b0:71a:d76b:fb39 with SMTP id 006d021491bc7-71b391e622fmr4923396eaf.2.1795233353562;
        Fri, 20 Nov 2026 19:55:53 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:55:52 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v7 06/12] media: tw9900: power off the device on remove if still active
Date: Fri, 20 Nov 2026 21:55:17 -0600
Message-ID: <20261121035523.26764-7-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121035523.26764-1-matthew.laux@gmail.com>
References: <20261121035523.26764-1-matthew.laux@gmail.com>
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

tw9900_remove() and the probe error path only call pm_runtime_disable(),
which does not invoke the runtime suspend callback. If the device is
active at that point, e.g. when a USB bridge is unplugged while streaming,
the vdd regulator is left enabled and devres then puts it, which triggers:

  WARNING: drivers/regulator/core.c:2657 at regulator_put+0x61/0x70
  ...
   release_nodes+0x46/0xd0
   devres_release_group+0x11f/0x150
   i2c_device_remove+0x41/0xb0

Suspend the device manually when it is not already suspended, then mark
it suspended, following the usual pattern for sensor drivers.

Fixes: 918b14a26b12 ("media: i2c: Introduce a driver for the Techwell TW9900 decoder")
Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 6309d9eda243..585509c1b41d 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -699,6 +699,14 @@ static int tw9900_runtime_suspend(struct device *dev)
 	return 0;
 }
 
+static void tw9900_pm_cleanup(struct device *dev)
+{
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		tw9900_runtime_suspend(dev);
+	pm_runtime_set_suspended(dev);
+}
+
 static int tw9900_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -778,7 +786,7 @@ static int tw9900_probe(struct i2c_client *client)
 	return 0;
 
 err_disable_pm:
-	pm_runtime_disable(dev);
+	tw9900_pm_cleanup(dev);
 	media_entity_cleanup(&tw9900->subdev.entity);
 err_free_handler:
 	v4l2_ctrl_handler_free(hdl);
@@ -797,7 +805,7 @@ static void tw9900_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
-	pm_runtime_disable(&client->dev);
+	tw9900_pm_cleanup(&client->dev);
 
 	mutex_destroy(&tw9900->mutex);
 }
-- 
2.47.3

