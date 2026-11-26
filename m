Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729478;
	b=p4YOeMsA+TwGnr/X+8DceucHTf/jqZ62vqoI+cOnHNrlTGhTZXTifh5b+aPGRNl/2rMj
	 D4riVIZlyyT47GfKIxctDfmB+MX+jHCQvtvamCUK4xf0G/QEhvTR5TMOgwg7UixoZNUSc
	 Qz7GCJzRJzOso37BBLNdu1QxYofsfMswcbIdjiZVXctWpl3g6fRq5EA9bvfZeqCTvzUqg
	 e7qktEHjBZ7xxMoU0TOQ1U9Q7uZ/ERtX+Ax9Wtp5I9NDkqHKJ5t5n18VEr9CbmV+mHq4u
	 s4j2AHPEo3LSxIqd5GBPGDBSgQNoE8G8hszllnUPvn49BGddjMK11EEGvb1LuI7CPiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729478;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=VuD/knKdWaeBdTXh9LaA+EVb2zYgv6k7/haIr1KiUK4=;
	b=ldmX4dLV3ZsQmqYJpjm4K2KSDksMroWeebe3Q2DJQzPfJvsfbAHWcUCsdKmGUyWe+JyJ
	 54so6f2SgjXfoeEt+ExbYLUbe1WsDQTmr6mEyZ9HjW/HX08pvUSsNrkagyVOI3dE702n2
	 U/2cf8vXHEb7fUx2eeGSreN+ln/OMmQ7BTbTJEiXdlBxNoJB9FsGYimoWuz/X79hT2D5V
	 8vGGh+ILHT0RRhL78MUP0EInqjrsYDd1ge7SBTh3yFf+Ljx1YH3ShGbiKyJOU3v9/7t1e
	 Px5rhT0YZbhkP36rH+3njnTizFGjrjm8Oe+fsbtQai+CQkxyYdtAWAX6dtfDdMqXyfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C441606A32F
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 21:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C441606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4ae40674bd0so4124069fac.2
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 13:44:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729476; x=1796334276;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VuD/knKdWaeBdTXh9LaA+EVb2zYgv6k7/haIr1KiUK4=;
        b=dMItyXyvgnJRV5PQAZmel/QASA/SjIEElAFH2gwEI7aW76dWEqgjvpsXrXsO9Jq3dx
         SCTeFfLo0sGLY/yJkFU5FW61k2Xiod/pTYpKC98yKI2o87QO9RBD0Zv/6k+dJ89FvOql
         lRvzSZC2wNoBtKacQAAknyDNWesM1gY2p+enVLy+seIuMMIZadNXxwXOu44zJ6tQ2Q84
         XwxDLBc+CS7J72oqC8UyVABUZcPF8Q7X+i/qtZjq91wQLsnftTISgzxKgxY1bPmHxvya
         FIFz9q418L669UDGEyJcHi4P0EilNvtZ4TvljbkoRw4HOdFxanm7VUdGWlNojn9hZ4JN
         9IqQ==
X-Forwarded-Encrypted: i=1; AL+hErH5eqNcC8jwksqGi2dT8EipTlxa+YqTVWp+6Z+x4tR1CGwvhoDlmWbSnaJMegHQMb8DbyXOE9uonj/gCw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ybaTRML8G3v0s4wZ5pmuYxsm4q/VgnSZ7t1NgxJnpShdr1avX
	TjVcdK3ywLWh+REgSEjHu744je+MeFmx447dxWga67YQw2Kqbuka7bWASk/OMmD2E+d9x9Qwg7J
	3dQ+TPehST4Adti7uQOEFJaNfU/0VvwmMk32tKPvz7Yyu0wrV4LI1CVuVi/w=
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f48:b0:573:6ee8:2399 with SMTP id
 5614622812f47-57a0a211c71mr24272371b6e.19.1795729476694; Thu, 26 Nov 2026
 13:44:36 -0800 (PST)
Date: Thu, 26 Nov 2026 13:44:36 -0800
In-Reply-To: <6b088253.28411dd9.2968b4.0009.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b08a844.904258e1.78503.0026.GAE@google.com>
Subject: Re: [syzbot] [media?] general protection fault in __media_device_register
From: syzbot <syzbot+8769efb8c3d52870334c@syzkaller.appspotmail.com>
To: laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, mchehab@osg.samsung.com, 
	sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    25faec9ce61c net: dpaa2-eth: fix objtool warning and logic..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16d5e153580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fbd0fc734eea62ed
dashboard link: https://syzkaller.appspot.com/bug?extid=8769efb8c3d52870334c
compiler:       Debian clang version 22.1.8 (1~deb13u5), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17cdca6d580000

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

em28xx 5-1:0.0: AC97 chip type couldn't be determined
em28xx 5-1:0.0: No AC97 audio processor
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
CPU: 0 UID: 0 PID: 5823 Comm: syz.2.20 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__media_device_register+0x6e/0x3c0 drivers/media/mc/mc-device.c:745
Code: c0 0b 6f 06 ba 60 05 00 00 be c0 0d 00 00 e8 29 84 0d fa 48 85 c0 0f 84 7a 01 00 00 49 89 c6 4d 8d 6f 08 4d 89 ec 49 c1 ec 03 <41> 80 3c 1c 00 74 08 4c 89 ef e8 43 85 19 fa 4c 89 2c 24 4d 89 75
RSP: 0018:ffffc90001be77c0 EFLAGS: 00010202
RAX: ffff888043791000 RBX: dffffc0000000000 RCX: 786b3eff022cc500
RDX: 00000000000016bf RSI: ffffffff8e6b0089 RDI: 00000000ffffffff
RBP: 0000000000000000 R08: ffffffff91be6dbf R09: 1ffffffff237cdb7
R10: dffffc0000000000 R11: fffffbfff237cdb8 R12: 0000000000000001
R13: 0000000000000008 R14: ffff888043791000 R15: 0000000000000000
FS:  00007f844c7226c0(0000) GS:ffff88808a9e9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f013c26444c CR3: 0000000054794000 CR4: 0000000000352ef0
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
RIP: 0033:0x7f844b7a9a99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f844c722028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f844ba36190 RCX: 00007f844b7a9a99
RDX: 0000200000000140 RSI: 00000000c0105512 RDI: 0000000000000005
RBP: 00007f844c722090 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007f844ba36228 R14: 00007f844ba36190 R15: 00007ffcd010b238
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
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
