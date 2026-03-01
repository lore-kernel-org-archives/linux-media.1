Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12BC305047;
	Sun,  1 Mar 2026 01:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329738; cv=none; b=f0NPUvYiYJ1o4qWer8UyYj/uLfRaxWz4DKVe0/2iuo0Jt0PcEOYHKtcNYz7lWIE5U/CT3taOcypEfWDdXnD4TrOoWfLaqpje5mNt0opGSM2z3EdLkbDjYC7BACQYOA1vZ+yorIq3EOyidK9jWrFGr0MoyHYOeP3KVCN9U8T0FpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329738; c=relaxed/simple;
	bh=Xep0zg9LIfKh3AyTRrU51j+vlrCrqy1ijMq+DR6SPQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZJG4yIvR1TbLlA3LmmutXG2FtjZjREHl5VfqLxFCD9DkhMlU2qwSOG+HGEuKGdgVXSKTK2iYuPes9eF53pkdtoVmzBuBkC+m+lVvt9vJKDpa4VZn0SPDYPfkAcFqRGs2xjSTp3c/uM/jGj636sqlmglAvqsoFVHCQvCBTAwT2Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIm+azbq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIm+azbq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF44BC19421;
	Sun,  1 Mar 2026 01:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329738;
	bh=Xep0zg9LIfKh3AyTRrU51j+vlrCrqy1ijMq+DR6SPQQ=;
	h=From:To:Cc:Subject:Date:From;
	b=GIm+azbqOwufF6QHwG50ojYmYCiDhS1WTDGmF0TYbSOe4/4Hxt2j7Xm+srYKiSLXg
	 6xJHQOPrfTaAwS7fsjgwqudThXNuZCvoqOzMJGedLR7f9pWMSLXrFaUcczGl4EdUWU
	 pvg+P0AHUptDyVQ5GUkcfRCW+co2jTCW4PX0jJDlv23qcGFEI+l+eu6CaKV+QJRNe8
	 lOTPrYFXQQKU3wpNWE/p9APukxoDNWA8iMf+fPffbVk2NpoAezbiRLe22MasKMCq7c
	 nlW3g46axwQ0750BPQPy9IuVPvZh7GTVa/M8uUJPS/UkpGANbT1DbbRpJvWcifVzMM
	 GRaGmAvlEDXNA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	haoxiang_li2024@163.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: FAILED: Patch "media: mtk-mdp: Fix error handling in probe function" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:48:56 -0500
Message-ID: <20260301014856.1713238-1-sashal@kernel.org>
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

From 8a8a3232abac5b972058a5f2cb3e33199d2a8648 Mon Sep 17 00:00:00 2001
From: Haoxiang Li <haoxiang_li2024@163.com>
Date: Wed, 8 Oct 2025 16:55:03 +0800
Subject: [PATCH] media: mtk-mdp: Fix error handling in probe function

Add mtk_mdp_unregister_m2m_device() on the error handling path to prevent
resource leak.

Add check for the return value of vpu_get_plat_device() to prevent null
pointer dereference. And vpu_get_plat_device() increases the reference
count of the returned platform device. Add platform_device_put() to
prevent reference leak.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../media/platform/mediatek/mdp/mtk_mdp_core.c   | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index 80fdc6ff57e0e..f78fa30f18648 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -194,11 +194,17 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	}
 
 	mdp->vpu_dev = vpu_get_plat_device(pdev);
+	if (!mdp->vpu_dev) {
+		dev_err(&pdev->dev, "Failed to get vpu device\n");
+		ret = -ENODEV;
+		goto err_vpu_get_dev;
+	}
+
 	ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
 				  VPU_RST_MDP);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register reset handler\n");
-		goto err_m2m_register;
+		goto err_reg_handler;
 	}
 
 	platform_set_drvdata(pdev, mdp);
@@ -206,7 +212,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
-		goto err_m2m_register;
+		goto err_reg_handler;
 	}
 
 	pm_runtime_enable(dev);
@@ -214,6 +220,12 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_reg_handler:
+	platform_device_put(mdp->vpu_dev);
+
+err_vpu_get_dev:
+	mtk_mdp_unregister_m2m_device(mdp);
+
 err_m2m_register:
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
-- 
2.51.0




