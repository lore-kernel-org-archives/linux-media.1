Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A60299A84;
	Sun,  1 Mar 2026 01:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329280; cv=none; b=Obc7BH8n95GA5kEuBPwDl/TGOVWkkFQT9ifHGBzEI3gz/cv5MJWY9LP6DwkQmRCHWsxx1I3djE6W3pApQ6NYZQRdWKgwuZeQi036GoN5cX1kfvJ3nMpCSU20ubZATLc32sjnGKGiVTpw/Oc4ZPbnrtEKau53bQgmT6EnVdeMnSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329280; c=relaxed/simple;
	bh=SMLhtIWd4URp8zyMq54mqZ5X16vnlDQx1rKCH+t7SM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OcM97o4DTF6RoQ98ukLnqRE0rBisvO65oC33eCvmX7Rp1IakNNp1AE4BFNLfOqAazwPK/4VOVorJfS7c79kp8y6jr3U1rgwujciMt72XTqyP92bkfcLU41042zXLCxhDGU5jktfNHxAx1WxGlS6/Apz7jKej0B9uvg2Bh7V7Mvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJHLST9t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJHLST9t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE37DC19421;
	Sun,  1 Mar 2026 01:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329280;
	bh=SMLhtIWd4URp8zyMq54mqZ5X16vnlDQx1rKCH+t7SM0=;
	h=From:To:Cc:Subject:Date:From;
	b=BJHLST9tCEiTLCmS0Yk532qGyMURY7790zcImZ4q4p/7v5cUZhnbz+OgNp3SKAp2d
	 bXKo9mkS6uxjQ1bzdiY9VxhbpoIkaVo3Hzm+4ruqhr2fcAFVzjbmSciE8e6AgkUXo3
	 edb04CbOLih8zBvc6q9ytpZvP4LnEBbqDd0FMLyMZhH4NqCDt194of1A7roET31xH/
	 AOR9MjY0zcM/83mFdjPDdYdyklWwu8XChzV7u/2cWMRZWXTFJa2BYnL3SaNoQLwfxC
	 UiUenyo9M/iyFwo91+iA+qrUA6qWkKHjePqn0ORzpTKS3lWswKa1ln7Cv/chR3Aw85
	 ElHlCZmYfnq8g==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	nihaal@cse.iitm.ac.in
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c/tw9903: Fix potential memory leak in tw9903_probe()" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:41:18 -0500
Message-ID: <20260301014118.1702882-1-sashal@kernel.org>
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

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 9cea16fea47e5553f51d10957677ff735b1eff03 Mon Sep 17 00:00:00 2001
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Date: Tue, 23 Dec 2025 11:18:13 +0530
Subject: [PATCH] media: i2c/tw9903: Fix potential memory leak in
 tw9903_probe()

In one of the error paths in tw9903_probe(), the memory allocated in
v4l2_ctrl_handler_init() and v4l2_ctrl_new_std() is not freed. Fix that
by calling v4l2_ctrl_handler_free() on the handler in that error path.

Cc: stable@vger.kernel.org
Fixes: 0890ec19c65d ("[media] tw9903: add new tw9903 video decoder")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/tw9903.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/tw9903.c b/drivers/media/i2c/tw9903.c
index b996a05e56f28..c3eafd5d5dc82 100644
--- a/drivers/media/i2c/tw9903.c
+++ b/drivers/media/i2c/tw9903.c
@@ -228,6 +228,7 @@ static int tw9903_probe(struct i2c_client *client)
 
 	if (write_regs(sd, initial_registers) < 0) {
 		v4l2_err(client, "error initializing TW9903\n");
+		v4l2_ctrl_handler_free(hdl);
 		return -EINVAL;
 	}
 
-- 
2.51.0




