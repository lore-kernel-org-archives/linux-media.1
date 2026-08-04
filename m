Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4EE47045B
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 14:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785852674; cv=none; b=Ku4s2A2cRh1SqVamkpmz3j0a06MCZCjM3KenwPPG65QTHpF3LkbLMzh6DFAQqk2gnwuOIt8zQ0ItCBnUKH+nfj7MJXbE6v4xW+NtJAO9leDXVXcbmcXJDX7k9QgGDVOPC1QNHS70x6aIQu7Gp/2klNOLu1bjrNFYt8zpZ9PXbaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785852674; c=relaxed/simple;
	bh=2luqUJM4mc2+5DxEEi6GcuNREqLUXAgtLcwuEVDveZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DgiqcWqz4sDWs+rCAA3hfwpwbYJRuz0SGf51y8QRy1rO+HCStBG/tflHyPx4HphULuD5FyBz0v43ldyvj8eDNxNbEB4uqR/DibQUnjzvgofd7uTnL5n+jKkpnTBRlHu36dJCtpVDiAyYC1XzYX+0txC6ywqDVwOlzoZgFpP3myY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pNWRd6yk; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pNWRd6yk"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-caf45fc5202so3280599a12.1
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 07:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785852668; x=1786457468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=95IHI0w3W2JQknsdPnGS1ocyntvOOPtTyIFBtv4D+oU=;
        b=pNWRd6ykmPSgRB0QWkjgbwZyZmdhRlq5JG8kA3xx1VDzOmNxg/a52vkEzye3jZj1Bc
         aU/lpSuhIIcLXc/A4FiUNS5N12yOA3z6VEcg9JI6Crw2YDssNjmgOUWatcdSaFV0xyQI
         V+bv34hQ2DtE+W4Cc5efx1fDxKSl7YYlF9B2W8BadHCbW8oyL000y6nIg0J5vh7IUPJV
         RihfNEbboDMltMwVYxPWYxbP7pysVuCYi8gVfjBEuuPzZPvbdXyJuJG+A6knZBjcHUd4
         DVCZpz6sF1FPeY7TUMMZhn/W5aW3oZoNXjmwzalL89GWGHPhdPV8zxzTn0N/NDcLD4fL
         KF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785852668; x=1786457468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=95IHI0w3W2JQknsdPnGS1ocyntvOOPtTyIFBtv4D+oU=;
        b=Q02tuIpMhHSWA1lB25vkXKdlNtcKxFsVPKcTrumjFCYAI3vm7hvSwxXpalo1MFUq15
         iXA2I7ioJtEMXVtfA9D801ta0hxP29Sc/7Igc7IYbtCURVh12vKCe6aSAqDR8/VcUyfd
         K7vcnMH87OEwFLCC23KwljGO6+3los+2N5TUnqdG55WiJF2luBcguINdscs6XOU92zTc
         WU/tNfaK4NI6XeHqxxQRr5XdZbQmkQg2fPv+2+rAIZrr6QJCOPTq+WvH2RelrSf4ZZw4
         Ab4faCgclg8oqSNoKNbRQHQ8zYP0RjSSqnNn5yqUaj3yurlKqigN2FhegtpuvYYOeMIo
         V+Lw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7u0GZVXU14DGkNZmUbX33c7U4oxdqt/7D8/ckP5zWbk0hkCchu3YskmWrR8JaXo0FRAmkWldElMKd9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqRe9sM7THwMqzfDdryM8cG5e/qxAUDdfQnQpDP72MTeltgTUQ
	x0ba6iIP33TlTIINqZ07aDieb95UFUJ8StHAdyqpdb3SoVsoGm3WVeY=
X-Gm-Gg: AR+sD12eFOT8lCJ9YiChGcXcWoVZI5AMMYwt+E/33CZrOgVgWjIoalWNCtvimTFCclI
	XpwqLp60sQ1Hwm6ua9GndeaoJ/29ljYdZK0U7U87pdZ8n7GAQ+sv9UHXrU4PK9ORskwGtc8X9MF
	oLDmerJHvFUl8jKlsUf4H+qEWZDPN2DthmYydGoqLTaK0fjjf4vD3T3uX1ck1Jdhjep8cKRisfa
	OkDhFo+iIZIzHHovNXmQEfZyupwMzT9TnCT5kZ7zJYPL4mun9I02qB7jkpqSm54LM5U5D2DNNCE
	heZEvoh4u9wtW3kg9xd9taWsjNsuY/pHT6WPsjvnjmATPf0sh41GCDDWj2vgPH2WVH8bhadPvc9
	uKKqD861+rPWkh80V0omhyM7wA7YjFr4iKMw0XFLTUpbGD7TBScDkOVa9qCWARxE78C617q9J7W
	sBvlLwQ8XX9rGIhYgfB+lTQFo826iD6bKdffhXkDcgKPQqTaZQi1Bvo1h/cTvWwMeXh8l1o2wdi
	py6rY0WXCWwAOP7yoVfVxovpM1rZ1unsfM336NaTRBy7jEN8K8xpu8FF8uTmVwHydrqlMc9W0GB
	gx3i9s/r6H6Dx52K47wHqlk=
X-Received: by 2002:a17:902:da90:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2d0521e8b31mr129335435ad.5.1785852668344;
        Tue, 04 Aug 2026 07:11:08 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4d8af6sm8205685ad.74.2026.08.04.07.11.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Aug 2026 07:11:07 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: renesas: rzv2h-ivc: manage runtime PM with devres
Date: Tue,  4 Aug 2026 23:11:04 +0900
Message-ID: <20260804141104.38891-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Runtime PM is enabled before the IRQ is looked up.  If that lookup
fails, probe returns without disabling runtime PM.  The subdevice
initialization error path disables runtime PM but leaves autosuspend
enabled, while the remove path does neither.

Use devm_pm_runtime_enable() so the driver core disables autosuspend and
runtime PM on every failed probe and after remove.  This also makes the
manual subdevice error unwind unnecessary.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c  | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
index 355842abb24b..48f9fd818bff 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
@@ -202,7 +202,9 @@ static int rzv2h_ivc_probe(struct platform_device *pdev)
 
 	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ivc->irqnum = platform_get_irq(pdev, 0);
 	if (ivc->irqnum < 0)
@@ -210,14 +212,9 @@ static int rzv2h_ivc_probe(struct platform_device *pdev)
 
 	ret = rzv2h_ivc_initialise_subdevice(ivc);
 	if (ret)
-		goto err_disable_pm_runtime;
+		return ret;
 
 	return 0;
-
-err_disable_pm_runtime:
-	pm_runtime_disable(dev);
-
-	return ret;
 }
 
 static void rzv2h_ivc_remove(struct platform_device *pdev)
-- 
2.47.1
