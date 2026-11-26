Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687708;
	b=rGjhBfbmmgszl7QzZJzT5L4sd1+oHa6Lb6NYl+34+Kaea/KMg8yseZqlyqf6HjBmd3bL
	 b0MXugPJH0xIs40P2FVneQlcH1zl98bihAVP6tBAYmhpEr6EVFuOMnjUODeJQTU23J4w7
	 fbnI0YAa1s1Yh101C/gEcPXp2TflVLI3a55I7VPt1uzcGeQsFX/kZwDe2Vcz8Pw5aaoN+
	 v2qmTS/HIl8RXoQ/FL/CXC7iSd/is0Gn9v5Y2ZQPtMdXvgwSPdOdovJhRA5JMKTf3NiSt
	 s8lJGzPCAyy9OANlsnlxffoqOGPxwb5fZTF7lBJf1NROdoP3iOq0mxquN265u6lPhdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yhJLheRK2k8iW0h1BrUFUeUwi944GYqdiiaue7ukRoM=;
	b=t/oNK8tZSafJr7TunCPpDE1cYO9DMMvqU3O5EBV+Wi9RUcntIMwTk0iwEbWc1HoPfKe8
	 5e7ZEWUljlVMnCphHw9h1j16X4rnFVEo3C1NwQvSLtjwhA8ua5DcSFTi8EtRv4hcizrM9
	 AsDdoa8mz2MumtxeT27lJUi2XxQMFC+4hxZ5lu6uJlQ6n9pWeGqo/fBe6fTwX/fHdCPET
	 ZSnw9tvepPDMVDpgZjqYqvcL+6qciH4I5W2h6GeE0HV1MrLthWDtS6T/K3pS1vXwhLhw9
	 Las/M63DMZhy9QU+0LT1hPAeOstggn7tEmx7ZEUSWgkYgQcAT5FaWBwwgotsoL4+aXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmgTBLo2;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D047F606A331
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 10:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D047F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmgTBLo2
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so61279215e9.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 02:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795687706; x=1796292506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhJLheRK2k8iW0h1BrUFUeUwi944GYqdiiaue7ukRoM=;
        b=zmgTBLo27luXCYwakoBn1tfqpIuR9XRYiH9hY97k2rY8emO8toHDfYZY+poj9cEtzN
         hlTWo05Wqnl9HaB94VSrynltCn8bZMciKwMxdHw/x1s3+MOupcVx5SluLOcUbCT5x2Lp
         k8SAgaUMrI7vFCBw9/Je04NioiV62CJ9hmq2TmQxNkURZUl+LnGHLOS2IruzdawKfklp
         sNaDUbnNAbxssrV0wf+GqDlijXrymPnOfdqV+hLEyvuwL2JGbh9X7AIdvRe8GYxDO0au
         xLF2/UcHQQ6IOvXN4O3Cv9kNIAaYQxgFjkm9HDzrd4JYpdq06cg+Fg94pO3y1SnSoO0N
         vhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687706; x=1796292506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhJLheRK2k8iW0h1BrUFUeUwi944GYqdiiaue7ukRoM=;
        b=Xkb+3a9+mGYW10bcNLOpm6zTLt9lMXzcfqIVu5QpYr1Pyl1Y8W+ZjNjrYCBwB5CWDQ
         G/Qa4ClVFOyYhaHmdOEHp1HgEDYOxb0Ym/iWSxTk2XbR24150d/G8qvRC9Xhn72YeMnQ
         Qpm9n9/rL4Yei58Rh0KCAY5MK2rOaaa7MSHD3u3SHyMsxRQV5DHhplfOy1o+f4TMuiIP
         1uOn6Lqhlq1HwrjGcn12ZRpfi/7QNOmBB1CkBmtqhQg0nZeINojSY3eQW3ixu5Rwgg3/
         uXwcTxRMB2OhZxSJlIemW7GXs1kkdOw6eA9p609PY8DvxltE2BR5tzOxv83FEANHvLrB
         h5sA==
X-Gm-Message-State: APuU4Z8a2FbUrC0a/xCX/WOWcEUl8WCdbyF0kqy1lRU33mGuD7tk4oUQ
	+S0pimJp8qo2SL9ynbJmfLyT2M1l+HJ+eVZIokjwN+0Y2CWj/1BoU7xaBjgJk96c
