Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1B259B56
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 12:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597562; cv=none; b=s2fURyHU2taqPPP0gQTofx1aY/jOnmdhA1Lu4FUs29e6GhWIzZ5P5xNoRYPzvKhDoxdhsDIjGuCQa+XCbkeKAgKviBKKQ/tBodTAF+PdjzvNPjbcZ1E7lALw+LWBKUYRjbIckKCZNliUxqU9tdzD7I3D4KGwkyDga3+Z3s/OsDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597562; c=relaxed/simple;
	bh=1RLTg6xuNbSjs+Mn4U2htPWw5wZnbKunkIGvH5P2w3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mHprl3A/oLfYOM0gyu8JG6Se5UPNXTJl63Du43aV5l7hsjqU3YYrw5sDy5lnI6JDALn+bn6/w3IXB0z7PHV5vYTOy5qV0Lpq2Xy/hMxLrTknsUW7zTKbL9U/xlzXdtysRa96y5cGlP3JvI9230M1UafnR34Z27pEaeRRyQoC6ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sxk9Z3dy; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxk9Z3dy"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1450541ab18so3266165c88.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 05:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790597559; x=1791202359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+Cac6ypgXdq09Dr7ETlbYkP1qwqow9QwXrDgwFzEeM=;
        b=sxk9Z3dyR+9xblwUuRrnbZCSoDs/yLyTKIZiEB1gLAob6qOjuloVafy5fsYqr+Q8YG
         zpGopaex/zKMiBKV45zG/4rs/BS2kaDSM0z4yH5au4UwexYRWRm2jyPvrB/8Zq7Ju1TY
         mlwNqz7FmmrkVZiPo+2SAN9eUp5Zz8aG4n3uqK239aCTtIf+3b6RLUp/hKEWuVUzIKzU
         m3uxT1SQvJB/In+fUt50mo88OcvhmIqJgy78J8vezR1fOkUWv754Ets/76Gz0IWG3CBt
         6QnX34rDUIiwrxw3RHiPOZRS0Fa1p0B0MbhMjRP0DJJGTvltTLIin5FBSezVLq5L9jyF
         Zo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597559; x=1791202359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+Cac6ypgXdq09Dr7ETlbYkP1qwqow9QwXrDgwFzEeM=;
        b=JBlT8fcPnqYOrODaWq5mht/ey5Ks9oAkXYRAiLCz8lk9Ptl229yLo9Bx9/c+Zp9/ez
         gNIYhljkoSjbnln9gE793wDn9ODTeXIT8ADe7RKnnU+5UMooT2bf/RJoYlVoEkoRUVd7
         jUJM7nWcrxM2HhSOSVxWo4Niv7YSRO8jvOiFUZGHujkWMWVNH1bXTFglbLYp7cQkKS7m
         6UcaJj+mZ69vFXhLNn/1oPzO78F6CjPs6ogU0EVZrSQtqlzwe8WcHRMjyYObv0ln0mxS
         qBYtTLyj1C66xIDtn+mPd35FMbPFLU1/z1GX/ttv7SGy0IkWxm4xcTbp8huhbmUaMNL1
         7hkA==
X-Forwarded-Encrypted: i=1; AKwUvBxAic/gIbyqnZ6RcR5T+QLUwiiT7ErsVZ91GvBq7OVRyTKnTtKG2JIHhhKW+KPHVMPs7NYexfZx9UhL3w==@vger.kernel.org
X-Gm-Message-State: AFuF++mw1kxGTzEonRtFHQ47RuqdpUUSyB+4gv+uqO/wuWFjC+8NV4ZQ
	5zIG9PWkawdbA/hV0IQQIPOLdTrWlLtt788S/uS231aUiB/WYpWi3LTZ
