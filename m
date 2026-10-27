Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142512;
	b=KRL3AhxMKTzXeey1QbA9tl7XQuvz0NZBHcvrI9xBlxRdZpl3jAd1twPM/ZDtUosrE3D1
	 uwtmqiSHfzarfhR62fndxV/ntY3gvX0R/T24tcr1V3KJSwU6jc5FrJizkjL4izCc2HpUz
	 SuqBJBt1heGa/D/z2XaqqheZh0ebxnG6Eev6ZeW0Jvi1JTUEh9rp7HWFT2FF/I9ATZEZC
	 ygj7SpYwnsYQv1igG9GXgaRtObj8LGSVf2KNNqPiSmRGZ/sHQ8ZH50txm0lo0uc6kVQzs
	 /s+sSEuHYVqHDU0WWG7exzTjb7+KImufKc670lm2nPmslwP/N+mNlRLtxXv6LIXrJag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KDHtD5ywbRxioPIq0YKT2Vds05KTerYZgbBjOpP/OdQ=;
	b=QGV4l/pBfZRc7HWc0F4VaXwYUDhI0UJe5jeeQCFjTDUjriITKjYPLWA5jF4If7qKK5+/
	 En2ok+3nEJr0vQeY6aPTY/7dJdIKS0NkxZzxQrVFQ4BGiwsI+ZJRI23rctSpBXHZQ2G/f
	 GxgfDZvFTEF7DYHgO2+hDWxwJcNi2pvyQ293bObePqgde5zDoIJU62RpQ0Qc18aqcwj+e
	 OToPj35qvQEB/+FMkDJMxm3F+guIvOXFVmGkgPOkitlG2OrZ/v7LoG+iS8NpxwBci3ZTC
	 9jFZb4Vk/wk6hjtiq17zkKLTrZI6xA8N5QaEE31KD00wvJuyUKKr5HHEHCUp+vDKixQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vDPLUU6b;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A80606A323
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 23:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65A80606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vDPLUU6b
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso2506825e9.2
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 16:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142510; x=1793747310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KDHtD5ywbRxioPIq0YKT2Vds05KTerYZgbBjOpP/OdQ=;
        b=vDPLUU6bhwuiT46IocsLP05KNPdHPKlTtwnMel+V3yg8SRENI1X4qrt1yOFB0krlna
         G5wWYjgs3TZ7MTzg7jb1A7slOKkmvcWp61hbJS8M2Idwv1p5eeSmOXWXePaKsAowgxwu
         SFukW3X6XvwU+1j3AwXV0125vnsClqCM4HopEh53VGQkJJ1fKwH+9gxwTvRrjZtWbF+Y
         qBBmwvFF/4vC71rbutbuTAPs/g3LIsC8m90/2kCL33qv7bsjU8lcALmBQ8xLAycvELVr
         OU1iN2J/qPMEl+aRpFD+SjgwAenvvJRrOgMwM0bNpnO65NnY8GqQ31wsWii6FbQudwEa
         Oo6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142510; x=1793747310;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDHtD5ywbRxioPIq0YKT2Vds05KTerYZgbBjOpP/OdQ=;
        b=lS5n9WWb7VPNkvNm5Doa+Vs1gV383tMpp8mEdlqRk9Mj18sDrFycoN4RuOEnxp8HzF
         u66daoyoCRvNGNigR1jZ8m0nDy9rzyXIv5XVChMAmWks5+f4XY/TPWl59M58bjXECMGg
         psweKhA1dpgedEyw2dmpb9nwTo0pDbu6h9N6N8Evgvm+BZzlasHUK3OY1t447zTTTEvG
         v81Hh1UmodpEnMrZWRDX9EJ9ux+tUFW+hCbRmXuV8nozluzoAFIYeUJS6ovL3Xm8zeRS
         RfqBF5Tr7RW3ikewxZ9zzbzRMc7eZqPG7GyHbKpz/2mlWiqTqO10SzrhkCVJ1+NYodwH
         SktQ==
X-Forwarded-Encrypted: i=1; AKwUvBwO9no/lRo3vD518XSQGKac3R6pXdpzu49s+0vdhn4O7NlBZet7v6j46+dGvhtXKtEJ0LgiETYc6PPdmg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL0lptclX2Oem9rvPU+Ri9k5GLEx2tNi7SbA8NOoelKmIRVwm+d
	CicHZxkJNLb47wC2SArwfL3tKlMPVljGC2LRnfv0Qjo5cq6jC2Ft/yf5
X-Gm-Gg: AYBFou1bGV6W1jPenQ5DHbb3Fs/reRiyOMjT5SqjFq4g9jRfyigRMkFw5ZLB0r2inTE
	/RVOaZ3G363NcuVMcN6bZpqKv73EGwkPJU3TXuUBh/4lxf4RwCH1IuIHoy83jb1osHiYQvMFv1i
	a/xFLsomc+lc5nU0HovC+X0n/f6ad2MBxP5Yt5yhb5KMqgb+hGN859WpEpO5BvuowZMVCp6mZz8
	/qaEpArlahgRC1TV6juwNLCRrzQG8dGqwK1IjvGlW4dEX35haT6/7xmEe1PndD0JmkLLZ84g9CI
	vIybbK/9AJgOpDIx38s6u0cYvbaTRU6bp+9OMCLgIWyLm08Hr0nkDNZ7U9XbKb9hLuwf11068Cg
	YjcidzuvTzVyIo8feKgCDmqpl40STo00hpLbpbo5NgP/G4ae/wIJxUM6OhrbLCdVPABLalFp9KK
	GtD+k92i4TKcpDswxWuXoKUfB7Se5B7Kts1IBIiAIe8d8eOfv7xm6LtWyoygPREGwe8P+GPwRa1
	hczPkc3Sbrc5Gfnt6MTv+BLz6zIKaMIl5ZXj3yPeTm0GDQx8aqJnjnGmczJCZ54kBxuiw2RECY1
	8No=
X-Received: by 2002:a05:600c:348f:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4a9678c68c3mr7755225e9.34.1793142509776;
        Tue, 27 Oct 2026 16:08:29 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97cebf858sm3407595e9.12.2026.10.27.16.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:08:29 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4 1/5] media: atomisp: sh_css_mipi: include assert_support.h directly
Date: Tue, 27 Oct 2026 23:08:03 +0000
Message-ID: <20261027230807.2407261-2-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027230807.2407261-1-vladurares@gmail.com>
References: <20261027230807.2407261-1-vladurares@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sh_css_mipi.c uses assert() but only gets its definition indirectly
through the circbuf headers. Include assert_support.h directly so the
file does not depend on that include chain.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 971b685cdb58b..83424b6ce1713 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
+#include "assert_support.h"
 #include "ia_css_mipi.h"
 #include "sh_css_mipi.h"
 #include <type_support.h>
-- 
2.43.0

