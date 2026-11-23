Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448376;
	b=fgmVMO9BHxE2akx8NR/U0cCOk61cY6V0KUVta9eobVDYgR2KBAgIFGvOHkbiasAfaPy6
	 cy/SX4qfTuCxVMrWMpo2kv+Ri+8KdDzD6azNNspq9moKdCeRh61RDCbMChZ6a0EtmackQ
	 Fa5VygcosK0X4zh3AlVmkxbsSmuVoMKtmRH1dXuNoj4dr8CND66iCeV5y1UYCfrnLBIi9
	 rc5we1fjEuioxYUmBn0/B3ngdM051t37BwRPi0afR/gxo2kh1DoFLaTznRF3Z3lKSHfzR
	 vcCtuV1dlyBspVaECR1611iR70c+2qsfG9nCdZg44MmHm6KCERze+IZAurEMh+D61Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IhdhU6+7BTUS2GU9Nmck9NDFgPsqX0oOv0Uogov0xZc=;
	b=P33hGVmh/G037rh+ZCScuAiprlb66QGEA5Ne3UKkv2An7l58yFwfU1TFNYc/Y5336ZAP
	 Dk0iwm+ajDc+sN1LkSYsafrG+R1/q7wNgZgmSmRYBYobYgY/WtwzgKTQBjuaU4FKNchfm
	 IMasCLic/GQc3+ScaoNVxGdKycLfqDQG2wFX/kEnKQNY1gq+pHMzne4JvFnzjZI35ojdJ
	 0USbMvelXLJ+ycytZanFMr5gw7/OqVHGBJOBg+z+hhsvrIRHXd90luSTRccSleywXT8oU
	 nt5CXONulnanPLs1h6DbgRM1ZlVYocfg062uxLHi5/Uhuj6oDhvxKjydys64+WlOoSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P6ZTSrvv;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233CF606A32E
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 233CF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P6ZTSrvv
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15ea896ddc8so5752279c88.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448375; x=1796053175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhdhU6+7BTUS2GU9Nmck9NDFgPsqX0oOv0Uogov0xZc=;
        b=P6ZTSrvvO7CPSUqS1BJ7ZHxx0nt+12vB42qUJQbjBQzW+mJZy3a9cHTMRsN279KrFZ
         cOXDt72wEfXtFrPLvVdr6rLQFI09oTTKYLtKezRMbJI6G08EgRQFb7HiimMlyd+Yaok6
         HmvH4YODwcoCo5/SnVam+sAcoBOt1OXlkQAO1lKKXFBxT4uyWNOdNIe5g8hYbRXwAbh1
         zRQkwo8dY7+uC/1mMqSzjy4zpt34WaNOSzi/CngKshIsPE3kwWTGkgb3AF+T4P67VGKZ
         RHtF94mKPinuvgzKKjWzFZPZg7xVx6g2qErvPZAqx+EKkJIKs2hbBxijHnS39keLwv15
         obuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448375; x=1796053175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IhdhU6+7BTUS2GU9Nmck9NDFgPsqX0oOv0Uogov0xZc=;
        b=eW/aDDXVKXYmTwtEffjJMginw6Jskaj+CqYDkUVEybv1LLHSUJf1FqTCz4TEMVwQ5r
         c2BO7UIHtgnxNXMgBsQEc0OJqfLfcn0rGs/08YlFeJFb2pJz8sadxfpylh7sGU9Iq23b
         YCstfOlLf6VDg8RuMJPsAGPYUNC1xg16GfBG+uH0kBmCV/nSNllyCRgegrzidYPdAITh
         3YxCk4LX6y6W10kW40cGa+gCEBZ20N64tdEqDhs8ccAevImkeAZFRAy1pZOkXYrLmtU6
         6h+h5m8FePXGmyn+PEFWLMu/4U3o3of5wF7+j9WifNvxuWPCrOmOjJe8Vkc55KzFF6+o
         2cfQ==
X-Gm-Message-State: APuU4Z9e7GOGUvtkElS4WOUZtc8sbJ6ygJcKs2Lraeroc3/Akfgqpf2z
	UMoVDTfVgsyG+aSk+yr01SdhrMGqXPwNEC/MM7nfKydaKOi0QIUd290WdiY3kQ==
X-Gm-Gg: AZFdTZc2hd8gci7VgTQ3HbeaMd/m5e8oTyQQ898GcWg9tuNz7YOq0IEx+qemG0tKZue
	gGWASjGW2eTCY2PIZxUT/qOmb00NPeq81196TbY864BrFvlFD2ZV7aJ+cPWRKPlEhik/v/PMJ9c
	3cex2/Mt8oMaGznBxQ7Fq+N+HXF4Loax076izWRuEJiQmUwy0K3A7Pxho9O88ZB8mW47qR9tUKW
	4ro16QWiN9MUVoKHwkeqzyNbGzpYLey2zzbkHDPxOIzF+xZ+d2ZcslyOzUTuSvChJarjUYWnxU3
	4Rgkj74P4Zy03hsn7CdfSjf7Yr5pHrfKEjMNve1ACzwlimXyi+h0K24uBC50+2PZrlOMEHAu/qf
	7h+YL7ICrJIuUrwhMr7Dbe0jXWylnu225Ot2joQ0aU4NwMP1KQ8HXdRReNS0ws8FoCd8lUDj7iN
	aJRAdq3ijHNdZPqhQL8RxxN7ivfzLlB80rgsidUXs6FFBd8OkrUy7Wvq2S97myeu0/nLm8zYNpf
	rYItYN7b8Edabpj9zu9WbGDO/GqVvPROE06qTrl+QjJT4OXGEpT4gWcZt6SX0H5saRELYxaB8Fq
	X7JzI3l8WqMMnoAJ9HzYvId/2xhD6t6rNpiyP9Db2K6twzI=
X-Received: by 2002:a05:701b:4354:b0:1b2:6cba:7f7c with SMTP id a92af1059eb24-1b5568fdafemr11372210c88.37.1795448375240;
        Mon, 23 Nov 2026 07:39:35 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:34 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/16] media: i2c: hi556: move remove() after the PM callbacks
Date: Mon, 23 Nov 2026 22:39:12 +0700
Message-Id: <20261123153927.2547169-2-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123153927.2547169-1-congnt264@gmail.com>
References: <20261123153927.2547169-1-congnt264@gmail.com>
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

Move hi556_remove() below the runtime PM callbacks so that the following
patch ("media: i2c: hi556: power off the sensor on remove") can call
them from it without a forward declaration.

No functional change.

Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/hi556.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 3b725bc59057..a151bab26821 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1266,18 +1266,6 @@ static int hi556_check_hwcfg(struct device *dev)
 	return ret;
 }
 
-static void hi556_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct hi556 *hi556 = to_hi556(sd);
-
-	v4l2_async_unregister_subdev(sd);
-	media_entity_cleanup(&sd->entity);
-	v4l2_ctrl_handler_free(sd->ctrl_handler);
-	pm_runtime_disable(hi556->dev);
-	mutex_destroy(&hi556->mutex);
-}
-
 static int hi556_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
@@ -1427,6 +1415,18 @@ static int hi556_probe(struct i2c_client *client)
 	return ret;
 }
 
+static void hi556_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct hi556 *hi556 = to_hi556(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	pm_runtime_disable(hi556->dev);
+	mutex_destroy(&hi556->mutex);
+}
+
 static DEFINE_RUNTIME_DEV_PM_OPS(hi556_pm_ops, hi556_suspend, hi556_resume,
 				 NULL);
 
-- 
2.25.1

