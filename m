Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [178.154.239.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BCB479889
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 12:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018263; cv=none; b=rzTPIU7r94EA4Nbf8UzyQn4nHdP4ZNzZoe9SdKSjgjdvPv4OSa+Y+3+oRUIHcuy9jZN999z/txJ7K0yuY30dBj5qTxIYYM+wwpbmBkWWgR8F3afVqlqzU6EPCWTsAGHsGXYqFoGnwbHhZ5cNRUlMg4MrRJteHE4Fg6fqlFckI1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018263; c=relaxed/simple;
	bh=cCxr3fQ4mz7+KO/dHY3gJzr82kcDERLZVluQKPHV3Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FNG3OAUxqOxaeXHPMKSp3Uhkuzf+lJnpqgdxlXh+SSmpTRzg2WKvNTOZNdvDuEpz5pQ79ijmzFe9U8y608qDtRbZ0CGrYXxJRFT4DUpSiiMo3KXwi3g2SFH6u419enraGX1FHsRydsoY0gb4nGmPckoH6OryHIV9lsN2WnnKGZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=jfECp8WD; arc=none smtp.client-ip=178.154.239.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="jfECp8WD"
Received: from mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:ef38:0:640:438a:0])
	by forward102d.mail.yandex.net (postfix) with ESMTPS id 344FEC021E;
	Thu, 06 Aug 2026 15:10:49 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net (smtp) with ESMTPSA id lAIIe1Aer8c0-VtQqN5yL;
	Thu, 06 Aug 2026 15:10:48 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1786018248; bh=e6p0KWayCsbhadDD9pi5k/WSydIPA3dF6C9Rw/bdmUo=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=jfECp8WD7+mfg2Nc2fm6F7bXPgK69dr19ayq44M00tdA+uVdRK3d7uIpV0D0A6PVS
	 ej3xlmY1XQwJAGLiIO5yFH1z2X3Z55fYKiE9iQx4lBu8AwnyjfvLPfSXrQQQ3onJcK
	 cJ7GpEXnxRqlBcNxFrpDsHsNQ8fCg40a6U8nrIJc=
Authentication-Results: mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Sean Young <sean@mess.org>
Cc: Johan Hovold <johan@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+237c754233330b2bf565@syzkaller.appspotmail.com
Subject: [PATCH] media: redrat3: fix use-after-free in rc_dev_uevent()
Date: Thu,  6 Aug 2026 15:10:21 +0300
Message-ID: <20260806121021.25156-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 'redrat3_dev_probe()', it makes no sense to register the device
in rc subsystem until it is completely initialized (i.e. passes
'redrat3_enable_detector()' successfully). Otherwise the device
may be announced as ready to receive events even if was freed
by 'redrat3_delete()' during error recovery after probing.

Reported-by: syzbot+237c754233330b2bf565@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=237c754233330b2bf565
Fixes: 8a21ec9bb3ec ("[media] redrat3: fix error paths in probe")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/rc/redrat3.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 3f828a564e19..34ea8fe9aa18 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -1102,18 +1102,17 @@ static int redrat3_dev_probe(struct usb_interface *intf,
 	if (retval)
 		goto redrat_free;
 
-	rr3->rc = redrat3_init_rc_dev(rr3);
-	if (!rr3->rc) {
-		retval = -ENOMEM;
-		goto led_free;
-	}
-
 	/* might be all we need to do? */
 	retval = redrat3_enable_detector(rr3);
 	if (retval < 0)
 		goto led_free;
 
 	/* we can register the device now, as it is ready */
+	rr3->rc = redrat3_init_rc_dev(rr3);
+	if (!rr3->rc) {
+		retval = -ENOMEM;
+		goto led_free;
+	}
 	usb_set_intfdata(intf, rr3);
 
 	return 0;
-- 
2.55.0

