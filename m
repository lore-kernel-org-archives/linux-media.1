Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B15322B87
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 03:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789530340; cv=none; b=GzT4LqHFmE5I1laJDfw0dPn0QtEsQa72wxiBsNqc8vfG0o08LQmxHWLZualcVHLgHuYMloH/F3DNxzyEP+g94aqfJLB2Z2eaESlAnsPt2KWVBdhMBe17szoLJruG4K6VaCX19KnfnMQbemQfeto9OTRP4+dCmuv0zJ8vxx7P1Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789530340; c=relaxed/simple;
	bh=kj+jwfz2ESgc5zFDsF3Qm12OZV92X1W7h3OVHgPgo7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sdYYzp972RHYogYZxi7pnXdWx5Abpy7ge/XfOeVYe47LQHbzmauJu7/xK2Hpir9gEJ9dQAzNY71g9VEcO/0ywt5AjwHc9YxXDLTYrh3SB4FtrYNZ73zrwn+b8Kf+1RRfhiynZZwdKMyWy3+ZnWFqV5pnwmMQhCS3aSHbmHxaKNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=rKlYr2eA; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="rKlYr2eA"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so1473251a91.0
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 20:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789530337; x=1790135137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8OBnZpdkznSDHoOVDOJgOwhfNo4gWFfvtnI5e7GBu8=;
        b=rKlYr2eAUhKC02NildikSqpZUTltbAtlFj8cRVwAWM/zt1x1Etb/5wA1cSKN0fbSWl
         2XF0CRkek3auZZVQNszH/ceTS0wRxShcOseNnMIO3rLjEvSU7MgM6Aq3684/WoMtNwkC
         3FcmKKAjTUbdwH1mz1pmmZM/CVGCDNtZO+QhY6Rvtl/aoxBZYjs2Rb754rfQdJhqWiR/
         LffFB56cX2XirC2dU+3hX/3TKIbNHYAS6K9mFOc+SW1nQVafgSEzwxaQbuNyTytj+rcv
         tuCU5iVSGo7hXAbE45W5q0QoYP72LctF7zdJSuBlD92+UNz/ckuzFzWSbL5csCjfv25f
         jgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789530337; x=1790135137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8OBnZpdkznSDHoOVDOJgOwhfNo4gWFfvtnI5e7GBu8=;
        b=YTsMbCOwzYd4/1Gb9W1xbkwivy5usAg+Lbz20p448cLS4e2VUwJJeDtrwJzHzq8wVp
         qD6dftUOeZllilq3t6lCQy4Ml97jukKf9vwXFvJCNLpovGPbIahFrFShaHfpY+YZ98u9
         /debfgvjAakYMRFsRDcFzooclgBpnmcyrvqkMMw1NPjcHSwziQnx/93R6L1t70TcBIBH
         mHwpii1/m4r4N2sCt7ptHJhS73sQSPCUrLefWu7lIPIS8czi9awzQ9BYasykoeb5Nuaj
         JTqWXrqyhdCFmvodT9iNB18rflqwPL8BPNhxnZ891gf7+zdcQ02RgPls/ewDtwsTQQze
         p0aA==
X-Forwarded-Encrypted: i=1; AKwUvBxWNPbHV1fmAHyj54j1X7O57G5VJKScBvDppU7Rh+Mh7ny6GDPpglwSdVsaHedW2MnC+qXBkVpz4BIDTw==@vger.kernel.org
X-Gm-Message-State: AFuF++nPk0Nda6xVnnCuvgiFTrosMX1/bCTR/5Cr1UW1G2S9b/+SWymw
	yBPZnp59sOLyaMLvzSxZ4Erb8BJ9kq2q3XNYUurrBI4UKcU88pHwASj0PUctXuqyMQ==
