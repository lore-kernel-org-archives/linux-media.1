Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAD626ED37
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 16:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787241943; cv=none; b=Ze5gz62TkYPai+53GqHTX6+wULJ7EpsjU1joOzHDIEDGX99Nhli70+Ri8MJc3bTgEiqGTO3YrZ5t2pml0gQgp726EZ3xVjaiu3zNC76Dkm42gUIIReOhx86hcgpLho374U9W25OWqSunx0ECjsLIwiXyJCKonut4n79kRxXM1tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787241943; c=relaxed/simple;
	bh=5e7nHEM/cDlfbvo/6NNVswNFgQ2FsKRPmj7kvW8cfAc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IWR9kZ75EISm4X71CSehD/zgQ3x6R24OX6TE9qiLUsmpHtUExm/CTvo4UMVw3Fyq1D/iai5vNNqa1KWaQlIUTUTiRco6ePkTPbQcBxlHt0d3FS98/Vc9kB4mcQfFoJtgY5/BtF9Nu804Cdo3QKUYXW0LDz2fRLr7NMS/8Oit6ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f6.google.com with SMTP id 006d021491bc7-6b132681374so17942eaf.1
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 09:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787241941; x=1787846741;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60nhiiMCao6jsYmfg5q7r/1mx5JitrmG3naN6T23jUY=;
        b=g/RfjER8vHSVe9N4Gsb8UHY+xbjK0X6zLM+xUn+JyDuuEhtXVLHOFITSE8TvEemdhW
         6GeUKOm7H9C2x2ICabp7UE4y2NtsrSuDrCn4QRW92ndyLXkoTkzdwJNxzwm9iDEKqp1D
         Y/Z9/WNgYiMbOrOq8coOl4LaQUMv/RJkLP+KiXwUBcrwJqPP140U+Us/uRRtMqa0DMIX
         AJLfgXBS8zdxG6k4juvi79/yPC9pUjmUHTgXB6WUDd5u+xBvegUulTOCbQa+dXtLoyKu
         MsWM2hl5IQp8+TQvHpwuZYPlagS8wepFZPxCM3z9aD4uuQCT2lf3oxHchZ0ezP0pZlN+
         1Ajw==
X-Forwarded-Encrypted: i=1; AHgh+RqsmTQPDo1GePZBDudqMNQwJNHa9HRXlEKBAnzHb5wU7kS+fPZtxjHuO2lHgqmfU6xF1zqLDyNzt2p49A==@vger.kernel.org
X-Gm-Message-State: AOJu0YypuidDV1vnM/t+cgIY0Sq05gBmV77mo3+4usiMyX4bTkIdbNxs
	mTr5ejQC7MQBySj/22MNifBt7A5XqOJl4JLSmmTtJBn9PqgnNYIlV5lQXMEH44ntNEs896BqniX
	JSvzOi4K3nx104yYnJlXAq1ELM+PdTVj226pRFsD+qJUVE876RkjgoYSp/xM=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:818e:b0:69e:b8:ffe4 with SMTP id
 006d021491bc7-6b13c65ceb9mr13338872eaf.32.1787241941142; Thu, 20 Aug 2026
 09:05:41 -0700 (PDT)
Date: Thu, 20 Aug 2026 09:05:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8725d5.4d75e56a.c9a88.0043.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in
 __vb2_queue_cancel (2)
From: syzbot <syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	m.szyprowski@samsung.com, mchehab@kernel.org, syzkaller-bugs@googlegroups.com, 
	tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f4cdf7ca9a1f Merge tag 'media/v7.3-1' of git://git.kernel...
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=10a10e79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e4b57019f58edf16
dashboard link: https://syzkaller.appspot.com/bug?extid=dd0f06181ab66b93dc00
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a10e79580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/865d16295f11/disk-f4cdf7ca.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/71f476ad78fc/vmlinux-f4cdf7ca.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e19d5dbdc9b7/bzImage-f4cdf7ca.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com

 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 30 Comm: kworker/1:2 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Workqueue: events request_module_async
