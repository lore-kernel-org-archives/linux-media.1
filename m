Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net [178.154.239.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083A5390990
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 11:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855140; cv=none; b=DbumMADu4tIteI9p7CIq5h7DBsloTt6+oUnX4T89NcBVlvZpjO8xtpnNbkPe7SLXQD+vgGxlkOu86Wj+a6rIvqlA7kUS8T3lqEqshztmcM2smYC4piUiF3UecfP5prC48N4TChTGRxIS/oxnNzsmlGai29mx3R2vkBCwJiYeRSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855140; c=relaxed/simple;
	bh=iDjEIPc570MMBpahg44S+6SDrgqcoYWkwsImIvpdT+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=geI1fa0IqzWXgH/22Rr/v1eHbwO6g069bkBmmZPs+SyxVFHLGTyVtgOWkeld3cd/V+MJmRbdNFBfGHk/NGiAybpvT246o+aGZe424KYqsOzmx1wFp263Cp6gUGb/yhoePp99kaEEIinXYGZtorcBFf0F9tyvqs8ccHFtHjhSmJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=AEmtVy7w; arc=none smtp.client-ip=178.154.239.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="AEmtVy7w"
Received: from forward101b.mail.yandex.net (forward101b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d101])
	by forward101a.mail.yandex.net (postfix) with ESMTPS id 951B18046C
	for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 14:45:13 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1c16:0:640:6bcb:0])
	by forward101b.mail.yandex.net (postfix) with ESMTPS id 8761DC0150;
	Thu, 01 Oct 2026 14:45:04 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net (smtp) with ESMTPSA id 2jiXfDEhT8c0-ivB7LG3J;
	Thu, 01 Oct 2026 14:45:03 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1790855104; bh=WYwCH2aTUUpdOvGfxteMkWaT7FcmpiuSaeOU1vTcOdg=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=AEmtVy7w7FpV7gOv0qDo0pmOjTcmdSCUS3QtUtJ9QE8AAFtbck2yWWT/Cpai09xiB
	 ko/3Yk+YTw35f4m4UjGoob8CbOdddiCAhvN12b8OgK6oIo2ta5VLkdKTyllZnsr+xO
	 zmVWPMS56XquBqgaTWzsIC4e3NsTSD00AQQfzf6s=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sentaro Sakura <s.sakura11500920@gmail.com>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 1/2] media: dvb-usb-v2: core: use clear_and_wake_up_bit() where appropriate
Date: Thu,  1 Oct 2026 14:44:56 +0300
Message-ID: <20261001114457.556719-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify dvb_usb_stop_feed(), dvb_usb_fe_init(), and dvb_usb_fe_sleep()
by using the convenient clear_and_wake_up_bit().

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index bd86d250433d..1f933adae46c 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -376,9 +376,7 @@ static int dvb_usb_stop_feed(struct dvb_demux_feed *dvbdmxfeed)
 	usb_urb_killv2(&adap->stream);
 
 	/* clear 'streaming' status bit */
-	clear_bit(ADAP_STREAMING, &adap->state_bits);
-	smp_mb__after_atomic();
-	wake_up_bit(&adap->state_bits, ADAP_STREAMING);
+	clear_and_wake_up_bit(ADAP_STREAMING, &adap->state_bits);
 skip_feed_stop:
 
 	if (ret)
@@ -580,11 +578,8 @@ static int dvb_usb_fe_init(struct dvb_frontend *fe)
 			goto err;
 	}
 err:
-	if (!adap->suspend_resume_active) {
-		clear_bit(ADAP_INIT, &adap->state_bits);
-		smp_mb__after_atomic();
-		wake_up_bit(&adap->state_bits, ADAP_INIT);
-	}
+	if (!adap->suspend_resume_active)
+		clear_and_wake_up_bit(ADAP_INIT, &adap->state_bits);
 
 	dev_dbg(&d->udev->dev, "%s: ret=%d\n", __func__, ret);
 	return ret;
@@ -621,9 +616,7 @@ static int dvb_usb_fe_sleep(struct dvb_frontend *fe)
 err:
 	if (!adap->suspend_resume_active) {
 		adap->active_fe = -1;
-		clear_bit(ADAP_SLEEP, &adap->state_bits);
-		smp_mb__after_atomic();
-		wake_up_bit(&adap->state_bits, ADAP_SLEEP);
+		clear_and_wake_up_bit(ADAP_SLEEP, &adap->state_bits);
 	}
 
 	dev_dbg(&d->udev->dev, "%s: ret=%d\n", __func__, ret);
-- 
2.55.0

