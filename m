Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366A43C109A
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 05:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894900; cv=pass; b=TrC0R6arkVkQDzCSPLVj3eubbj5n88p+PNBpYdPeTq2DbcduZcfnXmd8ikbCM4nYG5gaINK98KO+tvXCXjq9iTaVMi/cWrysIJgVJqZDm1jCB5v4AEuFy9blDdtj6DQzVIIXW1fNPXWE9Nw+AcDsjwF7sN9m0Kk+BZkL8AbLn08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894900; c=relaxed/simple;
	bh=ZPhImy2okdhZDLVACJlNTI6GS2RmF459ZpM5nqUw2qU=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=PL4On2KVmuslx3FkA9pl4x4PnCgcInQfRQp1LY50Um7/TVnySntCM73OL4WWuAZe4wAKXGgTjMEVptWTVgYVGYVCGaRewVLrseJpQhkU1bvIfhkqwWnpDIKUJlS5sZnSLzZhttOPZuh+AEBKbWuxsKayLtgc+IVx5CJ5TvTyJbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=gxxpauik; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="gxxpauik"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39686abd426so564125a91.1
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 22:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787894898; cv=none;
        d=google.com; s=arc-20260327;
        b=EHJoO96qCF1XypO9cuOLJ05jMALUHfnrHxv+8IEPcP0p7NdCg2YbpyUAhVIa9+Naie
         1Y4LFpdFg8s9yGDjU384UcECfzoYlkRxPQes7IVxz0211KZOR3ViDWd+Zl4YiCMYJu2f
         81hy5k5l9Y5saBO5+gB0nPXylPyA+mHPZ0IKKxRw5V8t7r04xAsTzUpBAqEo6OfRDcyN
         Efvm/4njNGojIts8LlotfLjcD35ykXNwTywCNRxEuXVHjKhqY2Y6+TIJfflwmRWyeosZ
         oY22wLTte1LNUYuEokj3gaXhLPU6DSuSWA6Opo7V/dcWSyzETaon8h+0m9aP9X/j59AU
         PhlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=69yTTqvZCFloiVCQK0EcvNH+dDyw89z2kOgmpsOD+Wo=;
        fh=jQF70P13l7gJp3vtCCsK96UbB6jd3z4fpqAYT+dHA7Q=;
        b=gFaeJ8FvrpN+FA1FBFy9D+Adg5aRGsUhYTo9lcLm0cmfWiaZMwfVC0o8js4cUkyBpI
         U01fp/vPzYAcgcm93Iig+MXL5oxH2gfExMui3oiPq+igL/aWXpZj6y7Xqp0Mv8rp31d5
         rbIkr6Pto45CEJOSSdZZI6iJUQ0mHsEeL1Iitc9R3p5XoXtzJab7X3vs2wf4KaorW6fn
         nk+F/JIuqiasjE4e2WPIu/PGGnyNCYJPIJFuBP56WP1OX0v71GxWpAuDvRCsxYlQduq4
         9N//xUz0PrGDp3FbTX+TRRPKnD1Tj1SsC926fW0bn5ISsUhlmcga6jtHbmIoe1Er0VB2
         QDEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787894898; x=1788499698; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=69yTTqvZCFloiVCQK0EcvNH+dDyw89z2kOgmpsOD+Wo=;
        b=gxxpauik/lQo7gq/nAnE6rmhjPSahRgc7gS+t2sWkqpfjTDOvR53ue1jDRQKDnfA4B
         TYqC92xewQ4uXLvRfHWwF9yBFduSLoDhs0lOK6vNIrILahiT5pvLAv3AfBVzPS3q2u3O
         yOHXXwKZ8/Y5eVbd3oB07K+IHot4wPd7rAM0IB4uYoGfuN1mAEbc5WvpBkozVcd/JzKr
         1YsRc1JrEI7mpCCQJ3oUs/Kh/K0wxaqTgks06fcut+7j8C8G0sX4JK74RwqFtXOQmx0k
         ra6IazWSWY79hLr1mDEI6DzHkpsr9GbMFSNMveuRT8P2HIOo5lJdle/pFSe9MZfs7eGM
         bHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894898; x=1788499698;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=69yTTqvZCFloiVCQK0EcvNH+dDyw89z2kOgmpsOD+Wo=;
        b=qL6+zS0PU0GYfjgzfgkjyMxwxGSF28prJAh5/uv5ymdEHOMiZSjWXMtPrl5izdPm//
         t8wCfCb9U6QR8yI1pWqIZ7OKCLHEVm05VKdtct1VYB8iaJJjO8/57RdMsiD9pyqyaLr1
         2qOHZrkPDLUy3Cq0aRfGTLU1qxS5c7iEwJOC3ZXg+5Afhgx+pyJal6badkSmJtlolDIs
         RmHgJI8Lk2M4VKCZ+yedkWNvp1AR4t95sRbLZ3ph8nbFkPtw+daKjcyRRWXLuxsVZLqP
         lo0EZlEWoIAQrUwb7ufhYovUmoWc0O1lBJYzsirRZjn/K++egCJfux2PKqZuSXsISi4m
         5AEA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6+FSdQxQJkzE31aGqNNdX0sn/6ab0sgT0WANpS0fqxXbIl0RdIA9HI1NbehAe3SEa/zj4z3bi9FlNZg==@vger.kernel.org
