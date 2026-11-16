Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806850;
	b=bC5bSNZXv0/4jnpFzeSgBNhV6eyGg4vXaWFrmJuPliphkY+mJj5bLmi3ZSwt+xbJMqx9
	 SEqff10u786cFImO+KIaJ/jyVUuNC7CYoQhac8TL6XhhHhg8p1OzumW8lG24C6zfV+feI
	 m+BCG8wC2hoYBfV0o+aD/CWkGLw/OdBeVl95/PX2TTJHqJK6lWo+WBOzQPfNpfgjFtmkB
	 YNBi5iAvZ/mXVoSvwY2DkPfnz3vXgF1E4wqk9OFqHMGKYBkSK7YrSc4aMVPFqTdPWmBEj
	 fTeL9hDle0XQ7wGFb2BEwI8ztAT9uXRay8dBIvBYAmXYwHcdtWpwUHWXiYefHZPtb0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zvERbDGiSiR6GByxVkFLzYXaCstRo5terpd4p4QbZQI=;
	b=49JMvSwX1LC8SlR9Fp+LomuItklYAGycos/buBUUkMzDsjqsXZLad5ur2mcL6O+bmnkU
	 0zelVHd1tjJ2gWSAulGkVXfuxdk0eXVIHkMcvtugAgTN3ob7JiSl2RCshJ0U8B1OaNVsu
	 jEoSn+LkNWIk0yInFIQu1NQysjkLOZFqg0xvBiPQggEo6DBT7vhDhX1vWUG/PVqhQN9in
	 PHWVHxJ//GLAqWdFA3niN0lWs1YFvDpyZXTD06PAS4c0lvoaQN9Zlj5kVn6/x4+p7QNjH
	 jIavuY3uYF6sbhzResvXngx+S892K9Bc1wc28HtbnQ6dc1+BhdQxskfxgAUISJhU6IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQlblhL5;
	arc=none smtp.remote-ip=74.125.224.135
