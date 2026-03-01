Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A902594B9;
	Sun,  1 Mar 2026 01:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327955; cv=none; b=PLxTN8jlEhzOpboIaDobZsmMbYVBz6+BPa4jJkIuMH+T+tHm1Ct9BoRxOA79VK7YfNa3y8jF+7R4d1nN9MaExUXASTJtj2S5Xs6tAP2cLPbMBbrqWIMlJpuHuLVdMZl/d+i6Y+eC14GUDXHitmi6+oFlSKBi1fhbWw1Dt6DshPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327955; c=relaxed/simple;
	bh=QygN+tm7vRSe8PUAkQZiS9VT5srWgie0sJ/PkT7UXz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VVfjmD9oupU/MGvlNHfBDbhQcVz658CLv9Roag05IXkwZXxJtxwiJdNW9Gjs/Jdvghr4DIuwbd2vM5cQqM9/PK8ascnWj22D4I8P4caiD4/qCb21vGV+5a+KZxR+U2O0+b/esaYEhHKxhVxXn9pWbKOsr4Z8c7qfWIOvIiyxWjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EDQeAipZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EDQeAipZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F7CC19421;
	Sun,  1 Mar 2026 01:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327955;
	bh=QygN+tm7vRSe8PUAkQZiS9VT5srWgie0sJ/PkT7UXz8=;
	h=From:To:Cc:Subject:Date:From;
	b=EDQeAipZHndMtgd90fWDOyId6frQBTscRZEFh6A78uPpi7a3rmND4mJHkY70RLr++
	 6dZLn4y7ydRCM80nW8PVk/gtEp3RPF3jqbOoG3t4N5CRym37T8C8/VDWbwO90+n7tB
	 EiVfdXPIGUlFWYehbUL/Vx0HFy6hx+P9ox4hx5fID0SGwlIxlHM/Kz8W8BO90LZKdW
	 WDBKgZzLaI/DC1FkQfTqk2BU2Drir4pdSkjNkbbonKoSg31GRctQIt8cpXgfS4enzD
	 +QindDpm/wsfmquXgEGKTbvPAdrhqnfB1RpeTpILTNtZkeq+3jWdi1VomCTCxdRHqx
	 +UdJrxWCKh5cQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	haoxiang_li2024@163.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: FAILED: Patch "media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:19:13 -0500
Message-ID: <20260301011913.1674123-1-sashal@kernel.org>
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




