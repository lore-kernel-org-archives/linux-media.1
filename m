Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D2D1D9A5F
	for <linux-media@vger.kernel.org>; Sun,  2 Aug 2026 00:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785632005; cv=none; b=qhJU5TTXzcWZY7RSPexvj3NirD/p0Fy087q1veuKksvDifRsJvgICob9xxuc/sHz2ZtNl3YnTXiD8Jh1U3Ys4hAzuj2meAXh7Ch5BzWTi6U9nGLO4nIh2cDUe1zUTLiJ+3NJUlCMQZzGCDWXIXpbg5lvbxhFVt1ywnCO4HBGmzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785632005; c=relaxed/simple;
	bh=9pds59ONWpFSQh3ATJ7E9SbpRpkzkhieq0V1myNMakI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QlXeEqmZZatz7Aj/sGNbtYlJNL8HcQNjCC4g7CmO05klgVRe7xHohQSrxk7jmBwXSRf1glQEpuFb906W8ELuTIaJGSBIO9628w0N1QpR5wf0gYlklYpdnqZliKmvexYxB0q6LtzSjJrWXIcyCKMgbZhy0EKiRWP+OBrRYr4mXC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-4a41f46d629so3288819b6e.3
        for <linux-media@vger.kernel.org>; Sat, 01 Aug 2026 17:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785632003; x=1786236803;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JwtvidpVUFBvuJvVNtKIynYdIILypxvFi2OM8WU+Lqk=;
        b=k8uUwxTDrV9MH7LsBMLJfvwZ0jM+xwMUbrpiR+8N5Pch26GF8inRfDEWJ7R/PEiUmR
         48ByqEpUQjEbZUVETimfVlHbZbRVyTtCeofaF66oTg7kaRR/rOsN/LqHA3M/9ZtoDy9e
         h9eq6IsIdj6zmISCOebNOqsMoCf1LqSMOaeJEVVfQAFII3PDQvIQPXqVZg+QCvFitYTf
         DkYFpXMKvw02Qj6OxCxebF186WUp80vVPF1xjAM/N32dwe229W4y5gvQHFQJdZbRpymS
         YXvxMBDSPcaCAHQQ0ECl4Sji3zHQqGl5Tl4oV44wwWYJn7KoGF/DfQDiyVvvacmx+Qpi
         QhDA==
X-Forwarded-Encrypted: i=1; AHgh+RqVbc4SqLrAgh+VfKaZTHAEbj0rdST7KnuSuEDfx8uxYPA3Y++5Ih+TIbpgQfoU5x+FYM80vuQZkInfOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+vs6gr1PDkFGMB8GALGILT7l1MbkdZybhhinzL3vylvi7i2LA
	2pr795kAReqHTq6ukpL056Xjn6a8WnK59yiWgsygPBXyLjfzV6TvJyvHkSq2rCmMCqFMg3wOEQj
	OJ2Ec44gtzmMpGbucwB83oadqw1psNURuc1oz6Zh4O/n9Lb614mioqaeIhJI=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a0c:b0:4a3:ec8e:2052 with SMTP id
 5614622812f47-4af5e18ac5amr8574111b6e.8.1785632002843; Sat, 01 Aug 2026
 17:53:22 -0700 (PDT)
Date: Sat, 01 Aug 2026 17:53:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6e9502.f794c993.27aeb.0018.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Write in usb_free_urb
From: syzbot <syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    62cc90241548 Merge tag 'mm-hotfixes-stable-2026-07-27-14-1..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11e4249e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c05be6c9b0d36cb9
dashboard link: https://syzkaller.appspot.com/bug?extid=832ce9fa3face1b7d44d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-62cc9024.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4f85523029b9/vmlinux-62cc9024.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d37f4266b11c/bzImage-62cc9024.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com

