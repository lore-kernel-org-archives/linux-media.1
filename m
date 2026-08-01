Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1553B42ED
	for <linux-media@vger.kernel.org>; Sat,  1 Aug 2026 17:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785606851; cv=none; b=nzOFdD9lb33kUk7KZFiW/1i3dbJ6texjCe93/zGABOe/7nrQceYpA4TC5ihWDy3k8SoekxsiQ2OnBYrVhDpFC8XlFppmROWEnBetQ+LX983liiP9TKuXGJCf5212/JjusEkgY1SXluT0IL08MgU8Y1wsSF1/T7wA91q018G77NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785606851; c=relaxed/simple;
	bh=C2ChlK0EmTYSCO+NYifbBcaAazROaRqifiRGaty8iSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LKl6cSflgBtVAyhOaCECTVsSTDsht1IZAI1/YtONuYQJSOJeNLsQu/Vua3akEnaIYi6UAMtFyNSJ7SYSPrwlZ43Ywk9MDy8F4lHXznCQJxWCqTo/4EkIr33GmBIPfEU7FSihbEbUyBtIItKGUSc2ZnxTxjlMqep8jS5nV3dc5W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KL3pgWDt; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KL3pgWDt"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47640541585so1503708f8f.1
        for <linux-media@vger.kernel.org>; Sat, 01 Aug 2026 10:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785606848; x=1786211648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JejQQUr6GBKitgZNYyepmZDoDmnt3C1c4jf1CfArh1o=;
        b=KL3pgWDtcjH3zUGED4cvGUHWJ4E+nA3EPgjmzam+4ZNvWGUJwLq9D1efC0iXvy3i+b
         +/K6l8OUSj8ftDpdR2yqCvERhP99J9mP1FArp9kIYDkFMzDEE3KPEmd2kdOE6Xb6OdcY
         wpyxTVuoUmxJfF2Ce3OPjJbOhb4FoaeN5OWxR2eDKjHbMABykWIlHeUyWbtQK71Ia+y+
         rCdQ4tLCKLVzRYpG2mQAJOZUx7nbaSKYCHnc5I2dlNf8fweiAhm3KUBGKkvYuwi+7zJs
         YXUrwG307YZBA70eWWj7QfEzgOyQgyO7cZKwI6gRbWR1ZAN+Kqfjw7XZbA0myBLWwf17
         h9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785606848; x=1786211648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JejQQUr6GBKitgZNYyepmZDoDmnt3C1c4jf1CfArh1o=;
        b=WviWEp4DDHBWjcrlbMsJUJD+aVXScBI3HByvoerCKn2KAPoJLAHLNBE2cygQNSqSpj
         1pPGHvsafzT+noYPOQw3C7q/Cb88w51KQ/x2d+gn67HzfmB3OY6dlKGmNVKOwoFY2ZXb
         gVOu9my4smclPHvhCT2VPX2B6Nz2pzOVdj6IsONTheGRuBfIe1fcBLlOVzyaYZOn0jR/
         iOwnV0ckQfAvtYCMLPbxSRX2TRGzGlGAxE1INXr//s5kxZwt++zmWdQI4umBv0q+SjZv
         TIjFxtNzEA9d2JD/CjbD/qoHqbJx13+zbfLZ8kB91YC+sBrFMKuOjXSOu6qksvtzMvNy
         3LQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqldOSKujsxVnLWOSGrG0dMekaMhtyKwuXwBzPgAdX4Zvn2EVK4Zdw+Rr84DgsvP0awCMPKVwp9dUAPIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwO0UthknSMf0dE3xojA0u6uuV7+jJt+KZPC/46B7JxZGGDBsS4
	uaGdqNEr6ljRjnFB+rlFhkwg6QtNYPig4SfZZDIf4jzCMIri0nzbjVe6
X-Gm-Gg: AR+sD10BiuxEAVhCOW38bhAWGYU0IZoUSqscHUYX+rs3rXSDK1wsZjSR9c/q2g82BxR
	WPfuCk1KHg5btmGLxQ873vvv2V6Ovz2UjXycW8LCIsJOVogllEPpdNdOfT+x9E/7UEZv1yY8GyI
	y2Z4x+URSSU9FRUUm83ezn95DNLajSNtvK6ZpBcnmUhRwE7aZ2sotRacJFWaRTCoWHAHl2gTXXR
	QRPiyXWM6/L2ycfuTqs5NjAkw4T8FieqN8MIB8c5oIHZV4PbOc8Hshij36r2wxCPt0VSG7REREz
	raVLVlJsOf5TMOhrUqCI+0x0smh2pAyvhSfsN1a7I0Kl2N7BjDeWinlbm40n5dLfOVkNl8Jz8Qy
	Zf3GCriAlhL7lbkW+03eMAZYuljZhz/Wro6xtcYnANajTLHxRGYCiCbfwBtN2sXhN4LfFmK3/uB
	fcLnLlpTJAW4YkDMHihQLCgSLhTgiBalZ4CwbTYSfquS50yjLV5kDvDCSuQwGdFDrHp3i5G0d4N
	RvQBXztfcXNEaOgcOToSqfa5dkp/YDc/pqgKL/vA73iuXwtHFct
X-Received: by 2002:a05:6000:4613:b0:47f:97a4:f121 with SMTP id ffacd0b85a97d-47fd72f1a66mr9297171f8f.30.1785606847642;
        Sat, 01 Aug 2026 10:54:07 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1240sm16699838f8f.36.2026.08.01.10.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 10:54:07 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: mchehab@kernel.org
Cc: corbet@lwn.net,
	arnd@arndb.de,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] [media] marvell-cam: fix unmet dependency for VIDEO_MMP_CAMERA
Date: Sat,  1 Aug 2026 18:53:54 +0100
Message-ID: <20260801175354.2501615-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VIDEO_MMP_CAMERA selects I2C_GPIO without ensuring
'GPIOLIB || COMPILE_TEST' is enabled, despite I2C_GPIO depending on it.

Let's add the same dependency to VIDEO_MMP_CAMERA.

This unmet dependency bug was found by kconfirm, a static analysis tool for
Kconfig.

Fixes: 67a8dbbc4e04 ("[media] marvell-cam: Basic working MMP camera driver")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/media/platform/marvell/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/marvell/Kconfig b/drivers/media/platform/marvell/Kconfig
index d31f4730f2a3..ab58175e433c 100644
--- a/drivers/media/platform/marvell/Kconfig
+++ b/drivers/media/platform/marvell/Kconfig
@@ -22,6 +22,7 @@ config VIDEO_MMP_CAMERA
 	depends on V4L_PLATFORM_DRIVERS
 	depends on I2C && VIDEO_DEV
 	depends on ARCH_MMP || COMPILE_TEST
+	depends on GPIOLIB || COMPILE_TEST
 	depends on COMMON_CLK
 	select VIDEO_OV7670 if MEDIA_SUBDRV_AUTOSELECT && VIDEO_CAMERA_SENSOR
 	select I2C_GPIO
-- 
2.55.0

