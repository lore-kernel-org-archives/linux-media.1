Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A250D26E710;
	Sun,  1 Mar 2026 01:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328040; cv=none; b=XjUq0T+meBS0Qle/CSEiv/Sxgi0RB0cChudtKQDtXe/kdSbEU+0IVfegmsTPYCKxNwONNHpkHxhusQhEtjIxGB8oTulSFFobQbrL1LNlaeBnXY2FZI1MbhcmRuun8iGftjbVhNk2+/GVsVVNSeskOljYC+BNnuy7BKHQUQ4FRb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328040; c=relaxed/simple;
	bh=vi5iELY0rm9w2QcZJXn0YzLwhIlWT3rsAOcotXWEn1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MQZM00VQ3uX4W6MlF/ek5wMf6q01QOKhE+57j5OROdSJT999DFYrVNO6tVjh2n6Az5NYijUuZNsdHbeHIUS466j43swKS87lDI9crQ0FNr9XMrX5WO49luDzBrs+xunhqFp0zsEK1keqQFKRVVazceQpBvFf0dY0tnacp5pEcIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvEjs023; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvEjs023"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12156C19421;
	Sun,  1 Mar 2026 01:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328040;
	bh=vi5iELY0rm9w2QcZJXn0YzLwhIlWT3rsAOcotXWEn1k=;
	h=From:To:Cc:Subject:Date:From;
	b=mvEjs023h65QSqxirtCuNSj/UqjRV5PHcUEAJ5jkgl8qD+8+91F9H1CSQrwcQ+Vxw
	 PSfx56alN9tUCj41e7H+7vMQs3qjTNrkWAyo8fQm5JJPplb31ZFmzQOqsMGBmz4y3L
	 orsddqmFLbN7rr+yUyT02VXUgtERRCQIARZwDhNHov87COjIOTfCfvtCAf5B2ID/qD
	 HE5dL5aMM11RDbMbDqls3PimvgJzZj+dEaShWWyX/ZF0u/BqPLjHFs420pUWxsQ0wH
	 bpOlLnYzoM2l4Ipb54omwEPJHGu0yed0hX49QR183kjB32ffP0HNIY2IqbSjgCJI+L
	 a3mHG2vcCmPpA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: ccs: Fix setting initial sub-device state" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:38 -0500
Message-ID: <20260301012038.1676246-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 31e5191aa11931b53e1242acef4f4375f00ca523 Mon Sep 17 00:00:00 2001
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Tue, 30 Dec 2025 19:22:02 +0200
Subject: [PATCH] media: ccs: Fix setting initial sub-device state

Fix setting sub-device state for non-source sub-devices.

Fixes: 5755be5f15d9 ("media: v4l2-subdev: Rename .init_cfg() operation to .init_state()")
Cc: stable@vger.kernel.org # for v6.8 and later
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ccs/ccs-core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index c7b46d0fba49f..3fd9ceaead215 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2940,6 +2940,8 @@ static void ccs_cleanup(struct ccs_sensor *sensor)
 	ccs_free_controls(sensor);
 }
 
+static const struct v4l2_subdev_internal_ops ccs_internal_ops;
+
 static int ccs_init_subdev(struct ccs_sensor *sensor,
 			   struct ccs_subdev *ssd, const char *name,
 			   unsigned short num_pads, u32 function,
@@ -2952,8 +2954,10 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
 	if (!ssd)
 		return 0;
 
-	if (ssd != sensor->src)
+	if (ssd != sensor->src) {
 		v4l2_subdev_init(&ssd->sd, &ccs_ops);
+		ssd->sd.internal_ops = &ccs_internal_ops;
+	}
 
 	ssd->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	ssd->sd.entity.function = function;
@@ -3062,6 +3066,10 @@ static const struct media_entity_operations ccs_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
+static const struct v4l2_subdev_internal_ops ccs_internal_ops = {
+	.init_state = ccs_init_state,
+};
+
 static const struct v4l2_subdev_internal_ops ccs_internal_src_ops = {
 	.init_state = ccs_init_state,
 	.registered = ccs_registered,
-- 
2.51.0




