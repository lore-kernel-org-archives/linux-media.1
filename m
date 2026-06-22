Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D1F2BCF4C
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782149640; cv=none; b=pE37qDS//sMTr6tGfM8ztHCJMdd3PPSi74Jnf0RGZ37SuK4/RYG9K4jYV0PVsxF9JbIK+MqmAzCYNBRp3eNNXiV6P9wRQ84jfWbEZ3WSyCgb/gc+jWkBjZPgcLG7+0IGQw7A5AYRLozcvutiNTKb4OUI+0+0WxPJkwDWJeVeuuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782149640; c=relaxed/simple;
	bh=UjydWJTnjoNwo9kAGxNP0B/6s8GOyWnsdWeFfHK6i1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YjNYLCaW1Zx8OrbbNJIVCf1B1t280Fop1MeIMKqFh363NCnJEqwylltINOdRYKleYQ0IAjShy7Qbi7Z8g+PfUFbOBMQTpMuKWQZqJ3d39ZZbaIzrjX4T/FWlel3XSqjZzkf2aKX36/S4bxP8qi8fkNA1GAv7YuGFNkvfmLf7xxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g16M9nbw; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g16M9nbw"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84347ad88edso3968432b3a.1
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 10:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782149638; x=1782754438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVefTgxybW9Azg7V+xbe9aantY3oFHiG1LZ9aj3W154=;
        b=g16M9nbwdC9Wj+cELrNW4F9vBfYMEYyGsbY2d/WeHz6vxp4vSVSzE16giYwXe4RQ3Y
         ekiGJNty/P9KlyfUfEad550Gj1cIazScqsrgbSDO8narABBjtjmWnwa/Ai6t3ScvnLt3
         IS3YG0Sj6pJfd5UHinrPDUvM9c4vKFYmCaKf6BS0Ty6PIgCnEk5giN6TYx/rYZO/91YH
         Q/79t6ysCBJFvHKvhwPegg45EKAaS6L6MD3dA8JpRuFNxrnWJzMX1t505UH8Z0NLG6+u
         Ppg5CsehgRl8hhKIgvTkdBChdDaChQph+1bSSCzWOWeaA82wKSQG6ErODuuLk36szSsO
         cvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782149638; x=1782754438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MVefTgxybW9Azg7V+xbe9aantY3oFHiG1LZ9aj3W154=;
        b=TpFFGFupdaEC3/wJXvDUYwZQOMXS8zflBmoMP8odTnVFM8DyOVgcvVWEF9x83A/xjM
         ViQwsib+MTeSLeljftjJ7SiYbkNvf4c6RjZhhhZ+wVYtFNCOVcwtVvNSFElatGGHediv
         br1SoAxll0AYZcfNl4pN0Q9WXghM7Q6IPmvRLAJKwOi9u5CxkRfWri53nH1VgsO1CcZ5
         0by7ylY6VYe7b8fGg/wpXEvzu5nHsGcfIrYqTGUKGDH/NcV5oSkvWBYWG8w73qxSDhLw
         zvdQaXNa5va/UUyU/StkLYMkfa8Vys4jDemPO0hfENla+BXfxzaOvO3AT1X4iwOyLUpa
         GonA==
X-Gm-Message-State: AOJu0Yx3pE2VAMEM5M5JFCV45rZPv+1nOKSqQZ8rZf01SF9ISkO1Q05S
	gPSCwFqbiWgBXTwZfj158TiJJSBcmYBJRbP4crxEMltnSjMnSkv1VdnqS443ra3i
X-Gm-Gg: AfdE7cmFhp2c9ckRKt6gLmwkzxbUcJMmukO3Sjd041uKcBHPY7TXtJNLIOnEjwxkfwY
	RTDtawhSICtya5kBZSusjy4AdUJHyI3MqUWFQIiDYCK3ufn2jOqg1aovrw1EF/F1BBdQhiIshB1
	3AaqFNyUdw2WyuVGV/bnNmtWVzsjy/Bb8UqI2iEa9Pr7rf8lE6meVmas6l4agzX2fXe9F7RAerN
	Ko8gj1PlCpHIVo6X6VY0M23rTX/8azeLhLThdMi0uggMzjhtyN+OFr9gCwpXy1Yo2wC+mNE4qCS
	IIO78+v80wX1VyXRo9vHXCuoXRxzfET9HvkaOlOC3TaEKN62J7RHOcKv5iGTxuRTXxNchc1JFAH
	HvfdmDs3dE3j/GaYC69WxYIg9KafhCI7NrihafcJSjLGbbAFw3p1p48ZoJYn2ZmFYYx6mV/Kx0U
	it+58jLe/PGehvRAWwB2GRfjrLnBKaqW9xGBAlbsAjo2r35HFfDoR9
X-Received: by 2002:a05:6a00:b4c:b0:843:2ac9:80f0 with SMTP id d2e1a72fcca58-8455087bf24mr17184836b3a.23.1782149638557;
        Mon, 22 Jun 2026 10:33:58 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ebd123sm7670753b3a.47.2026.06.22.10.33.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 10:33:57 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	kieran.bingham+renesas@ideasonboard.com,
	mchehab@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 2/4] media: renesas: csisp: Add missing media_entity_cleanup()
Date: Mon, 22 Jun 2026 23:03:37 +0530
Message-ID: <20260622173334.60491-8-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260622173334.60491-6-birenpandya@gmail.com>
References: <20260622173334.60491-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe error path and remove function are missing calls to
media_entity_cleanup(). Add a dedicated error_entity label so the
cleanup is only invoked when media_entity_pads_init() has actually
succeeded. This ensures that the teardown logic properly mirrors
initialization.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b5650..61558a71ee35 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -539,7 +539,7 @@ static int risp_probe(struct platform_device *pdev)
 
 	ret = v4l2_subdev_init_finalize(&isp->subdev);
 	if (ret)
-		goto error_notifier;
+		goto error_entity;
 
 	ret = v4l2_async_register_subdev(&isp->subdev);
 	if (ret < 0)
@@ -551,6 +551,8 @@ static int risp_probe(struct platform_device *pdev)
 
 error_subdev:
 	v4l2_subdev_cleanup(&isp->subdev);
+error_entity:
+	media_entity_cleanup(&isp->subdev.entity);
 error_notifier:
 	v4l2_async_nf_unregister(&isp->notifier);
 	v4l2_async_nf_cleanup(&isp->notifier);
@@ -569,6 +571,7 @@ static void risp_remove(struct platform_device *pdev)
 
 	v4l2_async_unregister_subdev(&isp->subdev);
 	v4l2_subdev_cleanup(&isp->subdev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)

