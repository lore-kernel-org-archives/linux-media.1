Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719765;
	b=O2/iv4Ib6vdOYFONJm8ReKF7Lid+Eqi5hOoBUvL9qaY+C/mEu4SoAp4PE4irD/lGuqW5
	 lJfOesUVxZMeX8S0zGaVFME6C98ITtfPTOExmSf8clUu6tX3lcow2R/m1I5tJLgys+6/T
	 EoOLootHM/JD+aaYvxPBsAKMfLLPOEvNKgFkVlwPfJBjmpXJT3MnaZ1UPwqB/d4Wu5GUC
	 vRIRLN7LTMV70927G+DYyYe10BJTKesIh+O1+jEPTT8sZuSbOysbmCYOkmhClWc+58KM4
	 ATVeT3BZgmVEqP6qNu8HmWeB1xVlDt9HODzw2gmW469DNM3xBTW07+q5XdwB82cufWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719765;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=18mcBnlYVAW5e+JbuWg4ZcVITQfAzV5LQyXhc+3tPi4=;
	b=PimjdNnFYMWurAiV6rOGiurIPYGUApFyE9JchkRfxCuvsXhySWowPTeyrvJPSZBio1q2
	 +UUP+ca1Ofu9bWqdpSoFopVgSU/BISzMgZ/tFIHtzP1d+pre+i9HqtMEGWu1mYkpW/3Au
	 TMht5ZHoXRJ/invA33hRyFhNRyYJc7f+w8Ei6+5EnM54xDqW/hlQyv1ZhN47UPQU/TgKd
	 jv3HB6WTUClQyNQ7HGhTuvd4Lcn+pPTTDgDSp9EBdTdIaY+bNh/A9fvvz0t7I6ATm/I4z
	 KCkgGLlw4CnAJgSXkBmnDGCmDmCc4QUvBBhT2MJJPk907LPp50HlOpRA01zuFmhgaXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5F3606A32D
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 19:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF5F3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4e937c5bd4fso6183986b6e.2
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 11:02:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719764; x=1796324564;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=18mcBnlYVAW5e+JbuWg4ZcVITQfAzV5LQyXhc+3tPi4=;
        b=qWzv8FG1CXcK1AMVvjsfmjmoge9qMJ9AGKmFhrwVbgl7ALdN4quZ+3a1PPxMikA2SE
         HF6GJGheYTCJMFR9tqE0FRkVD1WvdRI1QYfcsKJrmuy/p1B75Jv/lJq2ao5FQxSD3we5
         quW9h8bfzqPTTG3o8JyFIPYh3VsfxOpbR5jau0uHaa3OTZ6mrqjKvvsqT1RfpZ6f9+JT
         spI6votkeGQ4hq8iZgbLzczcIdIToXdQW9wflSzbDMhMS4DAlob/qIxgmrJ9zjXzI+q9
         rgiXtpwEzF36byYuPyxK5/GEfVf7Jjxm/eLzGng7RxIn9JmWSIurOLG25KyKSt+UvVCi
         pVzw==
X-Forwarded-Encrypted: i=1; AL+hErHj8rippdr+U70GJ6lNY0Y7GkzeTi7U9ERCwbs15roA63baKaxkHJG/iDEwIow0ujFx6fY4ostFeUKNjw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9GnHdDx0G1xTfovowkJWKs0SZwceD95kub22dDbPhGguNK7O0r
	FEk0mkAbK/e3G0RtBu9UJPrD7qn/hps6C5NxQFNUF6ozsWW/Fu205jLy7S3072ICq/4qlxDWds1
	ZYFVlhZDDWYwQSrUDHGZTwnyOs2lac8Zmq8l8ng6MtTzhsJ7PUgY1bzcJXvM=
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:309f:b0:4c3:d087:4446 with SMTP id
 5614622812f47-57a0b245d14mr23076087b6e.42.1795719763755; Thu, 26 Nov 2026
 11:02:43 -0800 (PST)
Date: Thu, 26 Nov 2026 11:02:43 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b088253.28411dd9.2968b4.0009.GAE@google.com>
Subject: [syzbot] [media?] general protection fault in __media_device_register
From: syzbot <syzbot+8769efb8c3d52870334c@syzkaller.appspotmail.com>
To: laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, mchehab@osg.samsung.com, 
	sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    25faec9ce61c net: dpaa2-eth: fix objtool warning and logic..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16f85c6d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fbd0fc734eea62ed
