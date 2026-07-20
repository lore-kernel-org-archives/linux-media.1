Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82C42E7371;
	Mon, 20 Jul 2026 02:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516115; cv=none; b=QxcPvEruLw1ZFNNu4/OZJG+cC19g4RttNv4tI/tRcF87j8PRb8wXbv2aIhz7naXCwoEz6kThKWksEbcNY6H5j6hn/f3EkXd7cIX8QW3dJET4KJxEkhF4w/UyNDTqGq5aCB2LJLLn6fj03EbqLEdChd8WXUenIswtvsbAyuXy5vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516115; c=relaxed/simple;
	bh=VsUBDrpTnOCNDYawodtB33AzkBd8y8KPfHEG1Ir7Qhg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mLXvXxdnG0AvFhOriSpjVxlzaRtPxn3l4N5nGvX+iSBFYmzDqpBaS5cFyDVWBglI8YGRDIDYoMzVsmimvhBqCsRc5OQXsHYV6mbYHAPlCwLmXQ0dDYPFpRbl6U3bxR5/Eg3y4F2tLnYcDS/WiZLvVKwa8aDsX9rK5CklQpHIWzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ntU2adcn; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ntU2adcn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=sA
	A5efWz8LkgBa8eXqtQTxVtLPrp6j5XpGGHWB8S2rs=; b=ntU2adcnsIwpxE3FoW
	WekujSbuOIFbnWrjKSUJDfv+ydG31KgR8rthc3wUc/eN6jnD2yV1CceDaFE36elj
	9xD827+hw2rUZk5hU3X1LkxyN5AKipqf7/WDDyejBeW/a6pUvtw5oujKT5wEXO2Z
	qaSJnFJog2FADw/9poUdvLtdE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3v5rwjV1qaGtIJQ--.123S3;
	Mon, 20 Jul 2026 10:54:46 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v2 01/17] media: s2255: Rename CamelCase goto labels to snake_case
Date: Mon, 20 Jul 2026 10:54:30 +0800
Message-Id: <20260720025438.207149-2-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260720025438.207149-1-huanglei814@163.com>
References: <20260720025438.207149-1-huanglei814@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v5rwjV1qaGtIJQ--.123S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr47Gr13tryUJw43ZF1xGrg_yoWrCr47pF
	WxWa9Ygr48Jw1fJr9xJayUW3Z8Ww48G3y5CFy2y397XryYy34kA3Wrt34xuay2krWvya17
	Ar98W3yj9rWqgFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzXdUUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC8xaSiWpdjfbNqQAA3W

From: Lei Huang <huanglei@kylinos.cn>

Rename the error-path goto labels in s2255_probe() from CamelCase to
snake_case to comply with the Linux kernel coding style:

  errorBOARDINIT -> err_boardinit
  errorFWMARKER  -> err_fwmarker
  errorREQFW     -> err_reqfw
  errorFWDATA2   -> err_fwdata2
  errorFWURB     -> err_fwurb
  errorEP        -> err_ep
  errorUDEV      -> err_udev
  errorFWDATA1   -> err_fwdata1

