Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B037372EC1
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 10:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781864591; cv=none; b=uxx1k7WwQwCin0nRH4nFCxK2QksBJ40sel0x7P2R9bzxATkN5w6oCkeomgLbFWPwQn3JgY6OgSQNsnOV26U037dj8s6f+qfJzGLrraomz/tMovX+Y2ZXirqmqR3ybBp057bmorgaYfE6m/0aDftF1YviYsifjZT6JjNET/FpvFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781864591; c=relaxed/simple;
	bh=zmmDMYq9m2J+BtDIpmV3Bi+6Xu7MxXWnp36pYziTJuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNZLVoqrMA1EwnqCT6O/TC26kX59BjyNfRA9RWj7bDwEH2ocoKq3ZwOxkQOXDwa8naBHMDa1/BCvej+462S8abY/52AxHkKZ7Sm/ZwakY//jvGiod5+6HvVqV50MeMeKN2p41F/6AhiJvW8bMs7g6Bh0PhdFnvq0bvbuhG1HzoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaDqWiFd; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaDqWiFd"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c6d4851142so17070005ad.1
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 03:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781864582; x=1782469382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcDu24x503WnghU/JyjaMwSDjYmjdlIe+mTz79GlXZ8=;
        b=gaDqWiFdkUKLaEPO6JjXIjLYnUrG2Tlk8c4ni2f8AtTC2TyBOOTEZcT5B+6YSi/BMP
         KGNgGZXJ0anCAg++1RhsB6kHXD+Gn5V7l9GRMCEaDygvHYDkLUV89V7Amvd+lCx4n2LC
         /I7ycYa/6kr1raMpXHIjOjf0Nxub1nSRV4fuT0ilWGCna/USigP1Sbtr20sijdgnPsuY
         8H4ZZn3sXrxlTwd0yteJBvQv/uqvmbh7we1Hn2es70aL5X4qgSCVq9wY5O5BvyccU/03
         lCxLeq6A9hNriGlRt72Ps1qyngcbg83bUoEybIKe9v4nvptfaPyMnxiKjXA3LkWNU8TI
         1UpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781864582; x=1782469382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bcDu24x503WnghU/JyjaMwSDjYmjdlIe+mTz79GlXZ8=;
        b=H3YAKqxJYJYAtfw8O5uCbmMET6VD/TC3ZzoSl6itzalXbbF/yGjgA96MFCOLL0FI4Q
         D3xLgBRqWoq/enUve/OXIaM+exBe9TMmcTL+bUmK9kUuZfQJZquxcXezNkx6E3kuSw0B
         f7o2iWL6v5rLdoJRTodIono2ZPsQ+q6Z2q4ykthUq8E/rZu3wV/rDqesGEOvbnBX7WIK
         fAG4iYVnQb/qr+uDMQ9zTbW8OOjnFv3M0Vz5sZDykdYBmVSQ4aX91Hp6Lw/40hDo9uNf
         mV8TVlhEsLZ4StXUXrZm1tJOWwrQPecGGGeO97XkpMGs2uNbVuEjoz5kza/KVY57N3mv
         46LQ==
X-Gm-Message-State: AOJu0YyWQ1Hr8wdoUfvjH2nNUOlxmB2yw+1hOHtoqwVuNHetkiGRNEe/
	Eu3j4fhqpKskOCoqcV0XPHkJxJxjlUYmFtdplSwgCI1u0EI9gpnL0lGR2JqWuf2S
X-Gm-Gg: AfdE7cmMpKTaVoeDgRrDuoHg7FhmPw3bVg7gSRZusOncf51ALfaX9HCwHuLtkKObRjH
	Py8PBAir54hq4wDFfjCh4nh2zEZFE3xvHndvXNdzHoSgnHPSiAGUBD+K710gxArBFDuC2ak58+H
	zJfzZqttAnBout3mvZlVuwOhj8RL024ceqKK8JQjtyghH6UIp0cj5EI/EhcUc6taMTetEjv6WhB
	y0FlDf0e18U4ZeXpRWdqgNSHe0a5yLfRqIVKZzW8BJXCMdrWeHbw2LKvmVsk/rin87CTwgD4P1o
	WaFNd7DQP5T+0oCL/KFohGcaqP0LUc1q9dcy0n19VMnImX88F7ox7WDZ81miozMNmhBs7XfkqXY
	KpDKhxBSw5JEkGqVPJOZ3Z2MEqKV+r1FaOBImw0swykkTgiayDUn80GiCVJvD9fakqo1npKGrc1
	AWFn76nFm55z41HcAtoG8GEQJ+e6Z9UFyw0BJ4dkGb5w==
X-Received: by 2002:a17:902:db04:b0:2c6:af4b:99a1 with SMTP id d9443c01a7336-2c7195028d3mr24616545ad.3.1781864582300;
        Fri, 19 Jun 2026 03:23:02 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c720c24f73sm19486115ad.82.2026.06.19.03.22.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 03:23:02 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 1/4] media: renesas: rcar-csi2: Add missing media_entity_cleanup()
Date: Fri, 19 Jun 2026 15:52:43 +0530
Message-ID: <20260619102241.22887-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260619102241.22887-6-birenpandya@gmail.com>
References: <20260619102241.22887-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe error paths and remove function are missing calls to
media_entity_cleanup(). Add them and introduce an err_entity label
to ensure teardown logic properly inverses initialization.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb..9720e0cbd1db 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -2617,7 +2617,7 @@ static int rcsi2_probe(struct platform_device *pdev)
 
 	ret = v4l2_subdev_init_finalize(&priv->subdev);
 	if (ret)
-		goto error_pm_runtime;
+		goto error_entity;
 
 	ret = v4l2_async_register_subdev(&priv->subdev);
 	if (ret < 0)
@@ -2631,6 +2631,8 @@ static int rcsi2_probe(struct platform_device *pdev)
 	v4l2_subdev_cleanup(&priv->subdev);
 error_pm_runtime:
 	pm_runtime_disable(&pdev->dev);
+error_entity:
+	media_entity_cleanup(&priv->subdev.entity);
 error_async:
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
@@ -2646,6 +2648,7 @@ static void rcsi2_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(&priv->subdev);
 	v4l2_subdev_cleanup(&priv->subdev);
+	media_entity_cleanup(&priv->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)

