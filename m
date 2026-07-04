Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F85283FCE
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 20:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783196131; cv=none; b=UIOh8flINvX29jl/EDssPlNTQ4aNDG/RvyEJcaMogp7nOvsWOm/mWkgQWm1pF3y6fPIp0ICd+rQmMuOh3ruYrpAqQa0jJtGlLh2wX1stsqKAD/K8GF5sL5gNFrdXmCHlI1ibYc9BHFjX4Lt96R7THe23XiiM0YWkAig9iWegMVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783196131; c=relaxed/simple;
	bh=0T0s2KEAyDUgRB59BVz2JqfhgvfpA6ltVwhFxlbKuH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJZ/8y4QT8kp1y8MG8PXSi0PAR24EoQr2atjzJpMl8cXy5i9sqlMCmS0pfdy8hP46Q0ynB8PjcHD66WM1UXpLanBnoTrjEtgizwyLmcmmYpoUxVXUTzu42x17B0ZoEXyfT6//HPmAWmXnMieN7LRGHgzFDNIxP1jGtnYADmfJj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcWHix3I; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcWHix3I"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c85b73ffb52so787994a12.3
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 13:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783196129; x=1783800929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkUo32eIUSWMW8/5ZIqDJyOfbL6ZzC6LAJQtfPU+j/s=;
        b=kcWHix3I5EeqXUoxM4HIpron7qX8XpL2hqr73LUFJVy6VDPJU/07nv4OFIevuIF9UA
         Ub9mViViZ7VCClpQtPPtsakoyihtR0bWkcTbtDpq3xjV5OQ9qfAiSbqbspC+CDIYmLMN
         1p9E9blYjpkf1+ehIUGjruXXHWX8OO2lKur/VSh+ZEAYXDJ3Te9WbeaZbha82D9x7YzK
         C23R6+dWaAepkkHD2AI56P5w6bl9clJF/KbDlbqUFTXTk3rlRgCJs98eqwRqap5hW2xr
         QeGYY+JdWRXYHI/E2aw4CV29XedQ9g8Rs0irq7bQkDGztin5aEOvhvw9DuCyRs8/ZapG
         iO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783196129; x=1783800929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xkUo32eIUSWMW8/5ZIqDJyOfbL6ZzC6LAJQtfPU+j/s=;
        b=FF0EDsW/vRODY6NbEGfRNn7R/1xrK6US+T4xtAOxiNrA5d89zDYsK8IQ4x3JGl8/3D
         yFeOkgcDCZvqowQzwoDSQXbFl0w1BhzX490TdgUpUf2zs69WOdgj6ciPm+Al5htXPd8d
         5UqmD56E+XEyf4UF5AtUjLwoA3Bl086QoK0s5agi3RJ7lGGPk5rrp6KSgmXEL62oAdYs
         F1gRRw3dBQLbejO5l5sIiPmBXwwxQpu4aCPYOXa0tGGlUnzkcwVm5W7MHMG0YQW31sZP
         9p5molX5pBJezMIcb+Th/pSGmOnFp/5XczSyx33gOPx/WM304WjeTKMK5FabMfQapEIi
         5ZHg==
X-Gm-Message-State: AOJu0Yx7DlQ8AhAXIYtCGhQZHi2flusqprsYvJtoxDdf76kDUXHXKvzg
	hVJwNMwDklP8a8H4ANO+bGyh0gGJbzQ1qyj6e2WT5NjXOZ5/hKSmi41H2/rODV2E
X-Gm-Gg: AfdE7cmtHYqioLESzByZaq1QpE5KXJ3Sv4PmWC4AFaiZ1NpW15RFomek5b2KcLmEFKF
	GVO+9SSgZz9T/cZ2U9nITx/xzFnSJgchvU8xNya1pptXy3YXoUEbJWqvtVmuNjPWFOFVKo2tNSv
	I3Whu6KKzLl91J55VYvh1SWcbK1RuVy0wcDMEYfeHafPLFoirqeuEjHHoUT+HLm/inXCm4EFjal
	uBzu2Eknba1swdh2XxOujXhfKFaGK4Y9E2P+k1KT3WzjOUSgwJGco25X+hSmCnZqFLDa0hnbNjb
	vOoPPQPeFGZ44Gv9uSnY0p9cgwBABLYfrLZehdq1zkWBbvAz+Edjl0gtHdnA08+J72bB/5FVXzO
	rkk7tzmZrOX9XO+DTxe3fCuzSu7p34e+FkFAx2+pEFIaPfMO83J0ahLlMokUYCm0uDkXEqSzNul
	xrt5LANZPIUAgyxSJ/BL39edjFSjUrAjPgE7lEyTGxwNc=
X-Received: by 2002:a05:6a21:6e48:b0:3bf:6c04:a816 with SMTP id adf61e73a8af0-3c03e4da45cmr4491922637.55.1783196129054;
        Sat, 04 Jul 2026 13:15:29 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ffdd292b0sm6341930eec.2.2026.07.04.13.15.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Jul 2026 13:15:28 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v4 3/4] media: renesas: rcar-core: Add missing media_entity_cleanup()
Date: Sun,  5 Jul 2026 01:45:10 +0530
Message-ID: <20260704201506.82524-9-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260704201506.82524-6-birenpandya@gmail.com>
References: <20260704201506.82524-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe error path and remove function are missing calls to
media_entity_cleanup(). Add a dedicated err_entity label so the
cleanup is only invoked when media_entity_pads_init() has actually
succeeded. This ensures that the teardown logic properly mirrors
initialization.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba8..5bae8eb0ee19b 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1211,7 +1211,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	ret = rvin_create_controls(vin);
 	if (ret < 0)
-		goto err_id;
+		goto err_entity;
 
 	switch (vin->info->model) {
 	case RCAR_GEN3:
@@ -1246,6 +1246,8 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 err_ctrl:
 	rvin_free_controls(vin);
+err_entity:
+	media_entity_cleanup(&vin->vdev.entity);
 err_id:
 	rvin_id_put(vin);
 err_dma:
@@ -1270,6 +1272,7 @@ static void rcar_vin_remove(struct platform_device *pdev)
 	rvin_group_put(vin);
 
 	rvin_free_controls(vin);
+	media_entity_cleanup(&vin->vdev.entity);
 
 	rvin_id_put(vin);
 
-- 
2.50.1 (Apple Git-155)

