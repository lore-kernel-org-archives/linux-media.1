Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9710541D4EF
	for <linux-media@vger.kernel.org>; Sun, 20 Sep 2026 11:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789904407; cv=none; b=tVzPvUufGYBQKAx1+gh/SSlzEKmc/369ztQQCgS0pf3pC1GbPb+SGlJ72bvKL1ZWu2N7Udg8mttB++2I1Lq+cyRdR7No9LBNsCy05YvF53RLXy5bnXyzUgP/hvlcm0EsQAu92oIiYyNB2JzHda7Fp83+vDbFj4m/G4IV7lu6sUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789904407; c=relaxed/simple;
	bh=7B2LFEnl9mbenlcEhpsibESNW5OLpwmL7Ks/s1Yxw+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XeVQdz9wrsWtC0uiO64f27L0630+2gu84Lkovawu9bZyFEWhPsfxK5AYwy3tL4p8FEVq0W/pfHr7zES72ifNFz7efaZ8YOCQUKJE3eJGy+4e4BIT0gfEviftm4HQUaebgnZTKZUNXc8CQD+4DiQr++TKIUXy/UVk3BZczGaVcfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdyTxujG; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdyTxujG"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ceb47d55so353532a12.1
        for <linux-media@vger.kernel.org>; Sun, 20 Sep 2026 04:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789904402; x=1790509202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VB/v9xMNCgaG9X/tex87TcBN9TifdEbvdxv9dgsPxiQ=;
        b=VdyTxujGlA+AjI3BWVel1LrY52Xdm4SW/wdERhEN4pLcALfjVHOH5W3Ho2aCZJvRHH
         vgTzkWQLjX4IyVVCGoVkju1G0CSgY05ZQq6nVxqPK09qCBMlii5YMvPtOENW2D0RdjtL
         0XjeWOWUYdJqe45wCbIET58RkzCMVJpZZGzaOAgEHxxeM1JTXP5/AZf3Z+RhPlX1KMFO
         1W52n8RcRVOSycjb9pCnVN263LDQneJOWmrYrMp3TjuoG/5ZbSFi9CEnYBU1vq9Whv3Z
         zV+ilF/egsJUMeF2/U11D7mBrGl1Ya0MukgJVTwYiwkhnco1LmJbAJlWjvNWGRG9OOIE
         dJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789904402; x=1790509202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VB/v9xMNCgaG9X/tex87TcBN9TifdEbvdxv9dgsPxiQ=;
        b=WvmfDkHs9+TO4jqLvwJg6XsJT3tn57+q30GY2vjHKzAybfcmWpuysiFj6E3h4qWav9
         XL8F7lZHQgLg9WmrkvCQpWkIpd5omnh2FDagx8DeCvGuNK4twTp9PBUvaPGncCWhf1u+
         Rp9ard2mzTpR4pe9VKQMop1mlM2bbvIYCDO8pToKfV+elpjSigrQZ72PZ9fwr2phRwiL
         odamgu8ESRp8+/NeAW4eyHXt7hKPnd7Iz6Iyfpwo4Z9cG9PXu0+zPjgp3bj/JFyD5JYR
         IIkS1faAKncQdnPAdswDGky0TKMdq1yBhYCZdPNyIQLQU0qwwETK0v6OkTzfJO3UIUqy
         M5Xw==
X-Forwarded-Encrypted: i=1; AKwUvBw2Ds0ZmWsVAgD148/LaivWYq9HhN+Pkrj9UWhVNOGZxWQ0NkKSoW2F2EZu28wvOiN3uORi+Xvl7kVxYw==@vger.kernel.org
X-Gm-Message-State: AFuF++k4s4h8oi3qmwXnHC8s0e2IzR08DVYHsACOBHLBADfRuV9BqGxD
	Bj8j4d9k5/Q1HmxKye86iuXjcNNaKJk3QZZEDy8hFjxrS7gCXmwDSLMG
