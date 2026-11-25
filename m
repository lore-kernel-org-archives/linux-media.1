Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636250;
	b=BmTVYKSSooAAfNgKwRw17EZW2RNQFC2/TXLGpfvHEASQoYTuRqxiPfVD3qwp3Pne18VE
	 uxbZnMYYf1HYyrcG4M/dwwjFIwgNgzI3m4vJ6+l72Xq1JL7Ef91mvrdQoGwY+gthSkW2R
	 4g/Q+K7zTNDRjGg0LhVri3NvDGnVAKZt6nXM71gYvnryvJNmkL6iEV0lE1hmw7TpAMzou
	 O3obrwJYW7sKGCWOS7ObTHAuCOKMXMpC70rWpASTfTJqpPSGGAfMimGJZh64V6Kk6nyer
	 jGUlLL5APIukZwgU0bLmH2lZwvsc1pNNKHsiXqMDY/xJCneKKdQCdtcVeSJj5ybcOtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
	b=HelJdjVJ923xnHfv3yka4u4d15GLXoCQlBJP4AyJYQtDeDrcxlS33qYc9QF3a3s+uK1F
	 nSh69+o9pHUbVJxJJUVXl+bDbvUcKQ96uCgxBJWbewYzBpesHgOVDPI4OgwOviXupVjHF
	 C3U3bhhZyBQAdZDPovkqPbkbUG9HCSRkHOg4zoa9OAm3mMXg3EMO5EMjnh44TZst+/KII
	 dVw1A03ct+5I1AsoGQJA0VSrfiMKtWLG6EvSiPNay/t3GNyy/lfVvGqYKFFDhu6NtH3A3
	 SgVCRuxkkZcRIo/8sBJ1Fc2Psjl5xK2z2EDVp+J5epl8OOmxziiOaWxu50nAsRMhumg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uMFW9bry;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32885606A331
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32885606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uMFW9bry
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4adae3eb4d3so2463251fac.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636249; x=1796241049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
        b=uMFW9brycKB5nr5NhMXia3EBfdsXBWscHF8PmbJTbyX2GN767i70+nu7hQTEusc/XM
         5fkL5Z2YEZlpympQ2AYFnX2pv5SM/1O5+OEBpWckYr2pJZ84417kaMszhhOLCwCHVHcT
         ub0HX3piWx/wrn2NzxoNC5CcqVxUaYpnA1aaJ2vvoBNTtqgUY0755yhO3+7/U+K3KfUE
         lRLrD3kjNbWW6QNOQwuTVia1r1HHRRyUrowwLAWHRwNIPokV46X1cW8JSaQkDYCYr9up
         DzVwRZh3o9p3DJYC4gj9NBwhQ8yddhav6J4/Kt2U749tjeFQ4z5dZSm5Gl/jnJx/G6lp
         LEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636249; x=1796241049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
        b=qZDo+QO1eLW00WRnOC00/nTygQNDk2eD2QYH5bJFp7tgfRcUTV92tnPUlHgmJnwPiK
         vGYLa2Gqsu+BeYmvAnNASPhBdZDitCRYdM1MEhWYwqChPfQFlbkaH6XZLzuTD+BvjcBb
         z0SADPKto9biDQaRUyTdibw7rpUxFP/FV+ecipM+SdhhfbkrQNECjC8/T4waHn4dMtD0
         TiatuJf1embkjTYMJJpcEFMC/gPDrZm40IOK5HrGeogqo67c7e62ROlRDmuVDZUEcS+D
         gfsC8q9zCmpnDnHBSAYD5L37spds1xpLAK+0s/oP/LoMFREOq/GS0fxdivvaZ7bIIA4b
         /1jQ==
X-Forwarded-Encrypted: i=1; AL+hErG3G1xhxll4NCgJWCrlc4X5iMe0UpOfYqb2CzB7aITd6BZrG3tmfk5eOAttj2OHbY2nl5DG1yL4Y8ux5w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9UpKBfX/o59Zgvz8ydP/d5eQL1OuLDZD8diWag04MDq9tqQdek
	laaz/cZ6RhX7OczQi08FvSi669AkyyLlMjGXOho2OCI/9zvv5OfHzdQ=
