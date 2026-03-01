Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB2E2773CC;
	Sun,  1 Mar 2026 01:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328666; cv=none; b=JcZhGjMT528QK0+I3kNhUXnauH1atZEQXKqAPsx7xvFyHEm3GRo0xRC9KOMzc9THgaamxXVgHEY3ppgUafCTSHO6EK+1ahSccZckGtpVlJLLHrSUyNw5//QkSmpE68hTCC5HjP3BRydMwxevATFrcHPeIftDBc8lJ3AmfsIZ8Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328666; c=relaxed/simple;
	bh=h2ill5+uxEeNEWUBCmyv1vIpyevnt2AvWrn381YkCOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NMwLaX4euQ3mkS0kHDzVjQd/eWd2ZmlqbDSSzFNVeJs/A2PNMjLcLIy2KXXZ2kSBaf3Wj7PsiGoCV62M8vm0Y9xsYftw1aJjyBOGSibG58uPGEvA14FJ02XMu31DL/7XOkfvzGyaiZGR7tkj6Ehq8GMUneiL8AhNhCQCLfIzS4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmWlr0xq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmWlr0xq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F372C19421;
	Sun,  1 Mar 2026 01:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328666;
	bh=h2ill5+uxEeNEWUBCmyv1vIpyevnt2AvWrn381YkCOQ=;
	h=From:To:Cc:Subject:Date:From;
	b=cmWlr0xqJa2zZaM2d+KrOvikxKVvwvhn75/4k1OH1NkHU3+2AYFYEWUR1dDkNJRuu
	 tB8bDxAZG2ay0HCAiOtlFnaDAebYWsehceVD8ynN6nI0fsv1bNQjtPrJJXg4NeQBJj
	 GpbYP6rBKEN1Rr0+borouxuKP8pTRJPBQWjiG8jj3UFt3qdLuotKkJCbozN0NCKTfB
	 0y9fIyXGzGAdmz5KCaDEvkKwMSxMZNsbMFqogrbiM0Jb1MQmfP2BBll0yqZfWGHnFn
	 b7dk6oYMnMSK51/TOU5rHBwNXe5d3gohO+c0r+/I4ZP353oVm8dvd3kIzfCObhdLWh
	 HgJNx+inQDH+g==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	haoxiang_li2024@163.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: FAILED: Patch "media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:31:03 -0500
Message-ID: <20260301013104.1689436-1-sashal@kernel.org>
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

From f128bab57b8018e526b7eda854ca20069863af47 Mon Sep 17 00:00:00 2001
From: Haoxiang Li <haoxiang_li2024@163.com>
Date: Wed, 8 Oct 2025 17:01:56 +0800
Subject: [PATCH] media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()

In mtk_mdp_probe(), vpu_get_plat_device() increases the reference
count of the returned platform device. Add platform_device_put()
to prevent reference leak.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index f78fa30f18648..8432833814f31 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -254,6 +254,7 @@ static void mtk_mdp_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
+	platform_device_put(mdp->vpu_dev);
 	mtk_mdp_unregister_m2m_device(mdp);
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
-- 
2.51.0




