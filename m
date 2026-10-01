Received: from forward100d.mail.yandex.net (forward100d.mail.yandex.net [51.250.60.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E153EC6B6
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 11:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.250.60.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855138; cv=none; b=KAcYgozdl2HgPL2Fvzs+jMlxPlKoxUWGOIWCk0++AIfNWsd1P+if+k4xw9FptmCnDgEk6w+UT6mE1vv0DdEcbExYNX0PVQ+dCR/jD8R3VlhbmIMf3sDjnxkpIyALfC3KfRNwDv4foQLUNhy17q4uptzbVjVSyrCXLLFKiBPBqxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855138; c=relaxed/simple;
	bh=xl/HXJmScpW2McvuB+dyGJKedWY49+uPe0homLYGn8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L/orQxP18qsmg9CZyH59HSlKq4siOvlIir1MGEJTVzwLH9Tl6QDy0Ohqeu7ox6UKwR1Co5C9xPgY40rutzC4JjGQurZipVRTtBCzdp3Z5uchA3I8wwAgowZxw5iTKwzVdxfZ1hrNWi2iLpPuliO18KRU76ZPFfO6dJ/pvVq+7ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=DI29qlC7; arc=none smtp.client-ip=51.250.60.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="DI29qlC7"
Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d102])
	by forward100d.mail.yandex.net (postfix) with ESMTPS id 00D61C7CAD
	for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 14:45:14 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1c16:0:640:6bcb:0])
	by forward102b.mail.yandex.net (postfix) with ESMTPS id 8D7C8C02A9;
	Thu, 01 Oct 2026 14:45:05 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net (smtp) with ESMTPSA id 2jiXfDEhT8c0-a70EwWyX;
	Thu, 01 Oct 2026 14:45:04 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1790855104; bh=yp49sMV1n7S7du4BoEf6Z0s8gu7Th3L+hXIqXzzljD4=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=DI29qlC7WDkiyzT9Ew1FIDNWDzrq/E2wbg3Nc5dfPFeNUGnTbvwh3llvYV03M6Eyi
	 FA0aomPlp2XeWgxs0UpRcj+PHECvfEqnl/UsKgb2IUprkC6gnFdwmaBYbFmicXdXN3
	 +rDZhwAAmGV4PuaLmFafIc/Bmv3JEpiOsPQCjTjE=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sentaro Sakura <s.sakura11500920@gmail.com>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+3df044e20e6ff1fb3cf5@syzkaller.appspotmail.com
Subject: [PATCH 2/2] media: dvb-usb-v2: core: do not use an unititialized frontend
Date: Thu,  1 Oct 2026 14:44:57 +0300
Message-ID: <20261001114457.556719-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001114457.556719-1-dmantipov@yandex.ru>
References: <20261001114457.556719-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set 'active_fe' of 'struct dvb_usb_adapter' to -1 (indicating that no
frontend is ready) early in dvb_usbv2_adapter_init(), thus preventing
the very premature (before dvb_usbv2_adapter_frontend_init() has even
tried to setup the frontend) streaming attempt from dvb_usb_start_feed().

Reported-by: syzbot+3df044e20e6ff1fb3cf5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3df044e20e6ff1fb3cf5
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index 1f933adae46c..e54a002676b9 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -630,7 +630,6 @@ static int dvb_usbv2_adapter_frontend_init(struct dvb_usb_adapter *adap)
 	dev_dbg(&d->udev->dev, "%s: adap=%d\n", __func__, adap->id);
 
 	memset(adap->fe, 0, sizeof(adap->fe));
-	adap->active_fe = -1;
 
 	if (d->props->frontend_attach) {
 		ret = d->props->frontend_attach(adap);
@@ -752,6 +751,7 @@ static int dvb_usbv2_adapter_init(struct dvb_usb_device *d)
 	for (i = 0; i < adapter_count; i++) {
 		adap = &d->adapter[i];
 		adap->id = i;
+		adap->active_fe = -1;
 		adap->props = &d->props->adapter[i];
 
 		/* speed - when running at FULL speed we need a HW PID filter */
-- 
2.55.0