X-Gm-Gg: AZFdTZeHRnTAvLk/qWYBBjbpm65n3VcT7q/WPaL4TX2fu4IIFpVQI1jt7Pakz41fMlm
	KiUUwXRpsDKv6sHq095oqSITMhQQwfzJwN1R3VLVDVXir9YJ2RKe2jHm79iAurAhx++KOQFU7wc
	wVg0fyaK1xch7mZtz0doLVcn/3G1UjARcMVcvwJINP40JcfQO6ygFa6FBEvhC7PMHqY1rpW7chn
	4Zp4PdLkVi+oI4z8jrWFkH/pBCVy5wIamULTCRaZlwliJXrY7N/ccVGDSVSTAnvxo3h3Tzv/ziP
	1Gtk1qn9weffCjvDi62f/gJBAAMY7IsPeGOaAjW2HcVTKMmXo9MszQm14KV6dwh30ZwXuwatlO1
	pscYvztY7M3UFvsf5qGp6mbdHSXWrL6r5at9BGWW9r/vcjdkhYvM43DpGdhyvTzRtcFlEyEEjco
	X5IFUKgrnsc/miEx5937X9EK+KmuVimSdmZuF+Oeaqg2Flkk8YL6ltBJg5jytx6MkoPa8N+AorD
	bOBNleJgo86eeM0hARi427Isv3IfjjQ6T5UbEwmVDI57PPNZcwe/qmFFY9kephmNnza1z0z7tMr
	sTGJGgsLDts3lnGTIRAzm2CdtCVG5kkMZt90YlFdkRILK+iVns554r68vP5BJ4T9vFXCT/PvUd1
	E
X-Received: by 2002:a05:600c:e549:10b0:4bb:a60a:fc8 with SMTP id 5b1f17b1804b1-4bba60a11d2mr59103625e9.35.1795687706012;
        Thu, 26 Nov 2026 02:08:26 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([37.111.157.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm830600705e9.13.2026.11.26.02.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:08:25 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v3] media: em28xx: defer media device cleanup until final device release
Date: Thu, 26 Nov 2026 15:08:07 +0500
Message-ID: <20261126100807.356864-1-arbabhaider649@gmail.com>
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

em28xx_unregister_media_device() clears v4l2_dev.mdev and frees the
media device during disconnect. The driver holds dev->lock, but
v4l2_release() checks whether the device supports media requests before
calling the driver's release callback, which takes that lock. A
concurrent close can still dereference the media device after it has
been freed.

Unregister the media device on disconnect and defer cleanup and freeing
it to em28xx_free_device(). The V4L2 instance holds an em28xx device
reference until the last V4L2 device reference is dropped, which keeps
v4l2_dev.mdev valid throughout V4L2 release. Keep immediate cleanup in
the probe error path, before any V4L2 nodes have been registered.

Fixes: 37ecc7b1278f ("[media] em28xx: add media controller support")
Cc: stable@vger.kernel.org
Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
Changes in v3:
- Rebase onto media-committers/next and replace its disconnect-time
  mdev pointer clear with a lifetime guarantee for V4L2 users.
- Send the cleanup fix on its own, following acceptance of v2 patch 2.

Changes in v2:
- Add the Fixes tag as requested by Media CI.

Validation
- Built drivers/media/usb/em28xx/ on x86_64 with MEDIA_CONTROLLER,
  KASAN and UBSAN enabled.
- Booted QEMU x86_64 with MEDIA_CONTROLLER, KASAN and UBSAN and passed
  three em28xx and em28xx-v4l module load/unload cycles. This smoke test
  ran without an attached em28xx device.

Codex assisted with the rebase, source review, commit message and build.

 drivers/media/usb/em28xx/em28xx-cards.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index f4b6dcf597..cf0312fc46 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3773,11 +3773,16 @@ static int em28xx_media_device_init(struct em28xx *dev,
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
-		if (dev->v4l2)
-			dev->v4l2->v4l2_dev.mdev = NULL;
 		kfree(dev->media_dev);
 		dev->media_dev = NULL;
 	}
@@ -3828,6 +3833,8 @@ void em28xx_free_device(struct kref *ref)
 	if (!dev->disconnected)
 		em28xx_release_resources(dev);
 
+	em28xx_cleanup_media_device(dev);
+
 	if (dev->ts == PRIMARY_TS)
 		kfree(dev->alt_max_pkt_size_isoc);
 
@@ -4000,6 +4007,7 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 	em28xx_i2c_unregister(dev, 0);
 err_deinit_media:
 	em28xx_unregister_media_device(dev);
+	em28xx_cleanup_media_device(dev);
 	return retval;
 }
 

base-commit: b4e3c4b6a36fd76f57bf3e48638f68ddecc54ba4
-- 
2.53.0

