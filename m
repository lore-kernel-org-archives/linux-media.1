Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386241;
	b=5f6qYz4/j659ekG+uGFgKGPUS5pNpn7lyII6TCBXjG90GzqRk4ApNX/B3yK7O3BwWW9h
	 T0dnvm/Gb5klMewpaMbBW1THwoE0Z4DaXGNcYgoIlbNQ+mbndXXNQTAJ3tACS0IHJYqv4
	 0vj8vFnZyWyKW2KclkTWt60XBtI+Ta4q5e7IZnXDBBSOQUNZfE3ynPB/Ojhy22K2Kc3aa
	 tEtLj73wYf5V0caGnDk37V3UFdoUsbG48vHvEfJRkkbSmzHSEdo2N1SGNunbTrPwaNrG5
	 SQhOrGdvCfJVL+4IuOUUmdc6mWsZcqDKpqBS5MmYoSGe+SLzzMND6jtjnG+sVk7q7EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KapwmbLEAkf33u/pzzWw2QZ8gktGhjW3ZtX3tKdugF0=;
	b=tFvKhyec7ok3fkz+int2EoaxRmxsfT02+7JQ6YlhSIVAtQzT0tIl5xT5dAAos21KS5Wh
	 dC/fxbN64OPK1AZXDu4zaoIhFOXY2d4tT0IQx66LBcGVaQ7GwqvlR5jHpdRxQIDRaB6fZ
	 xHnBm8ppns0wu+wCnSPQj7jYsYakFVyXalRj+eDUK5UyraKAz8F0OMQhN9pNl1MrFEAN2
	 +fxGT1aZ7pcASX4fB7/PnUKvykTnkxF0EdG9WmHzqTbGc9prZrcPe9M84ehDbK8rzcdLK
	 e6Gqjtwewa7WNcF8QJqVB19Y0kQgadHq/uyaZhyGQfgCc1osWEPvOqOuIOPDkPWjAYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="i2R/yJDp";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EC8606A31A
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 22:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61EC8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2R/yJDp
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a32576da88so1517427f8f.3
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 14:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795386240; x=1795991040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KapwmbLEAkf33u/pzzWw2QZ8gktGhjW3ZtX3tKdugF0=;
        b=i2R/yJDpimHrS7eYZJtZGDiAVywPsyyCOvmfEFaBp62uI/AGioNG75yqZfkLhniRZe
         XveDSojPkBIOpjRK2be4jGyKusAB0nSulLHu+9ppxXnIqkS5IHJFFmVC+mDYLFpcwq9a
         Lz1Nc+emXSnUwLJLdNApyezog9ScRwCy/qU1ifQmte3tQRYD55fax28kl24H3LllvGg3
         CWDnPf+uCk41JyIqu+qyNyqWMxGoD9txa2fLNbcizqYDpzX+frx3Pbyl3nbuq0qs1OVJ
         VyUMHoRarnfkT73FlKZ7EHPHmr6GW2veNf/nACQTJ+Mc9J8tQQjm8iCGVEmDTE6vZoK0
         uBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795386240; x=1795991040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KapwmbLEAkf33u/pzzWw2QZ8gktGhjW3ZtX3tKdugF0=;
        b=OvYPE4YbuouSx6kq0wmKhHalyKJZDoUxqZ1BqL5VzgkAXvdKPM0Ia17of7lDm1YZgL
         noQV7z9byZ937adcsIDPo0f5EkKWGzjfMMMiWkddFst184Tkf1gorhAZgL8aFH+etN5J
         yoN+0/idAat/c12r2Mw9RnkVxvEPYdB9yYUn1Em6XaNJH/tSai1boT0g/FPS1aUzeMNV
         66RZir+KQdaJ3lwHSuRyQ/RBdNSMjAHvpvPK1Npr33Kt455A0lU9pHNyCygrJbg53Qbl
         y7JxIOseSXzv5bgRL+x9CRUT+D7U6GZfkmTdtsjfUQL8h7qbdRR2y1iy7xN4GJ6cdJeu
         Zm1A==
X-Gm-Message-State: APuU4Z/oS0Pc9ddYo8pIQ4PEeIwDxFEGA7UYo2LIuPpD+etmOoXDU0KR
	jblmmGOcRS+sJvUPBivk1NdfbXWyqjJdYtyJ7tpLYCV0OKSGu74sUdBF
