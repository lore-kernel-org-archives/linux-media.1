Received: from mail-oa1-f77.google.com (mail-oa1-f77.google.com [209.85.160.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D339423764
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577631; cv=none; b=L5AtejrPazaM4kkWc1cXl/soQDM2ZzaLC3B9vR74xnoOMaERwt2CF6kAzSz0c8xLVdHck6Bwp3A7mChOgNRSsPavM2jJXjLrJdYC5vNWfk7V43+3I8xOpq+AB6TYJ7nFWM/JmXOpyMH+RTaqpMhumZyeqHVatNtkmG5ksTAQReI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577631; c=relaxed/simple;
	bh=3P24vNIm1EAWOEITUomUFsmr4YhRnM5RHOINGCEBU34=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=kdkht3z3tW9tK5Oh0AOVw2su6wd2DSbE1Fyrx/N7lEgMApInvFBYErVVSBUk/ybQ0zsFSnOc0vBL8hazDdN/urzcclaoN8TB0/toQkxoMUppDlZM7w/c2quVEnUIRKqyDwqnTrQgxG1hG/pM2+WBJsr78k6sXu8G4aTInyNr/bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f77.google.com with SMTP id 586e51a60fabf-458326d2d9aso6845330fac.2
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 06:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787577628; x=1788182428;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gs8s8TTblI1BhSFxrDz9WluSSaE52+G83FVkACX7LoE=;
        b=arnGTn4X1adWMk+Fb0r8LeXT+qrhEn0w0IJ2NXvNPMQ743gymopUSTVrV+ieZ4b04E
         fUmXQtbAVONiKiQ4w1des0FZ7PVCXKRDVNxsTPh9tJsuYQowq5c5VmbDOhc7VPb07TLH
         e6f7J+FCN+WL8iY3mEe4kSMXEZmcJV/opVI5dh+oE4eSXbFnXRgw/kMA8RNrYepKe+p3
         X8rKFcCm4ByUJHyV/hSieH2GSLIMyZHzaSUZ8h3bhIb2Yc99ojOxMvYC9shaNJd8nuka
         N2woEHs4gtalUeXEQaojqc2ufV7yS/+qGudus8Z/Y65w3jL6E5AyL9e/O1WCBAWpx88h
         tetg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3+jlNNZtSY/qFJowXmkhVM5MCvg9KlStbac8JYcKqYPFD26MNCWLdzWQgWT38I8THJiU+usrK0t/Caw==@vger.kernel.org
X-Gm-Message-State: AFuF++nLXqaOOjJ3+i27ARiRhyOUthW2QYlWA4LNPoXv0KaEXiV7iYRp
	vRaX21YYQ1sa48zFjLO3PwhGgCASIlZPZsL6dDY/J4lGzVTyWgsT2t2eFLmcWWQjeAP2TkYrubv
	c3uJD8N/o17pJT5UxaI2yH0EXYEt7XFRFOHJTKmwybHWMJoAPFfPUApcazK0=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:341a:20b0:6aa:e176:bcb5 with SMTP id
 006d021491bc7-6b15925da2fmr18341893eaf.14.1787577628188; Mon, 24 Aug 2026
 06:20:28 -0700 (PDT)
Date: Mon, 24 Aug 2026 06:20:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8c451c.dbb3a75c.7844.0004.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in vidtv_bridge_on_new_pkts_avail
From: syzbot <syzbot+c7fc4794e59786f5b4dc@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a4ff2be345d0 Merge tag 'v7.3-p1' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=148d7a25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=29686c02180e4e86
dashboard link: https://syzkaller.appspot.com/bug?extid=c7fc4794e59786f5b4dc
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4d9954692e65/disk-a4ff2be3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7c863580607c/vmlinux-a4ff2be3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9ce6174eaf8d/bzImage-a4ff2be3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c7fc4794e59786f5b4dc@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in vidtv_bridge_check_demod_lock drivers/media/test-drivers/vidtv/vidtv_bridge.c:145 [inline]
BUG: KASAN: slab-use-after-free in vidtv_bridge_on_new_pkts_avail+0x126/0x140 drivers/media/test-drivers/vidtv/vidtv_bridge.c:162
Read of size 8 at addr ffff88802dc67118 by task kworker/1:12/13368

CPU: 1 UID: 0 PID: 13368 Comm: kworker/1:12 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Workqueue: events vidtv_mux_tick
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 vidtv_bridge_check_demod_lock drivers/media/test-drivers/vidtv/vidtv_bridge.c:145 [inline]
 vidtv_bridge_on_new_pkts_avail+0x126/0x140 drivers/media/test-drivers/vidtv/vidtv_bridge.c:162
 vidtv_mux_tick+0xb95/0x1460 drivers/media/test-drivers/vidtv/vidtv_mux.c:426
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 1:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2e7/0x6b0 mm/slub.c:5489
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 vidtv_demod_i2c_probe+0x6e/0x8a0 drivers/media/test-drivers/vidtv/vidtv_demod.c:421
 i2c_device_probe+0x658/0xd10 drivers/i2c/i2c-core-base.c:593
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3776
 i2c_new_client_device+0x660/0xd30 drivers/i2c/i2c-core-base.c:1020
 dvb_module_probe+0x165/0x310 drivers/media/dvb-core/dvbdev.c:1039
 vidtv_bridge_probe_demod drivers/media/test-drivers/vidtv/vidtv_bridge.c:354 [inline]
 vidtv_bridge_dvb_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:430 [inline]
 vidtv_bridge_probe+0x370/0xa30 drivers/media/test-drivers/vidtv/vidtv_bridge.c:510
 platform_probe+0x106/0x1d0 drivers/base/platform.c:1507
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __driver_attach+0x21f/0x5b0 drivers/base/dd.c:1292
 bus_for_each_dev+0x13e/0x1d0 drivers/base/bus.c:383
 bus_add_driver+0x305/0x5b0 drivers/base/bus.c:763
 driver_register+0x1e2/0x360 drivers/base/driver.c:174
 vidtv_bridge_init+0x52/0x80 drivers/media/test-drivers/vidtv/vidtv_bridge.c:602
 do_one_initcall+0x11c/0x6f0 init/main.c:1353
 do_initcall_level init/main.c:1415 [inline]
 do_initcalls init/main.c:1431 [inline]
 do_basic_setup init/main.c:1451 [inline]
 kernel_init_freeable+0x6ea/0x7b0 init/main.c:1666
 kernel_init+0x21/0x1e0 init/main.c:1556
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 20213:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6692
 i2c_device_remove+0x81/0x280 drivers/i2c/i2c-core-base.c:632
 device_remove+0xcb/0x180 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:664
 device_del+0x376/0x9b0 drivers/base/core.c:3965
 device_unregister+0x1d/0xe0 drivers/base/core.c:4006
 i2c_unregister_device+0xf5/0x270 drivers/i2c/i2c-core-base.c:1076
 dvb_module_release drivers/media/dvb-core/dvbdev.c:1061 [inline]
 dvb_module_release+0x69/0x90 drivers/media/dvb-core/dvbdev.c:1055
 vidtv_bridge_remove+0xd8/0x140 drivers/media/test-drivers/vidtv/vidtv_bridge.c:556
 platform_remove+0x5f/0x80 drivers/base/platform.c:1524
 device_remove+0xcb/0x180 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 unbind_store+0xf8/0x110 drivers/base/bus.c:244
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802dc67000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 280 bytes inside of
 freed 2048-byte region [ffff88802dc67000, ffff88802dc67800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2dc60
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801c022000 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800080008 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801c022000 dead000000000100 dead000000000122
head: 0000000000000000 0000000800080008 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1210, tgid 1210 (kworker/1:2), ts 13830241599, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0xf46/0x3500 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x299/0x2dc0 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3266 [inline]
 allocate_slab mm/slub.c:3380 [inline]
 new_slab+0xa2/0x660 mm/slub.c:3426
 refill_objects+0xe3/0x410 mm/slub.c:7310
 refill_sheaf mm/slub.c:2804 [inline]
 __pcs_replace_empty_main+0x372/0x680 mm/slub.c:4675
 alloc_from_pcs mm/slub.c:4773 [inline]
 slab_alloc_node mm/slub.c:4905 [inline]
 __kmalloc_cache_noprof+0x47b/0x6b0 mm/slub.c:5485
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 mousedev_create+0x95/0xb40 drivers/input/mousedev.c:856
 mousedev_connect+0x26/0x310 drivers/input/mousedev.c:981
 input_attach_handler.isra.0+0x177/0x1e0 drivers/input/input.c:1074
 input_register_device.cold+0x139/0x375 drivers/input/input.c:2451
 psmouse_connect+0x772/0xf50 drivers/input/mouse/psmouse-base.c:1608
 serio_connect_driver drivers/input/serio/serio.c:44 [inline]
 serio_driver_probe+0x77/0xa0 drivers/input/serio/serio.c:748
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802dc67000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802dc67080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88802dc67100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                            ^
 ffff88802dc67180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802dc67200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
