Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05166242D89
	for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 03:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792295487; cv=none; b=G/1q00H03jcJAtEmeEoOOe7H9W5zRKSOynNY3Vq65czaQ6sVN/oPL81FdC53qiZQcxofUC2FVZop69cpv9r8M9ntexmkODpPMwPoK665ZCk9nabTrNOQpTWMPsOd0H3qH0ipaa2HIPqYhn/bqXSFnnAf9QVIV7wIdek/fDAlG2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792295487; c=relaxed/simple;
	bh=VouvCuUd/6iJICZZJOMhr223Co3gy72m5EBeKMWsXXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=r/Cy15w0oR8DOccp4eZnOxmUbdOxj3OEv9MybKylqrtv1LvrSFHwWmkAkdRYHlodcu0bq7GS65syMzCg6QSr1uANlPdRX0G7oYr1QPmzSWI4nSk3/fIYnCjl0PUUdFXf9F8Z0WbWgSv2rUquE7akOCErhnrZbI6on32f3T4+q4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kn2cQIxf; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kn2cQIxf"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53639b8903bso16931741cf.0
        for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 20:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792295485; x=1792900285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BAlfdGBaXEKTM4aRdqODW2suuLZt+2xf1jp0Ji6ORdA=;
        b=Kn2cQIxfO64tBWXSZIr6Ui860cstgm9pqbmYzL+BJ5QiCo+QGBnmNXKYU0WvSS/KdK
         MTytpV9Z+3ZycTQ3cUDImbKfTufNLi74WmczakqOdv9ZbEjlKLjfFEfD8XWO8owCHqnb
         FIMua00NNA/+JJu82y2vCP542LIvCTq1W4Ipu9iQNNvYhxC8ALuvZ1DVwDGR4i0qLmuj
         Rm2phoHt8+8m6cd9z0TXhGvzdqkpqLWuHtZ+wORFGf6ky0YvCxDcjLsSioT34NJWdVuv
         gFh/09Hzsa+C+rezpaDRnY5/PmFCkUqLJk97nz9jyuNfBFZgVF32jHXAoJ1MEMUgytXl
         2X4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792295485; x=1792900285;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BAlfdGBaXEKTM4aRdqODW2suuLZt+2xf1jp0Ji6ORdA=;
        b=27SULzu76/FXzQW4Fzk8iWlKPYGNMVzu5C2MYTolDF4Gd3+EgzQmZJJIPXaA2FU7of
         9qI2pcsxdvMOCn/5NdBeLRpG06rb1ZfzdiyyrZRWokVPPjTkafHRmbMh4EcJb+Za/5nZ
         lTarlJPFVONzFM2zXGpmGnpHObGep3f4jq0bRUrSXWy2EMy4MmHuk62/HGr4MZ5WfbR1
         o7HiMOWqtWYFmnWv8OCAGYhyAy0+mW/HDOKT3E2LQr0tpnQzOuWBvpDuoZhqEIOARYjm
         v45BhFIAJG1+hVr0hy4/zCR1cvWpBzVLMpw8XIPf5HhpTKX7niEv/NNvEr2btfSXKyRa
         5v4g==
X-Forwarded-Encrypted: i=1; AKwUvBxe14/cMguwiYIDAvnQgMOhAkFSUwwLYpozxj1sdQRk1U8wBT4Aj5eexvsKgtD5ScLGtZZFQA6k3WC1Ew==@vger.kernel.org
X-Gm-Message-State: AFq9FYL0Rs6ROlQgIewJwmMuA62u1GZNN2QJrN8lcvK3Gj0s9E4uF0ZF
	/JGzuzo+nE8ya4yllZNmdtG824D85wavyFQzGiERJgOuwO1HLOQogZk=