FAULT_INJECTION: forcing a failure.
name failslab, interval 1, probability 0, space 0, times 1
CPU: 0 UID: 0 PID: 5337 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 fail_dump lib/fault-inject.c:73 [inline]
 should_fail_ex+0x40c/0x560 lib/fault-inject.c:174
 should_failslab+0xa8/0x100 mm/failslab.c:46
 slab_pre_alloc_hook mm/slub.c:4539 [inline]
 slab_alloc_node mm/slub.c:4897 [inline]
 __do_kmalloc_node mm/slub.c:5333 [inline]
 __kmalloc_noprof+0xfe/0x720 mm/slub.c:5359
 _kmalloc_noprof include/linux/slab.h:992 [inline]
 usb_alloc_urb+0x46/0x150 drivers/usb/core/urb.c:75
 hackrf_alloc_urbs drivers/media/usb/hackrf/hackrf.c:683 [inline]
 hackrf_start_streaming+0x722/0x1350 drivers/media/usb/hackrf/hackrf.c:827
 vb2_start_streaming+0x11e/0x450 drivers/media/common/videobuf2/videobuf2-core.c:1783
 vb2_core_streamon+0x2c0/0x4d0 drivers/media/common/videobuf2/videobuf2-core.c:2336
 __video_do_ioctl+0x8af/0xc70 drivers/media/v4l2-core/v4l2-ioctl.c:3133
 video_usercopy+0x860/0x1430 drivers/media/v4l2-core/v4l2-ioctl.c:3475
 v4l2_ioctl+0x18d/0x1e0 drivers/media/v4l2-core/v4l2-dev.c:366
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1b1359de99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f1b1450bfe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f1b13826180 RCX: 00007f1b1359de99
RDX: 0000200000000600 RSI: 0000000040045612 RDI: 0000000000000005
RBP: 00007f1b1450c050 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007f1b13826218 R14: 00007f1b13826180 R15: 00007fffe6212058
 </TASK>
==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
BUG: KASAN: slab-use-after-free in atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
BUG: KASAN: slab-use-after-free in __refcount_sub_and_test include/linux/refcount.h:389 [inline]
BUG: KASAN: slab-use-after-free in __refcount_dec_and_test include/linux/refcount.h:432 [inline]
BUG: KASAN: slab-use-after-free in refcount_dec_and_test include/linux/refcount.h:450 [inline]
BUG: KASAN: slab-use-after-free in kref_put include/linux/kref.h:64 [inline]
BUG: KASAN: slab-use-after-free in usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
Write of size 4 at addr ffff88801d3b6800 by task syz.0.0/5337

CPU: 0 UID: 0 PID: 5337 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
 instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
 atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
 __refcount_sub_and_test include/linux/refcount.h:389 [inline]
 __refcount_dec_and_test include/linux/refcount.h:432 [inline]
 refcount_dec_and_test include/linux/refcount.h:450 [inline]
 kref_put include/linux/kref.h:64 [inline]
 usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
 hackrf_free_urbs+0x22b/0x3b0 drivers/media/usb/hackrf/hackrf.c:658
 hackrf_start_streaming+0xe12/0x1350 drivers/media/usb/hackrf/hackrf.c:849
 vb2_start_streaming+0x11e/0x450 drivers/media/common/videobuf2/videobuf2-core.c:1783
 vb2_core_streamon+0x2c0/0x4d0 drivers/media/common/videobuf2/videobuf2-core.c:2336
 __video_do_ioctl+0x8af/0xc70 drivers/media/v4l2-core/v4l2-ioctl.c:3133
 video_usercopy+0x860/0x1430 drivers/media/v4l2-core/v4l2-ioctl.c:3475
 v4l2_ioctl+0x18d/0x1e0 drivers/media/v4l2-core/v4l2-dev.c:366
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1b1359de99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f1b1450bfe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f1b13826180 RCX: 00007f1b1359de99
RDX: 0000200000000600 RSI: 0000000040045612 RDI: 0000000000000005
RBP: 00007f1b1450c050 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007f1b13826218 R14: 00007f1b13826180 R15: 00007fffe6212058
 </TASK>

