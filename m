Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6FA382360;
	Thu,  5 Mar 2026 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707169; cv=none; b=oNeZ0lohIDIbs7BEw00X1W7updebMoB8ZAf+X8bSyW5iqQagaZanThvCDFTDUrS26R5/SFRCM0mVqSRFa3qqRjJXVSc76I3pXPI8RQPrTZPbKqeeL1KNGAK1vCJo8GUqwS5F8Mme4jImOb9GKlO6JN9AcaI+9PNTTtNCBB0JyXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707169; c=relaxed/simple;
	bh=iHepo1Ohl1x8M46tJxVZJc4lcSZlaOA5mD8tdAIuhxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUdtU7pICdFPv2ONrRksNl85eKP1pVFFIJXDmDXVIas9+MGYJetrE2dSvoJyBqLnCVcEMY4jAZvkgLY3e58OraMqXIPXcxypn743AK+skyvpPLh3BndDnJIMTyILuUgXTUa9SiRf86xitRz8xuNjNFm1uAPuc1qLdVgLHngQ1z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eev+W6LC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eev+W6LC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277B9C2BCB0;
	Thu,  5 Mar 2026 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772707169;
	bh=iHepo1Ohl1x8M46tJxVZJc4lcSZlaOA5mD8tdAIuhxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eev+W6LCV0uSfv785AaWz41fUjMC659NfvdWfoPBe0bRS3Wk7LMgYWFtzbXxF/NKQ
	 NnQvHS6UzaeHO/Y23DhygnWucu+Ma77d+Dw4wHClJoeDacTbG1LuGBSdX82PDLdO5k
	 Ja8khRSVE1Xf3vZ1s6qA3XVUFvyYVvBHx98JqQ7x+gmAR+fPWxDswCC4S6cKKPkaUd
	 cKqzDwJjF8+Ug57vjNR+UwIjrno/EncT2/pDO0fa6b8/YoSfwjhPQ04lr+5YDaCWhP
	 BT97eSRG81ZBy2k44mkcAFdjIFLeZu2i0m8cby0vDvizZEpm40oTlxQNBDM6k7GUmZ
	 GYMr1UazoLlxA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy674-0000000043Q-3dGC;
	Thu, 05 Mar 2026 11:39:26 +0100
From: Johan Hovold <johan@kernel.org>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/4] media: imon: drop redundant device references
Date: Thu,  5 Mar 2026 11:39:16 +0100
Message-ID: <20260305103919.15560-2-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305103919.15560-1-johan@kernel.org>
References: <20260305103919.15560-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver core holds a reference to the USB interface and its parent USB
device while the interface is bound to a driver and there is no need to
take additional references unless the structures are needed after
disconnect.

Drop the redundant device references to reduce cargo culting, make it
easier to spot drivers where extra references are needed, and reduce the
risk of memory leaks when drivers fail to release them.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/rc/imon.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 7e92161105d5..ecea0085d411 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -2250,7 +2250,7 @@ static struct imon_context *imon_init_intf0(struct usb_interface *intf,
 	mutex_lock(&ictx->lock);
 
 	ictx->dev = dev;
-	ictx->usbdev_intf0 = usb_get_dev(interface_to_usbdev(intf));
+	ictx->usbdev_intf0 = interface_to_usbdev(intf);
 	ictx->rx_urb_intf0 = rx_urb;
 	ictx->tx_urb = tx_urb;
 	ictx->rf_device = false;
@@ -2308,7 +2308,6 @@ static struct imon_context *imon_init_intf0(struct usb_interface *intf,
 	usb_kill_urb(ictx->rx_urb_intf0);
 urb_submit_failed:
 find_endpoint_failed:
-	usb_put_dev(ictx->usbdev_intf0);
 	mutex_unlock(&ictx->lock);
 	usb_free_urb(tx_urb);
 tx_urb_alloc_failed:
@@ -2338,7 +2337,7 @@ static struct imon_context *imon_init_intf1(struct usb_interface *intf,
 		timer_setup(&ictx->ttimer, imon_touch_display_timeout, 0);
 	}
 
-	ictx->usbdev_intf1 = usb_get_dev(interface_to_usbdev(intf));
+	ictx->usbdev_intf1 = interface_to_usbdev(intf);
 	ictx->rx_urb_intf1 = rx_urb;
 
 	ret = -ENODEV;
@@ -2377,7 +2376,6 @@ static struct imon_context *imon_init_intf1(struct usb_interface *intf,
 		input_unregister_device(ictx->touch);
 touch_setup_failed:
 find_endpoint_failed:
-	usb_put_dev(ictx->usbdev_intf1);
 	ictx->usbdev_intf1 = NULL;
 	mutex_unlock(&ictx->lock);
 	usb_free_urb(rx_urb);
@@ -2426,7 +2424,7 @@ static int imon_probe(struct usb_interface *interface,
 	struct imon_context *ictx = NULL;
 	u16 vendor, product;
 
-	usbdev     = usb_get_dev(interface_to_usbdev(interface));
+	usbdev     = interface_to_usbdev(interface);
 	iface_desc = interface->cur_altsetting;
 	ifnum      = iface_desc->desc.bInterfaceNumber;
 	vendor     = le16_to_cpu(usbdev->descriptor.idVendor);
@@ -2495,12 +2493,9 @@ static int imon_probe(struct usb_interface *interface,
 		 vendor, product, ifnum,
 		 usbdev->bus->busnum, usbdev->devnum);
 
-	usb_put_dev(usbdev);
-
 	return 0;
 
 fail:
-	usb_put_dev(usbdev);
 	dev_err(dev, "unable to register, err %d\n", ret);
 
 	return ret;
@@ -2550,7 +2545,6 @@ static void imon_disconnect(struct usb_interface *interface)
 			else if (ictx->display_type == IMON_DISPLAY_TYPE_VFD)
 				usb_deregister_dev(interface, &imon_vfd_class);
 		}
-		usb_put_dev(ictx->usbdev_intf0);
 	} else {
 		ictx->dev_present_intf1 = false;
 		usb_kill_urb(ictx->rx_urb_intf1);
@@ -2558,7 +2552,6 @@ static void imon_disconnect(struct usb_interface *interface)
 			timer_delete_sync(&ictx->ttimer);
 			input_unregister_device(ictx->touch);
 		}
-		usb_put_dev(ictx->usbdev_intf1);
 	}
 
 	if (refcount_dec_and_test(&ictx->users))
-- 
2.52.0

