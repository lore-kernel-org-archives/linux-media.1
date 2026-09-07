Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3120151D506
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 16:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799848; cv=none; b=AGFfx2rCGiZCdjR4TUWR61wMdYDqnJLygkYuvZcr7j/7wpEnnXijIibAS2x/9X5hFOOuW5tjfeqTvKeMZQIrIGauEkzp/7khTRN7//Yei8mj2fMCUNs3kSBsOy5rPgS6C4Mf6nIu+MPKP8XVvTY8OaPvVL+OLGZV3w/ixrVaXhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799848; c=relaxed/simple;
	bh=MKgoXYTXSjlrtYrBtVpRepPWqUSRXg6w982y1Pay3bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jMg/3so5mYuPqM8XJE2pGltW6m7PjAc7qEfU7q3ZomF2kpzGcENotEppLbJled7pat7FXvTkuQyvXkokedkL6xB6OGqNbqm8A47S/qOGdzuJCRwhplrxyXugJFAVcc7+KT7DOzD/x+58ETw1xjZObaTGJCQAqJSITp65EV3gPNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZnCAQPe; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZnCAQPe"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398a5aad413so2754584a91.3
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 09:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788799846; x=1789404646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mJA+EFreX2+ndoSjltuac97HgB0U6+rcf3y9yIV00LQ=;
        b=gZnCAQPeiUYSFHFvjs8skhyim7vGzXH7RCg81FDIxyY5FuHilgjcBaYIYbRaZBiRwc
         C7xBulPYySP7pLi/MEK0rY3XHEmtX0x+/7GPBVepqwFWzKAX2j0aShKfxrl1R8ZduTf+
         q1njhB85xzciBgoB6FTMy1VBDVsiacPR1aREMN/IiCV4GlAQVtpYux07CtDXJAlaQlL9
         1tSCO9K6gnd3uCAhjlk8q9g59Fs++FXf8rj68XA73c354L7SXYqOlVvF59b9J9j+EmJi
         T1xkXlLmZV0iKIIQPDgGTPoSedN3y5hxaYpRbI7qPVxDj2xQBz7VyqJwAmiLH7lHP82A
         NkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788799846; x=1789404646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mJA+EFreX2+ndoSjltuac97HgB0U6+rcf3y9yIV00LQ=;
        b=Vr1sZ3JGXODy9AF6Vtn6nbrHcXrSz5Qgo/jmDugVIJ63Oo5nA6P5jU9sSqgLSSA1bi
         g5DDlCOuniXQlfOkWrH+IhAm9j5zuu8iPxLPrGY+x1H1FW7hC8zoPVmZ92l9Q2B+N62a
         G1oVW+ET3WycyGnJViVJp1moUYsYyzsbiRf7BznrNLaK6KAe98YPu6E5zcjatsJJuLTz
         SuoTxzdgHIDhFPUeGIBtsnZsZgW77W4zLRTbbmBvZAaVOtERunswq5wBObzuLqev05g3
         penRKDUDCTGx1baBEI5/uVmSy6ssSUMA9dNBesKQGZf1LHG5NCOzyfusvAlWSZ1rMbK5
         F5/g==
X-Forwarded-Encrypted: i=1; AKwUvBwcKa3Cv/ZbUjJHBfJWbuQQE5IgIUA/jMlCfiV3J36u7lrc4LJzYzzBCUIHrH0YR0x52VRTNQmUDmXfrA==@vger.kernel.org
X-Gm-Message-State: AFuF++lztfzL9fYTUPG8zaS10IJ99/N9eTZiIzgxoJP0ys72qXj59dt2
	+EpxaaioLQIrBkMIe4BXux2iD8OI0ALhrDU10IaRbnxf5TMFjz6dk797
X-Gm-Gg: AYBFou0ufXXz4v9/o3TKd9jqh1RtPhnKeNstpK4RepQVULbS9sW75n3WsOGizKTZ6E2
	k7Fbtl14wVKFCNqwOr/jLwGcZo2WZ/i689Sqb4+TsNf95ITT9OF9hMR/ddV26tcXH/dAt3ZRY8e
	56n49W//14lyvJEkvhYsFQ3rMTg1pN82zyVnuMxKEGJkyflhRHa4W/Td/4EGQ+tVWSu6nU07gBp
	FN5KJW1tL+jfpUm7YlT4gnZfNOd5iVs3fxWCMBddR74PaeIHz6ZQnZUP2/QJvGztt5Jr9ixtfIU
	1x059Q/dVb2rnBikbnun41xOPAlB/+crX0t0BhGazFa3uAAGkHrE96q9zxyRtbqGr7OssISjn97
	cMJkFwEBkKKwJiDxCj+dZCQmBmiJOXbSEvdCb9ix/x8yccfiLwTPw+tiRPC29JBoRDLyWJPI8Zs
	nOvRkzRSOYRqrb9+MZRxVN5lcRhwVfQecRIHJGPzFyQQCJ3Zc4a9LplwhtG00e4mJl
X-Received: by 2002:a17:90b:4d06:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-39b2614df74mr34283307a91.1.1788799846338;
        Mon, 07 Sep 2026 09:50:46 -0700 (PDT)
Received: from G15-5520 ([103.246.195.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm808934eec.14.2026.09.07.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:50:46 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org (open list:STAGING - ATOMISP DRIVER),
	linux-kernel@vger.kernel.org (open list:INTEL MID (Mobile Internet Device) PLATFORM),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: Use C99 initializers for ACPI IDs
Date: Mon,  7 Sep 2026 16:50:33 +0000
Message-ID: <20260907165033.8460-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use designated initializers for the ACPI ID tables.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 4 ++--
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index f9cc5f45fe00..5e4bdbc4a127 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -857,8 +857,8 @@ static int gc2235_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id gc2235_acpi_match[] = {
-	{ "INT33F8" },
-	{},
+	{ .id = "INT33F8" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, gc2235_acpi_match);
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..2d95ad91db69 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -995,8 +995,8 @@ static int ov2722_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id ov2722_acpi_match[] = {
-	{ "INT33FB" },
-	{},
+	{ .id = "INT33FB" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2722_acpi_match);
 
-- 
2.53.0