X-Gm-Message-State: AFuF++l9CcQeKfIeGxtD+IMhBX8V6hDPoKU5VFSYu+8pW0K73ML/AlAp
	rmop6ga9rO7LsdH4MLUNU0QLJ6lchshZ1N7EeLo/FOtW18ypNTM6U0xaNxe6HBzxT/X+xgc+DXP
	P+rmNraZXdkr5OdKHVi2jIvW40oM+0AghEimxAaCm
X-Gm-Gg: AR+sD11xblofEoyfs7N4uJPskrKJ6C/eeUaq4VMoc8w+co5p6dAlxArkdryZqMEjtE/
	UijdDoAfogR6LgAL5wgahJFcirRrZuB7DSAPuvoemXn2/eh3X5JKDaRS34D31uiA1rel0Weec3Z
	jA6dlSnP6sS3mV8KFGejoYlv6xLwfKxDC1odpJpEySiCb+8usV8JwgpmGMdAPEoQc8vuFEyQ52w
	w/AMQYgvnN8tF+utavzjySY95bL2t9Im2aQ1L9mOsVpvDhahSLfZ/8Y+j6JFzUL/DSn1W9yYrF7
	RBrFfV8DwBW96Hf1RWnCo+6Ipv4gEme6ixQ3u3+NJSsoSyeu9h7UspjdeuDEdM2TxpAd1dN3lY9
	2reY5/6Wl14iTFRb2mA==
X-Received: by 2002:a17:90b:54c5:b0:395:4de4:92c7 with SMTP id
 98e67ed59e1d1-396d0e5ccc7mr9782509a91.3.1787894897403; Thu, 27 Aug 2026
 22:28:17 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:28:17 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:28:17 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:28:17 -0700
X-Gm-Features: AcwNN1VZfQemsY1TUaz2msSv5y7mAdDZwFh9qw0JgmQOXUjmrSpC6I7705TZl-U
Message-ID: <CA+0ovCgnjGvPEtuXO+XH6o1ndK3d-KdBytApquWmsWnhLRg3MA@mail.gmail.com>
Subject: [BUG] media: cx231xx: NULL-deref in cx231xx_audio_init() --
 actconfig->interface[] indexed without a bounds check
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/144-media-cx231xx-audio-init-null-uif/

  cx231xx 5-1:1.1: Registered video device video0 [v4l2]
  cx231xx 5-1:1.1: Registered VBI device vbi0
  Oops: general protection fault, probably for non-canonical address
0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  RIP: 0010:cx231xx_audio_init+0x48a/0xcd0
  Call Trace:
   cx231xx_audio_init+0x48a/0xcd0
   cx231xx_init_extension+0x6c/0xc0 drivers/media/usb/cx231xx/cx231xx-core.c:120
   cx231xx_init_dev drivers/media/usb/cx231xx/cx231xx-cards.c:1504 [inline]
   cx231xx_usb_probe+0x10dd/0x2140
drivers/media/usb/cx231xx/cx231xx-cards.c:1819
   usb_probe_interface+0x657/0xc70 drivers/usb/core/driver.c:396
   really_probe+0x267/0xaf0 drivers/base/dd.c:709
   __driver_probe_device+0x1ef/0x380 drivers/base/dd.c:871
   driver_probe_device+0x4f/0x240 drivers/base/dd.c:901
   __driver_attach+0x346/0x640 drivers/base/dd.c:1295

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
