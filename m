Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=93.77.172.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915624;
	b=euBEhT9KuC+/+MFzlfY/FsH9MTKsQlslegb6oP79wKHPRtLmBibLUYY1SgSi7y88b1YX
	 I8+i11VL9uECv8aMJHcxZFqQjf4B+BaJRb4unMqvHAEh3BxVxBr9yS30DZQV6dANKg1zY
	 9s2Of3QmICymFeR0OemIMPfCmkI0rZVROUEr6wU3JuKItzGe1y+bLM4nFo/g4b+NIP/8S
	 38QSLquVKtwrU29env/Crt8jQ8pciJZin0eeo2U8I+P3/gmf3cUj80WtDZX0AUiNP0Rxj
	 BGvFMwuV/W8AmAHN7HW31F7Hy057qvrV3xYeVHPBmCbJ1YazjeK1jkOUeumK7kAw74Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915624;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lNYLM7H3Tkg4FE060j45Wgl3kSBreKgGWMpXxZiROr4=;
	b=e/kMCVL3tGS5enhoxWTFIY5i1Vd7887hWGyd33IT75MdT0lzv1Jhar47aE26rvchNXjn
	 0M1shAGdcxda98k6MRY4u7F6uWfVawUfRqfaD7gtowBFu9z1+8mWoodPStVGbz+J0QcRJ
	 BCwBe0nfjII0j3bPPZRhh0kYyDT/2CrEKAjP8XYFjZYpe6Gaml1krwE9S8jMg0u0kIwMu
	 GCmGpuNqH6Gu+30mdpGlMWPnSCdy+oDaL2C9skrCWfM3LwoKnWo0HQ1Yb3be5r5Wvk/kl
	 H1M6GtP5Wa1HNN/oJ/2jwClHvP4XFNkPG1Z673s7egWyO2kG02UoQ23ihaNY6C9Jr8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.ru;
	spf=pass smtp.mailfrom=yandex.ru;
	dkim=pass header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=UWA57DE+;
	arc=none smtp.remote-ip=93.77.172.65
Received: from forward101e.mail.yandex.net (forward101e.mail.yandex.net [93.77.172.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C3E606A31C
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 11:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40C3E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=UWA57DE+
Received: from mail-nwsmtp-smtp-production-main-59 (mail-nwsmtp-smtp-production-main-59.yp-c.yandex.net)
	by forward101e.mail.yandex.net (postfix) with ESMTPS id 55D4D1002E9;
	Tue, 17 Nov 2026 14:40:12 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59 with ESMTPSA id AeXekAUfVKo0-3UYKOkkN;
	Tue, 17 Nov 2026 14:40:11 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1794915611; bh=lNYLM7H3Tkg4FE060j45Wgl3kSBreKgGWMpXxZiROr4=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=UWA57DE+IWroph2aUxZFRWU9wDZjs07bxY7RrA7U4k+MmkXyDacYP+4Fb+jILwq31
	 6l6xA2MCy+wPeZo82oLvydlv33fDRCvKMmL09s1M87XmWZFqYDivXbu6U/kCQOzYnS
	 jkFiUZX0ZveiSFb1oildefGXTzxQFJUzRmRuCPM4=
Authentication-Results: mail-nwsmtp-smtp-production-main-59; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+ffac2da5e6f8ad2671b2@syzkaller.appspotmail.com
Subject: [PATCH RESEND v2] media: dvb-usb-v2: fix race between device probe and demux filter setup
Date: Tue, 17 Nov 2026 14:40:07 +0300
Message-ID: <20261117114007.381382-1-dmantipov@yandex.ru>
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

Thread 1                             Thread 2

fd = open("/dev/raw_gadget", ...);   fd = open("/dev/dvb/adapterX/demuxY");
ioctl(fd, USB_RAW_IOCTL_EP0_WRITE,   ioctl(fd, DMX_SET_RES_FILTER, ...);
      [fake descriptor of Hauppauge
       126xxx ATSC+ device]);

That is, dvb_usb_start_feed() may be called before dvb_usbv2_adapter_init()
has completed frontend initialization in dvb_usbv2_adapter_frontend_init().
Fix this by setting active frontend index to -1 early, this making sure
that such a preliminary attempt to start the feed just returns -EINVAL.

Reported-by: syzbot+ffac2da5e6f8ad2671b2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ffac2da5e6f8ad2671b2
Fixes: 41a0abf71009 ("[media] dvb_usb_v2: merge files dvb_usb_init.c and dvb_usb_dvb.c")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: adjust to silence minor checkpatch.pl warnings
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

