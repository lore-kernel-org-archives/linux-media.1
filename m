Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06934175A74;
	Sun,  1 Mar 2026 01:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328012; cv=none; b=MCELCqcveOpQShNKeNAcvI4w5HkOhhRWJLEwo7sZ42hDklSI3CecDOIGQvMH7vxO9SF5vMNSFn5WnVKWS8JLXHVs9fLrkCySyE5tSA3JrProZnHkluXRuK0YHbq8aCwXgB5nH55W3buzaURIldEMePptpcWfjGhTkzHTwgIZ02w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328012; c=relaxed/simple;
	bh=P4DhFGzWwD/9Vzf48xZdqZ74oHi4RWamXd4UTLmn4zo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aDY1rHfRVxPk8LM0AhmAvIAiiN5f5yWjsEBq1KeJAz0EuXYDnbnJKskEFlFFIq7QoeTg3bEkiY/7AjLHItC4ET+A2cDm7FVkbCBfJ6qOmDV4/t3+1q3m3+5qO9NNMVc6xSf5efHF4Q46PcwCft8Phzp60/1v2ChHyf1y5QBn/zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f4VDGP+J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f4VDGP+J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BBBC19421;
	Sun,  1 Mar 2026 01:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328011;
	bh=P4DhFGzWwD/9Vzf48xZdqZ74oHi4RWamXd4UTLmn4zo=;
	h=From:To:Cc:Subject:Date:From;
	b=f4VDGP+JIZ4ZILTy0EoblJotTiIE4UeMOCV8k3v0rdq6KDzdObkcvFSO4LcGBxLzx
	 i0s5lAKT9MFsJKo3K3RiW7gRgq6nC4ZieDEJK8UMRUBw4P+9KBwwZ1LG5+qQQ+FH6U
	 VocCje+2Q+B9j3nnrN/+/cyhxA9qxisdcXfVCGNo8+J4zSV6VaqXujRIj28A1XsglT
	 L1705QpVzr7SYc38MTXxeh5ttVmaO58K5poPbaO3WlRlQYWo39acl0qtNo4CLhZrDd
	 u2U9jIwVWZRvq/aGDN4mDlnyb6boDZlBO/MEcUxQvKr0L2LZzrVZVhXPpphSDRhNci
	 +SZuFfDgWJjoA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	hansg@kernel.org
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov01a10: Add missing v4l2_subdev_cleanup() calls" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:09 -0500
Message-ID: <20260301012010.1675646-1-sashal@kernel.org>
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

From 0dfec6e30c334364145d0acb38bb8c216b9a7a78 Mon Sep 17 00:00:00 2001
From: Hans de Goede <hansg@kernel.org>
Date: Tue, 14 Oct 2025 19:40:12 +0200
Subject: [PATCH] media: i2c: ov01a10: Add missing v4l2_subdev_cleanup() calls

Add missing v4l2_subdev_cleanup() calls to cleanup after
v4l2_subdev_init_finalize().

Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 834ca46acb75f..1e22df12989ae 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -864,6 +864,7 @@ static void ov01a10_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
@@ -934,6 +935,7 @@ static int ov01a10_probe(struct i2c_client *client)
 err_pm_disable:
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(&client->dev);
+	v4l2_subdev_cleanup(&ov01a10->sd);
 
 err_media_entity_cleanup:
 	media_entity_cleanup(&ov01a10->sd.entity);
-- 
2.51.0