RIP: 0010:__wake_up_common+0x9b/0x1f0 kernel/sched/wait.c:104
Code: 02 00 0f 85 5b 01 00 00 48 8b 5b 40 48 8d 43 e8 4c 39 fb 0f 84 b3 00 00 00 48 ba 00 00 00 00 00 fc ff df 48 89 d9 48 c1 e9 03 <80> 3c 11 00 0f 85 18 01 00 00 48 bd 00 00 00 00 00 fc ff df 4c 8b
RSP: 0018:ffffc90000a679c0 EFLAGS: 00010056
RAX: ffffffffffffffe8 RBX: 0000000000000000 RCX: 0000000000000000
RDX: dffffc0000000000 RSI: 0000000000000003 RDI: ffff8880283e5790
RBP: ffff8880283e5790 R08: 0000000000000000 R09: fffff5200014cf2f
R10: 0000000000000003 R11: 00000000000075ab R12: 0000000000000003
R13: 0000000000000000 R14: 0000000000000000 R15: ffff8880283e57d0
FS:  0000000000000000(0000) GS:ffff888123ccc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f764d56ae9c CR3: 000000002a6c6000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 __wake_up_common_lock kernel/sched/wait.c:125 [inline]
 __wake_up+0x31/0x60 kernel/sched/wait.c:146
 __vb2_queue_cancel+0x348/0xe90 drivers/media/common/videobuf2/videobuf2-core.c:2244
 vb2_core_queue_release+0x27/0x190 drivers/media/common/videobuf2/videobuf2-core.c:2677
 vb2_queue_release drivers/media/common/videobuf2/videobuf2-v4l2.c:943 [inline]
 vb2_video_unregister_device drivers/media/common/videobuf2/videobuf2-v4l2.c:1279 [inline]
 vb2_video_unregister_device+0x152/0x2e0 drivers/media/common/videobuf2/videobuf2-v4l2.c:1254
 em28xx_v4l2_init.cold+0xe1a/0x3a18 drivers/media/usb/em28xx/em28xx-video.c:3097
 em28xx_init_extension+0x13a/0x200 drivers/media/usb/em28xx/em28xx-core.c:1248
 request_module_async+0x1e/0x30 drivers/media/usb/em28xx/em28xx-cards.c:3685
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__wake_up_common+0x9b/0x1f0 kernel/sched/wait.c:104
Code: 02 00 0f 85 5b 01 00 00 48 8b 5b 40 48 8d 43 e8 4c 39 fb 0f 84 b3 00 00 00 48 ba 00 00 00 00 00 fc ff df 48 89 d9 48 c1 e9 03 <80> 3c 11 00 0f 85 18 01 00 00 48 bd 00 00 00 00 00 fc ff df 4c 8b
RSP: 0018:ffffc90000a679c0 EFLAGS: 00010056
RAX: ffffffffffffffe8 RBX: 0000000000000000 RCX: 0000000000000000
RDX: dffffc0000000000 RSI: 0000000000000003 RDI: ffff8880283e5790
RBP: ffff8880283e5790 R08: 0000000000000000 R09: fffff5200014cf2f
R10: 0000000000000003 R11: 00000000000075ab R12: 0000000000000003
R13: 0000000000000000 R14: 0000000000000000 R15: ffff8880283e57d0
FS:  0000000000000000(0000) GS:ffff888123ccc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f764d56ae9c CR3: 000000002a6c6000 CR4: 0000000000350ef0
----------------
Code disassembly (best guess):
   0:	02 00                	add    (%rax),%al
   2:	0f 85 5b 01 00 00    	jne    0x163
   8:	48 8b 5b 40          	mov    0x40(%rbx),%rbx
   c:	48 8d 43 e8          	lea    -0x18(%rbx),%rax
  10:	4c 39 fb             	cmp    %r15,%rbx
  13:	0f 84 b3 00 00 00    	je     0xcc
  19:	48 ba 00 00 00 00 00 	movabs $0xdffffc0000000000,%rdx
  20:	fc ff df
  23:	48 89 d9             	mov    %rbx,%rcx
  26:	48 c1 e9 03          	shr    $0x3,%rcx
* 2a:	80 3c 11 00          	cmpb   $0x0,(%rcx,%rdx,1) <-- trapping instruction
  2e:	0f 85 18 01 00 00    	jne    0x14c
  34:	48 bd 00 00 00 00 00 	movabs $0xdffffc0000000000,%rbp
  3b:	fc ff df
  3e:	4c                   	rex.WR
  3f:	8b                   	.byte 0x8b


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
