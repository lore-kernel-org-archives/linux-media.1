Received: from sg-2-2.ptr.blmpb.com (sg-2-2.ptr.blmpb.com [71.18.227.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83F1389E1A
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 19:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.18.227.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787600093; cv=none; b=Fi5SnVNtQcVkmQE79kvODFi2yJmgCOkseqssQZJD+hhrQ8hWGkJWM+3gEpRtLxEXon4Wb2vQHNwyRS3cJly4VVU+aetlDK0vKU5KaSppUlUz3EJbRrJMLDKQiDyiNRZLUNCSB3dMFLdBhRAWpG6F1uSexbYko2rvyFDSp0csScE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787600093; c=relaxed/simple;
	bh=pUr/RzP8PrIVp2HGeIHnmeB+XC/oPKLT4+Ch5dMduns=;
	h=References:Date:Cc:From:Content-Type:To:Message-Id:Mime-Version:
	 In-Reply-To:Subject; b=Vb43Faaf+KbGyDpbAdDj3CHaRkODkWfQj3hbGgC9L/SuE3uIXJkPhEfgmQCDuYtT4onVVh2PdK68HsOy19JZPZj5NnXm6kOVwg7fdZBDFVv48s3c18ZeIMNeKT27EU3kvH1Yj4v4kmFlPh0noK6qzshZcys1qHhSq1TohmUJ45A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc; spf=pass smtp.mailfrom=cherr.cc; dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b=oCGKsyWf; arc=none smtp.client-ip=71.18.227.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b="oCGKsyWf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1787600084; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=NQpiRTqyDmsFHrQhXSOP3qjTy3lJ+JjfdqVFx2AjjoM=;
 b=oCGKsyWfAUBYis17BXo7stZKB8sy5L9MG9snJ4/4Ss4RRDngkdD5zfiTJ8DfKSnm6tj6Y5
 WEvu/UMYlcvKM5TtX06gKvEyhpqGxA3ROxWUiHkAtqRUh+E5nX8KJICb8pUNMe+MfmaCcQ
 iVt5fjeLoNHe2CsPQG7QNYSmlcfWoi6BpoRi3pLI4pmtTE6XoCi2okw8FyVlP/fltyPXTT
 81hAMnGuAtVtXo3zwT8ofxEwvuH+8yT0P/q0lPI07SBRIdT81Kni5qfImpbfvezrfDZgpL
 kxF3bt7xrVXWwvL8pjEvDZdYWymVGvUnscfIWCwFQ4whPhe/5Oom1VE7ShpKbw==
References: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc>
X-Mailer: b4 0.14.2
X-Original-From: Shengzhuo Wei <me@cherr.cc>
X-Lms-Return-Path: <lba+26a8c9cd2+4b5e00+vger.kernel.org+me@cherr.cc>
Date: Tue, 25 Aug 2026 03:34:32 +0800
Cc: <imx@lists.linux.dev>, <linux-media@vger.kernel.org>, 
	<linux-arm-kernel@lists.infradead.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
From: "Shengzhuo Wei" <me@cherr.cc>
Received: from [192.168.9.107] ([111.42.148.163]) by smtp.feishu.cn with ESMTPS; Tue, 25 Aug 2026 03:34:41 +0800
Content-Type: text/plain; charset=UTF-8
To: "Mirela Rabulea" <mirela.rabulea@nxp.com>, 
	"Mauro Carvalho Chehab" <mchehab@kernel.org>, 
	"Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, 
	"Pengutronix Kernel Team" <kernel@pengutronix.de>, 
	"Fabio Estevam" <festevam@gmail.com>, 
	"Hans Verkuil" <hverkuil@kernel.org>, "Ming Qian" <ming.qian@nxp.com>, 
	"Nicolas Dufresne" <nicolas.dufresne@collabora.com>, 
	"Benjamin Gaignard" <benjamin.gaignard@collabora.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, 
	"Bin Liu" <bin.liu@mediatek.com>, 
	"Matthias Brugger" <matthias.bgg@gmail.com>, 
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, 
	"irui wang" <irui.wang@mediatek.com>, "kyrie wu" <kyrie.wu@mediatek.com>
Message-Id: <20260825-media-timeout-work-v1-3-ebfebbeb6c31@cherr.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc>
Content-Transfer-Encoding: 7bit
Subject: [PATCH 3/3] media: mediatek: jpeg: cancel job timeout work before m2m release

Each job arms jpeg->job_timeout_work, cancelled only by the IRQ
completion path. If a job stalls, mtk_jpeg_remove() frees
jpeg->m2m_dev via v4l2_m2m_release() with the timeout still pending,
and mtk_jpeg_job_timeout_work() then dereferences the freed m2m_dev
and the stale ctx it returns -- a use-after-free.

Drain the work before the m2m device is released. The device-level
job_timeout_work was missed by the earlier fix for ctx->jpeg_work.

Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
Cc: stable@vger.kernel.org
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
Assisted-by: GLM:5.3
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d147ec48308110ae8520662e182dc0445447d8d0..f0fe14e83d515f5011cbfe051abbf565568013d0 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1405,6 +1405,7 @@ static void mtk_jpeg_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	video_unregister_device(jpeg->vdev);
+	cancel_delayed_work_sync(&jpeg->job_timeout_work);
 	v4l2_m2m_release(jpeg->m2m_dev);
 	v4l2_device_unregister(&jpeg->v4l2_dev);
 }

-- 
2.47.3
