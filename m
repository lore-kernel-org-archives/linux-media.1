Received: from mail-ot1-f77.google.com (mail-ot1-f77.google.com [209.85.210.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5061F346A0B
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 22:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785969881; cv=none; b=f6nqLriOc6gZ5kwgFnL5SgnZ57bYPf0RXJcMDFMd0G/Q1+tnbKJM+ki4eFAHYjGNkCdcG4zH8LSoqJ067Bu2RJDWcwFoSrP+4scOLpb0pNaEnSTfeWNFzt9bv8ndE+SGu9IlnJ0C5J+vgn/amYj9rppozGbrK0NcZOvHE/fytv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785969881; c=relaxed/simple;
	bh=2c0KXvqtig5fEIhQ+OyYrLYgHyrqX+O6xsMnu3WEi2w=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=hIfEs4tdZg7O7d6MFIk9fJ6QTdlGfvGJsDXDGzTxggvxYErLOa9ShQogW+Q+BwiZ6jkAToQn1ymnUMo3RLVF6vPPxwZhcpsAuv9VOZ+80cad17Qf9qyMD07gqL2WEIiP2Vq+ad+xbubAumr/r3oXagXmlFAylqFtbergZjR/Yrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f77.google.com with SMTP id 46e09a7af769-7f18aff8226so1558889a34.2
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 15:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785969877; x=1786574677;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0DGWtEl1DY5MxpGg2Om25EwGEhrBnSighO6L+1vhr+4=;
        b=U4EP4RIsEIWHoa+gSrPhMsWX0pQjtRpwf5mOrb/RpeLgOaEFZ5n358KSmITA07kEZx
         /CHWciY1By6tj7t8U4a4CanETra3KEVG30EOa61j+FVVHDCIiSpOf9txgLONjEZ2pc2n
         ugjeWiONI9pPU5AwYRSbltWIUqWpM7sQDZWZKpE4hXpudOysSL/g5vvfDmNPDKHkyQhL
         U7EK8ZXmXBkgqShaTAs5OO0zklsvqducCtoZfgwxD5ze9DQhaLqrzto7FXd9HwUlaVhm
         j7stvuI5kdVFuJkXqZ9Y0VD/MbBFE3lDzI3vdvNkbEPkkMzYLPEkbM+XI4bXRzOSEeyJ
         e6Yg==
X-Forwarded-Encrypted: i=1; AHgh+RrdeZg/mBQdu3fpyNRELU2A4zmCC3fK+3r3/0vzvqY1GyzTGX6oonJQVUhp9xMT8ZG4lY4wUEn0O6WsPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YycNsw3BFJemrksOJme/eRGMAy5fKLXzo9IgN+p1dxZQ90VQJJ0
	tXhXEYfJinMwYcNJGpRzyRHSAB7dc3sutkbvLWFUhSdcIPMschR7Tj16dx6CzwBvoqTuwDM1F1i
	OyiYwt91exC7jVMkSobcWRAX0IPQIahhL8c5QGiU3JZEA5SrN1mLngA24AOU=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b14:b0:6a3:927:a1d4 with SMTP id
 006d021491bc7-6ae96f2a7b4mr5127081eaf.24.1785969877007; Wed, 05 Aug 2026
 15:44:37 -0700 (PDT)
Date: Wed, 05 Aug 2026 15:44:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a73bcd4.01d0871a.3a0d52.0002.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in rc_dev_uevent
From: syzbot <syzbot+237c754233330b2bf565@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, sean@mess.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=104093b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=237c754233330b2bf565
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=144bacc6580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1399fc9e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/32c9dc084aaa/disk-848acc8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b7604244b0a9/vmlinux-848acc8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4cd321f6fe47/bzImage-848acc8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+237c754233330b2bf565@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in string_nocheck lib/vsprintf.c:648 [inline]
BUG: KASAN: slab-use-after-free in string+0x471/0x4d0 lib/vsprintf.c:730
Read of size 1 at addr ffff88807aced758 by task udevd/4977

CPU: 1 UID: 0 PID: 4977 Comm: udevd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 string_nocheck lib/vsprintf.c:648 [inline]
 string+0x471/0x4d0 lib/vsprintf.c:730
 vsnprintf+0x422/0x1300 lib/vsprintf.c:2945
 add_uevent_var+0x183/0x3a0 lib/kobject_uevent.c:682
 rc_dev_uevent+0x17d/0x1c0 drivers/media/rc/rc-main.c:1632
 dev_uevent+0x2f1/0x870 drivers/base/core.c:2779
 uevent_show+0x1ca/0x3a0 drivers/base/core.c:2826
 dev_attr_show+0x52/0xa0 drivers/base/core.c:2487
 sysfs_kf_seq_show+0x217/0x3f0 fs/sysfs/file.c:65
 seq_read_iter+0x32f/0x1270 fs/seq_file.c:231
 kernfs_fop_read_iter+0x46c/0x610 fs/kernfs/file.c:290
 new_sync_read fs/read_write.c:493 [inline]
 vfs_read+0x82e/0xb40 fs/read_write.c:574
 ksys_read+0x12a/0x250 fs/read_write.c:716
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f168bca7407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffda5a592a0 EFLAGS: 00000202 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 00007f168c37c880 RCX: 00007f168bca7407
RDX: 0000000000001000 RSI: 0000557455235f80 RDI: 000000000000000c
RBP: 00007f168bdefff0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 000000000000000a
R13: 00007f168bdefea0 R14: 0000000000000000 R15: 0000557455215a60
 </TASK>

Allocated by task 1222:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2e5/0x6c0 mm/slub.c:5489
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 redrat3_dev_probe+0x326/0x2b50 drivers/media/rc/redrat3.c:1023
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3772
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3772
 usb_new_device.cold+0x685/0x115c drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x30a3/0x4a60 drivers/usb/core/hub.c:5953
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 1222:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6692
 redrat3_delete drivers/media/rc/redrat3.c:466 [inline]
 redrat3_dev_probe+0x107a/0x2b50 drivers/media/rc/redrat3.c:1124
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3772
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3772
 usb_new_device.cold+0x685/0x115c drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x30a3/0x4a60 drivers/usb/core/hub.c:5953
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88807aced000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 1880 bytes inside of
 freed 2048-byte region [ffff88807aced000, ffff88807aced800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7ace8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88813fe28000 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800080008 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88813fe28000 dead000000000100 dead000000000122
head: 0000000000000000 0000000800080008 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 4966, tgid 4966 (klogd), ts 87973202656, free_ts 87882599427
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0xf48/0x3530 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x299/0x2dc0 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3266 [inline]
 allocate_slab mm/slub.c:3380 [inline]
 new_slab+0xa2/0x640 mm/slub.c:3426
 refill_objects+0xe3/0x410 mm/slub.c:7310
 refill_sheaf mm/slub.c:2804 [inline]
 __pcs_replace_empty_main+0x376/0x680 mm/slub.c:4675
 alloc_from_pcs mm/slub.c:4773 [inline]
 slab_alloc_node mm/slub.c:4905 [inline]
 __kmalloc_cache_noprof+0x479/0x6c0 mm/slub.c:5485
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 syslog_print+0xf8/0x620 kernel/printk/printk.c:1585
 do_syslog+0x5bd/0x6d0 kernel/printk/printk.c:1763
 __do_sys_syslog kernel/printk/printk.c:1855 [inline]
 __se_sys_syslog kernel/printk/printk.c:1853 [inline]
 __x64_sys_syslog+0x74/0xb0 kernel/printk/printk.c:1853
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 4977 tgid 4977 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x79f/0x1090 mm/page_alloc.c:2950
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x47/0xf0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x1a0/0x1f0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4584 [inline]
 slab_alloc_node mm/slub.c:4917 [inline]
 kmem_cache_alloc_noprof+0x26b/0x6a0 mm/slub.c:4931
 alloc_filename fs/namei.c:147 [inline]
 do_getname+0x35/0x390 fs/namei.c:187
 class_filename_flags_constructor include/linux/fs.h:2566 [inline]
 do_sys_openat2+0xc7/0x1e0 fs/open.c:1367
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88807aced600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807aced680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88807aced700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                    ^
 ffff88807aced780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807aced800: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


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
