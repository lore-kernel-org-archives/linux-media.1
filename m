Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.205.14.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454551;
	b=FVKoB+SZfLl40vxka7nLU+Ivm8LLab3avGzj3P/95sa+Mp1u1uMTupjDHWy+U4tVr1gX
	 iUVCJuz99o6C2d/v8drHmqeVCWE+b04lyldSnOuyEykl1duekKGJK1ocfbCZeAmv909wM
	 r6QZaskjHh797SDzp3AOTDObfk2qhebM8PobPqf5lklodTRNUBdKzXRED1AtVNwTuxZ1Y
	 gQS/94cJhbJFCVLW+7Hajz34zUniHuuedF/01CT1wsBZ9HRm2Diu8OTQuJbu/56RS86Yt
	 YZzKZLZF5L01g/FH9kJC2vNKyT/896sPRiG8fRKOLq/iko4w+jrEGvJ4ues+alYqITg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454551;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fLQu8QVdKIs7Ogz5lNJLzeIdms4BeIu0fjTXQJywUSE=;
	b=dwhVSZFzLsrN7WI/MhYLNe6VwrSbOYp19XbI6dKyioMPpBpHs5ybCLx30FT3gReyV8zG
	 sOMMxmRGYO8BDxa985NannayVxU/nQ2HaCFGr14BN/QDZB65a2GuPsj5Hae5+7uImHglL
	 bDV8Y56OUd2/87G+VjhGWbXWZuBkRpLm1ThCUJUJAtKHBtrOCxngSKjWEwllAoYf8KyE0
	 RAAGKD02HeNCRBXILiLg/VzPikt3TV4k09FR2XrHeEzFOFrjMtjQeVrTKBZlDmWflAUfx
	 lsSA32iDTBM+pUnOFrgBM/3FO0FJqJRrpN6OBezKpRec78tlu15jLAWUE+WHoPOsQFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gpxsee.org;
	spf=pass smtp.mailfrom=gpxsee.org;
	arc=none smtp.remote-ip=37.205.14.76
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812E3606A327;
	Mon, 23 Nov 2026 17:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 812E3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id A54E2C1669;
	Mon, 23 Nov 2026 18:22:25 +0100 (CET)
From: tumic@gpxsee.org
To: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: mgb4: Fix broken PM suspend/resume
Date: Mon, 23 Nov 2026 18:22:02 +0100
Message-ID: <20261123172202.304364-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Add the missing PM suspend/resume callbacks that properly reconfigure
the mgb4 HW on PCIe suspend/resume.

In addition to adding the PM calllbacks themselve, the already existing
i2c functions were refactored so they can be used both during probe()
and PM suspend()/resume().

This patch only handles the mgb4 part (FPGA and i2c
serializer/deserializer) of the reconfiguration. The used sub-devices
(xdma, i2c-xiic, spi-xilinx) also need propper reconfiguration during
suspend/resume but this is handled in separate patches to the relevant
drivers and their PM callbacks. The patches are independent, if any of
them is not present, the mgb4 suspend/resume won't work, but this is no
change to the current state where the HW is broken after PM resume.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_core.c     |  58 +++++++++--
 drivers/media/pci/mgb4/mgb4_i2c.c      |  26 ++++-
 drivers/media/pci/mgb4/mgb4_i2c.h      |  11 +-
 drivers/media/pci/mgb4/mgb4_sysfs_in.c |  79 ++++++++------
 drivers/media/pci/mgb4/mgb4_vin.c      | 137 ++++++++++++++++++++-----
 drivers/media/pci/mgb4/mgb4_vin.h      |  19 ++++
 drivers/media/pci/mgb4/mgb4_vout.c     |  93 +++++++++++++++--
 drivers/media/pci/mgb4/mgb4_vout.h     |  17 +++
 8 files changed, 359 insertions(+), 81 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_core.c b/drivers/media/pci/mgb4/mgb4_core.c
index cbd193e06536..d33d1e047301 100644
--- a/drivers/media/pci/mgb4/mgb4_core.c
+++ b/drivers/media/pci/mgb4/mgb4_core.c
@@ -40,10 +40,13 @@
 #include "mgb4_trigger.h"
 #include "mgb4_core.h"
 
-#define MGB4_USER_IRQS  16
+#define MGB4_USER_IRQS   16
 #define MGB4_MGB4_BAR_ID 0
 #define MGB4_XDMA_BAR_ID 1
 
+#define XDMA_IRQ_SPI 14
+#define XDMA_IRQ_I2C 15
+
 #define DIGITEQ_VID 0x1ed8
 #define T100_DID    0x0101
 #define T200_DID    0x0201
@@ -168,8 +171,6 @@ static int init_spi(struct mgb4_dev *mgbdev, u32 devid)
 			.name	= "io-memory",
 		},
 		{
-			.start	= 14,
-			.end	= 14,
 			.flags	= IORESOURCE_IRQ,
 			.name	= "irq",
 		},
