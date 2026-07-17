Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03F93E00A7
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276732; cv=none; b=gBAVgUFKAQnh39tHKzUVsZZVPvr1CTx1itZBXnN5mFhSbeWxDIl/iQBbIY9AN1Rt8xP+4r1Dqpg0cmhIYVHVN1q8XFdn27HpTSbg3Z2aDddN0I+bAk3Yy4U5LUlprv5/haHc6lGAMjWyqJXU0JHRrXWVZ2YfBspff5cZ0cn014I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276732; c=relaxed/simple;
	bh=KlAsDleqfwpumNCPAe6EYeucuAblOT8qXpUrA4PyZbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZSvsRxNm87k9ukJCkKclRqedjCxLOOYnVXJti/pA1R8fTwldp2l/NHh0vrPd06BaqAeOV6DfmyB8NlcvT3Qllacw46473/qkFmmpB6cMFZu7nwFake0KupR7VB+KkTbi96tB7ZE6DeJOeOlirggXJHR5ymetu56YwTxesFO9WhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VP1xSZns; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VP1xSZns"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5553C1F000E9;
	Fri, 17 Jul 2026 08:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276731;
	bh=kQck56oeVpuns2fN9OsEhaVdg19C5RSmHC58PEeBjbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VP1xSZnsDWinWeM1pRDtcm188BGCJ3DZvaNUt+884HqlF9O6S0eRi14T3IkiuhA6x
	 bBF3yocsS9ymZs1TUI81gH2Ug680dHJuxXQunn0l2IfGi5sRN3ozIM2q9VRtpeWust
	 yrIU+CmKrE1KwJa1tbF6OWCB+qS8mUSAisjZz28b8vhJuZI2J2N0MOYhI9KE886O8k
	 2+Z6OdW/w00qPwQCGP4PEEqrPc8A7/IGykHnWy0e23RKVX32wX1kaTCT8DeO62hteZ
	 xAyVjK3IlzwupdTNKFPclm2ramhMYrwzejzmVKqc6hoJ5PZmBKiaSwqNA+XP+Zku9i
	 w/Himc9AKA9QA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jai Luthra <jai.luthra@linux.dev>
Subject: [PATCH 16/19] media: ti: j721e-csi2rx: use vb2_video_unregister_device
Date: Fri, 17 Jul 2026 10:19:39 +0200
Message-ID: <7362277c11e6401bf9dca456f98b024acc6fa6bb.1784276382.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784276382.git.hverkuil+cisco@kernel.org>
References: <cover.1784276382.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the vb2_queue_release/video_unregister_device pair by
a single vb2_video_unregister_device call.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Jai Luthra <jai.luthra@linux.dev>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 4769931b1930..7ae7d1e33ce3 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1268,9 +1268,7 @@ static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
 	if (!pm_runtime_status_suspended(ctx->csi->dev))
 		dma_release_channel(ctx->dma.chan);
 
-	vb2_queue_release(&ctx->vidq);
-
-	video_unregister_device(&ctx->vdev);
+	vb2_video_unregister_device(&ctx->vdev);
 
 	mutex_destroy(&ctx->mutex);
 }
-- 
2.53.0