X-Gm-Gg: AYBFou0RmTUeUrC4Ylr1/kZ8DODzAHHIaUbaysYf3MFg3HPN2U3cT5vmeHbWymaIfha
	Qg+pGtfMvDdj6Gkz7rGdYIXuZNOgvbRB96hQk8TReXDvWs8bprYVmoSaKU2rLVsVAbKhIE60KQX
	n5anPFMJeOCV3LRa13nk+QJ6qhch1zMX4pa7JIQTZNaCNEItjXnfDDky8KRf6esOkmFOLpMoIgz
	9h9CTUFCNjW5cjdjTSdiFlzarxDY64TuE6MWI2zhYUgRlaZFUWkk3t++D7r2lKAO2WONd/MNzql
	FM9B/weQXzCKrRz4vF3EvPHIoSPwYYffUVlSWlhQPPnyDqlqgm/XIq8+bPkHVsfQ2Wv4Q8rF/Oz
	Fd46E2WruqMzqw8qYLLdNuxDVKICwJS200UEFf4r9Zq6TGjEcT21Vu5S78LqM777bdUdnRMwZTT
	OQxqPJUUZC48i//JZUXmUDCxaRWtEVBvWTt8xRsWOv359A7abF8Rm728D9JmGDlED9zHmPad0Np
	dApgpuQVJYJ3LeYsfSRs99mLZGkttt5+sB+9tDfv2ESSLDU6ZgOqK3q
X-Received: by 2002:a17:90b:35cb:b0:39e:1e25:c6fd with SMTP id 98e67ed59e1d1-39e1e25f48cmr1670277a91.30.1789530336957;
        Tue, 15 Sep 2026 20:45:36 -0700 (PDT)
Received: from xps.tailc0aff1.ts.net (149-169-99-5.nat.asu.edu. [149.169.99.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b2753csm6953812eec.31.2026.09.15.20.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:45:36 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: hverkuil@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	co+ac0ebfcd53bd2316@bugs.sh,
	stable@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH] media: go7007: only set audio_enabled if go7007_snd_init() succeeded
Date: Tue, 15 Sep 2026 20:45:34 -0700
Message-ID: <20260916034534.863732-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

go7007_register_encoder() sets go->audio_enabled before calling
go7007_snd_init() and discards its return value.  go7007_snd_init()
assigns go->snd_context only on success, so a failed ALSA setup leaves
audio_enabled set with snd_context still NULL.  The disconnect path tests
audio_enabled and calls go7007_snd_remove(), which dereferences
snd_context unconditionally.

go7007_snd_init() returns -ENODEV once its never-decremented static card
counter reaches SNDRV_CARDS, so SNDRV_CARDS attach/detach cycles arm the
next attach; no memory pressure is needed.

Set go->audio_enabled only once go7007_snd_init() has succeeded.

  Oops: general protection fault, probably for non-canonical address ...
  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  Workqueue: usb_hub_wq hub_event
  RIP: 0010:go7007_snd_remove (drivers/media/usb/go7007/snd-go7007.c:273)
  Call Trace:
   go7007_usb_disconnect (drivers/media/usb/go7007/go7007-usb.c:1336)
   usb_unbind_interface (drivers/usb/core/driver.c:461)
   device_remove (drivers/base/dd.c:618)
   device_release_driver_internal (drivers/base/dd.c:1349)
   bus_remove_device (drivers/base/bus.c:664)
   device_del (drivers/base/core.c:3965)
   usb_disable_device (drivers/usb/core/message.c:1478)
   usb_disconnect
   hub_event (drivers/usb/core/hub.c:5966)
   process_one_work (kernel/workqueue.c:3396)
   worker_thread (kernel/workqueue.c:3560)
   kthread (kernel/kthread.c:436)
   ret_from_fork (arch/x86/kernel/process.c:158)
   ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
  Kernel panic - not syncing: Fatal exception

Cc: stable@vger.kernel.org
Fixes: 866b8695d67e ("Staging: add the go7007 video driver")
Reported-by: <co+ac0ebfcd53bd2316@bugs.sh>
Assisted-by: LLM
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 drivers/media/usb/go7007/go7007-driver.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/go7007/go7007-driver.c b/drivers/media/usb/go7007/go7007-driver.c
index 453ab5c3aa03..7db2440886b0 100644
--- a/drivers/media/usb/go7007/go7007-driver.c
+++ b/drivers/media/usb/go7007/go7007-driver.c
@@ -306,10 +306,9 @@ int go7007_register_encoder(struct go7007 *go, unsigned num_i2c_devs)
 	if (ret < 0)
 		goto err_free_controls;
 
-	if (go->board_info->flags & GO7007_BOARD_HAS_AUDIO) {
+	if ((go->board_info->flags & GO7007_BOARD_HAS_AUDIO) &&
+	    go7007_snd_init(go) == 0)
 		go->audio_enabled = 1;
-		go7007_snd_init(go);
-	}
 	return 0;
 
 err_free_controls:
-- 
2.43.0

