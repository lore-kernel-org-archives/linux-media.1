Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795380813;
	b=Ro1l8uwy9tA+rGyuPvLQm6cJDNVYKsZ/Wu9YbKuN0d+RZc+X5pcV/AhdE8l5Yidb9cc9
	 1uNPNHDuLbyIZr/Uud2cWfjxYs5ONJ2JPWFh4bXlCP66amzdwELdTfaOL6xK3Kqz22sZ/
	 VnXKxbsPLWLez54bthho+9mOSzfGxSUo+LaowVlAYXKKntszksYUWljQlQ6i4FjEAvUnG
	 X+nsdAhR5pVgDemP9HfSzrENXVGWn3rdd/B3tqXqHv0zlMDkke72RnfEiVvMASxV2v5qk
	 YTxiC6IQtvJTk7tSOSRg+VFmnOWMd3bsONnTRh/X7EPD44VRRDFaXHS95e/G9PKkTZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795380813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jCkKjGFl/FESlc4vs2SRng6oOInHAgHTvIB3dJ89NUk=;
	b=hqLnuB6cRrxGvbEYEx/iszs2TZ55DewSHtIqIb9PnFHjz+iD8if+y27M607QLVmhfUei
	 zbXnuTXmuZceFmIFPtZV4vpq/QrwOQY7O9R/T2t6ItxTD1am+aBPCkWqlZPCTFB+d+obE
	 K7JZNiMuzhplwboWqIh0vC4f9AhzZ/++0Don902Yf18FsqIbTSn3gEVFC4hfcxa25Vwdr
	 pqKgENoqDvICqinTVtSesfsGc02eFZxHVAg3PmHDR3E9L7Nq73sn/qGN2vDjXs9RlInU6
	 jhcofyzgmORrn33OXleU0Ijt2p2EM4Z+X5MkM29XuHYBQlaNKbt8W1EmJVg53yHAtfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6GzwmoP;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30AE606A31A
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 20:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A30AE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6GzwmoP
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so21272495e9.0
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 12:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795380811; x=1795985611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCkKjGFl/FESlc4vs2SRng6oOInHAgHTvIB3dJ89NUk=;
        b=R6GzwmoPbZ8PGALr9DSfhHfc85bDo/sOdAuzBt0z+ZCv+J7FlYUabjiK4MCSj4gAaD
         0DXWS4MA7hLUC+Pd2c/9LzQNkyTTrnpawv/ct5UjVxUeR8NSGXDdNqVZvEVFRMdqw6Fg
         Ks3EGKtOFzOipgT1nxgyXfjFZXi3jXKjUjA8a6hFFaPHVyVzccaef6hjGvAclbzF5nTW
         KTajbyT7KBEWxRWIeT8mYe9tkAZSFyo/p4BF2QOARmSftJHE4YBccBJQ1yu/hvb48V5f
         BUGZsm0SrbOnIGAqAzWkoKQzhxBpG4qCjyyVepBcGciGA1ff5utkMVV6XVXu9l4z1xY5
         lSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795380811; x=1795985611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jCkKjGFl/FESlc4vs2SRng6oOInHAgHTvIB3dJ89NUk=;
        b=TAVOT3o++12WxT32Z3T30cQkWiDb4CqZzBEz9uY3MQ/JCd73vN537iTymuoSGEH+6F
         NW1tbdzBiqCMk8e0VrxEKFab6Q2KEE5xWQ88tt17YZjpTi3JuaZdP6HePeco4AuGUGbc
         vvbZRnvqYzBWIP8tuRtqyrw+RBrP1N4x34aVUPwEdZw+VJgw2KyYMXwepxNHY8mk6ELL
         qxfTnRkT3ctHoBfuZQz/69oN2pnGCcCKmXXvpntzSqZoXGQg9GtzvpiwPDljwo4GpTvW
         qYj+ymdJj1Pn9v9S8/ZFP2oD9QfmLfpyfx4DZAW/TLBund1QU0y+5nO8pzKUm0Xw/Nxw
         4ShA==
X-Gm-Message-State: APuU4Z+fQWC3ed80DCBfl4MVXk1dg1/KBHfVUrImrn0CQ5dbDdN+qPws
	SXunOdJV2HbVKRjVxYpaIQUuxHry6p4b/aoXYXN53FmBjWsVR1T/D0R4
