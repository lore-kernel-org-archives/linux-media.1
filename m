Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FE73E1681
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 23:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872672; cv=none; b=MPCbylU5bMl2yibz/KCwxTOnWgGdrgxtPFPYBvJ9Evx1lnjdpuuitkb7pgVSrSaIjVX3Pzzw/HGicfcop0CVJn05OOPhhA3wH4aL4ya5KVtNUZs3URIg/2QqQiZQ32hsHAQAmDBmrZgkNlpUECoInY6as1mF+2vUjQmNtrVds3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872672; c=relaxed/simple;
	bh=GY/0GwAYKkdGCB2mGjNb9iNJ3uZoj4B7s9rKLLBlD0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8IAwVfIY5onLKVuCU0vmifmYNUKbyK74DNqFjCQ8Y6THQBtXkUfr77LnmJw+M9rvMjY7sY/77Y8u9loBuGIAgMx+OUIp/XmkFRHf01p00LiY1XYRg0cUTZtfDBrIFsUmEbKr0wuayOsxzGeh7hQMsofKcjGH8t7ykRW2vZ3+YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLmqJx6K; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLmqJx6K"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so2536705e9.1
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 16:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872666; x=1788477466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=SLmqJx6KENDlA3HWX3/B2Jlzs+1C8LXoaQmcIiKMrZTQ+n2IU6xPCl3MvsON92Qvm1
         vS4dK9egs0GO1x412hC6XXZVh1YySpGpEzCUdDLQrOabfP3H8wkFPrLTeTGuhsCzNZRP
         x/HDZgkxIH/OGisiTdH5G7I2D7OjhdDZpL3s4eWDo83bJ/pIn9T4A3tl9oORgzxOVi2U
         rYI95HTDb7V02X8Qn79EcA47pqNKNKxXamqc3jQTwNf3qA0GvtwxLlQg02UYzQ5veON+
         TpzbPeDmeyQWtivwkD72NzPd2E7CtVeLYOfRRgPhWFcAEOAawX0R3+gJjB0Nzb4YuxNt
         OQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872666; x=1788477466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=PtKO3yLWRyYYyrcZ4hOryKtCXv06WKTyMTQC9vpk1kXQhsCh+zl+vf6z+Vh91Uy6EA
         MREgA6Xom2dd//D7UiE2iVnNWepMdY9qtVovBZpvgLs7pc0OGK8oUacDCBkZXKuIcwQK
         luaw1OOZSAGg6mc8wXQOAyNI/2EO6tdeGtNc4WuBjHW3cM2PX/V4a73qwwRU0WPWws50
         eOlK4xbKepb/mLd3smt3+fVvnnVLhCK8oWwZTEyIRdWDrQChXNBdampQ1eRsruIxqpPq
         I3Te8GUf4g5CkukqNbCTPPTIxVm7AdUp1/cPJeqc7f5Y1k1TRo4r221SzZTkZVgkLLJQ
         /SwQ==
X-Gm-Message-State: AFuF++kDouM3b+klrkjdaw1XUJZ5dfms6nygNx5wv+0nFdGcyMA5DHE3
	RIQrWrD4mAsCnd99xyUwHz0NbTEpVHSW7ZM20lXMjoiDmKlXF6RZiIYVSw28CACt
X-Gm-Gg: AR+sD119GV1qvhgQWWzfz/gdhuuMylu8B1L+53RALRfGPdbzI9vkYP0mgrbCVHPdNyH
	KaUh3wxwZi6VMU8lpHOQQknoPQ4nnVJQClgeL7vweKbdNlnKhNP3wXCWtImTMQYgIEsOhYT4/fv
	qZp+oF7D72yRuW6p8k/V/3GsdMG4I5AtRLRWeaWK168/Avh4ypjKl1wOo+x0ivPC4B3D8VJdj2Q
	yZiF7/sZlmi7WHjEu9tutbcM61JzdV7sH/1DdqY1YcciuPtGCtonFkMzm/KUyTfm4KV1n55v43M
	6cMeUABhFP1mvnoHcIfa8Gj57NjFIm7Lv8cIlB3BfywDe3BbA2hxfaicf+oEJmTAteiF0eynA6/
	X5v8BVJN+uxkiwkJCexzjLbBjNhtA0UnlpN5ynPdJ3zbk+Tu0kVTkSQ9edk2C6mhAsTabVqzqZg
	PUjJ4zIUW7cd72dtuCcBWrQTysAe9gK/PBF5ySdXO7JGV8uKsv+DLcJ/uOs3cV0jy2rUoelYTJn
	6VgzZ683hpuEeISvL8IATal8vwN5txkhPPHh5T5Akh91CzJbiEytTA=
X-Received: by 2002:a05:600c:3546:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-49b91c19d68mr30266455e9.3.1787872665851;
        Thu, 27 Aug 2026 16:17:45 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:45 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v3 04/12] media: ov2740: Add OVTI2740 ACPI ID
Date: Fri, 28 Aug 2026 01:17:22 +0200
Message-ID: <49e05167a81e22557b7cb08c94131e774e524379.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.1787872237.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
Add it to the existing ACPI match table.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 8f0ad5dbb245..18bb3ac9701f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,6 +1462,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{ .id = "INT3474" },
+	{ .id = "OVTI2740" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
-- 
2.53.0

