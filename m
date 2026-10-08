Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941123BCD2A
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 04:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791433600; cv=none; b=Oc1SxFN4ZKwrRqQ06B7PDtHf/74gviDMevoVGwNkedwrj/cyq9NtAplDrFlaG87dmj91WjzG8HNPwqlNmIoUhA1/mZQELFOu9Xm7OjaeJ/isa5yggcRlOP3qyOCaTRuI1w0d1MIWubgYGmlfA3bnw9jQ2pnjstNG7VB3i1vh0jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791433600; c=relaxed/simple;
	bh=uc7FwDCFIsWGH8RnnjX923HshtmpDadtAtbDtkVwZyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3j/Uskeubeyxv2+T+LOB5c6BI9Np2gBlYwFbEThV9XiLAuGe9el+uF090Hda74BE1sUZFszrZ+GGKhaE5hucCZs9yTw5GD0oOT6b+RbjsNKO51T7JO7vydp7h3PXZloswMRyiWmqwnKmVFNlN5LHQaAzFZeAnksuj5KBsGrCLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ur3VZYwZ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ur3VZYwZ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-487048857f6so2102570f8f.3
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 21:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791433597; x=1792038397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LN+4GNxYdvlisTS7smG63GBSQyoVUSWH51sQR/4O9qQ=;
        b=Ur3VZYwZXatGnRHMtnfsXL4OxQajxJkUHN+1FUX7oQKfcSbFBdkGbhP2nABvHYvpXB
         47+ebMCNL83guTFPm5+3YTqmpopWtUhDAn2Ee2Bc67hxpvUCTmt4jAD6fuKcFg0BWTW+
         TgN+vy5GQ2XMLfGLW6kPzKC2PT0J1GS14kmaWV+EYYoj/CNCiCIR6DUMirlFkeKRO8cu
         i985CIzsLc68BqLGIdcKCx/dJtZ6hSehHBMFnIFb7f5AiFMrhf8l1t0Qd4/7cB8b3Ze6
         6FEsQ2Y6RXJMWDFP2dNLrsGhJeVpFN8bzhRjmp8b7QEuAd+qXskYefWIMuPxiCv2PIDZ
         i1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791433597; x=1792038397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LN+4GNxYdvlisTS7smG63GBSQyoVUSWH51sQR/4O9qQ=;
        b=rokhMl59uj0sphhD7Nj9RUeGFe8g3zY7ArWh6SchbDmGiRFnOYoTt4+Xn7vCL29o7h
         DlnNj3xV893q30urEMng5E4IB4JytmW+LcKVEHkMjNbCQzNJ38d2tc4sBBRPlkXda4Rg
         FWwNy3yqiv/d1AgpZbedHCJsME29WyOUS44ZpQ71qX3/TSSO+F8FYa8ePXPO6NO+vRQK
         h2qzJWuQZAXpPVRpet/HpXwQO4VM7B/kRhiqwLoggQEO6tg9vjY6o2VZz1NZ7gMVANMF
         prgEB5FXsp2O3zQ35Upm4uqZcdiw5PVzQZmoIShx4XMS4l9o2sOm4aMxASTja73PfwzL
         we8g==
X-Forwarded-Encrypted: i=1; AKwUvBxNbIaFaeorACx6lD7XBzxBZkRF2GaqoierY7Y5U3uepCyS1SyN1KmVzAwbG0856X0zECAx1kxEFW50XQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kNAV96ll/0kQDwJDPfa/5sLjLwFQQ4zer0YAN9aezZnBGQmwRA
	N/8u2RoMJXHDkhHVfAfLmjvogrg+8GTH0IDV9gtAIp8q93jJ+wDgBSgr
X-Gm-Gg: AYBFou0dGjm35FUJ7t0v0ye3np4FA8UezZqFuVmoHe4ZaqBgAonaMHFOg3SZf5QlZUJ
	cM+NZZgFQzjUKMBIj0KgoIGgpub0ER0BNByE0tJKS/9CcYDhQunQIN1AKOR1SPUg22wi6svHOns
	4XChMb1wj1CQRP6zatOzkkI109IEbZh7dhARRBZWiZK5tqOQUhOnhi3F4y1CpaC/XlonhKGf9RD
	WnTOTkOyVhZcqGCxPz3uoeZRlwdjqEtPnR8pJvZPOivNsBzbbZSeltQ2UA3L0zGbOMaBMOCAxOi
	IBBSjLdFHlAjSNbcU8ueaaITa58mYVmkam4UVfZ1zXHzYMzq8yk9NiWk6TkrFeDCMtvBiUs8sZu
	muNC0BsU5DI1yhGLa92I2+wetUZSgMKLfx4PlM9Xjxz/yVtgfTrvGsq1Nab4J5e09J8qWzUH9h5
	oLRg6z2sTlV1knxztVlqduLhC5MkMhYXWl2OkLWMi0LswKa89D8FsKl3a1FO/fZdmfP6NA5hDw3
	STrZmTwK96dOrzQPVD5rzulWONKz0aVe2S0V1UsLxzoVIfSqKxixKSn8SrxmOX41uiER1zDd/2S
	Y2MCvgncjL7xVRolIaYcY/nxD4ms/9HplHWl+IT143P2LbEfM3uZ32gNkNTap608nB3Zqx9diOr
	dF499hZ7L6drd0Fi5HkUWiFR+8CjqVc/clo7/1FTIIcnl4fUgEgX63w==