X-Gm-Gg: AYBFou1tEkaBBrhmTScrY8gd66gSe4BhFw3e11JCWsCl6CgKY1AdPTNuzyRe1R6zinZ
	ki9FQiWZG1oWZ3wlhgYK9YLuU9DmjJUIfrZHCAWTBDB4Of4GmG0u4oVi2rYzWOCO8CjIq8NTtOt
	AQnx90gmYHOviA++Z7Z5X3kAKcj1oQZzw2klrxfqTDSqr+FSrjps9wKMlwB9VAxpVT9jTIY9ME3
	BQbepmfxkLkSUk+2WvLq+jtQn5AZccJnwuPtjJJL4O5EHGHgrxGyhTItzBe/298jLJXy3/C0oph
	uvECcFbijuyWw6XaSInuB4Ze0yByoGDFyAvSGzGcj63Xgeczgm+XzmvnABvb93UC33+p44X8Xfk
	X1CNTxMsJiw7Df0YlsObl0pKOPUQdQgd4Uj+/jtCUHTVfOz6OF7Vp6oCrJRj+wXEjlPZkYfFacA
	hbLEeAPnF8bNvbPq1twFExz9xIlzX2W1+FNUQa5vACUwMFq1CJdpDvWd2GkVo71RjoT4zt/iEXu
	JQaOgIPkA0NJb4SAO9DME3ChtlhM7Y+B5MWM/jnTBvX
X-Received: by 2002:a05:701b:241a:b0:13f:c85d:17bb with SMTP id a92af1059eb24-146ce1a8af3mr9531539c88.1.1790597558447;
        Mon, 28 Sep 2026 05:12:38 -0700 (PDT)
Received: from deepanshu.. ([2405:201:682f:383f:205:7fbb:c742:e03c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adbcd1bcsm33021156c88.14.2026.09.28.05.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:12:37 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: sean@mess.org,
	mchehab@kernel.org
Cc: jarod@redhat.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Subject: [PATCH v2] media: imon: fix use-after-free in display_close via dev_dbg
Date: Mon, 28 Sep 2026 17:42:30 +0530
Message-Id: <20260928121230.35359-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ictx->dev is a raw pointer to the usb_interface's embedded device,
cached in imon_init_intf0() without taking a reference. On
disconnect, usb_disconnect() can drop the last reference on the
interface and free it while a userspace fd for /dev/lcd0 is still
open. When that fd is later closed, display_close() dereferences
the now-freed ictx->dev via dev_dbg(), causing a use-after-free.

Fix by pinning the device with get_device() when ictx->dev is
assigned, and releasing it with put_device() when ictx is freed.

Also drop the dev_dbg() in free_imon_context(), which only printed
a debug message and is no longer needed.

Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
Reported-by: syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9bfac891bdd42eb708fc
Link: http://lore.kernel.org/all/20260918054851.26083-1-kartikey406@gmail.com/T/ [v1]
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
v2:
- Remove the dev_dbg() in free_imon_context(), as suggested by
  Sean Young.
---
 drivers/media/rc/imon.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 049a73b5f882..562a70186db4 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -501,7 +501,7 @@ static void free_imon_context(struct imon_context *ictx)
 	usb_free_urb(ictx->rx_urb_intf1);
 	kfree_rcu(ictx, rcu);
 
-	dev_dbg(dev, "%s: iMON context freed\n", __func__);
+	put_device(dev);
 }
 
 /*
@@ -2253,7 +2253,7 @@ static struct imon_context *imon_init_intf0(struct usb_interface *intf,
 
 	mutex_lock(&ictx->lock);
 
-	ictx->dev = dev;
+	ictx->dev = get_device(dev);
 	ictx->usbdev_intf0 = interface_to_usbdev(intf);
 	ictx->rx_urb_intf0 = rx_urb;
 	ictx->tx_urb = tx_urb;
@@ -2314,6 +2314,7 @@ static struct imon_context *imon_init_intf0(struct usb_interface *intf,
 find_endpoint_failed:
 	mutex_unlock(&ictx->lock);
 	usb_free_urb(tx_urb);
+	put_device(ictx->dev);
 tx_urb_alloc_failed:
 	usb_free_urb(rx_urb);
 rx_urb_alloc_failed:
-- 
2.34.1

