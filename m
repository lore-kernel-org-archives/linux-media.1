Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E522ED843
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 13:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296040; cv=none; b=MSMeaq0Laz4oxaJT/RJC76mbK47UAt1zJmktf75QUALD44hNcumuAM2dlTJ/p263ZAUEIIePVdBHz3TC3lTra4jQQvzeQDq/4/q3dInwK9414MBwcLnlI8hQTUbppjOdRDHMylox7ENxkYEmU1F+69X6GLvfTwowgHQIBg/aNp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296040; c=relaxed/simple;
	bh=5svG1FtIOcXXnh8mOp7kwmQcuSPShpYWvhm/U9k53r8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E8zqPejs8C+dA2afkpFsqSPck0DJd9YlCnd2YV2eKUn0f/kiDppGIRJi27MuBOfGen1sJG9EkMf8FfDBiCJZJuZQGO677S6OsO+sRj5nWdTXCUGs+WJwbpmdLhi3CKdlVHL6w9Go16jp8gVvXA8TrJYABbpM9H4c2rq+mAOurh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzRMuii3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzRMuii3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B741F000E9;
	Fri, 17 Jul 2026 13:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784296039;
	bh=v2/b1/zsennyv2QoiibGrubuQP/xLmw5GwZ9cDiEk5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lzRMuii3YgW0abR51qLbli7crBRECfufGiOzmWkTCOYYRihjT4gMC9pqPctBWGX4E
	 61AN4MBm6UHzwnQ00kO96JRwPN0sSwK6+4nVffAjQ0rYOBUYc/HEW1V4bWVrb9IOPw
	 +GdSem0rdzdt/wtJh1AIJ9+UqCZu8AKTtbf2gv0sxh/5xoyNaCQDspAWDmYtTqGOtY
	 6upcBNqzLUPeFTVQb5as3Hkoc9J2WDfHT5w2IiBnopvl6hP8RMPUZ5DYXusYu5EkmO
	 sdjFZppQMhuKKfJn+niebCY7DYJdnCDyY/GFi33BSW3+FF+lPlsm5wzpUoEhuPqCE3
	 GiK3PSd/JZNaw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ma Ke <make24@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 2/2] media: v4l2-core: v4l2-dev: add comments on device_register fail.
Date: Fri, 17 Jul 2026 15:42:46 +0200
Message-ID: <3e2ba7afe6b7f2bbfd0c197debeaf50d1aa49f94.1784295766.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784295766.git.hverkuil+cisco@kernel.org>
References: <cover.1784295766.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If device_register fails, then we are supposed to call put_device.
Explain why we do not do that.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/v4l2-core/v4l2-dev.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index d750bf10febe..fd267fb74905 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1075,6 +1075,20 @@ int __video_register_device(struct video_device *vdev,
 	mutex_lock(&videodev_lock);
 	ret = device_register(&vdev->dev);
 	if (ret < 0) {
+		/*
+		 * We should do a put_device() here, but the problem is that
+		 * the V4L2 API expects drivers to call video_device_release()
+		 * on error, and so both put_device() and video_device_release
+		 * would kfree vdev.
+		 *
+		 * The proper solution would be to split this function into
+		 * two parts: initialization and registration, and then rework
+		 * all drivers.
+		 *
+		 * Until then just skip the put_device and free everything.
+		 * This will result in a small memory leak, which is better
+		 * than a double-free.
+		 */
 		mutex_unlock(&videodev_lock);
 		pr_err("%s: device_register failed\n", __func__);
 		goto cleanup;
-- 
2.53.0

