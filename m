Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD87A4A4993
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360856; cv=none; b=bQkXFKnT8XwP1u1sjI34BUJOBtcogn2qHfVGGLHfKh7P3xa5HbhIk6E/+lu2xeeUOo3QUG8/Clci5sGoTHlvMimVdgjO3rvUsGuTRh0GjfA2Q8tELDLc54XUwduugVSUEjJATkTfFgvraMDsD5RXp9A1mq/X3/0KDT6h1XaWWu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360856; c=relaxed/simple;
	bh=oSQRJqNxqEh6/B1/z4WZhyY4jL7gQ546XKgY1JR+lhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxFAQicP5WKnJw0zMn9PSy+bGMg2y96A/MMwmzQ4uo8pAV2oaAe7MYIQ0FdXrvUxpRv+NCUSjd9xb6yNl03HOcNqmGrnLEKCuQgfV6ONasoZklVclnH7LeT0GXPFvwbg59jf+mZ0uymnRKOwJrd7+hdnT/aC4sGj+oF+/V0VGEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q++xMmdF; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q++xMmdF"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47fe89fb333so752055f8f.3
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 07:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360852; x=1788965652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tu8WUi9HrdMM4KGqsLHa/qCPtrxMlvMbqE6rwLVKFtU=;
        b=q++xMmdFALF3nZuD/m6gSa1/2igIaPshzRVFmQi9cdzdB5cX+Jo5gFkVMaRVjkyEzW
         87SB/PK2LHJvXM9PSWMmX3k0JhURpNctQWejIO12b0yZDwTqf2jz9vzW1Ydt7NEAXwUZ
         cb3jZ69I4udjjKd7muxE1J5BWPPaCU43c1zQhzxpp9ANp1ESX/Gjiid5P9LiX6jCU8wT
         TQpciQAKYqJEf4YtYT954e4Gr28ZFdMpLO730N5rev/aZGImf4xBFtXuJwWIOdA8h9U8
         wJLzUWZdFpRdH4ReKRWXmWdG8FuNj6HO1Yly+ZEsmYy1t3TGgB25zINiZu0Iv1A+A22N
         6esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360852; x=1788965652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tu8WUi9HrdMM4KGqsLHa/qCPtrxMlvMbqE6rwLVKFtU=;
        b=RScrbAE8nuf2utH+YLRDE6OY5Vu+bfZA51vT0it4S5BusM50EyB5StOhDw4eM9SYq/
         OxU3HMNoaCJH2FKFiamrZvRWMwrFycruIi1DP1A3K6+jVZH1x4ZW8dDE7e+BknMPVcIh
         nx+4mEt0ff0MW9pTbT0zr3rb4tdyhxOAOHo5TXn3EhBOAq5Eyr0SB0ODychVJiA9bOF9
         5hLYpEw7rnW4OF6ZQROxBqiWdSQbfOKkRb0tzvTh9RGfyqrSWMJftV915oKd1NhihC/n
         +xvn7DL0SL8/K4AbfpFSUttBfF43hqCQW70DA+iEZD4qjRRwWZp20tgYsafmrrbb2Jz1
         Ygtw==
X-Forwarded-Encrypted: i=1; AKwUvBwkFn7owCZ/fC2iOxbIkfUTbr/pITLR4f2tz5XknxXZ1SgEgQ1Bee5iFKXag48IDEgyvtcsLIJUV++V+w==@vger.kernel.org
X-Gm-Message-State: AFuF++l6+UTwRDtoNh7EIORJEhsfTfT7eIC131jJF5QzvOAHqjiYUN0O
	bDDeTLOOOpKiH59inkK6SGBV7mDELuHYbXBHWUBJMzkQaindkSC4U5C5
X-Gm-Gg: AYBFou3I8xxLTnT5h1iiS8k4rrvqGZyhrRXuQVQldKX4ogBnZ89AnzW1kUB5z4Ggob9
	5BVzq4tUN4ZPJWZUlJNLVnz7VJ4poltk4gRD+6qEA8QZHl3drW7Djm4VhFg0hy4OlL44uljBUtL
	f103z8lr2hApev5h2P8BnplCLupILPsbRerjcQAODDBT326xvhg9JS91xGSuh1f/8VH94yzFoxz
	xHQ9oGuJxf9ioZnAMK/yBcw2b5vsjaJyRHl5zVzN79hZ6l61LctebxaoCoHixvmXQG9oAAUsVat
	D8qn+0hWTcYbbPDOWstz2KucN3GJpAocUlldVnIOReZQ3xSvNksP0d773LTNY/KcohRHObPdbpL
	RYFCrh/dkj00OjGRb8lbMPgl0m3VKiBtWOmI18ceh0L+BxnsTBAwsspaxr/LZNsObRqPt9xzwEI
	1PwuQhmZJPHZdHGkOJnw5XzFbu59ZQYkeVS8DfxXljIMZlug7gEnsRedQVyehs6TlghTbcBB13D
	3DuIRk0NNwMhs5BPSb7kjMZ8tLfIxTpyn+k34XbHGio
X-Received: by 2002:a5d:5850:0:b0:484:3f03:82b3 with SMTP id ffacd0b85a97d-48488f0dfcamr4124411f8f.11.1788360851696;
        Wed, 02 Sep 2026 07:54:11 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:11 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 12/16] media: ov2740: release group hold after gain write errors
Date: Wed,  2 Sep 2026 16:53:41 +0200
Message-ID: <34f5f77ec2ddc7ff7a000603b120380c80bb73d4.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Digital-gain updates start a register group before writing the red,
green and blue gains. The current error paths return immediately when
one of those writes fails, leaving the group open and never issuing its
end and launch commands. Later control updates can then be accumulated
in an unfinished group instead of taking effect.

Once group hold has started, always attempt both commands needed to end
and launch the group. Preserve the first gain-write error; report an end
or launch error only when all gain writes succeeded.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index f3d91c87b3d5..5f381b7972bf 100644
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

