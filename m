Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EA92E2DDD
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 07:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787385279; cv=none; b=Cb5y4vH6fKQ4rDgnqi60anzFMRxFNJCl6vzLDKNkZKKl47eDXvuXXDOv9mTqhlHz9/DGclX87DRq/vtiz7m8e+DOAlUWVKt70lhGYdFUOTXlO8pNvqAhx2JmNZHqp/Y4YweAmlSdymFOMblTfWtCwYEaswjs2UsorHLARaBOWzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787385279; c=relaxed/simple;
	bh=Mw2OpLHz702qrBACIrM6kPogMRHQ19+zXmcYMGH1XBk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=URAnAzxu/tEtr3cgXgtbMETKeo7UHAz+EhAviYZg4Pl3SDz1yUUYU5mwNR0wvtZvBlD4dXCt2PaDsD30t4eaMffMNo5G2qviKqxBEGYKKiV10WOA9Wz+7fMDxUWEbiQki6zFyBb/RtE8O/yFllFwySQE6D6WDHEv1XRfMs1qmsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-4a41f46d629so3363104b6e.3
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 00:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787385276; x=1787990076;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o52GhPYpBcvfj7CuMxuj67kTNnugcNFrWrqXlT1IWTs=;
        b=GlxfkmBNFC3aFrDA4c7SlVk08gid4w4LQdpeHDbOWg74CwaOvRjWgueqwGwBkNIpq0
         Qtkgd7Em3lNyvxw5LiHau0UJeIz+M7ZDbUJNgC0N2PBopmELw4jKHCtNh4WFdNqGKex8
         vOLfg+XYsPeHrc1af8xs9HGEZoFjIeU7/GqwSBDkrnJrmkV3K8AU0TIfoHtDiQNPN3Od
         A2lgOf6xMqUBQglQbVAiagnkfhOhX6LglnDnPzaca7BZ3CdMfzwYJC50ajrAjHx5pApP
         IgXf0GQMPhJZDq+R7npIQVxmf+wHn1VqG3nWe5eeK5sDSbTyFXe6rStF+oXL5zVNJKr2
         2itA==
X-Forwarded-Encrypted: i=1; AHgh+Rqlq1yjMms8d1MpT6+gLTCleTve7NSj3UpXYrRsSUOINjd6cLlGabYuAHVJajY11sDShryEaNTOWzyCHw==@vger.kernel.org
X-Gm-Message-State: AFuF++lfEgb1UukmoGyRAC2dM7phsz2wieDY44u4Aju4fgqvd8Kjjyqk
	WVIFeJl33FYmFz/y3CrcfwsTXF4w7d9hMBegpw44fzhptoyLoED95XO7H7zq+2x76KKqwYLE9S4
	m8t3tfEoTnCzEoCXQZT9ExOyXj0IRPCT4EkSmS7qJfjt4pZnzB4nOBnU1JE0=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:152a:b0:4b2:9aae:3f71 with SMTP id
 5614622812f47-4b2ef378f40mr13325928b6e.15.1787385275767; Sat, 22 Aug 2026
 00:54:35 -0700 (PDT)
Date: Sat, 22 Aug 2026 00:54:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8955bb.dbb3a75c.13dd47.002e.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in dvb_media_device_free
From: syzbot <syzbot+37578f730d38898f4b74@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    26260251022f Merge tag 'livepatching-for-7.3' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11e10625580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=54b0fd32feaa7e7d
dashboard link: https://syzkaller.appspot.com/bug?extid=37578f730d38898f4b74
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/009830dc9804/disk-26260251.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/56e3e1e4edb1/vmlinux-26260251.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3114315782db/bzImage-26260251.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+37578f730d38898f4b74@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in dvb_media_device_free+0x589/0x650 drivers/media/dvb-core/dvbdev.c:210
Read of size 8 at addr ffff88802d1dfab0 by task syz.4.4145/19619

CPU: 1 UID: 0 PID: 19619 Comm: syz.4.4145 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 dvb_media_device_free+0x589/0x650 drivers/media/dvb-core/dvbdev.c:210
 dvb_remove_device.part.0+0xa4/0x270 drivers/media/dvb-core/dvbdev.c:604
 dvb_remove_device+0x1f/0x30 drivers/media/dvb-core/dvbdev.c:596
 dvb_unregister_frontend+0x7a/0x150 drivers/media/dvb-core/dvb_frontend.c:3103
 vidtv_bridge_remove+0x84/0x140 drivers/media/test-drivers/vidtv/vidtv_bridge.c:554
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
RIP: 0033:0x7f2f66f9e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f2f67e18028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f2f67226090 RCX: 00007f2f66f9e0d9
RDX: 0000000000000007 RSI: 0000200000000300 RDI: 0000000000000004
RBP: 00007f2f67035024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f2f67226128 R14: 00007f2f67226090 R15: 00007ffd283e24d8
 </TASK>

