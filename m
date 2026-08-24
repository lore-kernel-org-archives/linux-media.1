Received: from mail-oi2-f2.google.com (mail-oi2-f2.google.com [74.125.231.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A863750D5
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 03:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787542539; cv=none; b=gVhDpBqeBT/SrkSa91NZSJWCz7kkfllXUz72jTIpnQP6PoF0mQuCtipsi3YHJODrfOVxXWf57tewEPtBCm12VAidSTwfebaLlQtFw4Xzco7zkNTafPXDuEvC3/ATsMQi+jWlMaVyUS+P/hXrlG4pwCpHMO0cVPND0xs2imj8SbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787542539; c=relaxed/simple;
	bh=lHsfnnqfr0dQflZ1h5tKjRJqV8T3hquy5HeVE4mt9jU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=WLc3yEn3XuN66qTlDRIaat4Qg2UnEB2P07fcPx+s2Gn3pNQ5vsazu+XRWYcG6HgVgNORzB4Wq3ymWgiJ0vSR2ZV9UCog2FdiI7LlPUkL6D8Go8+FSZfKIjf1OB9V1yyQRmApFLYLMqklpARpFDFKxHUPyz3HXM+8kGUopqtmOZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f2.google.com with SMTP id 5614622812f47-495d5d27acfso1507787b6e.1
        for <linux-media@vger.kernel.org>; Sun, 23 Aug 2026 20:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787542537; x=1788147337;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+x9SEMAzbf1lGRcImB/hW7VToSLUdjdJ4+1546fFjn4=;
        b=ga8MnkHyqI8J0mnsEiOr1ZDoWxZwae2qtQwTFwPMLeOoDCRXyk1XNUvJuBLEm7SMEv
         kdeLXkqKC8lSSuix0j3Xc1rLQV73yAe81TcM1Bp+OyEMSMM7biwnFh4PztgxSw8fgG1n
         /Ppx6jYEp4xit/r6wJEO0m3/lRtImzWG2ntx6OQIc7JBlx9Aq6zPPKDV845EU8YjwA7K
         GikOefWDo4Gh3XGS4NrVfVpWJlZA2KiTBObxs4m3DCUhVgrKTn+YUhI0YhVsJjLEVJ7q
         ql/bfPmnlkaPuGcliTjb3/V4SpP/yDdzquyMzzbogjb6fZ3j70xrRu6KHjYPLdnKbVmP
         AWvg==
X-Forwarded-Encrypted: i=1; AHgh+RohF4K5gHwEtHDa1qVIsUvqDMx25mMl1VhDmto2T36nhNIm0X0/UGUHr0Pl7Kr/7IB5mPlYH8BEcO3KWA==@vger.kernel.org
X-Gm-Message-State: AFuF++nGb746E+QVtRksxnK1O1kqs3jvKE1c8+LDKTD4LIfIbuM7vDCP
	JJKg6w8e1PcmM10B+SATBdkvzHSBXxhg12c/BbaN+t7BqENP77841ywIewBE90AMESekE/f2ddZ
	IQ/wdKNvcIYFNeq9H7XmI9ZB004DAoB9cnxFnKzkDpttbtRBe7cdtPcKATfY=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f69:b0:4a4:a930:1f76 with SMTP id
 5614622812f47-4b2ef3387cfmr24067395b6e.11.1787542537217; Sun, 23 Aug 2026
 20:35:37 -0700 (PDT)
Date: Sun, 23 Aug 2026 20:35:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8bbc09.dbb3a75c.13dd47.005c.GAE@google.com>
Subject: [syzbot] [media?] memory leak in dvb_register_frontend
From: syzbot <syzbot+32f018fd65e799f79ae0@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    26260251022f Merge tag 'livepatching-for-7.3' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=179ac415580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6c1b5958b2d1207f
dashboard link: https://syzkaller.appspot.com/bug?extid=32f018fd65e799f79ae0
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15f99549580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0f75e7622b1f/disk-26260251.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2bbff9fd7b60/vmlinux-26260251.xz
kernel image: https://storage.googleapis.com/syzbot-assets/95d733004907/bzImage-26260251.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+32f018fd65e799f79ae0@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888104d8ec00 (size 1024):
  comm "swapper/0", pid 1, jiffies 4294937925
  hex dump (first 32 bytes):
    00 cf b9 05 81 88 ff ff 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 284558ee):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4599 [inline]
    slab_alloc_node mm/slub.c:4919 [inline]
    __kmalloc_cache_noprof+0x359/0x440 mm/slub.c:5480
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    dvb_register_frontend+0xad/0x2b0 drivers/media/dvb-core/dvb_frontend.c:3047
    vidtv_bridge_dvb_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:438 [inline]
    vidtv_bridge_probe+0x1f6/0x420 drivers/media/test-drivers/vidtv/vidtv_bridge.c:510
    platform_probe+0x86/0xf0 drivers/base/platform.c:1507
    call_driver_probe drivers/base/dd.c:628 [inline]
    really_probe+0x12f/0x3a0 drivers/base/dd.c:706
    __driver_probe_device+0xe9/0x1a0 drivers/base/dd.c:868
    driver_probe_device+0x28/0xf0 drivers/base/dd.c:898
    __driver_attach drivers/base/dd.c:1292 [inline]
    __driver_attach+0x10a/0x200 drivers/base/dd.c:1232
    bus_for_each_dev+0xb8/0x120 drivers/base/bus.c:383
    bus_add_driver+0x122/0x280 drivers/base/bus.c:763
    driver_register+0xb1/0x140 drivers/base/driver.c:174
    vidtv_bridge_init+0x52/0x80 drivers/media/test-drivers/vidtv/vidtv_bridge.c:602
    do_one_initcall+0x74/0x430 init/main.c:1353
    do_initcall_level init/main.c:1415 [inline]
    do_initcalls init/main.c:1431 [inline]
    do_basic_setup init/main.c:1451 [inline]
    kernel_init_freeable+0x2a9/0x340 init/main.c:1666
    kernel_init+0x20/0x1d0 init/main.c:1556
    ret_from_fork+0x219/0x490 arch/x86/kernel/process.c:158

BUG: memory leak
unreferenced object 0xffff888105b9cf00 (size 192):
  comm "swapper/0", pid 1, jiffies 4294937926
  hex dump (first 32 bytes):
    00 01 00 00 00 00 ad de 22 01 00 00 00 00 ad de  ........".......
    01 00 00 00 00 00 00 00 00 3a 95 03 81 88 ff ff  .........:......
  backtrace (crc 9bd60cfd):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4599 [inline]
    slab_alloc_node mm/slub.c:4919 [inline]
    __kmalloc_cache_noprof+0x359/0x440 mm/slub.c:5480
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    dvb_register_device+0x117/0xac0 drivers/media/dvb-core/dvbdev.c:472
    dvb_register_frontend+0x1d0/0x2b0 drivers/media/dvb-core/dvb_frontend.c:3074
    vidtv_bridge_dvb_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:438 [inline]
    vidtv_bridge_probe+0x1f6/0x420 drivers/media/test-drivers/vidtv/vidtv_bridge.c:510
    platform_probe+0x86/0xf0 drivers/base/platform.c:1507
    call_driver_probe drivers/base/dd.c:628 [inline]
    really_probe+0x12f/0x3a0 drivers/base/dd.c:706
    __driver_probe_device+0xe9/0x1a0 drivers/base/dd.c:868
    driver_probe_device+0x28/0xf0 drivers/base/dd.c:898
    __driver_attach drivers/base/dd.c:1292 [inline]
    __driver_attach+0x10a/0x200 drivers/base/dd.c:1232
    bus_for_each_dev+0xb8/0x120 drivers/base/bus.c:383
    bus_add_driver+0x122/0x280 drivers/base/bus.c:763
    driver_register+0xb1/0x140 drivers/base/driver.c:174
    vidtv_bridge_init+0x52/0x80 drivers/media/test-drivers/vidtv/vidtv_bridge.c:602
    do_one_initcall+0x74/0x430 init/main.c:1353
    do_initcall_level init/main.c:1415 [inline]
    do_initcalls init/main.c:1431 [inline]
    do_basic_setup init/main.c:1451 [inline]
    kernel_init_freeable+0x2a9/0x340 init/main.c:1666
    kernel_init+0x20/0x1d0 init/main.c:1556

connection error: failed to recv *flatrpc.ExecutorMessageRawT: read tcp 127.0.0.1:35893->127.0.0.1:38908: read: connection reset by peer


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
