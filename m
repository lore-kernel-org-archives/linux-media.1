Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D71D3546D0
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 13:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269469; cv=none; b=mB4IhG6tGdB7DmEgsbrxSRNZOLhVNEWkbis+qdMMclvq5i8/I0F1qI3z252XNt4zF+D/orRW7C+ll3zaOxkzZnSTsqYersWkfHFarX7mdyx/NhloHGF/u1iyCCBmWsjrj0NU7mXqHT1YtGGTcPoYMb3Qgkm+fcG/HzXIlVt7P4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269469; c=relaxed/simple;
	bh=5i/toXbbaRrnbWBeavkjd+MF3jICrCrT94X4l2SDRrE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ckCw9Ko5q8cXdpcR8m2JD9vyai7fUh0j9+0n/e0XVxnikDS7/x0kXfLnwetqPvoQoxrxhOmRC6rfaoG2jcrgYIvMpLonp36/cRN+zUaHOTPuBwQL1BpgJOF9G0y9h5p6e/vrCxACAUbzJg0ujyAr018nWLIUef9wFy8kthXLnDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3axe0vB; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3axe0vB"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8568e3ecfc3so3016736b3a.3
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 06:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788269467; x=1788874267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JmmxrMO3DsuXk29dJatWULdI5zCXuAMcw71cL28w5iE=;
        b=B3axe0vBpg28dhpVe9dDtQ+D46jj3S4GRGXGuDjX1WBiXERpjMhaSKH3/IAMF6ur2D
         DwmkGZluqOSo24nX3Ezs8F1eZ2KK3EwcpLfdyr8cWcIKuyTfS6hn/GHJ/GasOgizmVy2
         sPW4P9/YKiNykZVhbt4tXOFrVeriRMB6xL/wQW2XdEzL+kz3a0OETlH2xFOMHQri8qkl
         u3oiYRFv52DJuCvFSiM3ngK6rY2vKOTobSoyJAQdS/ftRtcCX5gbaKqRQDBNiOAAKi9q
         Mt+CD26pqAi1PvI6v2fjKXsStQOy5pFQ5Ey3O+MkITAQDOL+lQEJaQ+gmx0mhu3VFq5c
         16fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269467; x=1788874267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JmmxrMO3DsuXk29dJatWULdI5zCXuAMcw71cL28w5iE=;
        b=mAPdbHHcKauZ9xxaEZNoTyP/MopJswNqq1jh+uBMWQQdnXYEPRy7nIyQ66AL4KtYZm
         v470R0VKqv6dp7pcJrnCIc+5lC7bgI1RjaV8j1LD2jWgF5tNuM9KdcCKGqW6cQQ0jab4
         QsGgmOEVAOvfcDbNhIav3wNIcxfNFtb5OuP6vV9XF7GdCb1qXraau4EZ1ZuhXAGFE/S6
         igrLrQpKWUSSCccNFEbLTrOBDw8YNK7HVBfUxsueQpByT3iRmKZStblJZEAVtyuwv9Dg
         5CCUYTz9n3haIsKi8/z9cHIxxupiMKqsGiulEBEW3IiT8sX6R/vcrEh/4EYjIGt5BvV0
         kAJQ==
X-Gm-Message-State: AFuF++nF8iS+4egr2vrdZ47ruIAsPr1LtE6ztquL70MrWLhSI7nnaobc
	CleqxspvHA9oCfAJgcOLbzjm7bK+nRIV+QRkyBYkK3xyzFRjaXep41EF