dashboard link: https://syzkaller.appspot.com/bug?extid=8769efb8c3d52870334c
compiler:       Debian clang version 22.1.8 (1~deb13u5), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/98fce4d0b21b/non_bootable_disk-25faec9c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4c1927657be7/vmlinux-25faec9c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6fda75e8de56/bzImage-25faec9c.xz

The issue was bisected by AI to:

commit 37ecc7b1278f4184a6869504f7074b4a54f112c5
Author: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Date:   Wed Jan 27 09:07:24 2016 +0000

    [media] em28xx: add media controller support

reasoning:      https://syzkaller.appspot.com/ai_job?id=cc710625-e1fd-46cf-b43b-f649c55c924b

AI-generated root cause summary:
In drivers/media/usb/em28xx/em28xx-cards.c, em28xx_init_dev() calls
em28xx_media_device_init() without checking its return value. When the
kzalloc_obj(*mdev) allocation in em28xx_media_device_init() fails and returns
-ENOMEM, dev->media_dev remains NULL while device initialization continues.
Later in em28xx_usb_probe(), media_device_register(dev->media_dev) is called
unconditionally with dev->media_dev == NULL, triggering a NULL-pointer
dereference in __media_device_register() at mdev->devnode = devnode.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=8769efb8c3d52870334c

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8769efb8c3d52870334c@syzkaller.appspotmail.com

The bisection result may be wrong.
If you agree with it, please also add:
Fixes: 37ecc7b1278f ("[media] em28xx: add media controller support")

em28xx 5-1:0.0: Disconnecting em28xx
em28xx: Freeing device
em28xx 5-1:0.0: New device syz syz @ 480 Mbps (2040:0264, interface 0, class 0)
em28xx 5-1:0.0: Audio interface 0 found (Vendor Class)
em28xx 5-1:0.0: unknown em28xx chip ID (49)
FAULT_INJECTION: forcing a failure.
name failslab, interval 1, probability 0, space 0, times 1
CPU: 0 UID: 0 PID: 5360 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 fail_dump lib/fault-inject.c:80 [inline]
 should_fail_ex+0x3eb/0x540 lib/fault-inject.c:181
 should_failslab+0xa8/0x100 mm/failslab.c:46
 slab_pre_alloc_hook mm/slub.c:4675 [inline]
 slab_alloc_node mm/slub.c:5011 [inline]
 __kmalloc_cache_noprof+0x9e/0x600 mm/slub.c:5676
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 em28xx_media_device_init drivers/media/usb/em28xx/em28xx-cards.c:3757 [inline]
 em28xx_init_dev+0x857/0x2680 drivers/media/usb/em28xx/em28xx-cards.c:3947
 em28xx_usb_probe+0x17b2/0x2dd0 drivers/media/usb/em28xx/em28xx-cards.c:4323
 usb_probe_interface+0x751/0xe00 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:707
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:869
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:899
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1027
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2bd/0x430 drivers/base/dd.c:1131
 proc_ioctl+0x409/0x660 drivers/usb/core/devio.c:2370
 proc_ioctl_default+0xc4/0x110 drivers/usb/core/devio.c:2405
 usbdev_do_ioctl drivers/usb/core/devio.c:2769 [inline]
 usbdev_ioctl+0x139d/0x21a0 drivers/usb/core/devio.c:2829
 vfs_ioctl fs/ioctl.c:52 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8aaa3a9a99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f8aa6791fe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f8aaa636288 RCX: 00007f8aaa3a9a99
RDX: 0000200000000140 RSI: 00000000c0105512 RDI: 0000000000000004
RBP: 00007f8aa6792050 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007f8aaa636320 R14: 00007f8aaa636288 R15: 00007ffd042e0a98
 </TASK>
