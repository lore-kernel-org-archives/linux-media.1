Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1710640D565
	for <linux-media@vger.kernel.org>; Sun, 21 Jun 2026 14:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782053908; cv=none; b=TyZBXLlhz5pl8sf52L9rf3W1y6w5bWKX1aWBkjPu7NrHd4+eC/C6BdTMzLzt8+w/exatdGDOQd2Oa9fbCSEOT+qgF6d2CDFNVN1UAXTAHc6+zjQy97y3xaB1tuxyg1AC8vnsXcx+xHbGy+yBbFe6Zb1NTJXcTsAG6O0lIIwK1v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782053908; c=relaxed/simple;
	bh=GzAYA8+XMUxbqFVL+j4JsNsObKZ7WwluCiQx+OwPQHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DxlJXgJJf+0YF8jlszGq+UFq3lh0NUfrC9L9Hbrn+Esonl1PXc7KdEMFhn1c+dwMfkfaEgSoXxNpWSqVZxnBbXuVS605SizdakQHYSoCI7yxBunHVSCeoJToB6HzsOIZS8sxtD2NuSjgaMBQDbBrFX5srhOlQ131tty97Gh3WxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5HDLTp1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5HDLTp1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A511F000E9;
	Sun, 21 Jun 2026 14:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782053906;
	bh=29LkTg5/vjknUTvKCcOO6frCgTLokc+XMDNxhhKcirQ=;
	h=From:To:Cc:Subject:Date;
	b=K5HDLTp1JFkaEDRgf4ycqTVNDYBbPFH1SNR9rI2RloQQvWHQFwdQIoxrx10Q/8RRv
	 oBizmdOGTUDs4Veq5zc0BZMWnF3rN5mZ4wLAcHPU3ZSk0fEgyblNxSyYU9b/HHmZb8
	 hxlNMNZG1+9uV3D+EaA04GxTwRFxB/mDp2Dxiphh2+JqUlJr0ojlbpekhY6XejBJb4
	 qJ7QNkAo4SiTnzU+UzkyddzldyLF79Z8e3mhSbP3TPKuq9+e0UB8+KDq7MqV8YQmMp
	 XKdG9gVG7k6c31flB44BEh/Gappx2QHjLuE0lJo7EtKQ9B9J3iW4aN4TLqi214YTS0
	 thR6NUcCH1Afw==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: i2c: ov02c10: Narrow chip id check down to match ov02c chips only
Date: Sun, 21 Jun 2026 17:58:08 +0300
Message-ID: <20260621145808.2660219-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Originally a chip id check in the driver's probe function is done for
any OmniVision "ov02" sensors, but is too wide, since there are at least
"ov02a", "ov02b", "ov02c", "ov02e", "ov02g", "ov02k" and likely even
more families of sensors with similar names, thus the check for id shall
be more specific and match "ov02c" exclusively and expectedly.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/media/i2c/ov02c10.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index cf93d36032e1..b36da75d7dfa 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -18,8 +18,8 @@
 #define OV02C10_MCLK			19200000
 #define OV02C10_RGB_DEPTH		10
 
-#define OV02C10_REG_CHIP_ID		CCI_REG16(0x300a)
-#define OV02C10_CHIP_ID			0x5602
+#define OV02C10_REG_CHIP_ID		CCI_REG24(0x300a)
+#define OV02C10_CHIP_ID			0x560243
 
 #define OV02C10_REG_STREAM_CONTROL	CCI_REG8(0x0100)
 
-- 
2.51.0

