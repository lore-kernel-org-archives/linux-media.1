Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374BD25F98A;
	Sun,  1 Mar 2026 01:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327983; cv=none; b=sbx/KEsNepdHGKPx4PPEKR4+PkbcK/hKcjmZ2y9UXTK9IniQnx4VOlY/s41uBwuO6SqCbT/HhkySPTZwM8aKln/mdra+EGvzue15cIszjc7W0zhML3oQ81SSIXrJ86foPfvABlFotvhSKcbSPLfqIOjE8NZN6dVsBwgXUIgcwjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327983; c=relaxed/simple;
	bh=uw9RgIhh+6BpeHM1xiuV08tSbCTpRmPdq2PidWCzaOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VnpJsW1hAls0/ld6hrO3WhBjEpVI+iHn2UFfbHcZ4i2EuI7rbhLXiVTRnXWJkEBcdRQFjeZtyDJHr/b8gtedkdP2LzN1lGU4hKoxzcACpwMrtUG6BWCXDFVcPhdp27HVYp9LFJtCthyhJwbCBqBntT+a1HIHaDC3lQe30ip104w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5CWQUw8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5CWQUw8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A342C19421;
	Sun,  1 Mar 2026 01:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327983;
	bh=uw9RgIhh+6BpeHM1xiuV08tSbCTpRmPdq2PidWCzaOU=;
	h=From:To:Cc:Subject:Date:From;
	b=H5CWQUw8by/ybMyb0/JCjhjL7T9RS87xM/ZjHHaOr5Qq64Z7uboE4qbApBR/M2dd7
	 Mm0uNrr7bQY7qDU/NfgaxLNbgBpC5o/cV2wmUBo9r1CFqUSCQAfhRvYcP3G579iYRw
	 Dsfk5oSAb+tEitPCmLqEKfZxHzrqQE3HIYUrJpFeoGjrXTusjvmAF9prwkf24F1eSS
	 S2XYNLYvNmTiSefELgsUdg+KToB94BkPADAtOAjp9emd9kMNB0A4+QCKrjnyh0CAjT
	 GEuJeUSRJJWrTPKWab/JFhX0u1ivE/sbCaIolZRE2vIjLbNaNa7tlVcxckB+Rd3z4x
	 TNT0krapltALg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	alperyasinak1@gmail.com
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "media: rockchip: rga: Fix possible ERR_PTR dereference in rga_buf_init()" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:19:40 -0500
Message-ID: <20260301011941.1674849-1-sashal@kernel.org>
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

From 81f8e0e6a2e115df9274d0289779f8fca694479c Mon Sep 17 00:00:00 2001
From: Alper Ak <alperyasinak1@gmail.com>
Date: Sat, 27 Dec 2025 11:40:37 +0300
Subject: [PATCH] media: rockchip: rga: Fix possible ERR_PTR dereference in
 rga_buf_init()

rga_get_frame() can return ERR_PTR(-EINVAL) when buffer type is
unsupported or invalid. rga_buf_init() does not check the return value
and unconditionally dereferences the pointer when accessing f->size.

Add proper ERR_PTR checking and return the error to prevent
dereferencing an invalid pointer.

Fixes: 6040702ade23 ("media: rockchip: rga: allocate DMA descriptors per buffer")
Cc: stable@vger.kernel.org
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 730bdf98565a5..bb575873f2b24 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -80,6 +80,9 @@ static int rga_buf_init(struct vb2_buffer *vb)
 	struct rga_frame *f = rga_get_frame(ctx, vb->vb2_queue->type);
 	size_t n_desc = 0;
 
+	if (IS_ERR(f))
+		return PTR_ERR(f);
+
 	n_desc = DIV_ROUND_UP(f->size, PAGE_SIZE);
 
 	rbuf->n_desc = n_desc;
-- 
2.51.0




