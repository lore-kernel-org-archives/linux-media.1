Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD3D32A3DA
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 02:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404151; cv=none; b=j/cL+N3ZnfLkBigGsLoJ+IXJxNp8FLjyYYvmDDvkPFn3524Jk5Z+0nWZeiCZYZji9OAm10y+210EdkyGVqr6oCe2U3kyOirThycvaO+4XUhrwUFL4Iu0U2aj3hZ76T55Arx+Nt6qL2oanP7ILMGgFIJsG8XgYjdW73vFjk5pmjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404151; c=relaxed/simple;
	bh=sXwXhAyvdVq1PoNFpW66gcLbg74VZNGlASJZQ1zokkw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fcq4LAlzpl4uBYOpVGmQLURfpC45/VBmBZpKN+qlGXlkK4JPAo0pkrqBOxpf4TyRq3+T9HmGHB2amKA/xWpePnmOWluh1Prl3gOmYdzhTsprqL6Lsy/PZwOsK9i+4IJcuqOf+VdCuEXHtu5TBjma+RXjBVrpVRRk9gI/9Nt/m6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Gj+bQahU; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Gj+bQahU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=km
	Y29Ba5Z+iJyTq2fsV4Z7B/8VKqBLLokShXaKaeGGI=; b=Gj+bQahUQWAB4embrS
	5PEeALpoQeAgcmDZ5q9pAIXgoCvE40Osms/3ZiSUzSn3EQwJpl3WgFc3mqEKJjto
	DC9eORcifmexQn98lPQqIzGD9Gnyt0JZdBGmtLmnYPHMQl0aM94D8ioOQPppNvYJ
	D810GS7C37UfR7Br8avr1XvSo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCXt_af4ZhqA6QcAQ--.45466S2;
	Thu, 03 Sep 2026 10:55:29 +0800 (CST)
From: "Li Youhong" <dayou5941@163.com>
To: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	Li Youhong <liyouhong@kylinos.cn>
Subject: [PATCH] media: mali-c55: free IRQ when remove while runtime-active
Date: Thu,  3 Sep 2026 10:55:26 +0800
Message-Id: <20260903025526.2657105-1-dayou5941@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXt_af4ZhqA6QcAQ--.45466S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4UuF48Zr4fuF4DKF4xCrg_yoW8GF1rpF
	40qFW09ryUGF12kFyUAw47ZFy5Gw1rKa1UGr9ruw4SganxGan3tr1Fk3Wakas8Ar1rA3W5
	JF93t3yfArs0vF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jea0PUUUUU=
X-CM-SenderInfo: 5gd103ivzuiqqrwthudrp/xtbC3gFhEGqY4aHZlgAA3T

From: Li Youhong <liyouhong@kylinos.cn>

The IRQ is requested in runtime_resume() and released in
runtime_suspend(). remove() powers the device off when it is still
runtime-active, but does not free the IRQ.

If the driver is unbound while streaming (or otherwise runtime-active
after a successful resume), the threaded IRQ handler remains registered
against a powered-off device.

Free the IRQ in remove() the same way runtime_suspend() does.

Fixes: 2c9b9bcc2569 ("media: mali-c55: Power-off the peripheral in remove()")
Signed-off-by: Li Youhong <liyouhong@kylinos.cn>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index f28e9f4354ac..2f6658a2ac15 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -861,6 +861,8 @@ static void mali_c55_remove(struct platform_device *pdev)
 
 	mali_c55_media_frameworks_deinit(mali_c55);
 	if (!pm_runtime_suspended(&pdev->dev)) {
+		if (irq_has_action(mali_c55->irqnum))
+			free_irq(mali_c55->irqnum, &pdev->dev);
 		__mali_c55_power_off(mali_c55);
 		pm_runtime_set_suspended(&pdev->dev);
 	}
-- 
2.25.1

