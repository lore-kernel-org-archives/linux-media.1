Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213E7412C12
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158137; cv=none; b=caSx7Rz6VtgqBE1D4W0e0tFAIgfRflqj+lTF16nPes+FB/VvopCjdmZwUD+sAaiK6S8W1D77JYYawHNg45OHjYk3r9e9htNxnzv43fwjx6oV/vU708V2ZnJfi/DFgyBRsvLHcz1y3rpWJHIJzn++bb9aTmZKwoX+i3rGnJRD50Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158137; c=relaxed/simple;
	bh=6muf5283t9RE3VM1g+mK9xuGOu8H0JBeqmHGs2N0lnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JJpH0pDUXNLbMGUYmsPsa0Kn7W3h3ivSN4m1MWfv2FDZ52VPodFpwwBWLAagZQ3UAIuu7OWEMaiaU0TxfYo1zKg9mAjKfMi302LGRbdVwss4z9WRmOZvuBFjoqvSELENCD/BKdNbsFWzMrevTjoYqLyfTA/6oWLUiQe7gGjOzH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czhUFfhx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czhUFfhx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B50DB1F00A3A;
	Mon, 27 Jul 2026 13:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158135;
	bh=MIdYUGPnwyH0Ww03SYDpvRjLJ7tbGot4euN57K8IEws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=czhUFfhxb1JmvBNmkNdXRmmRYFlQrJ/AYx2VRs4nkKWV1DVqNtTdyPW+xBxTn9p2Q
	 KGL3rEPpNRR9sbxUAxCkH/bzxxswmeJEj/t8biwQ9MP6bSVr66o7Ejtx+F+GtBzaiB
	 4ICJDNekGYimOCgpFb5t62wyCqNu89rxEsMfLXvGraQb9LlsnDgFDPhZxuDTJzlr8y
	 5WZsTDZLNdCus3+2WnrkjoSacqaJ4RSWcHEZZWYHCGWzon1mTUwftEm3tvV6ZKZRje
	 15oJNmI9VOratE5QdAMt04JnYb89liw4OdOu/f3miYUP1G/1Iq5kR8RsKNrCL97e/z
	 jbNgNtBNAF03A==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCHv2 15/19] media: samsung: s3c-camif: drop unnecessary vb2_queue_release
Date: Mon, 27 Jul 2026 15:13:02 +0200
Message-ID: <c4696364bae6b1ac7c5a467e882af2218cb0fa5b.1785157986.git.hverkuil+cisco@kernel.org>
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

Use _vb2_fop_release instead of vb2_queue_release/v4l2_fh_release.

No need to call camif_stop_capture: _vb2_fop_release will call
the stop_streaming op if streaming is in progress, and that op
calls camif_stop_capture.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
---
 drivers/media/platform/samsung/s3c-camif/camif-capture.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/platform/samsung/s3c-camif/camif-capture.c b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
index ed1a1d693293..3cbf58b2128e 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
@@ -572,16 +572,11 @@ static int s3c_camif_close(struct file *file)
 
 	mutex_lock(&camif->lock);
 
-	if (vp->owner == file_to_v4l2_fh(file)) {
-		camif_stop_capture(vp);
-		vb2_queue_release(&vp->vb_queue);
-		vp->owner = NULL;
-	}
+	ret = _vb2_fop_release(file, NULL);
 
 	sensor_set_power(camif, 0);
 
 	pm_runtime_put(camif->dev);
-	ret = v4l2_fh_release(file);
 
 	mutex_unlock(&camif->lock);
 	return ret;
-- 
2.53.0

