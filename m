Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4108F3DA5BA;
	Wed, 25 Mar 2026 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444803; cv=none; b=nG+HG30ftxmJ1NwyZKn18PhSnZBGT1Ti3f2dS/1F60XClBxN/X5f4pC5EIXuQagoDDi0STKRQ8iH49o9vUzjIo3NOpAePPjTiS7GgK+jv6EZSi5n2ryLH9yyiD2hS79ER1rtnjXRyOoIksz/x/7/U1MJqAfkCnTlZadUS5noJEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444803; c=relaxed/simple;
	bh=rAtFCTnNu62D1mgQjhXKJO7Vg4yukZj9geogQbPukM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jvPaZryrSIXQmz+ySVY4BQreCx5O864/XNcUbaN2HgxyYI3mDv4zgpuOYGYIrxmpv5IbWxBb7mzAfY0CwSardJLSH71iOtRTMl3QaLPFtEDHLDx2weaIi2k1kFTUNwwzC1WxbUWGBEPD0hfJ3NFKYy+tn1AjPFI6WHgi0wvm8QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Y7qIYXrM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Y7qIYXrM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774444799;
	bh=rAtFCTnNu62D1mgQjhXKJO7Vg4yukZj9geogQbPukM4=;
	h=From:To:Cc:Subject:Date:From;
	b=Y7qIYXrMVX8by7jKWR9K3d+2t3lvnEQZpo0dYyAPmqdklWQVMox/zR4oH4I0dG1NO
	 dOFBeiM49RWp9Nzz0oO3qH0I9tfplE3RgpemIg6TScv4qfsxbtHV/RJaMp/y5A6Hkp
	 VqdUeVyNgx6FgmY+B2idY6qujq/SmHV9l6DW1Ybah5Jx67JUixJZnCWR4RRf8zupJA
	 egY6avMuj2yg27l1NKopq2ueLtC6utlIqMhVoNrbcvPz9LLfO1QzbU2NA8n0KLUKpR
	 zILTnWY4cZbkMYw6I1SS834mT0cEGOjzfJbfpTvFfbWvhBHUAeTujpbmjPlBLV3jvK
	 HYtCl9wWQLG9w==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:5bd7:b5b9:ee7f:b609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ED71E17E5A4E;
	Wed, 25 Mar 2026 14:19:58 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	heiko@sntech.de
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: verisilicon: AV1: Discard none supported profiles
Date: Wed, 25 Mar 2026 14:19:56 +0100
Message-ID: <20260325131956.18075-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AV1 hardware can only decode YUV420 pixel format. That means
that only profile 0 is supported. Discard all other profiles
when receiving AV1 sequence control.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..12f98e7e7994 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -283,6 +283,8 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
 
 		if (sequence->bit_depth != 8 && sequence->bit_depth != 10)
 			return -EINVAL;
+		if (sequence->seq_profile != 0)
+			return -EINVAL;
 	}
 
 	return 0;
-- 
2.43.0

