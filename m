Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795380705;
	b=xlQbYndmwKvUZ4cHt1R4EtuP4iKAYilPuXa86QqK8E80pmBglqnj20cke0dUy7PgJTVC
	 0AAm4rGqbEm/fWnHqpGO9S4RgmPEbD6D3Aet+5BDhOQeVIsWRTKEtLU9KSDeYWt5Jw50R
	 s1XYYVYuHXHsRTs24qWtJG7ZCebKylafLMuArFRTHIEzx+Z7DzcPc5SuXbhcB+dMBPQDE
	 Q43V4Abo9A4JzZ4lTfL3ToPAfSP8GaKEDLL4HbA5CHzqJXUsnp7G4Z740KAtI7wKlNsjG
	 7jGy54SYQ68cV63SsanGm+e5tvtID/vzwgTmygtLvJc0xshMxT7y/+41Ad4uBr3/qLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795380705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GCgci+wnkegUNNmVPyTdmFkRnQkKXTGlvVX8R+FAXAw=;
	b=T6RMrDp64ruhUw3Q/vY6q2cJJmceGrlmeeWtSRhIMEyYZ6+yQ9MgfglRrC11rDXmU+aT
	 hCu+xao8TJrbQ+rmhItseQckSYGrNvkUwW7RIzaoA4ZZpysnjImh/3fplGgsy20moU1J1
	 E3un3eikFepDkz0OFQlMQZO7i9A08LjJvvkEB4EvkWCQMw+qyF++Hi46VInAEsFYBgA9a
	 6kohXecOipz9Yggh5cGV2ghbUZQ9ocrUBXmV5u6U/6xzmNZMm+amSXpleGLBKpJu3IHdy
	 s6UuPhyy+1xJilRr4vET6Q00MXTxU53LxIMgtOCkv2ligJIFwkndKrSAXJrtSdzTTtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HnUix/va";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1C3606A689
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 20:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E1C3606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HnUix/va
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2344155f8f.2
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 12:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795380704; x=1795985504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCgci+wnkegUNNmVPyTdmFkRnQkKXTGlvVX8R+FAXAw=;
        b=HnUix/vahPIIPPg94n21bSwADW5XJ2R4f/ruRTqMmI6tIIzR4e6LqXv4evpos0RRK5
         jXSmRZPACpd13OmIbBBkA67aYZALiuR1jyZ4kUvB0LS6LE8iRytOClCFlxIsaTg3920e
         Rw9GTqEof3NzSz/Z4Z2idg99g9IjDNxpYjKPObuZiQRCrInfmYQrX3/kNeNCUClCO9sD
         fvxY0ryVj1AFagtDNCWJhhYPVxbjXZskrqC0m/B5UZDNknzg6jvLDsZQ8+ovJxZT+g0H
         ZzT4Xlq055C2HJ7sFdqBfFzUx3GR8ZoIbt86FZXE+BI94qdBhF9ShibmX9JSsRIYbh39
         g0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795380704; x=1795985504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCgci+wnkegUNNmVPyTdmFkRnQkKXTGlvVX8R+FAXAw=;
        b=TdesMrEk7yV+A8WPiAEPoja818aaZqL76oQ7Qjs1D5oqK+KsXnRGIFAv0C0DyZ3DaH
         kd5+DtcHyb50Dy34SIWnZTu8DH3AbzeKbVc8m3Hc3UXcZJUQxoMpb065DUaV5OVJoyW3
         Nptc2ebmgAwoAQDoI87LNSc4UtM6+CCGAmRmqMyH8tqW/pElN+MYh7VKiGsobQMtIXbB
         nxnmaSNsv2nhRo2NQB553SSZZ/9Ll5YKD3A8uA/aLKy14+Gj8OHWZxKY5Y1RudmqSI8C
         1sf1ARQE1Nkq7dS3Zu5KMK2o6C8CfBkQKlV83rUoCgNGuXu/74UlRP/58M2m8R+WgIGS
         avpg==
X-Gm-Message-State: APuU4Z/BBK/Jabz2gK3EZuY7CCjPXPXzWeRWtePBp6N3B46cSrBFqB6N
	q97foVE+47sIJlu0HX8dd3PAhnDzvihiNGahImdafmCQgiRRgSwTmk/s
