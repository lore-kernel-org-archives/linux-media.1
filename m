Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BEE2BEFE8;
	Sun,  1 Mar 2026 01:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328721; cv=none; b=li826ucLwujYDvrqUGfDiLEifSVmsOcBoffkiAOaEM+nO500PiU+Yyn4A3Z8GYbkwAe3zLh1UyinR87K3FjousQaEA2k6kWlhRoLMBFZEQr04bV7VmR73oAogFfNlWdsKlJ7K7EC3FaIDJwMeN0Sl8OLzh8NUjj2i1WJYfG9SMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328721; c=relaxed/simple;
	bh=nehayVbJKHaO+Waau35SV5JBhGrIrAchlG+18Q+wmtw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gMYtHDy7b1IG24QNDUnBKnYb50IQvHdZF8RNs5kP/X9w5512Mvl7OuznbqLE+Xe/cwxKed0IlilNRj/rIlXjcKodQycGBzp83SiUJlz11IELL2YDVK1S02N8WSXwL7cmY68vRq0DDhyAW3oVwpIlx0n44zGc6LCcMUsL4+5CZTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+coTFkF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+coTFkF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9EAC19421;
	Sun,  1 Mar 2026 01:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328721;
	bh=nehayVbJKHaO+Waau35SV5JBhGrIrAchlG+18Q+wmtw=;
	h=From:To:Cc:Subject:Date:From;
	b=L+coTFkFKaSC1onMo4kxa6sGAtp3Y4CF9fllKxV3Z1YH7Rab/ZB6Xovk5d+8IyVnp
	 6P5n7YK1tYyBALbjXVf+eeKimct9Ah785OKxeIi3fgq5CSZP1giEU2YOHWiQMXM0rt
	 DB1OWU8QVMljubdBN6mzKJC+GvKs2vIGV2YcjdrIfOA/gfNi/PiUs0OGQuqoKq49cN
	 PbObPijCwg5wgvu++CS4xZKjxMfgs0Ll8EWGos7P1tGifVVjWyKip7I4isDpqBW/tT
	 CMYmuFAhCFKaba/f5W8AzYBxR8Uu+97w0jJJ9TsFwyXgvxd2R3hlRLZY5UYS4HZX7z
	 QC80/68EIrBhA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	nihaal@cse.iitm.ac.in
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c/tw9906: Fix potential memory leak in tw9906_probe()" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:31:59 -0500
Message-ID: <20260301013200.1690750-1-sashal@kernel.org>
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




