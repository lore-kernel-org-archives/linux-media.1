Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6FB31A805
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 21:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773351344; cv=none; b=GN4prkK0Iks6vcZnfCXMVUkidzyShdn7OlibY9aFasylsGJV2y6NNA9jbE/IXjtjmQ4AYEo8wQH4YpS5VFt6RiRQNGKFQ7q4ZA8yDpi/Y/Mhpiei6HADXHB1Y9XH6PDl3flVWwLwq3S5Mw4liBv0TPj257MwnOLTrKHuIxEFSNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773351344; c=relaxed/simple;
	bh=V8hjH5ZTKn2IdgilyrzK9z2LbCwYp7aN1UXvrAacl0w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tekw8ssEF8aCDOy49/fs3wDJ3ym2+9K2fd2b0GvLmOKTiCGiGJYfXjXVnSkQoIzCQgTh7XPpV4xhdWRJm7X1aQNrt/UoKlb2DNNa0zl9LmypsuiJRWY0BBBTJ2Q/pk2K1gPGoh2qkNZetfZA3WmN3ypVrNiSkmKX55ukqVPnANg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=AviXwwtS; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="AviXwwtS"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4671cbce626so764557b6e.1
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 14:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773351342; x=1773956142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPNVzVW6bgaJTG3N2wOwIWATdO/pazw6O67WoVcKbUg=;
        b=AviXwwtS6MwaaumPv2JXAeMJHxrMzPbigIWNezQSEiAhVGs2Z6s9WfjOviJsV0+XcD
         YjMF9UiQqiRptrhq+ZeC0ioFJvbQCWtHNYHR0zjXYF7HRfTuBTsFFMQZ//ou9LR1GscN
         lrUmolGpjz1InYnJ9KUPB50l+fWyxRsLVyFPe4vjJbjmmP0QMtDwZfQa829alJUA8zE4
         8tvMs1AX9jALGL4IG01A6gnNCeWFScOHHW4o8i5No8pDSLgGtbQ9yOJ71sY5SLA/asE0
         uOh0LManRxGkSopW0A14ZRGXJKlhiNUSOwJv8+Tp1oW2x8kdLfUBhDBfVvZJ7VUIvkrK
         WtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773351342; x=1773956142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jPNVzVW6bgaJTG3N2wOwIWATdO/pazw6O67WoVcKbUg=;
        b=B9VO/dSzSnYhMlZJ4N7ddISS4nZ7+ENtQw8A5EJJ2kV2RFiJENlCdo7/CubeocMaP6
         pYJX4X1KI6kyvWkJBBezBrlQRG+xnANNZoq4K8XTy56D44TJaiblAaxPVPoulVRofcg0
         rKUUYM9+1b9Pi2lTIgJc/VNaWUW5kvpVpXpb694NgF/ftMyJSz/+jgjnsiGAzdiGFXEj
         5kgPjoH6RPO4Ny+pvjRNbH0vkebDBRdrmeXDTBwFJ/32ytQ2hpA6gYysdROp8ed1J5P/
         NiQACbOh328jLd/IcSFdvhzP1k7T9phNZpvBXwuStOlE71yQJ9MrX18DaZMi9cOKaed3
         t8ag==
X-Gm-Message-State: AOJu0YxPJzJxjW9YDYcFRYVQHvIvd/+MIwchkypuJRwDs5GH/slABj+R
	s7I3thlGxyjYT1gJf/enFI/WK/9/KZfKqdX7gkheXhUZTY7DTNFdA/OjY9OJhevlYm5j8L5iClk
	ma5hTcyU=
X-Gm-Gg: ATEYQzw/D2CHGhkKpcKdZpVu+vfkXbFlMo2njyFZgRGo4B2diqJw+iA1mDbdcG290jv
	AMihPWRV2if32oIiU7UeLKRwLc6Ky4ySKNuaZ5zzypk0pMuNgrzmr0A8MsReX+EQXnmcztE4xCs
	VMyRIVyeVfwaCDfAeYykAkenAH36Nv+w1Jg8C72r65985ht+SsSy5nM9HNGsZUtNdcphuRNsbC+
	yE7nMKQ5z8gHBtlTQNHvtl9RR9zdE4pyX9OmGUyBRad+Zpnc8vQr+j5hKG6BxjiOoW4TQBtEbt9
	oIVA5MsmYna/di7qnRvLRJB964Yx1vMwcDajFPSBKd3PiKs6VAtf8CKdopOJS2HLVtJAYPmF22o
	RdBw6H5+idJYctoPQiOLV+jZwaRebY+FYDPKZexvdt1Elsm7iIVV5eY3k5sk7eY9NSSLTlfB7z/
	J80bGBKWPuDdpQ7GeSJzfkh+mMdM+LE6p9p8rKlOOAfI/wunWkrzHo10JD/DPGwFc5SnOJzVUiV
	jH4dOurXfjENbmR9B0=
X-Received: by 2002:a05:6808:6611:b0:467:4939:965a with SMTP id 5614622812f47-46757403014mr414103b6e.44.1773351342471;
        Thu, 12 Mar 2026 14:35:42 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4673415c264sm3657572b6e.5.2026.03.12.14.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:35:42 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 10/11] em28xx: Add a variety of DualHD usb id
Date: Thu, 12 Mar 2026 16:35:31 -0500
Message-Id: <20260312213532.2907276-11-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260312213532.2907276-1-brad@nextdimension.cc>
References: <20260312213532.2907276-1-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include possible vid:pid combination of DualHD models
that are in the wild.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 59a2e4db75b7..2d19f8ecd685 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -2757,10 +2757,22 @@ struct usb_device_id em28xx_id_table[] = {
 			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_DVB },
 	{ USB_DEVICE(0x2040, 0x8265),
 			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_DVB },
+	{ USB_DEVICE(0x2040, 0x8269),
+			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_DVB },
+	{ USB_DEVICE(0x2040, 0x8278),
+			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_DVB },
 	{ USB_DEVICE(0x2040, 0x026d),
 			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 },
 	{ USB_DEVICE(0x2040, 0x826d),
 			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 },
+	{ USB_DEVICE(0x2040, 0x826e),
+			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 },
+	{ USB_DEVICE(0x2040, 0x826f),
+			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 },
+	{ USB_DEVICE(0x2040, 0x8270),
+			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 },
+	{ USB_DEVICE(0x2040, 0x8271),
+			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 },
 	{ USB_DEVICE(0x2040, 0x846d),
 			.driver_info = EM2874_BOARD_HAUPPAUGE_USB_QUADHD },
 	{ USB_DEVICE(0x0438, 0xb002),
-- 
2.35.1

