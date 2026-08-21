Received: from mail-oi2-f4.google.com (mail-oi2-f4.google.com [74.125.231.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518813AC0DC
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787298102; cv=none; b=kgi7SFvr7nCWWGfDeTR5cdrF6C3K+FEzUkCnFJihfg1k5ggB8wWF/6b0Y435WqBiNeGiHspNv7701IWRT+U5pIvIGziSfjPXi2NPUiQtI7lqOsT43lqixkJdSie5pXC5nTEA8h5qhJ1nsbtcLZTa9aZcxsRZ4W0dzGdifQAMl0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787298102; c=relaxed/simple;
	bh=nmzWacGTHxKZE3ubY/KIjyNEZg1N+qDYx0gXTDWPrrA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=KrCou0Gwtx3VXouijvXAdEVcLCb7WYtYt0vOYpZ1MvkRMHpbHkZQPDGge/8XW/zlOEj0vlHkj0ExDwal2aL04ttxyO6nJxLw+fJbuQmWqyhbml60LTbeKpfVrUA9CA/TpDAuwGX7v9M/vy6r1GpLJ96PUMEwXXB/dKCSkt8BVGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f4.google.com with SMTP id 5614622812f47-4ab2d8e7e4cso229286b6e.1
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 00:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787298094; x=1787902894;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eI9nUg0SS5Fmp+720Vhk6Ih5k4YhpZgUys0VSAyY1mc=;
        b=Ke7GwKyFHdXoNSMKvx5vA9gcjIGeTvOTC54Wva2mmRGFUAQ79eIEtZ1l603kohcTck
         tGD6853hD1CkHtYm1nyP8pATdq80PfQwrW8bzMxrJxheKwI+xgtPOezJFuv2SSctMk9n
         bfz4ScoIcmnkn1VCe4AsMyMZmWE4W8uMnQh7EU4WzdvJKeVeElh8z41cGdppyz2G3100
         /xXZDwJKZn4+/F5pQoIiTTlXuO8sGX/ZUoORtM94wu9Mm2l+fOVIWlONmWhGisBwCd9V
         tVEmfUTOyF7TsYq1idV5i0JUN9X25Vy/DUuWfYDu44zLiFN1hWFQwIisif49YW/np6fZ
         PaDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp14rT4FWckmhsuEiUJtvtyaplqjfgzRcE3y9bS2IGFhrAwpskGreu53goxh3d6W20CnPeaJr+HN+6UGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyaf+H6M84c53XXKUAs/+GB19s4fr+1E4XrKybd2+T9JQDFnZPl
	RKXKNMJh1K365k28M5aoG5qBsg5YcMotk/RgX0y2Ib3VuMX04Rl6XJymQHFLDHHXlWSN3lUTWa/
	AW7iF6+haJ65UdSPBGTaFj4QkzH2s1Gwwh1pq6FWPd0I7j74FzsjiuXhA2N0=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5086:b0:495:fecb:bf9c with SMTP id
 5614622812f47-4b2ef292b14mr4058043b6e.6.1787298094723; Fri, 21 Aug 2026
 00:41:34 -0700 (PDT)
Date: Fri, 21 Aug 2026 00:41:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a88012e.dbb3a75c.13dd47.0008.GAE@google.com>
Subject: [syzbot] [media?] WARNING in vp702x_read_mac_addr
From: syzbot <syzbot+477f9c41b0a7d90fb9cc@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    dcb68831eac7 Merge tag 'block-7.2-20260815' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15a4d949580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=65bd434865e8f85c
dashboard link: https://syzkaller.appspot.com/bug?extid=477f9c41b0a7d90fb9cc
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-dcb68831.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2788b4793ff6/vmlinux-dcb68831.xz
kernel image: https://storage.googleapis.com/syzbot-assets/28c6c79990ac/bzImage-dcb68831.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+477f9c41b0a7d90fb9cc@syzkaller.appspotmail.com

dvbdev: DVB: registering new adapter (TwinhanDTV StarBox DVB-S USB2.0 (VP7021))
usb 6-1: media controller created
------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: kernel/locking/mutex.c:625 at __mutex_lock_common kernel/locking/mutex.c:625 [inline], CPU#1: kworker/1:2/1349
WARNING: kernel/locking/mutex.c:625 at __mutex_lock+0x947/0x1bd0 kernel/locking/mutex.c:821, CPU#1: kworker/1:2/1349
Modules linked in:
CPU: 1 UID: 0 PID: 1349 Comm: kworker/1:2 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: usb_hub_wq hub_event
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:625 [inline]
RIP: 0010:__mutex_lock+0x94e/0x1bd0 kernel/locking/mutex.c:821
Code: 0f b6 14 11 38 d0 7c 08 84 d2 0f 85 c6 10 00 00 44 8b 35 45 a7 66 05 45 85 f6 75 13 48 8d 3d 19 05 6a 05 48 c7 c6 a0 c8 cf 8b <67> 48 0f b9 3a 90 e9 18 f8 ff ff 4d 8d a7 e8 0a 00 00 4c 89 e7 e8
RSP: 0018:ffffc90006ebec80 EFLAGS: 00010246
RAX: 0000000000000003 RBX: ffff8880253fe100 RCX: 1ffffffff2244970
RDX: 0000000000000000 RSI: ffffffff8bcfc8a0 RDI: ffffffff9125a960
RBP: ffffc90006ebedf0 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888096ce7000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000f74382f0 CR3: 000000002a209000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 vp702x_read_mac_addr+0x51/0x130 drivers/media/usb/dvb-usb/vp702x.c:297
 dvb_usb_adapter_dvb_init+0x2dd/0x860 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:165
 dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:86 [inline]
 dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:186 [inline]
 dvb_usb_device_init.cold+0xbd5/0x14bb drivers/media/usb/dvb-usb/dvb-usb-init.c:310
 vp702x_usb_probe+0x8d/0x210 drivers/media/usb/dvb-usb/vp702x.c:342
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
 usb_new_device.part.0+0xcc2/0x1686 drivers/usb/core/hub.c:2703
 usb_new_device include/linux/workqueue.h:714 [inline]
 hub_port_connect drivers/usb/core/hub.c:5575 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5715 [inline]
 port_event drivers/usb/core/hub.c:5879 [inline]
 hub_event.cold+0x1e3/0xe90 drivers/usb/core/hub.c:5961
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   4:	38 d0                	cmp    %dl,%al
   6:	7c 08                	jl     0x10
   8:	84 d2                	test   %dl,%dl
   a:	0f 85 c6 10 00 00    	jne    0x10d6
  10:	44 8b 35 45 a7 66 05 	mov    0x566a745(%rip),%r14d        # 0x566a75c
  17:	45 85 f6             	test   %r14d,%r14d
  1a:	75 13                	jne    0x2f
  1c:	48 8d 3d 19 05 6a 05 	lea    0x56a0519(%rip),%rdi        # 0x56a053c
  23:	48 c7 c6 a0 c8 cf 8b 	mov    $0xffffffff8bcfc8a0,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	90                   	nop
  30:	e9 18 f8 ff ff       	jmp    0xfffff84d
  35:	4d 8d a7 e8 0a 00 00 	lea    0xae8(%r15),%r12
  3c:	4c 89 e7             	mov    %r12,%rdi
  3f:	e8                   	.byte 0xe8


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
