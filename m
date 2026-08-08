Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39B53B27DB
	for <linux-media@vger.kernel.org>; Sat,  8 Aug 2026 09:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786180321; cv=none; b=MrU8rcYNsdwldfZ3TypphPxBK48MYRZC3qqIFHGl4EcweaqnHwAg4RN+4dcP0IHM0E5jXjrNKFCZaz3cZtiwSrqGMBU4APdswkAXz9a8L5P2EwrvPCMX1YIM3azy0MAOz3wPRMFDUendj8lXDZSoek1rC3L2QHnP2TkhJR/ns78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786180321; c=relaxed/simple;
	bh=oJ42448NVLVzg/Jd4WQT7WZLZMZvxVSOD0A/N+s45qY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gLlWkVVi7Iadn/UkYMAbfLGGvaqqEndVtorN3FycRzsEinHYHQLJkwMEeEs9GgQvaiKECnXlPmQYTKC5dgYHqrRub/jZQDg3MNNikkBRnBMNLVwtYbyp8wBGo8Aoq+jS0YSJBJMdItxgmhFiCZTf9q+DBJvqQuXimo9JEYCap/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0BxS4o4; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0BxS4o4"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cacb8416a1so3414565ad.1
        for <linux-media@vger.kernel.org>; Sat, 08 Aug 2026 02:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786180319; x=1786785119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BveM5cMWSJ3TieKfU41UkYe+p2SvuBRd6rFqa8L96gE=;
        b=A0BxS4o4oY1uk7TRgN+5zCBXO5yzpGq6YxQyF23MjbZbvFu/SwpUoi6Woh2jvis6Lq
         pQ2ap8lJWwVjoS/5SLTQ/aEnJuBcX+rw7UsjHY8KtJLugANXCZZtCflWRXMTxfKObwMR
         5ICxAzfbuorZZfa/cyo0GRlN2Qxf3PMsR5oJ3hr+GdGm4jufIAukp/DxQeDtxfuanVDk
         9qC2tLIJXfxOAy1Mmh0hhEn5eKvq1F047fqI4he/x1aWN2/qBQY6Uzsqu6/diu+v84V0
         UEwKJ4npfJSQZee4d6X+WPHAysxtA2p1f6RLaeU5dIo8QnTjZnzhz3MFEIvWruUicSKO
         QgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786180319; x=1786785119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BveM5cMWSJ3TieKfU41UkYe+p2SvuBRd6rFqa8L96gE=;
        b=br02BMdTO7mVy0MsyP1YvTtLh23SOv3Cm51B7PCxwVVg81DyrcRff7QuY7Aqcvj8Lf
         l+rVW2Gw/6nxIKNVvKHIQTyXFAr0Q/wuNvHYswvP3H6tV7yOp8NwUX0OXST79VGd11x/
         QjAxXJq+mYOS4zAoAhNIe5RwfavWAMKXaq6du1IMU2WAG5AqiCwSrw/Pz8xEo6PVNnbT
         rJhS1AuweWJv7tA7+fTme79W+FgR3vI8CMO3nrYxLNVChuoIajD5jzD3mtsW/KUc+0Ed
         NzsiJaSYtUqJHv7Tk6dsB2R5m/9fgKnzzUXIOcSs4zkXu/IZdPz+agQa8BC72iwVGk5P
         L3bg==
X-Forwarded-Encrypted: i=1; AHgh+Rpqzf9DpPOyH9Jn95jkmccEPUPr1B0NtLk2wLGxJ9WXo97Xz1XZF5gnjRlpn2NiJBrxcgMTVtP7YlTd4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxduueC6ERu1GSmi3qQgFF3S/TtBSckLtl2jTE3nMPIcEl5csWd
	eir02eqF0h3tBuS2CXlJZNJppkX2oBnQJzTrLTmiUoPdxKiuR75K1fTv
X-Gm-Gg: AR+sD11jQ8GBR2M++X4/xpadxsE/TIiDBd6KSGBoz8wqlAlC2E60C9PgVTI6yRD+XM5
	PVuJkMM+RG3qYWVdASYhy0c5IoH9VdM2OMgc+A/QOAoQEQ9iSNFuq0Gyzhmkcc4C2xaUKBlug4U
	zRlS2PCFx6AYvqEkczHVmpRnl5CFab7lqCJg2S/tyikdUvaYJbF8Msddl7f+7BbBTeT3P02TTEP
	EPUSt2qCkoVsv2rrt8ZyLQgg01u24fKm3RuBh+mi/W0eNN2bUmWk6yzrdXcKaBEoTvrvBH+GIvl
	0ryRxkYhbwhzmur75NSeZ0sm5eQsvRU0OIwRJGC/2fGYnAY60az3mxABgVXLqCJ6IK0JOFHopt4
	P0sHSzUFgczCr13omqir33mU0Bvp3m1eCZQ6Kf4Gb4y4IyT+6Cw+SixdTwFWzuS1aI/dU6CNYPF
	OiBnEE0BHKkYfIQTTcQmeyQhjnqFf6UtUe34W+Bu8V/JyZ+QguDZar+SvWCavQRHdCXIO0xePl5
	Y1k2A==
X-Received: by 2002:a17:902:f709:b0:2ca:1b97:70c5 with SMTP id d9443c01a7336-2d2a8458b93mr88228315ad.4.1786180318914;
        Sat, 08 Aug 2026 02:11:58 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde308sm17126060eec.20.2026.08.08.02.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:11:58 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: sun4i-csi: fix async connection leak when notifier registration fails
Date: Sat,  8 Aug 2026 16:11:51 +0700
Message-Id: <20260808091151.2691482-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun4i_csi_notifier_init() adds a v4l2_async_connection to the notifier's
waiting list with v4l2_async_nf_add_fwnode_remote(). If the subsequent
v4l2_async_nf_register() then fails, probe jumps to err_unregister_media,
which never calls v4l2_async_nf_cleanup(). The core does not free the
waiting list on a failed registration, so the async connection is leaked.

Add an err_clean_notifier label that cleans up the notifier on the
registration-failure path, matching the teardown done in
sun4i_csi_remove(). The notifier-init failure path adds nothing to the
notifier and continues to skip the cleanup.

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index e53a07b770b7..a8db851ab5a5 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -255,13 +255,15 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	ret = v4l2_async_nf_register(&csi->notifier);
 	if (ret) {
 		dev_err(csi->dev, "Couldn't register our notifier.\n");
-		goto err_unregister_media;
+		goto err_clean_notifier;
 	}
 
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
 
+err_clean_notifier:
+	v4l2_async_nf_cleanup(&csi->notifier);
 err_unregister_media:
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
-- 
2.25.1

