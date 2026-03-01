Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FAE30E84A;
	Sun,  1 Mar 2026 01:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329782; cv=none; b=mOXXzn6pN7gq2TV+M5iId7+a6Gqhh0PzhvyaW0NWLl/I9IHTLZ/rHxG1gV5kwmgcRsnr0AG9FL1K2c44Wo/H0PORMlu4WkJvQsAzDKbrdD2XHWgJoFafey+HJdw/vuREbzih3+j9Bj22DVJzvOYyBxtwUdRTiXMKBeMUiEgneFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329782; c=relaxed/simple;
	bh=wpOlmPVL+OlmMLQaYH2qGV1p4vmkyo8ebJ8Ya+b3Dmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pv95kyXq2Sd6JgmtqakO2KdjNXljxbMtJkCaRj8VVi8p8V0CJvQOpyR8clVQgiaPhoXQDC+0p4kF07tCHY7JvylpOcX62TuvzwKltZLBYxTXvZaQaOFwPDzWVQxl2ihnH6Ltv2TF3afamqQGTMKmOp6kpxxtpFH514M8Er/SDU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5DMulw2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5DMulw2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A6BC19421;
	Sun,  1 Mar 2026 01:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329782;
	bh=wpOlmPVL+OlmMLQaYH2qGV1p4vmkyo8ebJ8Ya+b3Dmg=;
	h=From:To:Cc:Subject:Date:From;
	b=t5DMulw2G73yun/ECxStcKnr883ntXpJlvYnUMxtE14Mnmhbj+zljYthOKlazvyBv
	 Ki6kgLK3/3rG4eenQxqXPrgnly4tOFp6c4cHMHtJWN+KarGO6z8iw6F/cSgHOw7jOd
	 VxSs8zZqiRUSmVupsOBIOEQv0+lQ3XX5CntFmil79IEOELE97vGt+/8haN2kTs56kR
	 t4ZUVRMuWMHj3kTZdvdQQlVlRxrP1T3muff+0d3jD70Ty25gOqvOvv6fvvvPnAZgHN
	 CsrPe2tf8zbwrq+XB0W+OEGRX/DB1E5FWXLrzlFMHF591fiHWNKDTMeHbUOsy0yKj8
	 nh+COfh0y5C4Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	nihaal@cse.iitm.ac.in
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c/tw9903: Fix potential memory leak in tw9903_probe()" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:49:40 -0500
Message-ID: <20260301014940.1714387-1-sashal@kernel.org>
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

The patch below does not apply to the 5.15-stable tree.
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




