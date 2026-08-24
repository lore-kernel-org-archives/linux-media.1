Received: from sg-2-1.ptr.blmpb.com (sg-2-1.ptr.blmpb.com [71.18.227.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0FB388876
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 19:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.18.227.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787600090; cv=none; b=MxmAm1bOZIVEVXxWZr7WqoLfn1Xy8qeDRNUhfmzoCYplNVAO8HRRVE2mcxfo6O0kTEeB1R5MSNIZNolrOFTj0Pr3EaXT9aBk3rWU3T8/9z0seOr0ZIrJH21pvfHC92ZMdk2yjw/TEQiAA1CyBiAIjRO9Z8Rv7L0h6MSxTyzgULc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787600090; c=relaxed/simple;
	bh=lUMS82M+cyaQU2dClb4aMl4BxhiXa1LhP0YFDWcWdBw=;
	h=Subject:In-Reply-To:From:References:Cc:Mime-Version:Content-Type:
	 To:Date:Message-Id; b=CmwbeORtM+xXK2Gj3y2NOiswHG5NBGuhx+AA6SEnZ8sDQv4qAXZjN63INcygYkCRKk9Y7BUywPwDgsEWPB1H0S4+eqk7usPnoPgowbB06ZCcZJyxR38xokteQJ37/h9kFmLHuA+gTgLUKcaiMQsgrTgIIUVSIwwn9OatK80TVNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc; spf=pass smtp.mailfrom=cherr.cc; dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b=xTIl7Njw; arc=none smtp.client-ip=71.18.227.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b="xTIl7Njw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1787600082; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=G2ERPFIrOa+gDnsmMFvcRecBvtEZUGxg6dBSiPNWMUk=;
 b=xTIl7NjwTnuivp6bfW656TfpVRSSSTXptfLdk2s8Yba7gWvdY2s4jkDcDljDxMfgGnnbvQ
 FLUzyjET8n0yY5l3Z0FLEHJdmsLaFDDlQYv+TT50PCy4U1+Ge1X3j6UbX/izAJf+eAFjpL
 fhPo7LQF82pDRa+nhbOhJwFyQ4xY9fBLWc4HpC9DjyCYFEOMA4CjESS4DqSXpnBEaLeUvF
 CoLrCbX61D577fpcHOmvgDuLn87YSkvIYO8eGRz61ajHFR7ftwrDQLQkFBTAX5vOJs3vtO
 jbyG8OMKIc347W4bCZtmllBJIRCaDbtsXNejtYzbh6OQK54mMJpTUEceZH9DoQ==
Subject: [PATCH 2/3] media: verisilicon: hantro: cancel watchdog work before m2m release
X-Mailer: b4 0.14.2
Received: from [192.168.9.107] ([111.42.148.163]) by smtp.feishu.cn with ESMTPS; Tue, 25 Aug 2026 03:34:40 +0800
X-Original-From: Shengzhuo Wei <me@cherr.cc>
In-Reply-To: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc>
From: "Shengzhuo Wei" <me@cherr.cc>
References: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc>
Cc: <imx@lists.linux.dev>, <linux-media@vger.kernel.org>, 
	<linux-arm-kernel@lists.infradead.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
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
Date: Tue, 25 Aug 2026 03:34:31 +0800
Message-Id: <20260825-media-timeout-work-v1-2-ebfebbeb6c31@cherr.cc>
X-Lms-Return-Path: <lba+26a8c9cd0+57d917+vger.kernel.org+me@cherr.cc>
Content-Transfer-Encoding: 7bit

Each job arms vpu->watchdog_work, cancelled only by the
job-completion path. If a job stalls, hantro_remove() drops the last
reference to vpu->m2m_dev via v4l2_m2m_put() with the watchdog still
pending, and hantro_watchdog() then dereferences the freed m2m_dev --
a use-after-free.

Drain the watchdog before the m2m device is released.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Cc: stable@vger.kernel.org
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
Assisted-by: GLM:5.3
---
 drivers/media/platform/verisilicon/hantro_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640fb429b18d2f4fd64bc0c392cf600e..1b04b98371a48184f390a13791243fd00d6b80ef 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1284,6 +1284,7 @@ static void hantro_remove(struct platform_device *pdev)
 	hantro_remove_dec_func(vpu);
 	hantro_remove_enc_func(vpu);
 	media_device_cleanup(&vpu->mdev);
+	cancel_delayed_work_sync(&vpu->watchdog_work);
 	v4l2_m2m_put(vpu->m2m_dev);
 	v4l2_device_unregister(&vpu->v4l2_dev);
 	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);

-- 
2.47.3
