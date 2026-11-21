Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267990;
	b=AXJKEOQJyXrAcFG4sBgZUhX8qXGeQansU+eFFJK8M4VrGMfzSJq1/xHnslu/8dmnpYGl
	 hyeHv1+cCePjavRoKuIkxYo1FyF9Z2rFwz8sdG61JYnGoz9NFMNrwUAQ6w/knRHB3w6ui
	 /a0XqPN9kAB6oeSnMNfliPhTggjdqP9KAUFp6zhF8fURpLXxjjJRwMCn1gyZHptylJ6bo
	 bYSXDJkc0TbdgxaDb1glaDfQiZKfSqWaBsAOTVLfHSviMCqLkqqzv/fe2/7oW4ruNgrDD
	 RF549H+ah9MH44aLbxVDIkCmF4/wVm0wvk/EyljOJ6eRtOd78hEREZwfOcsyKHYYdZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6QT4nVTPYrmhTuKzdl9GjNrcRlKRJg4+DT5qc8f1gZg=;
	b=yugOpWlJSbfNUqsCO/QxiP9Hb9GB/uo2Mg78/gLQugfLEU0PvxniXohTotcHVB1LFAli
	 A2P1bOLQCc3fAwKDK1VGUVfOZAPSKPWyAk3DqstIgWF1cSbceGalxNojw1BcyT/X79a36
	 MLsDWtBF9XakZfMt0/4IcGJgIL0JmjvQkoPXwPApk5Q/fx5ULiRX0yUX5hYBx+bR1JGEG
	 XYtMUnSOsJskI53XlikIRS1PSgg9xy9w3cU5ZDlm3cfCEJRoaWoldcWkGI0E+K4805X1a
	 uv4QiyXlt23MxnIifS2BcQLWVYEwgSX+fTNYRGvGHxigf/gqq9WgYEwrLpOuBoWmLIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvQT0Hrp;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76311606A68E
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 13:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76311606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvQT0Hrp
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso13714065e9.2
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 05:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267988; x=1795872788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QT4nVTPYrmhTuKzdl9GjNrcRlKRJg4+DT5qc8f1gZg=;
        b=uvQT0HrpNvg0oFX11MXTfQzbCq3GM92FeVDrQjGxAjfUbDo6M76+KdnxeDJ3mw1DeH
         sxMbl1Z3tcL8YnwxqSilmQkiA7zzLLYeAcH/nfizp3ZszRarkDeTWrOC7m6LKgcYzWWL
         a8Yi5v9XQEl6s8m9Eqt8cGpTc3Ut/7/RlWwkNEC9m1K6rETTcsA9Dq6R6fueExdVxNXZ
         b9kUMVpLNDOcDb4e74uBg7HpZdSru+Yexi2C69Li5wihq1c9pPrG7+jO/QajMNgtRIBD
         t7/FJD+qAy5lMpjWjcFuADeX2G9Q9eyukXunDgTVZpCKijCCQBnn4fwst91Rx3Bc1VZ4
         eCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267988; x=1795872788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6QT4nVTPYrmhTuKzdl9GjNrcRlKRJg4+DT5qc8f1gZg=;
        b=iH3SDBssSgAY9DArRwx+PyTgHy0BSFygNwsfBNbviNIdqJmQsZslXudcmze5wAague
         BSoXK9qW5F5xdGnJOrlUAZf4wkc4u4f/caLI2akBVVcj5UvE6khjCIXABWB2VIyVO5XO
         KQT03TiMcaNZIU3e0sLgK/pzkDO3cWekZB7EIB7w/JLi/f5YajOrwF+oTMt+7tS2ELfq
         JcdXFColKZ6VRFFL+Xa3/sBzFistpe4VrIZ+OiFjghDfNkd0oF0s2hpB8ndQP5vCvUso
         FnyPvATmadarTS4k7MPzeX77uH5YhkQEy+g4Yamx1maCMGDjZFo5Mq9ElkQ8bEwvluiI
         mmAA==
X-Gm-Message-State: APuU4Z962s2KGimTlkuupiVabJiX7Fuzr1proLfWaWYoGNi4ZP52+5JH
	0gQZbPa/u+U6SlM5KGvHiWYnigSDZHvyqlziRTGwyaRUtLzVVCK1sdcEdADo4g==
X-Gm-Gg: AZFdTZcdpo8QCFxqAZJWzQWerwPK9MkNSD8Z5oNBqbummm29wdRFtIH6xWTXxokB24O
	8l9bXKSnR815WELOfiEcAnTiay/+slkB3lJ75Zg92SQkQvyNcNoTfAHpy7y1/OxICRyfChqi81z
	tq957ph/gIA7bd8tz12DNxrvwYjt2NRpU0dpDQKUA4evFVa97Y71LKamkE3te5vj0/bmr5D/D0K
	vkAc/vVz/sYC+196eVS5wrCcsG26fY7OkYBfA6bUCC+LRAn7pt0AGZ23C+tORlwYsLKZJyTHMNJ
	KVUvGzLxyy7VhBhBI2XTRwj20wNIXKfGPRrh1WIzpnMGzIqTPKWdz72fyO6uaAauS0xjNwEB8V+
	r16yikjdANCgY7K5V34M0d4viz6a72TnFppT0Z6WSAI2eXd7bwnb8YiO4mhKoo+HdSXaHG/Y+NY
	DnynMgMFgNCk6EZpgcs9X1xFN5R9VjX6nq7/LAWF5mScrEnNnBQpQ0hYd8gpIKL+5HWxp9cpfdo
	hh4i7jJyxs1Eh+AIynsubQQrOn7PGIPSILJyj9pzZBQWSVBG8Zzpa6A9dPaYsOAMvqRu3Av4DDT
	mFVSZ3Mq+7ifv0IvyGK5OoW/Kf4jSpmwXOmDAPdPHfEIKWFpZqWWV76HOYlKL/87g9e7x/ilLal
	C+tzkSU0zTVzB
X-Received: by 2002:a05:600c:c8c:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb88820e06mr135977545e9.26.1795267987817;
        Sat, 21 Nov 2026 05:33:07 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:33:07 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 10/14] media: ov2740: release group hold after gain write errors
Date: Sat, 21 Nov 2026 14:31:40 +0100
Message-ID: <34bb686e09f150cc17df7b5484142fa76cd2ffa0.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Digital-gain updates start a register group before writing the red, green
and blue gains. The current error paths return immediately when one of
those writes fails, leaving the group open and never issuing its end and
launch commands. Later control updates can then be accumulated in an
unfinished group instead of taking effect.

Once group hold has started, always attempt both commands needed to end
and launch the group. Preserve the first gain-write error; report an end
or launch error only when all gain writes succeeded.

Fixes: 84363509c725 ("media: ov2740: use group write for digital gain")
Cc: stable@vger.kernel.org
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 30eb58eed..b9a951e92 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -696,7 +696,7 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 
 static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 {
-	int ret;
+	int end_ret, launch_ret, ret;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
@@ -705,24 +705,21 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_END);
-	if (ret)
-		return ret;
+release_group:
+	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				   OV2740_GROUP_HOLD_END);
+	launch_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				      OV2740_GROUP_HOLD_LAUNCH);
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_LAUNCH);
-	return ret;
+	return ret ?: end_ret ?: launch_ret;
 }
 
 static int ov2740_test_pattern(struct ov2740 *ov2740, u32 pattern)
-- 
2.53.0


