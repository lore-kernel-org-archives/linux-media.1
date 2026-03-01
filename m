Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D55C145A1F;
	Sun,  1 Mar 2026 01:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329234; cv=none; b=ORvbw08H2IzST880BA7164lKHoBZy5RBX7yDZJJOJQEpS0dEpVAGcgXheFmX6WWfbD+7SHOrZwuMODyGmEWU/4i73IfXsRQwk0IKc/lHP3ivTOecM/vALtL+YXFgpUadYxXff2C9zgI5okum/w2Rsq9zMa96aFtsPwJo2Ftoq5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329234; c=relaxed/simple;
	bh=qoPBFVk5wk8VfEbLL0CjaifgTX27bi8zrXhqU8zt4/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=slk8sLHazQjkxPFN1DBY0nna3Td/r5153o6MadPgC+7wYI3ZtHTD+WVdi738v9kEVGai/+R79phpmDjzf53EJa+TcE5KWF7NDfDrkkO+e4ft+NoJTaRvx5bq8lQKK5k98x+O25kyYXC/y2I11OQtJaH1ceSRtvs8kFdkQr5U0mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnvt+D99; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnvt+D99"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0487C19421;
	Sun,  1 Mar 2026 01:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329234;
	bh=qoPBFVk5wk8VfEbLL0CjaifgTX27bi8zrXhqU8zt4/c=;
	h=From:To:Cc:Subject:Date:From;
	b=cnvt+D99HA2WEVoeLri6M1jrGRzBov/KkMSloQ60wnwWvMcVXqksDs1OWAMLcxRSU
	 S6WaujYXyOR+nMpX7JyS39HuHUkheYO0SSDWeFMHw86WCHQE3tZZgjJybiQaKHCJ56
	 57mWSO9uk+9CKIHHeXf7o32iBFfIROaFzEV0IUhTeFEZyiI+/XbG8OJhuo9GWVyWO2
	 eRLXKjs8GvvyvQueRIm/M5QiWLJstE1QSPPmJQMUOGwNgzlZLxOV2zHl5mIbCWlbRj
	 nvqVwrsAWgVJ9/QiE0ukV/VTjw07vgFUXJSYjL159MsnShCnK5xEwySEzAWt2G2bE8
	 RgtCIoEuNOtcQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	haoxiang_li2024@163.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: FAILED: Patch "media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:40:32 -0500
Message-ID: <20260301014032.1701797-1-sashal@kernel.org>
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




