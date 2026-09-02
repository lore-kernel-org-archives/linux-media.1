Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720C64A5C27
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 14:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360838; cv=none; b=DKWFCPDkyf9sBMuiWDAveONIio+37TlO70aW0febjzGUsTpEjInsGiI8abfNukaE38YzlGRjZMpf6VLrwLcunZM1DJ7LDF42YP0wfZeOh04sUwxjiRazoLX3/vwWLT/WwonKt/EPhfsN/fcugSu7zB0A57aqzhYIfAk9xGhbWZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360838; c=relaxed/simple;
	bh=a4oCgSJxVT+Yvyj6OvJRra4F7RQTRxH4QG/o8/Ybv3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H76eBxECDI306E61Ikow2q1eAqn/M6+e6V469G9bXQb6oUf22hDB++mJaL1sKseR/BhAEY0WN52ZIO0LKKzxdmzEXBn30ZHzZZa9xtb+OGIdqESUelv/4jYmJhTWyf0Ag93UdkdQR40r1Zd2Vxp0plKOXDkHyFMGTZlaA5lMxWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RETan9et; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RETan9et"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso8041945e9.2
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 07:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360835; x=1788965635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mENIAbZRTvAZLCBtejhgUDs7AYKS8queXWQS6mtdC+Q=;
        b=RETan9etukiUAIj8oQ0/+UVVbKtEKLI/QbHJZO7EzWH0xr8SJigi81Dyf+5fJ2Qtta
         sP19buAMDxPyuQqnobJ7IHI7wVxAZeZQXIB07wA8Yc3zMiOCslSS6BFEfzPCPEbNKeHq
         TCcEOO6RlhW8tbgEDTrx3APLgAC9HikaCMHGxMYvuRrIfMFGpj1AqBj0DBjdxb9xKbzE
         7nXmBPW0dGhakAwta0GS7KVRFhwZnPVOFgbaLiOKdE2CA4iGHd5sZn1F+OW3odr3AIQ9
         9FQ7nwS6IWteFZGo6T/CezqkqFjU33rcii/IAfsW4hlAqovAHdZymr75luD7uIKHA5fQ
         ykDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360835; x=1788965635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mENIAbZRTvAZLCBtejhgUDs7AYKS8queXWQS6mtdC+Q=;
        b=CkvvuRVOr758Rcs7sieFLdzOW/POGvF4HJjNLE/RESJiHsAmFSwaROrldWizdAKEkX
         cDS7kAMbwIbkwpDwbQKFuu3QRaD8f7IBFRU3teXqlJvbcZhItDHXWXgjZQ/9kO/lcmDG
         7CO+B63zkVSZgrSCkrDAmejkRP+N6lzqDoPy2A0CqgeQYda2FfR7ZNrWFBMCghw646A1
         rHYtsER7AHwiuGQ2NnD8v9UA2CNQfEEigevSzk4brA9aJ8WgX2Cl3R7TG8J+P31rkjtu
         +qCkqkuv7CzsiaPgrEbFDbT4dfBGSm6bmzFCvVVb9lBJyHEfoLPiUFBP88vyFezwtzfs
         xi5A==
X-Forwarded-Encrypted: i=1; AKwUvBw6c8EDqunKEB6KYjUKfvzM/mG4JPpdynBZdSrEYjVO2DjbKHGMVixAsJ+CZOsrTIcTF4EEVpKgSStfwQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l2o6ELeiH6UMrtxDyB/gn3bUXtOMVlUYNCbnBzEu6OZKjtbvf6
	cacmbQMZTm0FlRV++LJ1G0jirawcAzganUf6dfG04GTp4czXh9x4iW0D
X-Gm-Gg: AYBFou0hKNdrgBfQJjxYihw09X00/4z6BreR66jOEulgFXbebyhT7y8mPpEc2UJOEM8
	UEqerdMrZLObe5tWGNBTcK/rdOLLjkSC6EhktyBDt9zRoS+/0O/42T7UqRxsRbIzcgLSwjwYwFV
	ZGFJyFuODyLhfM3SnhX6/wPXGs8qwx0aN+b6W2yo+TtKUr8PlCzLEhfiN8NAIE6lG5J1rMmn/e8
	sLfp9wgMlnBBBO1cQfEK59EiEwnrpfwDKc3fEZ5SeZCN3OSCYgF2wyB7umukYUxNNN/TCrI2w2f
	6gm3DhY6a0HeObG79wCuLCHpLZQjZfNL/Ft/hBKFXIcwx+sc8HLeMMVK3pliYxM2rL4eyTr8ZJW
	Pk25Dxy3ox8ADk0oynoDUOmuPBsiNTxsgQtNcWfs+lAYRtCpLOUOV2abFB1CDJrPWBeapMdIeVq
	KH2v5rOmQOcMCzA9U2FLFH/TCwGK2FYpAwpnLzqPc9dd2QcJKKjPe3c6jKtkfQBHkQWAbtaMdkm
	YMMWgGIwgAMVyO/Izt6eCCdJeiprlouDYrakg2jNF/r
X-Received: by 2002:a05:6000:184e:b0:484:3312:f127 with SMTP id ffacd0b85a97d-484913c020amr9110505f8f.27.1788360834456;
        Wed, 02 Sep 2026 07:53:54 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:53:54 -0700 (PDT)
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
Subject: [PATCH v7 03/16] media: ov2740: Use C99 initializers for ACPI IDs
Date: Wed,  2 Sep 2026 16:53:32 +0200
Message-ID: <12033326593d98fb9bd5902820c1ab29df00c94c.1788360629.git.mauriziocasciano7@gmail.com>
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

Use designated initializers and the standard empty sentinel style
before adding firmware IDs.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: LLM sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 39003c1632ad..8f0ad5dbb245 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1461,10 +1461,9 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 				 NULL);
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
-	{"INT3474"},
-	{}
+	{ .id = "INT3474" },
+	{ }
 };
-
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
 
 static struct i2c_driver ov2740_i2c_driver = {
-- 
2.53.0

