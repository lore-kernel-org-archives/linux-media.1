Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6DA40EB8C
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158117; cv=none; b=OMdG8kGHerchLKjNypg6pjvugRncsW2R0xAWBmmRmiHw3GWEE3TU26BYmbCVpN2A5ppd4SEE9qXk6jQYzx/HbBxJZvtdN0Y48tEgSoPNtGOAUai+EM6bMmRZPDMgQOsy5aC4yGrxEsDnUbIJHn/BgzRTfNeqCNNZqQe23vHBgNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158117; c=relaxed/simple;
	bh=qZP1YICE1ISmpMv2qYeByE8o2OyJi2D9XlkqoHG4Ptc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tm+JyMPPbvpUplGReHZnLJB6jobd6+T9o/uWxD4ayhE3go7djVWMNPdGyV5UI+tmRXrgppSa9v4s+DXB4Gmf3Tp6xP/dtfxF1YqsPeaiUvXQbUaDlRej0hExGHc9rVousymnD4KRAiyMoEfcos2e8I5LwGtlCr0ZbyiZ53Bi7f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnxPta1M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnxPta1M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44061F000E9;
	Mon, 27 Jul 2026 13:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158115;
	bh=PWy1enomEiV73n8PbGEfhcvtaM5SNC0h0JFf6/CbDKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TnxPta1MZbG/QXMyXoPphIY4vIaQsFK9U7WxZCoR9MSy5ix9c3hFW5DtSVWH2UUAX
	 tB5FSM/lV9/CyZb4JN2L/ARBkeXHo8NhmjzZVbULNNYeNpWmDReA7ONG8MW0E2AM6k
	 gP0eSqHVeiTcoCaN587l8hAS5D1CVfCA66bj3Goi5Ugy7baWxa5nHYazRI387idzuK
	 UXxN11ffXG0BuIr/LQ+2jwbYNFk3NbZuNJczi6pHLl/2y1MkFZxixFgJoTXq+21ZPw
	 ESuQFnXK5cyA/6+cbNlxFifRteWMwJ3ZkZKr+Qn43zyXvCRWHojt1hjGTNi1kJUa87
	 5o+hGw13yu29w==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Ben Hoff <hoff.benjamin.k@gmail.com>
Subject: [PATCHv2 02/19] media: pci: hws: drop call to vb2_queue_release
Date: Mon, 27 Jul 2026 15:12:49 +0200
Message-ID: <0ea327b133d3dd5bd69e856dfd45c1f5eb93ddca.1785157986.git.hverkuil+cisco@kernel.org>
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

The call to vb2_video_unregister_device() takes care of vb2_queue_release,
no need to call vb2_queue_release directly.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Reviewed-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
 drivers/media/pci/hws/hws_video.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
index 18e4bc6901d3..27f12bbec00a 100644
--- a/drivers/media/pci/hws/hws_video.c
+++ b/drivers/media/pci/hws/hws_video.c
@@ -384,11 +384,6 @@ static void hws_video_drain_queue_locked(struct hws_video *vid)
 
 static void hws_video_release_registration(struct hws_video *vid)
 {
-	if (vid->buffer_queue.ops) {
-		vb2_queue_release(&vid->buffer_queue);
-		vid->buffer_queue.ops = NULL;
-	}
-
 	if (!vid->video_device)
 		return;
 
-- 
2.53.0

