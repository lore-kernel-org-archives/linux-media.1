Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE043EB0EF;
	Fri, 17 Jul 2026 11:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286355; cv=none; b=HfbRJuJiDq7Vlb4cgZSOVEDgAT7oPU+vjIglatGbZ16WsAMX+OUAHyTX1UAnRsHlsOO/z7aJP6GkMKHyroQfnzM0ShQQGMD9of8rGSupLQI2ZEzKHzFoeK626lOODIyV4lDEC5lLFzpt9okh/8HA90VqPi2EBJuynwqCimFtSTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286355; c=relaxed/simple;
	bh=yqMwD+IZk5cX92zDBmttToK3LYTopF+D7f9eYOZ24ZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kjapFWJxnVvTD9xnTfP7Ia/rO7Hxth6JyB2GPjWtw5jxNraCHd2dKmc9otv1n22iH2sHdhVmyDIX8bQGiBNPpHFL3PP4vkESR8nJ33bBr6tDprJCSNp6o1ij0tExi9gynrh2IqDu2fQGzaFwTmLLbYF8nQKgW58KsrsIcjAC2Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RkxpOxSe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RkxpOxSe"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3F141337;
	Fri, 17 Jul 2026 13:04:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784286287;
	bh=yqMwD+IZk5cX92zDBmttToK3LYTopF+D7f9eYOZ24ZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RkxpOxSeb9OJ6ma3/uG9WYCPHmBgbEf9jLLuV0jkRxDI7CQYCFv0T4zh1qgvJWvxY
	 /exCOoiB+4TVCyKnkCiKUHpo878MnjjHdqQBUVHNP1zpqpQP2dvXkk6/ADJK7VdI7E
	 faUbxnp69HsIPnOAke7g5finpExaIOostDtFxZFk=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 17 Jul 2026 16:34:22 +0530
Subject: [PATCH v3 7/9] media: platform: broadcom: Move unicam driver to
 subdir
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-vchiq-isp-v3-7-fb8235e15c68@ideasonboard.com>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
In-Reply-To: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5028;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=yqMwD+IZk5cX92zDBmttToK3LYTopF+D7f9eYOZ24ZQ=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqWgxanHj3X33cjI2Hbk9zHUA1pLbDgY+eTc3Bq
 KeYLal2/rqJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaloMWgAKCRBD3pH5JJpx
 RYtbD/9vVh4xFVlqvSkOThq0ORpL0aoMqr4+lkQ4w2V/rFrBJToaQEDowXyMoLtsx1yS09JZfLp
 r/DH+yPiT2ZNDhClq1PzVincXWNpGvPhwZK21sFUDd/2gjVrrS0A5qcbq5U2bskJc20O7rnnAn0
 49Gesk1C3t4OFXoct2Q4Tdmq0RMw2GII9VaaBIum34Z7M4kE3Kstr+wExdJU3t6vgnDGDSmoz4E
 vD3HApYgHf95iV0T0l/skhJpPbxlILOcm1hnh58nkjDBHWG7gRqD9vq7g0Xwn7KtkWuk1owAtcL
 h4m1tNlatnibBupjYVrYz+yH7DL/zLxEKSlWTnCSX9lArvjaxmx/wgaSkgVgNHK1l6t6r/XbCSr
 MhLXmQHi1cASr6F2okSUpHVnwtPwPlqsZ2XT0NZ7Xl81+K+8YzYdG8SPrv2QB8a4xzLmhlBUb1D
 FoQf32iu3PYguKzfqDQbWNDFs9MFROmnRfjuXFLZLOjHQ20iQd1BHn6AH8OgsJo1xXLRD/Jnd7l
 g3pVT3ambxCMb9eMvyaGhgA2i+gqtlactGrHa6SkxkJf09jdgz+2rdbP7ioy26KOwFkU622WKeI
 kWCkdz56xEn7FgbGnkDTQKrklzaTotmT70bZ/TylHwUG44DPr3Srz8Iz0szqgrb7x7Gt52pHI9X
 b4Txc+8TCaG9iNw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The BCM283x/BCM2711x SoCs capture camera frames using CSI-2, and
optionally process the raw frames using a VC4 firmware-based ISP block.

