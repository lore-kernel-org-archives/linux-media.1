Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4AF430B90;
	Sun,  1 Mar 2026 01:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328729; cv=none; b=MSZtIBAGyEyIbmnZmTecZgsrJAaQ7ZbewGGbXv/oaZxsGNjXB9ctzu66g9Nunh+ccalU62nXwQ2hUuzEZcKbacjbqHQ5P5TJegQEfuAAVIGqOCf4jVx6eUyQMT0oZE5M8R+sCSexkOfpUwXJYSaLrbWZegC9qfkL0qFEpT8pSPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328729; c=relaxed/simple;
	bh=9T+ixMto1AhqdHzTOubck9Ko53Z1hKbjL4ZQFsRylbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G/WvltJYdlodpf4+bSYHfn70XtvgrrQ/LeS8LPDRoGK9Hglg6m1/5rmIeooOl38Vga+K5VYXCY5ySbVv8zAVDu2cGTFxV9jtdfjAfvJw89HXWDVsbfqJ8EAP+g8Jb9EKLWdeYFMrT4anjipScy2bwHecHbfvxLcyjPt5SS5d3ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEQiIsKU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEQiIsKU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7334CC19421;
	Sun,  1 Mar 2026 01:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328729;
	bh=9T+ixMto1AhqdHzTOubck9Ko53Z1hKbjL4ZQFsRylbo=;
	h=From:To:Cc:Subject:Date:From;
	b=GEQiIsKUBBn58RbChumIeUP9iRvUtO81iC0npk3dWlKDOOg8obyco2+NxuZoQlSt9
	 mNk+n2DGqm9pg/l7oFaQuJTX1wF5MgntPR2smF1c9jl5nci+t54J95AUzSJqZI+3+0
	 C2xJbrM/r2ZRngq+MAD7sLWtga9q0EvrRKBUpiZW6eEhZNn1mokQiyPFwBguIWj5hN
	 IwokJfopkgDynAjZ9IhX+JaBzv1LGou8IetyFVweVAxwSHF5CHT9R8CKb5OzRLFilQ
	 L0pX/BTWQ/AXqqAFzqtWyfmVr8CnoVb1Px8kvrDDmJidUgtgQIIqSsUzGVHo42vQz1
	 EusTcph/x0tlQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	jai.luthra@ideasonboard.com
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov5647: Initialize subdev before controls" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:32:07 -0500
Message-ID: <20260301013207.1690919-1-sashal@kernel.org>
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

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From eee13cbccacb6d0a3120c126b8544030905b069d Mon Sep 17 00:00:00 2001
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:25 +0530
Subject: [PATCH] media: i2c: ov5647: Initialize subdev before controls

In ov5647_init_controls() we call v4l2_get_subdevdata, but it is
initialized by v4l2_i2c_subdev_init() in the probe, which currently
happens after init_controls(). This can result in a segfault if the
error condition is hit, and we try to access i2c_client, so fix the
order.

Fixes: 4974c2f19fd8 ("media: ov5647: Support gain, exposure and AWB controls")
Cc: stable@vger.kernel.org
Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov5647.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index e193fef4fcedf..f9fac858dc7ba 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1420,15 +1420,15 @@ static int ov5647_probe(struct i2c_client *client)
 
 	sensor->mode = OV5647_DEFAULT_MODE;
 
-	ret = ov5647_init_controls(sensor);
-	if (ret)
-		goto mutex_destroy;
-
 	sd = &sensor->sd;
 	v4l2_i2c_subdev_init(sd, client, &ov5647_subdev_ops);
 	sd->internal_ops = &ov5647_subdev_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 
+	ret = ov5647_init_controls(sensor);
+	if (ret)
+		goto mutex_destroy;
+
 	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
 	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	ret = media_entity_pads_init(&sd->entity, 1, &sensor->pad);
-- 
2.51.0




