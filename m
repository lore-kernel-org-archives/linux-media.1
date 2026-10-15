Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A224F30C1
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 15:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079894; cv=none; b=OB434zHr0B708txWKtnrbrPvpKUNY3wts1S0qwca4w4+oOlyZkSEXrq67jNAQOOdi+927MO6V/VncaX9d76v4WgJ56Vg76DFMNGRFHAN/Juv55HByx8QDiCbjxSPztgpHs5X9p/rv31kI+kO/1ISvp//4BWG/6VndVpx+GRpw04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079894; c=relaxed/simple;
	bh=sLWl2JQyqeVAhWGermIWldFQTk+p5V7tPme605FCGQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UqvMYExmQSdBOM5PUrjYGnQgQwYIeW3OcV1uHCGLaJbwQspOOT3Jzbt0iOwA39ADHq3b+MGEQiB0QjmWjJ53cI9t3VInlvasG/4dpB/rSNeYaKi1P5G7YtAlQHF+q58yslSHXBEY5++ann4+NJ74zmmdzFxizln4dDRNRBKjwmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=DytEZA3Q; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="DytEZA3Q"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afe75f055so602163f8f.2
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 08:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079871; x=1792684671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPi1pScmOBdXgs8foC5HPXZ0T/2VagZrymR7BUhJAbs=;
        b=DytEZA3QcNhJ5Smqn6mkSHuHblk3pgOFPEBPKAmL1+Gs8k4O8miWjjc63HXeNM8xvE
         eaFyAYfeZ0V52FeopEph6UvEskE59AgtvoFJ4shhfB3vXpKky8Qija1yJMScyd5dv53+
         vbuHyxgKi+9NlXpr87IKaL8BV7LpP5YDQLvEu5e7q+HaaLWdD+AoN754IF4tu9vtnXb8
         Yh9eyVclAuBA8mjy2aePvY6+2BOqj+RwQuuU80mpLmMzzWgA0F7GhxtshDCSDdGDUy2t
         mod6KW7PWW1XRIE8SMn/C1eeAxaeg/r3OqAWDi3lgNK4Wd3BD57zLdVOwbd/IYQW/wXI
         yTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079871; x=1792684671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPi1pScmOBdXgs8foC5HPXZ0T/2VagZrymR7BUhJAbs=;
        b=URUp3OjP//PMTHQQ0VVXNZFzHxyLqAHsAvxsnGVzddqxxlAjqtKlK1OepO5vKouCjk
         uZnsUwhyDkvLMrJIBew6zKtW092F1a5IDgL8JNHBOUIdQsyOW91rrxjQotvtXHBrJZhr
         i/cNdi0O0WyFtzDWSZjP8hi0MII+XcIQ3L5DQTk+wJWpOAYvNZejnsr1nqptb4XToZ0E
         p4eSxRYMzDXPdhBwd6uqZjJVjHzcOtFmTi3EHuo8ExbBQ+WvHEsFRSqQ1Fb+RXj9gljP
         1QUDmtaUhe2JWF3TFQFHZXGnFXotbXSIWKm5wmQgBF0rGR3DlBZnOJlfaMBUXDDXWD6z
         Unfg==
X-Forwarded-Encrypted: i=1; AKwUvBwi3eW7b6Gm29aHWFKYbASpwhS2oqvHbbnbbvbDl3DEU3N03SgM34t/Y/Aal/7MjdeuMjNGc4rcgSrJkw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIZtVTBfaHYgFAVorYOB6v5yEVL1y3cReFlTuoB/f/JdxAhHI97
	y9D618NlnR+DK9wn1/CALid7rzKB/x6q69ZF7d+n1z30LGH/hOM6R0JqQV31LHQ1A88=
X-Gm-Gg: AYBFou1c0Xwsjur4IyYr5ZHChS5qVwUxdelw9LRSoM1SItMhQnx08NJM7X2aEWHiM2k
	GP02GbaAFy53UBvrJOgPx+hdv58WT/Lx9QasQroAdYsbiCNF9rctPTxGTGgW/NHA97EwdZt9cS+
	fjgZ5EGCaZN1tvKwXWG+Tt6YIJ1XrqFdKy7IdOXV6b9XeBm2z+73aNMnpueH2IOMz/5iBakJh48
	V523A8gPg7do+GWFTQQtQb5xTxFn+pb6q3wAiJoG7oc7Ttmtmp2XbNLvjGUZZQQLfNXjT6KY9tt
	7vKompVrpsPMI7RN7CuP3piuDV1rM/bxt4QqMR1eI2dJAqwlFGZKOHM6l0sdBwPUYMS0apoYR5B
	ey1iBwfXu9aav3QalURNw5oetdZi+DPXWN7ScP88GGZzngWB6yogpy3NBLYzhhsOxJiF9UzIyU8
	frgjbf5tkuiSNEh84EHiwLslHpNTkgeGAPDYF5AmcS6pYULxnOBG2Ji/vk/fxa3Wt0UuKvnWYbc
	RKCRP9LSJgi+CiF/5c4w9JphIi6bxHBEqyXFQ1y/Ovvy8VslA==
X-Received: by 2002:a05:6000:298f:20b0:489:bc38:9438 with SMTP id ffacd0b85a97d-48dbaae70a1mr31060964f8f.29.1792079870916;
        Thu, 15 Oct 2026 08:57:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:50 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:40 +0100
Subject: [PATCH v4 14/16] media: sony-starvis2: Only update bits for window
 mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-14-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
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
index 1dec5d923077..8585f5c93dc2 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -88,6 +88,7 @@
 
 /* Crop */
 #define STARVIS2_REG_WINMODE		CCI_REG8(0x3018)
+#define STARVIS2_REG_WINMODE_MASK	0x0f
 #define STARVIS2_REG_PIX_HST		CCI_REG16_LE(0x303c)
 #define STARVIS2_REG_PIX_HWIDTH		CCI_REG16_LE(0x303e)
 #define STARVIS2_REG_PIX_VST		CCI_REG16_LE(0x3044)
@@ -1458,7 +1459,8 @@ static int starvis2_program_window(struct starvis2 *starvis2,
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

