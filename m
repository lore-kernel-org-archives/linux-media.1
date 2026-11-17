Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.60.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908248;
	b=yXOG2jfeCFISEXO+bxDitpIb0jVHJhcHVBPgT8+a2a8Xj3qQd31N5h3nEHZVJvwdWXAp
	 zE42aKBfCm/OAwFxLZxmbQvII9Va2M7ge8POP3E1ozH4TNPdmWZThM4nNY3BM36as6ETu
	 FLA2n7JEwX7ckVg4fHznBfezZl77gvlfWSQCbZkIhbfOoTSCWl5faPaeFojlH/LOPcoWe
	 C1A7JTgvFl6srP6lLpsem1QfZjW/K4MXH6Ack7mGBQxPjJSuiSO2FxKVaM5aFe1iAN5ec
	 XzCra+ia7hKYhb8NDBD9KHRA1W36FV8QJfDKYt+dJefoXnOsWO8fTJcIULW748z1w2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908248;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RsDhCr97ThAIRYXygbiYae1JTvR6S8nztU2Qoell0DA=;
	b=rkl4SCGvQFCBidnSDO1hwDVy6VLz5n3iHuM8ZMUt433CE7oiDG4ebg9pk8JiJYLwCdD/
	 xcXpW8CMAx34LNbONcRthLj/HUx2AVJVrkDhyw5quYeC2Hw9PqiF94JB8p1sluPCJyrmZ
	 dEMdzGl/yhJAXwLoLBDW6gKPJtR7pEy59J+sR+KBMvUtu1xGYXXepj/nkhV7evO7xMJNd
	 ZsUx2qUA5vQSxyKWBiApEC0Uinn3vpkC5I6rWfvuV38yXqm3BgSonJ1PNpOvAyrdd5LVy
	 1sqSK9uwCN/1q4XN16MwjkRCvX7O7pgGl+GqkU3Ag1BBGRIjL7o6Ay6NacWDUVI3pxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.ru;
	spf=pass smtp.mailfrom=yandex.ru;
	dkim=pass header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=MGAER6O2;
	arc=none smtp.remote-ip=51.250.60.163
Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net [51.250.60.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AE5606A31C
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 09:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71AE5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=MGAER6O2
Received: from mail-nwsmtp-smtp-production-main-78 (mail-nwsmtp-smtp-production-main-78.yp-c.yandex.net)
	by forward103d.mail.yandex.net (postfix) with ESMTPS id 41C7DC009E;
	Tue, 17 Nov 2026 12:37:17 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-78 with ESMTPSA id FbVjGoVd28c0-nvgQgwxf;
	Tue, 17 Nov 2026 12:37:16 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1794908236; bh=RsDhCr97ThAIRYXygbiYae1JTvR6S8nztU2Qoell0DA=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=MGAER6O2AUQKEnOfDZiy3lwou5pa6ncj3UMqcoq6CW/KF2hajqMDAW8gjeAN2r4y1
	 MqzX2oxTKP9qJeFJJ/Pz2tkX9QYR6Y4JgQQ5UReVw3Rvc4YvFaSHUc79VG5+gbrhZw
	 LWH+1SRP5+PNat/Pd8qELQMaMvGZnLCfh09sdaCA=
Authentication-Results: mail-nwsmtp-smtp-production-main-78; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+ffac2da5e6f8ad2671b2@syzkaller.appspotmail.com
Subject: [PATCH RESEND] media: dvb-usb-v2: fix race between device probe and demux filter setup
Date: Tue, 17 Nov 2026 12:36:54 +0300
Message-ID: <20261117093654.156482-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.56.1
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

Syzbot has reported crash caused by the following userspace program:

Thread 1                               Thread 2

fd = open("/dev/raw_gadget", ...);     fd = open("/dev/dvb/adapterX/demuxY");
ioctl(fd, USB_RAW_IOCTL_EP0_WRITE,     ioctl(fd, DMX_SET_RES_FILTER, ...);
      [fake descriptor of Hauppauge
       126xxx ATSC+ device]);

That is, dvb_usb_start_feed() may be called before dvb_usbv2_adapter_init()
has completed frontend initialization with dvb_usbv2_adapter_frontend_init().
Fix this by setting active frontend index to -1 early, this making sure
that such a preliminary attempt to start the feed just returns -EINVAL.

Reported-by: syzbot+ffac2da5e6f8ad2671b2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ffac2da5e6f8ad2671b2
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index bd86d250433d..37353bd40a10 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -637,7 +637,6 @@ static int dvb_usbv2_adapter_frontend_init(struct dvb_usb_adapter *adap)
 	dev_dbg(&d->udev->dev, "%s: adap=%d\n", __func__, adap->id);
 
 	memset(adap->fe, 0, sizeof(adap->fe));
-	adap->active_fe = -1;
 
 	if (d->props->frontend_attach) {
 		ret = d->props->frontend_attach(adap);
@@ -759,6 +758,7 @@ static int dvb_usbv2_adapter_init(struct dvb_usb_device *d)
 	for (i = 0; i < adapter_count; i++) {
 		adap = &d->adapter[i];
 		adap->id = i;
+		adap->active_fe = -1;
 		adap->props = &d->props->adapter[i];
 
 		/* speed - when running at FULL speed we need a HW PID filter */
-- 
2.56.1

