Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF1D3F20EC
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079889; cv=none; b=SHPnRZaI3QOsFiw+xZ9kaPoccwD8hguW8KQ1z16Dtzkkwo6rxRgSrDnUM5hhJ5RBsuaoXmCGx3AnydF0MXRsr0AVDJjMKme61XKz1uudwjAhUns6sHSH6qP8HYQwowJcGX6uhCj/TILyDB5oaNUQ8i+8vKUETobGroOizPfTpnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079889; c=relaxed/simple;
	bh=ccbmzk1mDLjJkMCMqTVZiJIs8myJOiM9s67m0/K4pLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9vmNWpuFwVMey/Emul13l0/FkS4/QibfDn45f3By8MbXFfgFybtP/6W2+uOdRJXZuWF4FtBkVk9uLilmhXLrVzfMFE8SMua0cQhK+6DnGzqXw2oMI+AnR2fKHZiKtg3p2h/OMz569G/7tY2Nqm7HixMNAkPZFkx1LNzEBJSGQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=KC11xP51; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KC11xP51"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so609321f8f.1
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 08:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079865; x=1792684665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6xE9wzYHAMIeHjvm7ZwNBfCozBSihzOwHk4H3NMT9w=;
        b=KC11xP513BQi1GEkAlcKnH8ImfL5SR7z/WOJJK4S6tJCKTLlkS79/1VXKDrci/tWFg
         7eUcwYdGROL3PqBthAwUxhmghxtjq4MUgdiwataxXQLrICBxL1+Ig+TWGCpIpw7+yZfP
         ypOrJVXxdvt+lDYR6VJRFsuOSA2S7N2E7F5m9gVsofgamT/Cj+gp/C+SSZeowllRJvxR
         m91S/YZY8VzRC4q2kH5TpxCzSWBPCzTA3IBkgxJEcRjB4V9krFXZeEDl4bssrm24uzV6
         Q3xYYqERCPYRcC7R0Fm5iVVnwCjk21Egv9OolLw93euIloiLt8OEp0BHQytwcRcLxsk9
         pUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079865; x=1792684665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6xE9wzYHAMIeHjvm7ZwNBfCozBSihzOwHk4H3NMT9w=;
        b=g6yYbXnuh64WxDV+GLW7rtFOycZeOhuS6t73Nhlg/wyQmepUmgQPzHa0OyRTqTNOS+
         bsdCh1kRD2BE9EKDGr6/oyzPFMSiP3mp47Nhqigw62VwQT0DIcsjd+qaAUIIfWGhF3uI
         LCcG1ZM6l21gcnJfaZ7jm9UACyp/Ld0+uAAYiA7u42P4qy38R+XqcgFvmfs4xwKYVrpx
         5KX/C4NhgaWxDc+0SMholM3YDYgvPbzcLiXDxAsY72UUwqQg5aqGkR4f8lKjjWmGjIP9
         jPZSYmK+yKzHH7sGCBM3+et6GFKULNmCRaoGrt8izP/pH3j++SzS9f8SvXYzaLoSWOEU
         HUpg==
X-Forwarded-Encrypted: i=1; AKwUvBx0eDwOew5X7Gd+RQIL6iAyIUdS2COdL6CwBN9Iaf06u1ZYWLSbdfk8SeZyGDZwiX+9m5TxY1R6POWxpg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKKaLiKdEVqvUUqlE/3rZAjGkS/oMK+mW/9dIPH/7HZX5piF5xP
	WUhw03zz/FC8KldYmsan33yihm9DbqK91oOETh3SKSJI2Wc55eOnJSdOd5sRRBquFKM=
X-Gm-Gg: AYBFou2RpQnObS04q7WsUbuLuc73l+hF80d/fMTnnKYDc64LEBHoAP0Mr48rxcK+4ut
	UN4hQ4HCJL03iuEpjHyjKHHn2E8Vb3TpvqzXiCMkYh6fETVXSY86HW/ABzZkZByiXn2CPAnZaRF
	6rRt3y8chRHDo4/70MCS1T3qQLXimkFTrn4uANHofm9EdC9fiiVjeOwFMNu2avXntA9KIYSlVKj
	a4+l/lkK4YGPzv49AlVz6ubMKEYoP+g1iujFhEF6jmfTJYpXSpJUTH1ZMSJw/lo/LiV3AAHTE7Q
	TjlG1uWDbg+HB+klKBcLLg3p3qqsF22gT4hQDSu6q+kOHdFapGBFYNzwpWZEjRMwfJSQFx2SCjx
	l6gNm3bEz3AS15h9lpnn77VbstSVJn7tPV2hbOJa+IlVH2QTZj+Xt+f5ZwEJ1CIzbE0WJ1unvsT
	+Ohour+FZg35HF+MmoOjZx+Nf6GeFLjvpe34E1Y93hgA7XpwxyH8r4AEa/vbH846mRh5q4CdXmc
	/hEJ6krk7bM1BwE+gpSJpi4GD/CLFHx4uBp8U1fm65s/1BKOA==
X-Received: by 2002:a05:600c:4e41:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a18e4d80bdmr387159205e9.33.1792079865401;
        Thu, 15 Oct 2026 08:57:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:44 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:34 +0100
Subject: [PATCH v4 08/16] media: sony-starvis2: Put module into standby
 after identify
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-8-75fcdb4163f3@raspberrypi.com>
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

The module has to be brought out of standby in order to read
some of the identification registers. Whilst it would be
powered down via pm_runtime, should that be disabled it would
be left in streaming mode.

Restore standby mode after identify.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 10f91c4b6db3..49dcbda9ecdd 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -1159,7 +1159,8 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	 * This sensor's ID registers become accessible 80ms after coming out
 	 * of STANDBY mode.
 	 */
-	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT, 0, &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT,
+		  STARVIS2_MODE_STREAMING, &ret);
 	fsleep(STARVIS2_MODULE_ID_DELAY);
 
 	cci_read(starvis2->cci, variant->id_reg, &val, &ret);
@@ -1167,14 +1168,15 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	if (ret) {
 		dev_err(&client->dev,
 			"I2C transaction failed ret = %d\n", ret);
-		return ret;
+		goto err_standby;
 	}
 
 	val &= variant->id_mask;
 	if (val != variant->id_value) {
 		dev_err(&client->dev, "Chip ID mismatch: %x!=%llx\n",
 			variant->id_value, val);
-		return -ENXIO;
+		ret = -ENXIO;
+		goto err_standby;
 	}
 
 	cci_read(starvis2->cci, STARVIS2_REG_MONOCHROME, &val, &ret);
@@ -1182,7 +1184,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	if (ret) {
 		dev_err(&client->dev,
 			"I2C transaction failed ret = %d\n", ret);
-		return ret;
+		goto err_standby;
 	}
 
 	detected = val & STARVIS2_TYPE;
@@ -1204,7 +1206,10 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	}
 	starvis2->variant = starvis2->info->variant;
 
-	return 0;
+err_standby:
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT,
+		  STARVIS2_MODE_STANDBY, NULL);
+	return ret;
 }
 
 static const struct v4l2_subdev_video_ops starvis2_video_ops = {

-- 
2.34.1

