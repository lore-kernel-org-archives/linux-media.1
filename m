Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C543C3C0C
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 20:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783371036; cv=none; b=kgZzEdODPE6Jly+m2jEK2dyOe3hA6/sNXB99BHrR88KR07PxePy9ud5wW5MrHyD4E8fCKEokzC6Vz6HaVIa574Gu8mCW8C+3VJXm8R8rW3q5K90AKCE+5DsclepjGg+0z00CPZKzNJApTGwa6L36ItrcfsPHN4zoFjiC8C+Kh54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783371036; c=relaxed/simple;
	bh=lYd0u3JP9RU+g/tgnf0dmY/iv+hm7X9W6t3MW4JXEig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NY1M33j8jOzjzLdepxgQBg21MtPAw2j/vRVv9sc1Jv65tdot7pfywLUWhcKFRcZsDNP0aMGykEB6aaCpGegLHJXc95Hl6BdRsF5LHfWEQCy8ojxjT9iHvNnH3zXU2pJK6vT+W1xWq/xFfXInOAqxLygwMVL58GPE78SLx3IWOBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQiaoqLs; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQiaoqLs"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8eabb1a9378so26233016d6.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 13:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783371034; x=1783975834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N99FEfy3Grk/eQfq+c462kXMYwLVw4eD3SP/V1Rb2g=;
        b=OQiaoqLs3wAXfW/NEGw2t2mqWYgMklx5WFKgXpgYkIlKed/VTJONq07xi5uwl78Rrf
         t8pPGagcy9k1ynheWAR1iFXecl5US6F5jqBwWDpqDXJn3+v6IPmpQ/VhRVa052R5jtWD
         JLEYicPWSOANdyk9zeEn0pBUrnWKpn1rueZ+Pv/PzERxsCwMgB+QRy7ZPDhvIh2PpqBq
         gaQfhXEIR5NR4ljRwlOLXCOcDz1+s024/pvduwUI6CFK2jpAIIV/lvkEYPk7JLIzY87K
         3Ti9ZIbVBx5cPvyohCAyz3xWul+D5hzY4xuG1/Zu5r6mCIkHVDdR1Vff/k4Yjjq1CqnQ
         vd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371034; x=1783975834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+N99FEfy3Grk/eQfq+c462kXMYwLVw4eD3SP/V1Rb2g=;
        b=aYTlfOnQ48jIlKAT2+uPPlZTeqlGkWL8t6P8HqJ/gBwMLW7eEa591VH+qzLMzjzCLj
         rQI9sB3YtvxlefTPSY+VyTKH55YC919x4dY/laFPPYBfdoxervRxRS0K2m0Xgz3GTBD1
         2nwnSwy2N7H1LJc9OPp2lwVGDauvP0CM5iwFDzPp2rcnaGtm/C8iRORaFYjRGjQfoFyT
         4uAt/3QCUpkRS6uDOiK8iWZ+pnaegtl60c2W8Ca2N67AmvUH7WT+0aaJUoTDO+h3KfSr
         zrRKWcjhNjX6G6eUsl4GsvOTMEzjoU9w/IRnQTx26GZ6C1k19zW8hAuCRUy5AXoUaUXf
         XU8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrXPOsZABvj2jRftRChoSuSIJa8tURvu+QVJkSsRnJ7yn9YBk2cwk/GT1Pk/EjLSrfHV0iLcMSbzkRO/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa6qWDC/KTUaSUE0AfQzyrCigFr0IZnpymP+60vBc0nKgZVeGp
	lhVH79G6IZVnq4y8YwhxPF727fJf54Bmq3jd44ffAfke7D9IUI9vXwYG
