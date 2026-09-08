Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266E733DEFE
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 16:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885387; cv=none; b=bWsfn5vXZaFlfDnKcGoZ44ihGKLTppB1av2rhO8vKsrzSrUvKqtZnKHe8qhi0AoE/jLcFgKofA5KpLyn1/1Cn3TQlE8eEJ7rHNxGIfFhaWM1i197xkDoiO7RyssSD+mAXgzxYDAJeZm8gGApg+C7K7eAgkFH4XEFxBkZqFN+cJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885387; c=relaxed/simple;
	bh=GSanIQkhMhfYHYPmz20wXCEiCRxl4iSy0izpZfWkBjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oyOV2ThdXlC/95fn2o3SvFr01Ioagj+kheSlsJAzLroR10rpnHWzNYPrUJgBidhituPV69vooSWJp+A/uBVP1DvdQlSlSe9Up3NzYrWAp+IWGRwl6zC88pbqHEHaq3o9W4d2suzf1PCwHswll2Kq1hx0yC29dulUWJGyElgOfjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NH+t6Fyg; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NH+t6Fyg"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb752so120779a91.0
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2026 09:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788885384; x=1789490184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yEPp5Hc57z+d7DVbHI6jNM7LWqltOprg/+UL6BC6Uzs=;
        b=NH+t6Fyg6/dfyRuNug/6cuqo91juoSKTV2egDXs6I5UmUMBDjFTeGcvyW4E8UOEVOO
         ec6+QnMLNVIU743JYorn8okfATmczzVe1+U4cwV7QEZJ68PPnrvlTHyaCMhcWCTe9ri6
         TYQtQJjLz25pksMNp7NyTGbivbpLBZ/f1URHfh6QQiTtqMwteoOlj9tLgmD+N4WneIXi
         z84KkIefZKsHy7rhUPdH7ktjejaOrP+v63Do1xNnnhzUMMIvu5oZWJjZSLRwgeWD/we8
         Dd3vy/iElRRZJAqIbj0lTGAumJz8ZvWfbvzaEhrU/ix6cU5ssj3dqI+Mh8d1C2db4Fbl
         KwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885384; x=1789490184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yEPp5Hc57z+d7DVbHI6jNM7LWqltOprg/+UL6BC6Uzs=;
        b=owcNXDmQVIIZK5bxJEUBsPQQQGhxE+KM9C7dsjow6fyTMRQPY0Tx8WdKB2GUfrszau
         s2cPsYLC4TPHn1ElrjbPwDaLJINS2STgoHcoiDCzHt43vWh1cuUz1aIu9/6FAy/OBrRa
         k/WoMZzRINoyvuv5O1MylM6B+hFIgQa0qLXKG8MAfvkXiqESg5R6EtwRBQ6igmxdTQRK
         F5TB5wKz572GYGKHKxrhNyNYA7ZCdbav7eilNxBd1om5q0hH+cpQ7HvW7XuMUSFWpz9p
         ol+fkKaKqwC6NHeOWCmIhTUkZ7wOuESMYu27NQLAHHNx6fFv5wFirJsa7jIOJXPvVses
         h4Gg==
X-Gm-Message-State: AFuF++nxPn9LMJyhVTFagxA4l1lP4P0V/eQ2Ko5dcMRIFQ5KfHrJcOHC
	kbW59wfhX/Uo4gzGaxTCZzHKCYJIPzQMv61F6G2yohHdNEckKr8gnPW1jfXDGd1J
X-Gm-Gg: AYBFou046UfneaqY8SgvXYHeg+8R4YxHcYG/tAU6klVC1/UmFLUy31IA19D43CrIgjZ
	xouMy24NcvJL8qXbc1aqX3nREhcDw7jBw599oPgFguUuKUCmJ0w17EsqSyNk/7E2ff8gWxQ4qXC
	UUxY8RUZbtd5RgmSQSOjcvMVYKWK+r8TB9VW5EDU+UyqAlv74GnfFtKCR8UE3Ep/kOsLYw3RrPK
	EyUSgBoaQpjAz6dNA3UgN34cbYZzP0URIe7arAdhRRWXNQ4PK/nluUa+uvGDIqQV/tJuyH9Rfj3
	IOMiyZroC8pzq9ypY1423peAjzcUCrdzAoa/JEcYWiE55VKP+gYk6BdNjnMRUwQw9+D8ZI6sPSN
	TvdcuK8v+O7JgrLKKoA5GUQ6OWB4gV3E4G2aX4HxEItk1EJkp1a5E3YNsdX12ZJnq2wh/vmXWF3
	1osPniZUEyDPsxG+/VW19WgDiTu9M3BrBrFZGQcjMm2EILxqy0yxYJp2Z9WHkXAEfcOxrF5qLnO
	hhi/qW8iFPI3g==
X-Received: by 2002:a17:90a:d00b:b0:399:221d:63c0 with SMTP id 98e67ed59e1d1-39bac471324mr930430a91.25.1788885384242;
        Tue, 08 Sep 2026 09:36:24 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.135.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcd243sm34338089a91.5.2026.09.08.09.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:36:23 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Mickler <florian@mickler.org>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+477f9c41b0a7d90fb9cc@syzkaller.appspotmail.com
