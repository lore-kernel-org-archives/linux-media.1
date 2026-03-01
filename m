Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B8A296BD3;
	Sun,  1 Mar 2026 01:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328701; cv=none; b=u4RSh+eo2FIMjBCWTNpiyjS3cM1U4O3GPe3Op/VAmtwfZ2jhw9+RjlmRciXM5o3TPDEM91ZHSQjfD9IDkWvtklgTNYtxwjIj+/5anD4grVZSyftmzO8LDfcp6HoqrHgTI8UwGdHXvHvCVO7nLy1zhCTJBYAdfc6hEZTIzH9mfRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328701; c=relaxed/simple;
	bh=BTGwyeEr1DgEIMibQ7hujRHK2cVbWZkuPIDIOZxZ8Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MhSUk+DU5ZAzP+q3D/opDoPOuqgaOAIHlF5QEgvOD58UY0d5rSSeBMpM/0SfVJJHuRjWZXHGdkzPdrIwgpmHOGWqfxYEuP3LuV3L/OV7pZjv0UME2g1JenqSOKRyGqN9LZO6wFQ6f//fCmSN3C+ktae6vYIuW/GRyVVBFJsvhUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qHA4zvF3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qHA4zvF3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C489C19421;
	Sun,  1 Mar 2026 01:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328701;
	bh=BTGwyeEr1DgEIMibQ7hujRHK2cVbWZkuPIDIOZxZ8Bw=;
	h=From:To:Cc:Subject:Date:From;
	b=qHA4zvF3Rwqfoxo1mJaF9OHM01wMVxRX5a+Uc6WpsanFUGvC57CPMsADNRI2jjzBl
	 g1o9Md2r73t6KKDt5GIXzQrIDFUSwNi+XBUL41sCSUn/XabyOJdbNa+e8OA5kZn1rt
	 gLz7pkRzsiQaCahHLoyR0vxjIKKpn6rQOQNG2qFYZGit7QGGIUHGI+RcUgzprz7HcF
	 TAC1EnWmPx7TPGcztzth2PShO/S0oIRC6rM40K78nvvEJ1rNc62iFSp75Vnbhw339E
	 J7M1V8kFTaKs/JiILrZYNDoFz4pdFATXZTFbZ75sWmzMj6V6ndBxeocTjYzD1fizba
	 G5rHnxgJf0aew==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	hansg@kernel.org
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov01a10: Add missing v4l2_subdev_cleanup() calls" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:31:38 -0500
Message-ID: <20260301013139.1690289-1-sashal@kernel.org>
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




