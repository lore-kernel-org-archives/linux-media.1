Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch [45.157.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C404A7CB3
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 13:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158045; cv=none; b=LlmFckdEbDDMMgxvQgD2CIHaO2PACzVmJxySRBRuCyxpInDqLnEo66MHtaB55jRUqu6dB4RbfBVUwxjBpLbYuMCKJZrjgUO0VHIWe4dy1H9mM3AVlgPCkeMl7X7U63FA1qV7xLteqJx1GCklwv/pUEbNrnojhb9DMD71Ut9NvWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158045; c=relaxed/simple;
	bh=gafRFMuIJpoPEiHvc0UAapnzim9T20c8zLvDX7pDAeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tgJ3tuIRB/ZrdEoR6oGFUWNrCDD7EN5gQ9mvyk+p9fwztZ87n3u21IsBuBxB8HoHTi3Nh46i6pHRYzxBPp0Dryag6vMdVWln9326+fxsMYyIGOYksd02cu/8JfBPonp4fNJOTv21UPC0yhr+uoSsGWuOi3M7O7ZtwGj3IW4QUfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b=PJ2jYvhC; arc=none smtp.client-ip=45.157.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b="PJ2jYvhC"
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4j5mKZ1tMbzb6h;
	Fri, 16 Oct 2026 15:40:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1792158034;
	bh=rby9aMUP3wS4QVj+L75VJHl3m44mIgdEySaWpDHMJtU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PJ2jYvhCE2ltzTYfbPhrdNhg7OORW9X6b7wwaaMvOTLdJ52mTAP7qj7z/BcNMrf9c
	 Z1KpIBAZwlzbFIkECW+Zj8TBQhulMcAQV4483QXizeVdzjnfWZ088VB7PpfF1NPnM0
	 /Mp76YRHtzQzWER6TJhTZ1TjCs1u5Q9oa6a5FqMq89LeE5A10hfBORceq1dpJVMY9d
	 XCbbX9JyfX8/60eR2xhz91bDBZLN/625WG1stsw1At1UGFxpPF7LnZD8y6AW3ze1pk
	 0jzXAeL7l2a82V0p3recGqJbxUU80chlwcZnQKhXT2D7DA3CldNONQtubQPtirIDjn
	 OsIznf/31S4QA==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4j5mKY1fMjzFrp;
	Fri, 16 Oct 2026 15:40:33 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 16 Oct 2026 15:39:57 +0200
Subject: [PATCH 1/3] media: v4l2-common: add V4L2_PIX_FMT_Y10 to
 v4l2_format_info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-v4l-y8-y10-csi-vicap-v1-1-27bb87aa745d@cherry.de>
References: <20261016-v4l-y8-y10-csi-vicap-v1-0-27bb87aa745d@cherry.de>
In-Reply-To: <20261016-v4l-y8-y10-csi-vicap-v1-0-27bb87aa745d@cherry.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

Add Y10 format to the v4l2_format_info table.

Co-developed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 drivers/media/v4l2-core/v4l2-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 65db7340ad384..2c36ae15610e1 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -333,6 +333,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_YVU420,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 		{ .format = V4L2_PIX_FMT_YUV422P, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_Y10,     .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 
 		/* Tiled YUV formats */
 		{ .format = V4L2_PIX_FMT_NV12_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },

-- 
2.56.0