Allocated by task 1:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2e7/0x6b0 mm/slub.c:5484
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 dvb_register_device+0x1d6/0x1e20 drivers/media/dvb-core/dvbdev.c:472
 dvb_register_frontend+0x552/0x820 drivers/media/dvb-core/dvb_frontend.c:3074
 vidtv_bridge_dvb_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:438 [inline]
 vidtv_bridge_probe+0x44b/0xa30 drivers/media/test-drivers/vidtv/vidtv_bridge.c:510
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

Freed by task 19619:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2678 [inline]
 slab_free mm/slub.c:6372 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6687
 dvb_free_device drivers/media/dvb-core/dvbdev.c:616 [inline]
 kref_put include/linux/kref.h:65 [inline]
 dvb_device_put.part.0+0x57/0x90 drivers/media/dvb-core/dvbdev.c:629
 dvb_device_put drivers/media/dvb-core/dvbdev.c:628 [inline]
 dvb_remove_device.part.0+0x90/0x270 drivers/media/dvb-core/dvbdev.c:601
 dvb_remove_device+0x1f/0x30 drivers/media/dvb-core/dvbdev.c:596
 dvb_unregister_frontend+0x7a/0x150 drivers/media/dvb-core/dvb_frontend.c:3103
 vidtv_bridge_remove+0x84/0x140 drivers/media/test-drivers/vidtv/vidtv_bridge.c:554
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