em28xx 5-1:0.0: Config register raw data: 0xfffffffb
em28xx 5-1:0.0: AC97 chip type couldn't be determined
em28xx 5-1:0.0: No AC97 audio processor
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
CPU: 0 UID: 0 PID: 5360 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__media_device_register+0x6e/0x3c0 drivers/media/mc/mc-device.c:745
Code: c0 0b 6f 06 ba 60 05 00 00 be c0 0d 00 00 e8 29 84 0d fa 48 85 c0 0f 84 7a 01 00 00 49 89 c6 4d 8d 6f 08 4d 89 ec 49 c1 ec 03 <41> 80 3c 1c 00 74 08 4c 89 ef e8 43 85 19 fa 4c 89 2c 24 4d 89 75
RSP: 0018:ffffc9000e4e77c0 EFLAGS: 00010202
RAX: ffff8880360cc000 RBX: dffffc0000000000 RCX: 9682cb0c9f17da00
RDX: 00000000000014f0 RSI: 0000000000000004 RDI: 00000000ffffffff
RBP: 0000000000000000 R08: ffff88801f842203 R09: 1ffff11003f08440
R10: dffffc0000000000 R11: ffffed1003f08441 R12: 0000000000000001
R13: 0000000000000008 R14: ffff8880360cc000 R15: 0000000000000000
FS:  00007f8aa67926c0(0000) GS:ffff88808a9e9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6b7676d490 CR3: 00000000144d0000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 em28xx_usb_probe+0x1c5e/0x2dd0 drivers/media/usb/em28xx/em28xx-cards.c:4444
 usb_probe_interface+0x751/0xe00 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:707
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:869
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:899
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1027
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2bd/0x430 drivers/base/dd.c:1131
 proc_ioctl+0x409/0x660 drivers/usb/core/devio.c:2370
 proc_ioctl_default+0xc4/0x110 drivers/usb/core/devio.c:2405
 usbdev_do_ioctl drivers/usb/core/devio.c:2769 [inline]
 usbdev_ioctl+0x139d/0x21a0 drivers/usb/core/devio.c:2829
 vfs_ioctl fs/ioctl.c:52 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8aaa3a9a99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f8aa6791fe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f8aaa636288 RCX: 00007f8aaa3a9a99
RDX: 0000200000000140 RSI: 00000000c0105512 RDI: 0000000000000004
RBP: 00007f8aa6792050 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007f8aaa636320 R14: 00007f8aaa636288 R15: 00007ffd042e0a98
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__media_device_register+0x6e/0x3c0 drivers/media/mc/mc-device.c:745
Code: c0 0b 6f 06 ba 60 05 00 00 be c0 0d 00 00 e8 29 84 0d fa 48 85 c0 0f 84 7a 01 00 00 49 89 c6 4d 8d 6f 08 4d 89 ec 49 c1 ec 03 <41> 80 3c 1c 00 74 08 4c 89 ef e8 43 85 19 fa 4c 89 2c 24 4d 89 75
RSP: 0018:ffffc9000e4e77c0 EFLAGS: 00010202
RAX: ffff8880360cc000 RBX: dffffc0000000000 RCX: 9682cb0c9f17da00
RDX: 00000000000014f0 RSI: 0000000000000004 RDI: 00000000ffffffff
RBP: 0000000000000000 R08: ffff88801f842203 R09: 1ffff11003f08440
R10: dffffc0000000000 R11: ffffed1003f08441 R12: 0000000000000001
R13: 0000000000000008 R14: ffff8880360cc000 R15: 0000000000000000
FS:  00007f8aa67926c0(0000) GS:ffff88808a9e9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f4279a2fcf0 CR3: 00000000144d0000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	0b 6f 06             	or     0x6(%rdi),%ebp
   3:	ba 60 05 00 00       	mov    $0x560,%edx
   8:	be c0 0d 00 00       	mov    $0xdc0,%esi
   d:	e8 29 84 0d fa       	call   0xfa0d843b
  12:	48 85 c0             	test   %rax,%rax
  15:	0f 84 7a 01 00 00    	je     0x195
  1b:	49 89 c6             	mov    %rax,%r14
  1e:	4d 8d 6f 08          	lea    0x8(%r15),%r13
  22:	4d 89 ec             	mov    %r13,%r12
  25:	49 c1 ec 03          	shr    $0x3,%r12
* 29:	41 80 3c 1c 00       	cmpb   $0x0,(%r12,%rbx,1) <-- trapping instruction
  2e:	74 08                	je     0x38
  30:	4c 89 ef             	mov    %r13,%rdi
  33:	e8 43 85 19 fa       	call   0xfa19857b
  38:	4c 89 2c 24          	mov    %r13,(%rsp)
  3c:	4d                   	rex.WRB
  3d:	89                   	.byte 0x89
  3e:	75                   	.byte 0x75


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#ai-bisection

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