X-Gm-Gg: AfdE7cl6QyRuRvEwi+2U2FyiKkr7WtRTwu5ee1ss1ukWyF89FEMp88MngIIlvgVF7/L
	U6V1QPRp6atjuCA+pLfqO9A9Z0w910EKfwtn1ewxNIwWB9+wApYJTKn1pNhMMDBIzdgJelK3QL1
	+Uv9xQpT/kX4o0hCALlrF14JpMao5uRUrr7Y6KzJv0DAqDEMXQrI0xrqMgCNIfKyBPhmp40OA6z
	bKwgxhX03WYGB90szuv9LkKt56VWbkDtRW0KehWiHdpWOMYm88AAVi+9tPk5V472Ic4fyhkLcUC
	D/5wFRKeZOeuo6DUNOj5YSZlgslEwjdYe+6NzaMxJSpJh1eCaFOIRiyShhWdHwBAeBQJlNR7bF0
	hiVG6L3BsBVb7ZdS6mcWaEtlW8J4vUdM2hgZoheWOs1gp89i5ypNOAHY2mt0HgeReiAFnZayTy7
	MJz8gYJXv2QI1+n2rqdrx9thEuE3eCd5CtzYu0pVIyGQ==
X-Received: by 2002:a05:6214:5b07:b0:8f3:b922:b54f with SMTP id 6a1803df08f44-8fcb5ea6bb3mr29125976d6.51.1783371034067;
        Mon, 06 Jul 2026 13:50:34 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46e27d53fsm145966156d6.5.2026.07.06.13.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 13:50:33 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: hverkuil@kernel.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Subject: [PATCH] media: go7007: defer the ALSA v4l2 put until card release
Date: Mon,  6 Jul 2026 16:50:15 -0400
Message-ID: <20260706205016.1400747-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178144969601.60470.6005237146425573205@gmail.com>
References: <178144969601.60470.6005237146425573205@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

go7007_snd_init() already takes a v4l2_device reference for the ALSA
side, but go7007_snd_remove() drops it immediately after calling
snd_card_free_when_closed().

That is too early when a userspace process still has the capture PCM open.
The ALSA card and its PCM callbacks remain alive until the last file is
closed, so the release path can still reach struct go7007 through
pcm->private_data and call go7007_snd_hw_free() after the V4L2 release path
has freed the object.

Move the matching v4l2_device_put() to the ALSA card private_free callback
so the existing ALSA reference covers the whole deferred card lifetime.

Closes: https://lore.kernel.org/r/178144969601.60470.6005237146425573205@gmail.com
Fixes: d5d3a7cc127d ("[media] go7007: fix unregister/disconnect handling")
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
 drivers/media/usb/go7007/snd-go7007.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/go7007/snd-go7007.c b/drivers/media/usb/go7007/snd-go7007.c
index e4b9f37be77b..01d547ad678d 100644
--- a/drivers/media/usb/go7007/snd-go7007.c
+++ b/drivers/media/usb/go7007/snd-go7007.c
@@ -195,6 +195,13 @@ static const struct snd_device_ops go7007_snd_device_ops = {
 	.dev_free	= go7007_snd_free,
 };
 
+static void go7007_snd_card_free(struct snd_card *card)
+{
+	struct go7007 *go = card->private_data;
+
+	v4l2_device_put(&go->v4l2_dev);
+}
+
 int go7007_snd_init(struct go7007 *go)
 {
 	static int dev;
@@ -245,6 +252,8 @@ int go7007_snd_init(struct go7007 *go)
 	gosnd->substream = NULL;
 	go->snd_context = gosnd;
 	v4l2_device_get(&go->v4l2_dev);
+	gosnd->card->private_data = go;
+	gosnd->card->private_free = go7007_snd_card_free;
 	++dev;
 
 	return 0;
@@ -263,7 +272,6 @@ int go7007_snd_remove(struct go7007 *go)
 
 	snd_card_disconnect(gosnd->card);
 	snd_card_free_when_closed(gosnd->card);
-	v4l2_device_put(&go->v4l2_dev);
 	return 0;
 }
 EXPORT_SYMBOL(go7007_snd_remove);
-- 
2.43.0