X-Gm-Gg: AZFdTZclG68cthvjFmJJrKDeZLx0ia7eRYE+LyuVeq/7Y3R12rnJMhg9cP9lblCmHU6
	T4ssGz5PPQcTkzx9YFIdrQr6HJeU/xOUhDaYk+FkvvcXX85lEzloj0FK/4SY5RX5vgiMFJdGTX7
	qlYac23gXL6gnF4OLd9yum1EcdDLIYfFdQOogyMlzMP6IAdTjhmHX4FPLAC7vlfcMkg1ZfgOule
	NXQFAudqXJtP1Kk+u92sZwqVabBAhr3jO3SUrUFJNH7MDm1bVvPQnM/5QLIqoLUuvJe5MH9UB/3
	CKgHJnjLnKzbUvnH9y1cMEHawoQ9BqVFIRryLC/aLI+hP2Oe8SrM2A2Gsd3p6UuVKhqpMDKK06E
	PTN9a7dDWi36LV3yL8opjf/w5KEcjmM6AwLo1Trd2c0A/qeRhKTrlob6ZT5NDL8uAVOkvLSCis7
	Ne46uzr+XyLF4xOW6qNdwIRaXWuBLMvsjIfMu8U0GBj1VTdeW5+TXtB5KB9ONy/TsGcq2aLpOQA
	Xs4BnHgskCzAj0u2VMeo7aINVyHADlFBBGVok2ScQhKy4ZMCSfzIVu0BH+wy80C7eCIqvyMscea
	IjHOZfnNQHWLhQcvNSW0yDL+hz//XPfMfIPcc0y7FQdTkzsJk6UGpRrske5XSkfMrpUpH/QDLXi
	dtw==
X-Received: by 2002:a05:6000:2085:b0:49c:192f:cf20 with SMTP id ffacd0b85a97d-4abacfea524mr18694027f8f.6.1795386239712;
        Sun, 22 Nov 2026 14:23:59 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([103.125.177.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c248b75sm18912122f8f.54.2026.11.22.14.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 14:23:58 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: [PATCH v2 2/2] media: em28xx: avoid dereferencing dev->intf after disconnect in em28xx_v4l2_close()
Date: Mon, 23 Nov 2026 03:23:26 +0500
Message-ID: <20261122222325.41868-3-arbabhaider649@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122222325.41868-2-arbabhaider649@gmail.com>
References: <20261122222325.41868-2-arbabhaider649@gmail.com>
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

em28xx_v4l2_close() unconditionally evaluates
interface_to_usbdev(dev->intf) at function entry, before acquiring
dev->lock and checking dev->disconnected.

If the USB device was disconnected while /dev/video0 was still open,
struct usb_interface (dev->intf) has already been freed by
usb_disable_device() -> device_release(), so closing the file handle
triggers a KASAN slab-use-after-free:

  BUG: KASAN: slab-use-after-free in em28xx_v4l2_close+0x37c/0x3a0
  Read of size 8 at addr ffff888007245890 by task test_em28xx_uaf/71
  ...
  Freed by task 10:
   kfree+0x162/0x410
   device_release+0xca/0x250
   kobject_put+0x152/0x2f0
   usb_disable_device+0x324/0x570
   usb_disconnect+0x271/0x950

Move the interface_to_usbdev(dev->intf) lookup after the
dev->disconnected check under dev->lock, right before its only user
usb_set_interface().

Tested locally in QEMU (x86_64, KASAN+UBSAN) using dummy_hcd and
raw-gadget emulating an EM2820 device across open->disconnect->close,
repeated disconnect, dual-fd open->disconnect->close, and normal
open->close->disconnect scenarios (8/8 passed, 0 KASAN reports).

Fixes: c6d48134cb26 ("[media] em28xx: don't store usb_device at struct em28xx")
Cc: stable@vger.kernel.org
Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
Changes in v2:
- Add Fixes: tag as requested by Media CI.

 drivers/media/usb/em28xx/em28xx-video.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d..854fcc897 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2503,7 +2503,6 @@ static int em28xx_v4l2_close(struct file *filp)
 	struct video_device   *vdev = video_devdata(filp);
 	struct em28xx         *dev  = video_drvdata(filp);
 	struct em28xx_v4l2    *v4l2 = dev->v4l2;
-	struct usb_device *udev = interface_to_usbdev(dev->intf);
 	int              err;
 	bool last_user;
 
@@ -2512,6 +2511,8 @@ static int em28xx_v4l2_close(struct file *filp)
 	_vb2_fop_release(filp, vdev->queue->lock);
 
 	if (last_user) {
+		struct usb_device *udev;
+
 		/* No sense to try to write to the device */
 		if (dev->disconnected)
 			goto exit;
@@ -2525,6 +2526,7 @@ static int em28xx_v4l2_close(struct file *filp)
 		/* set alternate 0 */
 		dev->alt = 0;
 		em28xx_videodbg("setting alternate 0\n");
+		udev = interface_to_usbdev(dev->intf);
 		err = usb_set_interface(udev, 0, 0);
 		if (err < 0) {
 			dev_err(&dev->intf->dev,
-- 
2.53.0

