Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F56925A2DD;
	Tue, 28 Jul 2026 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246753; cv=none; b=u1yvwAa0EmJfzUj36acqJtk82faQ8SJDzWgx8cbniW2AwoXEHdwj2op5HvLf5dRJE/cIjQGW4dut4pbeWsifLgt1LDCoawLtLPKgBlERsklLoykO6nKMy0AccJV07Bkxvph0KTpTFKMYGgO9Rpo+VD/haabROAhkdLhYlLfkkRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246753; c=relaxed/simple;
	bh=DNp/ytFzqqOH0VI1h46kJ9yJwt1SvkidIWWS61bYePs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F+j7Frs/KJoBjuDdYXWPUWNjNWWt3YqC7MRqAFbPo8PDbLajxc9lyYSYhMASTIXznqk5n8bqpCa3XFgUGq9O9fOEo5gsXNxtbdm2JF5NKhPTKRfw/NF/32obqtsk4h2yEx8iStHoiaMfrbRao1L+m/bSB0x1Tz6fG9qRhWTVvQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=l39RIaPq; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="l39RIaPq"
Received: from LAPTOP-99KJFSET (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 47e2b3619;
	Tue, 28 Jul 2026 21:52:25 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: fabien.dessenne@foss.st.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Hongyan Xu <getshell@seu.edu.cn>
Subject: [PATCH] media: bdisp: cancel timeout work before teardown
Date: Tue, 28 Jul 2026 21:52:24 +0800
Message-ID: <20260728135224.928-1-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fa8ff83c503a1kunma1995e98f1426
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGkhPVhhOQ0oYGR8YGBhMSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJSE
	5DQ1VKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=l39RIaPq1WeqESIFNXUYAYi+HrXo4jAEZtkkpYZmrczjWblPrzx6sNLM28eGKHZpvDRDYOxEVd310hhcIVhbFiwBoueoIJy4IHzdaLxn3SBH61V35FKi7nxXY38xVVMc6USfxkDrUqNOT3prOGngC/tRlW35eqMZ2VI1TJK38rc=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=Su0NSxF9RpB59PmOUwGiQ9gjpXvSmfkr/8RVeX0erNs=;
	h=date:mime-version:subject:message-id:from;

bdisp_device_run() queues timeout_work with a non-zero delay. During
remove, bdisp_unregister_device() releases the V4L2 mem2mem device before
the private workqueue is destroyed. A pending timeout can therefore run
after v4l2_m2m_release() and pass the freed m2m_dev to
v4l2_m2m_get_curr_priv().

Pause the mem2mem scheduler first so the current job finishes and no new
job can rearm timeout_work. Then cancel the work synchronously before
unregistering the device. This guarantees that the callback has finished
using the driver data before the remaining resources are torn down.

This issue was found by a static analysis tool.

Fixes: 28ffeebbb7bd ("[media] bdisp: 2D blitter driver using v4l2 mem2mem framework")
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
index ee6d686cb..5c92777cd 100644
--- a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
@@ -1261,6 +1261,9 @@ static void bdisp_remove(struct platform_device *pdev)
 {
 	struct bdisp_dev *bdisp = platform_get_drvdata(pdev);
 
+	v4l2_m2m_suspend(bdisp->m2m.m2m_dev);
+	cancel_delayed_work_sync(&bdisp->timeout_work);
+
 	bdisp_unregister_device(bdisp);
 
 	bdisp_hw_free_filters(bdisp->dev);
-- 
2.50.1.windows.1

