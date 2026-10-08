Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5543B3887
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 04:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791433607; cv=none; b=qbzBk7mjP/hj0LN08KV81SjXx5I/HrrXdmnfoehZECgI4OQkKxDTipGK3MOt/6QyNxEc/IWFeHcjTmBivGjqF0fpCHmgiuQYeFyq5C/6VSZXBT0K36kNr4gZ76ApOtJ4KNIvP0PHywDy7C90K1b4SEE9kEUWuUiURAncEJSVrYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791433607; c=relaxed/simple;
	bh=cUv6hh3W9DWi6C990WriU1Uo7wUq9iqSOj3YbxBud9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/rsM/dJI08c8OcCHk9dXOsbhWL6YLfM0hlCK4+L2fOE6KSCknB+FVNp56RYlsYlSikqwfJrkUbXzDT9SUJAb4AqLL8HSEKZzpu9mQUbS7h4PbwWQVSVjtuhIN4eK+ZdBjBpXdzQu9QOSof1nTXzqBeLTTXqPkV3T1xaVZ/DMek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2BDqdFj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2BDqdFj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso44049035e9.2
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 21:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791433604; x=1792038404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvEa6S/dJFZJC2lyZ675Rkq41lS8wP1soF2ixtoNMag=;
        b=U2BDqdFjyq1cd1JLOJj355IoZ2cWKLkgs6pw5vrgtL3jIC9NZncGGplWgb/9o3rop/
         jO3XRZV43A8FSbXclyZ6xZQLjxGGDhxWu33f8nYIVNUSTB/am4L1j6VcV44CviQL5dP8
         M3j8fptz0dxHqGd+C2wn05m8hjMW8Pg90n9/D9Heb+FNEsMSW2k4MOU3FFKhX5SXBRJ3
         /vdNuGCveHT/mmGykEqRJqO4MhZB/17b5yL21B5e5+zt6SYKdj/gyf06YHezXeg3Nl8O
         ICfC4MyTkDuY3LuA362H6FZ6O6XkyjtIY02LeP8+pWqG6K6CW4ABKByIdOvQfHO029yT
         UpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791433604; x=1792038404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvEa6S/dJFZJC2lyZ675Rkq41lS8wP1soF2ixtoNMag=;
        b=tpmRZemh/+dPxI4u2pJ5CEKWreYcAwOGcvUc8p5dU5IxT5cs2fhfy0S9cD9Em2DhLB
         Da8Gxc9pZdtfWixZdbV+5a1oWGZjwxZ/P//mwK+VyGOyIEc1Y3Htj3CKqAGfcSScu3gT
         cDApb9fMjOGZjFXXKdYgH8GcqEEye0/ucbdt7btNH+4p+EIExXVCRlhwp8X4Dr62LuaZ
         oHuygAoe3tRJnWymvZv8JcuSVXC1jilsE5pr5HJr46zk4nOlg0/63VYouOsYYvsGiRuG
         w0cjmeTn0hwYpPCkbZAvdrhVFXh13XGfhcDeveAJ3eGVa8weAnqX6nFBVEIutK3vtCoq
         7cKg==
X-Forwarded-Encrypted: i=1; AKwUvBy3VxRr6LfdRJ9MFAtsYeM1KLK1Hp4MAJMk6E6BhH7QtgBDg9oSYh07JkhgzDfjs5xU90+a6XOJiVqvjQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nPn3VXyW9BR0LM9xZU070FXkEkxo+yQyGi1M9DyshHiLBluNwI
	Paca+B7AYhUJVueHDOLErv6VGjeYAtgUPghanakMadd1itXLgh7vEgo8
