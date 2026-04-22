Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BF537DEBB
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776864102; cv=none; b=lF2i/7hSCjlpZVorJyvGwisexzWFCR9dm6AB7G1jIpJ7evFlaFKYdh14V4ZlE/7GtuM0uhQn9SBGFbK4cjW6fRnfciUgOzeiMG+aTtxKpqLvgSq8uu/I99eBFlJzwL1UMLBQafW1lrrvpxp4SS2tRhxDVyI2GPz+GzP3/GolN1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776864102; c=relaxed/simple;
	bh=H0LezHLoMZ6JOVynvqmDrdHSeozIVbP6OOlVwFb3Kkw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P3FgcOLduHFhCfsQejOiZUJl7mDvThA2pG9Ht4wTIRmoUe5QLyhxUZus+VSRXeyBZUVqu47GtKnDfxur8KEHUE1Y5SZW5jsy1ZoqYPcYpjrW/Otzlc0HPLsn5UD0YUbw2dwinV/PqRuDHOrb0a1L2+3rL7nR+CPOJo6UOldDxNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8Vm9NH9; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8Vm9NH9"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35d94f4ee36so3311402a91.3
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 06:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776864100; x=1777468900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7+lQMaCSFQoub5YPrds35ndszO408lEJtlAD9Cfjs+c=;
        b=l8Vm9NH9e7UkVJI4ziA1jBOLVUOHmicY/wRaqZ2vc3JixhLau0HpCxjLvYe4gNQjy8
         jWnOxrTQXFghr9TRdQI8rh1SqxhNqkhBDhE4zZNvQ3Wr9Or0CzWyyncauclrzOhFjyJi
         UX0txi7MfqThV6uQCxYH3LlkOLihI4mHd6H+gXmdW2GmATmrLisgHNFgO26rRAgzir5X
         mdTN3HmsFeB99znjKboGnZ+eFY+8G9W5PY+j/lnY9gZPzxhK0mInuQRUTxgceAAFQxKS
         L4qZFAuCUhgeDLR5YsD/ohNdQBH58OSPvTC4rJNqXQSkvc12YUWwIVoAcb6mRAHbToNW
         4ZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776864100; x=1777468900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+lQMaCSFQoub5YPrds35ndszO408lEJtlAD9Cfjs+c=;
        b=ZK0LnbuaCSlCD2xR2JJukDE8zxKxO6teJrKzfXWnoEVSzoBbqC9bqSLNn38BaDC7pJ
         Ft32C0JV+CKeMb0OevQEYqxRUzheK+3CICC4jpePeiSYFLsVnyfqYY8hyKQnTNjvI82/
         44mAx371pDJ2ntFCASwaeTthaK70qo5qaQMuFFGSenk32SBsHUqFOZDEG2AXP09PzngB
         ZHe7BdvDFMtxj+PA1HTwZyxbQoYPr/E9vRrm4sSMfaxDqoYSGfBt3FdDhIjgaCT3wGnh
         WC64udOmBwtITJXAS6oJPBHQcy4zvpCeQzvdVtSZrLTYNgJwcdXOlioaPb6DmCJTTxVX
         nQIA==
X-Forwarded-Encrypted: i=1; AFNElJ+6FgCuCyULTmKkFIfC3EkteQVpdCbxmKhu+Kx6kOv80rYVfUwvGle7y6Zx8PYRXx6pbaNgQ75hweYayg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNwjpAXS3RhAA2+xCS+Hh+m/uUGUGjX8vYMuzOSt3GvlLGsvZw
	miHq4Ey0GmgDsQDyHP3qylX2X8lhgnX5btfiv3sHIwRQtIq+MUUJU3pJ
