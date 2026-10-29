Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283533;
	b=s7DzUyi6O3RP8Ls2zdi1Hc8qipszP3QFaOcyNJ36OftjDU2okTiDU2GhfWSAqLmypDYV
	 0UcKhoAA4cL05BIPAi44x6uCQ0AZ5naHOpacQc4ifKcOk1ylRa8jo4CFtbE8aye1Snaly
	 wLX7Jetrg5VJpB4RjbBjhYRiHqMO0ZNKoj5sN2VyeZMPjzskCVy5YzAvyHSm3mDEfFUq+
	 o8x6Tahr3DRjWgdjOp4uDRhePobgHOgd0q1xykjTAWmM+UqI11N9lEnhfy4U4/QR4T9Ba
	 ZBmvGCrliN9IWW2ZmyDy+l3lOw5wZceHPd+PwwOzJq0w9Gyet0YZNi9gryvanI25b6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=djTWxpT1ovKkbA0vbSvCTa6GvH4LLAvCDTO8fermq8s=;
	b=qgsqy1ad+QLOj3N80Hi6svfi6QY0b3OtTSH7lQoyxVk2b7gC3Av1OVxJH7jJUGSJPvrt
	 JMQJidpulBRF2vCzzP1KzTkzX+jlVvceNpI5jnDLcUInSo7h8xWHMc3bSwYGI5cXbIPmI
	 JhnQqKrfkC1sztLPv2sgn5LYTVh/3cei7qxH00R94snnDEakRySlTQ53tyJscgKYg6PS6
	 sjZ+/3wG9IvlxnNm4wr55xOeINqc+6/+Zhcf6Z1PNHe0vJVvUkIAunxqd+mLBLRMEWrn9
	 CCEbYDGJFi8BZcBlADQ+tCkQ2frUfHqRlCbm9u8vIExD1/AEb61+5o8h2HKuywO5wWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=QhnmnWsU;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D896606B6FD
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D896606B6FD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=QhnmnWsU
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so4099715e9.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283532; x=1793888332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djTWxpT1ovKkbA0vbSvCTa6GvH4LLAvCDTO8fermq8s=;
        b=QhnmnWsUnRd5bHwtpI5KZOuYEAr3vXbrhyKeTMDPR0RR2Bb/SXnIyYtlgk3WZqHwFz
         brsf+OiECI4jf1kP3Lwmuy0QHAyQ6ityEuPefx/O7cx2C+sZh5CXhRYHDV1ZuCciE2Jl
         yObJ/XsNaFN4rPUDOP/Ft5HXC0jL92cfkWctTm/pnX6Z07FN4777+PCTpm2rh2VGqiV7
         KfEVlcHcoAjBoWrFfU9OsFkTScGslUgkBpRCn5gj2gr0gD34atCUcL1SyM1zncqgjNvS
         uX3N0w5FVggMYTU4xf24bSvkP9KLwlAvAtpPVRucZmzZmmVvT+5t7zAdpJYLMXEH0qOl
         ut8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283532; x=1793888332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djTWxpT1ovKkbA0vbSvCTa6GvH4LLAvCDTO8fermq8s=;
        b=txbD42YRhqHIiyGbzWyRU97kpmNmj6t0UCfQq4YKZdxy1oQ7JgE9laFwLDW2ehQCwR
         +d6Cu0FSjD2ldr95tSc4gwNUauHUYCei9zKmlCJtAROjaZIpuo1V1jPVm88GZ0furaFg
         YImlyQy9+1B5THUPN6/HxwoEFEOPFZCWiFwa0T8hWZbtnrF9mczkYOx5UOUQwa4PAQlz
         DlHVAnx2/2Kn8UGEjJPqeWwyRLUHkA4TBDPnsRWMeXzGNYeRFlQsGE+6zb3JfChefzHu
         I1U9M5vEYDV07dxfAYPLyqPFJcGojl0j/S5JcWgOiJeu2myiTkdAdYo0oPGvy1uakz+A
         ejqg==
X-Forwarded-Encrypted: i=1; AKwUvBxxJF4z1AU0up7eCcwxGXyJFafugiLT/ST+S3NV0LGZShIhH96bmfqJb6ga6OeHW5Hj/3SaAHRWoeDUsQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIdVozGsDkNZ9olBtJhJ/3wY836R5M2JjS18DN+u1UCfslGpr9g
	gYZzF6IvNwHT3XQbVY0vGFPcxs5crWYbwOtbzav9NHtXXTiMgiPeSii05dsYn0z1h3Y=
X-Gm-Gg: AYBFou3tD3uzdBsGw5DfyxDjGKqXnsR/UMzipymSk6je629r/TM1O006krKZOrWF6KY
	bXTRrg6wgWSHgSGM0x73CXNvDx9/Tc6mBR0j6MPrKVju13kxz1KQrDWN23YPzDYMJecKpJFWrgU
	v/vy8yV7X7D0ehZOq5LLdIa0ZlzedbR7zZSKitTgq/t1dup4z7/3uQqaQg/nFMrfg2oCunXW0Lp
	Ynl16uqAfL+5Yx3QQDon8JAcziEwYhZ+1mbdIyvVvfvUNxzYt8fqJ3v0Rn56usex3SachYUW0Y0
	Q00TBbHc1JbgZD0mmQxke1ZyT/64Mq7K8telF9D/+23A05EiOLiBMH3DqHsLPtVczlIgf68LhG4
	m7zmuq4tCiiZp9jiJig8B6rIFzT0gNx8Zlvhm/ztALpc+Za5SLxGwt5aUN8VqJ/+GCau4XJkHKJ
	24mwh6YnwrPxmthCFbA7xdWMprnrto2tszoQw+71KEhS/Lkiar8dQGdz0YhTKDiGBsT7U6xHYRj
	n37ZHJkynZmhuQJFWyteTD0winFDnQLD8vrYT0nerKfcSQK8ZQy8HgGdPhoxljNckPr+yOUozZW
	0E1jGh5zYNTS/IjRTZl6noqLmGIYrU8Aj+HYd0BcoxUVey+cG1Nrp58RPPL5ZWfjqs202kPloNu
	HosYpMQlLwsYmDF5M0nXja9nQLg==
X-Received: by 2002:a05:600c:8b08:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4aa86a42502mr68687295e9.4.1793283531711;
        Thu, 29 Oct 2026 07:18:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:51 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:35 +0000
Subject: [PATCH v7 14/18] media: sony-starvis2: Only update bits for window
 mode
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
Message-Id: <20261029-media-starvis2-v7-14-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

IMX585 requires bit 4 of the WINMODE register (0x3018) to be
set, whilst the bottom nibble selects between all-pixel and
window mode.

Switch to using cci_update_bits so that only the bottom nibble
is updated, thereby working on all supported Starvis2 sensors.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 645417cc08fb..e64d943369b1 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -89,6 +89,7 @@
 
 /* Crop */
 #define STARVIS2_REG_WINMODE		CCI_REG8(0x3018)
+#define STARVIS2_REG_WINMODE_MASK	0x0f
 #define STARVIS2_REG_PIX_HST		CCI_REG16_LE(0x303c)
 #define STARVIS2_REG_PIX_HWIDTH		CCI_REG16_LE(0x303e)
 #define STARVIS2_REG_PIX_VST		CCI_REG16_LE(0x3044)
@@ -1460,7 +1461,8 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
+	cci_update_bits(starvis2->cci, STARVIS2_REG_WINMODE,
+			STARVIS2_REG_WINMODE_MASK, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - starvis2->variant->active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

