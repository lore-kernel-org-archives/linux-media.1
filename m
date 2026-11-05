Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862078;
	b=TlXzOJw/u36c38W2CAVCUtve75HMADvMp62xMXrVOxFL2+uU1253m4aduSs2NOl7DrUn
	 UWbH+CSY1wyhTGcblr4HNBsNxCZytEd7fbf+XW3VRJ+W7n76rlajuIMnlbcVD1IZCpvsv
	 FKdGpzwK3aSj3fczSXuigPd+mj5Zj7UCi+FRQtE9qYTMdia+7egnXqxFr65ulEFwOWS9/
	 SPfTmECNyN0Ky5u82VEQ9eRVtaz4APMQfJLLHVmQt9HC0LfHjtVEJRcPlT6zOhKa5pJjk
	 ripNCiQWUG5eShWQ2gQygcbPZyUC3m3a9QJH+/dLugzS3ripkLK0mpzwja+XpzMwT7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SvleQPQxuspsOfczyKT3no41nY6ahcqtcV2ZKq+gdBc=;
	b=Rlr91NlIzZJP/jWklqcFF6MAMV0syPNu9FM7QhigpJGNusk4kEkdxj/dpHDo259OzQOF
	 m1IWw5ZPgpP1gjhU0M2KU5h+6iX0yg4iZ6bUtl8+U98v/DF5vitbXYcIbtUjmvdtTvx7d
	 VKssuI6DHhgiwldcLiGdQ+Et8goC6zPo3ckww4nfIrc7/oi6bC5f4P5flWnKBB1ybEFLs
	 qFApeKRD+1AfOMeCHHL92tIXIMrVsViNjrDEjQ2EwLuyjsg+85oP5g2V7EZaSIMdRD8w0
	 ha1RhjbjbnMWUXu9ZU8PXxkhQehKakv1cAwoDsnfnNJjGH/YH/6iq9G7e57j9AfynXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBVGU0ye;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E97606A329
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 07:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3E97606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBVGU0ye
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so14642405e9.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 23:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862076; x=1794466876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SvleQPQxuspsOfczyKT3no41nY6ahcqtcV2ZKq+gdBc=;
        b=cBVGU0ye0km98YY6rzSibqk+YOAsqmuO4VwxQySr2PTZe6uVSSv5E5s4Xm6GbHnTCi
         3N8J66tfTEzlqxB8nVaqFyFM11xBt9AMdClhypKG0mArGQ1WDLqGPIpyqvvaBIAGdM4Z
         annPeaQAcJa+XU/dJ/6003fAQXMqUWBHADzYS7pmBzA42kZ5eveMdGXdtTruvtOzHjRq
         qF4/cJs/+hpO33mcZ+IcCgO2llfdn0ndXRV/V6Yz1XKVXltUg0pWfUkC3TeOx5YPGuDK
         mUS1Fx/NKBJfh8us92VTcA8YEnNxgFtNkeURSpjm9UugHdoTQemevikE6GVo3ydLCenD
         HBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862076; x=1794466876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SvleQPQxuspsOfczyKT3no41nY6ahcqtcV2ZKq+gdBc=;
        b=gQJ5veMbWNvFqfARswxi1NDxRlQ3hHWoMMrOzyyfqDMwvHKJjfZmDwC2N6CCMQwfDA
         Zkl+mFfPOaB/8aORWSXLMs6+kGQHrCyMvhOPLxVZXNqO7eiCgXsfBMvQFAFnJjVsWF+5
         zoSr7kltZCWy6jNQkgtxVND4E3JwN3G94r2OS/zxteIcVilNBuBlPvxXVJoB+m8qS+6U
         WrPELJfckgjvZKfmZ2mejdiDhbSBw8xmajKYoKXhBchHeHFBsTNIkv4ozTtgvSgDz143
         4xPZ47mKX544IqF64ZLJGvr0eMox3p0uDITrM5jBlBDHIYBu2wJk+yqVI247wrvh6s0P
         172g==
X-Forwarded-Encrypted: i=1; AKwUvBzNbvSkVetSg+tuATT4gZpsmCyjStDWHssNIbQc0dGh3jKMNAvnAOPAdpsIleNIEL31aGJ0LNFhhAEBaA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+xh/YVpQwJ47aPpkenE+kWtJEHlxFQca/SJm7WYP4YaKdr4hDB
	LqSCBgeaZR5Qt+vT2KyZibaxI/w2rwn+48jDYw9ER17i0Pf+6Yf7JXmH
