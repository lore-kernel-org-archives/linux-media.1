Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837883F4830
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 22:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785970001; cv=none; b=Vks9uEUiyr/7gCoAGxmPKggR4ICuHPjYHFkbdIvIobQu1mp5T+T/POLw21u9fBUeg18hquNFtSIrm9X4Z1+4xJpBexSNXZ7oOoOBopSqiAcW6QR1l1slTbOXOQ54bia181KbiFDAo0dYnhnlyJuNLY2LWlNPozfHYM15DFbRtpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785970001; c=relaxed/simple;
	bh=K+zIjmdJrCEEj1IQTz+QeKG9zPvBP936dvU3Rb2KJ3M=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=lCnFk1dV31xWAXdQgjmJif4dUuOq6XSvE8dpgmvCUUJypSdhPNkGPmN1S/KPftGpxzIJz95B03tv5gOiFGIoi2gBtpm6lJYgTo6LqMm94efHrbAMWqGpEkrf04gK9D7yxmA6LRnIH44Sg0hYxMCs2acM88sTkXNcjfgI4gkRC4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-6aee72d5fcdso398074eaf.1
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 15:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785969998; x=1786574798;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hW1kR4PCs+j9u0P6TWu5mUOKyvDpcA/hLwG0b/hfKTk=;
        b=PbwAq53mQutIuAqsvT4Mg2yyQ14yL5QCPEou1nlUq+fqFIcl1PN2OhmX8oaWG+I/rI
         8E+qY4MoLdbmzcvIz2bw343tFs+uFWv8NGbmgCsUlsS6ewrrN/qDZ7mjZC4xDIIpvz/P
         HYWkGcSiayqyrftoTRWYuihAwTPhIWZv1ETFuoYrnjfFJdqB7Bd1ouIc2t6pqfpQsY/O
         rUiuK8u6eJKm3KnvtJPOHgIVvEPa3YN9zFBHVWWDwvvjpctc5TAeeKHQ0/TqzLy4h63y
         jwB6xbJKz9Qlx+yI11Wn08WiaN6tNAwsjpoMwcZQmrJThzGeLC3RDDhxzoB1sOChCRG5
         InSw==
X-Forwarded-Encrypted: i=1; AHgh+RpXmo1iLD6z9AFEK1JePr/EM3syG8usqkWmr5ZyKgxqG7PMhiJD/QSaaACYxhnTtmLILxshTWlFbT5V0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfKOiNrbk77sLrDwB6wS0T+CSFYSF7t3kr6FCt9NfMz7XYz0e+
	7c1J4kMR9Gj+nAxEspCFcu9qQru7ZF5prZXV0xWXVxpldQYg2uWMAwf0RNMcJ3egxzZwz6COebg
	hOlqQYRSz4rX1PsxxKwEB3vPDhJ3N0rSIYGpvA60OSsWiHRaSx8/i/f0eUH0=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b04:b0:6ae:941b:521c with SMTP id
 006d021491bc7-6ae96e82cabmr5889529eaf.18.1785969998392; Wed, 05 Aug 2026
 15:46:38 -0700 (PDT)
Date: Wed, 05 Aug 2026 15:46:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a73bd4e.01d0871a.3a0d52.0007.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-out-of-bounds Read in dw210x_op_rw
From: syzbot <syzbot+f408eac9faa61d5a1927@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1655fc9e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e38b15c29e6a1d9
dashboard link: https://syzkaller.appspot.com/bug?extid=f408eac9faa61d5a1927
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17167e32580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1427acc6580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9bf3ffd710de/disk-848acc8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/770c0a63a80c/vmlinux-848acc8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c54f9393cb03/bzImage-848acc8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f408eac9faa61d5a1927@syzkaller.appspotmail.com

dvb-usb: downloading firmware from file 'dvb-usb-dw3101.fw'
dw2102: start downloading DW210X firmware
==================================================================
BUG: KASAN: slab-out-of-bounds in dw210x_op_rw+0xb6/0x180 drivers/media/usb/dvb-usb/dw2102.c:102
Read of size 64 at addr ffff88802bcf2ba0 by task kworker/1:2/803

CPU: 1 UID: 0 PID: 803 Comm: kworker/1:2 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
 __asan_memcpy+0x29/0x70 mm/kasan/shadow.c:105
 dw210x_op_rw+0xb6/0x180 drivers/media/usb/dvb-usb/dw2102.c:102
 dw2102_load_firmware+0x2b4/0x970 drivers/media/usb/dvb-usb/dw2102.c:1906
 dvb_usb_download_firmware+0x1c3/0x270 drivers/media/usb/dvb-usb/dvb-usb-firmware.c:109
 dvb_usb_device_init+0xddf/0x2570 drivers/media/usb/dvb-usb/dvb-usb-init.c:298
 dw2102_probe+0x8a/0x270 drivers/media/usb/dvb-usb/dw2102.c:2594
 usb_probe_interface+0x653/0xc60 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3772
 usb_set_configuration+0x1ad8/0x2180 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c3/0x3b0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3772
 usb_new_device+0x99d/0x1620 drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x28e8/0x4d30 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 803:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kmalloc_noprof+0x375/0x720 mm/slub.c:5359
 _kmalloc_noprof include/linux/slab.h:992 [inline]
 dw2102_load_firmware+0x175/0x970 drivers/media/usb/dvb-usb/dw2102.c:1896
 dvb_usb_download_firmware+0x1c3/0x270 drivers/media/usb/dvb-usb/dvb-usb-firmware.c:109
 dvb_usb_device_init+0xddf/0x2570 drivers/media/usb/dvb-usb/dvb-usb-init.c:298
 dw2102_probe+0x8a/0x270 drivers/media/usb/dvb-usb/dw2102.c:2594
 usb_probe_interface+0x653/0xc60 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3772
 usb_set_configuration+0x1ad8/0x2180 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c3/0x3b0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3772
 usb_new_device+0x99d/0x1620 drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x28e8/0x4d30 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88802bcf2ba0
 which belongs to the cache kmalloc-16 of size 16
The buggy address is located 0 bytes inside of
 allocated 16-byte region [ffff88802bcf2ba0, ffff88802bcf2bb0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff88802bcf2600 pfn:0x2bcf2
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff88801b001640 ffff88801b000408 ffffea0000af2d50
raw: ffff88802bcf2600 000000080080007a 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 16259999448, free_ts 0
 create_dummy_stack mm/page_owner.c:103 [inline]
 register_dummy_stack+0x98/0x100 mm/page_owner.c:109
 init_page_owner+0x2e/0x5f0 mm/page_owner.c:127
 invoke_init_callbacks mm/page_ext.c:152 [inline]
 page_ext_init+0x509/0x550 mm/page_ext.c:490
 mm_core_init+0x97/0xb0 mm/mm_init.c:2748
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802bcf2a80: 00 00 fc fc fa fb fc fc 00 01 fc fc 00 01 fc fc
 ffff88802bcf2b00: 00 01 fc fc 00 04 fc fc 00 04 fc fc 00 04 fc fc
>ffff88802bcf2b80: 00 04 fc fc 00 00 fc fc 00 00 fc fc fa fb fc fc
                                     ^
 ffff88802bcf2c00: 00 00 fc fc 00 00 fc fc 00 00 fc fc 00 00 fc fc
 ffff88802bcf2c80: 00 00 fc fc fa fb fc fc fa fb fc fc fa fb fc fc
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
