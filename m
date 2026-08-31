Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A31F37204A
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 18:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199277; cv=none; b=VhR0EufT/+ib6n1naspF04RRHrv4emDIeYJe6mo4yUXkUJa0ATaxInqmWkabA/wwpZUlbEzissM05CbXAMi9LRazH9C0v9wow0fZ5kTWh2dRACXz4g1rkqFjjHXxUSjCk6k+mNIhxoN6wpOUyW/VgbsVFMPxZnNo5b2esLsVbBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199277; c=relaxed/simple;
	bh=cmLSqzifwOF8w3gy+VghqBDjtxfwKg/n6RMNTB5n+1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=houGa8IT97n32naiwr4nZvK2jpOgvHTWN0zofZBoPEeb8HhY/jwJcQCo3gukTfDusVxCkFYqZKJaf4GPU5p3yrcz/IatdS8vdKXdlOtq4XaUGGMzcM1qcWfCYlvstZjmMxK+nfjdP95sTcUIhgGe1phxmIIBmHztgAHGcs6jl+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NaEcGN8g; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaEcGN8g"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48441a2ba14so119050f8f.1
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 11:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199273; x=1788804073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qlC264ZmuNC9OaSCC+Hoy8y6Tn/lQ6yUUOOH17G4Le0=;
        b=NaEcGN8g7rsZ7imrCNb0vXZtb2m9MDn0Ikvb4xS0NYcaTK+OLAAzXhy1OzGhPo7tqj
         jEll4HpOkXNE1BvWdE5to+bSNoGH1Q/DPd4J2ONc8+TamGidls/1XeIhfQ1taH+QaGoS
         qMO6wXHaym3ILxVfMn2kx3WrS5LDps4xZl3QIUZUClhLcHDWykibVj3e2XRjlEM08iLA
         lNUniNH/Xqrd+GK9cbrF8e/E0c8uZ9cTOFQDkPr/itWa7PdcFiM881rCv2myYIe9UtRU
         nPw+zSeAT0oNiyt5mXaoIIHgqVRjEFHBCzBDAadZI3N3AqvYwM4EQQLlAnfRIpKLYMtj
         CHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199273; x=1788804073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qlC264ZmuNC9OaSCC+Hoy8y6Tn/lQ6yUUOOH17G4Le0=;
        b=pGCmhj+Zt225l0VIxxB/gAdFmHlNZP28VRGcagaeIZmVIBG365E32jLZt2/6ZJGgbZ
         gU0y+nJA38XfNCYG+PGzdXoK5Ge6s53WhGC4Y4g0/+agKYF7R3hDvW8iCeajXU03XUae
         HUws6yaAdQeey7ayRRp9Af5yDvRXBpzZUu9wtxXcI5YyBVfffDAMhPTI7NhnRhhS/GXP
         /xDVlzA15BaOaIfzl4P+cDtnQhW9Pmdzo0i1amySUwQrbXgRREud64f3z7KNRonxlLYH
         9SrNg1vZu0e2LlHMmExsUnv4BEzqRQgon4ZlQqaXvLPrjk7IBBJPp0ZXmVL1WqoONqNw
         UVrA==
X-Gm-Message-State: AFuF++mlRBWputRLFVBH5x1KkwAaKY3+eFtp/IWkianU93s96xl/iNLm
	vUiLair8klhwfy2cWUrKkiNEneB6VbOxb95TAYawxWvy+MAjLUNDm62z93f8A9RC6lo=
X-Gm-Gg: AYBFou2+NenqAGz+KBQ2/kmoTlTuMUY9eXQHKvcYEcoi5OM4B/t4adwTWuJYTQGGpx9
	LpVJe7mKsRuRj6sKf2X3bKY1NjFJv3+xCqqRtAP7PuJtr4R8EYTnEqQyD+EE/dZSMeQyZinAUcl
	aiDn/o6EGYopo3Q4md6v3M0P/boBNoX6zXHQAFPUlyRIg70Wvwsy7WFwlsGk75sMyAXpoz0rZyp
	2tDolsN/b3ddVZA2iJEKT4VZ4cNwv8KHxWdxAev6nIIz9qxfMCTHI8Mae0f8UDwaMBQ+gBOwxh7
	8LhzrWaBzW5t0ufGuftmSEGQPdydHJf531jfQIqBD2z1EuJ2suoLNchx8bsAt/nA9e0PGMWL4eR
	8qZjK9lkV+gaTfwEraHYbY6VSeQ+LvDf4fsp2pqQuVBItIuaYV8QdSpJoAqxT/DlCiAdJG0XwLl
	wpKLuOnDtDK074WylHuAT+HWbsGPMvaUhkdTADnD4JQurJrJ4Ml7K1D1tI6ssfy9JpQE5vpSwCV
	kNjSqfnuF5Atn1RAJh2my7kUxyiVA6bq6QCN9/s4zY=
X-Received: by 2002:a05:6000:40dd:b0:482:e4bc:51b3 with SMTP id ffacd0b85a97d-482f799da20mr41606868f8f.1.1788199273297;
        Mon, 31 Aug 2026 11:01:13 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:12 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 04/16] media: ov2740: Add OVTI2740 ACPI ID
Date: Mon, 31 Aug 2026 20:00:49 +0200
Message-ID: <20260831180101.3109854-5-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
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
With Best Regards,
Maurizio Casciano

