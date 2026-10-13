Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE9B52B1F6
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 15:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904679; cv=none; b=jd7CPEGD0R4GfegYMw8dBqkXmJP0KnqVozvxUJINbvn5xndWhU9vicS3k+A2emmNqbmth/IABM2PFa4eBE2EYsGuxS2P9cgG9cSLbDltxyIS+gsX28NFIc0V8/c8fr9zlehDu035DuJY3ksu/G/RUSmP5BhasjdTbk11i+VqaiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904679; c=relaxed/simple;
	bh=/Pg/lA+PGGTUTaRSb2VAfe+AADNa7ZquSZST8Ot6lWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VGbHvRnuerSadmqmj7sxuP8jf0AUSGzHEDSHt+loEo+XArTk5j2760GUX+Qu3MnKd9/F3PYF0Lv7BoFIPgavy/obSOBMiTtJE4/gMa7zykgOoHSu/V4TrakGki7gUK3tqeSDni5lxTvN6HSDOxo4t8JEjNxD5jmB/CvDYagrP5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=hIDLkT/L; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="hIDLkT/L"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so25100975e9.1
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 08:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904672; x=1792509472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1awOQo0azi8UyO4z3KRKovMgsi0c6QrgcvRhbUh0t1Y=;
        b=hIDLkT/L0Wnt4t9H3MJQkrIxFoT1xAtvPyarz3NLcZ+TqioNMsHEM1gGT/PnaCx8ct
         bQZjRhnbjhWi+QAwfIqEj4uz4n1A5dgna2fhfEEMgci8+r5X9HDpwMeuxp5ELSCnG/0G
         ejdKscrULw+HYGrHD60UME4XJQrBJI9tJ3lZCy/kM3ezxSelxRwhoslIDDOIdTWs57jd
         atJlyNk5t9TDW/AkGO4csR3sduiQ/rk77//EhFcjpsseUpVHeaUNdAEsSLaBw+87NZ0E
         bxedCG247AEZBtFNVKwjRFJ5wf4Ix1bODR68BVGmbny2rDQwvZyG9H0Y4LuuR4jyj0nH
         k7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904672; x=1792509472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1awOQo0azi8UyO4z3KRKovMgsi0c6QrgcvRhbUh0t1Y=;
        b=Fz62CTj/UgGQ3IQejHDG088AtW3zsTo5lILJOGgNWqkrK+X+8fWWee+gf5C0on/ttD
         j6wKz50ykpryLBtSZJ9TABrWxY63+g/4n9ySbHuHQH60OEsn80VYvjnPCJEOc7daTdxh
         S3AGx41aaF2/VsksbBtLFZ85HVjsldjDqA5Dr9LW0PR3PAulhofq6buxqEVuCbq+7+N1
         jNBGe0lyp9N62W9DhP/Eh1QMopo13FqfutzQkxePaseOMj0RFVEU+8HrIyRvciMeKRIC
         ETEWm7hpO8mV/vtiDMnyVBWn4lGblx2BXRyG3PKyRJfbeqXXYOf42guHcfOLQ0PO7xNq
         hitg==
X-Forwarded-Encrypted: i=1; AKwUvBx7rRtcBiG4H/MAxqppUvf5kMJKcH71mkn9S4A+fyCFjh0dlbhbKCt8VK4yIc9eRqm3rsipoho6H601JA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJLwF/CO4eRod/24kSDjCe7CtsTESVKFdCIWqQc826HvvZvORXK
	G/TXJ+GxXW3HTA7iYTIIHEDdqLBRfk8TOX1RCm7fVUM8A7eQW0rmLh4zEr1HButF4Ew=
X-Gm-Gg: AYBFou3struKqApmrvCh4MMEOImpO7CnV61PwqGP9sSKv/iDTiFZA8RIB1dcWwg5ozK
	hVHpb+cYyjiNsnf2WNYzKyecYMXmHJqmF/FKRBLmfLW82uryVz8oLNNoCEGL/3iHRsgsw419d2O
	2Cev/cFmKpq/EHseDE9gXK4j6wmBir9ogk9HNYkzhaBVjaHe/Shs2O33COuUWGHoTUCszJ2PGJE
	OuYGzP1U0NNYTpN/0C7Gt9/PL/Wl6gqAbuWj247ycQ6gm65hKhyeuUma/BkF0+W8nC+Fz9Ml175
	Uyz6M1dLr1ovXYOw11uGucryMsNPTsyACjs4nFxsSzxweYipJTGou1Yn9K4Bgz72Y+8WMbRwy2f
	7xIUda1Stb5YLmFLNRvptm76rcIMDR5WBZHIYkztTANd0GKJyLU797IX1NWN9RaEHre6Y9tZ6Sj
	HUtLqLDsvaBZyrzN2AxcThLFef8WFz34Otx41d+ICKbCCsoJ5fUAheW9l6zukWrNH57tEmlXAaJ
	nQtGVp32nK4s7NM87ODeKlOqD3MizMEF2rF9oodtmucPCZMxQ==
X-Received: by 2002:a05:600c:1e0f:b0:4a0:1f51:ba2d with SMTP id 5b1f17b1804b1-4a18e4adcbamr242423375e9.22.1791904672279;
        Tue, 13 Oct 2026 08:17:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:51 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:17:11 +0100
Subject: [PATCH v2 12/13] media: sony-starvis2: Only update bits for window
 mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-media-starvis2-v2-12-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
In-Reply-To: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
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
index 1a2a5d45bcc5..1ce2b86c57ac 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -88,6 +88,7 @@
 
 /* Crop */
 #define STARVIS2_REG_WINMODE		CCI_REG8(0x3018)
+#define STARVIS2_REG_WINMODE_MASK	0x0f
 #define STARVIS2_REG_PIX_HST		CCI_REG16_LE(0x303c)
 #define STARVIS2_REG_PIX_HWIDTH		CCI_REG16_LE(0x303e)
 #define STARVIS2_REG_PIX_VST		CCI_REG16_LE(0x3044)
@@ -1455,7 +1456,8 @@ static int starvis2_program_window(struct starvis2 *starvis2,
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