X-Gm-Gg: AYBFou0CQPlcx/n1c+loE571aRVeHrp/ZxJL7GdiecQCz2QFiNFvbtS094ncZVmaCRZ
	cxEy6upmttY/Vk7/c5BG7YMP53YcE8QhZfC5jOn6MpMv2EGaY/EhqPsGtjD/oSxkHyrRExM8mkt
	YLDvCNrhSNbWRRsLzpfsaEITbZzBSpD+n0HSgpqrZ+4OuyEJYvZgzJXi+emk73nqEyieDPhAyuj
	hDIsfC/7aEpGjhRGgbiDrjtlPbA5BsYju9hUofpkdqGtmDnh26H1A9X9LYvoYMdIYhExC9TDgZ2
	nw8oQTBQcYygrX1sfVZr8XHLqpNyKhB2PUx9dekV+rZareb62Pj4PeSdoVT/nFGo1l8WenRPEKG
	ZnwIl/8NF0IlA8cXGCpIyIEAduw8uvPwt2I1+2YBo/iCMnxMRtLGDIBDCSb8iff01u+h5pgLiBg
	bIWboCntUJoUcmTvST8c8RQq8PxKKrw6bq8Zmkyme/IV2nborRkiMDrI0UPQZcb3cjaw/0A5SNP
	1kWjbBqUo58fnD5+N2vFATvJeVvOz7v238dJKsUYupcO09J+KY8wvxvsVM5DXNKG3lmyvdYsuOP
	mnG4lRuRIQ0RYWnPJB6BrBrUjZk+n90JqzlRUADDRgjIIheNkEjslGjiY0agJlw+HCdKfuDHiND
	BBDxi0w==
X-Received: by 2002:a05:600c:6095:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4ac18b7e1c1mr359585225e9.23.1793862075779;
        Wed, 04 Nov 2026 23:01:15 -0800 (PST)
Received: from recorder.play.pl ([2a02:a31a:a1b6:b080:23ca:4af6:2cc9:8091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba0f3sm40116155e9.9.2026.11.04.23.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 23:01:15 -0800 (PST)
From: Greg Sikorski <sikorski.grzegorz@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	"Jiangong . Han" <jiangong.han@windriver.com>,
	linux-kernel@vger.kernel.org,
	Greg Sikorski <sikorski.grzegorz@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: em28xx: fix NULL pointer dereference on disconnect of dual-TS devices
Date: Thu,  5 Nov 2026 08:01:10 +0100
Message-ID: <20261105070110.122371-1-sikorski.grzegorz@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104052800.44551-1-sikorski.grzegorz@gmail.com>
References: <20261104052800.44551-1-sikorski.grzegorz@gmail.com>
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

Commit 826915b6b65e ("media: em28xx: fix use-after-free of
dev_next->devlist on disconnect") made em28xx_close_extension() unlink
dev->dev_next->devlist from em28xx_devlist. On a regular dual-TS board
(e.g. Hauppauge WinTV-dualHD, 2040:8265) the secondary device is never
added to that list: em28xx_duplicate_dev() kmemdup()s the primary device
during probe, before request_modules() -> em28xx_init_extension() links
the primary one, so dev_next->devlist is { NULL, NULL }. With
CONFIG_LIST_HARDENED the inlined list_del() validity check dereferences
the NULL prev pointer and every disconnect oopses in usb_hub_wq with
em28xx_devlist_mutex held; the device never re-enumerates and the USB hub
thread stays stuck until reboot:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  Workqueue: usb_hub_wq hub_event
  RIP: 0010:em28xx_close_extension+0x80/0x130 [em28xx]
  Call Trace:
   em28xx_usb_disconnect.cold+0x87/0xed [em28xx]
   usb_unbind_interface+0x9b/0x2c0
   ...
   usb_disconnect+0xe7/0x300
   hub_port_connect+0x7f/0x930

Initialise the list head in em28xx_init_dev(), which runs for both
devices (for the secondary one after the kmemdup()), and unlink both
entries with list_del_init(). That is correct whether or not dev_next was
ever linked, so the use-after-free fixed by that commit stays fixed.

Fixes: 826915b6b65e ("media: em28xx: fix use-after-free of dev_next->devlist on disconnect")
Cc: stable@vger.kernel.org
Signed-off-by: Greg Sikorski <sikorski.grzegorz@gmail.com>
---
v2: refer to the fixed commit without a bare sha1 in the last paragraph
    (checkpatch: GIT_COMMIT_ID); no code change.

 drivers/media/usb/em28xx/em28xx-cards.c | 1 +
 drivers/media/usb/em28xx/em28xx-core.c  | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 8440eafad..4d2ea2e27 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3845,6 +3845,7 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 	const char *chip_name = NULL;
 
 	dev->intf = intf;
+	INIT_LIST_HEAD(&dev->devlist);
 	mutex_init(&dev->ctrl_urb_lock);
 	spin_lock_init(&dev->slock);
 
diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index 62a1c25a2..ab1e1e18b 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -1263,8 +1263,8 @@ void em28xx_close_extension(struct em28xx *dev)
 		}
 	}
 	if (dev->dev_next)
-		list_del(&dev->dev_next->devlist);
-	list_del(&dev->devlist);
+		list_del_init(&dev->dev_next->devlist);
+	list_del_init(&dev->devlist);
 	mutex_unlock(&em28xx_devlist_mutex);
 }
 
-- 
2.53.0

