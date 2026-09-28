Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CEB4DEC0C
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 14:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605945; cv=none; b=n/QAryrq08Jg0wlL3mWb39FXxih6KVWyJlYI0r1VUYN8Ieivct1zBWhN4dQd9lye4gp2pI8AV+aswQHBzzY7lt7GpZi8ZJjDikpfAM1wGtqJs4cthlxRo23IlyAIGbFkxlFTQcJvb+ueh72leSKTM7ES1eWZnFtkj0mZm232tBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605945; c=relaxed/simple;
	bh=gKklwbA4xHxFTf9zhcCzZo69mp0IYH2X3pCyg+sJRTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kVNsQ5QiyE3qkfCYmyC3celgOmZdBM8pfP8W6pWAgK3ZkiLNJ25cHau2v05gxXlgJtH4iSRsrC1g7RfvxB4GujzWaNxIYIkUO0Asf5gPwHfLj5tYlRsz97tbYKFHcMl9+uRMZreky/yZm9UbNZatY3AifeamF6666IFleyH8J6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e7BOorU1; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e7BOorU1"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so1330531fa.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790605937; x=1791210737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmW+RN8xwTQxYTKqM/f709I/w308mfcjTNfdEIlVobs=;
        b=e7BOorU1K701wmoxdS9/UDcwiDpl+iRy1twC+ndf9yRBy74n1xyjJyNuaZ6K3T84ho
         oJmwSVJDHRVx/q1xrNQKpwSSIeVpYR7BZvIk016BoqOfe2nodhg+1SdkC4Sky04UHmoy
         p2PyTP3FPzRdNjm+m79qDeOm1S4CynJlsBjog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605937; x=1791210737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmW+RN8xwTQxYTKqM/f709I/w308mfcjTNfdEIlVobs=;
        b=DTwqHzGJ8E+gU16BfP3cPBdVWw4p1XIZoLfI8P7PoCpEzx7ycEoJswoev9Pv4O/BBM
         F54zUtyu+5vhpObwq+OBa4t6r+zsRYFjgdDjjG7fQLPh3ZBb17nr+E8yUVbkOGv73nlq
         WBpp6yc1oz9Ppoiu5QkT5meeZRDWbnSusAZyvr3kxZLSqH84BnLOf6kCLJqneNnmzdTU
         +lCFX8XSqmPUceEklECOy/ou/38uoE1pH00RUj7yjzhlJ053IbmBzIR1f8xe0Hv5tZrW
         xlcQ5040jKGh31gU56dXK8VOG97L7sutEszIcumxOXXfweLPUgv3kuPi2N3KN7ehLZVd
         VS0A==
X-Forwarded-Encrypted: i=1; AKwUvBzupoOisovJMekAisOu9DrMZj15cAXVfK7xoswkyzhhn8LET5LW/Bb34KUEwmAGuZjhINhIRIWXSfdPYw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKuwrzs908js22EmV9NmrjB5+2SXhtKDqekDUqcQhlLpnW0Dkrs
	7OvbSa9vnwsEi4BJV2EHDbzkNR9cGAVzc3LzFmpS+NNLNof+NkYxvUpNhPbZESdTlA==
X-Gm-Gg: AYBFou0mOz7j1bctpv9laiwWmh0nJ8h2XAPod4+mnDXJF58kc+Tz7ArqzkEElLN9pym
	nkSqrFC2vxaNF7cXCypNY9vzm9RlwrdCJeAnFHbSDVulbDMYQGqAUO0N0Ev23uXk5SfWH16L8jn
	qeANNZcVycQoYf47TY4RdyTzIiRdWk7RbkawQBFj3pv6OTEiETABwv4n44z19SofM6FTUuv+GL1
	Z84GXMwti6q9HVHhTmGKRR6cUyozzwNJkZbsGbVrZfIMBAkW601TuGK5BcI7Kxlq2kqxMQEgMn4
	GC8jfnqY+TNd8GPuL4jdWTmHE+pPqDD6gKbu211Yul7VRhdyRUV/3Morvxc18x50KBKoLyRj+oV
	MKDfUu3xb/jgdQm6kpnPTkohtnani5DZ+FWA9ozrzSyg1jUXwGzGGn0COXHp7ERyydhk4/Pw7Ze
	xNV5sZH1WZ2zeOa548P7LwQ0HkYM0m1cNcJWxnzQ9QJMiKWrlh8o8awGQereGJpOLoIeuTJeujE
	pXvxT0TiimYNQyVfHcBmeGULXtzCDlUyjpQa7/3gZEeL50eoQ==
X-Received: by 2002:a05:651c:18c6:b0:3a6:5c8f:857 with SMTP id 38308e7fff4ca-3a65c8f13e8mr15887011fa.8.1790605936912;
        Mon, 28 Sep 2026 07:32:16 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb098dsm603606e87.38.2026.09.28.07.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 14:32:03 +0000
Subject: [PATCH v4 4/5] media: uvcvideo: Do not parse bmVideoStandards
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-uvc-version-v4-4-da0e983fcb95@chromium.org>
References: <20260928-uvc-version-v4-0-da0e983fcb95@chromium.org>
In-Reply-To: <20260928-uvc-version-v4-0-da0e983fcb95@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.3

bmVideoStandards is write only, so there is no need to parse it.

Remove it.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
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
index b41ce01dc21c..0b2c05f6d381 100644
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
2.56.0.rc1.315.gc6ed9934b7-goog

