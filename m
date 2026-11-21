Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233362;
	b=UWntJFWILEZjAi+RQNWyL6YNeeotqv79KmWTG7lJur7A7mG8pgG8JoUh9Gep3FBnXbFP
	 NcWb86McbZj7e6umTlXLopwvT9HKpluK4M255MccfNs9NwdevFEG1CoEOtG7qVjw5lEV/
	 PhTs0XMQqp+wLGSdmhR3//5ydRD1Agr6dQECXt1LBBKSPfrahx2nC1jdMzfxKJ0ZUgsLg
	 1Ce2vKmpiFY6vSZaYUH+bhBOOtseZZ9PtHfTN5mydd4ByE3GpuIXfTaPbnGGLC1uOJoka
	 QGuwrd6J4HK3qUsZmctQ4S61OoL4oxNAaHQGBLT2Jn5BuVQot2JXQ4tSkLhIIZWdf4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DZHDPLNDBuON6r4+3mJFqDI1dwdMb/BwgwaZhh7obns=;
	b=fm7GNVhTxGYUF2+iuIZA7fOTUtRN2mEX++GgM4X5tQ+bho7GZ6/9neL5LeNCGVZsjxP0
	 UfittfQnIVK9fbl8wPEmwjW8S0s+4JhdbrYqDAgCK61TpJ3LUiPmfFnOy7sHgacIXhZL9
	 w6IXh0r5QHEdwPMIVMBh1C1EB4Pdvm3pqqa8QSQDz/8x601GUfCqxZhpF5ItdD4+zmgkt
	 2FpUedMlL0MQ6SPNN6c/l2xckyKV5TaFpd/1Xwkz3hx9pKPd761g2KMzwdrx73LDobxkB
	 4jSESL737HjhDfu2ICFslyVOamWeOuzOuUrmWaIlRx1m/XSp3GcityrmPxXmG6peFoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Yqy8/pmK";
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE1B60A261E
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 03:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DE1B60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yqy8/pmK
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6de2f213b7aso724050eaf.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233359; x=1795838159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZHDPLNDBuON6r4+3mJFqDI1dwdMb/BwgwaZhh7obns=;
        b=Yqy8/pmK3Yqg507iSkvIyj2wvOgteWl4RxMpQrvEGH2B9FH5W+qUFsvQpPudb7RRvw
         a1+0qMj9lVYOyOJdSBbeTJCMiZh+hPsyxDvgU8jw9hMMWbpmkdSFe/lBc7qjKiygx/gm
         5VicsIhWNhgFE7jaMwb5kwnkYbNh6q0jcXCtZyKm5pP7aT/JOS99yWpZzECz2oWDXUYV
         8Q/aZiGcuodTOtxvsbEIc64F0T8daL0xq8dQMq7xcKvHbnxq0tNAh+Y9u+YnV+nuTPqC
         ePsSUhzyxMxoAD5r07r1XB6pmhwaDl998mToLE+Sbh10woiI2cJOq7wenID/tLVwi67t
         PO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233359; x=1795838159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZHDPLNDBuON6r4+3mJFqDI1dwdMb/BwgwaZhh7obns=;
        b=NzSc2/yY7fQ7I62/SKzE/FH/pEXjj044d1wOeVkpA1UK8IsOUd4YiF9mspv26XuBlu
         rSWiTZBdWLDJjQ7af2nqfOHZyCJcE4RM3FXCkj4qqfEA0ImrQUfHhMG0NCC5phj1Ivkb
         IfVwgIB+oWYMB+yr/BsClmuTYVSHTzAq0+6g/06sdHWWoBm9FQJZ86wRwJ06+DjZLCCP
         zY/UsKrpbRbWtaevghwCk3/HBHT6qtyKsQJZ8gpYMOuIuwwd4jYoWq7n4PesVCS60fVR
         iJm3//sfhc0oIIR7nnsfDJ7cVSnnyRzylBEIJwT8dwNVsGcxyQYiO28PbCNTFlcSp4DN
         Xiew==
X-Forwarded-Encrypted: i=1; AL+hErHF4TjT8T18wygRsygpexmGri57sgPc0zwYjlzKXbtyMhQood81crco5/H9UMgzTGcG6cySiMZpF4WBdw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9WTGauKhVr44Yqw89rLfZ+qX0SEXMGeosEQEX5IgfFfBVFaOEp
	yGrqZhbic7qkM+v87yGzh2hQaWQz/Lea/4Hery4BcRNwfV/JLHtCGpo=
X-Gm-Gg: AYBFou3GQnzDarxPpf7jimCk4qrXLprSqQ4MS/BYPzO/esz9RBtCtp4Wl8bLa83vEg8
	/Ug97fSWst+nvdq8w3B9wsPTxFna/HPjtUkw0w0gnL4lB+WLyiZHcFxETveZlGE7VebrVaeEzyP
	vjlaUsAhVSoMbwSWuEOrk0pXSIi54U11YcEZCNu8zbfXtY7mOTRehZcg6MegigxneTbwRw8jJ4U
	vqVpOjh376I3KfWBWal8TpOzanXoAa7trpUQZhOKxbLc4rwtP6zOWeH9kAttGE4G4A2ru5hs5y8
	KssGyX8hMG1nZ6OpayEis4yCQqv6y9/7tL7ZuGjCa0+7SOLVx5vaczo+mPoJsej85fnZhEKB3JX
	RHOL8G7ubbYPd19xr7Hs4fHu5kzaT95+znVXcpA0D8nWGnEwDAFj3bkFMOHTEnSzsx5OJ8BjMyW
	akTsyBrVJauJUWEnMQtU7/4nO8H1uKHSjYpcdI3mm5WZj5hvzwU4HowFhn8SPOGvl9p/pVxMQT7
	uLlu5zX5kdyVIm3yk5yVnpxPoslwOvUpdMAeCxbtaNj6b8AyMkIqNliHUIN47+TR7+OWbEqsE6Y
	nsyo0dS0j5ZGgVxQNYT7xY4CFH8kappkyEtT+ELV2dmNbh17sULeetkUqRiAAoXXg41IV+b0FSI
	P6g==
X-Received: by 2002:a05:6820:a508:10b0:71b:16dd:fc2a with SMTP id 006d021491bc7-71b394d862emr3174040eaf.50.1795233358915;
        Fri, 20 Nov 2026 19:55:58 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:55:57 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v7 08/12] media: tw9900: use runtime PM autosuspend
Date: Fri, 20 Nov 2026 21:55:19 -0600
Message-ID: <20261121035523.26764-9-matthew.laux@gmail.com>
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

