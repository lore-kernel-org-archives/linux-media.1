Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CD236194B
	for <linux-media@vger.kernel.org>; Sun,  9 Aug 2026 19:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786302870; cv=none; b=jGf+F8ZNoG11+0FayOKudXLieVK1VC6wMDq2z7YtP7Fb3PLiEKq8SS/AadyQhBMjvRioUhC1mjk+4L81Gvv8s+aoNQMLVDxJvPEtsJAeXoSr627JRy22+7AX7AEgZRUkhkLACYcBgiRT+m3878OR2u09wyx5FFvANnUh/xthhxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786302870; c=relaxed/simple;
	bh=inVp4lkkd6S91tQazlG6T3bMMdwCh0aZ0La5KIWq6Ls=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=OYLBcayylCU7Nel/M2Y0Ssg4b3z7/2/bn+aobEj9YM4njkEpzr55icDdG8Pwlbi9fj4M0+d/aLSbnBPba2lJCEzktmbtzOFghLfRElP+byLgMCVUdIbcRig6WJuYdzMB8jywYD1EPTxDWjn0tfICx4+fN5A+JGW4rF0oQAtgx30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-6acbcb92d31so831897eaf.1
        for <linux-media@vger.kernel.org>; Sun, 09 Aug 2026 12:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786302865; x=1786907665;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GidNn0OMKrjDQ21kBazeerlBT2Ktqq4wU0/ri2a78Bk=;
        b=E+6G+xSTKjJzwAHluLNFX/Bz8qt7pyqg2+5mZo5d37EqhZEDXVpWnxTOGQhEfajQay
         vo12Wdx2Tg2MDaBqCSeQ8n67a83XDBmtRwoHVyJGlgscA7HqrXnBqj28g9VnNjae8azc
         drfqfz4CcEzmndkJVL7m7LUnGH3F/2+4Eii2FQ5T7W9qsFMlTb5kym95lYDlz6j9PeVP
         8aAjtFZDmm8NvksDLbZVqGmCcZuU4R7OiAtAmG9VyHbWxTaFyUs4gapNSWcQHQtQeik2
         nkNPmc1RjKd6Gjzf5MpYN7Rl2DD/49AAd5BbrLy3+yztCszCTUQ2t9RPlhvqBhi+Q0w6
         Ly0w==
X-Forwarded-Encrypted: i=1; AHgh+RobTLK1dI8g2vJu8JmyxHKel9bDuO+G5fmtV9DxAo2MQYUVtQnPexHcGJ+nzpMfIipCJIYT8aQ/owVmrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHMV4RnlrE4lhBPmrOzn4FzQCJ0SC0cCjvOOeFfFli09aUAvuF
	jxkTz5EcaVrOgQd5DfesI+aLi7gicoNRsQvVDYOCEvlDe9YFvyg0vktk0htxZPUl/VQiXUnZ9sM
	ynH1FUgS3JPCCYEWiNao4DhFeEyNJsNXdan/RqLB3kdwplHZkxo7XBhlQTOo=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1990:b0:6ae:84e6:2de0 with SMTP id
 006d021491bc7-6b042143dd7mr7749464eaf.26.1786302865071; Sun, 09 Aug 2026
 12:14:25 -0700 (PDT)
Date: Sun, 09 Aug 2026 12:14:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a78d191.b50370da.49fe0.0041.GAE@google.com>
Subject: [syzbot] [media?] [dri?] WARNING in udmabuf_create
From: syzbot <syzbot+bfeed181d1ce9ec87a8f@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	kraxel@redhat.com, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, 
	vivek.kasireddy@intel.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6b8c8af514d7 Add linux-next specific files for 20260807
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10b34149580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6d343b54cc50df0f
dashboard link: https://syzkaller.appspot.com/bug?extid=bfeed181d1ce9ec87a8f
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11e8c079580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/71ff4edcb608/disk-6b8c8af5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1f5fa331d8f2/vmlinux-6b8c8af5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f993558ec63b/bzImage-6b8c8af5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+bfeed181d1ce9ec87a8f@syzkaller.appspotmail.com

------------[ cut here ]------------
!(flags & __GFP_NOWARN)
WARNING: mm/slub.c:7013 at __kvmalloc_node_noprof+0x792/0x820 mm/slub.c:7013, CPU#1: syz.0.17/5840
Modules linked in:
CPU: 1 UID: 0 PID: 5840 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:__kvmalloc_node_noprof+0x792/0x820 mm/slub.c:7013
Code: ff 48 c7 c7 70 f7 c8 8e 48 89 de e8 a8 3d eb 02 e9 1f fc ff ff 48 c7 c7 b0 f7 c8 8e 48 89 de e8 94 3d eb 02 e9 50 fc ff ff 90 <0f> 0b 90 31 db e9 08 fe ff ff 90 0f 0b 90 e9 57 ff ff ff 49 83 7f
RSP: 0018:ffffc900044ffae0 EFLAGS: 00010246
RAX: 0000000000000100 RBX: 0000000000000000 RCX: 0000000080000001
RDX: 0000008000000000 RSI: ffffffff8c4c7660 RDI: ffffffff8c4c7620
RBP: 00000000ffffffff R08: 00000000000028c0 R09: 00000000ffffffff
R10: 0000000000000006 R11: 0000000000000000 R12: 0000008000000000
R13: 00000000000028c0 R14: 0000001000000000 R15: ffffffff865110fc
FS:  0000555557138500(0000) GS:ffff88812500c000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb692c70000 CR3: 0000000079676000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 init_udmabuf drivers/dma-buf/udmabuf.c:193 [inline]
 udmabuf_create+0x2dc/0xf50 drivers/dma-buf/udmabuf.c:386
 udmabuf_ioctl_create drivers/dma-buf/udmabuf.c:465 [inline]
 udmabuf_ioctl+0x1f3/0x300 drivers/dma-buf/udmabuf.c:496
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x510 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb692d9e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc7e6eab08 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fb693025fa0 RCX: 00007fb692d9e0d9
RDX: 0000200000000200 RSI: 0000000040187542 RDI: 0000000000000003
RBP: 00007fb692e35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fb693025fac R14: 00007fb693025fa0 R15: 00007fb693025fa0
 </TASK>


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
