Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06BC56C657
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 15:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966439; cv=none; b=lJZ0J0nBUYm0AIuMuoHexoz8G8zliVwhjATRLN94tXKX1hDqrrycs77FCq3SWpOABNQzLzRfHxeXcRbE2q7/ppMbFsyHniFveJijR1upRHrB5P/TkWu1XIKkU69WileAaG35WY6T8TVR+dXW859FiBH/h2pBuLiEt9YkIznhLf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966439; c=relaxed/simple;
	bh=Z2au/zKMsNaHmguNeaqh+iFtHuoMEhLideBKGSi0+Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KROS8M4DMXl6iOR0EcBUWsJOX3ml7g8QPD960mEGp3ctXZfalxZO+dcUGsfQJ7WebsFM5obOO9cweY+20UdcvZcSTgE5JPJ35HFwvfR9EDhmds/U3rTszZwyUjY3hETO/b/aE3Fda/ZphGjwP5vei8nWnu/w/mDnYSKSkYVl9d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzSlAHYQ; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzSlAHYQ"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-86d43cdee51so75100387b3.2
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 08:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788966436; x=1789571236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0bL+hQaKHbTQh2MApIdEHF5AP7KIOzy8y9uYEIbPJE4=;
        b=jzSlAHYQsAO3FzixCIznkLMn8WmxFxUTjkS5QMDd/F5yhRosHYzF4ZqzLq5hxKtJy+
         L8cAXzmWDUARYZSTxZmAaWcoBIt9KEzLKcR1EaPR1jsqW5ogRBYqRQBptonvd12NbErX
         a2B1DuEjHiM03cJFn2SuXLLGjwZtk2m+5IbhhVRp32yFKeGh6js4SiN9UhJ7DwKLU117
         WMGypGGsc1by28870T++rdt5Ja23Sr/VtH56R4LfVUe/A8XRSp2X7Aj6UWmt9HrmEe2m
         EzKePvrTgzRLvODkL9WXopRD5hGMjZ000D6p87MogJTJ+seatKzzBRJtet6723GbQ9iF
         QPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966436; x=1789571236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0bL+hQaKHbTQh2MApIdEHF5AP7KIOzy8y9uYEIbPJE4=;
        b=eeQmTaDQzjZpMzgq73nmVC1odBWB6CLcYAezNex9ATyYhtWFVKo2G3K0td5cAwLz/B
         gUViKAG3Aqxatd6xM7R67t00PvuXj6R/9eBXgbA6Wx/gk7kMpwdxOwzI0w5GJI7UVFiN
         vnKKwgrBubqsxcQNu9GXg1fwZPxG3/2u/JlzrfCgm8Z3NOfJ+eb8pRgMCQOG5eMuw78i
         xfTBEgvTTBvOh7ApxsdAKWyrLZzog+yEIbjGg0BcMBGIKGMs8EmNeULlsFaIwDdaUIkV
         RmrHnU3kcwPeLWhvce+qZ2QW6SmkaQSn38SCda5KAmlrXWwpxlPoU3jv8DqzYYbyX24G
         i8nA==
X-Forwarded-Encrypted: i=1; AKwUvBzyyBi+5yOy0nbgD8IsiP973nOND4JqbXGjULGGD0YPG97qWR1u4/r1cgp/foWwOwujDjfcukTJ+lnGAA==@vger.kernel.org
X-Gm-Message-State: AFuF++kW8rZ65bvB8awvup+syTPttPCxjuNJstpQaAnagnmRgTtH2TIF
	NnH5bgJkn0RqwqG4l10wYzhNlMA4U105S+W54/h75R25mhSYeQh+h9DI
X-Gm-Gg: AYBFou3e20B0/7vbl2he8SuEc6jzZWzXzWgSYyLDiNscsJY4OwfwpASQIV5F1p5FOvT
	hMCAc3Yx4Ma1IPBgsuwh8he9pxxdWPrRaILiUxrQwARCh+FESwenLX8A3Qy9tGLytbcG8FT/fgT
	XQQg677Ai69ZIGBngheAtXGB+GFvdutCeLhUcFfHY10UzWVtEk3AegmFVso5PrZtwwVx9y86Y6a
	DRn5KoUXgQQx6+Xyl9g0aXBIIlhkUxaes1F+PBi/fF6Q8ax6EFk/cppKUoGjzKq3utXCeFzqHsU
	61XLV9uX1N5aInMiI/LA7rE4P0Aypl5M4vZKvr+cqnzy0IC+QTI81C45ok+kZ6LNGIh4phU/3lc
	bfHw/Vk2eU6UBk6910IQfUntrpOZt7hi2df5hEKUwsNMmZd0Kj9+VvQOG53v0cOyGLi93Fuqo/+
	jhSda6achXQs2aV7/a8nvIt+M0yc7qG21qWdVbS82NIJstOmknhuWyo7xZ2AGSd9+W8046KaAj
X-Received: by 2002:a05:690c:c00f:b0:833:f9bd:b289 with SMTP id 00721157ae682-8712c90aaf9mr108547867b3.31.1788966431841;
        Wed, 09 Sep 2026 08:07:11 -0700 (PDT)
Received: from adriano.lan ([2803:9810:3d22:1608:e46d:9e65:1b2a:35eb])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53054207c16sm141409421cf.28.2026.09.09.08.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:07:11 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>,
	syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3] media: as102: initialize mutexes before registering frontend
Date: Wed,  9 Sep 2026 12:06:44 -0300
Message-ID: <20260909150644.232424-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bus adapter mutex and the stream mutex are initialized after the
frontend has been registered, but the frontend's stream control
callback as102_stream_ctrl() takes the bus adapter mutex, which can be
used before it is initialized:

	INFO: trying to register non-static key.
	...
	as102_stream_ctrl+0x27/0xc0 drivers/media/usb/as102/as102_drv.c:259
	dvb_frontend_open+0x7eb/0x1410 drivers/media/dvb-core/dvb_frontend.c:2825

Initialize the mutexes before registering the adapter and frontend.

Fixes: 41b44e041811 ("[media] staging: as102: Initial import from Abilis")
Reported-by: syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=2a3de29133b40e8f69f3
Tested-by: syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
Changes since v1:
		- Succesfully passed available repo. Added Tested-by tag.
Changes since v2:
		- Reorder commit tags to fix warning.

 drivers/media/usb/as102/as102_drv.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/as102/as102_drv.c b/drivers/media/usb/as102/as102_drv.c
index 6b1d3528a0a7..a6dd675689f5 100644
--- a/drivers/media/usb/as102/as102_drv.c
+++ b/drivers/media/usb/as102/as102_drv.c
@@ -287,6 +287,12 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 	struct device *dev = &as102_dev->bus_adap.usb_dev->dev;
 	int ret;
 
+	/* init bus mutex for token locking */
+	mutex_init(&as102_dev->bus_adap.lock);
+
+	/* init start / stop stream mutex */
+	mutex_init(&as102_dev->sem);
+
 	ret = dvb_register_adapter(&as102_dev->dvb_adap,
 			   as102_dev->name, THIS_MODULE,
 			   dev, adapter_nr);
@@ -341,12 +347,6 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 		goto efereg;
 	}
 
-	/* init bus mutex for token locking */
-	mutex_init(&as102_dev->bus_adap.lock);
-
-	/* init start / stop stream mutex */
-	mutex_init(&as102_dev->sem);
-
 	/*
 	 * try to load as102 firmware. If firmware upload failed, we'll be
 	 * able to upload it later.
-- 
2.51.0

