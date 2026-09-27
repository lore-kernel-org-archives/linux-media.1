Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929221A9FBA
	for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 06:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790489469; cv=none; b=Fo2SqHpO5fmOyuoNtIVroao0nM5FEKpEo9Tr6cQSsjvlBiL1kH/eSpCjQbmyG5rgWlRfLnGQ5kU8/Y8FlfA6Dx66f4mcjhgLCEOGdNESRRAywEP0+/SdyOww3EOowYv36oiehy6h8eF2fpOBzS2VkZAY58GkXhQ+XUOk39iLBMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790489469; c=relaxed/simple;
	bh=nVrs/8T1e/0c1wb35JoPd1Jnzl7Me3+fEMjClG+05+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c2Ep/0rYbbpTgSyl0jDzIUuEH1RFaWsxtMrh3Bi5yCdXRQeBIv/w09l9R1MTedIVXEWNwYhbfdKWjfsxlMIVXrbRW7Ujwp2AR901HxYtGW83uw0uW62Z2fvypufYIDg41xkTeTpyYyqvY9YyX6c4IshstIQCkFT0qXwy30r9dDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLjFLrOW; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLjFLrOW"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so16217055ad.3
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 23:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790489468; x=1791094268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=330RjSxESUmMZyuNK1veh17/1thhiAzCXFHq2ujk6QA=;
        b=fLjFLrOWvAgI6Del6IH+eZjwmG0knGYYqOf6ko29ioToLqPV8weCKKnWomfUAscgc7
         LSSb3/ca7HhP4mhQKzS/bAeG4nLn1ugOoSkSzBiSeRpJm5gxUcVU1aEZa29ZNEPz20uh
         YR94D++vUtxMSofBWwIncMHi8JDmw0JivGz3vOZuM/Vy1OF1cTVaQ7EMZ1WEFA/O6Kbd
         9glklzUXCtqoUcHYd7NB9IA2cVX3lIwUxjHDXC4AjoXTUb4VGjH9wC2ugssVnK59Az/F
         3zx73GiawWUugqSEjs+cRcYwijqTUfnl9GNzD/c/I1iPzMlvp7pH+iYbq+5eKYdGwged
         sS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790489468; x=1791094268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=330RjSxESUmMZyuNK1veh17/1thhiAzCXFHq2ujk6QA=;
        b=kq8h5CtMnNVrq9/ZleGFOwhHxSItCayEiBqhlder3hoXqf/Vnl+JVoTn/YzWwPPWNJ
         xTiX3pud/sNbAY2ed9VkJ/ZI89NJT7XB4ylpNc4lo0+fCj9lD9W62Yrn7Muu/V904VXy
         9JhXiU12Y7EaXqOvwn97q8HB4MvDkci3HhcYY1PKcBj5+6a16859CNQ3MGQcmsMO99R7
         u9wBxXX+3BPDE4UpoGt+fEW5qPFTvUoXWkNmx2j9QR3lePCaF0QVIwSwMrVudJS6erkA
         ezUfBDOe18AK7huAsr20Se8TE6urxX/g1rliNqxx8MNszNgFSi1UHMH3pjBbpIx/mKOY
         tNkg==
X-Gm-Message-State: AFq9FYJuxU802MXyhGGK5+WzkLAh5o5AANeZQhU28I5zSI1+xJN6a+pz
	aD4MvZCpJkUTqXdL3/tcb/27YGoMNzkSnQazMcr087dfRb2bH6PyIkUtR5AJjw==