@@ -190,7 +191,7 @@ static int init_spi(struct mgb4_dev *mgbdev, u32 devid)
 
 	request_module("platform:xilinx_spi");
 
-	irq = xdma_get_user_irq(mgbdev->xdev, 14);
+	irq = xdma_get_user_irq(mgbdev->xdev, XDMA_IRQ_SPI);
 	xdma_enable_user_irq(mgbdev->xdev, irq);
 
 	spi_resources[0].parent = &pdev->resource[MGB4_MGB4_BAR_ID];
@@ -276,8 +277,6 @@ static int init_i2c(struct mgb4_dev *mgbdev)
 			.name	= "io-memory",
 		},
 		{
-			.start	= 15,
-			.end	= 15,
 			.flags	= IORESOURCE_IRQ,
 			.name	= "irq",
 		},
@@ -291,7 +290,7 @@ static int init_i2c(struct mgb4_dev *mgbdev)
 
 	request_module("platform:xiic-i2c");
 
-	irq = xdma_get_user_irq(mgbdev->xdev, 15);
+	irq = xdma_get_user_irq(mgbdev->xdev, XDMA_IRQ_I2C);
 	xdma_enable_user_irq(mgbdev->xdev, irq);
 
 	i2c_resources[0].parent = &pdev->resource[MGB4_MGB4_BAR_ID];
@@ -693,6 +692,48 @@ static void mgb4_remove(struct pci_dev *pdev)
 	kfree(mgbdev);
 }
 
+static int mgb4_suspend(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct mgb4_dev *mgbdev = pci_get_drvdata(pdev);
+	int i, rv = 0;
+
+	for (i = 0; i < MGB4_VIN_DEVICES; i++)
+		if (mgbdev->vin[i])
+			rv |= mgb4_vin_suspend(mgbdev->vin[i]);
+	for (i = 0; i < MGB4_VOUT_DEVICES; i++)
+		if (mgbdev->vout[i])
+			rv |= mgb4_vout_suspend(mgbdev->vout[i]);
+
+	xdma_disable_user_irq(mgbdev->xdev,
+			      xdma_get_user_irq(mgbdev->xdev, XDMA_IRQ_SPI));
+	xdma_disable_user_irq(mgbdev->xdev,
+			      xdma_get_user_irq(mgbdev->xdev, XDMA_IRQ_I2C));
+
+	return rv ? -EIO : 0;
+}
+
+static int mgb4_resume(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct mgb4_dev *mgbdev = pci_get_drvdata(pdev);
+	int i, rv = 0;
+
+	xdma_enable_user_irq(mgbdev->xdev,
+			     xdma_get_user_irq(mgbdev->xdev, XDMA_IRQ_SPI));
+	xdma_enable_user_irq(mgbdev->xdev,
+			     xdma_get_user_irq(mgbdev->xdev, XDMA_IRQ_I2C));
+
+	for (i = 0; i < MGB4_VIN_DEVICES; i++)
+		if (mgbdev->vin[i])
+			rv |= mgb4_vin_resume(mgbdev->vin[i]);
+	for (i = 0; i < MGB4_VOUT_DEVICES; i++)
+		if (mgbdev->vout[i])
+			rv |= mgb4_vout_resume(mgbdev->vout[i]);
+
+	return rv ? -EIO : 0;
+}
+
 static const struct pci_device_id mgb4_pci_ids[] = {
 	{ PCI_DEVICE(DIGITEQ_VID, T100_DID) },
 	{ PCI_DEVICE(DIGITEQ_VID, T200_DID) },
@@ -700,11 +741,14 @@ static const struct pci_device_id mgb4_pci_ids[] = {
 };
 MODULE_DEVICE_TABLE(pci, mgb4_pci_ids);
 
+static DEFINE_SIMPLE_DEV_PM_OPS(mgb4_pm_ops, mgb4_suspend, mgb4_resume);
+
 static struct pci_driver mgb4_pci_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = mgb4_pci_ids,
 	.probe = mgb4_probe,
 	.remove = mgb4_remove,
+	.driver.pm = pm_sleep_ptr(&mgb4_pm_ops),
 };
 
 module_pci_driver(mgb4_pci_driver);
diff --git a/drivers/media/pci/mgb4/mgb4_i2c.c b/drivers/media/pci/mgb4/mgb4_i2c.c
index 2697b67e290e..b29f34dce606 100644
--- a/drivers/media/pci/mgb4/mgb4_i2c.c
+++ b/drivers/media/pci/mgb4/mgb4_i2c.c
@@ -124,17 +124,37 @@ s32 mgb4_i2c_mask_byte(struct mgb4_i2c_client *client, u16 reg, u8 mask, u8 val)
 }
 
 int mgb4_i2c_configure(struct mgb4_i2c_client *client,
-		       const struct mgb4_i2c_kv *values, size_t count)
+		       const struct mgb4_i2c_key *keys,
+		       const u8 *values,
+		       size_t count)
 {
 	size_t i;
 	s32 res;
 
 	for (i = 0; i < count; i++) {
-		res = mgb4_i2c_mask_byte(client, values[i].reg, values[i].mask,
-					 values[i].val);
+		res = mgb4_i2c_mask_byte(client, keys[i].reg, keys[i].mask,
+					 values[i]);
 		if (res < 0)
 			return res;
 	}
 
 	return 0;
 }
