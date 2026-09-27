Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1647C3A1684
	for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 18:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532506; cv=none; b=lDheCE+3G2ssVhb3hzOFudZ+V12oW0aF1hjCMdEv9xk0rHb/tx3n32p9Ok1534LywRlbPhsQolmaxzLsuXYJabG3wcUYbcsizOVrVs4ooLAfwL5IPKXsFuxzKz3mSfoNCVQHenEBbunH3fZ9rPEAp/HHt2NiaPJEJhNoRfwuMsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532506; c=relaxed/simple;
	bh=WMAskwOoSPJaG6PGflXZnl/uFZqcsTJlZwP3XmFA5D4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BPk5Zghorv7jjZ0AizxdbUJiSFu0EIMMDaHs5HOB3BaxV0D6coSmhPVtzifmdM1QnVoZkhfI8XXEJ2B3dfCDsNjuzotmASFoVA5MLEJPPMyMDQk3eSuMIXcUgwEgzw759kInR628rZ3lEgd98jiQeTkSVC+pv5LSMHijMDJ0N+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S95mVt9j; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S95mVt9j"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af43c5b0cso258334666b.1
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 11:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790532503; x=1791137303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=okA5mOg4kYRrGG25qz2brfl+VKSTjiCYOxROXsfXqhc=;
        b=S95mVt9j4fB10/oLUa3cN3JPYI8Tt19qr4dUY4aQmWv5wyabNam5xRFYAOltkwRuQc
         juIohcLeYyaFXgoIjjQQ03tkFgVibqnHw/hS7bV1doAwCR/gRRbDk0P+nx1h5GDjiq4t
         qh9e42Fzwr+Lbz59nNgGHs2iHnNHfTOa22up1cFi2/4I7XAC1Grag0mkqNUKdqml6jEo
         AXZAjnEtgzaHwzZXM8t2QqDvkhgM9lbGTfv686or9I9/v1FFan5AWT6/p5DB149C4QaF
         sChkuBZ4pXfGKyPTlWFoOqTm4Fk+dcdKkICX3KQWxEQk2AVBRDrBLXKeKUtd2dYVeMqc
         loCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790532503; x=1791137303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okA5mOg4kYRrGG25qz2brfl+VKSTjiCYOxROXsfXqhc=;
        b=sEZRVLd2Fm4Jd97kyjMjbCKHgaoV8epOKKYAZLf40c+qiJfq76tw0aoRe6KzGWchcv
         exvZ7fJq1fOPEJsJ48D9BabZKVPiQWdUkR38GbFCnWEHGur2R+extzl0817FDfSSnIyc
         9RngCuP7O/opuhMXDoLRLwXn7Hrr2i3is7T9NRMHuCN2yIwfbf0BTi9fPhCn0dUxhZDl
         drc9lHQKfJtfPXJPjXIOzPqvPiiZkt8SfDR8lTnpvj/IdYGG3r0t57dX70WCmKznPOPM
         UH4gVp2ySawbnOaahr39dDxcxK8NSambxJX6Lgsew1LqRc15AlCw10yQmxvW/ge5KzWt
         nwtg==
X-Gm-Message-State: AFuF++majWaOdw8cF+EOhaX84zgTjcjILjUjR1wp2D4hukJtNqUwyKLk
	OpXIG8EnISvhzbg3mp7Ki+JV5jDwa34bCA0mVc1OAUdLInK6cMcwi2ov
X-Gm-Gg: AYBFou224n7JE1BUJof/mNxy3TqUQzL6g9Cdh4jT+p0AtluStOqswlj4OISqfpnzQv/
	sVPqAQc7bhvdpVLqo2N1KwLTnHWrxjfHSoficSaB6eafBL+oGeFEBTo8PIbZg+DZqFT0ubr3KgK
	bYsvkZAuKKZlNyc/pjx/qfFD+Kc4n1QqFpzDYB8CdfgphS5A1Un+3DW0cHOdDTG6kmJO/2wcH1p
	ryCvXtyc2RqzWY1fjlvrg2jkGHK4Ne4KDkHmCUFgXq25Z8fLPuPR3KbxRnAYVzS+bXVsQ8eGa3o
	dvxxZWQD4FIYOdYiy4NmaA+WjfPTzwwnDrcx5NTA9PrBd9v/LeRNi2cIVAJBf+RFqq36xU5sgkq
	0BGVgbzUSJ+XPEH0mhvYKUJu8S8yaI4sxQiwHxSLZ2NoIVy8ItYcALOP/GJRvKaQxZ49Mtp1ZH9
	+tGKb+HSM63G4lG2zYB/SK7uwbA80vPj+p2Z60TnbpJejxaWOzqiyRsGoJvNzy7peU0I4cR/WwZ
	FB3wlMZm1eK7MKM
X-Received: by 2002:a17:907:d08:b0:c29:d31f:7d73 with SMTP id a640c23a62f3a-c2ac238632amr981234766b.9.1790532503139;
        Sun, 27 Sep 2026 11:08:23 -0700 (PDT)
Received: from localhost.localdomain ([94.240.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd3a0424sm168206666b.70.2026.09.27.11.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:08:22 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	johan@kernel.org,
	lgs201920130244@gmail.com,
	kees@kernel.org,
	fsimonce@redhat.com,
	lkundrak@v3.sk,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>,
	syzbot+ed3ed4f52d1fb6a7367d@syzkaller.appspotmail.com
Subject: [PATCH] media: usbtv: fix use-after-free and lockdep panic on unbind
Date: Sun, 27 Sep 2026 21:07:45 +0300
Message-ID: <20260927180745.2721-1-nsvatoslav515@gmail.com>
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
 drivers/media/usb/usbtv/usbtv-core.c  | 3 ---
 drivers/media/usb/usbtv/usbtv-video.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/media/usb/usbtv/usbtv-core.c b/drivers/media/usb/usbtv/usbtv-core.c
index 4f10f6613bc4..8a68bc0aa884 100644
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
index 92bc7a2509c3..9e02038c3ff7 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -964,7 +964,4 @@ int usbtv_video_init(struct usbtv *usbtv)
 void usbtv_video_free(struct usbtv *usbtv)
 {
 	vb2_video_unregister_device(&usbtv->vdev);
-	v4l2_device_disconnect(&usbtv->v4l2_dev);
-
-	v4l2_device_put(&usbtv->v4l2_dev);
 }
-- 
2.47.3

