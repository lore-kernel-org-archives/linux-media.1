Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67511E4AF;
	Sun,  1 Mar 2026 01:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327934; cv=none; b=dZqhTXDfBh7UV3nxPSGrMYzc1lxqyMH2lVp2ujoKN/EAoiu/mh3f54KlaNu91NKzcMPxapE2EgVy+LF/MIklhKObNpBYZKcPiuNLIG2QkYQOHWl/SintJ0K7JGjfgmpGsm+R+z6Im4eGoFTp13rCweCGk+xcQyDgzRp0KWFXjyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327934; c=relaxed/simple;
	bh=FRKwOoSZu/FSFhQ1dnDrcUqNs7d4HXs34ChuCad7+Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jIykvy1drdcHwhc08KskxW6B0eeyhihbhrVHaQK2y/X4YLnwGztiGXp5BOy2kJ5UmIcN6nHn/FmZCTRsy7CIg6QOiDox/1DvcDeJPiE7AuW5YoTj0ZTVehUqMXhynlmgVjH0z9t8CLxvvTMimOktkyCBbNGc14GZXkFcyl7pn30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LlxXBKsy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LlxXBKsy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119ADC19421;
	Sun,  1 Mar 2026 01:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327934;
	bh=FRKwOoSZu/FSFhQ1dnDrcUqNs7d4HXs34ChuCad7+Hw=;
	h=From:To:Cc:Subject:Date:From;
	b=LlxXBKsy9jHwXJgmTQuSR2LZt6myVEZ2FCf2Uf3JPCSwK9UL4G2euzIerh9ytO+xU
	 jtrIg9zBACgZda63i1697RgbMU/EFe6WaEIV/JE00796qa7A7OA8RSoKgEWCdqquTD
	 0OsHZCF4L4ei43pHgutofmQjAH71xknMtpcBZtbuvj2JYwMsssDWu46SX6hU23L2n8
	 ocP2T2LaHvWSsNPe3GfyJepcwtrfTrlGXIY5vdb2NnNaFYdLuxryuOtF59jOyUGQhr
	 eNQUZhWkOZ9q5Xi5xqRsfaTVVZ/mWgp5OR9puXmlETBmDr97ysl2uL1+ATp52SEhm0
	 If9TpEPX46Rxw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	xulin.sun@windriver.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: chips-media: wave5: Fix kthread worker destruction in polling mode" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:18:52 -0500
Message-ID: <20260301011852.1673350-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 5a0c122e834b2f7f029526422c71be922960bf03 Mon Sep 17 00:00:00 2001
From: Xulin Sun <xulin.sun@windriver.com>
Date: Thu, 4 Dec 2025 17:41:52 +0800
Subject: [PATCH] media: chips-media: wave5: Fix kthread worker destruction in
 polling mode

Fix the cleanup order in polling mode (irq < 0) to prevent kernel warnings
during module removal. Cancel the hrtimer before destroying the kthread
worker to ensure work queues are empty.

In polling mode, the driver uses hrtimer to periodically trigger
wave5_vpu_timer_callback() which queues work via kthread_queue_work().
The kthread_destroy_worker() function validates that both work queues
are empty with WARN_ON(!list_empty(&worker->work_list)) and
WARN_ON(!list_empty(&worker->delayed_work_list)).

The original code called kthread_destroy_worker() before hrtimer_cancel(),
creating a race condition where the timer could fire during worker
destruction and queue new work, triggering the WARN_ON.

This causes the following warning on every module unload in polling mode:

  ------------[ cut here ]------------
  WARNING: CPU: 2 PID: 1034 at kernel/kthread.c:1430
    kthread_destroy_worker+0x84/0x98
  Modules linked in: wave5(-) rpmsg_ctrl rpmsg_char ...
  Call trace:
   kthread_destroy_worker+0x84/0x98
   wave5_vpu_remove+0xc8/0xe0 [wave5]
   platform_remove+0x30/0x58
  ...
  ---[ end trace 0000000000000000 ]---

Fixes: ed7276ed2fd0 ("media: chips-media: wave5: Add hrtimer based polling support")
Cc: stable@vger.kernel.org
Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 23aa3ab51a0ef..0bcd48df49d0f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -352,8 +352,9 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 	struct vpu_device *dev = dev_get_drvdata(&pdev->dev);
 
 	if (dev->irq < 0) {
-		kthread_destroy_worker(dev->worker);
 		hrtimer_cancel(&dev->hrtimer);
+		kthread_cancel_work_sync(&dev->work);
+		kthread_destroy_worker(dev->worker);
 	}
 
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
-- 
2.51.0




