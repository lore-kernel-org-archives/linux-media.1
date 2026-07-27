Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7501E413793
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158138; cv=none; b=byzhNDms/NpYPQZXQk0gjYVsAQOJoEUoczsBqrT7Tan6gs0cpCP1rQ2IekGZg4AwKe1m3Sw9Qmtt6s63FDimlkTp9AuXKG9qUGJ2K7ei2+SaSc6OTXcQSgEIBj89HiJm8azjbIek0HsXWFK69wsemrkxQeLSppPMnDdmPLPQBbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158138; c=relaxed/simple;
	bh=ZSmqWYMLwG5UHk7ew7Zvhb9cFcEhwXhE1bqqUm6yrVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M5SA4CTCY+EwwBdE7DTAwwSm0l9RWWcGm/FafeV9b+YOE8P4+TLGoMMlZUBh3jBB1X9Q0LjtbHgASR5l4I5jkeA9etwcUEHMXk4KOQ1CoTMoCUt9Z2Pgl7C97L+fnetJsFyxStGZ1M/d/rj7RhWV2gLBxUYpsOSsMYSf/fMXW0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9/EYo+N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9/EYo+N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3551F000E9;
	Mon, 27 Jul 2026 13:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158137;
	bh=1ChxzY4yC+nyS1KEBWxdO7f3UBXEb2x7Mkmwktn8hck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l9/EYo+NRR3gwvawTDyjdUl10D6mLOecKFUZPqVDOJTtW46HuEER3YISxhJ8xF4TJ
	 +wzYQephAaImOybD366/TW3abL0Lr3PIzN5SPB2BqqzN7ISg9Sg7upxxuPj7aGFvka
	 GgUac0RTRbmBNom/RsbNgIwVnvetR8wyNT2AoDgvUjS3jwoKQwrn1Rr6PVH0R/sOwx
	 TxWLq7qYVEIydT0yaapKwnVHk/lJP/LpAnqH1nnCLCU/CqTw+gs5lkC5+wsBU5AOas
	 DV82m6OdJDQ/tM0EArXVAuE9VgX1xNgGyAvYea1qBRa7f5IspzwXXpT6ArdQU9iG5C
	 qFW8OuMNMFtTg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jai Luthra <jai.luthra@linux.dev>
Subject: [PATCHv2 16/19] media: ti: j721e-csi2rx: use vb2_video_unregister_device
Date: Mon, 27 Jul 2026 15:13:03 +0200
Message-ID: <afdd67b43f0bed88d897927c28c6f478106f2011.1785157986.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785157986.git.hverkuil+cisco@kernel.org>
References: <cover.1785157986.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vb2_queue_release() function should not be called directly from a
driver. Leave that to the helper functions.

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

