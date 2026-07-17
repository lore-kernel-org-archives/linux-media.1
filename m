Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ED43DD50D
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276709; cv=none; b=dmoLbfeEV3sQjSg9PFW6ug3fa1O7XCJTZtcV9FhlKVaNRmlDa4o8B63REB3BVUZFhbFUF7YWSnOGvmXggfmtxKfk2cv2J0FtdbXz3hIVUTYBJVP2DGmnMFe/iCY8Dq3slYBNJGUDJeAUrpG4FjDnRHpFz38g0L8Qp/eOtTuMdyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276709; c=relaxed/simple;
	bh=IJ5XSffakCbpAN4BF/LBzw2n4ReG4kcdNwxgU335YpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tC0N46i8eY9aLNijckELdcgLIxtdpYhivhVED89RavkwJz3Lwa72yMkxRsUqFG7NlusRumAqIYr2pXMmPvqllGyvdL2ym4O3rKlgXt5q6Gt/WrVgupgzyE0wJRgeSUU/9/acO1Y3Qkc3Kipi6uy8IMgFT56D9YILkiV4tq2yfro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/Kq7JwV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/Kq7JwV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29981F00A3A;
	Fri, 17 Jul 2026 08:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276708;
	bh=RI5kSTMgY6KLtVojef2YrY4/+n60D0hL6lHQ7fGNx8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X/Kq7JwVpWNorHJKtjJq9etABQ4nRjtMtvzszOyfRvezho4v8c60LvyegbHnXIp2f
	 K5WhI+r0daUK4FyFrblik316uwl8XHpgGG2fc90mOyiw85uEtjDmh4hrPHXOhr4ijW
	 6C/Kc0/EtTfXXrAY7k5wNLLgoST5Bo3MPwtsOB1zTWCxFi63YV1+mFBuuw5LoDXtaz
	 1b1aG9ivsSeuWrSLdO8peEi2xbSrhEM3Wl0/3BfnoZsfUsJRYSXLlriDvHSdEuyIuN
	 q6wu3oQhWgexvvRQnQqffuydsWZgye3Qfb0Bgnci+NsDZHj8lz+Vay3jIaRqX+ZAoF
	 cjoaP+lXVvDAg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Ben Hoff <hoff.benjamin.k@gmail.com>
Subject: [PATCH 02/19] media: pci: hws: drop call to vb2_queue_release
Date: Fri, 17 Jul 2026 10:19:25 +0200
Message-ID: <9e22e2878ac7e7063474cb7e0b9bb8399f33649a.1784276382.git.hverkuil+cisco@kernel.org>
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

The call to vb2_video_unregister_device() takes care of that,
no need to call vb2_queue_release directly.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Ben Hoff <hoff.benjamin.k@gmail.com>
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

