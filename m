Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233346;
	b=gZSPDeFTEaxVPehebaavN8NIc7JzW7eketE44RHmM9QKjJqF2plYYlR0ObCnT7BVUUyz
	 SnamyCH22W1Zx/WITlU9NsoHuov4nC1RSAsRjm8AbcEzqouQ4+fAd35+1SOWwzermfT/K
	 ds7SUnI8/xa656zlgVLDh9ma0QO6wo52zgMewO3s3IR/IAo7BpRlLVvElBFPB5Xjk97UT
	 Dqi3koj6i0jMvKOw609VPYaEHvEEtGUlLd8kzGsJic4+qFyUC1BIPjO1ktWwWqSLqLe1h
	 aRbhfpYVyRurgQEbn+Lv47bFtnx5yGU4eXfnsqftK7ObHVeHgZDfDkDD2x9ERid76+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
	b=4QMnh8pQJRJRmY0HPcxx3l9W+Vb+q8sGOLdPj7/v6stuPAy50txwe9RGsq4zUz95dSP4
	 SQgtwLNk7bwXpI3x6yyHWunrZ7xWCa67NeXTgIwvVDegRD3J6yjt9KRDP3DxHgf9uBYaJ
	 ORvjGHQswmmpt+uo9IfleludX9DbF48HAjxeR/Phj91bJhmcQrEjMRSr/WjdA1RE+vq/S
	 NQhkdsU27miK5IRRM/Qk8mMbPgVu5YHkCuzjcj5V/rAqlu/S3/mzZ2C0rbsvwVifUn906
	 P2QcdOdNB9SxUHxEzStfrY64PQXmgFViCQaILtvlmLXfEaaSILi3HqYMYAgvHtmLh4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SiEljIY9;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34470606A330
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 03:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34470606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SiEljIY9
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-71ad1db7e31so1845531eaf.1
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233342; x=1795838142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
        b=SiEljIY9Mcg9FXo0sQwif4upe3XondP+ab2bFC/HoIvVbdg/GqptcMkpEJl5hwBtm4
         sy0eskecI+6aqkXhijQf3zbOX2dxdX5NneFZQ43Z7k8bIzDm14FIXMrdn67DBBiw/c09
         MWCDN0mobbKp9TG7406qRLkJSMMoh2nc4ldmxXp8WA7pwy0Sg3B3UBUk4ZAnVtIhhYSi
         234qPgqzhM1Qw7sIUIKJgbZYc/J92mtifsVyZpb8aKTrdSVVQteKXH3lOzFDfvYgifUL
         uFXJoGKAF3j/GgJIbldi4jsTg6eGBdwW5EpNio+sXh31PRKETOfeQdK5mPmzEP6kf18G
         LnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233342; x=1795838142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
        b=fW6EHD5nW+RHrEOgBZte+fZZHgjdq4wAZXJgMS3wM7aQSDT7jFTM0AANQeLQhAJHkd
         +LOtarrOJrUqwiY0DKKbcJzDl5I+cs2jtcE/oObQNYH82mTdBnZiGHAZ1rGYrz+aZ1YF
         5wnkBqqK1jFEszn8GnZBpuZR437f1Yec5ozVMCpDBs3Ag2CHTb1CvA2E9Liu5bF9kXab
         OoYbZu9G/PxJ91z+ejULWhM5RKmFclsnM/qUO4PGWa1SCpr94kf9gh2dT7We0BdXR/O6
         XlCTIxlFVxgndaBfztUGYyW3jdjqtjOTF8iRymlKPk8/X18mGECYsoef1qtFlixnPES1
         1qnQ==
X-Forwarded-Encrypted: i=1; AL+hErE56x2oxJ+KbHwV7hMVNcETI52sCANWu68cIJB/7J3WymxrJmn0h+qhRw6Fghel/e3YzO+Pyu4pTWREFw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9oD7GKoaoVt+vw6i5nbhO02Bl0G8qobifFK70IBi8ioOdZoBqB
	9cvf2buyvq9MdVqskhQ/5s/mhWd/68kHVEqdxOsEpCMAe7Lj7+xRhac=
X-Gm-Gg: AYBFou2Lergxd2ytqYlrA3w9/Ok8QLF027X4+9fl17Hnf6Bbl0tivNYrrY32toW52XH
	pP6p08kMs7DXWCkjeYtoz1LZE0bDWBZrKZTtu8G7OTsUUJkuFTdN9hOFInSLy4EkJ0yNaN1j8yh
	qnUFEnfapEAGave0DNpRPDz3FmduANtAVXVZMGZdK7jiJusypjJsKmMmx7FzQ+atb5JSzkhAy3r
	9HNqHMXa31vnf+BDEdkgGIxsEuz3dMzJ6GCENIbzrJ5ryPbJRK02+heqYjWdNK+G1dzhiQqs+mY
	2/AJecqat19S7mK8t3V6en+r7XOtbubUgXfcniztIZSuF5ae3nq1PmHSA774BbXDKkmHgFg71fm
	KMkKCleDZ2hpquabXO59dm0Vl+ZIyntoA6ELaRu0kmBs0O1gRsPwypiRTb0Un4sYxNAmpQ6NErg
	VE4umKG4PF1JVHLIBhDleei1IV4MWMt3KEeLbEG9PHLWjj6tJ0Cw8slv53HhHAcJwaeVevZ/oZ3
	r+2guEsX9Fh9vy/rd7pWjY+9f1YOBPvs4rc225DK3NDdx5QSsj/5W6GMBHCaf3HQhJZGwZlLmxv
	UKtbMRR8yNPNFDU+I5N5EopdIIyLPJMRdXrYTlKhpNli/m4ToQi1Zk5WeNWaJAXSkFZlVUo4UNV
	bWg==
X-Received: by 2002:a05:6820:4381:b0:71a:fcbf:2484 with SMTP id 006d021491bc7-71b395d4870mr2846540eaf.36.1795233342085;
        Fri, 20 Nov 2026 19:55:42 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:55:40 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v7 01/12] media: tw9900: Disable regulator on runtime resume failure
Date: Fri, 20 Nov 2026 21:55:12 -0600
Message-ID: <20261121035523.26764-2-matthew.laux@gmail.com>
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

