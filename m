Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBCB425CC6
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 10:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786532010; cv=none; b=jhQOoQiaRtbatO3ziEyf2+6Q5qMT20Q0UGp0ZxrSUYt1/vLg2LdAB+235htFBmcSouHyl9EH6IiSyOTcOc8kzTrsa9sPkYYQiVmp7RzNjCk4uhxsz3uD2/EOmSkwN8GIUmzsKNg0qVIiHjxSRw1rUyp63DlPOSmNiTgOAPmqfzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786532010; c=relaxed/simple;
	bh=Vk850nZ6nsG45RIDn4Sgo92jf2NilX70CluYj/q9p4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hTv1AvZ1HQARcvgZDEtR2XkrleJ/YqFwpbK2ybY4QFSl4c8wRYb3M1EZjkAEDxA9mjoCekaF03+XIkeXgxlHF3ZwqfxvhdO0RWBlaghFbYaMDb/9kBqXlxw34h103S1Kr6gF4xYaOP1stt+hyGYC5gcgKRkWlTZFFmDLOVIGquI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnRUIUnS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnRUIUnS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so4806295e9.2
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 03:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786532006; x=1787136806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZepWu022dhLaFNiqakPl4fWF3YzvM+iZ8Tl88qOlm90=;
        b=AnRUIUnScwNDqTYPhGdC20Y82gHBBRW7quVzN/sPjQkStkfvCseW3wNy8/9SJLIZNC
         a2EMWy8XsolgVgZvW9pR4rZl4RyHencHPH8yT8ybEvFZ+SzHfB8rUBAD5LfgU5YNqk3L
         eV5COANTYIkO3wawMiNJwk4pAf/T0ACnxwJdBZvTdHDchz6cS3mzn3Dc26hDxrS8l53S
         hQB3Spvcz9dDwLoHjedV92TU3yN3A3HD+VFVxgyuWYU5KuXDoWlJnS/ytDprH/dBuIqM
         AHzJ5f/FB+c/bLZbRYA798ZVzIZLjoBCGV7kpbdHShvxJl/XmzQN6hAIMi26opbCfKXL
         phbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786532006; x=1787136806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZepWu022dhLaFNiqakPl4fWF3YzvM+iZ8Tl88qOlm90=;
        b=A/3M9gueKHBMD2nbk4OugvipTkuYfeYKEXTFZaVOGN1zQWl0Kf9PWG5i/2hvKYdaoc
         3Va6QMYOuWTihIoPp43DONyjfXHKyd0CNfsfqk2ZMauz66omiL9GfhxfvxLmi6NsWi99
         Kap9ctSbAWwKmkkaRr1App1buc//gwi+axDNk/jNl4zp17G2/M65swRSueL5AZsSrVNZ
         e3TVdihEbZSPsjDtljhVi2kqbZEV4ymegIx4A5IUJL7CF+yN3lJH+7Z/yK3bVGF2ZJib
         z5PzmV5oIAFlGUeoJtdZNUx2xGex2hRTXAAcYlo0tQfZukTFg4YTzumZirEU4rRxzYcJ
         9CbA==
X-Gm-Message-State: AOJu0YxicdW+/VL+wVwGx0+unl7zdCh3kzXZnZemRIZkAuDpq70+q1CA
	i/fZxIuDRiQ/ynQ/7yYhJa8/ObM4RQN4a9Aij8ysIwmPkSp3pkYAaO8Actw3xEoX
X-Gm-Gg: AR+sD11zNCpeFxtRFh4QC9GvXmjJJq5rhHvCNEQ/mQEf5TR3O3231tK5W8rWFsebKRg
	QEyPc5RwIQ+i+t0HgB04mQDfW/ZchHGRXXSUFzpPP9Mn9o/wfxopOTEYGqwdoP1CuRw7W2odzoP
	ktyIkCXrhb0vix/6gx8TEGpm5zxn0GngoUTP14np2/RJx1I3EUswGYr9EsSWxvOBKQKMLk755e1
	IA0K8G3ENnwokTxKiLEIeXWexzdCcE4x+ZXktpxZ9hZPClxEGbpZkkMrskwHE1yQyV8New15t3F
	N7HyMsSFZXfpvkMKTGMQBr97reziI+KM/H3LZkMP4q2ZjD6o3iOHf6N9py2PrNEfI3DdlzWhout
	I5dJueFwanI3iyp+FJlchQAoEspbmLVFBKFdRbSDpao2rKz8scanx6+ceBtNyszMVQoGt5eZC6U
	aBDw9Th5zezN/cmyclqiO/COus9/WOtC5T3MAGcpVKl2j5nKuBLm6LnpilPgrkBdesY4c6ipiAb
	IGdqahFqh+U8Q42XwzElILVABQqOzvuX8V9UAmFFHJO0Yq9P5rbQry4/2vYmDAe3HU3Xu4KZeNt
	pkHbRPXiyH+TvtFd4Xf7v+nbJJKdQy9GAsgAMyotwn3c/uztWVempOOV1/ktzkBrOfst5N8QLxN
	kEG+KkgHElGPt03X27X2GomltMHHgnkWqAzjHuRvWQAUWEQ==
