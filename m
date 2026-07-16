Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CE8227EA4;
	Thu, 16 Jul 2026 02:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784168996; cv=none; b=mzfVktLI+Ju3ycF2xK3kM44NADHaEEpt+93eGVuZYSmTIBltKYzvzRyT2TJQ5l3AP7evTwvLyW4eCckuvhv9ErvCJas8Y5fcvBOWEwWPFImOx+LLbs7OD8Ckss9teHqcdu3DnthRS2iHjskrfigmen410h3/vRyk8JKbxCBCS88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784168996; c=relaxed/simple;
	bh=VsUBDrpTnOCNDYawodtB33AzkBd8y8KPfHEG1Ir7Qhg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fz7UHmOoPzjDdxTPUeAwvlI62scrisytzmrWHtbKUz12aee01MPRDOECb4cALaLml2y6x/PEJ0Uod4upgT86ewHnGL62szHUtBUYGb6QLnUU9YbttJCc8DoaIsNHc7HMrX9/sQWZXq8KRC9LkLlz8Td6uuq47hIzAez2zJUYmgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KwuvMv/f; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KwuvMv/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=sA
	A5efWz8LkgBa8eXqtQTxVtLPrp6j5XpGGHWB8S2rs=; b=KwuvMv/fo0rft7RvKU
	gMoz1pU3IpiuHznKFcN14eg42LH+OAie8ZugpJRLZgdP6rWW9qulJ+rxaGcLmNf5
	zf4ghas3UQK1e8UTFZIR+D4rKfuLtHhwFvHSPdny5bvjJsG3pjMcnbrRyMRkiXso
	KZqDCF5i+xy4PYU3wW3m4dNeI=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAXbyoQQlhqFSn4HQ--.48404S2;
	Thu, 16 Jul 2026 10:29:36 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v3 2/2] media: s2255: Rename CamelCase goto labels to snake_case
Date: Thu, 16 Jul 2026 10:29:33 +0800
Message-Id: <20260716022933.168626-1-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgAXbyoQQlhqFSn4HQ--.48404S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr47Gr13tryUJw43ZF1xGrg_yoWrCr47pF
	WxWa9Ygr48Jw1fJr9xJayUW3Z8Ww48G3y5CFy2y397XryYy34kA3Wrt34xuay2krWvya17
	Ar98W3yj9rWqgFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jn6pPUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC9BBFPGpYQhCwogAA3v

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

