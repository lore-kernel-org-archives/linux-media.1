Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5129D1B78F3
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 18:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781461677; cv=none; b=Qf7yAfkjs1w0w8Uhc0cSG1tJX7uxTuvdOem0uS85c3yRhaqHMO5mY04kpDlBVer8TV4mMKDzP8CJtsDHSqQwYCJII38fzoMBOJ713a/AbFH9BHxpUXtbPu8ysj/SurbdnOHdVr5QBD+b42vKt/JooAFI69kpYRW4SqWRvMljCpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781461677; c=relaxed/simple;
	bh=BzDkL5ao+8Nocj58WU7WFf4d6K7mMRkR1UY2QSnPYrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAI+KqZWNcjXsx8XNlQa6JQKzXR5iyqTPxnPAmlr8P04F41RZ7znGxZR1X2jX1Q6QSqz7EeXqL44rajr1qGPuuGA4cPtjU9XEAPAPCmcVh1PrggKi8S60ipx1yR8kW2tSihpIJKTSU0RIzcuaxpgtCd+fbHr9hrYuEM8yf/SnGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXjPxXUA; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXjPxXUA"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf1cda2b17so18547455ad.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 11:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781461676; x=1782066476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9r0CIuo2zvn/crxyWkInylas1WMFe1QWhvD95/VAPQ=;
        b=OXjPxXUAaCLwkDfDI56BPw03E0r3pUzib7zW1z9vPbEHdo8VAkICu0aHyLV2QBwh5h
         iltd4NYkX4bU1mkC/KBHFWbcWzOEYF0O6kak1Cva04m9hiDXAfXQ4Bjiz9vn6Cjk4RuC
         Aspw8ZrCXA7qeoLuZP5jieRvrvXiuyrAmxgYz0zntbGlg/98AN9kVxeeZACiHq2Ii+Qb
         2ewgylUhEHPY35LOOSYJdQDKYcfQkAHOp6Gn4vdlMWKLDA9G2ORBTT69dx3a+qIiPgrW
         tGLzhXT5XiJhpbD6LuV7k8g40jYlxRJaMKAVVS/RN38Jmct9rRe36hMhBn0MGhb5eDYf
         5jDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781461676; x=1782066476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H9r0CIuo2zvn/crxyWkInylas1WMFe1QWhvD95/VAPQ=;
        b=TyDGbZwZvkLT+bNf9dcAoSidRJ7EBAEHyDBLxJ3hIHA4990VY6deSpyoBur6/phBjr
         nXp7r/FL2fUFwlAqMZZ9Uy8cKghTkpfN8P+nKL1jqOaqlGaElHnxs8q/9bz0/8XXtSpE
         o9x66QBvc0gwNBrw443hodSkKVy6KHoXiS9mx4xdxWwMy6Jv56facifZimIunWDxApVK
         IOkqMtpE4dKQZVn56b2xRjWwyUb3aGLNyIRauJ6lZXwUjVRsVElE1ZX2A/+SgV/URANG
         gqAPRqj5NAvvaPsb7Fs8zS/DgaNB4Jcsa+dw/0SeN93OJNuvI16JmPypzFiLkbju263y
         2B7Q==
X-Gm-Message-State: AOJu0YzIAhOrhbAPZSmdUmcye0dIyhNW5QyZO13+wMtN/EMJTCVWFEKF
	3AafkbMgAfKbif51KSZQHHNhg2gDQ8uhR0L/p+p4JmDi0Kd5w6O6Zj6Q/SpXI/pk
X-Gm-Gg: Acq92OHb/0VmLhol/XDRMOuAOHybeJitJJLv+ZeEhH0Wp6oVUHw7xdzbgPK/kfypyJl
	tcVP6/u0Heiz8IbiSrN9gSOh1KdXX7dS/Z9uNfDyuZNCXQOxS8gauHBxuB1CfdPzCL0/ZJiYXqT
	odkVCr0xknPCf0ZOs2eL8x5fjQlr2jyq5ERe9IOg/ewulDM0as+HLPmWMrP/cgPxvJUnqT8RuJK
	2LvzgVh3AST+F8bt5APcESQharLabRZGUNlzPfptRinSmKG4fF1VAuVR6LgoWHvekz/hWVgtqc+
	0XERrjquwAEbh5hezJqqIRBV4W7P7f2qPa82Re4O7glm0np+5/GgcZIrhaQ1u8+P8Q1NDS6FqWU
	2rIGGOp8CsjXFUOUP71/cdmjmjmmlY78jo7AlxchriGJMeIM3iDrlha0PUMZSnWyFoxcrpOVHEU
	zQCXbJdGS3rJ7VTuzfoRK0SRsHR2YaOnbXVbYbGSoar+XerdBPwn5x
X-Received: by 2002:a17:903:acb:b0:2c6:829b:b0c2 with SMTP id d9443c01a7336-2c6829bb150mr17550015ad.11.1781461675629;
        Sun, 14 Jun 2026 11:27:55 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5369sm79161335ad.9.2026.06.14.11.27.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 11:27:55 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benoit Parrot <bparrot@ti.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 09/22] media: platform: cdns-csi2tx: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 23:57:05 +0530
Message-ID: <20260614182714.7999-3-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614182714.7999-1-birenpandya@gmail.com>
References: <20260614182714.7999-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: 6f684d4fcce5 ("media: v4l: cadence: Add Cadence MIPI-CSI2 TX driver")
The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/cadence/cdns-csi2tx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index 629b0fa838a2..df1598091d57 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -620,7 +620,7 @@ static int csi2tx_probe(struct platform_device *pdev)
 
 	ret = v4l2_async_register_subdev(&csi2tx->subdev);
 	if (ret < 0)
-		goto err_free_priv;
+		goto err_entity_cleanup;
 
 	dev_info(&pdev->dev,
 		 "Probed CSI2TX with %u/%u lanes, %u streams, %s D-PHY\n",
@@ -629,6 +629,8 @@ static int csi2tx_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_entity_cleanup:
+	media_entity_cleanup(&csi2tx->subdev.entity);
 err_free_priv:
 	kfree(csi2tx);
 	return ret;
@@ -639,6 +641,7 @@ static void csi2tx_remove(struct platform_device *pdev)
 	struct csi2tx_priv *csi2tx = platform_get_drvdata(pdev);
 
 	v4l2_async_unregister_subdev(&csi2tx->subdev);
+	media_entity_cleanup(&csi2tx->subdev.entity);
 	kfree(csi2tx);
 }
 
-- 
2.50.1 (Apple Git-155)

