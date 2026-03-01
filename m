Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A695213B7AE;
	Sun,  1 Mar 2026 01:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328028; cv=none; b=fwQRrKC9g4D9Pczt4va1qcuzQhuIMiWqBKfG+Jec2B1DvNUnw+ydzK6Rn4vhmiISGBhq4IE1nknMBeNqkP3VOLYXcPLvUemkL2WxOWBCCbghNUpAYWCslYyS5lUP2/gYMtyI6RIp6CW9nQBU3awGtJzIMq8HTtS9CO5MxrsQkQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328028; c=relaxed/simple;
	bh=UGu23dHQJwfPQzXP+ok/dxfy59Hff0n/1+nS5ct5AD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=docCdmdwsl7k92+8upRHckOnQqXeK3x3tg0JWQTHxbvWWau+4S3Euh8I174nI3c/GnyOS/K3UXo3S5mo+tuuAKNBoFR8rvUnKhh2cTkSywYieuTfJGyU2ti3IaZYgYpGnhNkcPRqJnpHwdHhF4Id9yezsC7CRGSc8szWRP1CbC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pRO4zMUg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pRO4zMUg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C436C19421;
	Sun,  1 Mar 2026 01:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328028;
	bh=UGu23dHQJwfPQzXP+ok/dxfy59Hff0n/1+nS5ct5AD4=;
	h=From:To:Cc:Subject:Date:From;
	b=pRO4zMUgGM25dl0yxOFmh8WB+v3istFdtVyzV3rgMilMsmuLRLy/gdRaZ2/fJt2Dk
	 dqx+PtjQ+0/JDPmkyFuGbj8rDpUtVnMLw4aAtH9VmpCAK+h2zM9Jl3gxec7RSw3GM/
	 ymV0e5W4my9dRyvj0vCzk4sir5MDW//rGOOgtpGC3n18W6g7FrwInvaBj/2kwx00wE
	 XFRoSE1In18xJPe6gSZO95SinRClsAkOabU4iSL973bYoGdjopCJ8g8JgF31Cx1kdN
	 tHE0InWRfG+3myCzgs6dSHUkGaxBg/iClGtltzjWVmfAQLnDq0e9Q3omwMpx2VP4nk
	 qTRwUcRJnnqXw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	nihaal@cse.iitm.ac.in
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c/tw9906: Fix potential memory leak in tw9906_probe()" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:26 -0500
Message-ID: <20260301012026.1675995-1-sashal@kernel.org>
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

From cad237b6c875fbee5d353a2b289e98d240d17ec8 Mon Sep 17 00:00:00 2001
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Date: Tue, 23 Dec 2025 11:19:01 +0530
Subject: [PATCH] media: i2c/tw9906: Fix potential memory leak in
 tw9906_probe()

In one of the error paths in tw9906_probe(), the memory allocated in
v4l2_ctrl_handler_init() and v4l2_ctrl_new_std() is not freed. Fix that
by calling v4l2_ctrl_handler_free() on the handler in that error path.

Cc: stable@vger.kernel.org
Fixes: a000e9a02b58 ("[media] tw9906: add Techwell tw9906 video decoder")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/tw9906.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/tw9906.c b/drivers/media/i2c/tw9906.c
index 6220f4fddbabc..0ab43fe42d7f4 100644
--- a/drivers/media/i2c/tw9906.c
+++ b/drivers/media/i2c/tw9906.c
@@ -196,6 +196,7 @@ static int tw9906_probe(struct i2c_client *client)
 
 	if (write_regs(sd, initial_registers) < 0) {
 		v4l2_err(client, "error initializing TW9906\n");
+		v4l2_ctrl_handler_free(hdl);
 		return -EINVAL;
 	}
 
-- 
2.51.0




