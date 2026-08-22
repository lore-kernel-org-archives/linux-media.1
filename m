Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F064233D6D6
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 04:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787372674; cv=none; b=HDJ5Xb4E3yQUDaNdcjyUSYu3XBxhm89nHJ+MM5sVNUl4P1gvAa//DqOIt0jNy4m3blDxLE3w5CAdpSUgQ8xGuTXx4aUNqCyy2TPUnQnOda48Tt+99OBiJG4gNKqNDNGeZmRgy+tzDT7FDAkHcNzQNfIsW0VLz1lxySF5wcumkdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787372674; c=relaxed/simple;
	bh=8sjOntunlyjqIPDjs9dGfHBw0qMBSnqGtZMHxtDrOdI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=mr5o4O0qGqDfH/yPiiff1RSPq+VcWISKylshWKXC1aCMf+F1i+qlzZCnExIjPxwpSrUO76NcNIRZk4icUsbpFI6rM2GIQ3x7jDnNj9UTv6YjnEPi98gx2uVCJvmzrMrLYIbkSnGm/rxDWSNOLPWMf8YWA7ikrLCsDi64AG+X8oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4b2d1eb484aso2919988b6e.2
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 21:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787372672; x=1787977472;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1V6LTXBD+WJ5h0INEtfebSEg1XMq45TL8Jrf5S3gT6c=;
        b=seCMEdLH3NW8ki/86SAoKsaNm1pDdmCQhuYhNaozeN342eaCfnzMngWpGgTUlMgw/j
         7sAd8SkGtveLxbT/XCLvrBzf1IaVxOyohWwj8N8o7FHgBWG0AV51nC+2Pb1xv0SVm1Vh
         Tnjuu0Nh+gaFd/2KKwbj6bOHkrTcP1HLS8Y2l/BxaBvKjg0UmQ0PuNZpazYYZpsEwfBC
         6J1qGI2HMetdKJNPh3gg6xTBsIVLk1X0VQqEoiTClzWfYVtzRtfZa0SS71H/cov2mDL8
         hVN4tP0ZJbxc0gKAtAKyP+8nDC0mMwHK26bjQcLF5je9uOW1YYsxIjB0/LMsXTLD8pC0
         PVdQ==
X-Forwarded-Encrypted: i=1; AHgh+RpiqAU470ff+8+0s+NDnu88IvceJrWBch5whcrm+gptJX2dQNhdrJshal0lcvQQtjgtckOMm3T2Y9+kXw==@vger.kernel.org
X-Gm-Message-State: AFuF++kvN7LCGgJv5CgNDgmux6FfUmREuHS5BspQngWppiNBW2pugZLa
	kn8DDLEU7Jr9ZcTgO6IYOKlnjKAIj08rXYDjX7hkh/zeFlsS3k0Bmd9Door91J1mZj08HM7zv3b
	fqIhO0N/4ZuTDe/25G7aNDDv22xHyjEtQx3Fn5BDw8By2lx6Ij1ZQ53KZSio=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6f8e:b0:4b2:8ee8:8a38 with SMTP id
 5614622812f47-4b2eef37debmr13581207b6e.0.1787372671710; Fri, 21 Aug 2026
 21:24:31 -0700 (PDT)
Date: Fri, 21 Aug 2026 21:24:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a89247f.dbb3a75c.13dd47.0029.GAE@google.com>
Subject: [syzbot] [media?] KASAN: invalid-free in usb_free_urb
From: syzbot <syzbot+2d022f6d27a4d0f2c21a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4477a78374a5 Add linux-next specific files for 20260814
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=154a6679580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5042554017b3879d
dashboard link: https://syzkaller.appspot.com/bug?extid=2d022f6d27a4d0f2c21a
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d1a5728edb0d/disk-4477a783.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3aebe8202fcd/vmlinux-4477a783.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7e9f7367a2bd/bzImage-4477a783.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2d022f6d27a4d0f2c21a@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: invalid-free in urb_destroy drivers/usb/core/urb.c:25 [inline]
BUG: KASAN: invalid-free in kref_put include/linux/kref.h:65 [inline]
BUG: KASAN: invalid-free in usb_free_urb+0xd0/0x120 drivers/usb/core/urb.c:96
Free of addr ffff888058ab1000 by task kworker/1:1/48