X-Gm-Gg: AYBFou04ZBcb0YH3+fU7I6E9bsf8dEwl9L8fTWBz9m2Fy6JvB+ej9TMJokFK+D7GAun
	uX8jmZ+2fi3OX8HzG3Z28Zud2VlxfKfLw+IyjGDyHV/LArtswlF+6ijk4Xa60vq4vrti6zAdQdf
	gF6WrBYIuquZHnmWtLwSut5A7YWnEoaIGxMRGz+eP7Uqu53tg+aHJ176jF1hCqd7P5FMv+JFV+d
	TZUgbgoBHUwUjZej/Dw3JVnfsHAaHS8q7cU0pOOiavm/N7MPhfTeZcWMM28aPrM6GNg649LGlrc
	ic79uK7vCPdqYQIhrpNClSFbJjvU95ATSjxyzbDlNg00HjSkQgYJw7oc5o0XDNx0W9WXeHk3Jj4
	BJDOBCKzJM6yXwrEOe+EhzT35EJwOgzjdNSwwipa7rSL+s95j7AkpR6xpvA3BLXf8Ogvd44R3Hs
	QLYuQcLpGzu8xWPSMyriJvgWlW1tEtpp7CtAHsSbtGUBgBvTyLCVbFFlZbz8LBX6YfFxCE+JL4U
	vbIIZAvrsBKXmH8Hhef85rEZT393iM7dwoebKBYwFBkIG4FUQ8er0aglzoaBbFSrfBp5RDpA2nT
	2Hubb9XE+QRGIhVwQKKuyzLtNQwC
X-Received: by 2002:a05:622a:1813:b0:535:2110:a9f6 with SMTP id d75a77b69052e-5364600602cmr63576021cf.18.1792295484793;
        Sat, 17 Oct 2026 20:51:24 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536660162efsm1032371cf.27.2026.10.17.20.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:51:23 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: s5p_cec: release IRQ before deleting the adapter
Date: Sat, 17 Oct 2026 23:51:21 -0400
Message-ID: <179229547105.3971562.9800339494753406560.s5p-cec@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The threaded IRQ handler reports transmit and receive events through
cec->adap. Adapter unregistration masks the hardware interrupts but does
not wait for this handler. With no open device-node references, it can
free the adapter while an already queued IRQ thread still uses it.
Devres also unmaps the registers before releasing the IRQ, since the
mapping was acquired after the IRQ.

Free the managed IRQ before unregistering the adapter and disabling
runtime PM. Request it only after the register mapping and adapter have
been initialized, and free it on adapter registration failure before
deleting the adapter. This also makes IRQ release precede MMIO release
on probe unwind.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 1bcbf6f4b6b0 ("[media] cec: s5p-cec: Add s5p-cec driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Compile-tested with Clang, W=1. No hardware runtime testing.

Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.

diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
index 4a92d32..e83705f 100644
--- a/drivers/media/cec/platform/s5p/s5p_cec.c
+++ b/drivers/media/cec/platform/s5p/s5p_cec.c
@@ -199,11 +199,6 @@ static int s5p_cec_probe(struct platform_device *pdev)
 	if (cec->irq < 0)
 		return cec->irq;
 
-	ret = devm_request_threaded_irq(dev, cec->irq, s5p_cec_irq_handler,
-		s5p_cec_irq_handler_thread, 0, pdev->name, cec);
-	if (ret)
-		return ret;
-
 	cec->clk = devm_clk_get(dev, "hdmicec");
 	if (IS_ERR(cec->clk))
 		return PTR_ERR(cec->clk);
@@ -231,16 +226,24 @@ static int s5p_cec_probe(struct platform_device *pdev)
 		goto err_delete_adapter;
 	}
 
-	ret = cec_register_adapter(cec->adap, &pdev->dev);
+	ret = devm_request_threaded_irq(dev, cec->irq, s5p_cec_irq_handler,
+					s5p_cec_irq_handler_thread, 0, pdev->name, cec);
 	if (ret)
 		goto err_notifier;
 
+	ret = cec_register_adapter(cec->adap, &pdev->dev);
+	if (ret)
+		goto err_free_irq;
+
 	platform_set_drvdata(pdev, cec);
 	pm_runtime_enable(dev);
 
 	dev_dbg(dev, "successfully probed\n");
 	return 0;
 
+err_free_irq:
+	devm_free_irq(dev, cec->irq, cec);
+
 err_notifier:
 	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
 
@@ -253,6 +256,7 @@ static void s5p_cec_remove(struct platform_device *pdev)
 {
 	struct s5p_cec_dev *cec = platform_get_drvdata(pdev);
 
+	devm_free_irq(&pdev->dev, cec->irq, cec);
 	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
 	cec_unregister_adapter(cec->adap);
 	pm_runtime_disable(&pdev->dev);
