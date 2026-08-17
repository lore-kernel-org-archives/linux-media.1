Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F1B2E0914
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 03:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786937666; cv=none; b=ITVosdPRjyFdjwKUxJ8AXHviabD+dUAjnVp1ul5K1N9jzuEEAX8d0+cRIhrse0cSidFv3Hzvtg9YEMSkOp8PSuL7jY4k2RosLSQFeGdhqXergPehs83mawvc+7QQR8n+jQ8YcaWZeaChwLNS/L91WbyAaWL9e3HQXpAhqkvO59k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786937666; c=relaxed/simple;
	bh=PTTmJjw5ttfDa+zL8K7a41p9iIFwCu58JB+W35wAcZ8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=p7VhaKn4Z78F+qIvlL81VtUbgJe1Wid9BUdn/dUhNmCd0f6NWbJJx8RqEWiTGGGF0INdQqq0bDEIsxo5A+EjSjeXeKdNd/HHHLJ40tj0Y+EXCh4cEQD9VG/dz6pSb7qFDmZ431ojwzE5NDMc1wIZa/H2U05fbd7GOY1wuuebqsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-49aa4525b82so3453263b6e.1
        for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 20:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786937664; x=1787542464;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/JnPjn1S4zOxztrzwigrPhOdAfrZKEXn5KbACtAhNa8=;
        b=DWNzG1v5WnaGbNCiLmd81z5Z60UENSKTdJGg4dJi68zeLz+QV42SFz/MNHauUqGyea
         ATvlabB5UzYNS7Ns6JK73Jfz7t8/dGPILHUJ5KWgKrWkaGXEghZyvZ7Xkeo8BcJfemb0
         0q1uZ+IKE5uxVXs2+48ohI6ciGZwroGujFJf0ViqgPD2tPx0oFuextPKGXZWvbrCqEC8
         X5b+QfaR9RnqNtwLe3iTHfvk4G9HiqjqwSqybOKEwpQAmUoggQVXRMhiM0rqkBIFt1Bc
         8CtVgDSvn78KjnKDZEswlAjvxytZs6pglftTUYtah4/Uw3bw9LtKy0pOdU3xmJFC7fDP
         JEWA==
X-Forwarded-Encrypted: i=1; AHgh+RqEZWeT99NjLCOmlt+wSHcHPdwRa4Bn4XWsGefNZ4m6ad1lWX7LdZyfbi/JGdR2iIO+kSLhp2Gat34qTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYMc3AHzHUE/BsaSVgfGWsrBjlf+jki0Jt/cx/6gBW72CqzFdK
	PlHSCJ4srUBqPDVpwfL1zOM3u9IDmz/gKMPP6jNkoowwvvOhG5xIZfTIzTqKWT4J1GYfLYyinHu
	uV1AtJWxi6eRwJIWosE8EmfG962M4cstS6KSV+yhmk6CqePVX2CaQLeZN6D0=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c183:b0:4b1:9f12:e2f6 with SMTP id
 5614622812f47-4b241f24ef7mr21246021b6e.19.1786937664210; Sun, 16 Aug 2026
 20:34:24 -0700 (PDT)
