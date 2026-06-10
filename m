Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E3032D7F8
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 16:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108422; cv=none; b=Gpg4VdGKlOg5DdIcZcJpqda/Mjv4W5blWQIJfWyR7rtKgszLbUU6yZ7KjjfFAFyUAlYFJbgZGza/boOYLbx13PnRsNi0jo/MWOXiYBYbFLSiFZZEbPtXLAe0KQRk0QQYTDq+/S6Co2s+9aibZyQDlJbn+OzyMrDTE21sPFsA9J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108422; c=relaxed/simple;
	bh=vhvliuSK1Y4bcVaFJfaU5ZlL8b16yAONPz3jtr28TlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HSYzefqHa4xs5AborL4XwOxdDOJzmkf5xFV2kqBY24oWhs3x3iY68ZzCzMxQTEH27fBYj1rkG8/W7+JgXTDCCwrTZizfws5mP2LbWxqAmCSc2lCtWe0ywm75GvH2S35sVbil8PayeMLnqGihQ1T1kCI9pybce2GA5mE1JSjdJWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OBZlAUYL; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OBZlAUYL"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa7a70c0aaso7077257e87.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 09:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781108418; x=1781713218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIpz8busIlOEDCfvwpo8ALDZD6urDsuiDCPXRpA/AkA=;
        b=OBZlAUYL/bjPamKi6VyLKSJgzLsMmiPirjMCOh99vAhqcigu3cNgv84ogPwPHQlWuX
         Fa+hFgp10d9q+6ZXtd2NdEi+7Kuz13R9pg+k5qqFwKWPh0bC53VY3ey+JVVoBNTHP0ww
         iTk1MjbzsbnAsYCg1d60dzIAn0fObp7swnfO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781108418; x=1781713218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PIpz8busIlOEDCfvwpo8ALDZD6urDsuiDCPXRpA/AkA=;
        b=UiTs1VrqEGCmSW1/vm+R6dUTTN1U0VBWMzTeyv5XTPeAsegolO3uT9c5foniuCdznP
         sMk1pdNUob4rCsPEoBUwhBoK76hU7afxSstjsNAp7GDtnc7zNJ3hYwr31Hz5s4Nw5dIV
         2HleIvEQaM2+KyVhQEql8I9FTs4Oh0csU5BgCw/yJrV4PssYeFQRTdltGoJsR2Lpxamk
         mpjWFWeYUgdbFrYrePo83G1/lK3u0loL73v4zCRC3XIE/K8jRyTKKT5PlIu+f7JAPzxD
         SAqSTeJMmp2zzc+WIqzr3HcuRQTvkudPKm2cs0g1xuFBBFVKGpY+VueKtB5jfDBI0blM
         44yw==
X-Forwarded-Encrypted: i=1; AFNElJ9YOQIoMY7Y1lgJ+lThYPqhHMN7BQ3j72gO6kLbxHbUKlR2ElqAGkAkQ6yUFIHKGwwLkqOXzUt2DsqJ2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgvBsv751qXCS0vD086MrhL+8PBWv4Zbf00BkrTAIq8Y9cvfq6
	Ukg86N/VTCSudYWzKHSdyvrOOrpHyxQ6SenejNYYtbGgc2T0mTePmC3YPfPcOQPdjdyOiWg5ESv
	X0tM=
X-Gm-Gg: Acq92OGKaXx1aQ60QgBMegJhn3oWarp67SxsoIlWli50tyhZT8x+qSxb0mqkayjmHBd
	5OUwi/fZvq9OrEc4CDrxTWOpxaezsugDgF6yOLnZGtgwBsMSW158a5VDQB81G9d2tz1HmEFRlog
	RT/rswC2g0vikQcK6xZAy7eg1FLxZXGrABFTIhHZxSNI4/U93nQMNKBVeovnItLZ/FKj99LpEyY
	QN4ChcqqpwGfgKxkbis2ZE2/A0FoX+2yL87Ve7PnShd2lfNMIDrCKvQzAF1isiXMln6rRTqzkMp
	dseBJY1zRTrOITKq6x3EI4IjVrAWrYnhxVh529hj7+Ra2M00KEDw1uuchlddCO3GqQ9YR1fKFyy
	JpBsw7XRJk5HPfIHesbBML355O6j5pH+3YE3FQyVDI1caz/AMtykmVX7KlVXHctn10Xf5qkxBX0
	H9x/395tSrowTsTYAl+te9aCSvIw/NJOURCaoWyM/fidT2+rTlEhsWrG4ISpkKpdtqJwjF7VZZj
	DWO7McH/ZssYqg48Yi+CfJTq0Uj
X-Received: by 2002:a05:6512:4045:10b0:5aa:780b:f341 with SMTP id 2adb3069b0e04-5aa87c0bacemr5058825e87.35.1781108417762;
        Wed, 10 Jun 2026 09:20:17 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ee219sm5608915e87.15.2026.06.10.09.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:20:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Jun 2026 16:20:08 +0000
Subject: [PATCH 3/3] media: mc-entity: Add missing kerneldoc
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-media-ci-7-2-v1-3-3c61a482a44e@chromium.org>
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
In-Reply-To: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Xiaolei Wang <xiaolei.wang@windriver.com>, 
 Tarang Raval <tarang.raval@siliconsignals.io>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@kernel.org
X-Mailer: b4 0.14.3

The argument args is not documented, and the latest kernel version
complains about that.

This fixes the following warning:
Warning: include/media/media-entity.h:1394 function parameter 'args'
not described in 'media_entity_call'

Cc: stable@kernel.org
Fixes: 48a7c4bac94d ("[media] docs-rst: improve the kAPI documentation for the mediactl")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/media/media-entity.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index d9b72cd87d52..fa393e840669 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -1387,6 +1387,7 @@ void media_remove_intf_links(struct media_interface *intf);
  * @entity: entity where the @operation will be called
  * @operation: type of the operation. Should be the name of a member of
  *	struct &media_entity_operations.
+ * @args: arguments for the operation.
  *
  * This helper function will check if @operation is not %NULL. On such case,
  * it will issue a call to @operation\(@entity, @args\).

-- 
2.54.0.1099.g489fc7bff1-goog

