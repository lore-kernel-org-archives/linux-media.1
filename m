Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDD73EFD10
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 02:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785810577; cv=none; b=cl8bf7i4iuNeuOL7jKISRYC708/Zn/3Oy8dcvhU5N31uQ9Ni32DPCMCUHI5pug3djRERXyxyA68+z4PJ2YsZ9DvSsBfCSi63ndggrZc4Q+CuxS+6VRxRbCOCGjkI4RGx2Pv6OviKsdefK1UHBK5XcbQQA/XFcLlWukmLrm1Q4zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785810577; c=relaxed/simple;
	bh=FoQwepquyC2HYsi5G1vj3R4akSEQHMi446g4JaA3LXY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=gIPyWXLzvkhXxJ2l8u5zfz7AkS/SddrjoFtXHnKBzfp+xQY3lxo4pBCxTOm+kWyBRroY9saJ5ad9UAQ1tTwxFg/UKD3ijGeAk77S/vaO2Dx4Ubhj0A+FIwYHQHxpYgokbuZmxC0QixF9jYvQDZ+NpyPYjPpxItOWMu0yW6s+1Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-6ab1946bb8eso3998106eaf.2
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 19:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785810574; x=1786415374;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9EFctdUfBbUtKYpH5Uwk5i6tyO1ZDM+f8w01qXSAX5g=;
        b=dYvJSZR+BV8jX/mMkPhYw7w28tUddbPL3Fc52ORdwFTweCAGAB4jACHQtdEwoljj2T
         +nTFrWqLSrzB23SCCb2KtiKgkRVKo3SZNTSM9AuQqsZeV4hf5kI5cvhPydBfMQ9a16Tu
         WNpYJbDV3KvPWo96NDT6NstK22ySSRJURsug86+Ca665vnF9Magj5go8k4CUPv1CTa31
         7oHnlD9tbBNgM5V3IOxEQQI8xDnz6wYyPilYyuwspdV0+e404Iml7sPFCg8m4VIpjRjH
         3VYhdMXZgc2gRLPjn3yLDtjITYlsD66XxgwpRN2i6diioPt+XZIkyeK+Mk8ldIIH+ctG
         sY6w==
X-Forwarded-Encrypted: i=1; AHgh+RphmPEQJSOqqkVligPnWYFdDoOAD1zc4SUp4ryzaZypchBgs4mQFF+KgkJPfj/rGsg4lCSBYQuay4xGcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE3JdE6mxQZBGvjGkzIvVz3lt1YvRZ+GLkJDlCeWi+bB2oOt58
	JrfenEelztzWDYgiQSAV3rYifGLzDW9XeY4d6zmIDWieELi3NW4NuZG7atz2KrPprbfbAK/3re3
	o2QznmtWo1WyQSxCpp1bFsENpPXdognKEZ1Lib9hagdNbwSBCOhx23wD9RP4=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:992:b0:6aa:f810:f582 with SMTP id
 006d021491bc7-6ae4328fa96mr18682222eaf.10.1785810574310; Mon, 03 Aug 2026
 19:29:34 -0700 (PDT)
Date: Mon, 03 Aug 2026 19:29:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a714e8e.9511d2ce.1fc5b9.0332.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in cec_transmit_done_ts
From: syzbot <syzbot+efc25a706efe03e26b2a@syzkaller.appspotmail.com>
To: hverkuil@kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    11028ab62899 Merge tag 'probes-fixes-v7.2-rc5' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15743632580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c05be6c9b0d36cb9
dashboard link: https://syzkaller.appspot.com/bug?extid=efc25a706efe03e26b2a
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-11028ab6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/511647651d7f/vmlinux-11028ab6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1c76180d0109/bzImage-11028ab6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+efc25a706efe03e26b2a@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in cec_transmit_done_ts+0xf08/0x1470 drivers/media/cec/core/cec-adap.c:604
Read of size 1 at addr ffff88803354e749 by task vivid_cec-vivid/2119