The buggy address belongs to the object at ffff88802d1dfa00
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 176 bytes inside of
 freed 256-byte region [ffff88802d1dfa00, ffff88802d1dfb00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2d1de
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801c027b40 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801c027b40 dead000000000100 dead000000000122
head: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 00fff00000000001 ffffffffffffff81 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000002
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 17295453492
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x110d/0x35b0 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x2eb/0x3300 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3267 [inline]
 allocate_slab mm/slub.c:3382 [inline]
 new_slab+0xa5/0x640 mm/slub.c:3428
 refill_objects+0xe3/0x410 mm/slub.c:7305
 refill_sheaf mm/slub.c:2805 [inline]
 __pcs_replace_empty_main+0x372/0x680 mm/slub.c:4677
 alloc_from_pcs mm/slub.c:4775 [inline]
 slab_alloc_node mm/slub.c:4907 [inline]
 __kmalloc_cache_noprof+0x47b/0x6b0 mm/slub.c:5480
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 bus_add_driver+0x92/0x5b0 drivers/base/bus.c:747
 driver_register+0x1e2/0x360 drivers/base/driver.c:174
 usb_register_driver drivers/usb/core/driver.c:1078 [inline]
 usb_register_driver+0x21c/0x3e0 drivers/usb/core/driver.c:1060
 do_one_initcall+0x11c/0x6f0 init/main.c:1353
 do_initcall_level init/main.c:1415 [inline]
 do_initcalls init/main.c:1431 [inline]
 do_basic_setup init/main.c:1451 [inline]
 kernel_init_freeable+0x6ea/0x7b0 init/main.c:1666
 kernel_init+0x21/0x1e0 init/main.c:1556
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802d1df980: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802d1dfa00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88802d1dfa80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                     ^
 ffff88802d1dfb00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802d1dfb80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================
==================================================================
BUG: KASAN: slab-use-after-free in dvb_media_device_free+0x5d1/0x650 drivers/media/dvb-core/dvbdev.c:212
Read of size 8 at addr ffff88802d1dfab0 by task syz.4.4145/19619

CPU: 1 UID: 0 PID: 19619 Comm: syz.4.4145 Tainted: G    B        L      syzkaller #0 PREEMPT(full) 
Tainted: [B]=BAD_PAGE, [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 dvb_media_device_free+0x5d1/0x650 drivers/media/dvb-core/dvbdev.c:212
 dvb_remove_device.part.0+0xa4/0x270 drivers/media/dvb-core/dvbdev.c:604
 dvb_remove_device+0x1f/0x30 drivers/media/dvb-core/dvbdev.c:596
 dvb_unregister_frontend+0x7a/0x150 drivers/media/dvb-core/dvb_frontend.c:3103
 vidtv_bridge_remove+0x84/0x140 drivers/media/test-drivers/vidtv/vidtv_bridge.c:554
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
RIP: 0033:0x7f2f66f9e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f2f67e18028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f2f67226090 RCX: 00007f2f66f9e0d9
RDX: 0000000000000007 RSI: 0000200000000300 RDI: 0000000000000004
RBP: 00007f2f67035024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f2f67226128 R14: 00007f2f67226090 R15: 00007ffd283e24d8
 </TASK>

Allocated by task 1:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2e7/0x6b0 mm/slub.c:5484
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 dvb_register_device+0x1d6/0x1e20 drivers/media/dvb-core/dvbdev.c:472
 dvb_register_frontend+0x552/0x820 drivers/media/dvb-core/dvb_frontend.c:3074
 vidtv_bridge_dvb_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:438 [inline]
 vidtv_bridge_probe+0x44b/0xa30 drivers/media/test-drivers/vidtv/vidtv_bridge.c:510
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

Freed by task 19619:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2678 [inline]
 slab_free mm/slub.c:6372 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6687
 dvb_free_device drivers/media/dvb-core/dvbdev.c:616 [inline]
 kref_put include/linux/kref.h:65 [inline]
 dvb_device_put.part.0+0x57/0x90 drivers/media/dvb-core/dvbdev.c:629
 dvb_device_put drivers/media/dvb-core/dvbdev.c:628 [inline]
 dvb_remove_device.part.0+0x90/0x270 drivers/media/dvb-core/dvbdev.c:601
 dvb_remove_device+0x1f/0x30 drivers/media/dvb-core/dvbdev.c:596
 dvb_unregister_frontend+0x7a/0x150 drivers/media/dvb-core/dvb_frontend.c:3103
 vidtv_bridge_remove+0x84/0x140 drivers/media/test-drivers/vidtv/vidtv_bridge.c:554
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

The buggy address belongs to the object at ffff88802d1dfa00
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 176 bytes inside of
 freed 256-byte region [ffff88802d1dfa00, ffff88802d1dfb00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2d1de
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801c027b40 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801c027b40 dead000000000100 dead000000000122
head: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 00fff00000000001 ffffffffffffff81 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000002
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 17295453492
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x110d/0x35b0 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x2eb/0x3300 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3267 [inline]
 allocate_slab mm/slub.c:3382 [inline]
 new_slab+0xa5/0x640 mm/slub.c:3428
 refill_objects+0xe3/0x410 mm/slub.c:7305
 refill_sheaf mm/slub.c:2805 [inline]
 __pcs_replace_empty_main+0x372/0x680 mm/slub.c:4677
 alloc_from_pcs mm/slub.c:4775 [inline]
 slab_alloc_node mm/slub.c:4907 [inline]
 __kmalloc_cache_noprof+0x47b/0x6b0 mm/slub.c:5480
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 bus_add_driver+0x92/0x5b0 drivers/base/bus.c:747
 driver_register+0x1e2/0x360 drivers/base/driver.c:174
 usb_register_driver drivers/usb/core/driver.c:1078 [inline]
 usb_register_driver+0x21c/0x3e0 drivers/usb/core/driver.c:1060
 do_one_initcall+0x11c/0x6f0 init/main.c:1353
 do_initcall_level init/main.c:1415 [inline]
 do_initcalls init/main.c:1431 [inline]
 do_basic_setup init/main.c:1451 [inline]
 kernel_init_freeable+0x6ea/0x7b0 init/main.c:1666
 kernel_init+0x21/0x1e0 init/main.c:1556
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802d1df980: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802d1dfa00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88802d1dfa80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                     ^
 ffff88802d1dfb00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802d1dfb80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================
==================================================================
BUG: KASAN: slab-use-after-free in dvb_media_device_free+0x5eb/0x650 drivers/media/dvb-core/dvbdev.c:213
Read of size 8 at addr ffff88802d1dfac0 by task syz.4.4145/19619

CPU: 1 UID: 0 PID: 19619 Comm: syz.4.4145 Tainted: G    B        L      syzkaller #0 PREEMPT(full) 
Tainted: [B]=BAD_PAGE, [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 dvb_media_device_free+0x5eb/0x650 drivers/media/dvb-core/dvbdev.c:213
 dvb_remove_device.part.0+0xa4/0x270 drivers/media/dvb-core/dvbdev.c:604
 dvb_remove_device+0x1f/0x30 drivers/media/dvb-core/dvbdev.c:596
 dvb_unregister_frontend+0x7a/0x150 drivers/media/dvb-core/dvb_frontend.c:3103
 vidtv_bridge_remove+0x84/0x140 drivers/media/test-drivers/vidtv/vidtv_bridge.c:554
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
RIP: 0033:0x7f2f66f9e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f2f67e18028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f2f67226090 RCX: 00007f2f66f9e0d9
RDX: 0000000000000007 RSI: 0000200000000300 RDI: 0000000000000004
RBP: 00007f2f67035024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f2f67226128 R14: 00007f2f67226090 R15: 00007ffd283e24d8
 </TASK>

Allocated by task 1:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2e7/0x6b0 mm/slub.c:5484
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 dvb_register_device+0x1d6/0x1e20 drivers/media/dvb-core/dvbdev.c:472
 dvb_register_frontend+0x552/0x820 drivers/media/dvb-core/dvb_frontend.c:3074
 vidtv_bridge_dvb_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:438 [inline]
 vidtv_bridge_probe+0x44b/0xa30 drivers/media/test-drivers/vidtv/vidtv_bridge.c:510
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

Freed by task 19619:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2678 [inline]
 slab_free mm/slub.c:6372 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6687
 dvb_free_device drivers/media/dvb-core/dvbdev.c:616 [inline]
 kref_put include/linux/kref.h:65 [inline]
 dvb_device_put.part.0+0x57/0x90 drivers/media/dvb-core/dvbdev.c:629
 dvb_device_put drivers/media/dvb-core/dvbdev.c:628 [inline]
 dvb_remove_device.part.0+0x90/0x270 drivers/media/dvb-core/dvbdev.c:601
 dvb_remove_device+0x1f/0x30 drivers/media/dvb-core/dvbdev.c:596
 dvb_unregister_frontend+0x7a/0x150 drivers/media/dvb-core/dvb_frontend.c:3103
 vidtv_bridge_remove+0x84/0x140 drivers/media/test-drivers/vidtv/vidtv_bridge.c:554
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

The buggy address belongs to the object at ffff88802d1dfa00
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 192 bytes inside of
 freed 256-byte region [ffff88802d1dfa00, ffff88802d1dfb00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2d1de
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801c027b40 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801c027b40 dead000000000100 dead000000000122
head: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 00fff00000000001 ffffffffffffff81 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000002
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 17295453492
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x110d/0x35b0 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x2eb/0x3300 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3267 [inline]
 allocate_slab mm/slub.c:3382 [inline]
 new_slab+0xa5/0x640 mm/slub.c:3428
 refill_objects+0xe3/0x410 mm/slub.c:7305
 refill_sheaf mm/slub.c:2805 [inline]
 __pcs_replace_empty_main+0x372/0x680 mm/slub.c:4677
 alloc_from_pcs mm/slub.c:4775 [inline]
 slab_alloc_node mm/slub.c:4907 [inline]
 __kmalloc_cache_noprof+0x47b/0x6b0 mm/slub.c:5480
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 bus_add_driver+0x92/0x5b0 drivers/base/bus.c:747
 driver_register+0x1e2/0x360 drivers/base/driver.c:174
 usb_register_driver drivers/usb/core/driver.c:1078 [inline]
 usb_register_driver+0x21c/0x3e0 drivers/usb/core/driver.c:1060
 do_one_initcall+0x11c/0x6f0 init/main.c:1353
 do_initcall_level init/main.c:1415 [inline]
 do_initcalls init/main.c:1431 [inline]
 do_basic_setup init/main.c:1451 [inline]
 kernel_init_freeable+0x6ea/0x7b0 init/main.c:1666
 kernel_init+0x21/0x1e0 init/main.c:1556
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802d1df980: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802d1dfa00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88802d1dfa80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                           ^
 ffff88802d1dfb00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802d1dfb80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================
==================================================================
BUG: KASAN: slab-use-after-free in dvb_media_device_free+0x5de/0x650 drivers/media/dvb-core/dvbdev.c:214
Write of size 8 at addr ffff88802d1dfab0 by task syz.4.4145/19619

CPU: 1 UID: 0 PID: 19619 Comm: syz.4.4145 Tainted: G    B        L      syzkaller #0 PREEMPT(full) 
Tainted: [B]=BAD_PAGE, [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 dvb_media_device_free+0x5de/0x650 drivers/media/dvb-core/dvbdev.c:214
 dvb_remove_device.part.0+0xa4/0x270 drivers/media/dvb-core/dvbdev.c:604
 dvb_remove_device+0x1f/0x30 drivers/media/dvb-core/dvbdev.c:596
 dvb_unregister_frontend+0x7a/0x150 drivers/media/dvb-core/dvb_frontend.c:3103
 vidtv_bridge_remove+0x84/0x140 drivers/media/test-drivers/vidtv/vidtv_bridge.c:554
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
RIP: 0033:0x7f2f66f9e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f2f67e18028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f2f67226090 RCX: 00007f2f66f9e0d9
RDX: 0000000000000007 RSI: 0000200000000300 RDI: 0000000000000004
RBP: 00007f2f67035024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f2f67226128 R14: 00007f2f67226090 R15: 00007ffd283e24d8
 </TASK>

Allocated by task 1:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2e7/0x6b0 mm/slub.c:5484
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 dvb_register_device+0x1d6/0x1e20 drivers/media/dvb-core/dvbdev.c:472
 dvb_register_frontend+0x552/0x820 drivers/media/dvb-core/dvb_frontend.c:3074
 vidtv_bridge_dvb_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:438 [inline]
 vidtv_bridge_probe+0x44b/0xa30 drivers/media/test-drivers/vidtv/vidtv_bridge.c:510
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

Freed by task 19619:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2678 [inline]
 slab_free mm/slub.c:6372 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6687
 dvb_free_device drivers/media/dvb-core/dvbdev.c:616 [inline]
 kref_put include/linux/kref.h:65 [inline]
 dvb_device_put.part.0+0x57/0x90 drivers/media/dvb-core/dvbdev.c:629
 dvb_device_put drivers/media/dvb-core/dvbdev.c:628 [inline]
 dvb_remove_device.part.0+0x90/0x270 drivers/media/dvb-core/dvbdev.c:601
 dvb_remove_device+0x1f/0x30 drivers/media/dvb-core/dvbdev.c:596
 dvb_unregister_frontend+0x7a/0x150 drivers/media/dvb-core/dvb_frontend.c:3103
 vidtv_bridge_remove+0x84/0x140 drivers/media/test-drivers/vidtv/vidtv_bridge.c:554
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

The buggy address belongs to the object at ffff88802d1dfa00
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 176 bytes inside of
 freed 256-byte region [ffff88802d1dfa00, ffff88802d1dfb00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2d1de
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801c027b40 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801c027b40 dead000000000100 dead000000000122
head: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 00fff00000000001 ffffffffffffff81 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000002
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 17295453492
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x110d/0x35b0 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x2eb/0x3300 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3267 [inline]
 allocate_slab mm/slub.c:3382 [inline]
 new_slab+0xa5/0x640 mm/slub.c:3428
 refill_objects+0xe3/0x410 mm/slub.c:7305
 refill_sheaf mm/slub.c:2805 [inline]
 __pcs_replace_empty_main+0x372/0x680 mm/slub.c:4677
 alloc_from_pcs mm/slub.c:4775 [inline]
 slab_alloc_node mm/slub.c:4907 [inline]
 __kmalloc_cache_noprof+0x47b/0x6b0 mm/slub.c:5480
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 bus_add_driver+0x92/0x5b0 drivers/base/bus.c:747
 driver_register+0x1e2/0x360 drivers/base/driver.c:174
 usb_register_driver drivers/usb/core/driver.c:1078 [inline]
 usb_register_driver+0x21c/0x3e0 drivers/usb/core/driver.c:1060
 do_one_initcall+0x11c/0x6f0 init/main.c:1353
 do_initcall_level init/main.c:1415 [inline]
 do_initcalls init/main.c:1431 [inline]
 do_basic_setup init/main.c:1451 [inline]
 kernel_init_freeable+0x6ea/0x7b0 init/main.c:1666
 kernel_init+0x21/0x1e0 init/main.c:1556
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802d1df980: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802d1dfa00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88802d1dfa80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                     ^
 ffff88802d1dfb00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802d1dfb80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
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
