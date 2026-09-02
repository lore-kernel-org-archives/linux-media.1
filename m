Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663CD4A5C35
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 14:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360840; cv=none; b=tL1FGUlkeGjyHoe/hCiCFK2E5cYao1aT3J8b0yeUff4X3Tp/zB4PBNuP3DH67kDr2ue4lC6/yFrEeI+Hg7T1CDpzvFQ7pchj7syqnHrvw6aFns9N1C+xx+GZBhArA6JnZES05tcF5CZVxAAvZb+dq33V/NOevg2FBHlPnVhZBCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360840; c=relaxed/simple;
	bh=GY/0GwAYKkdGCB2mGjNb9iNJ3uZoj4B7s9rKLLBlD0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+GWvAoI1on2GMa3lTFexAoXqFr7VesUIl6rnqnJVZPyyJM2p4Nt+sVgdMcFkHZRVhinExQB0vq0V2zg986GKGHOGdnPbCt4YbhfTpS0jjXhUsbfTa4zhFWhUy1y8NZFbpqOvB4xmHRzLtWbFCiP9qZiV8p351K2Iz0Fk2xWntg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBITmk4X; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBITmk4X"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482dd6ee390so1163927f8f.3
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 07:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360836; x=1788965636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=FBITmk4XJwvz1iq5MNEQZGf5rXRo9FWZ96L2epS7U34syeRfHXFyaP4hdZ8f7PpOn4
         7RYdUyzbA04vhKZfRE6p5kug1BBK7cQhtmDetb9ke82QKh4eNbJI5k52VFoqJwiH1+wX
         7khUeEbm71ZvrxhrYqpn3ok5v38T2+bZ1iRZdjy4ZCa1Hz5yMpOKNJczwEnn+CTEaknV
         Ong7FXZLpgyI4XbQkHxcHt2jlFK+kCu1dUMTRaS2l2REJagMtVnwBQJAOdpXuFXuUZWE
         Sr6g+w4RSiC/WD3HWthezaq5aBysj/FAsdpYfgyqTHqwfPs4lQ48qn138fg6fn8TLCQx
         9lYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360836; x=1788965636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=Wnn3MXmEMPoUJCW3+iTiwSl/gq39E7QWn6T/BMtxT10axL3MYqrpvXU61jcR9L/T41
         D/HOhQKGI2p/MrhRjN5mtTYLY0T+MGavRVNexOYkmSDveKxYBMUE0VXlVDAgEUpR/34W
         2IHLynr1LIFZy7wdJR59dNSBtFYYpiI7aT1yblauYUrhjhxRj0GfWOT6EbsPUJVWbb9o
         JN1MCtSMwN7Y+0LzZIV9cUoS85hxqe2WiwjsccNJOn9wViwbyIdW3NRh5Rn1lak12GW8
         lZEGzJH2L9y50m8ydT7iRuAw4yuIgmNodqNIjpz33PaIkvzuJVtYbcnaTlESHh/88Mmm
         gX5Q==
X-Forwarded-Encrypted: i=1; AKwUvBy8El0nni+zAcrDqSlBJSRAXqdMUrkzyTEnYussFcoH9NgKSF9OYf8H1FeHBhOIb15EDHNjwHkP8tYFAA==@vger.kernel.org
X-Gm-Message-State: AFuF++k4d3hUrcEIvkma9qB5h9VeZwWr0uK9PhogEo09QZMzeXVOuNpi
	DvrAT8Vo1JD5R+ZTZpb8RMfTgcvjS1Q188+Fbvma4toXqb8wyGD+0Nt7
X-Gm-Gg: AYBFou0FkkC+z2hrCgT1EbMMODCnRItCoRhKwvaGs+U/9bd2o7u7r63idNvenX1P+D3
	nK1wA4ImIsqbX2NKSqappcHiVD8UhI7DNl9UhBUAcusDZHP/XA4ksAMUQX99Yns9ixsdwznY9c5
	1oiI6mrBcHKn5lZQ8dgTb2KnkWcRu/FnTj7CkYTOw1gY4tTOAGeSCr7APXuXPOlWL70Tr5bWuBs
	CPILoxeVgcPqON4nFlA8k9Mn8iOF8uHg+NfI6LY1PYASEGtF6JSP4mxj9fxipiTrCdETzDm8PJK
	QcdoEIZXSQZTr4bHOr40fZ2GkpjTnymfoueoaYi2AGTITYWv327mq1rEAcRDfplEveoN0fPqGbW
	etHvyijg/3o0PALYNTIH1q88IeOZlA/0VuTqoo6lVZLJAN+wwcswpewoU6/oN+UpzaS9F2NUbeU
	vhMPtrXuTO+gU3bIHl2GYKB18w/pUK4yKcPSYFecYCXQABOidqkT30t7tIgTinM4CWQkXtDQsUO
	lJAcPY30O6XqyH3kMUXW/1LLh6qDBiLoHWnZOzNLfX7
X-Received: by 2002:a05:6000:40cc:b0:484:4880:449d with SMTP id ffacd0b85a97d-48488dee57bmr8598775f8f.3.1788360836348;
        Wed, 02 Sep 2026 07:53:56 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:53:55 -0700 (PDT)
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
Subject: [PATCH v7 04/16] media: ov2740: Add OVTI2740 ACPI ID
Date: Wed,  2 Sep 2026 16:53:33 +0200
Message-ID: <38149ff00ebb24aca8089ca2e3aed3fb8bf8a06e.1788360629.git.mauriziocasciano7@gmail.com>
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

