Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613738;
	b=aYM1MD76vY8IlO3oSTXyTevv7PNISKcHLPiAALOTY9OpugXHjyDVyKKuZR0fYQqXjbyy
	 DmMYiTY0v71hwuPQWYwJmabY23sSeciFwqtYrHx0VvtizZcN15gBVjAlmKT1E1IuDFAAl
	 cY4tE+KDC204B+E64smQD7nKScQSvP/aLDV0x96liyc+hLdLD0BcJX1nlYrCsK9EDTWLZ
	 QdsJJKKVkueDj4wDdMVms9VTWoMY3lZF6uaw4kTwjmPyi5x2Ik+83K6XPxdVNGDbTlD/P
	 n4iH9vT1CDCKbA2ynyXnGqKMuxNDJofIbUtUquOYxAy+Ifoh3JwubloedLgGym8J/Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=b11yeBb8NsdwSRdCS1bEtxOsQoS49Dp8WAO/enSMFOI=;
	b=N/q5VThAcK8Y9xNvmZe4tnJOp2XdsTQzV68mN5luMLyouulProBOqgykqz0cc3ZIKnFx
	 7PT7R0U//TJrZHBcSipEeEiLV3e8k4Up+go7kKlA36ftKRUJueL6bQ3vNWyXYXTVEOTkC
	 U8TmGOYamq0UvzbUtMLySL5gElDhGaBkuc68P5TQtfIqjH4tkecKUbYsI5sp0SctiBjK9
	 hPFoseVZmAFtxHkJUG/EJknlkRKz556raFv/Pn0hhhzPKlxdpQWHJe94NGMgp4Yaq6kqM
	 Yb3Xilk55cdQfZn2g4s9ebRLZ1lwI4n+/IFVddFW/rWgpbFD4M49wFYznnCbTQlIocQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ApCYebdO;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A02606A339
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A02606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ApCYebdO
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso8040920e87.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795613736; x=1796218536; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b11yeBb8NsdwSRdCS1bEtxOsQoS49Dp8WAO/enSMFOI=;
        b=ApCYebdOtS1Y5UDBm0SEKX1EGlk5nzWMdbuBJ+LtuWy8mEXW4L5c9OlaCIx9HF3HKz
         Qu/vlaPip7Wm/HCXWNJV/tiZRaMIj7MZr+wyUug5syKufQ3bKyDlNsC8Dm/xDQKs6YMn
         DxVb0Z8rJobRGoNig7l1k80LKQm8S5fRLJM8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613736; x=1796218536;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b11yeBb8NsdwSRdCS1bEtxOsQoS49Dp8WAO/enSMFOI=;
        b=OGvfI/TfwV2wtigFNCKlfXODISiVS9peAazri8BjXdVp6RbqRCqsEKMkGm3d97sUE6
         CGtMoVUyyOATaedtciM08ttpo5+F1pbkrFTuRQZHufmmDO23JKAcOnuM3fegkhaM8i4Z
         zUnrgAsRGLIdVSd42UFA1d+nfQJu0ur40DLCu5AYVaBcAj0ehw83+0gs1LsWnlUATsTg
         3yZwMJ855nmHBoDq3zEGXo9v/Y3COhCVzU/WqE2MznDbpOZR7OHRy3u+loaR9GszjJO2
         Hx6I8UZ/5aizi9U5mlnsCeV8dBB3zINUPuKF8xsqQde4yigA+NlHP2siapY6U8Yq76qD
         vtyA==
X-Gm-Message-State: APuU4Z9vf+JpLkcWocqH9lC9MojusWyS8AiYhzhldJm8ZVQWPZQ1JQoq
	+PpxnjfouqvwmEw+FOiP2oW88ljTFEDojxgdul0raLl4pr2d2X1W8WcuwFsujcY5zO7CzO+8d9f
	Ph2purg==
