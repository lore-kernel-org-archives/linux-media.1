Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF8C37B02D
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 05:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786426948; cv=none; b=bgfMLinNsgzUEyZqoI5mk0kOyT4klv43eXVn9ye7jhoOgsrweDo+CNAIGtnAULI8GtaxmFSqBO5KvwonTiofFWR7r2kZNVpN1vbK6ZOZAaijwCpE+UetLezEb6aNi6F5ahPz02wVS1+uLmMSzaifvXwl8kMmqnMwxaj6YmaHxoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786426948; c=relaxed/simple;
	bh=10XQL3mdhMI3lZUUlmmbmpigPDtRjF7Ww4N+feMtZRM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=huttcMj6rzuufc7PSRxB87z058y44SWdCuUzt3XThgHEEvOBz39r8f6mgfIECJBlt+w46YWovHjZyuo56s4/IL5phF31RjxzF0neAdLyTGkM+kyaIKIWbIIPVCFlEGwRkT4xBdMsRsxvpkyH+dCcvF249H38+bdKfN9snXAmPL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-48e5de5a23cso1182198b6e.0
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 22:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786426945; x=1787031745;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LKdoiBGPE1jH0hzNIc0VN+CR8Eh8cZz+aCD0MEyYgkw=;
        b=V3daRrshyCPHdwvjrU+IiMmCjIIzIisw+ImNEiXOil2qIRrLkzWFFvhXyeFIUTq5C2
         CjeTqX41bMkjxo6nMXSUlRe/Zf3bfgkDJRAdBLgqCscdzf+NpUu2KLMvQFmnTnsHmxnm
         QRR7v2ioKZumHzFEAtHIuIZN6FgspimeKv7frrNcWpn0B6tGcOWzXb3hOxBSI80ViHm4
         x67jX9jaqVr0R1TcFXJmB+DA1AeOprOtzb0Bmh09HF55ywoI3FV9I5kmiHLKTS+KLKOC
         kIYsHRUTIXXanhzaMwCH0HtWoKjfKXmEBdmgsCr34zJYsm4c5rBPUrik8wlAhMV5lxWL
         B/EQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVFD7CD/1mnqgo9iL1ZGgRIbvRgfhKCeOZT/PoxEB+viugma19ucNRL+khgOmyBUz0mnt5rvEXUR42jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOmxJ2SPa0TmT8zCThOfkuInHE4hgx3XremvuRse1qKMx1Fff8
	tDF1vpUhxjbQZussrCLO1EUGh1E2jiRuMGh8Zpl1zftyLjr57TOGI20khepA0col7a206J08QaI
	Kn62VDpKnxlSGJMbsu5nz1U2ElomHUXeNohB4FINEjV5JB0k64xBp2NO3Isw=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:19a9:b0:4a3:fb6c:9adf with SMTP id
 5614622812f47-4b1fd84fc88mr506257b6e.12.1786426945369; Mon, 10 Aug 2026
 22:42:25 -0700 (PDT)
Date: Mon, 10 Aug 2026 22:42:25 -0700
In-Reply-To: <6a7135a9.d35e88fd.de8b.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7ab641.b50370da.49fe0.0062.GAE@google.com>
Subject: Re: [syzbot] [media?] WARNING in as102_stream_ctrl
From: syzbot <syzbot+ea047a32630b1f47da67@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    3d08ff75a47a Add linux-next specific files for 20260810
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=11fdca9e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5ba0556605934602
dashboard link: https://syzkaller.appspot.com/bug?extid=ea047a32630b1f47da67
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13b01079580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/227afac921c2/disk-3d08ff75.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/236f7cfe0ac3/vmlinux-3d08ff75.xz
kernel image: https://storage.googleapis.com/syzbot-assets/aea89831fd96/bzImage-3d08ff75.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ea047a32630b1f47da67@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: kernel/locking/mutex.c:625 at __mutex_lock_common kernel/locking/mutex.c:625 [inline], CPU#1: syz.3.80/6275
WARNING: kernel/locking/mutex.c:625 at __mutex_lock+0x12d8/0x1550 kernel/locking/mutex.c:821, CPU#1: syz.3.80/6275
Modules linked in:
CPU: 1 UID: 0 PID: 6275 Comm: syz.3.80 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:625 [inline]
RIP: 0010:__mutex_lock+0x12df/0x1550 kernel/locking/mutex.c:821
Code: 2e 59 90 48 c1 e8 03 0f b6 04 18 84 c0 0f 85 47 02 00 00 83 3d 05 ad 7c 04 00 75 13 48 8d 3d 18 a8 7f 04 48 c7 c6 e0 11 ed 8b <67> 48 0f b9 3a 90 e9 75 ee ff ff 90 0f 0b 90 e9 48 f2 ff ff 90 0f
RSP: 0018:ffffc90003e5f680 EFLAGS: 00010246
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: ffff88807f5d1f40
RDX: 0000000000000000 RSI: ffffffff8bed11e0 RDI: ffffffff905c29a0
RBP: ffffc90003e5f820 R08: ffffffff90592e83 R09: 1ffffffff20b25d0
R10: dffffc0000000000 R11: fffffbfff20b25d1 R12: ffff888078e08010
R13: 0000000000000000 R14: 1ffff920007cbee4 R15: 0000000000000000
FS:  000055556341e500(0000) GS:ffff88812500d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc7f45eb7c0 CR3: 00000000324b2000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 as102_stream_ctrl+0x27/0xc0 drivers/media/usb/as102/as102_drv.c:259
 __dvb_frontend_open+0x2e9/0xc40 drivers/media/dvb-core/dvb_frontend.c:2772
 dvb_device_open+0x24f/0x340 drivers/media/dvb-core/dvbdev.c:109
 chrdev_open+0x4d9/0x600 fs/char_dev.c:411
 do_dentry_open+0x816/0x1380 fs/open.c:996
 vfs_open+0x3b/0x340 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x1443/0x1d60 fs/namei.c:5000
 do_file_open+0x23e/0x4a0 fs/namei.c:5029
 do_sys_openat2+0x115/0x200 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_sys_openat fs/open.c:1439 [inline]
 __se_sys_openat fs/open.c:1434 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1434
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x510 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbe1bf5e90e
Code: 08 0f 85 a5 a8 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 80 00 00 00 00 48 83 ec 08
RSP: 002b:00007ffd8f0c6fe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 000055556341e500 RCX: 00007fbe1bf5e90e
RDX: 0000000000000802 RSI: 00007ffd8f0c70c0 RDI: ffffffffffffff9c
RBP: 00007ffd8f0c70c0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: cccccccccccccccd
R13: 00007fbe1c225fac R14: 00007fbe1c225fa0 R15: 00007fbe1c225fa0
 </TASK>
----------------
Code disassembly (best guess):
   0:	2e 59                	cs pop %rcx
   2:	90                   	nop
   3:	48 c1 e8 03          	shr    $0x3,%rax
   7:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
   b:	84 c0                	test   %al,%al
   d:	0f 85 47 02 00 00    	jne    0x25a
  13:	83 3d 05 ad 7c 04 00 	cmpl   $0x0,0x47cad05(%rip)        # 0x47cad1f
  1a:	75 13                	jne    0x2f
  1c:	48 8d 3d 18 a8 7f 04 	lea    0x47fa818(%rip),%rdi        # 0x47fa83b
  23:	48 c7 c6 e0 11 ed 8b 	mov    $0xffffffff8bed11e0,%rsi
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
