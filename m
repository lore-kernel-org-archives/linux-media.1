Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3C23B71B6
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762442; cv=none; b=ZleNUHF3S/kH0dk+hU8l+z2VjZGmVjsT/tz4WSVTrByXvfnTFv+l6pgyDoI2WBSxZm5uZKjc9vfBPjzS1XF4Aog8xBC/ozHZz6DzZE04pK2S8dswHp0/O7dPFxU+zcpc9/WDi0taqZpQ8utAcY3BD1SeUPeKI/KXiUuy3jT7UI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762442; c=relaxed/simple;
	bh=pm+UitRBOGfKG54X+0W3itQFEz1WkU9YjmSk9yn03+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dncAzXdDImjFC3b7naHjjWgeRTKgIzhHp0hTa4ASg/YunMiTIhV6+w3mxpkMSFC3YUZCChStCgSjXDCmmJXLypAZ+/CEierYUcObFm7AEKohy0e0nQYaRT4Sj8iajilZ93zflKg2q21vGz0p+nyEp24pmzAFDA4GWza0bgWYqew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfKFpiIS; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfKFpiIS"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e17e5de00so113285466b.3
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 03:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790762439; x=1791367239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QgnMCUr5ATcF80ey7meAMPkqM75woYMa14Sfi0A0LQE=;
        b=OfKFpiISZR+C2wDF6Cc0ZG6KzmpJiw49ZtgL+YywGEg+2J6SND9BXE5srsPLvYUfyh
         jd8gvbV/b0IOnTsfDzd4epB7qaNJSlT/CVVtFphXWKvqQ0fAxotRdkTlmmKqPNbAMeXR
         2GtqVSRS6CD3DiDDsu5gGl0etwS14P4Ld6yFGqcLk//hHZB00PCp3gKF2+/ogZ5QzeHQ
         B/hVcW7qhUmn6ZfCx8H+4Sg8UWC0zpvSB9fi9wvPEV8CDwLbAa5JrbicWj0PAjfNibqg
         re5bhKKOGfwIKLr9c72FtZIn7jMsIwQE2aQCCQAWGtwTai3MVgXDgO0la0Pifc01jVWy
         8KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790762439; x=1791367239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgnMCUr5ATcF80ey7meAMPkqM75woYMa14Sfi0A0LQE=;
        b=WaAjxi7g73nXHrywRPxmEbhAUioY/MKvjHnqMOepFYqQesXpvHqQWCQSScWO6Nkimr
         Ys82HJIGp1wx3JvmMKfWhDnNzp8r52Cg0mZDyn5Xgr5gQ3iXOyamIbaAPohKqFnpRPCp
         YHZaaMYUfQXxU0sHHHgm+R5fQd2baiR+qL1RdD6qc0ByJtlZEH1ImyT04/T5if0xpLoJ
         l+R9LTA+E2XrvUisyjTMMp4x0+JkTkuGJ07qK+eQ6otbdG9pF1/Zy/h5/OqHi5KlQ/HD
         JgVquncfOmAaqXvc4e/1VSDaK2KpSVmhB+9MCreNuV3/iMPUp5m5Z3pL6p4OmsNam+LX
         m5hw==
X-Gm-Message-State: AFuF++n6lm5eXPAxmZfjsPJ+gxmnbh+MHFbEsbFtkHYNzEw1cYc6ngrW
	azQLlNT/UoLc5abflISWbLNj1a0aqW+BMeCuVshD5CxUC/MUyVqmBJ6v
X-Gm-Gg: AYBFou1vfM0ZMTn2lXVebS8WCXdfp/TJp7IBZHJ8bYEmnrqFQ796MLUZM6ZuEliK7YE
	amexYWhPAW2wEWQAAZ9T14p5MbxBPSKqqvS63VijqOqqwN1tUx8kWgB1H1eiEaF/2WsOMRGsI2b
	Bq+S/Yp1THCJ413/x3Z6UcEVujf2H9vy0r4tABNrDoJROoZFdxs20x0s+Pp+GR995hdzbAOXam2
	N3B1Pix0MpFm97EfMxi7w0w46e8p1Ib+Y/otPJU1+kviDQYgbHLjQRYSYxTHfG/6q2zislfLKqr
	8bGpRPekvQ4mwGMLrnYQuxtc+pqvr8F9RpqHYoFVWI2TNx5PR9W4wd4sq+fBG4xloCHOClYXM3g
	CodkzMA5lkX73trggVivs/rwfqA5j81AMOkzxAHw6Icm0l8Gd0TeqGNTj0DZ2Khjwcu1DMDrgxP
	8LRQGCon3lf8Qnd3weDVsNdrW4WyJNLayKCiR2D8ww8Y0/NURjlsrPVGC+F9HAEBw/wX2CVag8G
	mfsJJ6/XPPtfuXJ
