Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3234486BA2
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132964; cv=none; b=K7A+SEzn5i9VfSDZ8Ujsi/sQlKA4THlnbK+r1vMqMbaw5DUzKCpimBg/z2Yfh7qRd8fQG985TOT05qj3JeMSLrgAcI2NGzFjRHXTkIMf10Ak98by0egg1NjaH2Z2xclZ9/K6XaHNznY833RltzQatXTBICj5eNdyL8I8mG4jRB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132964; c=relaxed/simple;
	bh=k77MDK9fsxNk4IGQNE48VDjBKW+78svM58YOT6/utwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bfHgDwjpDmBWJNqU2WWgMwnHYzh+As/DuojQ8Q7qHBJkQlmR/Q61B8LlJGxnd6AZ9XnScooKmuWSiGWboBFNV7+QCwUGpFZC/07z/fQmHH1j2GBRwwfuDnQH7B0WRr+MTOBXKebFnBW3AItbaU4Rpe1fwYsyI7L9QAzWIdXcCHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i1oXFx/A; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i1oXFx/A"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a309f92daaso7237011fa.3
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 06:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789132959; x=1789737759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/+Av6iKHP1iyPdUb9qZJLeMvT4uN92seFRWGWs39TE=;
        b=i1oXFx/AdmCyP/vWyS/aOash1fslOsIiYZJ1Uzbn1KxBtMK93J/1ULMaggahFOhdJ4
         bUnF6Io4fITNq5nMkI15t1fqsUAtmXpqowya8c/FVf5JBfSw2MB29B90Rj0GzllV6DOX
         PS3XWYG2uhT6MvgS6sPrR/tnArAMMOsL6/LoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132959; x=1789737759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/+Av6iKHP1iyPdUb9qZJLeMvT4uN92seFRWGWs39TE=;
        b=GNn+tAygwIsiQ4pYQURxoVA4yZUfiqvPSD7reSJKtGgTqeFCjjgSzO2Ja54Sbm8ybd
         IN7QdxRmM6mHjUroq8oDy4omUl1qWlClXxhp2lliosYi72+SklopYBi3K+TCtPTbolB1
         gKcSHLfhBIHCl0VUVB5mbSCaem9WD4Yq5uAMm+ecVkhqlbpZWHyPpwB5CEbBViQ2aOrz
         tNylCKs8+RIyfpWYF5u4RYftEEMlDlcbwG5pKKEVKMnfKMdkXKB/MwaxOWeKTUYmkeh3
         baMfgcjTCHaPFsw9InOiEyrBgCSF9VYQoNh06EhTKeRmBZgEl0u98pkYlJrrzgZ50f92
         In1A==
X-Forwarded-Encrypted: i=1; AKwUvBx70RAIt9ib2+xCnDB2MVVBsvNt0Z+v+XFxMbhNANPHMyrSWTSLh1Pjo7luNdwTfcXqT4MOFLjqfnjk+A==@vger.kernel.org
X-Gm-Message-State: AFuF++l6F0bXaOmhUVprchQ89J0X1OZGhOEnkXo9owmWE0ZTbQl1U82v
	bbIEoSBmlk03dj8BYwd2UE66ZxRriKpsn+5k+mYy/D+SVgZNSMHosaXOfYhkvIPMyg==
X-Gm-Gg: AYBFou3ZMzUkwSiu96ZAzwdlMHXDI1LawYWXt7sd2HBLmAR2fze010GwQpskuYlMWIG
	iV3usd1SO7IhzvMy1IlL0T/mUZ4boGq/hiduI1rfmMZqhDO9En7qF89pyIQbXJ32wbtudjevT1R
	y0LRetBjq1/1UYUHeG6WDNKjl3rTW1bAWLgMJp0QmickL/VcTw1sXR+bPGgX8MijbS9idbxg79p
	TjhWOpYqeElk3v45Eg2a1rZEFLJkpRMFjHVw8p+5ba+v6dAhCeyu1k+Hdyhv1pc4uBiv6sBlNmo
	cjT/tlxZsFSzD/H+O1/RjjO3FomjqKkrqsHiFsL7bMKmsrpKoJP/9oX14jMurIfQspgxoGtAr3w
	hEaXGpAumNT0fiHi2ao5h5yWQBdUC+l04vy+fbz0jbMGVRE/Y/fbmZllZCrfZ3RqpI5juRUZG67
	jjU7giKqjpy21TBaX/HyyVVkNdo44d3+GEBgfj+e2eu9fwRuL0ydP5pMXtwk6paVNVtpIrqzYpC
	s7ij6ZSDX8o8wx9PzqKA/hOYTbmjrruyyJrLG+PTWhbK9GgZnvQhkAyDwKp
X-Received: by 2002:a05:651c:512:b0:3a5:9c0c:9932 with SMTP id 38308e7fff4ca-3a5a52e3465mr4870481fa.26.1789132959667;
        Fri, 11 Sep 2026 06:22:39 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3303fc9sm6677511fa.6.2026.09.11.06.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:22:39 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 11 Sep 2026 13:22:28 +0000
Subject: [PATCH v3 4/5] media: uvcvideo: Do not parse bmVideoStandards
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-uvc-version-v3-4-604328d8a0dd@chromium.org>
References: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
In-Reply-To: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

bmVideoStandards is write only, so there is no need to parse it.

Remove it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 7 -------
 drivers/media/usb/uvc/uvcvideo.h   | 1 -
 2 files changed, 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index ca75f8d1ec46..adec9d1aa653 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1187,13 +1187,6 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 		unit->processing.bmControls = (u8 *)unit + sizeof(*unit);
 		memcpy(unit->processing.bmControls, &buffer[8], n);
 
-		/*
-		 * We are not using bmVideoStandards, so there is no need to
-		 * warn the user if it is missing.
-		 */
-		if (dev->uvc_version >= 0x0110 && buflen >= (n + 10))
-			unit->processing.bmVideoStandards = buffer[9+n];
-
 		uvc_entity_set_name(dev, unit, "Processing", buffer[8+n]);
 
 		list_add_tail(&unit->list, &dev->entities);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 8d99e857a69f..65f232de7821 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -228,7 +228,6 @@ struct uvc_entity {
 			u16 wMaxMultiplier;
 			u8  bControlSize;
 			u8  *bmControls;
-			u8  bmVideoStandards;
 		} processing;
 
 		struct {

-- 
2.55.0.1007.g17ff1f9808-goog

