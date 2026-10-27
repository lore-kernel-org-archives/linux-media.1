Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=93.77.172.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100642;
	b=XSOqY6azmH5eCMeqRyWqQTGvaY2dRFyregH4bA2d0Eomvhpi2Elt2YmfJmrdhElbaI3s
	 9pj3lk4B6M8PlBrtFojZMDkh32lm2JiWXuxcROz5BSiwKFEXeaeEPAyIlJpuc/9bC/IZT
	 1zRJ0ynN96AmBRnVlDnyat/BtpESAt+V5aEeZQdRjsilY4/GlSV8O09HJrZiG5ELVzxiQ
	 n+XOfKDYKQMoaihKoqL3aQOpwWtG5qBPq4uZbw5eB6tWuDi3g5C0celygo5OihvFjpa05
	 /jfQS23tST+MdW4Kl3Cy0qWU0k5gQk7a0TNIF90yoe5nV09RiO+NZYaNj/lOBVTFtIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100642;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HRxQFsP22qE3DuGtNfog8bTTpZGEnhPT/T773Hv81uo=;
	b=j5a3gS7SYqT4IaQnXPqjHqO4MEF8/zncDZG6Oj4dFNUa/5hKt80jtUffBPEgWvf8G+ur
	 5/vB7dT6k8TY+rlpit/zlG/ZSwjiZ73gxvxR34A/Mh4cDRWWD5D2Z7wsY5+btBUOxF670
	 17ZxMblFbnhUgnGZrRxPp4yzQuo37pFIOsdY+p4k4LSlceKr0ELAmXunrSOh4WMQDfpZo
	 SHkmn17quufXmr7gj4E9EqOMAz/Wg5UDXeUXLL0HBWl3x49bhglKE5+Ubn55OgY+iAOlV
	 STq4oPDDeQRajVxz5U7/6gizofDT3/FofyaHWwtf3jf1FIQ/uho0LDqXGrRFI31ryMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.ru;
	spf=pass smtp.mailfrom=yandex.ru;
	dkim=pass header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=H2xlyhTu;
	arc=none smtp.remote-ip=93.77.172.68
Received: from forward104e.mail.yandex.net (forward104e.mail.yandex.net [93.77.172.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC731606A31A
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC731606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=H2xlyhTu
Received: from mail-nwsmtp-smtp-production-main-36 (mail-nwsmtp-smtp-production-main-36.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:351f:0:640:8d94:0])
	by forward104e.mail.yandex.net (postfix) with ESMTPS id 11B6FC0033;
	Tue, 27 Oct 2026 14:30:30 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-36 with ESMTPSA id RUfjqj7dkmI0-BTFFvkdF;
	Tue, 27 Oct 2026 14:30:29 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1793100629; bh=HRxQFsP22qE3DuGtNfog8bTTpZGEnhPT/T773Hv81uo=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=H2xlyhTuSCsZ0cZlb7cOSOjRGmUfQ5jaIXv59TlM62Q/mXZ7LwxBGD51P1n2DoWGJ
	 dQ22VYJsRMCsK7kg0aHjVleTMYiauuuA9/jQ1EhI57OS0+VZWAhLFZH+qdEhZMwGy9
	 lj6c527zcf6x+i/lmFv5zxVBC55bAuWVpmS5vavU=
Authentication-Results: mail-nwsmtp-smtp-production-main-36; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+ffac2da5e6f8ad2671b2@syzkaller.appspotmail.com
Subject: [PATCH] media: dvb-usb-v2: fix race between device probe and demux filter setup
Date: Tue, 27 Oct 2026 14:29:35 +0300
Message-ID: <20261027112935.438267-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.56.0
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
2.56.0