X-Gm-Gg: AR+sD137P7BfaorT0FyHX6iBWz1Yh48pDZqjEw4CJiBHRsvJ2NRGKZcG6/se+pW7VSu
	WBmyVsRQjMxSjcydhtmkIoWwf2VwWtBi3Gm2JXJItuNtq+d5Lxd7EeWTVVIIQm/n50GulQ6o9dw
	N1ZPpgoodWSsnqe8dPhLW71Jp4xZUF/uCNadifaVdIXDTNRvxTffLNUsYpSKbiIXeWlHxKVswMS
	3H0Wppz/kUt6wObTtHZz6h1c5FLTbn+GHzUPHqVV061GOeZedPKmOY9+e/bV7/9mh3Yc4HomUFd
	/+2YweCaqZ9hvk6bm4Fe7ksQydajLeteK0+ACOgMSs05RVTyPP4H3IqGaA5Fsm687t6UcIQXktG
	HezgkVzibCh9hKEmIhKNF4VF3L5JmGQ3amo9osHBKeA8i7IJIHhk0sJCrtWg4fyl7H63Rs7Wc7g
	rO7lQ4tS8sCTHoV7VSHgOFnDW1qiRdjBl3cTrCPkd1fenpv6f1VM0r/E4JrcCsMyLdzpAxic44J
	Xizwnr7bV8MmEncsSE=
X-Received: by 2002:a05:6a00:3693:b0:845:3033:6cb7 with SMTP id d2e1a72fcca58-85b5a05e9a3mr12708774b3a.9.1788269466552;
        Tue, 01 Sep 2026 06:31:06 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:21dc:72d0:8f97:df90:f2de:21cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85be982f7dfsm1109059b3a.54.2026.09.01.06.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:31:06 -0700 (PDT)
From: ThangNN99 <ngocthang2710.1999@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ThangNN99 <ngocthang2710.1999@gmail.com>,
	syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com
Subject: [PATCH] media: as102: init mutexes before registering the dvb adapter
Date: Tue,  1 Sep 2026 20:31:00 +0700
Message-ID: <20260901133100.15692-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

as102_dvb_register() calls dvb_register_adapter() and
dvb_register_frontend() before mutex_init()'ing bus_adap.lock and
sem. Both mutexes live inside the kzalloc'd as102_dev, so until
mutex_init() runs they are all-zero, uninitialized memory.

dvb_register_frontend() makes /dev/dvb/adapterX/frontendY openable
right away, and open() reaches as102_stream_ctrl(), which locks
bus_adap.lock. Likewise, dvb_dmxdev_init() exposes as102_dev->sem to
the demux start/stop_feed callbacks well before the two
mutex_init() calls near the end of the function run. A concurrent
open() racing the tail of as102_dvb_register() can thus lock a
mutex that was never initialized: lockdep reports this as "trying
to register non-static key", and on a real contended lock it is
worse than a missing annotation, since an uninitialized mutex has
no valid wait list.

Move both mutex_init() calls to the top of the function, before the
adapter is registered, so the locks are always ready before the
device is reachable from userspace.

Reported-by: syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2a3de29133b40e8f69f3
Signed-off-by: ThangNN99 <ngocthang2710.1999@gmail.com>
---
 drivers/media/usb/as102/as102_drv.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/as102/as102_drv.c b/drivers/media/usb/as102/as102_drv.c
index 6b1d3528a0a7..5495672c0646 100644
--- a/drivers/media/usb/as102/as102_drv.c
+++ b/drivers/media/usb/as102/as102_drv.c
@@ -287,6 +287,10 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 	struct device *dev = &as102_dev->bus_adap.usb_dev->dev;
 	int ret;
 
+	/* locks must be ready before the device nodes become openable */
+	mutex_init(&as102_dev->bus_adap.lock);
+	mutex_init(&as102_dev->sem);
+
 	ret = dvb_register_adapter(&as102_dev->dvb_adap,
 			   as102_dev->name, THIS_MODULE,
 			   dev, adapter_nr);
@@ -341,12 +345,6 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 		goto efereg;
 	}
 
-	/* init bus mutex for token locking */
-	mutex_init(&as102_dev->bus_adap.lock);
-
-	/* init start / stop stream mutex */
-	mutex_init(&as102_dev->sem);
-
 	/*
 	 * try to load as102 firmware. If firmware upload failed, we'll be
 	 * able to upload it later.
-- 
2.43.0