Subject: [PATCH] media: vp702x: set up the state buffer before the adapter
Date: Tue,  8 Sep 2026 22:05:52 +0530
Message-ID: <20260908163552.1831-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vp702x_usb_probe() allocates st->buf and initializes st->buf_mutex only
after dvb_usb_device_init() has returned.
dvb_usb_device_init() calls dvb_usb_adapter_init() ->
dvb_usb_adapter_dvb_init(), which invokes the props.read_mac_address
callback. vp702x_read_mac_addr() therefore runs while the device state
is still all zeroes from the kzalloc() in dvb_usb_init(), and locks a
mutex that has never been initialized:

	DEBUG_LOCKS_WARN_ON(lock->magic != lock)
	WARNING: kernel/locking/mutex.c:625 at __mutex_lock+0x947/0x1bd0 kernel/locking/mutex.c:821
	Call Trace:
	 <TASK>
	 vp702x_read_mac_addr+0x51/0x130 drivers/media/usb/dvb-usb/vp702x.c:297
	 dvb_usb_adapter_dvb_init+0x2dd/0x860 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:165
	 dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:86 [inline]
	 dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:186 [inline]
	 dvb_usb_device_init.cold+0xbd5/0x14bb drivers/media/usb/dvb-usb/dvb-usb-init.c:310
	 vp702x_usb_probe+0x8d/0x210 drivers/media/usb/dvb-usb/vp702x.c:342
	 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
	 </TASK>

Besides taking an uninitialized mutex, vp702x_read_mac_addr() also
hands &buf[i - 6] to vp702x_usb_in_op() with st->buf still NULL.

The dvb-usb core already has a hook for this: props.priv_init is called
right after d->priv has been allocated and before any adapter is
brought up, with props.priv_destroy as its counterpart. Move the buffer
setup and teardown there, which reduces ->probe() and ->disconnect() to
the plain core calls.

priv_destroy() runs after dvb_usb_adapter_exit(), so no adapter can be
using the buffer by then and the buf_mutex that used to be held across
the kfree() in ->disconnect() is no longer needed.

Fixes: 8ea793aa7361 ("[media] vp702x: use preallocated buffer")
Reported-by: syzbot+477f9c41b0a7d90fb9cc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=477f9c41b0a7d90fb9cc
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
 drivers/media/usb/dvb-usb/vp702x.c | 50 +++++++++++++-----------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/vp702x.c b/drivers/media/usb/dvb-usb/vp702x.c
index 034b0652b9a1..5a7ca0b77a77 100644
--- a/drivers/media/usb/dvb-usb/vp702x.c
+++ b/drivers/media/usb/dvb-usb/vp702x.c
@@ -330,43 +330,35 @@ static int vp702x_frontend_attach(struct dvb_usb_adapter *adap)
 	return 0;
 }
 
-static struct dvb_usb_device_properties vp702x_properties;
-
-static int vp702x_usb_probe(struct usb_interface *intf,
-		const struct usb_device_id *id)
+static int vp702x_priv_init(struct dvb_usb_device *d)
 {
-	struct dvb_usb_device *d;
-	struct vp702x_device_state *st;
-	int ret;
-
-	ret = dvb_usb_device_init(intf, &vp702x_properties,
-				   THIS_MODULE, &d, adapter_nr);
-	if (ret)
-		goto out;
+	struct vp702x_device_state *st = d->priv;
 
-	st = d->priv;
+	mutex_init(&st->buf_mutex);
 	st->buf_len = 16;
 	st->buf = kmalloc(st->buf_len, GFP_KERNEL);
-	if (!st->buf) {
-		ret = -ENOMEM;
-		dvb_usb_device_exit(intf);
-		goto out;
-	}
-	mutex_init(&st->buf_mutex);
-
-out:
-	return ret;
+	if (!st->buf)
+		return -ENOMEM;
 
+	return 0;
 }
 
-static void vp702x_usb_disconnect(struct usb_interface *intf)
+static void vp702x_priv_destroy(struct dvb_usb_device *d)
 {
-	struct dvb_usb_device *d = usb_get_intfdata(intf);
 	struct vp702x_device_state *st = d->priv;
-	mutex_lock(&st->buf_mutex);
+
 	kfree(st->buf);
-	mutex_unlock(&st->buf_mutex);
-	dvb_usb_device_exit(intf);
+	st->buf = NULL;
+	mutex_destroy(&st->buf_mutex);
+}
+
+static struct dvb_usb_device_properties vp702x_properties;
+
+static int vp702x_usb_probe(struct usb_interface *intf,
+			    const struct usb_device_id *id)
+{
+	return dvb_usb_device_init(intf, &vp702x_properties,
+				   THIS_MODULE, NULL, adapter_nr);
 }
 
 enum {
@@ -390,6 +382,8 @@ static struct dvb_usb_device_properties vp702x_properties = {
 	.no_reconnect        = 1,
 
 	.size_of_priv     = sizeof(struct vp702x_device_state),
+	.priv_init        = vp702x_priv_init,
+	.priv_destroy     = vp702x_priv_destroy,
 
 	.num_adapters = 1,
 	.adapter = {
@@ -443,7 +437,7 @@ static struct dvb_usb_device_properties vp702x_properties = {
 static struct usb_driver vp702x_usb_driver = {
 	.name		= "dvb_usb_vp702x",
 	.probe		= vp702x_usb_probe,
-	.disconnect	= vp702x_usb_disconnect,
+	.disconnect	= dvb_usb_device_exit,
 	.id_table	= vp702x_usb_table,
 };
 
-- 
2.55.0.windows.5