CPU: 1 UID: 0 PID: 48 Comm: kworker/1:1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report_invalid_free+0xea/0x110 mm/kasan/report.c:557
 check_slab_allocation mm/kasan/common.c:-1 [inline]
 __kasan_slab_pre_free+0x104/0x120 mm/kasan/common.c:261
 kasan_slab_pre_free include/linux/kasan.h:199 [inline]
 slab_free_hook mm/slub.c:2693 [inline]
 slab_free mm/slub.c:6499 [inline]
 kfree+0x173/0x650 mm/slub.c:6792
 urb_destroy drivers/usb/core/urb.c:25 [inline]
 kref_put include/linux/kref.h:65 [inline]
 usb_free_urb+0xd0/0x120 drivers/usb/core/urb.c:96
 smsusb_term_device+0x1d0/0x3d0 drivers/media/usb/siano/smsusb.c:352
 smsusb_init_device drivers/media/usb/siano/smsusb.c:497 [inline]
 smsusb_probe+0x1aba/0x2280 drivers/media/usb/siano/smsusb.c:575
 usb_probe_interface+0x788/0xe50 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3776
 usb_set_configuration+0x1ad8/0x2180 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c3/0x3b0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3776
 usb_new_device+0x9aa/0x1690 drivers/usb/core/hub.c:2708
 hub_port_connect drivers/usb/core/hub.c:5580 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5720 [inline]
 port_event drivers/usb/core/hub.c:5884 [inline]
 hub_event+0x28e8/0x4d30 drivers/usb/core/hub.c:5966
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 3388:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5414 [inline]
 __kmalloc_node_track_caller_noprof+0x4b4/0x720 mm/slub.c:5545
 kmalloc_reserve net/core/skbuff.c:637 [inline]
 __alloc_skb+0x2c1/0x7a0 net/core/skbuff.c:715
 alloc_skb include/linux/skbuff.h:1384 [inline]
 nsim_dev_trap_skb_build drivers/net/netdevsim/dev.c:744 [inline]
 nsim_dev_trap_report drivers/net/netdevsim/dev.c:801 [inline]
 nsim_dev_trap_report_work+0x25f/0xb40 drivers/net/netdevsim/dev.c:847
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 3388:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6499 [inline]
 kfree+0x1c5/0x650 mm/slub.c:6792
 skb_kfree_head net/core/skbuff.c:1083 [inline]
 skb_free_head net/core/skbuff.c:1095 [inline]
 skb_release_data+0x85e/0xab0 net/core/skbuff.c:1122
 skb_release_all net/core/skbuff.c:1197 [inline]
 __kfree_skb+0x5d/0x210 net/core/skbuff.c:1211
 nsim_dev_trap_report drivers/net/netdevsim/dev.c:817 [inline]
 nsim_dev_trap_report_work+0x7ac/0xb40 drivers/net/netdevsim/dev.c:847
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888058ab0000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 0 bytes to the right of
 4096-byte region [ffff888058ab0000, ffff888058ab1000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x58ab0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88813ff12140 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88813ff12140 dead000000000100 dead000000000122
head: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 3388, tgid 3388 (kworker/u8:12), ts 77776651868
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x2209/0x2280 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x217/0x5a0 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab+0x7d/0x620 mm/slub.c:3462
 new_slab mm/slub.c:3513 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7410
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_node_track_caller_noprof+0x548/0x720 mm/slub.c:5545
 kmalloc_reserve net/core/skbuff.c:637 [inline]
 __alloc_skb+0x2c1/0x7a0 net/core/skbuff.c:715
 alloc_skb include/linux/skbuff.h:1384 [inline]
 nsim_dev_trap_skb_build drivers/net/netdevsim/dev.c:744 [inline]
 nsim_dev_trap_report drivers/net/netdevsim/dev.c:801 [inline]
 nsim_dev_trap_report_work+0x25f/0xb40 drivers/net/netdevsim/dev.c:847
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page last free pid 48 tgid 48 ts 77606871666 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_pages_ok+0xb6c/0xc60 mm/page_alloc.c:1596
 smscore_unregister_device+0x48a/0x780 drivers/media/common/siano/smscoreapi.c:1228
 smsusb_term_device+0x1a0/0x3d0 drivers/media/usb/siano/smsusb.c:349
 smsusb_init_device drivers/media/usb/siano/smsusb.c:497 [inline]
 smsusb_probe+0x1aba/0x2280 drivers/media/usb/siano/smsusb.c:575
 usb_probe_interface+0x788/0xe50 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3776
 usb_set_configuration+0x1ad8/0x2180 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250

Memory state around the buggy address:
 ffff888058ab0f00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888058ab0f80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888058ab1000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                   ^
 ffff888058ab1080: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888058ab1100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
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
