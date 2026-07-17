Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA923DC856
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276717; cv=none; b=LCPwTl3s9koRGxSPdH0skHtFRcpnIVDh5g4r/gjbBx0SF1yxT1OjZU+DqE0Jmc0AIXpt4sHqoPMr/0+3y2RZeBQ3Xdaeymxj46L+bJMJ25qQ6c1WjMmRmjqdi1qVQA7nF8jaMVfmnfIPuXDVjJFuCD0q2g9nKwJNkNOpWBpsKAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276717; c=relaxed/simple;
	bh=9LPSi1MIsF6MNYAmfs/a74XRGkIeXiH8nurNaZM0kqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dFN+u5VP4O3Ipx+aAqgn2uJ7HS1UYaSM+JR0C28Svdu02c7na/7JomG02S0zB8ml59aPie0DjmaOs5OzOf9SI6qXun9tqNJPfOMwdmom/Rv1nms1BY73Ok3W0jWbecNWy3oBabIK1E1TxVFKY20ZOHvVj99uCaBFgqlhidervAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fS29ZqnO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fS29ZqnO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0E81F000E9;
	Fri, 17 Jul 2026 08:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276716;
	bh=Lzc0xl1aJywtDlbG6P4wQbMKMuK4UwM1Wb7EsU+rYp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fS29ZqnOV1Sdko3EAAQEW11W/ZurcKuobv0YmMOwou7qioFswl5bgfX7mmxR8CFjG
	 vGcmOLQEx+4fQFoa8X9p6V7MXOjzGYSHX1VLUZdlxQhvx5GlaWCQJDt3kvleOp5AmX
	 cefcJvLu9+gXDv+Juunv4rm3k26tIx0Rc6d322xHokt8JkrhThXyvxXnGqu+HnC0Ck
	 Eb+U9YmKvDajbtKbKFGiZOdqWNGD2pD/FX35NayZAjfR2ajw3HWJDrOWOoOB7EZdHd
	 UU5PZCrvmxEqqs50p8H8owuucg9M2Xd9eHUg4i7tLe/POVJRqgJ5lzU8Wub7Q/+DTW
	 cYXVFZEv1/kkA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Ming Qian <ming.qian@nxp.com>
Subject: [PATCH 07/19] media: amphion: drop unnecessary vb2_queue_release call
Date: Fri, 17 Jul 2026 10:19:30 +0200
Message-ID: <05ea8c95cd0bf769615d48aed6bbe9e1f665c643.1784276382.git.hverkuil+cisco@kernel.org>
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

If vb2_queue_init fails, then there is no need to call
vb2_queue_release.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Ming Qian <ming.qian@nxp.com>
---
 drivers/media/platform/amphion/vpu_v4l2.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 7cccc994fc50..af03cb82e9d5 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -684,13 +684,7 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
 	dst_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
 	dst_vq->dev = inst->vpu->dev;
 	dst_vq->lock = &inst->lock;
-	ret = vb2_queue_init(dst_vq);
-	if (ret) {
-		vb2_queue_release(src_vq);
-		return ret;
-	}
-
-	return 0;
+	return vb2_queue_init(dst_vq);
 }
 
 static int vpu_v4l2_release(struct vpu_inst *inst)
-- 
2.53.0