X-Gm-Gg: AZFdTZenoYJUcISLuunDKj6GAtFchlvEIBhJgqEs/nojDpxIxUoR7VudPllYF5cX0jd
	A0IIEwPOsbNXFgPs2g2EZHSsnuRWh2AIdqMzB7tfpDxm3zMAxbfs+eaG7gJPk8kG6sjSjEbntuR
	UHWjlF4rm5MmPzBev9hjk2Qqxtt7s2DN1St4Ns80BcD87Sviah7/FT6BYH48yqnGc1MNfufsFEv
	5QVy9jMnIU++MXkS1fTCvgSZjuY0z+y0B8Lu06E5enHASMwpitVkDQkb917BGqNUN9FY+KiArR9
	Oy+jOUi1bogj/1dP88hXa+AnAwD3LXn+pQE94HQLxcuY61SgvbC/Dld/MOvvlqqqwY9xc2BGT/b
	fBo8dJL47QlyUrlnFcZLn+2pxD/RUQlHqNjVslpK78zFdAlwJ4bxgihNrIQoQa76CKmPH+OfRJX
	c51Pmh4JIvcA234qQThcT+Yws6QtnM6rmEjUiexOSIJ0w+RcUXbcKsrcaHvRpTT277dWU0bm9z1
	F3s/zUZJFBwIHVRC6LZa23xR871kESYgt2EH+/lKDZGepvpcrSC8zXIBulZyIXbfaLj3Qu1Wh98
	ecamlFmN99gOoawnkmgsvXCtjSxQeLiVLm7CFhc4N+uH208cT2Wznw7f
X-Received: by 2002:a05:600c:154c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4bb8881c378mr209100495e9.8.1795380703662;
        Sun, 22 Nov 2026 12:51:43 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([103.125.177.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm338371075e9.7.2026.11.22.12.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:51:43 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: [PATCH 1/2] media: em28xx: defer media_device cleanup and free to em28xx_free_device()
Date: Mon, 23 Nov 2026 01:50:27 +0500
Message-ID: <20261122205028.41222-2-arbabhaider649@gmail.com>
X-Mailer: git-send-email 2.53.0
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

When a USB em28xx device is disconnected while a V4L2 device node
(e.g. /dev/video0) is still open, em28xx_usb_disconnect() calls
em28xx_release_resources() -> em28xx_unregister_media_device(), which
calls media_device_cleanup() and kfree(dev->media_dev) immediately.

However, struct em28xx_v4l2 remains alive until the last open file
handle is closed, and v4l2->v4l2_dev.mdev still points to the freed
media_device.  When userspace subsequently closes /dev/video0,
v4l2_release() calls v4l2_device_supports_requests(vdev->v4l2_dev),
dereferencing vdev->v4l2_dev->mdev->ops and triggering a KASAN
slab-use-after-free:

  BUG: KASAN: slab-use-after-free in v4l2_release+0x325/0x380
  Read of size 8 at addr ffff88800787a260 by task test_em28xx_uaf/53
  ...
  Freed by task 30:
   kfree+0x162/0x410
   em28xx_unregister_media_device+0xa4/0xe0
   em28xx_release_resources+0x70/0x170
   em28xx_usb_disconnect.cold+0x107/0x2a3

Split em28xx_unregister_media_device() so it only calls
media_device_unregister(dev->media_dev) on disconnect, and move
media_device_cleanup() and kfree(dev->media_dev) into a new
em28xx_cleanup_media_device() helper called from em28xx_free_device()
(once the last dev->ref reference, including em28xx_free_v4l2(), has
been dropped) and from em28xx_init_dev()'s error path.

Tested locally in QEMU (x86_64, KASAN+UBSAN) using dummy_hcd and
raw-gadget emulating an EM2820 device across open->disconnect->close,
repeated disconnect, dual-fd open->disconnect->close, and normal
open->close->disconnect scenarios (4/4 passed, 0 KASAN reports).

Cc: stable@vger.kernel.org
Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 1d4f30cba..d8f2e40b7 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3773,8 +3773,15 @@ static int em28xx_media_device_init(struct em28xx *dev,
 static void em28xx_unregister_media_device(struct em28xx *dev)
 {
 #ifdef CONFIG_MEDIA_CONTROLLER
-	if (dev->media_dev) {
+	if (dev->media_dev)
 		media_device_unregister(dev->media_dev);
+#endif
+}
+
+static void em28xx_cleanup_media_device(struct em28xx *dev)
+{
+#ifdef CONFIG_MEDIA_CONTROLLER
+	if (dev->media_dev) {
 		media_device_cleanup(dev->media_dev);
 		kfree(dev->media_dev);
 		dev->media_dev = NULL;
@@ -3826,6 +3833,8 @@ void em28xx_free_device(struct kref *ref)
 	if (!dev->disconnected)
 		em28xx_release_resources(dev);
 
+	em28xx_cleanup_media_device(dev);
+
 	if (dev->ts == PRIMARY_TS)
 		kfree(dev->alt_max_pkt_size_isoc);
 
@@ -3997,6 +4006,7 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 	em28xx_i2c_unregister(dev, 0);
 err_deinit_media:
 	em28xx_unregister_media_device(dev);
+	em28xx_cleanup_media_device(dev);
 	return retval;
 }
 
-- 
2.53.0

