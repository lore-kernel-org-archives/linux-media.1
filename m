Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680C02C11DE;
	Sun,  1 Mar 2026 01:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328741; cv=none; b=itW+8PhN9gn9BBmDhRDWGnl457hUmegxmDuB4pEoebVISxOsE+bjzt64ZjJoAoYkjqk373cj2c7eQrK2bx94sMV13W1yeG+/fnqjQ9vKqxPDu9g6/rlu7u36+DEd19lrPEYagD+KE8gN1jYt6OLwPfnuXAfaL7D2vLw4sFDJy6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328741; c=relaxed/simple;
	bh=kjMGvqUQrIUbJSq7lzvz70BFlH55tRoN2VWDQQi5TgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SCq9wSG45mhirDO3ELKC17s4eQjfgKf+Z5RnGvoGP06+1mfph8yDlJpX7G/qmRmmMj7XZlrx8agm0o3I5BwnFHzVNxjvBXtm7KsBuVJS6mUgNMoL+3Lk+rdObmbrLageua8ZadHxjVSxhSTLsTJaMfDt3HvcW1vUv6FBqFfqlRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQnuqc2h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQnuqc2h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EF3C19421;
	Sun,  1 Mar 2026 01:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328741;
	bh=kjMGvqUQrIUbJSq7lzvz70BFlH55tRoN2VWDQQi5TgQ=;
	h=From:To:Cc:Subject:Date:From;
	b=OQnuqc2hZagbHQLNv+E5uwM+MTmkDyUOxhGpvIWuG/HfM2GA1yb59LAauypOinA2z
	 /5FZNpxP7b9y8lWkPI+7y1eJl/UoZW1YsZTFCZnHLs3iDOuXEiU3cY34u6m/B0mfJ4
	 FLwNS6y1lnlQ3o7mYloDFB8S9HX33o/bDoxQJ043RTlig6qO7JVz1ikYJXOH9Xw34l
	 0ME/1atfzUtnzi8aE52f3WghAMarfVgG52VG/pU50KZbcnm4rMLi9xxnQgyqXmw/OF
	 ki8pf/FfvqFK12rUKyaut/p8zE4WE23u/hVo+rHOHiNpz+mHI+A+02NO3XK5uvm0i9
	 auFWBbcHh0qWA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	xiaolei.wang@windriver.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov5647: use our own mutex for the ctrl lock" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:32:19 -0500
Message-ID: <20260301013219.1691233-1-sashal@kernel.org>
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

From 973e42fd5d2b397bff34f0c249014902dbf65912 Mon Sep 17 00:00:00 2001
From: Xiaolei Wang <xiaolei.wang@windriver.com>
Date: Fri, 5 Dec 2025 15:19:18 +0800
Subject: [PATCH] media: i2c: ov5647: use our own mutex for the ctrl lock

__v4l2_ctrl_handler_setup() and __v4l2_ctrl_modify_range() contains an
assertion to verify that the v4l2_ctrl_handler::lock is held, as it should
only be called when the lock has already been acquired. Therefore use our
own mutex for the ctrl lock, otherwise a warning will be reported.

Fixes: 4974c2f19fd8 ("media: ov5647: Support gain, exposure and AWB controls")
Cc: stable@vger.kernel.org
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
[Sakari Ailus: Fix a minor conflict.]
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov5647.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 1041732104fa7..6285e234962e0 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1248,6 +1248,8 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 
 	v4l2_ctrl_handler_init(&sensor->ctrls, 14);
 
+	sensor->ctrls.lock = &sensor->lock;
+
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
 
-- 
2.51.0




