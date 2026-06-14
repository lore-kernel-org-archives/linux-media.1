Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637243218BA
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468971; cv=none; b=f/+ummSmuF2WpmMYGynAG0aienw3uwX7keugfgRkV7QKqLEasTNXJgW+lUi4fZrWoSNSV45qouhULmAQ7bUXZUDgUBzUrzTbbIWxAdn0cFjOqZ3E4qhuWwwLsuKwWSJo3yS5xZ/rvxegAD4jpRG7cHuP39TLppvd9uyy/dFx5l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468971; c=relaxed/simple;
	bh=9VQXb37/Or/qSNElFDrUrry0MSn8N1cForwPp7aEyK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oiJLlkDp6Qy8bv8YEfeuU1Bvxf1IYnnVeHeQg1VVxJVpmyknHf7Vrrh+qQVvpNG4xjliajJx8JycYTTi6uQth2wm+FKfSHRbDWuggyFNlCBxPuDraHYomvNBAA3BohteWLKmEo/E5o96GrhJwLPMO1WJcr4sEjWx5arpVuz1qhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lf2z4SS2; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lf2z4SS2"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so1169046a91.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781468970; x=1782073770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qsrt0s8kgZXuYTqnpy+aWUwIfATz6S7ngV0zP0tRrc=;
        b=Lf2z4SS260tfKUpKqmiLRZrN8ppUkZTBjVJejVaotzjUtr+WPVk6xgje0vMZWQ+kvt
         WR/gBS0hl2wMHFv55EBEkEN5hrNrwa9zeYBXgXmLtD+Fh0q7GDJW4OoEKvYx4nNVSyB6
         thAmI7rg9YV0/CoFkeDbJBDrt0sQwLmVfMyA/M5Jzz/F2AHAwZV0NuBuQ63ywE9Ne4wl
         FSJLCWdxjLFTTeFZrooFT9gK0AX6v8/SW2XV+2C+LSlp5+jIXiJyoePfGSZSTGimqVNx
         FlrTmSipsDRka+VjLkhInsqORBaFxmxNt1pr8wPIcxp1xg6hPXpKVEzQ5zvviHIUqbDN
         cPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781468970; x=1782073770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9qsrt0s8kgZXuYTqnpy+aWUwIfATz6S7ngV0zP0tRrc=;
        b=SouS0YDSqiK/ZGabs+DsGyZ1XEqE4426Tw9y/FiR1g//UOdw5nocwdYSF7xeQgfE8b
         9H+Wpe8Cd0U1+CjvYMWFW2AhDYlZCMiZhKfPiZtEFhkBBdclZAbPje0qMRDHI0CYgwi1
         hqW3KZEt6fBmlwCtCRLlS5dQmeR7gHRuMwFIoSWZ/kW4o8cEKmb6ebpiQawWZv+Rtjtk
         3565mx96W9yT95BZEMLUEgXkaT2Jf21WoK99pQsCQrPhvuR8V2JbLmpDxsoklsPDLBH9
         lZveACWwYra3VFu4mYn+XIqWRAbCTZ94bNsySrK78RY604Fgz7Lp2a6t0gPuc37Ak+Pv
         nHNQ==
X-Gm-Message-State: AOJu0Yyxo1kQHcAZVRl9ary/BdEMPoGOXNHWMTq1uwLN98vuH1+7iS+S
	tDDyh4/KjrV6wWW0ci3hmt86fKqoZmyJ+H3Ye41CHZOuHBH4XPh4e/Nkaxa5kGce
X-Gm-Gg: Acq92OF7kYkzxbucfv98lVbATsLL+6YsClUgu6OVfM8+A1pVog8IHf4TmNCOeuE2xws
	5i1vbbtEca/2DaFUbStLX3Tg2uCMp3Y6sZ5F3aLWNFuMDY5DHWhAHD4Sb+8H24fp6hHuCJfVIPn
	a4QZkW/O3HQSueS+yPV/lq9zlt1ExhzDPyZbYE4MtHgAi85VdxErUNPhKZwj83SZQwEoFrBw4CK
	2DIWu6AoBSYzeKcqus3gGzSOzEVHxIqgBEO4sliU0HAoM8Yd4M2/n9o6EFLpngwWgTivVk7zpud
	i/xoCb/VQKQz4sJLQpIQFtyM6PfIRJt4v83KL5YGwbb6ku04fqNcNiTct56jBQ+rGQfYniKxi+s
	js4wYErIg175Xcru1hzenqrm8LCo1gBHpWkeDeCb1TdsD1Hn8OGSp/ZYZIEoqEUCSog6wDS9LvP
	OLd8S9lV6W5BOFjaSvh/bDYGYmkjVgLuBM6Ia+fctlkJFu9uddnTfs
X-Received: by 2002:a17:90b:1c05:b0:375:2a38:1d40 with SMTP id 98e67ed59e1d1-37a03ad88a2mr11693825a91.20.1781468969789;
        Sun, 14 Jun 2026 13:29:29 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.29.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:29:29 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 11/22] media: platform: csisp: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:11 +0530
Message-ID: <20260614202835.11977-12-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614202835.11977-1-birenpandya@gmail.com>
References: <20260614202835.11977-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b5650..51db5ad25c47 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -556,6 +556,7 @@ static int risp_probe(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&isp->notifier);
 error_pm:
 	pm_runtime_disable(&pdev->dev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	return ret;
 }
@@ -569,6 +570,7 @@ static void risp_remove(struct platform_device *pdev)
 
 	v4l2_async_unregister_subdev(&isp->subdev);
 	v4l2_subdev_cleanup(&isp->subdev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)