X-Gm-Gg: AYBFou015nAfZUUTqJ/AncJlKr7pTtx7rJ/B6voXcNbOsFDKypYABzLSPtegFXs9QBH
	jWTT6WKJmmxu1DeQhbA4thB4R28vN6+ERqemU9CP4m9QvOjLNsFwDCxNQA97lz+gdF6PoZiVpLW
	hOGJBuctehR6Yq1jr+wN8IWJZAFhKzTDnPjYI2b8Hy6p6/KZGe7HDi3FbMwA/p4vgrgI1Ohdw0U
	78Y5QJdJjvzW5G2W5PH6+muAesiHReDW4YRoKyEuFPB4iLjJYr+6RFkI1ytVxqL++CEmnborjhc
	hpyPSectPOjdnFYMxI3by1tKkYJCQycMoO38kzR/q1fIBcfdk4jkHDDNzNqSDj+PBsky5QZ5DlB
	LdY/Qr03q4zfrLjDTVrljgquEB9m0+rM5RA0ZJVs3Y/mVBUHlTM44VDZCzXH5F7kxNqsDAoCdok
	Zqd8ueAdy8j0lQ7J7fYnleddIGRDDVsPUtpUmLjobgyQ89sZG+I2/uA1TvvSq4cvpUkHOJGb7DB
	HOoDXeqkg02RqdskU+GysURQBh5AkSBlEmrhmFH6BbQh9AuIBuPodjRDEoTC63MnX4RZEsB+fiS
	nq5lXV+3TozHhy9iFdUqeOASkWqT6b7KbMKKqC27HbXIhz9hNJZ7hdn2/uT0mDwsZpwB4UeHtsu
	pOivhXEBr/VReaO/QIBWssy+p8XCj2vDbfqugaRFl+TTx8sB1NCK0Qg==
X-Received: by 2002:a05:600c:4fcb:b0:4a1:746e:589a with SMTP id 5b1f17b1804b1-4a18045579amr66658625e9.18.1791433603701;
        Wed, 07 Oct 2026 21:26:43 -0700 (PDT)
Received: from localhost.localdomain (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f486b6fsm88071375e9.1.2026.10.07.21.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 21:26:41 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] media: v4l2-subdev: Fix NULL pointer dereference in the EXT_CTRLS ioctls
Date: Thu,  8 Oct 2026 06:26:00 +0200
Message-ID: <20261008042600.275884-3-nicfio@gmail.com>
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

VIDIOC_G_EXT_CTRLS, VIDIOC_S_EXT_CTRLS and VIDIOC_TRY_EXT_CTRLS on a
sub-device node pass sd->v4l2_dev->mdev to the control framework.
v4l2_device_unregister_subdev() clears sd->v4l2_dev before it
unregisters the device node, and nothing serialises the
video_is_registered() checks in v4l2_ioctl() and subdev_do_ioctl_lock()
against it: sub-device nodes have no vdev->lock, and unregistration
would not take it anyway. An EXT_CTRLS ioctl on a file handle opened
before a driver is unbound can therefore dereference NULL:

  KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
  RIP: 0010:subdev_do_ioctl+0x1926/0x2550
  Call Trace:
   subdev_do_ioctl_lock+0x246/0x5c0
   video_usercopy+0x47b/0xcc0
   v4l2_ioctl+0x187/0x1f0
   __x64_sys_ioctl+0x134/0x1c0

Use vdev->v4l2_dev->mdev instead, as the previous patch does in
subdev_open(), and as the video node ioctls already do.

Found by reading the code, then reproduced in QEMU with KASAN: with the
previous patch applied, threads looping on VIDIOC_G_EXT_CTRLS on vimc's
sub-device nodes while vimc is unbound and rebound hit the oops above;
with this patch the same test shows no oops, KASAN report or warning.

Fixes: c41e9cff704a ("media: v4l2-ctrls: support g/s_ext_ctrls for requests")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index c56ca328f..1a2ae7c13 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -775,19 +775,19 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (!vfh->ctrl_handler)
 			return -ENOTTY;
 		return v4l2_g_ext_ctrls(vfh->ctrl_handler,
-					vdev, sd->v4l2_dev->mdev, arg);
+					vdev, vdev->v4l2_dev->mdev, arg);
 
 	case VIDIOC_S_EXT_CTRLS:
 		if (!vfh->ctrl_handler)
 			return -ENOTTY;
 		return v4l2_s_ext_ctrls(vfh, vfh->ctrl_handler,
-					vdev, sd->v4l2_dev->mdev, arg);
+					vdev, vdev->v4l2_dev->mdev, arg);
 
 	case VIDIOC_TRY_EXT_CTRLS:
 		if (!vfh->ctrl_handler)
 			return -ENOTTY;
 		return v4l2_try_ext_ctrls(vfh->ctrl_handler,
-					  vdev, sd->v4l2_dev->mdev, arg);
+					  vdev, vdev->v4l2_dev->mdev, arg);
 
 	case VIDIOC_DQEVENT:
 		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
-- 
2.47.3

