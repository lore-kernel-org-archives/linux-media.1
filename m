Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327A31AC45D
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 00:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787358095; cv=none; b=fZXHM0svPVqSRuH0lYLcVEZqRl0YWRszbO+ZpXXCFxrh318cz0IpPlZipA6iZZX6WA4KHs2/EQGzqHNN7qPij1ndm4zyTXyGHMKJCxgFQwMDtkNqZqKj87x3yz8suX7VKKhb3uf9Ym4rchMnMWytRM5X5pbrhW02BlGavhiH8Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787358095; c=relaxed/simple;
	bh=WFizjfAxtHtF8xDkLoONkOXrhTGRZZ9wr/S7KYlftjM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=NaAD5KzsO56rUkeozCkuUbpmZbGuycRXjlkP0tVoh2epM2ZjPfZBBkMgjKjKookZIV4R02Wo7Oi24xwuGFNVL6ZDA9nHgN6oIiOcKI6DSc1EuDeePnvA0hfkXfijMmW+/EEDqt0sXAIqtKetVVMY4NWSc5rufHir836aNkovu/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-4b28d7ffab1so2996279b6e.1
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 17:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787358092; x=1787962892;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KsVuteDhLbNXxIWA6TlR5etP4ibbciESS/QJt7a2Od0=;
        b=o6+9u8nVWYyHdb32tRHgGn3m3Z01w8i56WKWc/+nPdyfamAUsJLCcsh2MDBhCqlkx0
         OAbYfkzokdxfA7w8NcqBBWP/ctvi5fu/ZZ8EMr/Ik4unizV+49+CG0Gp37IhPQRW0MY6
         IEsqbyefTU+CWxZEo8YKjE4Ca1TpiztCWKaZkbHxWLEC4LwGo4yVAiIXw5YDx/OqtaG+
         dDvpswSoW+n2id+eP7oxLYis+gEycrOpBGDIxmdYbPjS3yDN7CUUxQHsBxU67exCD+sl
         NLVssBJudndEK8s5X78qjKZOZXHR8UFUQPrXAWNOEagDgtHhS+Ei3NJmlpw6tGPFhtJv
         BDxA==
X-Forwarded-Encrypted: i=1; AHgh+Rret/jegMemfZcInWY7zzIv/wIPhELSWfTWvtCRqu7UCt80sU4rv74TKVL3/4Nd2JR9btpKHL97fZp+vg==@vger.kernel.org
X-Gm-Message-State: AFuF++m6de7faVASi+BycTL6+jpTnDpRu3Hx8LubBhrOEQ7DWvGi1j1k
	SKH8vXHd6t8IQIx0lnZFaC/IAVnCm49EYrUhs99mkFNO6eMymO/MwaO0mZucd6X5GlqvlL/kzBM
	4GYj+T4b7JMBkvcqrS/HjBVvtP1CSR2bk2uFYKlZUFFc/br4KKGBj0I7w7jQ=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1911:b0:4a4:989:bb1f with SMTP id
 5614622812f47-4b2cdcc4f08mr18034459b6e.9.1787358091862; Fri, 21 Aug 2026
 17:21:31 -0700 (PDT)
Date: Fri, 21 Aug 2026 17:21:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a88eb8b.ae6ddae5.3da009.004b.GAE@google.com>
Subject: [syzbot] [media?] WARNING in vb2_video_unregister_device
From: syzbot <syzbot+f26bc23e42eeb548dee1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	m.szyprowski@samsung.com, mchehab@kernel.org, syzkaller-bugs@googlegroups.com, 
	tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4477a78374a5 Add linux-next specific files for 20260814
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=15cda679580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5042554017b3879d
dashboard link: https://syzkaller.appspot.com/bug?extid=f26bc23e42eeb548dee1
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d1a5728edb0d/disk-4477a783.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3aebe8202fcd/vmlinux-4477a783.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7e9f7367a2bd/bzImage-4477a783.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f26bc23e42eeb548dee1@syzkaller.appspotmail.com

usb 3-1: Decoder not found
em28xx 3-1:1.0: failed to create media graph
em28xx 3-1:1.0: V4L2 device radio0 deregistered
------------[ cut here ]------------
!vdev->queue
WARNING: drivers/media/common/videobuf2/videobuf2-v4l2.c:1264 at vb2_video_unregister_device+0x1f8/0x200 drivers/media/common/videobuf2/videobuf2-v4l2.c:1264, CPU#1: kworker/1:1/44
Modules linked in:
CPU: 1 UID: 0 PID: 44 Comm: kworker/1:1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: events request_module_async
RIP: 0010:vb2_video_unregister_device+0x1f8/0x200 drivers/media/common/videobuf2/videobuf2-v4l2.c:1264
Code: c6 28 4c 89 f0 48 c1 e8 03 80 3c 28 00 4c 8b 24 24 74 08 4c 89 f7 e8 97 0b 09 fa 49 c7 06 00 00 00 00 eb a6 e8 49 90 9a f9 90 <0f> 0b 90 e9 ae fe ff ff 90 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc90000b47990 EFLAGS: 00010293
RAX: ffffffff882d4ce7 RBX: 1ffff1100581b29b RCX: ffff888020ec9f40
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: dffffc0000000000 R08: ffff88802c0d953f R09: 1ffff1100581b2a7
R10: dffffc0000000000 R11: ffffed100581b2a8 R12: ffff88802bb40c00
R13: ffff88802c0d8000 R14: ffff88802c0d94d8 R15: ffff88802c0d8f38
FS:  0000000000000000(0000) GS:ffff8881249ab000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f9b1ded3000 CR3: 000000000ed48000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 em28xx_v4l2_init+0x1c39/0x3150 drivers/media/usb/em28xx/em28xx-video.c:3085
 em28xx_init_extension+0x120/0x1d0 drivers/media/usb/em28xx/em28xx-core.c:1248
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
 kthread+0x38b/0x480 kernel/kthread.c:436
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
