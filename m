Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBC33DFC9C
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276731; cv=none; b=q8nrwgCQeQG6pLAX/yarUg4aPZUO+hOweFiNcBTk/kuYh//ykaiHTFxU36W6q8ssi89b57Br/FRpKCrP7/4XiNurn2rozxnxt9q8UWzmW2GsCgPBB3cNjXvMoTUCVYqQzVGvRpfd7RGWB+N6t48yrYb+VJLELJfR40rlFzP+ba4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276731; c=relaxed/simple;
	bh=f/6I2R88XeSpqa0EDmUDuu9b+FroZ9k6tbgSKJqUBso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RldJUhprUvZJM2VU/FMdcZz2ZJ4cahRIr1n/lb9jGYwKwXfKROS85jzupObCrcLb+3QNvR2Pfe2RAV5NisqFdoeLB+5jzOt4pmjO5rILjlGeim/z4E4CFw1uxOPFPYhfszf+ZGSrSTTHAQmwtXrZlTKoghFKYfMYLjhekgjfceU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuwG3FbF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuwG3FbF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08791F00A3A;
	Fri, 17 Jul 2026 08:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276729;
	bh=/ob3pRmoUwb/BHfeixDWGaBNgxJ1XglqSvhLTqtypnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fuwG3FbFF2bUxLWmGao+qmFw5fqOkdHyr/85/Wc6Kh7g1shwSvXkLsR/k7ldpGYhN
	 xNdvYH7Vgy6C2BKq40xa8SpUzwo0DIAp42ECGOPLmZPskgdcRscFrfLk60t2zXCN6P
	 Z9XZdkI/BIl4xiPNEWR975uPfWYDBgas17FtbkkhMuHMh4+B96cx27kc7C6R8jQGdw
	 o8FwLPrMNFYlLS2KFBrJWhhysFLviLWzOUDnCqHu0eVM8pz1UGmkeD+bj5lUcIOe33
	 zlFNN7czcih4LzDlN12oSCnyyOfn59mbWdtFqO2/18LPROufgRHzsQ/Ch0pOFYdjP3
	 +cQMwwibG7blw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH 15/19] media: samsung: s3c-camif: drop unnecessary vb2_queue_release
Date: Fri, 17 Jul 2026 10:19:38 +0200
Message-ID: <b1d577b30ee53d7f9dcd8fd290db6e6455419f95.1784276382.git.hverkuil+cisco@kernel.org>
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

