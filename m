Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4957B367B69
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 10:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781864593; cv=none; b=C/06zs98JQB1TjvjfRZDxospkV5p8QuHz2Z/fEtI2y+RQlzE3WpvCTpf+u7rpN+YVyHyLbC56lmVmn70zUJ6t4vTghDXH9opcLdWOwuPi0OcVyHy15nK2dRpUGa7pvfzAlJSXZ2nA/fwlbW7pXqKAQ17hgp30TFzFS4snI7I+QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781864593; c=relaxed/simple;
	bh=8rpifABVURtbDeYxAVcIyOeVXIwMqnxKdvLdu97ouvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kbpgP2s10aeG0sT+OZ40us4UNEFrj26Zn+383krb+95wwWNO6H6/AiB1yR5BVle5un0KTTcucJiBi2+xc03Jt7a6KTAxuOdcEPZh9HIgSJ3co3gkoBpQrlGEHDzRZHJjg04lFeoTjeoHvlwROf8o8TarbY3U2nRpk8bh3aIyPEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ot7KyQ4f; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ot7KyQ4f"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c8894387780so953156a12.2
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 03:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781864586; x=1782469386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rcV0W3r/htGKSijwn2A596Ma4M4nwm5Ks92ktFEtLE=;
        b=Ot7KyQ4fQk2kU8QE/3K9A4ljf1iwXjZmhSHkU4LduuLfvBMz0xGkziq0cX9GOplKZk
         jamjNqh53PP1s+l2ycUemJk7pspTr2YrT4F3Xz+POGJQIIGHanoJHlDeofW3b4F8tPol
         ggiBm3dUeyBW5hhQzr4TcYlPisdUl5Qb32VZVQd/7iNMWtMZXgAqUirZb8nyVr/E2FEw
         +AKlbxxmD5RPnIQFdZHPBug7M8p/vuVMkf1BhDed/k4QKjSgy6ySR+3vC97ZE0GqaAzi
         deSBl+DQJCykCtR157qtL0SiY5VlHYWw8MlGpGiAUQxIBMsk+38F/XCbI67tVLHKdIQp
         IOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781864586; x=1782469386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2rcV0W3r/htGKSijwn2A596Ma4M4nwm5Ks92ktFEtLE=;
        b=PlnavL3wyqlSwPHCNkPvpxy0HjUKnguLywscHl2DtCTxE623JoUZNXTBEmNR8RQOdf
         mQ63P/ubZ5kwfV3Yj2OdS5BhyN4i0R8c2W5j+q02Do7H9nzJ1/uRbU+ga8amF8F+rT8P
         qWvhnZUjSecOr19GqmRervX7INKLLE6Byirgf1gj1J4kSITWRprwuIPzrVSK5NS2YPHm
         G4/olZT/jsCgBYkswszi/Xd+IlDftHxJVTauWBxT01lkXDEU8S5O9Z81T4+uawdZwsL3
         GaWk3GMi87y+LR/yXewck6t70iPx8iNOugt4xzFYThURjRh0ahfZVGeJO4rbulWYFU0X
         3ObQ==
X-Gm-Message-State: AOJu0Yyt/mtW04+1qsTeCvZOjo2dYioXSC1LawlgfiDh+u+cLCmTg0j4
	dWpufUlIv8iNF12SqBHJ1k8K5FcwYDPTYXWqxTpvuL0Uny8MIc6avvR4lGunTDoN
X-Gm-Gg: AfdE7cnrAQRxPqglJhCX/L5ESIcvQOsXe90vKJ9cIEUIE6vjKp/5qre20Jq8FcTMFcp
	zhjy3WCk3SJpmq0pnsb/BP+3rrTAiyBoMyo7qf2UJpxqtm6ajM1NUpGlUYvsqsKgnb50EyVdvPD
	+uFtb0ZvOEwxgCBF9ntTlWVAx9a59ixWyKRjHyLLGQT1nV/ljHICmnwn8a3FfLScZkFU4iPRw9w
	mQLi0nAz4VvRCnbKOxHHmAodLR/qz9XgyJHTWuaZUC76Cs6aubB5KYbivRVWnMtt9oYaZtzIXnd
	YaiO3ORhAaU6RJ3fwBIeWBKaQN/tNF0lZIq9Mjc8HzXNiNaqXPcBykendRmSMfIMpmayn8wljz0
	owbu56U7GS48acx7zl3IMmmniFG3DPZpa7hcillDWloMiEjt6on5z4eop1VmgKU8dPkL0ftXKaN
	Uq4419btQxP/qdArut4uT3Qm8iP3T1lgttCVpPfULzpQ==
X-Received: by 2002:a17:903:2ec7:b0:2c0:3400:5c34 with SMTP id d9443c01a7336-2c718c879fbmr33523975ad.3.1781864585894;
        Fri, 19 Jun 2026 03:23:05 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c720c24f73sm19486115ad.82.2026.06.19.03.23.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 03:23:05 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 2/4] media: renesas: csisp: Add missing media_entity_cleanup()
Date: Fri, 19 Jun 2026 15:52:44 +0530
Message-ID: <20260619102241.22887-8-birenpandya@gmail.com>
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
media_entity_cleanup(). Add them and introduce an error_entity label
to ensure teardown logic properly inverses initialization.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b5650..61558a71ee35 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -539,7 +539,7 @@ static int risp_probe(struct platform_device *pdev)
 
 	ret = v4l2_subdev_init_finalize(&isp->subdev);
 	if (ret)
-		goto error_notifier;
+		goto error_entity;
 
 	ret = v4l2_async_register_subdev(&isp->subdev);
 	if (ret < 0)
@@ -551,6 +551,8 @@ static int risp_probe(struct platform_device *pdev)
 
 error_subdev:
 	v4l2_subdev_cleanup(&isp->subdev);
+error_entity:
+	media_entity_cleanup(&isp->subdev.entity);
 error_notifier:
 	v4l2_async_nf_unregister(&isp->notifier);
 	v4l2_async_nf_cleanup(&isp->notifier);
@@ -569,6 +571,7 @@ static void risp_remove(struct platform_device *pdev)
 
 	v4l2_async_unregister_subdev(&isp->subdev);
 	v4l2_subdev_cleanup(&isp->subdev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)

