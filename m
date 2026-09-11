Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB98F46A608
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132959; cv=none; b=g1CsnCMabqCvrMdyxhxYhcfJ9dTokNLyUJfPlCTHE03eGZYfl5l3etpe3djqdCgzBnPp9W0Q/qhUAw7ebfDywzka8f7M3up8iTgX+tE70XSB6T2v0mGuARFLHHW7HK3H3sc/Mp1vCRzNiKWcNAM7gSDUDAuJmpRqSMXOK5nc67k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132959; c=relaxed/simple;
	bh=bOQ/MUtV4oABfhpMfaORamrLvXRLrnJxJ8E3V8zPxPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qho3wPbV4YX0uiEKu3f6+Z2r3EeSydc6he1egPtW7OlHuHIyJKP9v8mcrnDoXjT582cafPmayyDfV3uyL9o9Txg+w2jjVkNFk8ncXLuNadPYnhMH2SP2oGwiuslSH5IZ6CREzlxCBIUT+CnwrhDS9HwLNYKaaqyYmjBt7ueD0x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fQ5arWep; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fQ5arWep"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a468f4c547so6686761fa.0
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 06:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789132956; x=1789737756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=axORLmg8T0T4dSUmkU6VVFtEBAwXnJ3GuirIwOgJeOI=;
        b=fQ5arWepsPpabgndkLNl5iRZ2bKo+uI+JRRjkDvfcbt0eM3P1wbujxBFxq9Z3AQ4M3
         H6bVw1W12qbQMoSrQB2Si/8deu2g8jse3qmqa8sBbIKnKRGqcWSzDOQSuvehx07Vpq0M
         cZs7FGki/lZxY1zM0DRUqq7FTvB9vx+uf7kHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132956; x=1789737756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axORLmg8T0T4dSUmkU6VVFtEBAwXnJ3GuirIwOgJeOI=;
        b=mjvIXeZyGky8oQJlP/2zd1NffR2d4pHN5EsANhBpmshakKgdvnIMZ5uoITPG+lNJ70
         Qm635ulBOqM09Bi8AjE7vd1l4S/g0CsYYf+mdJW4l4Qo4hDXOgq9aGIqPqpLvkOtodYf
         RaTKF7is3GalZHyunIFfCmx7H632YZALJaEOcszLMZLQhUW/P3NATJ1vbo4Bdu2h2uK0
         rTP+n6+yBVI7FNrskN87eYmbLLwSttTPOKfwBQtQvgf3tXL4HS3yu1QzFNA5R9tvUBWs
         ZYtMhTJ1u6yV+DS5j9d2ovgYcFpRl1K1ANCQZ1LYns9yTqdGhcXS+XLh1tKp3QZxf1xb
         6XLw==
X-Forwarded-Encrypted: i=1; AKwUvBynGCDdW+RMosBjmWMxZvNbFl6t4Jrq2urb44cmLuMr4A0X/3fY5mSle1aEvxwdl2worCjDg533Jb5z3A==@vger.kernel.org
X-Gm-Message-State: AFuF++liUT5QXHexVo8UM+9oHjyLIMcs4vECuorj+d5K1l4ab+xzX543
	HZnjdqjHCRSl4TXnjNCU1TQAKreLMA6BuM1sRsW6KQWZ/sTVh1+sNmpElVd3Sgiyow==
X-Gm-Gg: AYBFou1/9GUoiVPZ7vbuZXhS1xts40kMKi08215XxaKrbLROPfvEgwtcoJuqlE/UlDv
	aNL/ZKxO/8C4tkuoU+B64gp7lNCGoFo9Miuhf0A/K7n+XOffPFih3ZpifeOz11KkPVg7aLOlIou
	YuF84fBs1aGM5in8gqJTUDE0Bn8rXaU/5STGffxXWiz7jWB7ygiY6MMLS2D+cK+uphh0lAMl9hJ
	IcLw3phKzNkHD+kW+5+3jyZuZjtm1nhZgKe/tkp8oisQKskTS1VVUJ2s5PjZR3Y4SK+B/NQR9dU
	fbWtIrdJdgew//0KAgEkt7w1xjWsIPdAXW3y8oeNFUiKFnbcYXQ0NR+WSx7LRUPH67JiILvIs/K
	bdGXM0f1PbNeho5qFUam+E+nR5zNOlkbdLfFnF4f/5N0FnjKVgkZkqSA9So16PQ8wlyPvadL4ih
	L62qKiBgiqGGs/+m1QkvSuVTygtuAtUs1A5vkCtDz0+xRDULmZeZjQRxfByKEUeW80k3a8++bDS
	dw//wAc0Ky39u81OYM7r0wyW2gYEpT6sxz+AZ3Q0nSUlMtQ8g==
X-Received: by 2002:a05:651c:2127:b0:3a5:a54d:c8cc with SMTP id 38308e7fff4ca-3a5a54eb73fmr4938891fa.23.1789132955799;
        Fri, 11 Sep 2026 06:22:35 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3303fc9sm6677511fa.6.2026.09.11.06.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:22:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 11 Sep 2026 13:22:25 +0000
Subject: [PATCH v3 1/5] media: uvcvideo: uvc_warn should warn not info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-uvc-version-v3-1-604328d8a0dd@chromium.org>
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

Now the uvc_warn_once macro triggers a info message. Use the correct
level.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvcvideo.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b6bcee4a222f..a80406f20beb 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -685,7 +685,7 @@ do {									\
 #define uvc_warn_once(_dev, warn, fmt, ...)				\
 do {									\
 	if (!test_and_set_bit(warn, &(_dev)->warnings))			\
-		dev_info(&(_dev)->intf->dev, fmt, ##__VA_ARGS__);	\
+		dev_warn(&(_dev)->intf->dev, fmt, ##__VA_ARGS__);	\
 } while (0)
 
 /* --------------------------------------------------------------------------

-- 
2.55.0.1007.g17ff1f9808-goog

