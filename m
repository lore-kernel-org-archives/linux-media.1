Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D87155A5D
	for <linux-media@vger.kernel.org>; Sat,  8 Aug 2026 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786180057; cv=none; b=SPgbIzzd7RXX8vANWy+ZWs6XHC7DjBq7aI3806D+LiqIBOk8VjRdOgyCiMnThcSZe8obbWh/DFTjRcDzvPvCFc48CsgTPQhy9cziHzdUQkWoARZa0/eHUmk0w3Tba9PpflIzLxjeOzPnTzTW/OedP2ZeAlxiOAR3E6QNX8YZD58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786180057; c=relaxed/simple;
	bh=Q4bH563s2NsL3ss7t9ppxk7jVRhvXmNexJ39EpHAIHA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wy+ZpTlk6w2nNgntGMdzq3ErkdEoxK+byTVE4O7c2pTS1sY6v3PivrQe/7V51HbL4G+CBLIY5C6R9nWWn7HSwW1uOb14D3XdnU8ttpO/kwQvnyt9Pc+olsbdhijWj6295O53YquxxAUzUgHWh26NfG+Xhvhdhwv88+aZuxpqeOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qP4qR6pK; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qP4qR6pK"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84830c774a0so249194b3a.1
        for <linux-media@vger.kernel.org>; Sat, 08 Aug 2026 02:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786180056; x=1786784856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jy9EgSqEwjL4mooBq511tfnbI/n0KZNIWc5TmVL3Am4=;
        b=qP4qR6pKz3/ghr0LcDglCBaCtRub95KV7nfJYdlLhnRMFKvmitjZjQhn3MhroEgkk2
         lxdBuJlrrrfFPD885R0VKWnEDkWWX9AagahtBha9W/LQNHhLqtf+hA8Uz5DxB0Pwn/K0
         r21N/n5fen6OoJ5u8Wbz2KMBBAHjnxkIhpN2qVZZwJEc0nKF9GJDBSzNvuuq19agS20h
         IWuIFwZS/Xbevy3LUloFcbVmEJpD5Jo2oS3Yq5FIVhwTtcalBRlRuHnPDb8vVe7e4EtY
         1MgeXGfCfZllFj2dTv62R0A1oGrA8XC/j3SP51volTQBQGxM/YXbZz+dNsN1QRaXfjAM
         fnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786180056; x=1786784856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jy9EgSqEwjL4mooBq511tfnbI/n0KZNIWc5TmVL3Am4=;
        b=CnYcQq+KIepm/rKrg/InrYFpyPLJmYx6JuK0f4UrJjFIIWwvINVLyIlgpzj9EnaCyg
         ouLv1hDtbhes2WlYkq8AfHqOSHnd884n4GFbaGgPI6lLTQ+hxvSfTR5PRcRb4g76WFse
         npc6NbUz98LL+yQ+BdanfBQQDkOUqdFTrX+oVAsTOexKQElhwhHXD9uogKFpvD8XYMEY
         i9vWt5D3tdEGDZhTmHM/gFpWU+znkOHby6o04CxhOdNIvrrLO4YCrpqhec1X/pGHkmJq
         B20yrkh+qCzo2LKZTiaWIddo/kN5ibEElaKqF1/j5MlYltDvZPX8pyqvyy0LwoOqotJ4
         4KcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8xgN0bWgN/o0AY77MMmNNvNOHEKQ1UKPSE2qk64saAnrBtek+6Fn0LXrEoDmCUj4mJ++9BaRK6huFWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWdme+t0AHpkm8DZCFROQY6YtiG7cunpRqRKPdCnBqRSxVDT/c
	UF6BAZWMLn8MhglvExT6z8wEBwoYGfZ216wLw0LT5RgpRv9sUfjyQnvF
X-Gm-Gg: AR+sD11JjhSAHlQgFkG5OvmmolViy43PtAA+JMkw2ss3aA/c4jTvictYP0elcVM98yW
	ctPvbXWF2EqzPOiZAQ5QtMTxgJZpZjWj3NEGFzTkTqh+b8lpxbI9D+DaWoipTRKyoVdaWgs+MZW
	J4AZ+Fe8Vqumfr8yrewXgmhhV4/UJSWJFobzJIeYqGpi8qDfpo1wtj1XFE+9RhZQ3ByztigI/bg
	4VIXjmPfFmvMWkzcsguNiErhx5mLZeBOJJ8Y3MnMPOHi2c5BTq6knojxa0YcNqcMqGX/Ige/qZx
	TI65dIQ5T37R15ehm8Rzkt5FF9rlZpmYJwjC1KVMWNUqxLtozT19M6KBrAUiZDmLJLixr7+sSA4
	RrNKMYZwRihURYAqGQ30ESOFDLWtY2JmGzxsvNlK87ohciKbvErWxWbe6YqEhSsVnIGDZdKVj3A
	brf86yVJ5T55ZFadLJLFN6qI8AnApJwPv1HG6jAboyO5WkDymVWVEmy8NVrTKBYgM9aBQFQH1+1
	OLGsOrdoosmSyMJ
X-Received: by 2002:a05:6a20:7f89:b0:3bf:a489:1483 with SMTP id adf61e73a8af0-3cbce9b63fcmr6630086637.33.1786180055689;
        Sat, 08 Aug 2026 02:07:35 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86fc7bsm17077223eec.1.2026.08.08.02.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:07:35 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Eugen Hristev <ehristev@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: microchip-csi2dc: fix async notifier leak on probe error path
Date: Sat,  8 Aug 2026 16:07:29 +0700
Message-Id: <20260808090729.2680734-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

csi2dc_of_parse() ends up calling csi2dc_prepare_notifier(), which
registers the V4L2 async notifier with v4l2_async_nf_register(). The
probe error label csi2dc_probe_cleanup_notifier is reached after
csi2dc_of_parse() has already succeeded (e.g. when media entity init,
csi2dc_power() or v4l2_async_register_subdev() fail), but it calls only
v4l2_async_nf_cleanup() and never v4l2_async_nf_unregister().

The notifier therefore stays chained in the global notifier_list while
the enclosing struct csi2dc_device is freed, leading to list corruption
and a use-after-free when the list is next walked.

Unregister the notifier before cleaning it up on the error path,
matching the teardown already done in csi2dc_remove().

Fixes: 2de0b3c0f678 ("media: atmel: introduce microchip csi2dc driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/platform/microchip/microchip-csi2dc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/microchip/microchip-csi2dc.c b/drivers/media/platform/microchip/microchip-csi2dc.c
index 70303a0b6919..59574258ab2b 100644
--- a/drivers/media/platform/microchip/microchip-csi2dc.c
+++ b/drivers/media/platform/microchip/microchip-csi2dc.c
@@ -736,6 +736,7 @@ static int csi2dc_probe(struct platform_device *pdev)
 	return 0;
 
 csi2dc_probe_cleanup_notifier:
+	v4l2_async_nf_unregister(&csi2dc->notifier);
 	v4l2_async_nf_cleanup(&csi2dc->notifier);
 csi2dc_probe_cleanup_entity:
 	media_entity_cleanup(&csi2dc->csi2dc_sd.entity);
-- 
2.25.1