Allocated by task 5337:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kmalloc_noprof+0x375/0x720 mm/slub.c:5359
 _kmalloc_noprof include/linux/slab.h:992 [inline]
 usb_alloc_urb+0x46/0x150 drivers/usb/core/urb.c:75
 hackrf_alloc_urbs drivers/media/usb/hackrf/hackrf.c:683 [inline]
 hackrf_start_streaming+0x722/0x1350 drivers/media/usb/hackrf/hackrf.c:827
 vb2_start_streaming+0x11e/0x450 drivers/media/common/videobuf2/videobuf2-core.c:1783
 vb2_core_streamon+0x2c0/0x4d0 drivers/media/common/videobuf2/videobuf2-core.c:2336
 __video_do_ioctl+0x8af/0xc70 drivers/media/v4l2-core/v4l2-ioctl.c:3133
 video_usercopy+0x860/0x1430 drivers/media/v4l2-core/v4l2-ioctl.c:3475
 v4l2_ioctl+0x18d/0x1e0 drivers/media/v4l2-core/v4l2-dev.c:366
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 5337:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x1c5/0x640 mm/slub.c:6692
 hackrf_alloc_urbs drivers/media/usb/hackrf/hackrf.c:686 [inline]
 hackrf_start_streaming+0xa55/0x1350 drivers/media/usb/hackrf/hackrf.c:827
 vb2_start_streaming+0x11e/0x450 drivers/media/common/videobuf2/videobuf2-core.c:1783
 vb2_core_streamon+0x2c0/0x4d0 drivers/media/common/videobuf2/videobuf2-core.c:2336
 __video_do_ioctl+0x8af/0xc70 drivers/media/v4l2-core/v4l2-ioctl.c:3133
 video_usercopy+0x860/0x1430 drivers/media/v4l2-core/v4l2-ioctl.c:3475
 v4l2_ioctl+0x18d/0x1e0 drivers/media/v4l2-core/v4l2-dev.c:366
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88801d3b6800
 which belongs to the cache kmalloc-192 of size 192
The buggy address is located 0 bytes inside of
 freed 192-byte region [ffff88801d3b6800, ffff88801d3b68c0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1d3b6
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801b0413c0 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x252800(GFP_NOWAIT|__GFP_NORETRY|__GFP_COMP|__GFP_THISNODE), pid 1, tgid 1 (swapper/0), ts 12217348821, free_ts 11554810146
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0x21fa/0x2270 mm/page_alloc.c:3946
 __alloc_pages_slowpath+0x383/0xcc0 mm/page_alloc.c:4821
 __alloc_frozen_pages_noprof+0x31f/0x380 mm/page_alloc.c:5317
 alloc_slab_page mm/slub.c:3266 [inline]
 allocate_slab+0x79/0x5e0 mm/slub.c:3380
 new_slab mm/slub.c:3426 [inline]
 ___slab_alloc+0x16a/0x950 mm/slub.c:4463
 slab_alloc_node mm/slub.c:4908 [inline]
 __do_kmalloc_node mm/slub.c:5333 [inline]
 __kvmalloc_node_noprof+0x341/0x860 mm/slub.c:6905
 sbitmap_init_node+0x2bc/0x630 lib/sbitmap.c:132
 blk_mq_alloc_hctx block/blk-mq.c:4055 [inline]
 blk_mq_alloc_and_init_hctx+0x4f3/0xc50 block/blk-mq.c:4524
 __blk_mq_realloc_hw_ctxs+0x2b2/0x660 block/blk-mq.c:4575
 blk_mq_realloc_hw_ctxs block/blk-mq.c:4612 [inline]
 blk_mq_init_allocated_queue+0x357/0x13c0 block/blk-mq.c:4642
 blk_mq_alloc_queue block/blk-mq.c:4424 [inline]
 __blk_mq_alloc_disk+0x1d2/0x390 block/blk-mq.c:4467
 nbd_dev_add+0x494/0xb60 drivers/block/nbd.c:1991
 nbd_init+0x15f/0x1e0 drivers/block/nbd.c:2729
 do_one_initcall+0x250/0x870 init/main.c:1347
 do_initcall_level+0x10a/0x1a0 init/main.c:1409
page last free pid 41 tgid 41 stack trace:
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
 ffff88801d3b6700: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff88801d3b6780: 00 00 00 fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88801d3b6800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff88801d3b6880: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff88801d3b6900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
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
