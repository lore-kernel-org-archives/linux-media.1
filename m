Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636258;
	b=jPbZCxL5HcmlJgiTckXr4QOYYwK83oEjMnvUfsvZfpxKfWRU99Leu1HX+KTJO1hCn/SW
	 zdGVnYjl9o5tREhqQxDpjU/2ddw7hmggglhUmIs5iqVxVYdTMkCiwPj9mOD95P8fBxYdt
	 t6udHZdQZzeN204bZDK3Jsd1yyhoGpc7lUCWZL53pbn2/T2CtMoGOPDvxPgrM4mp7dMQe
	 Upv08gB0i53wszkqVraX5oBaCKSgPOKt1NLz2YIknqWcYzIN4LUWsNys7gpsRR7smPVYX
	 D1QlsL4hEN3yh0epbMVrjD+cy77+vaPd4NY3QOARMEchUktKbRdWh8nWm86481BmWqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jRUECku9MtNUtuZiZnRtB0skHYIdA8uwyD4cqahMADo=;
	b=I5c6HjRBIMfFhoZD7sosy9YHqRCP5aI9FgAmDwg7BeaIuYkF/DJIlY+hp1R2HLkbm2FI
	 eXwzzh8jYfqf2z7XMGcTFK7KncweeQ3+IShq2wDBDyfFgBzzAp0WJq14oKZd2rygIWPA0
	 vH7zDwR1L83hesz53UmyJvYdf8rD3y179Pif3HeE5ZtwQEKe0lsXDvSpupUh+Pd4Wxq0s
	 7T98/28wV5HCYfuDeA4TUzGcehvOMKePtcZ5Jee8GkTjDpOJtrfxKvMq1z+PF8hGMxXiu
	 P6xm9VjKBpxEy/tEBPIAc5ncAPJJJ8xKq/03GJeswr+c86h7UKZOjXbSG5JudWVWntw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PeJMmK5U;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9628A606A68B
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9628A606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PeJMmK5U
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4d198f1a591so6134223b6e.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636257; x=1796241057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRUECku9MtNUtuZiZnRtB0skHYIdA8uwyD4cqahMADo=;
        b=PeJMmK5UnDkZv0UhbpQq/aYEqbjZ0N2Wl9eU4Siu7VFoKHxBEOfy7+/dKRSzUs5bI4
         XLVtFEz7dpVTaMfAbbbAybkCDOMSfpmmk864UnzSR49/KyaHjN0fW8TwOdj9i0igKFAE
         RvHiM5NQOxWdt2SrgKthqwAKJPJX6GGmzX48zsB6tzsXRpc112Q5ChiOJB339m/s9Ca1
         1GdzDaNjjk0EQewwnWF1ZGw/hAc2eykpiGfjEQSyNrMGvNz1nqrvGXmYN3pa7mHG4vQN
         ez55JOZ6dnri9N2g5ZpTyR+7hxE/Twfr+k+iaL/2/vqabdALZGY77locYgYZKog+XsHQ
         iNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636257; x=1796241057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jRUECku9MtNUtuZiZnRtB0skHYIdA8uwyD4cqahMADo=;
        b=p1k3KdHR86MZ+ciTk+KfNXNeD3pJ1ixSfSsv4Tv2iEteG30r2F8d0i5epNXJE2e3Ou
         0f9EC++SeAlLNCS+yxJbQvBl5S4jQx9Jee7zsIsdVyGp2hp3pqyLm6w4v1xDIUWAEo+C
         vo3jvRvX4GKYkzY0ofjOfugFSBgLR9/9PWzbkVh9xdw1/xR3yMGx5W3GYRDsCFZawbdF
         npPU396frGzWna/G5q+L0TQVrcdMz6wNcyXh0AqydZavlF5BE6cN14dgru9kFRsIaH5H
         xN+xju+TlMVF9fIOZBZke7ZMMLTAUvGiaJe3qi26XKuP5kOZtcygm4MuvusRsgxYn7nw
         e4tQ==
X-Forwarded-Encrypted: i=1; AL+hErEevISiLWrdfWsOHy03DafPudaho8OdbgrlxE17bSmqrzHvSw9KEdPOfiEd2KgUGPAVXVEmiI/JQ+Fk2w==@vger.kernel.org
X-Gm-Message-State: APuU4Z82IqE3FuQqmu/ehU5d0gNG7s6N4mB4W4VFOxPIBbUBe0g66X8m
	uF6TXnZ3GTVfLmTa+9NzIRQsg7vXgI53jnWkTxh6kRP84RgijpyzoRo=
X-Gm-Gg: AZFdTZfx/gdSWZacgkju6CPt52pD6WKkZ+t+H42oNYwAuYc8aXq83Nvji+Pmj1gateD
	3mrh/8aUQJP7gIMtU0YWfFa16dVBw+yFrAIr25RVrQu09SK3PRwMGde8L138y7ltGkCPca6v7ZG
	QuW8TwwYVK9Bad2seCSWMsp5kuDNRfEvd1nVR0PirdcBM/Hn5sMnoI7wDvZCe6Q8yygTRtAizWt
	1Tw+Wx8o9GFR5Sxs2KdnIA7wWko6rHOLdINj+C+48kGGRgWhayWMntwfcDZwJHcFEbgJZIZAkX6
	twv2svULfue27q8NMnklaYmwZJlRHd3e3AK8R1iLI0NBZ3EtoBYLwSGfyQE/NrkT+lpUwsBc4ls
	xG+ocGTAND+7S6Awrf5xFSJjiwXjIFvPZGLpEJlt8ibr23O4qU8nqIx7SH2zCyYfOPWfpMSyQu7
	eI0GsK8AhQ5WLuIryR5XxjIK2js/PQBoXy4b0MEZoTxEIf/RJG9ExSBplyiLT/rMBPe+V5v/HnZ
	uLMkC0P8ltt50ecpsgA5YTOD9DMlWG/ZPDbIwaWRccuL1CiaNnPrX7ChdknEstnnZ988W5QbPyi
	v4PkFtdAYQt6+9HKISMXap3s3jAaUaLZKMFZo8wdLYkf3/jgRofATJut
X-Received: by 2002:a05:6808:c123:b0:4ea:b0ab:b753 with SMTP id 5614622812f47-57a0b44b2ffmr19514343b6e.50.1795636257405;
        Wed, 25 Nov 2026 11:50:57 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:50:57 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 06/12] media: tw9900: power off the device on remove if still active
Date: Wed, 25 Nov 2026 13:49:45 -0600
Message-ID: <20261125194951.19072-7-matthew.laux@gmail.com>
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