X-Received: by 2002:a05:600c:4e90:b0:495:6a50:3fb8 with SMTP id 5b1f17b1804b1-4997c0e3721mr41283045e9.1.1786532005885;
        Wed, 12 Aug 2026 03:53:25 -0700 (PDT)
Received: from localhost.localdomain (host-213-45-168-79.pool21345.interbusiness.it. [213.45.168.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c939574sm37352315e9.1.2026.08.12.03.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:53:25 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	linux-kernel@vger.kernel.org,
	Nicola Fiorillo <nicfio@gmail.com>
Subject: [PATCH 2/3] media: v4l2-subdev: Check v4l2_dev before dereferencing it in open()
Date: Wed, 12 Aug 2026 12:53:04 +0200
Message-ID: <20260812105305.32447-3-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260812105305.32447-1-nicfio@gmail.com>
References: <20260812105305.32447-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unbinding a sensor driver while something opens its /dev/v4l-subdevN node
oopses the kernel:

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

v4l2_device_unregister_subdev() clears sd->v4l2_dev, then unregisters the
media entity, and only then unregisters the device node. Until the node is
gone userspace can still open it, and subdev_open() dereferences
sd->v4l2_dev unconditionally. The faulting address is the offset of the
mdev member in struct v4l2_device.

The window is not a narrow one: media_device_unregister_entity() sleeps,
and the first oops seen here was not provoked at all, it was hit by v4l_id,
run by udev on the very node that was appearing and disappearing.

The same window leaves sd->entity.graph_obj.mdev NULL while
sd->v4l2_dev->mdev is not, and the second dereference on that line goes
through it. That one was found by reading the teardown path, not by
crashing on it; it arrived later, with commit 218bf10e39ed ("media:
v4l2-subdev: handle module refcounting here").

Unregistering the device node before clearing the pointers would narrow the
window but not close it, because v4l2_open() drops videodev_lock before it
calls fops->open() and the whole of v4l2_device_unregister_subdev() can run
in between. Check the pointers in subdev_open() instead.

Reproduced on a CHUWI Hi10 X1 (Alder Lake-N, IPU6) running 6.12.86, at
cycle 7 of a loop unbinding and rebinding a sensor while four processes
opened every /dev/v4l-subdev*. The code is unchanged in 7.2-rc7.

Fixes: 61f5db549dde ("[media] v4l: Make v4l2_subdev inherit from media_entity")
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 31 +++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e9f81b9be..2a47b9730 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -97,8 +97,19 @@ static int subdev_open(struct file *file)
 	struct video_device *vdev = video_devdata(file);
 	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
 	struct v4l2_subdev_fh *subdev_fh;
+	struct v4l2_device *v4l2_dev;
 	int ret;
 
+	/*
+	 * v4l2_device_unregister_subdev() clears sd->v4l2_dev and unregisters
+	 * the entity before it unregisters the device node, so an open() that
+	 * races with the sub-device going away lands here with those pointers
+	 * already gone.
+	 */
+	v4l2_dev = READ_ONCE(sd->v4l2_dev);
+	if (!v4l2_dev)
+		return -ENODEV;
+
 	subdev_fh = kzalloc_obj(*subdev_fh);
 	if (subdev_fh == NULL)
 		return -ENOMEM;
@@ -112,15 +123,23 @@ static int subdev_open(struct file *file)
 	v4l2_fh_init(&subdev_fh->vfh, vdev);
 	v4l2_fh_add(&subdev_fh->vfh, file);
 
-	if (sd->v4l2_dev->mdev && sd->entity.graph_obj.mdev->dev) {
-		struct module *owner;
+	if (v4l2_dev->mdev) {
+		struct media_device *mdev = READ_ONCE(sd->entity.graph_obj.mdev);
 
-		owner = sd->entity.graph_obj.mdev->dev->driver->owner;
-		if (!try_module_get(owner)) {
-			ret = -EBUSY;
+		if (!mdev) {
+			ret = -ENODEV;
 			goto err;
 		}
-		subdev_fh->owner = owner;
+
+		if (mdev->dev) {
+			struct module *owner = mdev->dev->driver->owner;
+
+			if (!try_module_get(owner)) {
+				ret = -EBUSY;
+				goto err;
+			}
+			subdev_fh->owner = owner;
+		}
 	}
 
 	if (sd->internal_ops && sd->internal_ops->open) {
-- 
2.47.3

