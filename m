Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034598;
	b=YRgXkCNe9jsvNxv0NU4pzCYUuCPBfKlP9jTJg41ynKPvGZIu0/rRnws8Ixv1Fc3luy2U
	 nwHL/PGdCU2vOJd5Ri7XbC0kXiqhvVK0+bwMj0fqgXOo3PmuSKJFPf4KxwzbSOFw01PPd
	 0SpxQfbIxdbFviaO9kqakaksIOhKnczKrALzhhPUQd0gCwgvsc5r83Gk6uFGsDlWqL+bI
	 In2UhQy3jHUm9wp+oon0+gjPozOw1Kk0Oz6mgyL3V9TcoHq740zcSVpYStNWowaarcjvS
	 CZhtg+XgROt3djLc3vP91k7+yCoM2lfwAnTTZ9bHXD6U3khzmoyY23bIBV2zqR9lerA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
	b=gTAjvqxWB1LzB7kIPBekWx59s+J7o1ZXz+txU209LS24DtWXTpZElv0m5d2PXD1GLWoJ
	 Pd9Vgzk2tjV6+NuCIfXHFZcRpVGP+SmCb6EUoCyiYLHC2usbC1SUOgC8BM3Rt95K4n8tR
	 T076vFgSiiikzaQvlnsDcTEt21NV53zdZrDHvmoj0hXqICTdl6+FLuiuihvvX4yrs7MKz
	 zDKip9a2/J6h1EIMRnuY9+CKvSYeurvb23+36OWZH/rF27dUQgtmV7W8dIJTukKVn+eGc
	 6dLo0pz84R1mhWS2n6zmYd4nO3NhduBi+PomYS7ArAZhVvKTHfrwQjFXf3Y4j+2HTEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3SNVihf;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B8460A260A
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 20:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27B8460A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3SNVihf
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-86298f9267fso839041a34.0
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 12:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034597; x=1795639397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
        b=R3SNVihfxosdya4BpNs48QSKvWwACcPI1QdYA+imYnGUkihLkyxhhvCimw6O8EBdu1
         RoRoNJt/ABTB/P7ibw4pyzPgoDQDBm7XRWecTx+IourMSVseLrnGSb4EhqpcAyygpCZz
         36xXh5LnHR8+RG/oLtd5N8yn0cO2l7O7cLkB+ZcEOkVaCb8C9kshmEBF37jxlAdNkNi/
         YQLJ+zgIuErYhpooX0LNqysFF8WdF9t1VWeY4IS+tGwipY5SjVFvRx/nLoAqdeNLZzeY
         80tGuSI+UJCBVwEzkUXzacTfOGhPbI6JAZ731dYMr+4bp/jDEzThTWssR9Dqrn2uMzHg
         5zlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034597; x=1795639397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
        b=vSdxDPF15ZZDXj/SHPXULc6yruQoIFyUpAeYcUiX9sUFoSYCVoOeeHjSGEFXBpjni/
         tm5SbIxa4OmSs8BrM6il0nzcOt77dB+RoJK7hLp7uduoYv+peF3CHyp42nMnrG8LVUcd
         dfi4IQmQrXk1uQ/lVDRZHlzaDLMOrtNCGR/LKH52FRu8O56n2KICZzSeNktfjoafOXQw
         OcmJzevfIhclshLtWsA43PpJD9BGg1OM9TKtNQ1Uai+o+HFcftjXfR+isq/8fIqXIUHX
         M8BXZyHWOiizhCYZ93dlc8RZRnPOBG3jFYVcnEgpADxYrl3T4NstBJ6soBE5U8K2pXUf
         yXww==
X-Forwarded-Encrypted: i=1; AL+hErHoINkPqUf7XNmomXrbdMFBycLaYNYm0lZHrEhlOZ7e8iH4OdmXKOCi9EIueOy4QHi82kIyWBhOvdbtGQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Sl19NrKVX+7P+wevywgC47vQyHJ3pB5X8uQsGphBsnd4JdNc4
	7HRAM0c5MbTK7ehmMSHR+bcZd49DbX4rekor6nQTFg7jDZ9MYwTCXvQ=
X-Gm-Gg: AYBFou2aPbajH4AfrHZ5ierEJYFzQDlgcVt6Hw+tdXpDrncX3KUAn1AU4vnOvLt6FOX
	XZ6wEmF8vTLxDObp/ibpSmcAqqGHVk/WyPF2fOFhAmPrzfK6iZBkM+6brK8ObyzSX8+h8ZFHoEh
	yVqamnexnCESdDc9RrcTaV7mVsHhb1MSc5A7dEtMx+SYnQUZKo/HJ5JSSuZ7eXl7alkPg03BfoA
	Bf6qJJXQpQ8wJPEmexCFdtdW/fvB4IQ1DVxPFbkgXTag0St5h8q9gl339gyQ5WQ0jCuZram1l4C
	yMzfmhL+WXTlGnZl31wmTlOM6Px8S4ssVPCjpBgTfl1vb/JzX8RVX2GPX7URC/vBcDBwYpKvn1J
	sO+d/7XgCkqkajl+N+Gd+vsiWvK4FrgS4SDJ3vBIcLJiZ3qrSiRiIwaWwi4oMNMb374Zkei4QCm
	+TRK+oUn5/qiw6dwrfvGYLTKJ9GlAD4MPIbo62Vqf0vbdVYAUHl6F84whPzpYtL8luG1gZN4Q0R
	EFuQDYMUJuKa0yjO3wkplbwN75eaLx0XUhZx3/k2DEK+PKIcTfVjn9dRwjWB965RXGTM0UYBb79
	V+7XshT0D+ZUjkpP8wl8Q200T5P+YbF1ho/CgWU/Z4XwIbjGTVMDvCDkZ6ZXdRYAPGR7rvsO3vN
	PYA==
X-Received: by 2002:a05:6830:3115:b0:81b:a5f9:3490 with SMTP id 46e09a7af769-862f0945a28mr5074276a34.24.1795034597066;
        Wed, 18 Nov 2026 12:43:17 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01381f5sm2764792a34.3.2026.11.18.12.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:43:16 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v6 1/8] media: tw9900: Disable regulator on runtime resume failure
Date: Wed, 18 Nov 2026 14:42:58 -0600
Message-ID: <20261118204305.28268-2-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118204305.28268-1-matthew.laux@gmail.com>
References: <20261118204305.28268-1-matthew.laux@gmail.com>
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

