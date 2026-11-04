Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793770090;
	b=Wua/PMFUob3mYLb5t+SuSY/YXmN/kmhpkYv1qOlckC0xuLzmmgdCo5f3tuE4ODEF7d35
	 ErBHUp7nigR7yKIsNQkZk4a4AyCPAktyqTo15B6MIXdn4ejy9NermDFT20u3KOdAS+KJP
	 pPhURcOXtuAVclApGwUtdO1xfQ6TdjMyxC8S3/9iCpnbjlnovBki0BSsMmdZpwpssiVq/
	 7zZvRtOSPIcyi1hmpLUxVEagoL/dDegL+dV7Bij0os17rmjtS1JEVnbrNQJGNTCwTj7ja
	 6U76tEvq9RIu6cBVvcG/IzZ9cuMFtBZBF5QVQWxLPwop0CdTNk39HMcXQRkjBmhbwpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793770090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=irQAokomBOrEvq1E25b1/yaWaEKJedcNM9avak0rsxM=;
	b=m76eHb5m9nCxLq97wAdJ+w7duLSb2oxiZh02KVjD9JEFy0SH45O945UVcnnndiiz5SxL
	 6AsT0pCtgWWzLUWJ5qQgADSwE9HIFPj6wCbQLBkET5ki0pX3YsmKy6W/DfRSH+t1G1sie
	 Pkz8+FKcMwbUl+zRVjMZFMyROsrhcQKxbzC6IGhFyWEgDS9+dBoyyLE8UokkhWNO6c2YL
	 hgoTcsRT5oZKD5s9mXNcdqWoNpt7jNTr6mOg1VvPq2CM8iOTkY/6rWkrdad8dl4M5M8Zj
	 BZXzQhg4ZCOI9x+RY5nV3h7fPKtrEZU1EPkld2Q1aLG/2pBJrjbYwTwjn8/1k/JnIxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oAnu04eU;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70239606A328
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 05:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70239606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oAnu04eU
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso140002f8f.3
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 21:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793770087; x=1794374887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=irQAokomBOrEvq1E25b1/yaWaEKJedcNM9avak0rsxM=;
        b=oAnu04eU+s3LGkUx1jwkqz7Twro5AjH5asleqtuon57Etq/k0ktcWSor0iWMB0/l3m
         fJ9E75NjnOf3htVo3Mixg2r95tpRcUZ5aPiupyVY7H+nuJbKLr3nB/AZ/LcopLRhFPTk
         l4/oooMuHStQY89DRz/4dC3LlbRlJPq9rY9ijo4IpoVZaKejlzAD6U7ZtMgLUYlakxe3
         JkFzpM+ndtOyjIsFDAWfOKQwsMqXL6lKHnRkqr/MeoRMW9UfqANYsTNdFdQBR2k7Ex6A
         VJ2jwbWIaT46VKs4uL6gotYb4fngQ1RtXzxNxYKkb97QymYrMszkXGOYcYCrIZdchKaN
         Wypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793770087; x=1794374887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irQAokomBOrEvq1E25b1/yaWaEKJedcNM9avak0rsxM=;
        b=EWvVTqlibjMehIfdPIACbG+V3LT/xGFXSsvnoCVLF4ckRYbj1wiNR/8ph4LBINXS71
         kJs4EYHxtcm1sFIOravrPinBxKaP/ctpx8eQRNbepWnjvZ1BmLDqZZ5lNbmEv5mdXUns
         jqMZ8S3PhRonmR2Cy+wexmfypL9RsC3/p1kf8JCFIE7qABH3YLT4DVHVolo5Q89UiGl7
         DVMHKvgzrs2GuNpj7SQ+Vb91kPzBakKOuWVUkZeYRXQtlgGEyWRhzMAepRNm2dWJ3Vfq
         s2+RFs7LpHBGh8tPE54jYLDooJRhGjhYPZnfuAwdyNESlxEKDuiTJ4vkrQgYAFVgDpKK
         gMAw==
X-Forwarded-Encrypted: i=1; AKwUvBw0Z3U5hMKHBEZueNHc//2/qnUALdegFjk5S5GJCm2l/lWVw2idIvjh0XxblbxsZp9XBOurC4P1rZmsmQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+mLduqRxAU9SMnf/pNXiY3h4y8s2xZpp/CwpjVN61HQbmvc0Ar
	DOMVyjCiGCnfdoy94jk6WCvjMjMPbqYVOwpCGNA+mbEbbx8luGehHBa2
X-Gm-Gg: AYBFou3EDw8ZgES6O+q2Xr7WRWzXEYqvLBIwvnQvdR9afFfCUFtqLKWlKjS6HjTWK2r
	mT6Jc4ACAignVfPyQnjCy63Y3rOXrewDQnBTFASSffMzYs8qcWeSiAqbdD1xxG6fQLH9D1t43QO
	XUOKypcOL/8bnMnCQrN+znppjNNjUYDS+U3/ifR9I2Lc3IfirxE8mvbZ5gUT1Kuky2DXttSbXK6
	y3d+uX8zLVVe/0jX4fp5CEdAj2qGpISpySHyxSDd5R9pghYEXmgPlDZHMr/c26dUAkBGogg/dtl
	SD9Z3phXATZW+SZ6Av3sGjjNVLgTXnclbQHpjWAZPk8eUEvA8B9rDopEuwH+eR/VBScRWCZc0t8
	QTP4xMvTyLOGBdLUQaU8GFK+5bPdFX9lpSlpzntIaNBqQAFlmRPc1jxFsUOCsJaXtg8Dl67wIOU
	6iYCjEWixbYAWG0V1hUKJcdoE9l6jfG9hFfvUb7G6ogoGbErjNt28Dp5Zk8yyATOT4Bf3R/g57S
	CWYO8h+fbUjQp2CqxW6BS1n45drqv2Or8hJp7EVMuFyU4pDiivqac/0yJZ+29hM39pQ4MZjn6wV
	eF9omdn7NrUOOsZU0/X0530D7nNTmqkh8JErbMwpCJztZ04alvWFMItBw5cZU+ZYiuTJQPFG8N0
	rT3/1lw==
X-Received: by 2002:a05:6000:4301:b0:48d:ff0d:cfa5 with SMTP id ffacd0b85a97d-48e6e50049emr34787634f8f.47.1793770087179;
        Tue, 03 Nov 2026 21:28:07 -0800 (PST)
Received: from recorder.play.pl ([2a02:a31a:a1b6:b080:1f0e:f037:ff95:4265])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm1917062f8f.45.2026.11.03.21.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:28:06 -0800 (PST)
From: Greg Sikorski <sikorski.grzegorz@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	"Jiangong . Han" <jiangong.han@windriver.com>,
	linux-kernel@vger.kernel.org,
	Greg Sikorski <sikorski.grzegorz@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: em28xx: fix NULL pointer dereference on disconnect of dual-TS devices
Date: Wed,  4 Nov 2026 06:28:00 +0100
Message-ID: <20261104052800.44551-1-sikorski.grzegorz@gmail.com>
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
ever linked, so the use-after-free fixed by 826915b6b65e stays fixed.

Fixes: 826915b6b65e ("media: em28xx: fix use-after-free of dev_next->devlist on disconnect")
Cc: stable@vger.kernel.org

Signed-off-by: Greg Sikorski <sikorski.grzegorz@gmail.com>
---
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