Date: Sun, 16 Aug 2026 20:34:24 -0700
In-Reply-To: <6a7135a9.d35e88fd.de8b.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a828140.10853dc7.22f513.0018.GAE@google.com>
Subject: Re: [syzbot] [media?] WARNING in as102_stream_ctrl
From: syzbot <syzbot+ea047a32630b1f47da67@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    dcb68831eac7 Merge tag 'block-7.2-20260815' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15a356c6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2ca5f2f2c4197664
dashboard link: https://syzkaller.appspot.com/bug?extid=ea047a32630b1f47da67
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=144afa79580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=128fc679580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ce324780f4da/disk-dcb68831.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/54b24f8a899c/vmlinux-dcb68831.xz
kernel image: https://storage.googleapis.com/syzbot-assets/733dcdb8d8dd/bzImage-dcb68831.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ea047a32630b1f47da67@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: kernel/locking/mutex.c:625 at __mutex_lock_common kernel/locking/mutex.c:625 [inline], CPU#1: syz.2.149/6139
WARNING: kernel/locking/mutex.c:625 at __mutex_lock+0x12d8/0x1550 kernel/locking/mutex.c:821, CPU#1: syz.2.149/6139
Modules linked in:
CPU: 1 UID: 0 PID: 6139 Comm: syz.2.149 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:625 [inline]
RIP: 0010:__mutex_lock+0x12df/0x1550 kernel/locking/mutex.c:821
Code: c2 57 90 48 c1 e8 03 0f b6 04 18 84 c0 0f 85 47 02 00 00 83 3d 45 d0 83 04 00 75 13 48 8d 3d c8 1f 87 04 48 c7 c6 40 f7 ec 8b <67> 48 0f b9 3a 90 e9 75 ee ff ff 90 0f 0b 90 e9 48 f2 ff ff 90 0f
RSP: 0000:ffffc9000381f5c0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: ffff8880321a0000
RDX: 0000000000000000 RSI: ffffffff8becf740 RDI: ffffffff905b11d0
RBP: ffffc9000381f758 R08: ffffffff9057c243 R09: 1ffffffff20af848
R10: dffffc0000000000 R11: fffffbfff20af849 R12: ffff88803476a010
R13: 0000000000000000 R14: 1ffff92000703ecc R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888125049000(0063) knlGS:0000000057754480
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00000000f741be8c CR3: 000000007d7a2000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 as102_stream_ctrl+0x27/0xc0 drivers/media/usb/as102/as102_drv.c:259
 dvb_frontend_open+0x7e2/0x1410 drivers/media/dvb-core/dvb_frontend.c:2825
 dvb_device_open+0x24f/0x340 drivers/media/dvb-core/dvbdev.c:109
 chrdev_open+0x4d9/0x600 fs/char_dev.c:411
 do_dentry_open+0x816/0x1380 fs/open.c:947
 vfs_open+0x3b/0x340 fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x2e44/0x3830 fs/namei.c:4863
 do_file_open+0x23e/0x4a0 fs/namei.c:4892
 do_sys_openat2+0x115/0x200 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_compat_sys_openat fs/open.c:1436 [inline]
 __se_compat_sys_openat fs/open.c:1434 [inline]
 __ia32_compat_sys_openat+0x131/0x160 fs/open.c:1434
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
 do_int80_emulation+0x19a/0x550 arch/x86/entry/syscall_32.c:172
 asm_int80_emulation+0x1a/0x20 arch/x86/include/asm/idtentry.h:598
RIP: 0023:0xf71374eb
Code: 57 56 53 8b 44 24 14 f6 00 08 75 23 8b 44 24 18 8b 5c 24 1c 8b 4c 24 20 8b 54 24 24 8b 74 24 28 8b 7c 24 2c 8b 6c 24 30 cd 80 <5b> 5e 5f 5d c3 5b 5e 5f 5d e9 f7 a1 ff ff 66 90 66 90 66 90 90 53
RSP: 002b:00000000ff9eefcc EFLAGS: 00000246 ORIG_RAX: 0000000000000127
RAX: ffffffffffffffda RBX: 00000000ffffff9c RCX: 00000000ff9ef090
RDX: 0000000000000802 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
----------------
Code disassembly (best guess):
   0:	c2 57 90             	ret    $0x9057
   3:	48 c1 e8 03          	shr    $0x3,%rax
   7:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
   b:	84 c0                	test   %al,%al
   d:	0f 85 47 02 00 00    	jne    0x25a
  13:	83 3d 45 d0 83 04 00 	cmpl   $0x0,0x483d045(%rip)        # 0x483d05f
  1a:	75 13                	jne    0x2f
  1c:	48 8d 3d c8 1f 87 04 	lea    0x4871fc8(%rip),%rdi        # 0x4871feb
  23:	48 c7 c6 40 f7 ec 8b 	mov    $0xffffffff8becf740,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	90                   	nop
  30:	e9 75 ee ff ff       	jmp    0xffffeeaa
  35:	90                   	nop
  36:	0f 0b                	ud2
  38:	90                   	nop
  39:	e9 48 f2 ff ff       	jmp    0xfffff286
  3e:	90                   	nop
  3f:	0f                   	.byte 0xf


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
