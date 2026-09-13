Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECD8194C98
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 00:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789259393; cv=none; b=NrUsG1zRbHR7W5OWLO7e2vTT07om2xOUfJYNUst3mySYe+FsTce9ZjqQ2Q8n6KJAT4uxDlPZ0GITLGTP5pvMi+FtvTCJ7ElFLVQhaupyiBb/EeaqliLqkR7+BqptzDqpYnjXtC75pl57OA71Zfm77JEKFtNrL7g1Y6kX8R2DmPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789259393; c=relaxed/simple;
	bh=64GHYTg1r/dPubV34LDaud4uA/ldHinB73PiAAq6dL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fwIyNI4v3xLIw01D7YZv8TTdk1JigfngrwKs5WPJFJwZWwlBWXXOzGnupMkFB+Zbp3n8UaGK6QKSBmOKS392C2sIB/t7NvjQuKsFxumxAJTVezo3+zMhvCt0bBKQKta2YmKQJYaIaPkcRv6PxvBGvZyRHpUmzq8EDwcIwNyg868=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=K/eki52j; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="K/eki52j"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1540366a12.0
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 17:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789259390; x=1789864190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ScvzY1Zp8ZMCyDWV+7q9ZIbetTA7/SJK3fOR/Be6tok=;
        b=K/eki52jSQCCaMSD3UYg329lTYAcUrS4WzaaDIP5tJ3QMQYELAMphUE9XvP13BzS9+
         TaLjjnQh7O+KmufGtixa2NbnQEwkil8jx+GJAN0IkrhFI2hTE5mGQtD5rwJJljo7BJkx
         02+haKJcPPgIQUBAwLcqt+5X+Utm4bXQpco3OsNVNVFX1Ji+rRqTiCwuMtTfKFftGKPW
         gSG3Mbc7A6TvRNc21cQhqAAZDGCHQuNp5a1PgkrA7bjHg1c7pNAmvwI0iWHuvEj+G69E
         SAmdHmEjm1KX4WIhl+fdz4KIRGXb4ICYJ0uKKcclIAN+P6a74JlS4ppOnPVxJxCf/q+t
         F2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789259390; x=1789864190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScvzY1Zp8ZMCyDWV+7q9ZIbetTA7/SJK3fOR/Be6tok=;
        b=hb6STDKqT2TuvF6yo9dRBRKAiEy1rMA/QuNJXEcSXA1zfHcoqSeJeLLDtUjJuQKO+b
         ZWE1vy5jgqAUp/79BNs1XCjEXzh4BGmG893gHkkx+7sO7Bc+I8/GH8sBWJXCD3VEQ472
         9smtYVr8tlSQ1QxDMrhok5EQDTxI8f4WEIl7TpnL3BToCUS66afjGOcOQFq6xEclIvL5
         RCDykJ9T0kSttoEop3triLh/dEVzbJ/DjB323ShhBNTTIVA+Z6NV51G+S9UU4UQUMAeT
         5uVFZfSZPVwM0/sy1JuGdjxplrKoUXKwvYpGIrLhJYZf47TUmtAiOvocCZpTyRtcqIhK
         zLCA==
X-Gm-Message-State: AFuF++m/Fk5r5HUBZL1QqrdCKy1nUeokkfQ3QzD7yWGCHMd6JyzsApau
	uqcuLhg7sdCc9yEelO0oKaWNVCgMbU+xwO6kDdqQ2sIM6NlBscjvjPC3SlB3fhNsDQ==