X-Gm-Gg: AeBDievqudmiuCtD8ebzi68kSBz9fdec9/HSqmTnljgyufxUOwcrfWMhZN0PP0YyzJD
	Hw9iwLQMaQUbO8UWMHYaaVBCXxb9SDwER+5AEI2tE7tWjhW7kbSnujjhA6CiWRQz3+xSpjgSEOP
	DOGV0e8GKdw1eQ+XYQGFzeEmAG0e8Q+xcLsMN8qNMaOCq0NL1QGE/HqP2NMt22FilDrfc2qh+Er
	7c7nfSjwWhfBod7vbSbIU5+H+KIWrA7y2rKBdOmavNxlfAK6mMwlDvellP3COvPtTvkMQ5JM6bu
	1hBsU3B98/5r3j8fGXrfuH2Ya0+A/7yzYdWX1Zbz9o4WVMQIGBaMqASepIsoU+oF51ZhGkCb95m
	k41XH0YzxHpMsQIDnFUJdUEdLN5sW9CwPgt3Y4aWtAaTE+gbq3scwz+Mb3/g94gjEPId3BBudzH
	Gcr924KgZLeiFwdSgGz+7heHCbjLny3UL7H3WDp4K3bo8kHwc9+3v3UKZaXGVpNYCXedNulxIfD
	m0Pt+7GyQpraYiB7KGlkVH1V1o=
X-Received: by 2002:a17:90b:4a0a:b0:35e:58d3:3284 with SMTP id 98e67ed59e1d1-361403e083bmr22784313a91.9.1776864100131;
        Wed, 22 Apr 2026 06:21:40 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:383f:442d:1500:2c64:eb4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7a9fsm17046916a91.12.2026.04.22.06.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 06:21:39 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: mchehab@kernel.org
Cc: kees@kernel.org,
	wsa@kernel.org,
	crope@iki.fi,
	peda@axentia.se,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+019ced393ab913002b75@syzkaller.appspotmail.com,
	Deepanshu Kartikey <Kartikey406@gmail.com>
Subject: [PATCH] media: rtl2832: fix use-after-free in rtl2832_remove()
Date: Wed, 22 Apr 2026 18:51:29 +0530
Message-ID: <20260422132129.24464-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cancel_delayed_work_sync() is called before i2c_mux_del_adapters()
in rtl2832_remove(). While the cancel waits for any running instance
of i2c_gate_work to finish, it does not prevent the timer from being
rescheduled by a concurrent thread.

During probe, the r820t_attach() call attempts I2C transfers through
the mux adapter. These transfers go through i2c_mux_master_xfer(),
which calls rtl2832_deselect() after the transfer completes,
rescheduling i2c_gate_work via schedule_delayed_work(). If this
transfer is still in flight when rtl2832_remove() runs,
rtl2832_deselect() can reschedule i2c_gate_work after it has been
cancelled, causing a use-after-free when kfree(dev) is called.

Fix this by calling i2c_mux_del_adapters() before
cancel_delayed_work_sync(). Once the mux adapter is unregistered, no
new I2C transfers can go through it, so rtl2832_deselect() can no
longer reschedule i2c_gate_work. The subsequent
cancel_delayed_work_sync() is then guaranteed to be final.

Fixes: cddcc40b1b15 ("[media] rtl2832: convert to use an explicit i2c mux core")
Reported-by: syzbot+019ced393ab913002b75@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=019ced393ab913002b75
Tested-by: syzbot+019ced393ab913002b75@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <Kartikey406@gmail.com>
---
 drivers/media/dvb-frontends/rtl2832.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/rtl2832.c b/drivers/media/dvb-frontends/rtl2832.c
index d8e1546aea5e..9898f729304a 100644
--- a/drivers/media/dvb-frontends/rtl2832.c
+++ b/drivers/media/dvb-frontends/rtl2832.c
@@ -1115,10 +1115,10 @@ static void rtl2832_remove(struct i2c_client *client)
 
 	dev_dbg(&client->dev, "\n");
 
-	cancel_delayed_work_sync(&dev->i2c_gate_work);
-
 	i2c_mux_del_adapters(dev->muxc);
 
+	cancel_delayed_work_sync(&dev->i2c_gate_work);
+
 	regmap_exit(dev->regmap);
 
 	kfree(dev);
-- 
2.43.0

