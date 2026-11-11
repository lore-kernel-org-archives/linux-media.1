Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364138;
	b=J9oq2ib+FVl23x/2pSE7Rnl8T2e/ULO2lJ14u2OE7Rpn97zNgWF6W1A/gTT7rxnYjIzo
	 2mhOWdvPyNw7KoOklCG8vLyu6xqilPauuTD3T3IrElsPGq/wCYLh5zkSUY06MSxLEjSLK
	 pA61RKG9eWbahrv0fi892XIiPRU905IyNyhoY+af4RUA1u+DZJ+VSVjRWLE2UAOuvOr5w
	 440BSfnhLyKxpPbzjFGMZp1zKidouYBr41xP1tKmgWPxbRYoNzAEjdb1PspL5YIhaDFw0
	 HZoYxRyrKI/NXEDJWfrkDFrroKOrJ+6jJaTWIinO5BdnDlKcW/DGWuaHXTmGDqahyhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O32a4AiJGMwcCR/+4zjDOYox+W85VRB2HAzvlPxTqmU=;
	b=Dujaett9InHDrMsz1uIyoDBdqKfMHntmq+Hamd3wTczeEiv4yRwrT08ypxmZcE9Za8G2
	 0+X6zS3IbniQcSw854pG9mvPJA8GiEsFzqGiUrcbo+buVL8eZgw1ot9phZ9gZvApK36qW
	 cJcv5ZoCZHuAvh75lhM8zLbkw3SweeibTSRTVBaaSebJBIEC8atYkvjElywkabCE+02AH
	 FdpGf8+5TgZtqZW4T7hwcpT8kqYcelbjV40gM7r+fpYbkm2dYnXM4v6Co0D/vWjtChk8D
	 cztV7QqQA0L/i+ECYVqhLAcbRRe1Zj5Xui3BVQbVqeTUWiWche+LIzdH5i8krDK7njg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urm5Wpo6;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ABE606A32A
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 02:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24ABE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urm5Wpo6
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b5efadd183so1279184b3a.1
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 18:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364137; x=1794968937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O32a4AiJGMwcCR/+4zjDOYox+W85VRB2HAzvlPxTqmU=;
        b=urm5Wpo6Von7lDwPbrmT6beI/5qJ2yfOmVRcyJ+2i8dsZ6ESf4IddCDDbBL0c8y1tC
         pPjicmjFC5T5hq2qggvLCEt1UKGW6C0q+T5/MR6tQO/jKK9UJKgutCAjP5P5/d3Vlk0A
         +yhecjBbh8df0sHq8o+xkbEMKhI320DFBCEEZ/IzxAeAPgc+jhuRjt1P+PElwuRuv/aZ
         sU0fl+38DOrn/z+fBBHgiIoUvew/KYyAG7TUTV2DbmNJuN5vvOHos3pOdWadbbVaaQ3I
         XlvAHZaHB7j2yikWdSELncKOxpYw8TOcVLNouBpJ0AKwjnJeeqVjdw+ITxGy3BABkY8q
         ppUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364137; x=1794968937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O32a4AiJGMwcCR/+4zjDOYox+W85VRB2HAzvlPxTqmU=;
        b=cDiNmDf1ZkQJEOdkPiM3/1lk2E+QTTMmamMxOe6MgaRyqh4I4cQzYbXEt6QovJogFR
         iXIEodguA5pdV0E9G1tNNzOX1TjZggtXEkergs1Q9BuxkvYDid0ovYmlGxo8hloKPgcX
         3kx4MJixscDr1q78ge54vFXRkGHduceynh6czlJnurKVzB2lwnbBQR9n8KM2Cy39x1Y8
         XdJ4r34LNizpOibDwA4XQ5ooV+13HBbGMZHvWn7h5qRaoWVO4A8z2SyumoeXrlBRYIDt
         0xdeYRTIddieHA2DWrhewCVZaBOST14yl/GTgKw48CTpDn/e/I6My/ajCEz5ZqAPguk6
         fpzQ==
X-Forwarded-Encrypted: i=1; AL+hErFg3IihFghKB+W4Vn6yKS+zM6AmfdiKgkbBngqAHm9cWQSYiPkCyN55FsxDWr/irsh1ZNTGPlKjIjQNuQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+H1WEjcypt2lNxsevX/YBHJoh7ouD/r8NvpGjQfDyUVWRqqEO5
	/KKaq8ZV7nEy0P7F/p5hMBIVSA0uv68M1o+XnR7xAw7SP8hBYjnIXGw7
