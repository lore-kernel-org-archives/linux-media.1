Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847664DE717
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 14:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605943; cv=none; b=sM6JaTLJu2kizeby01DdaPzVLpXs6zmBkV45prZMpQrF9b0qM1sHYJUOX/m2RVEb8+m8tltcrr4wWFt4Tq5XL8FBalDaoB3Pwa/laDwgdKIIw4wDSp5+m57RxF50g6y3OpV5AUOYPZysqzx7NrVYBSPEnu+cR1olOavKYpUpM6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605943; c=relaxed/simple;
	bh=vTx2xmq1OWfz+8T6HSxU27AUGa2mZ0TcP8GSl6lUKJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jleu4NPF2LqArey6pKDSbW74IlsQ5FLFYxKqSz6Gci+3lLTOwwWXv8uIKz9NGVHFgTiWMJKCXYnoc58GCQ86vlS9qtwdCkbFPzwCctpMT7Jkt2ch2iXngYYJ2aMVCHeH8tlER8QCGgbEzPiQ/fIDJ6SJ9IkTRkorqCg3dHKL5HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PZs5oXqS; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PZs5oXqS"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8f80e3f72so1454370e87.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790605933; x=1791210733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pZmOc8wc9+wz/uutYCALFKqsDrQBIXPS9oyyY3WIPdc=;
        b=PZs5oXqS62eIUAe1AeULcvzt1ZSqIaPh6PKrvzGYPZMDlgyWmxfXtWDBAckc1k5yUf
         h/wO2Eu0EHEssxwfLJ0N97OLLDvg1Jc4NuDhgOzXDK5Eba3RtWWTELYhzaMR/ANhacLN
         4rb0Dr8Ts0nqRkIUAUKHIc4YtycBt5SVVJlWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605933; x=1791210733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pZmOc8wc9+wz/uutYCALFKqsDrQBIXPS9oyyY3WIPdc=;
        b=sL7VBB760+J+P8kPIMFOSltCxXRk5ZH4lmkm0ujzfzg0O+mJnFlc7xLbzANj5Vsm0B
         9FA7SvkySjx+NTWSmX0blWk3Dlp6KGMxU4a23NrZFGQhGXR8xL8sjl/Y61X0BhisWCVl
         DyD84j9BGlP+rnnb0EKSVYhdU3aNeLLlTKJLGt0TWgRk0S1y8mhUe22IKFxNWWqJJRPR
         3gGEE003cEgVMQHw8hEcSl79Jq94Vk3jnZXXOmRjaaeHpVaum8p0Yu5DtFDeW+GSkh3i
         AYC305bJHtQdEW3HjY/aRhoyTXfwTZobDIAZVoqkgW7eIjqV9WDdq6Lu6tjpADrlh2zY
         cz8w==
X-Forwarded-Encrypted: i=1; AKwUvBx39o60vxK1SDbfdbusXOYlvGKdDKMVQzBgoKMUP4h4NC/KoLKNqkVNVVLphoMoQFZmGG2QbBeuE+yv2w==@vger.kernel.org
X-Gm-Message-State: AFq9FYK18K5OHtblu5S4Q7v2BSDEb5am4lEIVoUyXMtfAevFFFRTLP8J
	ppYTm6r4a2QC9+QsVbVPWTj0X5SkYglhuuFbiZ8Eg5oLMCLUdpHnY33WrZUp1u7+hg==
X-Gm-Gg: AYBFou3TIPxZA5bMAj6GThnVYqg6UQlsryKmhloCNd+AfJOm8UUduH4r37GIslHoTYD
	P6+lR8ey5ps9basohDc83EqQy6cp0oTKG6lZRH+LPjTwu4v20RfLydeZBqeLZiNJFQCA2fraF/W
	tbd9a8Egrwi7dqjW9Kxp6nJ7/hk+IWwneIEuPAFdIZfp3ZJBMXrKEvrKGCzr/ER2hIEMUO6j5p5
	P83jdakQNrXFmQs8+V3ufAMO2kAqJzHTLufeJ+3Ox5cYDB1RhcaIur/Faz2pO3cC66tEJCryKrL
	Jjy3lL7OmeuLGpXsMuD4Uq/VOqXC/mKQ9oYPR+sQNmxfNnVUloCAELGcgqsnVdq8Fpzr4YZCZGo
	NpZIR3gg4GuxH6HC3zBTbeYSZF4X9x+CZ890V/MMqDSULlkW0PqkXfszVddHqhgTc+eOHsMUqe2
	X2a3RiIWHwwVciMCRBR32tFlSnAtrHSJT4ytOAsnBXfqbeTwNT9linMK+fJiB9qjoKkb0ETemW9
	0w55qBDd4Rh3U+BHP3HrveRJlltSHbzLtaVPbeh/1F1yWMa0g==
X-Received: by 2002:a05:6512:1313:b0:5b4:74a2:cf2e with SMTP id 2adb3069b0e04-5b8df0db4damr4119015e87.21.1790605933233;
        Mon, 28 Sep 2026 07:32:13 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb098dsm603606e87.38.2026.09.28.07.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:12 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 14:32:01 +0000
Subject: [PATCH v4 2/5] media: uvcvideo: Use uvc_warn_once when it make
 sense
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-uvc-version-v4-2-da0e983fcb95@chromium.org>
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

If there are multiple cameras in the system affected by a compliance
error now we only show an error message for one of them.

Use uvc_warn_once() to print an error message per device.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 2 +-
 drivers/media/usb/uvc/uvcvideo.h  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index fc3536a4399f..2a3b7431cc68 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -95,7 +95,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	 */
 	if (ret > 0 && query != UVC_GET_INFO) {
 		memset(data + ret, 0, size - ret);
-		dev_warn_once(&dev->intf->dev,
+		uvc_warn_once(dev, UVC_WARN_QUERY_CTRL,
 			      "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
 			      uvc_query_name(query), cs, unit, ret, size);
 		return 0;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index a80406f20beb..abcafd929c9e 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -661,6 +661,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
 #define UVC_WARN_MINMAX		0
 #define UVC_WARN_PROBE_DEF	1
 #define UVC_WARN_XU_GET_RES	2
+#define UVC_WARN_QUERY_CTRL	3
 
 extern unsigned int uvc_clock_param;
 extern unsigned int uvc_no_drop_param;

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

