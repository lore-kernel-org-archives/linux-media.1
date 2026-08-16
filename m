Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDAA4B04B9
	for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 13:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786888664; cv=none; b=RfuLSskQWxQdSL82bCAIeLCnBvmVloE5Z798g3ebJZEY3k3VXoqcYm5q61LYYACsTQHYvYdQA81N190OcC1JxIyd+UVgs3aJuLNkpOvha+BaQPg/lm0fl7qQoCxJGtu5OkghA1DPJ0UCafbqeuKVPl1IlTDYCx8sz18156JdZJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786888664; c=relaxed/simple;
	bh=MkIPwFwUEvXlgpotKmXi/mA6roiKwnLi8Uop2NPsfWM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=kRD5PurRcHMqDu9Mc6jY7J0EILiA6hMQGjFafQzbfcH2upHAVOrLbU/lyoO9ppJOAEzOEpkN5ruJbJzyZ27Q0CKG1ZGQsOxeZC5xe+PHxnyvUyMQ5k/ueJxzn/OgkqU5JJfAZCPR/yZ+PhhhjAZUqIxOgYdVJe7FoIt4a7laj/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a49f09233fso1604093b6e.0
        for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 06:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786888662; x=1787493462;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5aU6bugQoLbIdYKNHZVm0ke9QxnlsrgCffkUdWwr3ZE=;
        b=F5eio2tDArRRtQz6Jl4NY3s/PXdJJ+Xo3gQrtcqI1vW4NJDYrYSn0CRvspvuD9y4WV
         CwMtYbNmDT+IKQPiNJUVMlrAPr5H4xWYL9ikda2zfDXxxxyxJAcG2tt1ea+7pnTYmbTz
         m8ZbxBc34cZGhAjV1Hft5YgtuBKdgighOPZi/xuASqcAfYZyJ3npM2CkXQm1E6GAdtzZ
         WoqGO6lvF2SRzY4DSW/Twv0OF6iG06e4WmuS/YIZqEtJCWqr8c8bSNJK5PxYpJ6oc8FX
         uF8I+APC6D7TG10fNo+TIglMOiA5rfOpIN/nO5ZqJvGZeMAD7a0GHJ+lSqNwewEUzWCb
         AWoA==
X-Forwarded-Encrypted: i=1; AHgh+RoPd1Sa9HwN2OsGmaKE/aBO/SrlIW+6HV/0eoKGrEv0yfPO2/vB/MziHPhTFbPc6la8D0F8L8kf6gu00w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yztq96ytmQoxnWnxCmWEGl+vxiZU1XPiSdcWK4RPGuiK4sAzC7Y
	xSU/yhI1PPilehSFOCIl1v0NH6MRyAy6edU+9ppyIMHIvoW6To/gV36truVvoMVeOcfUCekkbuP
	E/aBMsyBkEa/lXpFQuVn46cMAeGG9P4Ych07lH7P/r2ddvsfGQn1D1IzP5Lc=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:13d4:b0:4af:9364:b5a9 with SMTP id
 5614622812f47-4b228019344mr17022560b6e.6.1786888662100; Sun, 16 Aug 2026
 06:57:42 -0700 (PDT)