No functional changes; all label definitions and goto references are
updated consistently.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 38 +++++++++++++++---------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 3917913c3b47..64140b780e63 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -2216,14 +2216,14 @@ static int s2255_probe(struct usb_interface *interface,
 	dev->cmdbuf = kzalloc(S2255_CMDBUF_SIZE, GFP_KERNEL);
 	if (dev->cmdbuf == NULL) {
 		s2255_dev_err(&interface->dev, "out of memory\n");
-		goto errorFWDATA1;
+		goto err_fwdata1;
 	}
 
 	refcount_set(&dev->num_channels, 0);
 	dev->pid = id->idProduct;
 	dev->fw_data = kzalloc_obj(struct s2255_fw);
 	if (!dev->fw_data)
-		goto errorFWDATA1;
+		goto err_fwdata1;
 	mutex_init(&dev->lock);
 	mutex_init(&dev->cmdlock);
 	/* grab usb_device and save it */
@@ -2231,7 +2231,7 @@ static int s2255_probe(struct usb_interface *interface,
 	if (dev->udev == NULL) {
 		dev_err(&interface->dev, "null usb device\n");
 		retval = -ENODEV;
-		goto errorUDEV;
+		goto err_udev;
 	}
 	dev_dbg(&interface->dev, "dev: %p, udev %p interface %p\n",
 		dev, dev->udev, interface);
@@ -2243,7 +2243,7 @@ static int s2255_probe(struct usb_interface *interface,
 
 	if (usb_find_bulk_in_endpoint(iface_desc, &endpoint)) {
 		dev_err(&interface->dev, "Could not find bulk-in endpoint\n");
-		goto errorEP;
+		goto err_ep;
 	}
 
 	dev->read_endpoint = endpoint->bEndpointAddress;
@@ -2262,32 +2262,32 @@ static int s2255_probe(struct usb_interface *interface,
 
 	dev->fw_data->fw_urb = usb_alloc_urb(0, GFP_KERNEL);
 	if (!dev->fw_data->fw_urb)
-		goto errorFWURB;
+		goto err_fwurb;
 
 	dev->fw_data->pfw_data = kzalloc(CHUNK_SIZE, GFP_KERNEL);
 	if (!dev->fw_data->pfw_data) {
 		dev_err(&interface->dev, "out of memory!\n");
-		goto errorFWDATA2;
+		goto err_fwdata2;
 	}
 	/* load the first chunk */
 	if (request_firmware(&dev->fw_data->fw,
 			     FIRMWARE_FILE_NAME, &dev->udev->dev)) {
 		dev_err(&interface->dev, "sensoray 2255 failed to get firmware\n");
-		goto errorREQFW;
+		goto err_reqfw;
 	}
 	/* check the firmware is valid */
 	fw_size = dev->fw_data->fw->size;
 	if (fw_size < 8) {
 		dev_err(&interface->dev, "Firmware invalid: too small.\n");
 		retval = -ENODEV;
-		goto errorFWMARKER;
+		goto err_fwmarker;
 	}
 	pdata = (__le32 *) &dev->fw_data->fw->data[fw_size - 8];
 
 	if (*pdata != S2255_FW_MARKER) {
 		dev_err(&interface->dev, "Firmware invalid.\n");
 		retval = -ENODEV;
-		goto errorFWMARKER;
+		goto err_fwmarker;
 	} else {
 		/* make sure firmware is the latest */
 		__le32 *pRel;
@@ -2305,30 +2305,30 @@ static int s2255_probe(struct usb_interface *interface,
 	/* load 2255 board specific */
 	retval = s2255_board_init(dev);
 	if (retval)
-		goto errorBOARDINIT;
+		goto err_boardinit;
 	s2255_fwload_start(dev);
 	/* loads v4l specific */
 	retval = s2255_probe_v4l(dev);
 	if (retval)
-		goto errorBOARDINIT;
+		goto err_boardinit;
 	dev_info(&interface->dev, "Sensoray 2255 detected\n");
 	return 0;
-errorBOARDINIT:
+err_boardinit:
 	s2255_board_shutdown(dev);
-errorFWMARKER:
+err_fwmarker:
 	release_firmware(dev->fw_data->fw);
-errorREQFW:
+err_reqfw:
 	kfree(dev->fw_data->pfw_data);
-errorFWDATA2:
+err_fwdata2:
 	usb_free_urb(dev->fw_data->fw_urb);
-errorFWURB:
+err_fwurb:
 	timer_shutdown_sync(&dev->timer);
-errorEP:
+err_ep:
 	usb_put_dev(dev->udev);
-errorUDEV:
+err_udev:
 	kfree(dev->fw_data);
 	mutex_destroy(&dev->lock);
-errorFWDATA1:
+err_fwdata1:
 	kfree(dev->cmdbuf);
 	kfree(dev);
 	pr_warn("Sensoray 2255 driver load failed: 0x%x\n", retval);
-- 
2.25.1