X-Gm-Gg: AYBFou1kQSseZKF7hXkHr5uyQvn7CP+8EzFO4FjEcd1bVmCGQmNHN0ja1vjxAzCs/O9
	I0hxI8+2S6COqusfpwEK2C4kqCHozhK5nCMQrMTczoTE9kijRPc0Q0VkZ3r2+ENSNfH0T1aScig
	oF+mZQnpGSIglduJZ97a1AGwEuQVUz3Hlsrk3R5NPh2xau3iTiqkTs3aGR8mYQzWgnvNeR/L/kM
	9Fz9HvICaoTfZwY4kN1BDk3MhazAH4WlpnNkwo1pZ6IW+xmrAsax8yi/zyVDEXKofjH8fKcYHWd
	coZEUQM9YaVBB6I9j98Ay9ZOHWNJRBXdpB1BAyNh/nowXKqiVxLoFGdLhm44wh6XwicgTqd9yIy
	VDWRdnBsLWnBz4li2ct4o2z6lzxgxAF/237WqG3HXrkiVDI/AJiK50TWa/DkyAKu38r1tna4K2e
	/t4xD2HocW7NwbWaR94QvwikuLI+UYFQ6aPFm22/zOTHPuqh0RYguHQsjxkeGEZ+glUpCBKCMk2
	h0qTvE50aOFqteJZuLfuo4of3wch43QxnPvDc3oGqAG+cRBRFt/hUQf9a707IP2jvLhI05BeO6b
	7Ify1jp4VGzEYmpy07u80qLfCY4abvH7B7mKM4x/Vwt8kXYM8m8jeLblP/4M2UQjLXBjTk8Pgr9
	HXOJZKqd7zSotqDx/b0a8m18LMK3wU9W4uISJwCXM7IjgQceXX9wbHa81sb2PhJErrdve7HTbN/
	Hgjw==
X-Received: by 2002:a05:6a21:1391:b0:3e1:9071:acb2 with SMTP id adf61e73a8af0-3f2ff2e0b6cmr821227637.33.1794364137319;
        Tue, 10 Nov 2026 18:28:57 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa86ce5fsm1603153b3a.21.2026.11.10.18.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:28:56 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Stefan Riedmueller <s.riedmueller@phytec.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: nxp: imx8-isi: remove kzalloc_objs
Date: Tue, 10 Nov 2026 18:28:22 -0800
Message-ID: <20261111022822.67474-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to combine allocations.

It looks like pipes never gets freed anywhere. Meaning this effectively
fixes a memory leak.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: use devm_kzalloc_flex
 v2: add fixes tag, fix typo, and move pdata assignment to original
 place.
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 10 ++++------
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 2005584a1215..dcf6c25d7faa 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -473,24 +473,22 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
 
 static int mxc_isi_probe(struct platform_device *pdev)
 {
+	const struct mxc_isi_plat_data *pdata;
 	struct device *dev = &pdev->dev;
 	struct mxc_isi_dev *isi;
 	unsigned int dma_size;
 	unsigned int i;
 	int ret = 0;
 
-	isi = devm_kzalloc_obj(dev, *isi);
+	pdata = of_device_get_match_data(dev);
+	isi = devm_kzalloc_flex(dev, *isi, pipes, pdata->num_channels);
 	if (!isi)
 		return -ENOMEM;
 
 	isi->dev = dev;
 	platform_set_drvdata(pdev, isi);
 
-	isi->pdata = of_device_get_match_data(dev);
-
-	isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);
-	if (!isi->pipes)
-		return -ENOMEM;
+	isi->pdata = pdata;
 
 	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
 	if (isi->num_clks < 0)
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 58b47335afc7..3165a65391c1 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -297,7 +297,6 @@ struct mxc_isi_dev {
 	struct regmap			*gasket;
 
 	struct mxc_isi_crossbar		crossbar;
-	struct mxc_isi_pipe		*pipes;
 	struct mxc_isi_m2m		m2m;
 
 	struct media_device		media_dev;
@@ -305,6 +304,8 @@ struct mxc_isi_dev {
 	struct v4l2_async_notifier	notifier;
 
 	struct dentry			*debugfs_root;
+
+	struct mxc_isi_pipe		pipes[];
 };
 
 extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
-- 
2.56.0