CPU: 0 UID: 0 PID: 2119 Comm: vivid_cec-vivid Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 cec_transmit_done_ts+0xf08/0x1470 drivers/media/cec/core/cec-adap.c:604
 cec_transmit_attempt_done_ts+0x11b/0x140 drivers/media/cec/core/cec-adap.c:-1
 cec_transmit_attempt_done include/media/cec.h:405 [inline]
 vivid_cec_bus_thread+0x116d/0x19e0 drivers/media/test-drivers/vivid/vivid-cec.c:207
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 1:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x32d/0x660 mm/slub.c:5489
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 cec_allocate_adapter+0xa9/0x690 drivers/media/cec/core/cec-core.c:240
 vivid_cec_alloc_adap+0x104/0x170 drivers/media/test-drivers/vivid/vivid-cec.c:413
 vivid_create_instance drivers/media/test-drivers/vivid/vivid-core.c:1988 [inline]
 vivid_probe+0x4a28/0x70c0 drivers/media/test-drivers/vivid/vivid-core.c:2095
 platform_probe+0xf9/0x190 drivers/base/platform.c:1439
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __driver_attach+0x339/0x600 drivers/base/dd.c:1292
 bus_for_each_dev+0x23b/0x2c0 drivers/base/bus.c:383
 bus_add_driver+0x345/0x670 drivers/base/bus.c:763
 driver_register+0x23a/0x320 drivers/base/driver.c:174
 vivid_init+0x590/0x620 drivers/media/test-drivers/vivid/vivid-core.c:2296
 do_one_initcall+0x250/0x870 init/main.c:1347
 do_initcall_level+0x10a/0x1a0 init/main.c:1409
 do_initcalls+0x59/0xa0 init/main.c:1425
 kernel_init_freeable+0x29d/0x3e0 init/main.c:1658
 kernel_init+0x1d/0x1d0 init/main.c:1548
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 5327:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x1c5/0x640 mm/slub.c:6692
 device_release+0xc4/0x1f0 drivers/base/core.c:-1
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x222/0x550 lib/kobject.c:737
 vivid_remove+0x297/0xbc0 drivers/media/test-drivers/vivid/vivid-core.c:2219
 device_remove drivers/base/dd.c:616 [inline]
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x48b/0x880 drivers/base/dd.c:1372
 unbind_store+0x1a1/0x1d0 drivers/base/bus.c:244
 kernfs_fop_write_iter+0x3a4/0x540 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:687
 ksys_write+0x150/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88803354e000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 1865 bytes inside of
 freed 4096-byte region [ffff88803354e000, ffff88803354f000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x33548
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x4fff00000000040(head|node=1|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 04fff00000000040 ffff88801b042140 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800040004 00000000f5000000 0000000000000000
head: 04fff00000000040 ffff88801b042140 dead000000000100 dead000000000122
head: 0000000000000000 0000000800040004 00000000f5000000 0000000000000000
head: 04fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 14598671999, free_ts 13085309881
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0x21fa/0x2270 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3266 [inline]
 allocate_slab+0x79/0x5e0 mm/slub.c:3380
 new_slab mm/slub.c:3426 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7310
 refill_sheaf mm/slub.c:2804 [inline]
 __pcs_replace_empty_main+0x2bf/0x6b0 mm/slub.c:4675
 alloc_from_pcs mm/slub.c:4773 [inline]
 slab_alloc_node mm/slub.c:4905 [inline]
 __kmalloc_cache_noprof+0x3a7/0x660 mm/slub.c:5485
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 kobject_uevent_env+0x289/0x9e0 lib/kobject_uevent.c:543
 device_add+0x544/0xb80 drivers/base/core.c:3738
 netdev_register_kobject+0x178/0x310 net/core/net-sysfs.c:2337
 register_netdevice+0x1433/0x1eb0 net/core/dev.c:11446
 init_mac80211_hwsim+0x355/0x3d0 drivers/net/wireless/virtual/mac80211_hwsim_main.c:7590
 do_one_initcall+0x250/0x870 init/main.c:1347
 do_initcall_level+0x10a/0x1a0 init/main.c:1409
 do_initcalls+0x59/0xa0 init/main.c:1425
 kernel_init_freeable+0x29d/0x3e0 init/main.c:1658
page last free pid 1063 tgid 1063 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0xc1e/0xd10 mm/page_alloc.c:2950
 __slab_free+0x274/0x2c0 mm/slub.c:5741
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4584 [inline]
 slab_alloc_node mm/slub.c:4917 [inline]
 kmem_cache_alloc_node_noprof+0x355/0x610 mm/slub.c:4989
 alloc_task_struct_node kernel/fork.c:188 [inline]
 dup_task_struct+0x52/0x8e0 kernel/fork.c:921
 copy_process+0x820/0x4390 kernel/fork.c:2115
 kernel_clone+0x2d7/0x940 kernel/fork.c:2748
 user_mode_thread+0x110/0x180 kernel/fork.c:2824
 call_usermodehelper_exec_work+0x5c/0x230 kernel/umh.c:171
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff88803354e600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803354e680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88803354e700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                              ^
 ffff88803354e780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803354e800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
