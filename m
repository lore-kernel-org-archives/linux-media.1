Received: from mail-oa1-f77.google.com (mail-oa1-f77.google.com [209.85.160.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725241AF4E9
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 00:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785370284; cv=none; b=mmOO1EZO60Os3uP6x+mXSXw/9KFHPs3YnKinGEDCYaE0709ZF+WasIGgfXJk20fCalaNEGbjzf/96BME/FdwxJChiiXI7gEOzn4QhTHLzBLc6YAFfutvXEsVJ2TTzQ0VVLt5KF/6LFQ2i4m3nzvgJQedB6tD3y9QtBkbcxvVHfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785370284; c=relaxed/simple;
	bh=MhJq0ql3D3vSvxQ6waVZeJ+8A/wMPnrHrV22gMOJLFM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=RquIVaJZsA7cuorFjqo9VHd90STOuFPJGYRSlJXRevwcIAoOMDfU3cKZ7PqMyqXY9IZqjcDaGFiCmn23UFVIKm+UlrdJ3o0FKgOQSd3BQOqVqMQLQNt8n+qMJOHSgakHYGdA8ED+VXQc5JZF8kORnoNmME2G2DRCK73e7ofhZAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f77.google.com with SMTP id 586e51a60fabf-455d6f14efeso638388fac.3
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 17:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785370279; x=1785975079;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P4wEj82utfIPiuT6u2RxDcjIycKtWN4XtjiesCLIxAE=;
        b=pgtL7X2JCmHVVyKZgMtmwJWCWAT2x0mcSkUJhqmrBahybtrU4lCILzuj4jwibqWCIw
         miOAQaSeUAoAkAQ+jH8YHb3gCOW3E3bQBstI8QgX2Q9cKUEzTVFKuZeNU2lmHJRYRzuw
         7ZzoOJAedtePEEhGm8KaiNWT/LzqiTo3Tdh73jkcRhLSMgck6HQS/I7R43cDvO9KfABf
         gDSKoMtSiDgjddWo6nzQZGD0QuNm7LOEFMsziVz5xikeGiDYnCO/Jp13vEsUOPPwxJI+
         wlPS0QK7MkJXywZjG1myKrgC5SiVANOqBy9cGwPZnnzDEKUYF0TRhX5xbeXn7BfgX2SE
         3nJw==
X-Forwarded-Encrypted: i=1; AHgh+RoEmp/T8yRHw0tOO9s0b6iQw3Rhh7hrRZkjgj6X+koBfDJjBbQUZGs9AGkH85gU6BEQXaCATORXvgGyMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXatKFgjvAko9WGw59VRaZzfXZouUxiUHRCyajpaS8Xmg5JfOs
	qsVB0Yajp6M3vACexdITPxgJi/j7dWWUbQO++n9zqxgbe6kfRb5aWw1wS5KT4yLqbnv36OmPkZq
	eD8dASyiwuSZOgMzBIpsP9izWYX4ZnIHSLfqNX26HwPIJ39b3nOhITofj13k=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3010:b0:4ab:6662:4e97 with SMTP id
 5614622812f47-4ad877af8abmr342574b6e.16.1785370278963; Wed, 29 Jul 2026
 17:11:18 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:11:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6a96a6.86abc875.e5c3d.0056.GAE@google.com>
Subject: [syzbot] [media?] WARNING in az6007_i2c_xfer (3)
From: syzbot <syzbot+5d7ca36eaac36bd6a34e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0ce37745d4bf Merge tag 'block-7.2-20260724' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1405d88e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=5d7ca36eaac36bd6a34e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/19521188f055/disk-0ce37745.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2f7922f1fe08/vmlinux-0ce37745.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1a7a0ce66cfa/bzImage-0ce37745.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5d7ca36eaac36bd6a34e@syzkaller.appspotmail.com

usb read operation failed. (-71)
------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(__owner_task(owner) != get_current())
WARNING: kernel/locking/mutex.c:1009 at __mutex_unlock_slowpath+0x5dc/0x930 kernel/locking/mutex.c:1009, CPU#0: syz.4.1822/12872
Modules linked in:
CPU: 0 UID: 0 PID: 12872 Comm: syz.4.1822 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:__mutex_unlock_slowpath+0x5e3/0x930 kernel/locking/mutex.c:1009
Code: 0f b6 14 11 38 d0 7c 08 84 d2 0f 85 12 03 00 00 44 8b 1d 90 58 66 05 45 85 db 75 13 48 8d 3d 84 b1 69 05 48 c7 c6 60 cb cf 8b <67> 48 0f b9 3a 90 48 b8 00 00 00 00 00 fc ff df 4c 89 f2 48 c1 ea
RSP: 0018:ffffc900037ef9c8 EFLAGS: 00010246
RAX: 0000000000000003 RBX: ffff888037bf0000 RCX: 1ffffffff2245434
RDX: 0000000000000000 RSI: ffffffff8bcfcb60 RDI: ffffffff9125faa0
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 1ffff920006fdf3f
R13: 0000000000000003 R14: ffffffff9b739600 R15: fffffbfff36e72c0
FS:  00007f3355f9d6c0(0000) GS:ffff888123dde000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f33533f5ff8 CR3: 00000000315a3000 CR4: 00000000003526f0
DR0: ffffffffffffffff DR1: 00000000000001f8 DR2: 0000000000000002
DR3: ffffffffefffff15 DR6: 00000000ffff0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 az6007_i2c_xfer+0xab0/0xbc0 drivers/media/usb/dvb-usb-v2/az6007.c:827
 __i2c_transfer+0x5d9/0x1740 drivers/i2c/i2c-core-base.c:2287
 i2c_transfer+0x15f/0x380 drivers/i2c/i2c-core-base.c:2343
 i2c_transfer_buffer_flags+0x10c/0x190 drivers/i2c/i2c-core-base.c:2371
 i2c_master_recv include/linux/i2c.h:79 [inline]
 i2cdev_read+0x111/0x2b0 drivers/i2c/i2c-dev.c:155
 vfs_read+0x1e4/0xb40 fs/read_write.c:572
 ksys_pread64 fs/read_write.c:764 [inline]
 __do_sys_pread64 fs/read_write.c:772 [inline]
 __se_sys_pread64 fs/read_write.c:769 [inline]
 __x64_sys_pread64+0x1eb/0x250 fs/read_write.c:769
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f335519de99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f3355f9d028 EFLAGS: 00000246 ORIG_RAX: 0000000000000011
RAX: ffffffffffffffda RBX: 00007f3355426090 RCX: 00007f335519de99
RDX: 00000000000000ea RSI: 0000000000000000 RDI: 0000000000000005
RBP: 00007f3355233eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000002 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f3355426128 R14: 00007f3355426090 R15: 00007fffc564afd8
 </TASK>
----------------
Code disassembly (best guess):
   0:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   4:	38 d0                	cmp    %dl,%al
   6:	7c 08                	jl     0x10
   8:	84 d2                	test   %dl,%dl
   a:	0f 85 12 03 00 00    	jne    0x322
  10:	44 8b 1d 90 58 66 05 	mov    0x5665890(%rip),%r11d        # 0x56658a7
  17:	45 85 db             	test   %r11d,%r11d
  1a:	75 13                	jne    0x2f
  1c:	48 8d 3d 84 b1 69 05 	lea    0x569b184(%rip),%rdi        # 0x569b1a7
  23:	48 c7 c6 60 cb cf 8b 	mov    $0xffffffff8bcfcb60,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	90                   	nop
  30:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  37:	fc ff df
  3a:	4c 89 f2             	mov    %r14,%rdx
  3d:	48                   	rex.W
  3e:	c1                   	.byte 0xc1
  3f:	ea                   	(bad)


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
