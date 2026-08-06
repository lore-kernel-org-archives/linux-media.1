Received: from forward501d.mail.yandex.net (forward501d.mail.yandex.net [178.154.239.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B85430C16A
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 13:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786021907; cv=none; b=D4egItHCbFq5zp7JOBeGdMfjpgLzjGuGJq36/bkL8kD+a7Y+uj9/1il41eOtgYhF9WevYbmvkCKppNyjYUnw47ItrmDpEWf86kIGVyXnWG24FnSTjzDQIla/iD6Tlt6JBSjbWgsaafpxhpIxeCVMT8SUy5wb2tAfRuu6Ddd/l+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786021907; c=relaxed/simple;
	bh=d6IQAKcKxsqs8N0XeJuuYu4zgWOPVJb0Dm7BtZ1kdxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJ17qRhIn4rAhID9PF9/MporgoH2vEZe7CjxObawgoojTs/5I/nkMoYsCo27nYYy0FVDZsfJ12YjjLOnm8hwrFXdnhR77jXInq3Hj70L+hPb+N6W5GCtOa9ITr6L1pn3O+idXTIkqvQ4823J9LCcj5YBWYC958lk3knmTA5IMyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=T7OiYstN; arc=none smtp.client-ip=178.154.239.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="T7OiYstN"
Received: from mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:ea2:0:640:ef77:0])
	by forward501d.mail.yandex.net (postfix) with ESMTPS id CD28781E8E;
	Thu, 06 Aug 2026 16:05:27 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (smtp) with ESMTPSA id P5J8vuAgIuQ0-lBq8NUHz;
	Thu, 06 Aug 2026 16:05:27 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1786021527; bh=LGNn+cydWZuJghaF1UCSd09r5fUkc5z2kYFCQGsKqd0=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=T7OiYstN2FAsTsCxJfjHmfb99TsoH0MU6QXUILY7nZ0J9OHmzpQ4Kbhx3gxTyWLY/
	 H866BixXdYyWpudw8N98zaOloYjF4NtcylTKSJ2+7RgXcaqSixXyAHzXMm3EVWNBgm
	 rFgHOPvkEGJLVksFfNQB0ET5mnS7k7HkJMh7CMso=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <a78eff76-dccd-4f3a-9487-abb511bd44f3@yandex.ru>
Date: Thu, 6 Aug 2026 16:05:25 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: redrat3: fix use-after-free in rc_dev_uevent()
To: Sean Young <sean@mess.org>
Cc: Johan Hovold <johan@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 lvc-project@linuxtesting.org,
 syzbot+237c754233330b2bf565@syzkaller.appspotmail.com
References: <20260806121021.25156-1-dmantipov@yandex.ru>
 <anSEMRFIW1LGz5mC@extorris.mess.org>
Content-Language: en-US
From: Dmitry Antipov <dmantipov@yandex.ru>
In-Reply-To: <anSEMRFIW1LGz5mC@extorris.mess.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/26 3:55 PM, Sean Young wrote:

> you need to call rc_allocate_device() before you call redrat3_enable_detector()

If so, 'rc_unregister_device()' should be called immediately after
'redrat3_enable_detector()' has detected an error. That is,

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 3f828a564e19..d2a805dbd3f3 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -1111,13 +1111,16 @@ static int redrat3_dev_probe(struct usb_interface *intf,
         /* might be all we need to do? */
         retval = redrat3_enable_detector(rr3);
         if (retval < 0)
-               goto led_free;
+               goto rc_free;

         /* we can register the device now, as it is ready */
         usb_set_intfdata(intf, rr3);

         return 0;

+rc_free:
+       rc_unregister_device(rr3->rc);
+       rc_free_device(rr3->rc);
  led_free:
         led_classdev_unregister(&rr3->led);
  redrat_free:

Dmitry