X-Gm-Gg: AZFdTZe2R+roHJtQfpQ8VkrtcmiTZZQGcpDl06lGc0t5OlbZEXoFy7EV8oVCK+tbKiX
	2G0CxjC0tJIQMQGWXjjTk991X2j5u/oO4DK2Mx8nxPdltBlmAgZC1F/vGjuQm//4EL5XRGFYMPy
	yi5R/8WeJC8RFh2Km8yqv7DMIanSYmf7ImdpaWLBi/gbfJ8Onsi24MVpJsEt8/sQ0a5704ZgdiL
	xH8NegFiuIGjdwkAD6k1ikVFey4LLmYrxtONFc0JKggrp/s1i7E+N23KPP5VpC1tEugPtFFnMEh
	s01gJVzx9iZZc37k/4GTDRbhrYFNc6CHyUtHVJAMV0ktlkRJ2EsP1lXfuDOj9jlsJXuY44uatbS
	nv4SqSWdnRoJXxg5TiN5vYR6HkXTboCOClU2HUKV2q/NzAc7CsX+p6TZr4nCu9aIl12FT2giCwQ
	UTmEkbnrALziMQD4p+YUT4DMHaidz2U7kOK9L4M0YP42zE5jUyJ9pwnw3GsfNtDi9xpswwe+Jiq
	lwj75T2vauK14S65cHymIWFY0/YRempOK5ciy5fCa9D8ko5T1k0IOUbmj2vKNhcTucW+zaf4vB4
	qrRCxw5d5l2Y4QN4izL8oSLU9qIDX18ig6FxVm18mPWq4a76FmyKCobsLQ==
X-Received: by 2002:a05:6808:159f:b0:4ab:230c:5faa with SMTP id 5614622812f47-57a089185cfmr21732323b6e.18.1795636249032;
        Wed, 25 Nov 2026 11:50:49 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:50:47 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v8 01/12] media: tw9900: Disable regulator on runtime resume failure
Date: Wed, 25 Nov 2026 13:49:40 -0600
Message-ID: <20261125194951.19072-2-matthew.laux@gmail.com>
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

If writing the initialization registers fails, put the chip back in reset
and disable the regulator before returning the error. Fixes this warning:

WARNING: drivers/regulator/core.c:2657 at regulator_put+0x61/0x70
RIP: 0010:regulator_put+0x61/0x70
Call Trace:
 <TASK>
 release_nodes+0x46/0xd0
 devres_release_group+0x11f/0x150
 i2c_device_remove+0x41/0xb0
 device_release_driver_internal+0x19c/0x200
 bus_remove_device+0xca/0x140
 device_del+0x160/0x3e0
 device_unregister+0x17/0x70
 v4l2_device_unregister+0x9c/0xd0 [videodev]
 usb3hdcap_release+0x26/0x40 [usb3hdcap]
 v4l2_device_put+0x37/0x60 [videodev]
 release_card_device+0x51/0x90 [snd]
 device_release+0x37/0x90
 kobject_put+0x8e/0x210
 snd_card_file_remove+0x174/0x190 [snd]
 snd_ctl_release+0x14d/0x160 [snd]
 __fput+0xe6/0x2a0
 __x64_sys_close+0x3d/0x80
 do_syscall_64+0x120/0x1610
 ? do_syscall_64+0x15e/0x1610
 ? irqentry_exit+0x7b/0x590
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

Fixes: 918b14a26b12 ("media: i2c: Introduce a driver for the Techwell TW9900 decoder")
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 60c102aba750..e07924faa84b 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -624,13 +624,20 @@ static int tw9900_runtime_resume(struct device *dev)
 
 	ret = tw9900_write_array(tw9900->client, tw9900_init_regs,
 				 ARRAY_SIZE(tw9900_init_regs));
+	if (ret) {
+		if (tw9900->reset_gpio)
+			gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
+		regulator_disable(tw9900->regulator);
+		mutex_unlock(&tw9900->mutex);
+		return ret;
+	}
 
 	mutex_unlock(&tw9900->mutex);
 
 	/* This sleep is needed for the Horizontal Sync PLL to lock. */
 	msleep(300);
 
-	return ret;
+	return 0;
 }
 
 static int tw9900_runtime_suspend(struct device *dev)
-- 
2.47.3