X-Gm-Gg: AZFdTZcvYr1CdfsGeFYktgpQlGXuuCdpG2544qTNCujDs2Vt4QBuQBIlT5AppvNlZ+F
	0LbLfwOZo3xVOyjyIo+wW7wNcc60JlMG3z3VjsgVroxeRLXt4kwQBd4PuPuWb4xwy8qvSk/OsgD
	b0kgIvM+vN2s6PlsIKCN725ESfTeBkhavq04A+iTdYsCUisHQa767F4OGJobXZlgt04fRaVM9Zx
	pi6k/aOR4FS8+7FbsvleiE3efHMhI3H+Y70g/WxloLE9cj5ubY5qPWzp3e3d8ymmepWGRzKgo4h
	i0JzrDekgiI54tIws37bjhiEzylQNUeRKY586SA64qmwVzT2d8le8bQlcxn7DzQEO2tjL0i1l4m
	CzaIb690lQw/2DU0XiZoVMsHwusj7odJ4NqNz+R1AjLItwty3gWhdw72giiuyRBVFrmxceHmj79
	TZMX1BBmeiw8LHikJc2iamCUXQvVb7lWqCDsmzIQdac32j+Be8Kd3YocyG4hdTjQJ9jFEmgceWs
	3UcivgRro/2xaLDdJ+X8xYEXFHzrhaXzxQTv3o3TOLfyWzgLe/cOZC0ID+T9tt2+QYifQrtCivB
	PLtRdDrssfPRs9gY9h3y9/IpTvB3CSZqyQbnvCIoxfAz5VRSnCUcPhS2
X-Received: by 2002:a05:600c:c8c:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb88820e06mr193076305e9.26.1795380810868;
        Sun, 22 Nov 2026 12:53:30 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([103.125.177.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm338371075e9.7.2026.11.22.12.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:53:30 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: [PATCH 2/2] media: em28xx: avoid dereferencing dev->intf after disconnect in em28xx_v4l2_close()
Date: Mon, 23 Nov 2026 01:50:29 +0500
Message-ID: <20261122205028.41222-4-arbabhaider649@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122205028.41222-2-arbabhaider649@gmail.com>
References: <20261122205028.41222-2-arbabhaider649@gmail.com>
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

em28xx_v4l2_close() unconditionally evaluates
interface_to_usbdev(dev->intf) at function entry, before acquiring
dev->lock and checking dev->disconnected.

If the USB device was disconnected while /dev/video0 was still open,
struct usb_interface (dev->intf) has already been freed by
usb_disable_device() -> device_release(), so closing the file handle
triggers a KASAN slab-use-after-free:

  BUG: KASAN: slab-use-after-free in em28xx_v4l2_close+0x37c/0x3a0
  Read of size 8 at addr ffff888007245890 by task test_em28xx_uaf/71
  ...
  Freed by task 10:
   kfree+0x162/0x410
   device_release+0xca/0x250
   kobject_put+0x152/0x2f0
   usb_disable_device+0x324/0x570
   usb_disconnect+0x271/0x950

Move the interface_to_usbdev(dev->intf) lookup after the
dev->disconnected check under dev->lock, right before its only user
usb_set_interface().

Tested locally in QEMU (x86_64, KASAN+UBSAN) using dummy_hcd and
raw-gadget emulating an EM2820 device across open->disconnect->close,
repeated disconnect, dual-fd open->disconnect->close, and normal
open->close->disconnect scenarios (4/4 passed, 0 KASAN reports).

Cc: stable@vger.kernel.org
Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d..854fcc897 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2503,7 +2503,6 @@ static int em28xx_v4l2_close(struct file *filp)
 	struct video_device   *vdev = video_devdata(filp);
 	struct em28xx         *dev  = video_drvdata(filp);
 	struct em28xx_v4l2    *v4l2 = dev->v4l2;
-	struct usb_device *udev = interface_to_usbdev(dev->intf);
 	int              err;
 	bool last_user;
 
@@ -2512,6 +2511,8 @@ static int em28xx_v4l2_close(struct file *filp)
 	_vb2_fop_release(filp, vdev->queue->lock);
 
 	if (last_user) {
+		struct usb_device *udev;
+
 		/* No sense to try to write to the device */
 		if (dev->disconnected)
 			goto exit;
@@ -2525,6 +2526,7 @@ static int em28xx_v4l2_close(struct file *filp)
 		/* set alternate 0 */
 		dev->alt = 0;
 		em28xx_videodbg("setting alternate 0\n");
+		udev = interface_to_usbdev(dev->intf);
 		err = usb_set_interface(udev, 0, 0);
 		if (err < 0) {
 			dev_err(&dev->intf->dev,
-- 
2.53.0

