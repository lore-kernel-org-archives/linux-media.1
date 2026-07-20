Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C1E3E8C59
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 10:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784545183; cv=none; b=c5rPQsVwfGDkO35CIcRBF9P7Darrov8yFDLiKC87XqS2d1cgF17K3a9HDBfms1fyfPpYwGR4XPcm33h9rXYCE0b97RW8ZfgLC6eKvqaHSykca0tl0/vcuB5u0MCxnLBa/tDMtGKPSOnzoqajjV5wULM5KB141D+V1frDjcUAUBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784545183; c=relaxed/simple;
	bh=oKXHF3XjraT7FxFjMK5cRcVCMYuhQ36vN3Ypojf5Ruw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dic0lnZ3mTHUlMUn+sYN2/m8EcWjKiwAJoeZqwSkwEzTXw2DOJ9iRJEzX/nKvNsiOpvDZzCbpcmtrLIcMuUv8bUwx9InPraSJGW4BaPVcH6TFxMtp1puWUB+zc62Yhz2MiNa+srTaqbugCUxMXItEMCanxya60yj1nJndH9/x/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYimtF1D; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYimtF1D"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84864086bfeso10527045b3a.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 03:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784545182; x=1785149982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZV0+ypWR5eWOjDptrYRPRCC2LyTiXygbKgh7rcUs85M=;
        b=EYimtF1DW3w+TV5YMSiqwmUyEX2eWd+0nJ1wt8gmKrffoPwsBHgc0ts2FDaeaR5Qmo
         mfC2c+bBK4Uo8SwwcxUKnPYB/j1rL5lVkoAGGjY86lodKiaUd2s1vD6AfPxeSiJA88LZ
         gtKnarz1NponP+2kVxCHvrdn1DNbMy4CX9Fkvuf90xDpMa0WyxTJifCIzbJNXIr8ph91
         ZQ5vE5ZRCCLK6ekg9oEMTe9P7jyj0e8CAlbtqP1sDiBHP5ygikVQbQEJumTdWxQlCTgE
         kA78yBQnm4YCrfOEigw28MZS15gx88F3HgLXKu8EkBLBmq8icZUD88uVmGyc98gVZaAD
         Eu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784545182; x=1785149982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZV0+ypWR5eWOjDptrYRPRCC2LyTiXygbKgh7rcUs85M=;
        b=ELtDrvulkrNTh13zrX72gkLZ2wsQG0RmISPyCCvJlykeT05a6cL6/uh1JTxyU5T9lR
         62BiVTW61xLPg0WvOEdCtceR03dYp9AKuIoOvtuFd2d9Lplfw9TEWzBEn8psbN9bkjPf
         CRuH4GAPNSSOgNgWKySBbn1cPP7IetOfATsKFn4srCuKVaEeiYB+aJ1BHXdehW8Yu4JI
         p42kgXhzKNTDfpZUYRKG5Eq6GWx7haU+JRgTnAGZ3goHxCT5tzCPnH0yudLnZy8nBGmN
         h7EVRnv/edfke+kZtIA4JTgEX2gQ+tFZLiIycXumNEJxeXh5na14iq27WWZ7FXqeQT0p
         00hw==
X-Gm-Message-State: AOJu0YzOWHXrvZh+fKKLM97srOQFi/OVSibOHe2pbTpMxf+GK2fAnKop
	DKlvKOtjmAv9eg9fNvve/zDtr2uYAmA81G5Tg0aI0iPcW7Dy8UNyhdDR
X-Gm-Gg: AfdE7cmxbJSS4EYR56zZSnlIF2c4w5BeH1X2Anj++SzncDyG53iWWn6KIWxMf5EV9U7
	xLNxgPEGb2tmUkMVdHfffjfS5JonQvPpjos2Ug10rvNalvsvHtwth+yLGzGgQL3JEvTeJdcSRiW
	acZoAGhBvKEj2j5kp+ne8U4/rcclxhoSQSf/HaqAyFjs4itSTfQ8ITXct6iY5jM1Jj6V5cX3x4l
	ASzYkxiOD7yvj+za69678tHuX9n/r2ZpMkBe0cCQOHQ7X6rYjtLVSOxjQgREe00q0bbpjeQi3Hm
	j3TUTPJsWJmShB0JNFZ/PQD2Q8Kd0Co8G0UkbQFkPduZeClPgKza+CvPoBUfQRLOBz1kWFgO+Jw
	FiS2ovRlLL+Rp5mgV7pKMrqZHE5D4+dqK0Kp3vRT3sKLFy8n4de0Gh9N+j3WmZ4ftIHMcx4Kimv
	TiAAFzF3iHP5NFo9ExKom9y7xpmasyAnvhUsEpNIFLzneAROgRoHHXjw42TvZxy9o=
X-Received: by 2002:a05:6300:2289:b0:3c0:9c19:6590 with SMTP id adf61e73a8af0-3c3ada1f55cmr13543033637.74.1784545181852;
        Mon, 20 Jul 2026 03:59:41 -0700 (PDT)
Received: from steellegend.taila75641.ts.net ([2405:201:304b:4973:59cd:5c84:346b:aa8e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bcccsm40175574eec.4.2026.07.20.03.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:59:41 -0700 (PDT)
From: Uday Khare <udaykhare77@gmail.com>
To: sakari.ailus@linux.intel.com,
	jacopo@jmondi.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uday Khare <udaykhare77@gmail.com>
Subject: [PATCH] media: i2c: mt9t112: fix missing IS_ERR() check before PTR_ERR()
Date: Mon, 20 Jul 2026 16:29:35 +0530
Message-ID: <20260720105935.16894-1-udaykhare77@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In mt9t112_probe(), the -ENOENT check after devm_v4l2_sensor_clk_get() is
missing an IS_ERR() guard.

Without IS_ERR(), PTR_ERR(priv->clk) is executed unconditionally,
including on successful clock lookups where priv->clk points to a valid
struct clk pointer.  Calling PTR_ERR() on a valid pointer reinterprets its
address as a signed long integer; the result is arbitrary and leads to an
invalid comparison against -ENOENT.

Fix this by nesting the -ENOENT check inside an IS_ERR() guard block.

Fixes: 6a26f141bf62 ("media: i2c: mt9t112: Remove soc_camera dependencies")
Signed-off-by: Uday Khare <udaykhare77@gmail.com>
---
 drivers/media/i2c/mt9t112.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/mt9t112.c b/drivers/media/i2c/mt9t112.c
index a8e2a3cf3456..56b7c8910112 100644
--- a/drivers/media/i2c/mt9t112.c
+++ b/drivers/media/i2c/mt9t112.c
@@ -1079,10 +1079,12 @@ static int mt9t112_probe(struct i2c_client *client)
 	v4l2_i2c_subdev_init(&priv->subdev, client, &mt9t112_subdev_ops);
 
 	priv->clk = devm_v4l2_sensor_clk_get(&client->dev, "extclk");
-	if (PTR_ERR(priv->clk) == -ENOENT)
-		priv->clk = NULL;
-	else if (IS_ERR(priv->clk))
-		return dev_err_probe(&client->dev, PTR_ERR(priv->clk),
-				     "Unable to get clock \"extclk\"\n");
+	if (IS_ERR(priv->clk)) {
+		if (PTR_ERR(priv->clk) == -ENOENT)
+			priv->clk = NULL;
+		else
+			return dev_err_probe(&client->dev, PTR_ERR(priv->clk),
+					     "Unable to get clock \"extclk\"\n");
+	}
 
 	priv->standby_gpio = devm_gpiod_get_optional(&client->dev, "standby",
-- 
2.55.0