X-Gm-Gg: AZFdTZcU2Me8/gKmB6rnZAshEupreoAtT798F1arL59tYJZHlU1wZISaTkO24DBz3ri
	+KMPT90yXUs0JBgEpcpjYicqvTZAsVnxZMDT1cKn8li0rji38Wh5VZ8wTOXsTGo2+Rx2Su3yw8q
	QShyHTaEktSKSWA1ipn16UG/mLEr8pZlZv1Kldsx7/J7AvxiW1uMRGHbkVG+g2ViMQFtbsCJteQ
	xQtbWxfdL/KorurmU5J3Uf6B0HbYGaQZiDzeG2rDCofuoschw3o2zuzWGoyWjQMApw8wFOZ33eU
	utDKkTVCkkmUgKzx55vBHYymdtVkFIBrsoXKKTpiaG+VqPTnGZsmrrQxCXds3e8+qPrz0VyjvPS
	+NMvAH1mbfkBYtNVTox+Rq1jyufOnmTitY3rpRkD/kQFlv7VGiIKOr5qShZ0TpY4nZH+xLcFHz3
	+eMskC9LD3amwDIaSR+nrYx9xG1aeRpvHZ193epgVA2v47nojbuf31zMUtrsq72eo7b4au2UkR3
	DGhpzS7r/hkixZw2FCkWyCcKRo/h+DCmFQzYPAN9mmEL97VVfTDHaXDpgWBKUOwfaHQaQNA5LXK
	+XNW+R5Cx/FC5lSwMfSx0OdMM2olzYtDJBaD3qf2ano1cdPVWfa9Zkgmyy0aHy8BcV8JIEUznfP
	1LJbY+J6oSg==
X-Received: by 2002:a05:6512:1315:b0:5c1:4c0a:49e8 with SMTP id 2adb3069b0e04-5c1bc80b081mr5630295e87.45.1795613736259;
        Wed, 25 Nov 2026 05:35:36 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff7d6bsm4505000e87.18.2026.11.25.05.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:35:35 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 25 Nov 2026 13:35:33 +0000
Subject: [PATCH] media: uvcvideo: Return -EINVAL for ctrl_get errors on
 disabled controls
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
Message-Id: <20261125-uvc-invalid-einval-v1-1-57e34bd8ce06@chromium.org>
X-B4-Tracking: v=1; b=H4sIACTkBmsC/x2MQQqAIBAAvxJ7bkENJfpKdLBcayEslCSQ/p54m
 znMFEgUmRJMXYFImRNfoYrsO9gOG3ZCdtVBCWWkVBqfvCGHbE92SA3QiGEdvVid1QZqeEfy/Lb
 pvHzfD8hqXKxkAAAA
X-Change-ID: 20261125-uvc-invalid-einval-603b8f0bda56
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nezul Tairus <radwolf.83@gmail.com>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

Some non-compliant cameras fail boundary queries (e.g. GET_MIN), so
uvcvideo marks those controls as disabled during enumeration. Due to
legacy uAPI constraints, GET_CUR requests are still sent to the hardware
for disabled controls.

However, userspace (e.g. PipeWire) expects -EINVAL for disabled controls
and treats -EIO as a fatal error, which can cause it to disable the
camera completely.

Match the V4L2 control framework behaviour in uvc_ctrl_get() for
VIDIOC_G_EXT_CTRLS returning -EINVAL directly for boundary queries
(V4L2_CTRL_WHICH_{DEF,MIN,MAX}_VAL) on disabled controls, and converting
-EIO from GET_CUR into -EINVAL. If GET_CUR succeeds, the value is still
returned to the user.

Reported-by: Nezul Tairus <radwolf.83@gmail.com>
Closes: https://lore.kernel.org/linux-media/CAFDWN6LPcz6CBOZzBVN-VbCce3g2wOrPZ8V45_=8xv16VCqzsg@mail.gmail.com/T/#u
Fixes: 649c033711d7 ("media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during queryctrl errors")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d2f722bc3459..9390cb642d30 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2645,6 +2645,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *mapping;
+	int ret;
 
 	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
 		return -EACCES;
@@ -2653,7 +2654,14 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
 	if (!ctrl)
 		return -EINVAL;
 
-	return uvc_mapping_get_xctrl(chain, ctrl, mapping, which, xctrl);
+	if (mapping->disabled && which != V4L2_CTRL_WHICH_CUR_VAL)
+		return -EINVAL;
+
+	ret = uvc_mapping_get_xctrl(chain, ctrl, mapping, which, xctrl);
+	if (ret == -EIO && mapping->disabled)
+		return -EINVAL;
+
+	return ret;
 }
 
 static int uvc_ctrl_clamp(struct uvc_video_chain *chain,

---
base-commit: b7ac871daee981f1963f632586ff9b9d898ce5dd
change-id: 20261125-uvc-invalid-einval-603b8f0bda56

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

