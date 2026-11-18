Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029718;
	b=eWMl9yR6aZ7TWBxTzYDsOow02L3UK3m2bE8LzAfPUAeQHcbQdFTi7nOpMh5GDQxOjM4V
	 a7M8ZAK+81a2yMPK6mtaMYBu5pJwRxWhj83X6rIC2c8AXL31fShVlWKf7HOPRE+6W349G
	 GiSZ4bqXSCKdNjYeRp3Ta5ETEd3dIwdGZSd+idOb54GGDRhbIDPZDnqADEIvvQLXyAufi
	 spY/1PcJsYsHcg6iW/m+bcl2aOTVoYIGvZuG/PRcVP1tIsl/MPPMlOoWrjuTY/HVielqQ
	 zRnIcRxNQ7n1c5U5S/ecILq2a1XNYLiIVGmlgE8R+Weszl+yKXUg+uvxJ56ECbnLnCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
	b=qWGD77vZ6FsBUyLsVde/606PTpXCPfzexzZY/shvyV1sITpW3DvYfBm+QdjCtJ/v1ODj
	 O02K/lPG081pHby2/EG+jrwk75YQu45UMr5CVrSSCL3xu40JDyCC/03ienShTjQ9GF0Fw
	 V0SAbS/94SUu3+B80HTqbhExWR5t1B2erKm36d1poPwiIg5B57ZfG/jC/YhJ97kBEUvGf
	 xc76yylPyQn9R6+i9WtquSm4aQ1XjgYTyMJBWMl1DfQkS1+WFVjtWc/AuxVCmOOOsjFj/
	 BWTfOtzR6wTuwAoJKb8laoKaaS4fV/5SwIUqs1v+v5nnPwzTZchJ0KuZfeChzOY5ieA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yI8HTaaa;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8100E60A260E
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 19:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8100E60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yI8HTaaa
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-70b875f6f1fso1213580eaf.2
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 11:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029717; x=1795634517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
        b=yI8HTaaazGJaUYg5WhDxOS7Rg8PhG0gAnpdax7E/NX3/QKoTxQ1f1JXiBdlu15HonI
         Od4XBKu01ksjpvVuSK5CuVuhzVxj3mDdcdu0mucQfJ7rEZb7oSbZhLsJmBP4FjRdXqXn
         R5Q2Nj+BVrXukRpyECJEO6eTdFowg+Jr/KICVdHNK4GK7+6yvnzRota4Q3DNEaFdScB7
         2ADwqejrlfFjjCP6+zV56OME4wnxrEJcfMyBwMTWxwoRvp8SY+nSC9Fn90EhDxFMGdTe
         6RuIHpFNBqVUjEHi9rAnSAhOVlvpBcS74RwIHCFoKgSnhXfNKdbsNDsEpzF8p0+HQJVU
         i3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029717; x=1795634517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
        b=Di2BiqpTHq8MHp4ydgFEqLJlbsy+vezFepzKxE7Ffcn4/qqqCQ+6ngPxo9XMgcLWfj
         vLI+zuxttKxQ4s9tERd8f0rXIDSsPLL4+WqPRebdzTLKgQOcQ3Kt1KypwqDGoSBu6I8z
         uRqnpev5HHGdV+Zw4hpIg9KMZjd7NKNB74wcdxfOBQFBCbY2o5T78A0VOkeiusnvgjXq
         giyaCETn2wcOzIsRVUnNTbbykrnJxu0EFfauD+2Bh/c+ntMz2KolbjJze1p1ryMifqCI
         j+5Mhydt78X36YwLCiBzPv/FjeYHR6uCMDEDirg8hon8PBP30jV2sdHn/mBN+U8P2/RG
         eTVg==
X-Forwarded-Encrypted: i=1; AL+hErGWFEawcJ8JCRadKcOJ6mt72RjeJlorl3JF0rCW/32jaorJZvTD/3tFL9yrjFuTNV8Ou/nfvKPYEoNMsA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9jSbJxJFLBXRxWUh2eVUzDfqDc77IEqXv782C1mvlppRDUsZua
	4wx+xX3j46Xgs3DVq5xfdoz5dcnbAc5ivzClGJiqHN4+TTa3TGoT2GM=
X-Gm-Gg: AYBFou24jWvCk85oU5wCtTy58KqDQUvkKKU7amNaJHMAf4RVQLPpMmaL6PnfS26SNi3
	z5T1ZBXHzCippLhVojbRTIAVEtmdnjJogF1GaJ/rRkpOeeDrY5iPDi7VYaUlOR8DTD65eqOcsug
	wU8356KjxGjB90t3ddF6b0sCEpijm8YcW9baBpwQvwec+5H+YyR+3kp12TGHqDE21c4BqM8XRsC
	TrWtxMTJzzFH7j43jbZXasIFAPTbCbqGWBJSKzHqX0bbhFIV35YIl3antqTHSgoTybB07nN9pUt
	0GcEQduJpYYRb53rc4ukA2kU0x1yhQhNS0cQakuvOc1SzJ3XFF+AIxT7wTx0zwL4DS3E2t3/d6l
	sRAGm4FSqz8N8lYsPPCOanXySyZJ6fXHPj+u/4uXl+QqHdn720IkUoqShmQPf6RIn6beyoHnrqt
	VnI9KZGtZtq4ao9alMKSBrBh4g3tGElG8Bb5zQXiypBsDjwgzEd1wdjJYM1m9iqDwJ+U1eB9g/w
	TpiQzyqzPRcUxYWMB1qWWLtbHH80LNB5/huz1FGy/MOQNB6rUYghu1X9cVD0TPLewTBZUJIHpJ1
	PlrnNACSkbnLv70M9JCe1LAq+SRYFhT9qUY5aqkWQPvfhNyfFjA7t82O
X-Received: by 2002:a05:6820:7085:20b0:71b:6f9:2171 with SMTP id 006d021491bc7-71b18785a50mr1982499eaf.62.1795029717243;
        Wed, 18 Nov 2026 11:21:57 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b195c0bafsm2376912eaf.14.2026.11.18.11.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:21:56 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v5 1/8] media: tw9900: Disable regulator on runtime resume failure
Date: Wed, 18 Nov 2026 13:21:17 -0600
Message-ID: <20261118192124.23330-2-matthew.laux@gmail.com>
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