X-Gm-Gg: AYBFou2GupbZnlLvDtAOFPxMsRt0H+lHzpt/+4K3oqwIYrJ6dPJ5szkY/+WHqAPokm0
	uVRbLjuXFsxjRipGzoId5nN6pE5W2tPxAvsyybTAvXIeF8B5t6qeK9Tbgw4lzUdourigcpwjuB3
	2HCw0xs37+3or0poJGANkfhN1UxISxdGqq1IXxoQR6g/V+T1FubO0XwfDS1fpH7//m0kMI9tiUa
	3W46FEHSBAmL0voBoyUe+6HvGk8RUTLV7g8M6cTiVeXGZXF5GYFw/0ged3O/aNhZUCm2dH0v41X
	SRFuICrxl27ITFyzW0usnpUtui7V3kQ6HbLOFvGNYezYs0GayOBV3mI7aBTDF0+YcNIcaFpc9wD
	llGfgvUBNCGv4jTw2LnI4BvE5otDn7RBv/kj2kmMvKHbfSE1aA5u5c2MvhVcXyF1J9tOZs+oVkb
	ALO8JeR+deuEEWOkp+53mxavWicfeiFGsODFzWVzI6YzY0HYPtJ7O6bagBzQZZnb4cK1v/pv9UL
	s2HQggHSMso/g4=
X-Received: by 2002:a17:90b:2b8e:b0:39e:4c7e:bc5 with SMTP id 98e67ed59e1d1-39e5572d5a2mr7798744a91.19.1789904401672;
        Sun, 20 Sep 2026 04:40:01 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:2022:c2a9:de8:d005])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm8490548a91.0.2026.09.20.04.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 04:40:01 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: floe@butterbrot.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+eb4706daf505f9c4b547@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v1 2/2] Input: sur40 - keep device state alive until the video node is released
Date: Sun, 20 Sep 2026 18:39:49 +0700
Message-ID: <20260920113949.12726-3-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920113949.12726-1-ngocthang2710.1999@gmail.com>
References: <20260920113949.12726-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sur40_disconnect() frees the sur40_state, which embeds the video_device,
the v4l2_device and the vb2_queue, while a video node may still be open.
Closing that file afterwards touches freed memory:

  BUG: KASAN: slab-use-after-free in vb2_core_queue_release+0x12d/0x150
  Read of size 4 at addr ffff888066fa8aa8 by task v4l_id/28733
   vb2_core_queue_release+0x12d/0x150
   vb2_fop_release+0x16e/0x200
   v4l2_release+0x22c/0x350
   __fput+0x418/0xa50
  Freed by task 16811:
   kfree+0x1c5/0x650
   sur40_disconnect+0xaf/0x140

Give the v4l2_device a release callback that frees the bulk buffer and
the state, and drop the disconnect path's own reference with
v4l2_device_put(). The last closer of the node then does the freeing.
The probe error paths never open the node and keep freeing directly.

Reported-by: syzbot+eb4706daf505f9c4b547@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=eb4706daf505f9c4b547
Fixes: e831cd251fb9 ("[media] add raw video stream support for Samsung SUR40")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/input/touchscreen/sur40.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 7020bcf9b81a..efd4fe557cef 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -648,6 +648,15 @@ static int sur40_input_setup_events(struct input_dev *input_dev)
 }
 
 /* Check candidate USB interface. */
+/* Runs once the last video node reference is gone. */
+static void sur40_release(struct v4l2_device *v4l2)
+{
+	struct sur40_state *sur40 = container_of(v4l2, struct sur40_state, v4l2);
+
+	kfree(sur40->bulk_in_buffer);
+	kfree(sur40);
+}
+
 static int sur40_probe(struct usb_interface *interface,
 		       const struct usb_device_id *id)
 {
@@ -733,6 +742,7 @@ static int sur40_probe(struct usb_interface *interface,
 			"Unable to register video master device.");
 		goto err_free_buffer;
 	}
+	sur40->v4l2.release = sur40_release;
 
 	/* initialize the lock and subdevice */
 	sur40->queue = sur40_queue;
@@ -831,11 +841,10 @@ static void sur40_disconnect(struct usb_interface *interface)
 	video_unregister_device(&sur40->vdev);
 	v4l2_device_unregister(&sur40->v4l2);
 
-	kfree(sur40->bulk_in_buffer);
-	kfree(sur40);
-
 	usb_set_intfdata(interface, NULL);
 	dev_dbg(&interface->dev, "%s is now disconnected\n", DRIVER_DESC);
+
+	v4l2_device_put(&sur40->v4l2);
 }
 
 /*
-- 
2.43.0

