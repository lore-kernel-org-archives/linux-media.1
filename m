Received: from mail-oi2-f7.google.com (mail-oi2-f7.google.com [74.125.231.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E2B175A6D
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 01:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787708621; cv=none; b=N05vKuE0FU6jXg33OzGNGmvbMvJvQfu4qDLrQx0Z0TbqcST/pvUVLNJCeN+ATVZzjjPJ5gFSxE8TzzIo2RAnOBM76WF1BkxtXlsxChjlGrEf0cyuCOVusCzwy4NcScfVPXWeKhxso2xTeLHoR9Vgkc9jduVULHdEuehTBe6LeLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787708621; c=relaxed/simple;
	bh=TvMPKdiFYay+J1P6iOkTD3qS4j3qY5WT0f4bjh1rClw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qRQM6FLKewPJm3DpsjHPZhsbgFGTSp99+zHXaXAwnTUD8T6oIxq0WXIxGGvb3Gm0hNoFyb6daP2kYy+Wheee5333Z8RzD8X/LFYvlKLmmbrEojb0sMuL62VMniCyKkGI+GJhrkB8PcxDim8VEM2Hg41BDixVZIaGndloQS3Tq1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f7.google.com with SMTP id 46e09a7af769-7eb6411c01aso69835a34.0
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 18:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787708618; x=1788313418;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVgtaCFjoiOXBuNVAtu6D5MD87ulaxnVN0KfA8UKRuY=;
        b=Sj8LjzGubM3cftkQhe8Mhm/A/+z0eOrxP67FKhzlm6VMEcgW8Q6cnP+xIC9c25EdJT
         Zb/JqeWRdiR6YWCcLhT/Fi5csZ3GLFiNkOA2Ho7ke6ZyKyx4SHdyD2o8YEFwZkCml6r8
         NdLAbzBrxn2axNAEHTwscH2jKuuE06VwEqfl1iRBY4gIYVfEgCYS/Yo6K0PXTbiGzIVv
         Y/qiSorBp5cQEuLDgjKjWyLpWvOS8ka2oONxWCOwTRD11o4C3KEVrgL2tStUJ7sjk26G
         2eeeegLmQu61Dl9IC5kywzERH6h7vJxFe+9duXSHFifQd6Aro0cUO1RDopM3oP7bwIwd
         dd/g==
X-Forwarded-Encrypted: i=1; AHgh+Rr3nfNMI6aEA+tbLLsULV223i4LKLqfD+PsF7iO/fFw9XH2lYNEIcWATnkgL2mVr3RP+E0r5/3b/8nBkg==@vger.kernel.org
X-Gm-Message-State: AFuF++mA9lc6hXuZHBDNAsjbwK7bRyWP8UeNC6fFGdjSh7ViQD9BLRyO
	RmCyH8uwmw/EN55xw5VmcjVQjIIi++pnurwmRGSlkAlgeT2nqvCPq0dTeTFyyBF2Ba9gBY0/Cgq
	oPT5FjwP464wfhh+aLowSckBNJsNdPaPmXoCJzpVO48RE7iegJuRIK0MW88o=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f06d:b0:6b1:3804:306 with SMTP id
 006d021491bc7-6b1a05610cemr2331389eaf.32.1787708618435; Tue, 25 Aug 2026
 18:43:38 -0700 (PDT)
Date: Tue, 25 Aug 2026 18:43:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8e44ca.dbb3a75c.7844.002f.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in __video_do_ioctl (2)
From: syzbot <syzbot+4a6e6173b1fc7916e950@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8dbbc7e18894 Merge tag 'mm-hotfixes-stable-2026-08-19-21-3..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=104be549580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=4a6e6173b1fc7916e950
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e529c27e3716/disk-8dbbc7e1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a3c0f68475a7/vmlinux-8dbbc7e1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7ed35be877e2/bzImage-8dbbc7e1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4a6e6173b1fc7916e950@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read include/linux/instrumented.h:82 [inline]
BUG: KASAN: slab-use-after-free in _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
BUG: KASAN: slab-use-after-free in video_is_registered include/media/v4l2-dev.h:546 [inline]
BUG: KASAN: slab-use-after-free in __video_do_ioctl+0x543/0xdf0 drivers/media/v4l2-core/v4l2-ioctl.c:3109
Read of size 8 at addr ffff88807dcd66d0 by task v4l_id/15887

CPU: 1 UID: 0 PID: 15887 Comm: v4l_id Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:186 [inline]
 kasan_check_range+0x10f/0x1e0 mm/kasan/generic.c:200
 instrument_atomic_read include/linux/instrumented.h:82 [inline]
 _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
 video_is_registered include/media/v4l2-dev.h:546 [inline]
 __video_do_ioctl+0x543/0xdf0 drivers/media/v4l2-core/v4l2-ioctl.c:3109
 video_usercopy+0x47a/0x1730 drivers/media/v4l2-core/v4l2-ioctl.c:3477
 v4l2_ioctl+0x1bd/0x250 drivers/media/v4l2-core/v4l2-dev.c:366
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd49ef1d378
Code: 00 00 48 8d 44 24 08 48 89 54 24 e0 48 89 44 24 c0 48 8d 44 24 d0 48 89 44 24 c8 b8 10 00 00 00 c7 44 24 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 07 89 d0 c3 0f 1f 40 00 48 8b 15 49 3a 0d
RSP: 002b:00007ffd4428e478 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fd49ef1d378
RDX: 00007ffd4428e480 RSI: 0000000080685600 RDI: 0000000000000003
RBP: 0000000000000002 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffd4428e630 R14: 00007fd49f795000 R15: 00005631adc3f4d8
 </TASK>

Allocated by task 5833:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2e7/0x6b0 mm/slub.c:5484
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 sur40_probe+0x1a8/0x1580 drivers/input/touchscreen/sur40.c:675
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
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
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
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
 usb_new_device.part.0+0xcc2/0x1686 drivers/usb/core/hub.c:2703
 usb_new_device include/linux/workqueue.h:714 [inline]
 hub_port_connect drivers/usb/core/hub.c:5575 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5715 [inline]
 port_event drivers/usb/core/hub.c:5879 [inline]
 hub_event.cold+0x1e3/0xe90 drivers/usb/core/hub.c:5961
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3387
 process_scheduled_works kernel/workqueue.c:3470 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3551
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 5833:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2678 [inline]
 slab_free mm/slub.c:6372 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6687
 sur40_disconnect+0xb8/0x170 drivers/input/touchscreen/sur40.c:835
 usb_unbind_interface+0x1dd/0x9e0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:618 [inline]
 device_remove+0x12a/0x180 drivers/base/dd.c:610
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:664
 device_del+0x376/0x9b0 drivers/base/core.c:3965
 usb_disable_device+0x367/0x810 drivers/usb/core/message.c:1478
 usb_disconnect+0x2e2/0x9a0 drivers/usb/core/hub.c:2345
 hub_port_connect drivers/usb/core/hub.c:5415 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5715 [inline]
 port_event drivers/usb/core/hub.c:5879 [inline]
 hub_event+0x1bb1/0x4420 drivers/usb/core/hub.c:5961
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3387
 process_scheduled_works kernel/workqueue.c:3470 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3551
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88807dcd6000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 1744 bytes inside of
 freed 4096-byte region [ffff88807dcd6000, ffff88807dcd7000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7dcd0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801c027140 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800040004 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801c027140 dead000000000100 dead000000000122
head: 0000000000000000 0000000800040004 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 4942, tgid 4942 (init), ts 23438014265
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
 __do_kmalloc_node mm/slub.c:5336 [inline]
 __kmalloc_noprof+0x66b/0x820 mm/slub.c:5362
 _kmalloc_noprof include/linux/slab.h:992 [inline]
 tomoyo_realpath_from_path+0xb6/0x690 security/tomoyo/realpath.c:251
 tomoyo_realpath_nofollow+0xe0/0x100 security/tomoyo/realpath.c:304
 tomoyo_find_next_domain+0x2a8/0x2010 security/tomoyo/domain.c:731
 tomoyo_bprm_check_security security/tomoyo/tomoyo.c:102 [inline]
 tomoyo_bprm_check_security+0x12d/0x1d0 security/tomoyo/tomoyo.c:92
 security_bprm_check+0x87/0x1e0 security/security.c:820
 search_binary_handler fs/exec.c:1746 [inline]
 exec_binprm fs/exec.c:1788 [inline]
 bprm_execve fs/exec.c:1844 [inline]
 bprm_execve+0x80b/0x1940 fs/exec.c:1820
 do_execveat_common.isra.0+0x4a5/0x580 fs/exec.c:1942
 __do_sys_execve fs/exec.c:2015 [inline]
 __se_sys_execve fs/exec.c:2009 [inline]
 __x64_sys_execve+0x93/0xd0 fs/exec.c:2009
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
page last free pid 1 tgid 1 ts 21508150262 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 free_pages_prepare+0x586/0xe00 mm/page_alloc.c:1463
 __free_contig_range_common+0x14f/0x250 mm/page_alloc.c:7060
 debug_vm_pgtable_free_huge_page mm/debug_vm_pgtable.c:980 [inline]
 destroy_args+0xa8/0x7a0 mm/debug_vm_pgtable.c:993
 debug_vm_pgtable+0x1d69/0x3490 mm/debug_vm_pgtable.c:1368
 do_one_initcall+0x11c/0x6f0 init/main.c:1353
 do_initcall_level init/main.c:1415 [inline]
 do_initcalls init/main.c:1431 [inline]
 do_basic_setup init/main.c:1451 [inline]
 kernel_init_freeable+0x6ea/0x7b0 init/main.c:1666
 kernel_init+0x21/0x1e0 init/main.c:1556
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff88807dcd6580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807dcd6600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88807dcd6680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                 ^
 ffff88807dcd6700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807dcd6780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