X-Gm-Gg: AYBFou32ZcyI9m/jnj5wT2QGk+6NfFCGPjK0F1sm6TF0mMKCBBiXkj5zlbS3vAUm9PN
	Lta+samc6g4BjUaTb7Se66HUe7rgbGPVNUyA6NPTBhmrKEP21/7F/O6ziPPGwIERZZIXEnLi4nC
	8buD+OBQwf64cg8MCdX/00weroW6AkjIOMci0muyQZZ2lYET1UdEmOtF8gUnbmKDjTaJoeeKylT
	AmSzhXJYmnixWEnPWwnW28Jh8VTZxBVZNJVsE9IUo0DuQ3QnOln7u3oWFOw/1nJsp5fC3N+xi6H
	bruorZlL9pgKHdwCgADoBsIX0d90Gr3NQDEvKHnx4TFm3l4j5vA1evD6Fw4MqwZB47KOLljOqny
	mXXujs83tcwr0laaYBRA1mpovxoA/FhA5sSOFIacBDWgGKsjwXJ/1VtgU9+q5s0+CPZPkUy3oqn
	jJhAC7enMgY/Nn1SDy3mk3tWhrxBgA/o3yd8aMeBJj0pqtUt1E+sAMvb3Q4MQ5vdoMgJU7t4TQL
	yQwG/ufTQZ+LBbH
X-Received: by 2002:a17:903:37c3:b0:2d7:107c:917b with SMTP id d9443c01a7336-2df7d735ccamr79553635ad.0.1790489467848;
        Sat, 26 Sep 2026 23:11:07 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:3a0c:2ea9:4ab7:bd1b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e13c8sm26424815ad.25.2026.09.26.23.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 23:11:07 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Antti Palosaari <crope@iki.fi>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+c35815bad054e6ad396e@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] media: dvb-usb-v2: set active_fe before the demux goes live
Date: Sun, 27 Sep 2026 13:11:02 +0700
Message-ID: <20260927061102.47451-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dvb_usbv2_adapter_dvb_init() registers the demux devices before
dvb_usbv2_adapter_frontend_init() runs. Only the latter set
adap->active_fe to -1, so until then it holds the kzalloc'ed 0 while
adap->fe[0] is still NULL.

A process that opens the demux and starts a filter in that window, which
lasts as long as frontend_attach() takes, gets past the active_fe == -1
check in dvb_usb_start_feed() and passes the NULL adap->fe[0] to
streaming_ctrl() (or get_stream_config()). mxl111sf_ep6_streaming_ctrl()
then dereferences it:

  Oops: general protection fault, probably for non-canonical address
  0xdffffc0000000061
  KASAN: null-ptr-deref in range [0x0000000000000308-0x000000000000030f]
  RIP: 0010:mxl111sf_ep6_streaming_ctrl+0x2e/0x2e0
   dvb_usb_start_feed+0x57a/0xc70
   dmx_ts_feed_start_filtering+0x129/0x220
   dvb_dmxdev_filter_start+0x434/0x10d0
   dvb_demux_do_ioctl+0x48b/0x540

Initialise active_fe to -1 before the demux is registered so early
feeds fail with -EINVAL.

Reported-by: syzbot+c35815bad054e6ad396e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c35815bad054e6ad396e
Fixes: ad6b9e517b39 ("[media] dvb_usb_v2: move from dvb-usb to dvb-usb-v2")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index bd86d250433d..557451b541e6 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -637,7 +637,6 @@ static int dvb_usbv2_adapter_frontend_init(struct dvb_usb_adapter *adap)
 	dev_dbg(&d->udev->dev, "%s: adap=%d\n", __func__, adap->id);
 
 	memset(adap->fe, 0, sizeof(adap->fe));
-	adap->active_fe = -1;
 
 	if (d->props->frontend_attach) {
 		ret = d->props->frontend_attach(adap);
@@ -795,6 +794,9 @@ static int dvb_usbv2_adapter_init(struct dvb_usb_device *d)
 			adap->max_feed_count = adap->props->pid_filter_count;
 		}
 
+		/* demux is live before frontends attach: no feed until then */
+		adap->active_fe = -1;
+
 		ret = dvb_usbv2_adapter_stream_init(adap);
 		if (ret)
 			goto err;
-- 
2.43.0