X-Received: by 2002:a17:907:d25:b0:c2d:8fb:ddd5 with SMTP id a640c23a62f3a-c2e23761f56mr74453766b.5.1790762439152;
        Wed, 30 Sep 2026 03:00:39 -0700 (PDT)
Received: from localhost.localdomain ([94.240.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f7fa5dsm40170366b.43.2026.09.30.03.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:00:38 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org
Cc: linux-media@vger.kernel.org,
	nogikh@google.com,
	johan@kernel.org,
	lgs201920130244@gmail.com,
	kees@kernel.org,
	lkundrak@v3.sk,
	fsimonce@redhat.com,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>,
	syzbot+ed3ed4f52d1fb6a7367d@syzkaller.appspotmail.com
Subject: [PATCH v2] media: usbtv: fix use-after-free and lockdep panic on unbind
Date: Wed, 30 Sep 2026 13:00:00 +0300
Message-ID: <20260930100000.41652-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a usbtv device is unplugged or unbound, a lockdep panic and
use-after-free occurs in the driver core.

The sequence of events leading to the crash is:
1. device_release_driver_internal() acquires dev->mutex.
2. usbtv_disconnect() is called, which in turn calls usbtv_video_free().
3. usbtv_video_free() prematurely calls v4l2_device_disconnect() and
   v4l2_device_put().
4. This drops the final reference on the parent USB device (intf->dev),
   triggering synchronous device deletion while the USB core is still
   holding dev->mutex.
5. When the core attempts to unlock dev->mutex, it operates on freed
   memory, causing a lockdep panic.

Furthermore, usbtv_disconnect() continues to access usbtv->udev after
usbtv_video_free() returns, leading to a direct use-after-free.

Note that commit cb705f75d03e ("media: usbtv: fix null-pointer
dereference on disconnect") recently added a mutex to usbtv_video_free()
to resolve a separate issue, but left the premature v4l2_device calls
intact. Because the final reference is still dropped too early, the
lockdep panic still occurs.

Fix this by removing the manual v4l2_device_disconnect() and
v4l2_device_put() calls from usbtv_video_free(). This allows
usbtv_video_free() to safely unregister the video node without destroying
the underlying structures. The final v4l2_device_put() at the end of
usbtv_disconnect() will now correctly trigger usbtv_release()
asynchronously, safely dropping the parent device reference only after all
system locks are released.

As a result of this cleanup, the dummy v4l2_device_get() previously used
to prevent premature deletion in the usbtv_probe() error path is no longer
needed and has been removed.

Fixes: a3550ea665ac ("[media] usbtv: split core and video implementation")
Reported-by: syzbot+ed3ed4f52d1fb6a7367d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ed3ed4f52d1fb6a7367d
Tested-by: syzbot+ed3ed4f52d1fb6a7367d@syzkaller.appspotmail.com
Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
Changes in v2:
- Rebased onto media-committers/next.
- Updated commit message to clarify why commit cb705f75d03e does not 
  resolve this specific lockdep panic.

 drivers/media/usb/usbtv/usbtv-core.c  | 3 ---
 drivers/media/usb/usbtv/usbtv-video.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/media/usb/usbtv/usbtv-core.c b/drivers/media/usb/usbtv/usbtv-core.c
index 89c3424e7685..2cd982ca49bf 100644
--- a/drivers/media/usb/usbtv/usbtv-core.c
+++ b/drivers/media/usb/usbtv/usbtv-core.c
@@ -112,9 +112,6 @@ static int usbtv_probe(struct usb_interface *intf,
 	return 0;
 
 usbtv_audio_fail:
-	/* we must not free at this point */
-	v4l2_device_get(&usbtv->v4l2_dev);
-	/* this will undo the v4l2_device_get() */
 	usbtv_video_free(usbtv);
 
 usbtv_video_fail:
diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
index 2a91af8d1e30..999bce621c04 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -964,11 +964,8 @@ int usbtv_video_init(struct usbtv *usbtv)
 void usbtv_video_free(struct usbtv *usbtv)
 {
 	vb2_video_unregister_device(&usbtv->vdev);
-	v4l2_device_disconnect(&usbtv->v4l2_dev);
 
 	mutex_lock(&usbtv->v4l2_lock);
 	usbtv->udev = NULL;
 	mutex_unlock(&usbtv->v4l2_lock);
-
-	v4l2_device_put(&usbtv->v4l2_dev);
 }
-- 
2.47.3

