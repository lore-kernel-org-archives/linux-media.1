Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025334;
	b=I4xxLJ9hhZjbT6NGMW2ybY9zG+zzf5oqzlta03+DiQlOBJSGOe9f+UX3XyLoON1SmAHY
	 TwRglYuxXGG67QGyaNSTkqQSeks4dVNx99heuFG308mf5179dkf8JWZe+NdDgvgdgNQWY
	 hZMU8XWgQIdgsXhCOe1zyMj88jnIu5mymkqT4OMZ7WlOaZdUo51d7vkm1f56d1Z+XjxB1
	 D6V70c/JJYt7YQN8L91ngqTH5yARt1ZiqDF3Dxtens9c59vAiUP1e6HkPXhk7DnnoZKtM
	 pG03NbEBuWHrkgMlJix5JLiDvvp5yaQeWUTQg1p0eRLRvF1bGhPJGAoO9TEcgnC7jKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025334;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wPoARDbP77plNa9wKA33jBrkgBFk1d1ilZ6nv4pbO5c=;
	b=IGsUsbgW2xDibNaIRN6Nat908CkxupHgzTU2rO84mguMOzkDFEnuqVlYWtqZQ1BCeMVM
	 Btyk35YxrX6fRczNKaweDcbjAsSaOcC66DmYC/nKUG+3iVtF5sQrI7ofa16f9iBya4jHd
	 cFxR/L6uv0PMOokxulW0HJF2ONwdFglggGPY4gOWbAIQpkm6Bq3vZPR/4ZfSbc5gz2EMj
	 7VDYoJx1pgAzIkwKMjAvpLdFIIIdoz7XeEEANJaxX1ekTKQTwUs6pXN9ITtpYGHXEQurs
	 eHO1W8pTxf1XxHjdlcoNgJMC/WY1T5IXhA/1qrWfRn2mFxr1jsWaowpfzF5pDCInDag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=bVLoMF1M;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3702B606A320;
	Wed, 18 Nov 2026 18:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3702B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=bVLoMF1M
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1213434;
	Wed, 18 Nov 2026 19:06:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795025184;
	bh=qXGE+lHjfIKi6L8Q0RC6CpYpy+XKd4ufo1upEPlf0jk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bVLoMF1MI/fCUFJ90qfZrLnRoN7Zx3zdajgYzbKDzwF8/760jJhbN59TWc1gbvQ4J
	 P3iJsty+Yja/bZ8pexEo72984srClucrMjxDK/A69HqttDgmcbKrFQilPzrvzqs2g6
	 9vk6INsyrFd9oT8fIAUJNrvaY9hJQcPZ3mAy9wLI=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 18 Nov 2026 23:38:16 +0530
Subject: [PATCH v7 3/5] media: platform: broadcom: Move unicam driver to
 subdir
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
Message-Id: <20261118-b4-vchiq-isp-v7-3-b8c81d193abf@ideasonboard.com>
References: <20261118-b4-vchiq-isp-v7-0-b8c81d193abf@ideasonboard.com>
In-Reply-To: <20261118-b4-vchiq-isp-v7-0-b8c81d193abf@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4911;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=qXGE+lHjfIKi6L8Q0RC6CpYpy+XKd4ufo1upEPlf0jk=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq/emcDHQlPJ8B023lVuyW9Bb253AZF/XDrRtqU
 d/lBVTxBQCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCav3pnAAKCRBD3pH5JJpx
 RRLqD/4yVks1llw7HN9z5SuuD+t4trqmkzqHfbEf2hFwoc/+4hkgR8SUFrk/SuLPsKzBHcCB9xt
 TySXbwR8ZlvBlnZqVwSvhpiD/81y3KxvT309mRWB5EY2iGAydUwI/nj0J+SY0KuEE9C7HAcZsXH
 F9NUP+6FJqlfNX1irHYyuZ9gqfBvmYt7LIFSYYM9RUxFhothLzkKZ2uKeDR8UIu8PO7qGAJkp9y
 UJB0sJI12R0zRAzlD4Y0UOSy7JAZfoMlXXgkk53mohDI46ZlKpYvdA+Ljv0EO7/Aacaj5OdklJQ
 qy6SNc/etQJLKRVbwDiEI7OR8UdiKmavByIKmFdox5aQ7WpMmOyWHsJLKJSR68en7BE4NEfYfNo
 qDvhRTHEzjR4j8y5YQmPSJxNrn1E/csHAShVRWjS21mWVFs3KL548Zo1lACypi/25QqOpgj4oJz
 WCEV3vyYBoOYlCDyzG51VeC1K+h0AHSE1hN9NN5xLUKFgwcYs5keMstz1bBR5TBnVmqwHWFl0DB
 OQSdbWd0fTjYtkpIEqWTvC9bvDhr829+0GhwWblp32axnaxkLfJjNDP9oSFXt6xrzLYX4VW3pA6
 PfQucyfuB/7tcmVef3okQAPHfZIhfhMEFGzt3UL4BCpkjfwPXBB7GRSw+OhW15LmUtwFaUTQLJR
 wK9hkLRKA7HxoYw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The BCM283x/BCM2711x SoCs capture camera frames using CSI-2, and
optionally process the raw frames using a VC4 firmware-based ISP block.

As the ISP driver will be added subsequently, move the files related to
the unicam driver to a separate subdirectory to ease distinction between
the two drivers' files.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 MAINTAINERS                                            |  2 +-
 drivers/media/platform/broadcom/Kconfig                | 17 ++---------------
 drivers/media/platform/broadcom/Makefile               |  2 +-
 drivers/media/platform/broadcom/bcm2835-unicam/Kconfig | 18 ++++++++++++++++++
 .../media/platform/broadcom/bcm2835-unicam/Makefile    |  3 +++
 .../{ => bcm2835-unicam}/bcm2835-unicam-regs.h         |  0
 .../broadcom/{ => bcm2835-unicam}/bcm2835-unicam.c     |  0
 7 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 94740f66baa4..1393e8ce9065 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5344,7 +5344,7 @@ M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
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
index 000000000000..93ba565d9a02
--- /dev/null
+++ b/drivers/media/platform/broadcom/bcm2835-unicam/Kconfig
@@ -0,0 +1,18 @@
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
2.56.0