As the ISP driver will be added subsequently, move the files related to
the unicam driver to a separate subdirectory to ease distinction between
the two drivers' files.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 MAINTAINERS                                        |  2 +-
 drivers/media/platform/broadcom/Kconfig            | 17 ++--------------
 drivers/media/platform/broadcom/Makefile           |  2 +-
 .../media/platform/broadcom/bcm2835-unicam/Kconfig | 23 ++++++++++++++++++++++
 .../platform/broadcom/bcm2835-unicam/Makefile      |  3 +++
 .../{ => bcm2835-unicam}/bcm2835-unicam-regs.h     |  0
 .../broadcom/{ => bcm2835-unicam}/bcm2835-unicam.c |  0
 7 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d570a293b1d1..22095cbff865 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5139,7 +5139,7 @@ M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
-F:	drivers/media/platform/broadcom/bcm2835-unicam*
+F:	drivers/media/platform/broadcom/bcm2835-unicam/*
 
 BROADCOM BCM47XX MIPS ARCHITECTURE
 M:	Hauke Mehrtens <hauke@hauke-m.de>
diff --git a/drivers/media/platform/broadcom/Kconfig b/drivers/media/platform/broadcom/Kconfig
index 93ba565d9a02..cab44885182c 100644
--- a/drivers/media/platform/broadcom/Kconfig
+++ b/drivers/media/platform/broadcom/Kconfig
@@ -1,18 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-config VIDEO_BCM2835_UNICAM
-	tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
-	depends on ARCH_BCM2835 || COMPILE_TEST
-	depends on COMMON_CLK && PM
-	depends on VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select V4L2_FWNODE
-	select VIDEO_V4L2_SUBDEV_API
-	select VIDEOBUF2_DMA_CONTIG
-	help
-	  Say Y here to enable support for the BCM283x/BCM271x CSI-2 receiver.
-	  This is a V4L2 driver that controls the CSI-2 receiver directly,
-	  independently from the VC4 firmware.
+comment "Broadcom BCM283x/BCM271x media platform drivers"
 
-	  To compile this driver as a module, choose M here. The module will be
-	  called bcm2835-unicam.
+source "drivers/media/platform/broadcom/bcm2835-unicam/Kconfig"
diff --git a/drivers/media/platform/broadcom/Makefile b/drivers/media/platform/broadcom/Makefile
index 03d2045aba2e..33a89bdb0029 100644
--- a/drivers/media/platform/broadcom/Makefile
+++ b/drivers/media/platform/broadcom/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_VIDEO_BCM2835_UNICAM) += bcm2835-unicam.o
+obj-y += bcm2835-unicam/
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam/Kconfig b/drivers/media/platform/broadcom/bcm2835-unicam/Kconfig
new file mode 100644
index 000000000000..32b76ebfcd9a
--- /dev/null
+++ b/drivers/media/platform/broadcom/bcm2835-unicam/Kconfig
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config VIDEO_BCM2835_UNICAM
+	tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
+	depends on ARCH_BCM2835 || COMPILE_TEST
+	depends on COMMON_CLK && PM
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  Say Y here to enable support for the BCM283x/BCM271x CSI-2 receiver.
+	  This is a V4L2 driver that controls the CSI-2 receiver directly,
+	  independently from the VC4 firmware.
+
+	  This driver is mutually exclusive with the use of bcm2835-camera. The
+	  firmware will disable all access to the peripheral from within the
+	  firmware if it finds a DT node using it, and bcm2835-camera will
+	  therefore fail to probe.
+
+	  To compile this driver as a module, choose M here. The module will be
+	  called bcm2835-unicam.
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam/Makefile b/drivers/media/platform/broadcom/bcm2835-unicam/Makefile
new file mode 100644
index 000000000000..03d2045aba2e
--- /dev/null
+++ b/drivers/media/platform/broadcom/bcm2835-unicam/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_VIDEO_BCM2835_UNICAM) += bcm2835-unicam.o
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam-regs.h b/drivers/media/platform/broadcom/bcm2835-unicam/bcm2835-unicam-regs.h
similarity index 100%
rename from drivers/media/platform/broadcom/bcm2835-unicam-regs.h
rename to drivers/media/platform/broadcom/bcm2835-unicam/bcm2835-unicam-regs.h
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam/bcm2835-unicam.c
similarity index 100%
rename from drivers/media/platform/broadcom/bcm2835-unicam.c
rename to drivers/media/platform/broadcom/bcm2835-unicam/bcm2835-unicam.c

-- 
2.54.0

