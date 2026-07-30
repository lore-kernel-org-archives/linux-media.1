Received: from mail-oa1-f77.google.com (mail-oa1-f77.google.com [209.85.160.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226353BED63
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785400464; cv=none; b=Z2XOMGNX6gyUI/px+svT9+71ihg+94tptc5fakCqTv4lHFVSJgztv5REyr6cmNgd3Fakacsij8HBxsFQvKIfARJwws8/rg+u9rW41f0AnqGQQAuGEeY7kKbGJLrStghltbuPEwKXFE3ENrLRnJKefFG3+S/Ge3GUdMQNwDCXHeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785400464; c=relaxed/simple;
	bh=ozlBDRNy14Zf0vZcbp+2cQthsRYpqj85IMsah280GKE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=AhPvQNtneOE0Hl1UG06mJHRIbooZhWrr6Ue9S+txsQwkXAA4TEDJqfWHg4IAXzdyiS485AdNcYsKJfRnBUoyBizUBS4zNQgcyqFBeHe/FEAAyGdprWGkeNiUoM00aDa9jMNKS7o8fMQfHnfoq9j6UAkt3o8rpPTsLRNb3R9Qovo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f77.google.com with SMTP id 586e51a60fabf-44aeefa1a30so2445081fac.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 01:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785400461; x=1786005261;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WEJhjhhwOqn5dcWrFH+JnCYTxtPee3JYsKQOS1p96+c=;
        b=lPTaRGhKviaNdXsTxQLqi7lka/1Xq+7XSw7mVZSbb4YYlKH5Dcn9ljF+LFuU3juMnN
         7/65aUQ8AZzTuXJ1YBzsct+iJgSkS9R51dI2oiue4EIbrorz4LfyTAWNtv7gEmcooGRX
         3mVHvBPJ+/HZNTfxT3/kKFCP7nMEeMRfzAzMjMONhyBYPXK+kuWzZgcaLt1kwsxGp/ae
         kygWRthbn7bHQQPp2VLTERp8yUJDJ+/KJ0Nnc//hJy9qseHmZLcF38O/NT6m8J1JeOqa
         +34b3WiJqcYtzLwMu78aUrS+Sh9rQmvVSh3uise3sNny2/hxXJKNxPwg7LHTNMX/frgf
         DqUw==
X-Forwarded-Encrypted: i=1; AHgh+RrVR9/ZIFivEwnJttOG1KjtSGf0E4u0+W9qUjzj9j7JecCeh/YVox6aSfGslRLpMRJnJfUVR5hpoRGmYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFF+TEE8Ku5wLMXmj4H1Hh+XIahsiybI5s8DunF8xWx/ikNb1v
	BwZTMjjaIdm97wF/Cz3tbinZpwcED8XKyq5e9gy8/zuhJU4rkLxqVq5i7/pGhWmrRPY3iBrjkEP
	tnv4rPA0Z3P3AgtNhr1I282SJ6jvOUDzZUAdbz7Ppdv0gqd7EHIaRMiuBYqo=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c3ee:b0:496:1009:ec5a with SMTP id
 5614622812f47-4ad87781810mr1319922b6e.1.1785400460851; Thu, 30 Jul 2026
 01:34:20 -0700 (PDT)
Date: Thu, 30 Jul 2026 01:34:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6b0c8c.57649fcc.360844.0012.GAE@google.com>
Subject: [syzbot] [media?] memory leak in vidtv_psi_pat_program_init
From: syzbot <syzbot+597f53f8e81b2f87620c@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3dab139d4795 Merge tag 'rust-fixes-7.2-2' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14dea499580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba7c2d1679fb08a2
dashboard link: https://syzkaller.appspot.com/bug?extid=597f53f8e81b2f87620c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=170472ea580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13fe909e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8c49d395f8d0/disk-3dab139d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/deff2ace5e6a/vmlinux-3dab139d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2c90a783f940/bzImage-3dab139d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+597f53f8e81b2f87620c@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888106a42c10 (size 16):
  comm "syz.0.17", pid 5915, jiffies 4294944056
  hex dump (first 16 bytes):
    00 00 e0 10 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc bba9c611):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5485
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    vidtv_psi_pat_program_init+0x2e/0x90 drivers/media/test-drivers/vidtv/vidtv_psi.c:843
    vidtv_channel_pat_prog_cat_into_new drivers/media/test-drivers/vidtv/vidtv_channel.c:301 [inline]
    vidtv_channel_si_init+0x189/0x770 drivers/media/test-drivers/vidtv/vidtv_channel.c:436
    vidtv_mux_init+0x115/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:525
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:658
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:769
    dvb_demux_do_ioctl+0x297/0x7d0 drivers/media/dvb-core/dmxdev.c:1065
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888127933ae0 (size 32):
  comm "syz.0.17", pid 5915, jiffies 4294944056
  hex dump (first 32 bytes):
    08 80 fd 80 1b 60 3c 93 27 81 88 ff ff 00 00 00  .....`<.'.......
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc ea6b5104):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5485
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    vidtv_psi_sdt_service_init+0x32/0xa0 drivers/media/test-drivers/vidtv/vidtv_psi.c:1386
    vidtv_channel_sdt_serv_cat_into_new drivers/media/test-drivers/vidtv/vidtv_channel.c:229 [inline]
    vidtv_channel_si_init+0x22f/0x770 drivers/media/test-drivers/vidtv/vidtv_channel.c:439
    vidtv_mux_init+0x115/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:525
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:658
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:769
    dvb_demux_do_ioctl+0x297/0x7d0 drivers/media/dvb-core/dmxdev.c:1065
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888127933c60 (size 32):
  comm "syz.0.17", pid 5915, jiffies 4294944056
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 48 19 02 0c 70 22 a4 06  ........H...p"..
    81 88 ff ff 0a 10 2e a4 06 81 88 ff ff 00 00 00  ................
  backtrace (crc 661d6f14):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5485
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    vidtv_psi_service_desc_init+0x74/0x1b0 drivers/media/test-drivers/vidtv/vidtv_psi.c:233
    vidtv_psi_desc_clone+0x137/0x160 drivers/media/test-drivers/vidtv/vidtv_psi.c:451
    vidtv_channel_sdt_serv_cat_into_new drivers/media/test-drivers/vidtv/vidtv_channel.c:236 [inline]
    vidtv_channel_si_init+0x1d7/0x770 drivers/media/test-drivers/vidtv/vidtv_channel.c:439
    vidtv_mux_init+0x115/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:525
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:658
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:769
    dvb_demux_do_ioctl+0x297/0x7d0 drivers/media/dvb-core/dmxdev.c:1065
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888106a42e10 (size 16):
  comm "syz.0.17", pid 5915, jiffies 4294944056
  hex dump (first 16 bytes):
    0b 42 65 65 74 68 6f 76 65 6e 00 00 00 00 00 00  .Beethoven......
  backtrace (crc e88d86b):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __do_kmalloc_node mm/slub.c:5333 [inline]
    __kmalloc_node_track_caller_noprof+0x3d3/0x570 mm/slub.c:5471
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    vidtv_psi_service_desc_init+0x17a/0x1b0 drivers/media/test-drivers/vidtv/vidtv_psi.c:250
    vidtv_psi_desc_clone+0x137/0x160 drivers/media/test-drivers/vidtv/vidtv_psi.c:451
    vidtv_channel_sdt_serv_cat_into_new drivers/media/test-drivers/vidtv/vidtv_channel.c:236 [inline]
    vidtv_channel_si_init+0x1d7/0x770 drivers/media/test-drivers/vidtv/vidtv_channel.c:439
    vidtv_mux_init+0x115/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:525
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:658
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:769
    dvb_demux_do_ioctl+0x297/0x7d0 drivers/media/dvb-core/dmxdev.c:1065
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888106a42270 (size 16):
  comm "syz.0.17", pid 5915, jiffies 4294944056
  hex dump (first 16 bytes):
    0b 4c 69 6e 75 78 54 56 2e 6f 72 67 00 00 00 00  .LinuxTV.org....
  backtrace (crc b60e4fc0):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __do_kmalloc_node mm/slub.c:5333 [inline]
    __kmalloc_node_track_caller_noprof+0x3d3/0x570 mm/slub.c:5471
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    vidtv_psi_service_desc_init+0x130/0x1b0 drivers/media/test-drivers/vidtv/vidtv_psi.c:258
    vidtv_psi_desc_clone+0x137/0x160 drivers/media/test-drivers/vidtv/vidtv_psi.c:451
    vidtv_channel_sdt_serv_cat_into_new drivers/media/test-drivers/vidtv/vidtv_channel.c:236 [inline]
    vidtv_channel_si_init+0x1d7/0x770 drivers/media/test-drivers/vidtv/vidtv_channel.c:439
    vidtv_mux_init+0x115/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:525
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:658
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:769
    dvb_demux_do_ioctl+0x297/0x7d0 drivers/media/dvb-core/dmxdev.c:1065
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


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