+
+int mgb4_i2c_store(struct mgb4_i2c_client *client,
+		   const struct mgb4_i2c_key *keys,
+		   u8 *values,
+		   size_t count)
+{
+	size_t i;
+	s32 res;
+
+	for (i = 0; i < count; i++) {
+		res = mgb4_i2c_read_byte(client, keys[i].reg);
+		if (res < 0)
+			return res;
+		values[i] = (u8)res;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/pci/mgb4/mgb4_i2c.h b/drivers/media/pci/mgb4/mgb4_i2c.h
index fac6a1634474..1c3624ffd6e4 100644
--- a/drivers/media/pci/mgb4/mgb4_i2c.h
+++ b/drivers/media/pci/mgb4/mgb4_i2c.h
@@ -14,10 +14,9 @@ struct mgb4_i2c_client {
 	int addr_size;
 };
 
-struct mgb4_i2c_kv {
+struct mgb4_i2c_key {
 	u16 reg;
 	u8 mask;
-	u8 val;
 };
 
 int mgb4_i2c_init(struct mgb4_i2c_client *client, struct i2c_adapter *adap,
@@ -30,6 +29,12 @@ s32 mgb4_i2c_mask_byte(struct mgb4_i2c_client *client, u16 reg, u8 mask,
 		       u8 val);
 
 int mgb4_i2c_configure(struct mgb4_i2c_client *client,
-		       const struct mgb4_i2c_kv *values, size_t count);
+		       const struct mgb4_i2c_key *keys,
+		       const u8 *values,
+		       size_t count);
+int mgb4_i2c_store(struct mgb4_i2c_client *client,
+		   const struct mgb4_i2c_key *keys,
+		   u8 *values,
+		   size_t count);
 
 #endif
diff --git a/drivers/media/pci/mgb4/mgb4_sysfs_in.c b/drivers/media/pci/mgb4/mgb4_sysfs_in.c
index 80ff05450e98..1ff3f06aac92 100644
--- a/drivers/media/pci/mgb4/mgb4_sysfs_in.c
+++ b/drivers/media/pci/mgb4/mgb4_sysfs_in.c
@@ -551,22 +551,29 @@ static ssize_t gmsl_mode_show(struct device *dev,
  * locking/queue check is not needed.
  */
 static ssize_t gmsl_mode_store(struct device *dev,
-			       struct device_attribute *attr, const char *buf,
+			       struct device_attribute *attr,
+			       const char *buf,
 			       size_t count)
 {
-	static const struct mgb4_i2c_kv G12[] = {
-		{0x01, 0x03, 0x03}, {0x300, 0x0C, 0x0C}, {0x03, 0xC0, 0xC0}};
-	static const struct mgb4_i2c_kv G6[] = {
-		{0x01, 0x03, 0x02}, {0x300, 0x0C, 0x08}, {0x03, 0xC0, 0x00}};
-	static const struct mgb4_i2c_kv G3[] = {
-		{0x01, 0x03, 0x01}, {0x300, 0x0C, 0x04}, {0x03, 0xC0, 0x00}};
-	static const struct mgb4_i2c_kv G1[] = {
-		{0x01, 0x03, 0x00}, {0x300, 0x0C, 0x00}, {0x03, 0xC0, 0x00}};
-	static const struct mgb4_i2c_kv reset[] = {
-		{0x10, 1U << 5, 1U << 5}, {0x300, 1U << 6, 1U << 6}};
-	struct video_device *vdev = to_video_device(dev);
-	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
-	const struct mgb4_i2c_kv *values;
+	static const struct mgb4_i2c_key G12_keys[] = {
+		{0x01, 0x03}, {0x300, 0x0C}, {0x03, 0xC0}};
+	static const u8 G12_values[] = {0x03, 0x0C, 0xC0};
+	static const struct mgb4_i2c_key G6_keys[] = {
+		{0x01, 0x03}, {0x300, 0x0C}, {0x03, 0xC0}};
+	static const u8 G6_values[] = {0x02, 0x08, 0x00};
+	static const struct mgb4_i2c_key G3_keys[] = {
+		{0x01, 0x03}, {0x300, 0x0C}, {0x03, 0xC0}};
+	static const u8 G3_values[] = {0x01, 0x04, 0x00};
+	static const struct mgb4_i2c_key G1_keys[] = {
+		{0x01, 0x03}, {0x300, 0x0C}, {0x03, 0xC0}};
+	static const u8 G1_values[] = {0x00, 0x00, 0x00};
+	static const struct mgb4_i2c_key reset_keys[] = {
+		{0x10, 1U << 5}, {0x300, 1U << 6}};
+	static const u8 reset_values[] = {1U << 5, 1U << 6};
+	struct video_device *vdev = to_video_device(dev);
+	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
+	const struct mgb4_i2c_key *keys;
+	const u8 *values;
 	unsigned long val;
 	int ret;
 
@@ -576,24 +583,28 @@ static ssize_t gmsl_mode_store(struct device *dev,
 
 	switch (val) {
 	case 0: /* 12Gb/s */
-		values = G12;
+		keys = G12_keys;
+		values = G12_values;
 		break;
 	case 1: /* 6Gb/s */
-		values = G6;
+		keys = G6_keys;
+		values = G6_values;
 		break;
 	case 2: /* 3Gb/s */
-		values = G3;
+		keys = G3_keys;
+		values = G3_values;
 		break;
 	case 3: /* 1.5Gb/s */
-		values = G1;
+		keys = G1_keys;
+		values = G1_values;
 		break;
 	default:
 		return -EINVAL;
 	}
 
 	mutex_lock(&vindev->mgbdev->i2c_lock);
-	ret = mgb4_i2c_configure(&vindev->deser, values, 3);
-	ret |= mgb4_i2c_configure(&vindev->deser, reset, 2);
+	ret = mgb4_i2c_configure(&vindev->deser, keys, values, 3);
+	ret |= mgb4_i2c_configure(&vindev->deser, reset_keys, reset_values, 2);
 	mutex_unlock(&vindev->mgbdev->i2c_lock);
 	if (ret < 0)
 		return -EIO;
@@ -676,15 +687,19 @@ static ssize_t gmsl_fec_show(struct device *dev, struct device_attribute *attr,
 static ssize_t gmsl_fec_store(struct device *dev, struct device_attribute *attr,
 			      const char *buf, size_t count)
 {
+	static const struct mgb4_i2c_key enable_keys[] = {
+		{0x3E0, 0x07}, {0x308, 0x01}};
+	static const u8 enable_values[] = {0x07, 0x01};
+	static const struct mgb4_i2c_key disable_keys[] = {
+		{0x3E0, 0x07}, {0x308, 0x01}};
+	static const u8 disable_values[] = {0x00, 0x00};
+	static const struct mgb4_i2c_key reset_keys[] = {
+		{0x10, 1U << 5}, {0x300, 1U << 6}};
+	static const u8 reset_values[] = {1U << 5, 1U << 6};
 	struct video_device *vdev = to_video_device(dev);
 	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
-	static const struct mgb4_i2c_kv enable[] = {
-		{0x3E0, 0x07, 0x07}, {0x308, 0x01, 0x01}};
-	static const struct mgb4_i2c_kv disable[] = {
-		{0x3E0, 0x07, 0x00}, {0x308, 0x01, 0x00}};
-	static const struct mgb4_i2c_kv reset[] = {
-		{0x10, 1U << 5, 1U << 5}, {0x300, 1U << 6, 1U << 6}};
-	const struct mgb4_i2c_kv *values;
+	const struct mgb4_i2c_key *keys;
+	const u8 *values;
 	unsigned long val;
 	int ret;
 
@@ -694,18 +709,20 @@ static ssize_t gmsl_fec_store(struct device *dev, struct device_attribute *attr,
 
 	switch (val) {
 	case 0: /* disabled */
-		values = disable;
+		keys = disable_keys;
+		values = disable_values;
 		break;
 	case 1: /* enabled */
-		values = enable;
+		keys = enable_keys;
+		values = enable_values;
 		break;
 	default:
 		return -EINVAL;
 	}
 
 	mutex_lock(&vindev->mgbdev->i2c_lock);
-	ret = mgb4_i2c_configure(&vindev->deser, values, 2);
-	ret |= mgb4_i2c_configure(&vindev->deser, reset, 2);
+	ret = mgb4_i2c_configure(&vindev->deser, keys, values, 2);
+	ret |= mgb4_i2c_configure(&vindev->deser, reset_keys, reset_values, 2);
 	mutex_unlock(&vindev->mgbdev->i2c_lock);
 	if (ret < 0)
 		return -EIO;
diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index 64b7a9b13573..ce0fd9cf4b2a 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -45,7 +45,7 @@ static const struct i2c_board_info fpdl3_deser_info[] = {
 	{I2C_BOARD_INFO("deserializer2", 0x36)},
 };
 
-static const struct i2c_board_info gmsl3_deser_info[] = {
+static const struct i2c_board_info gmsl3tp_deser_info[] = {
 	{I2C_BOARD_INFO("deserializer1", 0x4C)},
 	{I2C_BOARD_INFO("deserializer2", 0x2A)},
 };
@@ -60,26 +60,35 @@ static const struct i2c_board_info gmsl1_deser_info[] = {
 	{I2C_BOARD_INFO("deserializer2", 0x6C)},
 };
 
-static const struct mgb4_i2c_kv fpdl3_i2c[] = {
-	{0x06, 0xFF, 0x04}, {0x07, 0xFF, 0x01}, {0x45, 0xFF, 0xE8},
-	{0x49, 0xFF, 0x00}, {0x34, 0xFF, 0x00}, {0x23, 0xFF, 0x00}
+static const struct mgb4_i2c_key fpdl3_i2c_keys[] = {
+	{0x06, 0xFF}, {0x07, 0xFF}, {0x45, 0xFF}, {0x49, 0xFF},
+	{0x34, 0xFF}, {0x23, 0xFF}
 };
 
-static const struct mgb4_i2c_kv gmsl3_i2c[] = {
-	{0x01, 0x03, 0x03}, {0x300, 0x0C, 0x0C}, {0x03, 0xC0, 0xC0},
-	{0x1CE, 0x0E, 0x0E}, {0x11, 0x05, 0x00}, {0x05, 0xC0, 0x40},
-	{0x307, 0x0F, 0x00}, {0xA0, 0x03, 0x00}, {0x3E0, 0x07, 0x07},
-	{0x308, 0x01, 0x01}, {0x10, 0x20, 0x20}, {0x300, 0x40, 0x40}
+static const u8 fpdl3_i2c_values[] = {
+	0x04, 0x01, 0xE8, 0x00, 0x00, 0x00
 };
 
-static const struct mgb4_i2c_kv gmsl3c_i2c[] = {
-	{0x01, 0x03, 0x02}, {0x300, 0x0C, 0x08}, {0x03, 0xC0, 0x00},
-	{0x1CE, 0x0E, 0x0E}, {0x11, 0x05, 0x05}, {0x05, 0xC0, 0x40},
-	{0x307, 0x0F, 0x00}, {0xA0, 0x03, 0x00}, {0x3E0, 0x07, 0x00},
-	{0x308, 0x01, 0x00}, {0x10, 0x20, 0x20}, {0x300, 0x40, 0x40}
+static const struct mgb4_i2c_key gmsl3_i2c_keys[] = {
+	{0x01, 0x03}, {0x300, 0x0C}, {0x03, 0xC0}, {0x1CE, 0x0E},
+	{0x11, 0x05}, {0x05, 0xC0}, {0x307, 0x0F}, {0xA0, 0x03},
+	{0x3E0, 0x07}, {0x308, 0x01}, {0x10, 0x20}, {0x300, 0x40}
 };
 
-static const struct mgb4_i2c_kv gmsl1_i2c[] = {
+static const u8 gmsl3tp_i2c_values[] = {
+	0x03, 0x0C, 0xC0, 0x0E, 0x00, 0x40, 0x00, 0x00,
+	0x07, 0x01, 0x20, 0x40
+};
+
+static const u8 gmsl3c_i2c_values[] = {
+	0x02, 0x08, 0x00, 0x0E, 0x05, 0x40, 0x00, 0x00,
+	0x00, 0x00, 0x20, 0x40
+};
+
+static const struct mgb4_i2c_key gmsl1_i2c_keys[] = {
+};
+
+static const u8 gmsl1_i2c_values[] = {
 };
 
 static const struct v4l2_dv_timings_cap video_timings_cap = {
@@ -818,8 +827,7 @@ static irqreturn_t err_handler(int irq, void *ctx)
 static int deser_init(struct mgb4_vin_dev *vindev, int id)
 {
 	int rv, addr_size = 0;
-	size_t count = 0;
-	const struct mgb4_i2c_kv *values = NULL;
+	const u8 *values = NULL;
 	const struct i2c_board_info *info = NULL;
 	struct device *dev = &vindev->mgbdev->pdev->dev;
 
@@ -827,24 +835,28 @@ static int deser_init(struct mgb4_vin_dev *vindev, int id)
 		if (MGB4_IS_GMSL3C(vindev->mgbdev)) {
 			info = &gmsl3c_deser_info[id];
 			addr_size = 16;
-			values = gmsl3c_i2c;
-			count = ARRAY_SIZE(gmsl3c_i2c);
+			vindev->deser_regs = gmsl3_i2c_keys;
+			vindev->deser_regs_size = ARRAY_SIZE(gmsl3_i2c_keys);
+			values = gmsl3c_i2c_values;
 		} else {
-			info = &gmsl3_deser_info[id];
+			info = &gmsl3tp_deser_info[id];
 			addr_size = 16;
-			values = gmsl3_i2c;
-			count = ARRAY_SIZE(gmsl3_i2c);
+			vindev->deser_regs = gmsl3_i2c_keys;
+			vindev->deser_regs_size = ARRAY_SIZE(gmsl3_i2c_keys);
+			values = gmsl3tp_i2c_values;
 		}
 	} else if (MGB4_IS_FPDL3(vindev->mgbdev)) {
 		info = &fpdl3_deser_info[id];
 		addr_size = 8;
-		values = fpdl3_i2c;
-		count = ARRAY_SIZE(fpdl3_i2c);
+		vindev->deser_regs = fpdl3_i2c_keys;
+		vindev->deser_regs_size = ARRAY_SIZE(fpdl3_i2c_keys);
+		values = fpdl3_i2c_values;
 	} else if (MGB4_IS_GMSL1(vindev->mgbdev)) {
 		info = &gmsl1_deser_info[id];
 		addr_size = 8;
-		values = gmsl1_i2c;
-		count = ARRAY_SIZE(gmsl1_i2c);
+		vindev->deser_regs = gmsl1_i2c_keys;
+		vindev->deser_regs_size = ARRAY_SIZE(gmsl1_i2c_keys);
+		values = gmsl1_i2c_values;
 	} else {
 		return -EINVAL;
 	}
@@ -855,12 +867,19 @@ static int deser_init(struct mgb4_vin_dev *vindev, int id)
 		dev_err(dev, "failed to create deserializer\n");
 		return rv;
 	}
-	rv = mgb4_i2c_configure(&vindev->deser, values, count);
+	rv = mgb4_i2c_configure(&vindev->deser, vindev->deser_regs, values,
+				vindev->deser_regs_size);
 	if (rv < 0) {
 		dev_err(dev, "failed to configure deserializer\n");
 		goto err_i2c_dev;
 	}
 
+	vindev->pm_deser = kzalloc(vindev->deser_regs_size, GFP_KERNEL);
+	if (!vindev->pm_deser) {
+		rv = -ENOMEM;
+		goto err_i2c_dev;
+	}
+
 	return 0;
 
 err_i2c_dev:
@@ -1076,5 +1095,69 @@ void mgb4_vin_free(struct mgb4_vin_dev *vindev)
 	video_unregister_device(&vindev->vdev);
 	v4l2_device_unregister(&vindev->v4l2dev);
 
+	kfree(vindev->pm_deser);
 	kfree(vindev);
 }
+
+int mgb4_vin_suspend(struct mgb4_vin_dev *vindev)
+{
+	struct device *dev = &vindev->mgbdev->pdev->dev;
+	int err_irq = xdma_get_user_irq(vindev->mgbdev->xdev,
+					vindev->config->err_irq);
+	struct mgb4_regs *video = &vindev->mgbdev->video;
+	const struct mgb4_vin_regs *regs = &vindev->config->regs;
+	struct mgb4_vin_fpga_pm *fpga = &vindev->pm_fpga;
+
+	int rv = mgb4_i2c_store(&vindev->deser,
+				vindev->deser_regs,
+				vindev->pm_deser,
+				vindev->deser_regs_size);
+	if (rv)
+		dev_err(dev, "failed to store deserializer configuration\n");
+	else
+		xdma_disable_user_irq(vindev->mgbdev->xdev, err_irq);
+
+	fpga->config = mgb4_read_reg(video, regs->config);
+	fpga->resolution = mgb4_read_reg(video, regs->resolution);
+	fpga->frame_period = mgb4_read_reg(video, regs->frame_period);
+	fpga->sync = mgb4_read_reg(video, regs->sync);
+	fpga->pclk = mgb4_read_reg(video, regs->pclk);
+	fpga->hsync = mgb4_read_reg(video, regs->hsync);
+	fpga->vsync = mgb4_read_reg(video, regs->vsync);
+	fpga->padding = mgb4_read_reg(video, regs->padding);
+	fpga->timer = mgb4_read_reg(video, regs->timer);
+
+	return rv;
+}
+
+int mgb4_vin_resume(struct mgb4_vin_dev *vindev)
+{
+	struct device *dev = &vindev->mgbdev->pdev->dev;
+	int err_irq = xdma_get_user_irq(vindev->mgbdev->xdev,
+					vindev->config->err_irq);
+	struct mgb4_regs *video = &vindev->mgbdev->video;
+	const struct mgb4_vin_regs *regs = &vindev->config->regs;
+	struct mgb4_vin_fpga_pm *fpga = &vindev->pm_fpga;
+
+	int rv = mgb4_i2c_configure(&vindev->deser,
+				    vindev->deser_regs,
+				    vindev->pm_deser,
+				    vindev->deser_regs_size);
+	if (rv)
+		dev_err(dev, "failed to re-configure deserializer\n");
+
+	mgb4_write_reg(video, regs->config, 0x00000001);
+	mgb4_write_reg(video, regs->resolution, fpga->resolution);
+	mgb4_write_reg(video, regs->frame_period, fpga->frame_period);
+	mgb4_write_reg(video, regs->sync, fpga->sync);
+	mgb4_write_reg(video, regs->pclk, fpga->pclk);
+	mgb4_write_reg(video, regs->hsync, fpga->hsync);
+	mgb4_write_reg(video, regs->vsync, fpga->vsync);
+	mgb4_write_reg(video, regs->padding, fpga->padding);
+	mgb4_write_reg(video, regs->timer, fpga->timer);
+	mgb4_write_reg(video, regs->config, fpga->config);
+
+	xdma_enable_user_irq(vindev->mgbdev->xdev, err_irq);
+
+	return rv;
+}
diff --git a/drivers/media/pci/mgb4/mgb4_vin.h b/drivers/media/pci/mgb4/mgb4_vin.h
index 2a2c829914ce..e903df6118a2 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.h
+++ b/drivers/media/pci/mgb4/mgb4_vin.h
@@ -36,6 +36,18 @@ struct mgb4_vin_config {
 	struct mgb4_vin_regs regs;
 };
 
+struct mgb4_vin_fpga_pm {
+	u32 config;
+	u32 resolution;
+	u32 frame_period;
+	u32 sync;
+	u32 pclk;
+	u32 hsync;
+	u32 vsync;
+	u32 padding;
+	u32 timer;
+};
+
 struct mgb4_vin_dev {
 	struct mgb4_dev *mgbdev;
 	struct v4l2_device v4l2dev;
@@ -54,9 +66,14 @@ struct mgb4_vin_dev {
 	u32 padding;
 
 	struct mgb4_i2c_client deser;
+	const struct mgb4_i2c_key *deser_regs;
+	size_t deser_regs_size;
 
 	const struct mgb4_vin_config *config;
 
+	u8 *pm_deser;
+	struct mgb4_vin_fpga_pm pm_fpga;
+
 #ifdef CONFIG_DEBUG_FS
 	struct debugfs_regset32 regset;
 	struct debugfs_reg32 regs[sizeof(struct mgb4_vin_regs) / 4];
@@ -65,5 +82,7 @@ struct mgb4_vin_dev {
 
 struct mgb4_vin_dev *mgb4_vin_create(struct mgb4_dev *mgbdev, int id);
 void mgb4_vin_free(struct mgb4_vin_dev *vindev);
+int mgb4_vin_suspend(struct mgb4_vin_dev *vindev);
+int mgb4_vin_resume(struct mgb4_vin_dev *vindev);
 
 #endif
diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/mgb4/mgb4_vout.c
index 22fbc9e53819..3bfc7cca129f 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.c
+++ b/drivers/media/pci/mgb4/mgb4_vout.c
@@ -43,11 +43,19 @@ static const struct i2c_board_info gmsl1_ser_info[] = {
 	{I2C_BOARD_INFO("serializer2", 0x22)},
 };
 
-static const struct mgb4_i2c_kv fpdl3_i2c[] = {
-	{0x05, 0xFF, 0x04}, {0x06, 0xFF, 0x01}, {0xC2, 0xFF, 0x80}
+static const struct mgb4_i2c_key fpdl3_i2c_keys[] = {
+	{0x05, 0xFF}, {0x06, 0xFF}, {0xC2, 0xFF}, {0x5B, 0x03},
+	{0x4F, 0x40}
 };
 
-static const struct mgb4_i2c_kv gmsl1_i2c[] = {
+static const u8 fpdl3_i2c_values[] = {
+	0x04, 0x01, 0x80, 0x00, 0x00
+};
+
+static const struct mgb4_i2c_key gmsl1_i2c_keys[] = {
+};
+
+static const u8 gmsl1_i2c_values[] = {
 };
 
 static const struct v4l2_dv_timings_cap video_timings_cap = {
@@ -646,18 +654,19 @@ static int ser_init(struct mgb4_vout_dev *voutdev, int id)
 	struct mgb4_i2c_client *ser = &voutdev->ser;
 	struct device *dev = &voutdev->mgbdev->pdev->dev;
 	const struct i2c_board_info *info = NULL;
-	const struct mgb4_i2c_kv *values = NULL;
-	size_t count = 0;
+	const u8 *values = NULL;
 	int rv;
 
 	if (MGB4_IS_FPDL3(voutdev->mgbdev)) {
 		info = &fpdl3_ser_info[id];
-		values = fpdl3_i2c;
-		count = ARRAY_SIZE(fpdl3_i2c);
+		voutdev->ser_regs = fpdl3_i2c_keys;
+		voutdev->ser_regs_size = ARRAY_SIZE(fpdl3_i2c_keys);
+		values = fpdl3_i2c_values;
 	} else if (MGB4_IS_GMSL1(voutdev->mgbdev)) {
 		info = &gmsl1_ser_info[id];
-		values = gmsl1_i2c;
-		count = ARRAY_SIZE(gmsl1_i2c);
+		voutdev->ser_regs = gmsl1_i2c_keys;
+		voutdev->ser_regs_size = ARRAY_SIZE(gmsl1_i2c_keys);
+		values = gmsl1_i2c_values;
 	}
 
 	if (!info)
@@ -668,12 +677,19 @@ static int ser_init(struct mgb4_vout_dev *voutdev, int id)
 		dev_err(dev, "failed to create serializer\n");
 		return rv;
 	}
-	rv = mgb4_i2c_configure(ser, values, count);
+	rv = mgb4_i2c_configure(ser, voutdev->ser_regs, values,
+				voutdev->ser_regs_size);
 	if (rv < 0) {
 		dev_err(dev, "failed to configure serializer\n");
 		goto err_i2c_dev;
 	}
 
+	voutdev->pm_ser = kzalloc(voutdev->ser_regs_size, GFP_KERNEL);
+	if (!voutdev->pm_ser) {
+		rv = -ENOMEM;
+		goto err_i2c_dev;
+	}
+
 	return 0;
 
 err_i2c_dev:
@@ -869,5 +885,62 @@ void mgb4_vout_free(struct mgb4_vout_dev *voutdev)
 	video_unregister_device(&voutdev->vdev);
 	v4l2_device_unregister(&voutdev->v4l2dev);
 
+	kfree(voutdev->pm_ser);
 	kfree(voutdev);
 }
+
+int mgb4_vout_suspend(struct mgb4_vout_dev *voutdev)
+{
+	struct device *dev = &voutdev->mgbdev->pdev->dev;
+	struct mgb4_regs *video = &voutdev->mgbdev->video;
+	const struct mgb4_vout_regs *regs = &voutdev->config->regs;
+	struct mgb4_vout_fpga_pm *fpga = &voutdev->pm_fpga;
+
+	int rv = mgb4_i2c_store(&voutdev->ser,
+				voutdev->ser_regs,
+				voutdev->pm_ser,
+				voutdev->ser_regs_size);
+	if (rv < 0)
+		dev_err(dev, "failed to store serializer configuration\n");
+
+	fpga->config = mgb4_read_reg(video, regs->config);
+	fpga->resolution = mgb4_read_reg(video, regs->resolution);
+	fpga->frame_limit = mgb4_read_reg(video, regs->frame_limit);
+	fpga->hsync = mgb4_read_reg(video, regs->hsync);
+	fpga->vsync = mgb4_read_reg(video, regs->vsync);
+	fpga->padding = mgb4_read_reg(video, regs->padding);
+	fpga->timer = mgb4_read_reg(video, regs->timer);
+
+	return rv;
+}
+
+int mgb4_vout_resume(struct mgb4_vout_dev *voutdev)
+{
+	struct device *dev = &voutdev->mgbdev->pdev->dev;
+	struct mgb4_regs *video = &voutdev->mgbdev->video;
+	const struct mgb4_vout_regs *regs = &voutdev->config->regs;
+	struct mgb4_vout_fpga_pm *fpga = &voutdev->pm_fpga;
+	u32 dp;
+
+	int rv = mgb4_i2c_configure(&voutdev->ser,
+				    voutdev->ser_regs,
+				    voutdev->pm_ser,
+				    voutdev->ser_regs_size);
+	if (rv < 0)
+		dev_err(dev, "failed to re-configure serializer\n");
+
+	mgb4_write_reg(video, regs->config, 0x00000001);
+	mgb4_write_reg(video, regs->resolution, fpga->resolution);
+	mgb4_write_reg(video, regs->frame_limit, fpga->frame_limit);
+	mgb4_write_reg(video, regs->hsync, fpga->hsync);
+	mgb4_write_reg(video, regs->vsync, fpga->vsync);
+	mgb4_write_reg(video, regs->padding, fpga->padding);
+	mgb4_write_reg(video, regs->timer, fpga->timer);
+
+	dp = (fpga->config & 0x10) >> 4;
+	mgb4_cmt_set_vout_freq(voutdev, voutdev->freq >> dp);
+
+	mgb4_write_reg(video, regs->config, fpga->config);
+
+	return rv;
+}
diff --git a/drivers/media/pci/mgb4/mgb4_vout.h b/drivers/media/pci/mgb4/mgb4_vout.h
index a07eeabdcf34..dcfca32d403a 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.h
+++ b/drivers/media/pci/mgb4/mgb4_vout.h
@@ -33,6 +33,16 @@ struct mgb4_vout_config {
 	struct mgb4_vout_regs regs;
 };
 
+struct mgb4_vout_fpga_pm {
+	u32 config;
+	u32 resolution;
+	u32 frame_limit;
+	u32 hsync;
+	u32 vsync;
+	u32 padding;
+	u32 timer;
+};
+
 struct mgb4_vout_dev {
 	struct mgb4_dev *mgbdev;
 	struct v4l2_device v4l2dev;
@@ -50,9 +60,14 @@ struct mgb4_vout_dev {
 	u32 padding;
 
 	struct mgb4_i2c_client ser;
+	const struct mgb4_i2c_key *ser_regs;
+	size_t ser_regs_size;
 
 	const struct mgb4_vout_config *config;
 
+	u8 *pm_ser;
+	struct mgb4_vout_fpga_pm pm_fpga;
+
 #ifdef CONFIG_DEBUG_FS
 	struct debugfs_regset32 regset;
 	struct debugfs_reg32 regs[sizeof(struct mgb4_vout_regs) / 4];
@@ -61,5 +76,7 @@ struct mgb4_vout_dev {
 
 struct mgb4_vout_dev *mgb4_vout_create(struct mgb4_dev *mgbdev, int id);
 void mgb4_vout_free(struct mgb4_vout_dev *voutdev);
+int mgb4_vout_suspend(struct mgb4_vout_dev *voutdev);
+int mgb4_vout_resume(struct mgb4_vout_dev *voutdev);
 
 #endif

base-commit: aa0f4c41d4870a18e65772a1817af16427200371
-- 
2.56.1

