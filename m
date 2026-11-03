Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717780;
	b=AQ/RR9AAOlC9UCLFnh6yHceN3A44ziT2KD/+tfR+wUfEDqpstSZYAqo7nOPJlSl3WZ+3
	 q52CE3/ZzuKMEaoBkXSfQxhzLgkse+SQXManYtGyis7m0KOI9a+1ajp3u5wJ5C7Bgmsa1
	 xRfdX/QaXdsZtA8BF/CnAof2BugvwD+15n44hldzQ01SeDBTgeZlq+EiIS0h+4Z/37WXq
	 ESY6nxpAYQ/HNXgGFv4XTHSg40FZE7bDgBEQOtMMxnPcNz35R9OLqsmnAPoX/kBUyYg4l
	 QjLdt+Kwp/Ur+YTDm3KuvzKoaYA3WBTlzfdBCmjbaJLK5Kgm58hePfqpnWOYw6diTTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2v3uSUkDZsGbXYa1FeQE/G1NHYkVlKYzZyMrp4apMXY=;
	b=VPZY3B3jqBgKNusH1lJDXORxmr1XDNLJL/U9mEbFE2epYuzLFEmJZRXJAWC0NZTG+UDQ
	 bXQn5S06xTjmF3aNLLkw3aUrnpuKAIR2+p1Wk4JJ2VRlh9ksuq5rJ5/bhCvPx486laSde
	 kWPbnr/XByLrtifyCCbQQ+YxyrdoJ03ekg/TKj9bOXy17K1/KmvtY2GPy0dbMwFXURL+v
	 R9D1ceMpODnNO+i/FeTFZThi+wbvQCIT/zXD5xN3YoO6+FrggVldCAXjZoMsuP19gdmKB
	 Md6aNXyoJq0APLN1TeA/XM5h1nkypmjkSg4IFyk2vqWo8rp2Fbj6dZKEUm2fmasLqLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=D5xkD48S;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C43606A7B9
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 14:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67C43606A7B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=D5xkD48S
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so2567088e87.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 06:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793717778; x=1794322578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2v3uSUkDZsGbXYa1FeQE/G1NHYkVlKYzZyMrp4apMXY=;
        b=D5xkD48SOpZxbEX1IvYf3rfrxo9FrCzQk/cGvNMOycNy72ABVzm6/4cW+uxmco2Kdb
         uqWbGBSbhPOOhsCDSlCieuzfk946h2eoYjal0tV7VVpksJnt5jC/waf93eh37CEujhf8
         HujSRlIej/mAMH2M9H4PnsyyP6Xa+KJ2m5ry4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717778; x=1794322578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2v3uSUkDZsGbXYa1FeQE/G1NHYkVlKYzZyMrp4apMXY=;
        b=wAHOkG0tlfq4GFj+aRvteDEK68FxHk/gc2hr0Ln9DvY30Ioozjhzx2Oun3CYJ5zxcr
         yNo9/skOsbogW6yZD5hQT/q1No06UHzXUA0EDXwOGAXV08f0FOzPvfx5/ljpaCMtcXPN
         /4NvSSuInqWMrDMqwr3chdycml23hmalWJgjeL14I5Ezw0vsATaxlLegBzz/iJLcCbXU
         Th7tgRrU0a2h9wQMroOaG0rqJXuQZ8RqDTH4PLvafyuc3mNp6p2Xs6cb0rergEhaB0Gv
         Gzwn3k4uoh4nUNIhoHm9Z4M93ioZYVQiCM6NyrqXn7DEr224IOfeu8TY47JoK9d3cs0S
         g/+g==
X-Forwarded-Encrypted: i=1; AKwUvBzqjO9ue8pqIgJ1qY8GbhZrNQPqlzSPtYwBuTmMFaiywl5Nekg5wi1in++1EFQrjcMLS2gas32zplgtzQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+QtKMnqgKWUkD2NvTOypl1ERiAF557PRWCHHKcnwC04cxwBq+M
	yKd2U3z2vSRS5ohiTiNQNWCPbDzDqAmcIWTklcNX1FQo0I2b2b0dvbP8436zS8c27g==
X-Gm-Gg: AYBFou0MB88fY3xoqO5D0lUjvdVy84lQqdoFa4CTWdfbJra3ebY3tHBVJ48gcTS6tSw
	dQmp5kjAddM3+DnRoAujirQyxGza2pEONTP7MegcMfhFWXjFLOOv2yvzeiWPpbWNPiNy2Zq01sa
	g4GJ6vu/jPYhBAGbL9jv0li1Aft/F2JwEvtZXxcgbqY6z+ZQPrwRmBwFnEua9r945X6L9PnoEov
	iUdtA2YmW82vvqeRi8mTA71SJqYQQPhfPvb4d2Yg58RneesEEwfMeVNB1wY74juyCfZGMa19gJ9
	jAl5oCJfgGf4gcS6orJg2QdMMkAFcpe7gJXUB1hMC5K7D66vYHNZYF3qAVifDY3Pe+hC58BGsIt
	9oU9VZhkF77V82RoUAzEKqmzKQZQTSm/5qpPQLKxxuyYY9IfbCodINmlIQW6UPp5gjFzKWh+Ev/
	Mw8G4dzduQzIFUsu8dVI+E/KAq9GiQatfvWM4QOSUej4oUfAy33ZzjXPJm/hGW30xh//C833EtL
	JxQvmVIfRdGMW5GUck0/aHLquZLI31gVpO7eWNmxdFD7H1w6n3paqHZP6O+TooitZ9qtQ1AcKZI
	i0SNp8//DsQkXbqLYMmJzntvjEZL/0v7oxOebJrQ97jImfMY0O84dtT3UmmocdrbM8zs+mMVwqu
	14CzFvy0t9Q==
X-Received: by 2002:a05:6512:3e0e:b0:5bf:9fc1:3938 with SMTP id 2adb3069b0e04-5bfd957bcc7mr4445793e87.38.1793717778287;
        Tue, 03 Nov 2026 06:56:18 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe1b1ddb3sm2037346e87.27.2026.11.03.06.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:56:17 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 03 Nov 2026 14:56:03 +0000
Subject: [PATCH v5 1/2] media: uvcvideo: Do not parse bmVideoStandards
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-uvc-version-v5-1-f23b6d103c51@chromium.org>
References: <20261103-uvc-version-v5-0-f23b6d103c51@chromium.org>
In-Reply-To: <20261103-uvc-version-v5-0-f23b6d103c51@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.3

bmVideoStandards is write only, so there is no need to parse it.

Remove it.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 2 --
 drivers/media/usb/uvc/uvcvideo.h   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index cbc14569716b..7f9f829ca6c3 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1188,8 +1188,6 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 		unit->processing.bControlSize = buffer[7];
 		unit->processing.bmControls = (u8 *)unit + sizeof(*unit);
 		memcpy(unit->processing.bmControls, &buffer[8], n);
-		if (dev->uvc_version >= 0x0110)
-			unit->processing.bmVideoStandards = buffer[9+n];
 
 		uvc_entity_set_name(dev, unit, "Processing", buffer[8+n]);
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index af8cef94ffff..7f4f11824dbe 100644
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
2.56.0.385.gac671c819a-goog