Received: from mail-yx2-f7.google.com (mail-yx2-f7.google.com [74.125.224.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A845C606A31C
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 05:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A845C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQlblhL5
Received: by mail-yx2-f7.google.com with SMTP id 956f58d0204a3-67a1a96329cso1183469d50.1
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 21:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794806848; x=1795411648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zvERbDGiSiR6GByxVkFLzYXaCstRo5terpd4p4QbZQI=;
        b=HQlblhL58lr/wiCr7vhfgv7eIS3XoJ6kk0WGDhuddytLJDyh1Ecpqb4G+ubAY1OB0A
         WH+iVuB0t7dWz2rVvg/cyUPHftHtvouRKoy94sekmC1Tepp3NRICTLn+V8O9X2qi7I2n
         E88czHyIIiPxww6eYgfOaC80LvqngT1HOoopSSa3pgAUM7JDK0Z+eyCLSnLvDIBFxPCD
         aqiqs9VUpmPu4Dp0UPyDhV+5Pz2AUXfc+qiC/VqS5IT0QWveD3EMVasMDUVZKoOQE5ms
         wQOvGnG+HE/jL3JFuCw8D5pV+My/7zKq9Le83qsq5Z+GSqQ3sjjNcpLH1FNrTeoujH/v
         wG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806848; x=1795411648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zvERbDGiSiR6GByxVkFLzYXaCstRo5terpd4p4QbZQI=;
        b=MJ9q7E9dkod1FqT0saq5hv1u5anKA9O0yj9olqq3QnOUpJZAAZt++NdpSQkI7ZDQO8
         9SQo7eEGwK0nx1NKz0yKsKFc7uqXIR9PjnpNTS/ZhE/nMpAzGMpM4aSUD1huBh+OB7JX
         6tW3/RyP0pYFm2HA6uOcg9H/CWizN800J9JRd4WMuL4prdvg8Noo0tRzVv73LvwKlCzZ
         5SfYH299DhEAHbszSwEHXH2eXdtqXcVKCUeBnJU44qwnCgZS+tGUD6xUEPsCDcnvGmaa
         bwjVKzFIy840Lr5S43eOfaAadU/61VwL8YRxjP50RZhLzX7zwU0TqLu5wgV7tVe4HtNG
         fgtw==
X-Gm-Message-State: APuU4Z+a+fo7v+fUQRj/aAbcmsm3wAAfOJbjw3wHNTJ5UefHBzlFGGhM
	Q9HjUCJsDdGLyMe0zeZN7LlsrKKuprnLl6hy05Un3CU6W5Ykh5zmTT9rIzdk6tBo
X-Gm-Gg: AZFdTZeot2otVffCiicaDZ63bVIxMHS0yJJ8b85quzclx8netBjMjMFI3016gJoXlYu
	YbbjuyfS9pDS8S021cZQzRobTt5iwRFdur4LAxfhdB7RmglqWZH048jvkLhQ1VUq2cmc7bt/Pmj
	w29q7MgtXyqs/bO9nLqWvogsEItui1reuzN/FptAPSYPMYsyBtzXMaqXuSXuaUuCke7olQn06e+
	PV4ZExUem33FsSvYzrmrA7fuO/Gskggvbh/1E/KL45uHHL4yrsweRm9Stfo5ltyZLOgeohYvpjp
	IrkVgHxB2ruvaz30wZrI06B1cNPnL6SAlYZDqv7s9MxneRwzdK+9JNhUvq9F8LJxOtc/XFsmNnS
	jluMfJTiF/p7IrovHLgZ5DmflB0+9uEqBlxn7fxnIiO+ReAOWBITGsQ117eel6n+mNEnGwoTMC7
	WWpnGhI90hhyDH7f2O986DlDmnznS030Gr5L3hxZYsCj9ef5klycMnE1LeKLW3r5azYNtfUMJ6g
	c2SU8FCAslIaU4ILRfNEJWUzr0eKpc7BH33sPDOw4ii/kQbdguaLiEaVur4ZZPiGXWjSpfrKJhB
	bZw7Hi+R+5lczivbX00bvwtRU3Ev5y/rKdN85bNSPKOu3o3wU249OtaZ9aV2r03ziEVNp9BJpz0
	ADzp7+dyw
X-Received: by 2002:a05:690c:446:b0:8b3:5b88:a21d with SMTP id 00721157ae682-8b4aa2f5f21mr51183477b3.58.1794806848550;
        Sun, 15 Nov 2026 21:27:28 -0800 (PST)
Received: from Xinshengs-MBP.attlocal.net ([2600:1702:7d20:7d20:28d5:8044:61b9:9cf6])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9fae24sm78414917b3.41.2026.11.15.21.27.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 21:27:28 -0800 (PST)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org
Subject: [PATCH media v2] media: cx231xx: cancel module loading work on probe failure
Date: Mon, 16 Nov 2026 00:27:21 -0500
Message-ID: <20261116052721.14467-1-xinsheng.zhu.ny@gmail.com>
X-Mailer: git-send-email 2.54.0
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

cx231xx_usb_probe() schedules asynchronous module loading before
creating and registering the media controller graph. If either
operation fails, the probe error path releases device resources
without canceling the pending work.

The work callback accesses the device structure to determine which
modules to load. Since the device structure is devm-allocated,
a failed probe may free it while the work is still pending or
running, potentially leading to a use-after-free.

Cancel the module loading work synchronously before releasing
device resources on probe failure. This ensures that the work
cannot access the device structure after it has been freed.

Fixes: ab232e46bf01 ("[media] cx231xx: enforce check for graph creation")
Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
Changes in v2:
- Add a Fixes tag.
- Reuse the existing err_video_alt cleanup path instead of
  duplicating resource teardown.
 
 v1: https://lore.kernel.org/linux-media/20261116035159.40755-1-xinsheng.zhu.ny@gmail.com/
 
 drivers/media/usb/cx231xx/cx231xx-cards.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index b0941cd2a2d8..e24c2999687e 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -1533,12 +1533,18 @@ static void request_modules(struct cx231xx *dev)
 	schedule_work(&dev->request_module_wk);
 }
 
+static void cancel_request_modules(struct cx231xx *dev)
+{
+	cancel_work_sync(&dev->request_module_wk);
+}
+
 static void flush_request_modules(struct cx231xx *dev)
 {
 	flush_work(&dev->request_module_wk);
 }
 #else
 #define request_modules(dev)
+#define cancel_request_modules(dev)
 #define flush_request_modules(dev)
 #endif /* CONFIG_MODULES */
 
@@ -1900,8 +1906,10 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
 	if (!retval)
 		retval = media_device_register(dev->media_dev);
 #endif
-	if (retval < 0)
-		cx231xx_release_resources(dev);
+	if (retval < 0) {
+		cancel_request_modules(dev);
+		goto err_video_alt;
+	}
 	return retval;
 
 err_video_alt:

base-commit: 48fe5a7834cc10081887d7bcd9ff0a4cadc3fa8c
-- 
2.54.0 (Apple Git-157)

