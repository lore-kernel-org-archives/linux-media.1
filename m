Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FE2381AE5
	for <linux-media@vger.kernel.org>; Sun,  2 Aug 2026 13:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785678031; cv=none; b=oDVrA7OKO4cdhI+Fl2n242k8vfBe+/bGlwqb0HABmgmC3eSjyXBnMKderG17tKT0rdiudyOBn9OPYcOesls4xTThCkK8Oej4L+c4cFTwQmmvtRrwoOv+BsjEuvcJiVxTNU9mC1yFKOqaXgsXo+04GjdfM89TUBt72K6OhjrH46A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785678031; c=relaxed/simple;
	bh=jEcPQpBm1XeOWVKHp/H5kp6AsvxaPei8KSmx+Wvc8p8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=CI74XGfSCq7fdouLnokAl+v38fYxDYCJvrQpbPxbp8flO+gQPT9HsRtRfa825c9uJEdAxxM5Ql/IJFqjW15/YxOwhFr2EJsEsU/LYvIx0Adj1RLhvh8EJhz+i0T6AJndoUKuQHL4idreX0ihMuUtsaMc9zW0mRKxvQimvaAtH1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-48576b535b6so1480783b6e.2
        for <linux-media@vger.kernel.org>; Sun, 02 Aug 2026 06:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785678028; x=1786282828;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N09T7duhsshnl5GzshtvTXu8HYyFGRNPluV4/bohBok=;
        b=k3GOhb+lysh0wW5HkRAAwwLybaospAYTpw8P08VvRe5Em+Xwwb/rntiGl2kN/DL4ja
         tGt8hXWKO2kSwP0Pholjeep+Q5S8top1xhutbTMnLm92nnc4+xcKbsF2jl5TvtSWQaSE
         Y1+v8Pb+WdWJCaACAboIVRuiEPfrqFLjih1evA7Fjp6aXX3nUV4n9LhbOusxsjMoPWwV
         p2e3mqJSvQIiDwNm/jev1+kw9kt7p5yyW7wC3BzHarBd50iKosW3KH3qwiWKj4oH2Bkv
         VATJDpybKS2wGfUcDsqkJpp1HPZbAD3mYj5T+d4d/xyki9TL4+a3Zxr9W72PmC8/I+H9
         XwTg==
X-Forwarded-Encrypted: i=1; AHgh+RrsdX7p4OIzlKXKoCip2ZJfq3nXLE0UXo9cJsMNlBY2+CEemLwRAHHwE9iDcKVjspdbbgGruHHKq6YkDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6doCAS5yN91Kxn+eM8XpvpLYHLP3puJaHGI+PxDnv4ECPa91l
	CsxtWgvEkq3zSbhYiwUWo/2LVHs/WFRqvZ4GVfazPj4mb4tqXQAbMXvxr0UAJsRduxD4bI6Uvu/
	XEb0i7n98tnIeysED9NlNvBKSnTein+wHnmCCnZS4LK+Tx3hAa5nz8V4dbs0=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3318:b0:495:e16d:5d03 with SMTP id
 5614622812f47-4af5e325301mr11472646b6e.21.1785678028475; Sun, 02 Aug 2026
 06:40:28 -0700 (PDT)
Date: Sun, 02 Aug 2026 06:40:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6f48cc.13bfb6d0.1ecdd5.026f.GAE@google.com>
Subject: [syzbot] [pvrusb2?] WARNING in pvr2_hdw_create
From: syzbot <syzbot+b91abe6ef9924496daf8@syzkaller.appspotmail.com>
To: isely@pobox.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, pvrusb2@isely.net, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fc02acf6ac0c Merge tag 'platform-drivers-x86-v7.2-4' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13a8b1b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c05be6c9b0d36cb9
dashboard link: https://syzkaller.appspot.com/bug?extid=b91abe6ef9924496daf8
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-fc02acf6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a67a14a03b39/vmlinux-fc02acf6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/328affe48b77/bzImage-fc02acf6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b91abe6ef9924496daf8@syzkaller.appspotmail.com

pvrusb2: ***WARNING*** Support for this device (Terratec Grabster AV400) is experimental.
pvrusb2: Important functionality might not be entirely working.
pvrusb2: Please consider contacting the driver author to help with further stabilization of the driver.
pvrusb2: **********
FAULT_INJECTION: forcing a failure.
name failslab, interval 1, probability 1, space 0, times 950
CPU: 0 UID: 0 PID: 5302 Comm: kworker/0:4 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 fail_dump lib/fault-inject.c:73 [inline]
 should_fail_ex+0x40c/0x560 lib/fault-inject.c:174
 should_failslab+0xa8/0x100 mm/failslab.c:46
 slab_pre_alloc_hook mm/slub.c:4539 [inline]
 slab_alloc_node mm/slub.c:4897 [inline]
 __kmalloc_cache_noprof+0xa8/0x660 mm/slub.c:5485
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 pvr2_hdw_create+0x1e6b/0x3030 drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2545
 pvr2_context_create+0x18b/0x380 drivers/media/usb/pvrusb2/pvrusb2-context.c:222
 pvr_probe+0x25/0xd0 drivers/media/usb/pvrusb2/pvrusb2-main.c:54
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
------------[ cut here ]------------
!work->func
WARNING: kernel/workqueue.c:4335 at __flush_work+0xb8f/0xca0 kernel/workqueue.c:4335, CPU#0: kworker/0:4/5302
Modules linked in:
CPU: 0 UID: 0 PID: 5302 Comm: kworker/0:4 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: usb_hub_wq hub_event
RIP: 0010:__flush_work+0xb8f/0xca0 kernel/workqueue.c:4335
Code: 75 5e 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d e9 46 c3 47 0a cc e8 f0 df 38 00 90 0f 0b 90 e9 7c ff ff ff e8 e2 df 38 00 90 <0f> 0b 90 31 c0 48 bb f8 f8 f8 f8 f8 f8 f8 f8 e9 64 ff ff ff e8 c8
RSP: 0018:ffffc9000de06ac0 EFLAGS: 00010293
RAX: ffffffff818e346e RBX: ffff88805194c0e8 RCX: ffff88801fb78000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88805194c0d0
RBP: ffffc9000de06c70 R08: ffffffff9057b737 R09: 1ffffffff20af6e6
R10: dffffc0000000000 R11: fffffbfff20af6e7 R12: dffffc0000000000
R13: 1ffff1100a32981d R14: 1ffff92001bc0d60 R15: ffff88805194c0d0
FS:  0000000000000000(0000) GS:ffff88808c543000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcb17bd60f5 CR3: 00000000437d3000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 pvr2_hdw_create+0x207f/0x3030 drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2610
 pvr2_context_create+0x18b/0x380 drivers/media/usb/pvrusb2/pvrusb2-context.c:222
 pvr_probe+0x25/0xd0 drivers/media/usb/pvrusb2/pvrusb2-main.c:54
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
