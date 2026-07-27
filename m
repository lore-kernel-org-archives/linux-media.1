Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9886D246BD6
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158127; cv=none; b=ijqJVVTqC1JBpr+Okgn89AEt5PIBZ54gdVHAqNXsIn164Y+hPXYgKpWjiVcagozEunhtTS0o7siolUJiMLU8Ep7pl4nOUDrgB978P36g/uI+GEafIsZHZdu8bgQUTVcZrWiAIxjyaznyyiEoU1tpFvoKI5yFysNwc9gGAefGugc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158127; c=relaxed/simple;
	bh=avydybYlwb01QbwcLQCTa2BoQTtiFAOMZvt0eg9bfts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pc8rzS58qHh99DITzI5Vmld4AX5/zgdSUA0JmpYrWnn5yo5p5V3wvv316wXtXWH/JhiHfnR27IidhxRDtC9MQa64wkWXVK2K3WVVRK7XSr++UIUAg1sDxzt/gT3xZ3x/6UPeKjne4KVbZvunHf5I8xrOACeTpLf2k3uPVLdgxho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9ewRrYs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9ewRrYs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8DF1F00A3D;
	Mon, 27 Jul 2026 13:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158126;
	bh=yk32M1nu3ri9pUxvWa4AzZbH372pSDkSfT5gJf37oNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S9ewRrYsuwUhu4u9hpjF5dMitiPzPgIOesm4rU3fRHvLr9tco/AFuAn4wyJueb+ZN
	 6DOAJr8niIOJPRqYr2FYxHvlxvl4/c6VTKtmrUfKxH7vRoF5EobLngQ74RANP62YDF
	 iHxmSAMI0ellOE/ANv0x4ah1pFy73CQXkKzTbWYNktsRKE2hNOfHuR+F7qzBNE6nrS
	 P2brwFx732FTE30goHTSM6JzbtM2pcbt+TR3FIXdvOc4/BLiNpRQf7fnLdm/hi4DQg
	 eLKZ4wG6CQPN8aRcc0TSeNsnGBXVSM1AC1t3ns2WMYRMaPWmulRcDM+VPshA6ZqVlH
	 yl5zo2a7nkBKg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Devarsh Thakkar <devarsht@ti.com>
Subject: [PATCHv2 09/19] media: imagination: e5010-jpeg-enc: drop vb2_queue_release
Date: Mon, 27 Jul 2026 15:12:56 +0200
Message-ID: <4e057eb56b0cbcdd7bbba1a14b74a84923f0a407.1785157986.git.hverkuil+cisco@kernel.org>
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

No need to call vb2_queue_release after a failed vb2_queue_init.
Drop that call and simplify the code.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
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

