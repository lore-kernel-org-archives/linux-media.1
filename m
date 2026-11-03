Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691679;
	b=lG6nNPR+qKWDx7iaXFOkICjQ3brhHhTiS4OcFcY6NghLzUhvZ5L9B/3SIiLvVaPBIPqr
	 ac2AUlZ8u8qJffFCblUD0aRxRXRZRvNMShV43VhRLxeiMTAlvs+urczgCumpq7xxG0+sk
	 AGJFf5s5gkD9TvwFlbRx6XXgfOcp11J3/5QGokumKTIVF7ibSnDXLZelmb0NOAKB8erht
	 fDne1GYIxk2TEuyb7HNTKjn2noEja/ZkVZT2QsUUdlLNZB21yZxqwSlZlJtz8BV08Wxvr
	 NYBcOOpZFexulc8eBqoKJ3x7RTcg4Kn5kvWsTymr4+kP/qq0zoYKQjfoSjHxht+tDuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691679;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=unrXYpRM04ZDnuSzMCxmVlS1hxiwU0LvVlULs3HYgng=;
	b=0axD1oPuEE8J8dELVTNiMyeKeGQMRNz98B6QWshhhAhfVNSD2YHUxcNLiWiEE4aLEM5c
	 31kWwA2KzMXqM8zQNojgJ2AZ2Bkd58X8hkPFWIef5dn3HmknF6P31HmSyG5T8iLspTiJG
	 WgRghRPJGwkySFDHW+lCFibUaYC6g7fOmzFYMIIEVU+Z9GFWwEeAvNoHQ9yS0dD2fseKH
	 jHQ19dpayK3lAnkKrU7SpGgDKoJTWLE2RQ/pCQOYmZqMrobLWqYn+XbOEXhjK//RtMm46
	 i/DdzbE3FSAI7v/zRGNAAE+QEEELwGkxQ/0I8xUBnFfm9j8TpOX/dWSZePT5BmBGY1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=GNCY00i6;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD38606A329
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD38606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=GNCY00i6
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5CE32805;
	Tue,  3 Nov 2026 08:38:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691535;
	bh=6Q9ze18PqHn248ojyQQszGM7rBEuyTl31r061SKya5g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GNCY00i6tFBKpRHwoaElC/BNx/mHQcHLatcF5sA2somBrLB3U5PUfx7KhBYozzf8G
	 KTwXTjITFhe2DsAxT0wjQqllEP2Q4nJXABMxre+jXtREEtG4RVHBaDNuhsvFnEsGK8
	 OTfQ2xg3O99JsIfd4lbozFIM/S6A5WfJUIs2BHsE=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:43 +0000
Subject: [PATCH 07/16] media: rkisp1: Power down after subdev
 initialisation
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-7-08f863b6fdc5@ideasonboard.com>
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
In-Reply-To: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=6Q9ze18PqHn248ojyQQszGM7rBEuyTl31r061SKya5g=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZAQsEz30yISu/ty86JMYqKVlaIhSKowTjLKq
 OxO/5Dl/76JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQEAAKCRDISVd6bEV1
 MpqdD/9UIlQ0Z1KWJ43DKnhvwdh7TZAdi75TJBQH+hMli4XVXFcUVl7u7haiDn+RqH0A7ad2lEa
 LNlqYpyMbuvYPRP8t3iB5ARzaA+yDO/PyjfPDKCWIXpfdFUcCR9mzrVY/fp1cugpZPld5l6FqGY
 29m1M+G54/6DBBLB/I2p+sYAHe1epUDm8L1FQRrXjBr1ADFqnldp7RMSiW1GMwEQHwwI9VNybt8
 min/iFAXJiVFdhJmIu0MPWtpX7UbAk3aqn/RJaKupr4gtga4YTBpF6vPNOkIZAoR2Uysi9X9lHz
 Q6wFTMoJyf9vV2CvXDbfcCouNYihS0HZTEk9GUyJBqoz0j722OStMOXFTTipqnjhtUzmFwnNCse
 e23s99jMkvKw+VryxqWIZwP4PZfxOBHRotiakMRRqr2DiqThuk2q8xfY/FozGdAF8oLrMG9a2IR
 TPYJwW26+SCC1pLk6o1v+G/mLzd3P8FIs7ONTUFBZDPQ97aL9R1/vk4XwOc2VGG4eIMD0UdXl0p
 cPPVAIyNGpUCAHCbUp82eY6HPesoT5+NqMQCw2Idy9NkPXrpl2gJiF4IZsAvt/rpy8IjxK+zIzq
 s+3mWHksUWvvaTDG9lsvVULcs0B/2X0NoqnQCvJms0AF5QjWRXrEmEBxzb9g+YMhwWVqCEMB6G4
 KszVl8mCjDQrK1g==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

We will shortly need to reference the ISP's subdevice in the PM
.runtime_suspend() callback - make sure we don't call it until
after the subdevice has been registered.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 2efbe6140da71a51077d7d4aa2352ef95497ebe2..9f1d0f72ee9bf4364c696d9fdd8febea80d2bcde 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -729,11 +729,6 @@ static int rkisp1_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_pm_runtime_disable;
 
-	cif_id = rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
-	dev_dbg(rkisp1->dev, "CIF_ID 0x%08x\n", cif_id);
-
-	pm_runtime_put(&pdev->dev);
-
 	rkisp1->media_dev.hw_revision = info->isp_ver;
 	strscpy(rkisp1->media_dev.model, RKISP1_DRIVER_NAME,
 		sizeof(rkisp1->media_dev.model));
@@ -770,6 +765,11 @@ static int rkisp1_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unreg_entities;
 
+	cif_id = rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
+	dev_dbg(rkisp1->dev, "CIF_ID 0x%08x\n", cif_id);
+
+	pm_runtime_put(&pdev->dev);
+
 	rkisp1_debug_init(rkisp1);
 
 	return 0;

-- 
2.43.0

