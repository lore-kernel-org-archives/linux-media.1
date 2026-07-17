Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFC93DD512
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276721; cv=none; b=onOzFSMOtGrvzjlFKvRdybckrf6rqTs0GDAXJclvrYDntmjeZEwyB6sHbgMcETcHs89iI/DoG/HLEa9euCdFPpgYtUhRAxAm04d7rpXfbkTAB6Ofa6hGYKs8LqfgFC/BkevY5wJbs1C/k0reEXv48lavE9eKvn+boI4AtAY6ZfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276721; c=relaxed/simple;
	bh=bWbHPQvzsBdjmZFbcpbXlwPRWvTNF+Ie75CkTCGhOQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BU0rSz41aBg77tEhJMZ8Ww4m+MaoZax2SQ6GkGvopo3Y6OjluIp15Wz1a68jiVi7PUiaM/Ui+QsBUwTxws3TPcfwY/Bnz+SGGypDfrgm/ixbrIB0vsb/BoH+M7xLHhrZqsT1r9qjGMy3bYELJv4hwNQ0rFtF5uR0ovVV5fg6qsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d0Jo5XkG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d0Jo5XkG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7543D1F000E9;
	Fri, 17 Jul 2026 08:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276719;
	bh=JG4nB7DmCxfxYRMmTyixxGREEecxZp2djOL2qiowRAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d0Jo5XkGDonVdrqkXV5DxJj4bUQhN6ernE5O4PW7ICr4V/B9cgJjcrE7mHjzECX1i
	 80OSvniYhy1RLvIBnITsWZ+z71fjIIxfMAXWdoPIwkZQ+o6Eu74YX1rRfdvvKG7we5
	 /KWQTKgRyKEOpXRd5IMeshZAMQwJhuSN0kjTP0Z5HQtvSxseniIMq7edJoeaS+eU63
	 mDZgCS5bzeHyA4+Px2IVy4cHkEh6yHum17D4HMGbsGDB/wDAY2zpGfiOhcqV25PtD4
	 +vGNsC4NfRB+bWao03HNvKALAPmRHq8oeDB5SUPDRwkRvGZTgfGIdxgE9LvOAO0mZy
	 8Tymtqe+X4CIw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Devarsh Thakkar <devarsht@ti.com>
Subject: [PATCH 09/19] media: imagination: e5010-jpeg-enc: drop vb2_queue_release
Date: Fri, 17 Jul 2026 10:19:32 +0200
Message-ID: <f6eb47e6bad9f0f5d961aa92c23005b6768adcf2.1784276382.git.hverkuil+cisco@kernel.org>
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

No need to call vb2_queue_release after a failed vb2_queue_init.
Drop that call and simplify the code.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>
---
 drivers/media/platform/imagination/e5010-jpeg-enc.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index 42ad9ee3993b..2676bb25b5e2 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -606,13 +606,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *ds
 	dst_vq->lock = &e5010->mutex;
 	dst_vq->dev = e5010->v4l2_dev.dev;
 
-	ret = vb2_queue_init(dst_vq);
-	if (ret) {
-		vb2_queue_release(src_vq);
-		return ret;
-	}
-
-	return 0;
+	return vb2_queue_init(dst_vq);
 }
 
 static int e5010_s_ctrl(struct v4l2_ctrl *ctrl)
-- 
2.53.0