X-Gm-Gg: AYBFou0+7hdG7M8h69z6HzjFxeH48NakgYTzhOXGuFAajZO9f5t6KsR/WwjK4SiNDr/
	bDHZqOoQ+8OQlQXfJ61del3QJwlaIraonTVsiJ99/UiaOxnj94YqEIbbbWi2nqxijKycGG3+iOp
	zO+Jig4v2d5yvrzW+R9gjdKGMBXAJKBAfQfWaNA+fAZF+GshzmkaGfCnyh0Wk7aVXTNBBw36gHZ
	WmwHTFRD+52MbkXaZCej6/kWOCEJq45wsNlrVdZ129m9mAQEuDxW03e1SkF0g1WLj8COFC9W8Rz
	DfEAFepMjGwTUaZXCcwlqDl1nCFJUxX9Wcuc3zweHmu20t4vP+AYTxR8aG74o2cMdUF5JralacW
	sSup0dDDUJ0Jpz8zdH1/1HyE/WUbeP9hoa+ucJ+Un5mMAYXDJNQ1wa40S4PsjhxNNTgP2uJtKwr
	M0DFVaJ0qt3bW7TX2gwjFp1o+Tkl2SN0pz5HxEpVoTbIsk59/7oyFc3y60yCL3JhnRxbTMHogx1
	NgJunF2vlBBptRJdt0SV2Ad6zZtVPLQ4vdOjYaQP0bJxPBiY05g7Q44
X-Received: by 2002:a17:90a:d64c:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39d9c1d260amr18545118a91.13.1789259390011;
        Sat, 12 Sep 2026 17:29:50 -0700 (PDT)
Received: from xps.tailc0aff1.ts.net (149-169-99-5.nat.asu.edu. [149.169.99.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b78d59sm14899408c88.8.2026.09.12.17.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 17:29:49 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+9782320f78c23f40@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH] media: em28xx: reject audio endpoint with zero packet size
Date: Sat, 12 Sep 2026 17:29:45 -0700
Message-ID: <20260913002945.338569-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

em28xx_audio_urb_init() divides by the audio endpoint's wMaxPacketSize
without checking it, so a USB device that declares a zero-sized audio
endpoint divides by zero at probe time.

Reject a zero-sized audio endpoint like a missing one; the caller already
unwinds on a negative return.

  Oops: divide error: 0000 [#1] SMP NOPTI
  Workqueue: usb_hub_wq hub_event
  RIP: 0010:em28xx_audio_init (drivers/media/usb/em28xx/em28xx-audio.c:718)
  Call Trace:
   em28xx_init_extension (drivers/media/usb/em28xx/em28xx-core.c:1248)
   em28xx_init_dev.isra.0 (drivers/media/usb/em28xx/em28xx-cards.c:3887)
   em28xx_usb_probe (drivers/media/usb/em28xx/em28xx-cards.c:4258)
   usb_probe_interface (drivers/usb/core/driver.c:396)
   ...
   usb_set_configuration (drivers/usb/core/message.c:2268)
   usb_generic_driver_probe (drivers/usb/core/generic.c:250)
   usb_probe_device (drivers/usb/core/driver.c:291)
   ...
   usb_new_device (drivers/usb/core/hub.c:2703)
   hub_event (drivers/usb/core/hub.c:5961)
   process_one_work (kernel/workqueue.c:3322)
   worker_thread (kernel/workqueue.c:3486)
   kthread (kernel/kthread.c:436)
   ret_from_fork (arch/x86/kernel/process.c:158)
   ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
  Kernel panic - not syncing: Fatal exception

Fixes: 1b3fd2d34266 ("[media] em28xx-audio: don't hardcode audio URB calculus")
Cc: stable@vger.kernel.org
Reported-by: co+9782320f78c23f40@bugs.sh
Closes: https://lore.kernel.org/all/51lCz4R7QyTUKbh4mhXNaNzX0evpk0siOzbh%40bugs.sh/
Assisted-by: Claude:claude-opus-5
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 drivers/media/usb/em28xx/em28xx-audio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-audio.c b/drivers/media/usb/em28xx/em28xx-audio.c
index ccff6be5599e..7f0c5826ce5e 100644
--- a/drivers/media/usb/em28xx/em28xx-audio.c
+++ b/drivers/media/usb/em28xx/em28xx-audio.c
@@ -693,6 +693,13 @@ static int em28xx_audio_urb_init(struct em28xx *dev)
 	}
 
 	ep_size = em28xx_audio_ep_packet_size(udev, ep);
+	if (ep_size == 0) {
+		dev_err(&dev->intf->dev,
+			"Audio endpoint 0x%02x has a zero packet size\n",
+			EM28XX_EP_AUDIO);
+		return -ENODEV;
+	}
+
 	interval = 1 << (ep->bInterval - 1);
 
 	dev_info(&dev->intf->dev,
-- 
2.43.0

