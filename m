Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA301EF091;
	Sun,  1 Mar 2026 01:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328159; cv=none; b=kr20VJ7xcv5zStDr+ElKQhBKN7EmqlsiFl9aaAwoelMKnoF+xSYK2PmI6QeF0c33ndOOKYA2M3bBkDHD8KNr/yMb+yt6Vw5NNHYeDuFvVM5zKpf0oyNJANhTLG9znuE0OKa0FK4U64jEw0MTh5zmeTbHFojnuiUL/ppRE1IRfeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328159; c=relaxed/simple;
	bh=kLWXaNgVZ2kxxuEVRjfTLq1xSWeKJAWj9SQubazwqSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f6JyUFoZbOw+8XYJv+iGXAjtDsx9jnJE+RJsd9gTnbXa9Mkr0VUYyp/u/Q17ehLHl40ZT0K/PHyxFanzx/jzmdMT19nE4+T6cbciopisiyAqzbMXJbTJchwKmXqUTgI9Gm6VczQjzIOvCNdUBFsypfEbCP0JZfWY0pTfpmCbIOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PrgY9zbe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PrgY9zbe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC3CC2BC86;
	Sun,  1 Mar 2026 01:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328158;
	bh=kLWXaNgVZ2kxxuEVRjfTLq1xSWeKJAWj9SQubazwqSk=;
	h=From:To:Cc:Subject:Date:From;
	b=PrgY9zbexjlkgc6Q7ik/43Qr5B38km8/ZQNXfhEu8EsuYkVAY4NjJRz2P72zGE6zN
	 O8RsEu1yT8GmcXvNbYpYl3/SvGCUd87hWknzqmzkdhr7U4XBffY5iYbYQuICnJ/d5V
	 IZE319eVoiVPgNj3MrMPFwwYk3B/ibMi9h9Nbqobx66QwvjIRj59JhNUei6Q3wrpyc
	 pglDwhvXOfHgtPTmwX8bxh7/49LliCBkPhLfRWkXZRE/vya/R9ZWwmrY6NfiOogtI7
	 zb05uxgfQLnz1rlgM7uc70tWYMsCgJ+fQTGkUCz/IEvjxhoSPeDuyCZRy4jH4uyTKL
	 Gg8HOLlhoCDCA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	benjamin.gaignard@collabora.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "media: verisilicon: AV1: Fix tile info buffer size" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:22:36 -0500
Message-ID: <20260301012237.1679051-1-sashal@kernel.org>
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

From a505ca2db89ad92a8d8d27fa68ebafb12e04a679 Mon Sep 17 00:00:00 2001
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date: Wed, 14 Jan 2026 10:07:10 +0100
Subject: [PATCH] media: verisilicon: AV1: Fix tile info buffer size

Each tile info is composed of: row_sb, col_sb, start_pos
and end_pos (4 bytes each). So the total required memory
is AV1_MAX_TILES * 16 bytes.
Use the correct #define to allocate the buffer and avoid
writing tile info in non-allocated memory.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
Cc: stable@vger.kernel.org
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index 500e94bcb0293..e4e21ad373233 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -381,12 +381,12 @@ int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
 		return -ENOMEM;
 	av1_dec->global_model.size = GLOBAL_MODEL_SIZE;
 
-	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_MAX_TILES,
+	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_TILE_INFO_SIZE,
 						    &av1_dec->tile_info.dma,
 						    GFP_KERNEL);
 	if (!av1_dec->tile_info.cpu)
 		return -ENOMEM;
-	av1_dec->tile_info.size = AV1_MAX_TILES;
+	av1_dec->tile_info.size = AV1_TILE_INFO_SIZE;
 
 	av1_dec->film_grain.cpu = dma_alloc_coherent(vpu->dev,
 						     ALIGN(sizeof(struct rockchip_av1_film_grain), 2048),
-- 
2.51.0




