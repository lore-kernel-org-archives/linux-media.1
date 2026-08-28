Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F76390222
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 16:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933713; cv=none; b=OzbFIfg/O7pwuVHUFpIjfvw9rdCS3E7ew9TSIMoF8aLNBcjUwFDS1agbPVMMtm+fGXhxv0THnEuqvyOp5LEVRbwnDmDy0S91QmM0CddSSaf1Xk3gxgTlLvhTOofRRRtRyrPBOsA+Y0HJYd2cGOUci3mP7tPubwMtTMTDBKIWQJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933713; c=relaxed/simple;
	bh=GY/0GwAYKkdGCB2mGjNb9iNJ3uZoj4B7s9rKLLBlD0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mU//DRDXoDqRnX7sj9OtI5fmk8lB5Z6upgF3mQQX1XQRX2rvmQCh4tU9YhaqrzKwhcs5GdjRyU/Ji2s4Fr18oQHmZtks2C65M++cMhIxKgfQc8N/MDbUepl2ANtyE3T1cDLFb2g28aYC8x22jettLhNB4WaOzcJtcNPooXTfxUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ap5BUqPz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ap5BUqPz"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso10289135e9.1
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 09:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933711; x=1788538511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=Ap5BUqPz5lPNAQb916MwW5jA/j979IHnJu5nQ24b77gmDBrQPXNo2CXoz8A2b7z0aM
         /PJW40/wK6Gzt7hcRFJA+D65KZh3LDM0a3gA/VNKgwRvK/+IOOVgxql6e4Ftd5eorTZL
         Qf6+y/dDMNJBHy9PwfVxD8xK3WwjNWaiCxWTJgzTyRHAbSmIwmKn54J8RqgVC2ux0sD+
         B01ZX4kZJa9YuSUwUr94i6UeovbmGt13FqyZDaFLixH8Qq9L7oGb/BvKsBduknbxYsjf
         0mmNK3eIbkGWAQEsYh47e6nupSQHKB6kruq+fJUdFBTBv0bt+URrPZJKVbjEP04ac1yv
         HDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933711; x=1788538511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=Vn7QKVaVUy+WFequf56w8pg832wXJByWtXWwisZxc42HR7Bz2tuevr6bUHJxbA6CfR
         maUg4hl8pnvEQ4G5iJv+8O2gzHj+534XMqaryOOMOjHqvJEkI7p85mYmGMz28+7YCXWS
         VJf38/o+OveD6hJTac+hMerWodkk+/tMqrHhSAjERknfQwtP1SpnP7RvVGGrOVkJxPOy
         ZJiBllF3Jcx3bQdK6pIZmn16dpr79IJt+XX6xz203KvCLhEhLk07Tm+hVxBtN9aqmNeH
         fcDjhfuVfgGsR1wEGhxkqZ5JH/9LrCteADtPn6nJ2sPlgaUxdRsoqIzU7Rl5/W+39vGD
         eyJg==
X-Gm-Message-State: AFuF++nxAdvC/jYaf/gPcEdDxWxF6BbIaH1R7f8LGNb1PAr/96ReBm9c
	FleH4hUxFzHKoilQUuKBLvRBoFXoB/9E9QSXTLZzfHpU8CKVFqH2sO9kk2juGR4q
X-Gm-Gg: AR+sD113012sVYLVPNvaXQxg0vrvCcMvbAdMAAMMMYw0AC9t8MWdS5ZNN6sO7i409/R
	61JBMzO9DMVVYlZ1YS/YLWaJE6xEFrGkPt9Szek4PyPBZl65Gi+4wsGgd28wxgAi6nip1buwr2n
	RxA/KhBltifC2n7xd2qYj5r0JP1A9rH8BGEjymw6jillWzk5vAqkiO1qgWjXpa4WqgeKv6VyxSp
	tTzuSjT2fRRtO6wJQW3tM7EdxWRVlThnK7GI0pntRS8t2Dc2xD5t22MJUOxFPPxLcvTkZ97JYXN
	BXxrZvmxatje1ijD5azc/XqPxQZo6ANJdvsMqkCBqOLmO0LgEUPWtMfpwNKiUsKO/RZ7AZsGHi8
	CYLJU6GSFBVgcG3GO8giC2QahTzC9DotZIQKcTi+2zLcSduSDehd84twLiI7REwhuJiTVjGQ3q3
	MAsh+CcUzd8lzm/jpZZJTDqNNm0jHyREDwlqLnZaRfFHI4GiGJWtAQnOUsygOJRxDFCgGG5plC5
	W7uJoVoedv2+XxgcL5sHtd400It7XMEmfjU6utLeg==
X-Received: by 2002:a05:600c:1c0d:b0:499:a5fc:207e with SMTP id 5b1f17b1804b1-49b91c338dcmr143772225e9.8.1787933710585;
        Fri, 28 Aug 2026 09:15:10 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:10 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 04/15] media: ov2740: Add OVTI2740 ACPI ID
Date: Fri, 28 Aug 2026 18:14:46 +0200
Message-ID: <a04beb60575ccee57bf0a6079473df7bf735e145.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
Add it to the existing ACPI match table.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 8f0ad5dbb245..18bb3ac9701f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,6 +1462,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{ .id = "INT3474" },
+	{ .id = "OVTI2740" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
-- 
2.53.0