X-Received: by 2002:a05:600c:3b9d:b0:4a1:7b56:1151 with SMTP id 5b1f17b1804b1-4a18044c9e0mr86451085e9.18.1791433596642;
        Wed, 07 Oct 2026 21:26:36 -0700 (PDT)
Received: from localhost.localdomain (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f486b6fsm88071375e9.1.2026.10.07.21.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 21:26:35 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] media: v4l2-subdev: Fix NULL pointer dereference in subdev_open()
Date: Thu,  8 Oct 2026 06:25:59 +0200
Message-ID: <20261008042600.275884-2-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008042600.275884-1-nicfio@gmail.com>
References: <20261008042600.275884-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unbinding a driver while something opens a /dev/v4l-subdevN node oopses
the kernel:

  BUG: kernel NULL pointer dereference, address: 0000000000000008
  RIP: 0010:subdev_open+0x8a/0x190 [videodev]
  Call Trace:
   v4l2_open+0xa9/0x100 [videodev]
   chrdev_open+0xb2/0x230
   do_dentry_open+0x14c/0x440
   vfs_open+0x2e/0xe0
   path_openat+0x82e/0x12d0
   do_filp_open+0xc4/0x170
   do_sys_openat2+0xae/0xe0
   __x64_sys_openat+0x55/0xa0

v4l2_device_unregister_subdev() clears sd->v4l2_dev, then unregisters
the media entity, which clears sd->entity.graph_obj.mdev, and only then
unregisters the device node. Drivers that call media_device_unregister()
before v4l2_device_unregister(), as vimc does, clear
sd->entity.graph_obj.mdev even earlier, while the sub-device nodes are
still registered. subdev_open() dereferences both pointers. v4l2_open()
has checked that the node is registered, but it drops videodev_lock
before calling fops->open(), so the whole unregistration can run in
between. Reordering v4l2_device_unregister_subdev() would not help in
the second case, and checking the two pointers in subdev_open() would
only narrow the window.

Neither pointer is needed in subdev_open(). Both record that the
sub-device is registered, and are cleared on purpose when it goes away,
while open() runs on behalf of the device node. The node has its own
pointer to the same v4l2_device, vdev->v4l2_dev, which is set when the
node is registered and never cleared, and the V4L2 core already relies
on it for as long as the node exists: v4l2_release() dereferences it on
every close. The sub-device's entity is registered with
vdev->v4l2_dev->mdev, so that is also the media device to take the
module reference through.

That reference goes through mdev->dev->driver, which the driver core
clears once the media device's own driver has been unbound, as when
syzbot unbinds vimc. Read it once with READ_ONCE(), as
dev_driver_string() does, and fail the open with -ENODEV if it is gone:
unbinding does not unload the module, so the pointer read is either
still valid or NULL.

With this, subdev_open() no longer reads a pointer that the V4L2 core or
the driver core clears when a driver is unbound. It can still run on a
sub-device that has just been unregistered, exactly like a file handle
opened an instant earlier. The lifetime of the sub-device and of the
media device when a driver goes away with file handles open, and module
unloading, are a separate, known limitation that this does not address.

Reproduced on a CHUWI Hi10 X1 (Alder Lake-N, IPU6) running 6.12.86, at
cycle 7 of a loop unbinding and rebinding a sensor while four processes
opened every /dev/v4l-subdev*. syzbot hit the second dereference on the
same line by unbinding vimc, and so does a test in QEMU with KASAN that
opens vimc's sub-device nodes while vimc is unbound and rebound; with
this patch the same test shows no oops, KASAN report or warning.

Reported-by: syzbot+74de6401dbdd377b5746@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=74de6401dbdd377b5746
Fixes: 61f5db549dde ("[media] v4l: Make v4l2_subdev inherit from media_entity")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a07d77e58..c56ca328f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -96,6 +96,7 @@ static int subdev_open(struct file *file)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
+	struct media_device *mdev = vdev->v4l2_dev->mdev;
 	struct v4l2_subdev_fh *subdev_fh;
 	int ret;
 
@@ -112,10 +113,17 @@ static int subdev_open(struct file *file)
 	v4l2_fh_init(&subdev_fh->vfh, vdev);
 	v4l2_fh_add(&subdev_fh->vfh, file);
 
-	if (sd->v4l2_dev->mdev && sd->entity.graph_obj.mdev->dev) {
+	if (mdev && mdev->dev) {
+		struct device_driver *drv = READ_ONCE(mdev->dev->driver);
 		struct module *owner;
 
-		owner = sd->entity.graph_obj.mdev->dev->driver->owner;
+		/* The media device's driver has been unbound meanwhile. */
+		if (!drv) {
+			ret = -ENODEV;
+			goto err;
+		}
+
+		owner = drv->owner;
 		if (!try_module_get(owner)) {
 			ret = -EBUSY;
 			goto err;
-- 
2.47.3

