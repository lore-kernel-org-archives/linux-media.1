Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FE9481AB7
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 16:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946320; cv=none; b=DurGJTbes2zTg4oCP4hPvPnnDsWRL1UZgYbC01NxcYRXwuHYffGhfhONV1i9zKUKL4vHGtFvzmkBr0ENWaBaklaDwJJ/sjlv9k8quGctYuTIaO43+DwJ0rXLXlTHbxXSlnqMPHds8YIbEBs/nc1jxSDbslWDigiWNyLEV5fQido=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946320; c=relaxed/simple;
	bh=k2tmsV927fEWq+0uoPJfB+l7KPP84PEO2Drh0XIEcB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZjAnQNT/UG1hh4BpX9c3O+vYTmBQKo8TJQJrCiy/ju/gLSydkBbHU0DXyV98knOo2xb2ixACdM1DpWHudZ/RTfb3NgWeZy4vXHtWi0lJqzdEOtQfVybC+P3odTqAXJx1FJ0FPDD7OnfcPBsNw6rCOq9hNsGrKz8e8XeZIl0bvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Ue0lP9ra; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Ue0lP9ra"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso771786f8f.1
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 09:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1785946314; x=1786551114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/hiUWokFGsvqlinNWj7i/VJuE+r3v8Euned1qXrpkk=;
        b=Ue0lP9ra2y1VhGTL+LdBQN+l4YE/wzScxlxjROn8LpZWGs+6I5Us8KjK7s5jSiNb20
         8DcexvupRoL9pDLLeHtnzN1RjiW6BMhxjyi17Dqdly4DxE1Rhey+Te910216HwQBg2Ox
         dkqJJFsmCo11gpXyaGvJ5KeS96EJ1M4goQvLpzO5SUZ1JGaAl1+uoNQK17ibxi9pfBXS
         gA/Wbs3zM971lQjws5fxCSFW1OXQF24kX2iSS+HkgkJUssumz8wdmCs0x5caw4vFUXe5
         DAgJWrWuHR7RmWLjxr3F0D/QVZ5nmOFABIpPHXEDvVdEwJjZR28LfLjxKYyxe9QItYJl
         lUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785946314; x=1786551114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/hiUWokFGsvqlinNWj7i/VJuE+r3v8Euned1qXrpkk=;
        b=HB4BWa/xoQS51h+c2k8VJQjHkZ4ahL/H4Aw6yVdXeqkJJkPLG2rJo6ByLd9jwcsYUF
         u5gUmf1z0g1RQoEFMHYXIOBK6GLYruyirF5Rzbk0BjON1XnkSm+Be5rd8uz+BbvAA3YE
         ZxH9VMfRhFcsCKluJR2nFMq0g/LA1IwESucOeogv5vmngAwX0EPrHWO/MQUMrVK3C0je
         bFz4AF9Str49D0sNl1wuzY7WRDzV2DeTkgtcSJpJk54SbXDCLi5Ie8ySHCgY389m5wXg
         0HBilKjUGTWiTBrdFC3Tjgf7OQXBF1BoCl81yP4c9fBEkKe+enM+YqQWPzQxEUIsEmgj
         FEzQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXtWbmopyTTkecGY10IqZNmJ278ec80AjDmrnlVcxbJLuM1gSpm00YOXWs7SWrSW3RIZm86ybW3pRg/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf/0qO5Rsb7aD2SoMfEOG9e980pFTC3rkd78QeqUh3NveKhuEE
	5H6qh/01z+o3MoYg1gcig/OEfzxASX3DF16gikek05TvLde0qfEf7bDqeCtCQ8GFS6E=
X-Gm-Gg: AR+sD12tVdHXY8rpsrX/Dm2umAutZy7Aoo7TciJxRIYHmh4f1rR5NbI4DSAlplGidsG
	VYrcO712L3QXnNenA5HOsgKsij636EMtfETuc7zbqByZYfNjyyyvKu/zQpVkfljhhxK6noREZUv
	EV9IV2m6sYG26pbVLRP/iV4v5y0hcbjTvG3J+fgtMtyWT3gsev7ZAMPriJpv54I0o9LhhztKNbb
	KiYzWXORf91IfKsi9hfash2YoaxoIYdMTQa24QPu0e3jdJgxChnQUiBbXxOQs6bnYLUBp1E+Fb7
	1n8rXG2ealeC7rExem6Cx2Mm9GQoIzmqYB5qgXdIp5NuQrJozTAjMG+UJVsULdi+xUQBo5CEWLU
	5sjLqljItmlRzusWM8Jyfgv9mILlehCkQ8rcth803yBmE9ZwYsjuuhr13VY6IDF9Q3ZtMn/ZRA6
	VlBBvdHClztOJ8cAXfFbCDqpT6HdlS79K2RXT3DX0BuHdqexz2yhwCGL7phlCE8vrFgYvW9Evkw
	kDFQasWFfrpZMZHTX6GiNuzl9mCpFOPlu56DT5e
X-Received: by 2002:a05:600c:840f:b0:493:bacb:1341 with SMTP id 5b1f17b1804b1-4994e72605emr94806895e9.4.1785946314017;
        Wed, 05 Aug 2026 09:11:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47febfda0cbsm9802575f8f.6.2026.08.05.09.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:11:53 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 05 Aug 2026 17:09:16 +0100
Subject: [PATCH RFC 1/4] media: i2c: imx678: Always program the sensor in
 window mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-media-starvis2-v1-1-91e8e4eae44f@raspberrypi.com>
References: <20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com>
In-Reply-To: <20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

If the requested region matched the defined active area then
the driver switched to all-pixel mode. This left the possibilty
that the activeare was incorrect and not reading out the area
expected.

Switch to always requesting window mode.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx678.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
index 0efbf43d2fe6..f7b988dca2ac 100644
--- a/drivers/media/i2c/imx678.c
+++ b/drivers/media/i2c/imx678.c
@@ -917,9 +917,7 @@ static int imx678_program_window(struct imx678 *imx678,
 	int ret = 0;
 
 	cci_write(imx678->cci, IMX678_REG_ADDMODE, 0x00, &ret);
-	cci_write(imx678->cci, IMX678_REG_WINMODE,
-		  v4l2_rect_equal(crop, &imx678_active_area) ? 0x00 : 0x04,
-		  &ret);
+	cci_write(imx678->cci, IMX678_REG_WINMODE, 0x04, &ret);
 	cci_write(imx678->cci, IMX678_REG_PIX_HST,
 		  crop->left - imx678_active_area.left, &ret);
 	cci_write(imx678->cci, IMX678_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

