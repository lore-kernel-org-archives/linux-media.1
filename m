Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net [178.154.239.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074EF3314B9
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 15:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771256529; cv=none; b=BS8s+AmQ/euKpXbnxaHoc4CDYB2Qug0bfBr80LRuDfEKWTbBFAULpoC4MydcyEo30eq1PWeoBlWCAb9zXNYqubGF89oX0PyF0OKMTFF7K/8qcFq1/syu2ZLCdvMWMF3ETy8GHVsUFksqYq3SCmHqy1D5/CuBxzVm45brVBbMWvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771256529; c=relaxed/simple;
	bh=Vp8tTKvV3woIv6gQzwznHE5gtZrVi2ltfg8Z1l8TyNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ieelfsB/K8cfaFmr2kOG7t2Jz+vt9p7TyqrPvLCPYULFKyRppdkcdSPnYgerIAa+EEIHCm4mDBh/9k4vcpTkLYBDMEVLd/airanzfLW81qA9tma29x8tBdc3PMiC8iyUS1XXXiE8a3k6Tz7YhcE3m8vzJFKXnoig13+BlX550+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=fENm0xmb; arc=none smtp.client-ip=178.154.239.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="fENm0xmb"
Received: from mail-nwsmtp-smtp-production-main-76.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-76.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1a9f:0:640:207a:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id DA9ADC00D5;
	Mon, 16 Feb 2026 18:41:55 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-76.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id sfaRBDbGAqM0-3ZuNJR4p;
	Mon, 16 Feb 2026 18:41:55 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1771256515; bh=THz3t/yIQekHp0xIuDnVpM7H4EaQY5u7TlgBqBkAdVM=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=fENm0xmb/oU1khUnabqUcM/xEssShSUq3+CUBqMNtsZWW3ffZmi70seUlN7dygyVi
	 XZVvMixpcSKbyDPdzgrwMeluTc6EoWDtNlMLQxJDkZ9phhGK4I9Ol81dVMnFwGrxqu
	 GkP0TXBXEavnuV1MJ+TdS5bWKRggIsSigfgYzocs=
Authentication-Results: mail-nwsmtp-smtp-production-main-76.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+d37184d9d8cc34602616@syzkaller.appspotmail.com
Subject: [PATCH] media: dvb-core: fix dvb device instance leak
Date: Mon, 16 Feb 2026 18:41:52 +0300
Message-ID: <20260216154152.2597331-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After 'replace_fops()' trick in 'dvb_device_open()', reference count
of the corresponding 'struct dvb_device' instance can't be managed in
a regular way (e.g. by using 'dvd_device_put()' in '.release' callback
of 'dvb_device_ops'). Since there is a race condition between
'dvb_dmxdev_release()' and 'dvb_demux_release()' (there is no way to
guarantee that the former always sees non-zero 'exit' flag maybe set
by the latter), an extra check for non-zero 'minor' field of 'struct
dvb_device' is used to ensure that the device has passed through
'dvb_register_device()', has reference count more or equal to 2 and
call to 'dvb_device_put()' from 'dvb_demux_release()' never actually
frees the device (with 'dvb_free_device()' called via 'kref_put()').

Reported-by: syzbot+d37184d9d8cc34602616@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d37184d9d8cc34602616
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/dvb-core/dmxdev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index c946c8ea6e39..c44fd445b51d 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -1254,6 +1254,9 @@ static int dvb_demux_release(struct inode *inode, struct file *file)
 	} else
 		mutex_unlock(&dmxdev->mutex);
 
+	if (dmxdev->dvbdev->minor)
+		dvb_device_put(dmxdev->dvbdev);
+
 	return ret;
 }
 
-- 
2.53.0