Date: Sun, 16 Aug 2026 06:57:42 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a81c1d6.dbb3a75c.20434b.0033.GAE@google.com>
Subject: [syzbot] [media?] general protection fault in usbtv_querycap
From: syzbot <syzbot+37a57a84893052ab6071@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3eb40771c00a Merge tag 'soc-fixes-7.2-3' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11b7ba79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2ca5f2f2c4197664
dashboard link: https://syzkaller.appspot.com/bug?extid=37a57a84893052ab6071
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15009949580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+37a57a84893052ab6071@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc000000000a: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000050-0x0000000000000057]
CPU: 1 UID: 0 PID: 5878 Comm: syz-executor121 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:usb_make_path include/linux/usb.h:985 [inline]
RIP: 0010:usbtv_querycap+0x9c/0x100 drivers/media/usb/usbtv/usbtv-video.c:612
Code: d9 f9 49 83 c6 08 4c 89 f0 48 c1 e8 03 42 80 3c 20 00 74 08 4c 89 f7 e8 42 3b d9 f9 4d 8b 36 4d 8d 7e 50 4c 89 f8 48 c1 e8 03 <42> 80 3c 20 00 74 08 4c 89 ff e8 25 3b d9 f9 48 83 c3 30 4d 8b 3f
RSP: 0018:ffffc90003757b10 EFLAGS: 00010206
RAX: 000000000000000a RBX: ffffc90003757d60 RCX: 0000000074627375
RDX: 0000000000000006 RSI: ffffffff8cd143a0 RDI: ffffc90003757d70
RBP: 1ffff920006eafb6 R08: 0000000000767462 R09: 1ffff920006eafae
R10: dffffc0000000000 R11: fffff520006eafaf R12: dffffc0000000000
R13: ffff888035e170d8 R14: 0000000000000000 R15: 0000000000000050
FS:  00007f7ef67fc6c0(0000) GS:ffff888125049000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055c7f8b42d51 CR3: 0000000071dc6000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 v4l_querycap+0x236/0x470 drivers/media/v4l2-core/v4l2-ioctl.c:1106
 __video_do_ioctl+0x8af/0xc70 drivers/media/v4l2-core/v4l2-ioctl.c:3133
 video_usercopy+0x860/0x1430 drivers/media/v4l2-core/v4l2-ioctl.c:3475
 v4l2_ioctl+0x18d/0x1e0 drivers/media/v4l2-core/v4l2-dev.c:366
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7efcf7300b
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:00007f7ef67fc120 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000080685600 RCX: 00007f7efcf7300b
RDX: 00007f7ef67fc190 RSI: 0000000080685600 RDI: 0000000000000006
RBP: 0000000000000021 R08: 0000000000000002 R09: 0000000000000000
R10: 00007f7efcfe37e0 R11: 0000000000000246 R12: ffffffffffffffd0
R13: 0000000000000000 R14: 00007ffc6b9d1890 R15: 00007ffc6b9d1978
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:usb_make_path include/linux/usb.h:985 [inline]
RIP: 0010:usbtv_querycap+0x9c/0x100 drivers/media/usb/usbtv/usbtv-video.c:612
Code: d9 f9 49 83 c6 08 4c 89 f0 48 c1 e8 03 42 80 3c 20 00 74 08 4c 89 f7 e8 42 3b d9 f9 4d 8b 36 4d 8d 7e 50 4c 89 f8 48 c1 e8 03 <42> 80 3c 20 00 74 08 4c 89 ff e8 25 3b d9 f9 48 83 c3 30 4d 8b 3f
RSP: 0018:ffffc90003757b10 EFLAGS: 00010206
RAX: 000000000000000a RBX: ffffc90003757d60 RCX: 0000000074627375
RDX: 0000000000000006 RSI: ffffffff8cd143a0 RDI: ffffc90003757d70
RBP: 1ffff920006eafb6 R08: 0000000000767462 R09: 1ffff920006eafae
R10: dffffc0000000000 R11: fffff520006eafaf R12: dffffc0000000000
R13: ffff888035e170d8 R14: 0000000000000000 R15: 0000000000000050
FS:  00007f7ef67fc6c0(0000) GS:ffff888125049000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055c7f8b42d51 CR3: 0000000071dc6000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	d9 f9                	fyl2xp1
   2:	49 83 c6 08          	add    $0x8,%r14
   6:	4c 89 f0             	mov    %r14,%rax
   9:	48 c1 e8 03          	shr    $0x3,%rax
   d:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
  12:	74 08                	je     0x1c
  14:	4c 89 f7             	mov    %r14,%rdi
  17:	e8 42 3b d9 f9       	call   0xf9d93b5e
  1c:	4d 8b 36             	mov    (%r14),%r14
  1f:	4d 8d 7e 50          	lea    0x50(%r14),%r15
  23:	4c 89 f8             	mov    %r15,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	4c 89 ff             	mov    %r15,%rdi
  34:	e8 25 3b d9 f9       	call   0xf9d93b5e
  39:	48 83 c3 30          	add    $0x30,%rbx
  3d:	4d 8b 3f             	mov    (%r15),%r15


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
