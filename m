Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DB7386579
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 00:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804204; cv=none; b=u9rco9H8EdP04D8biiXFfyYgVaJNymC8UolIAtnbHkE1Dd3OvhXD0I2+zC+ng4Us/kKh3QLOTj3ezge1+7gzJ9s7kwMIXotTpF3LNts8SKhAu3lAU65QtGP3Rr/XGhYoKG3U7+3Eub29UrI22Q1tscZcTaHsDYOsrcB6KkKrHLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804204; c=relaxed/simple;
	bh=SnVqgR+zk+hvDlCS+6/AhN/7PekfGtkmOD3jKdbf2A0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=nj2hZzmpyIXYFi0+OrJbmqVESdULchN1ArAC8T2bZ7OORQuTrtz7p+dtzPuVwIUf+8XITG0n6ahUiCoxC6ZAA05f1KbGYC0U83+4qITQ8WZZinD7wG/N+h0WJuu8nih9q4UGS0X9a0XEbvUtCzVYXpevmWQKv6sRuxasSIIoNgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-49ce04870f8so5287529b6e.0
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 17:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785804202; x=1786409002;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BX7ehIJGJyfP49nhhzQHAYJfl5YPglkal10/oppx1Tw=;
        b=k5WU9NK044w701n8/STnldMmbU11Pb4zvi8Tg+pqSoveFrREjnqWsbLAQSiy/5pirn
         2m4NdsV/y/jKu5IWjjxYuJsrv5+VNAxDt7hgZTNP0i0F4VXJY0Z+de0Cz95JY5eiOEZr
         xkWi8ccoO3SXucPibIAQSTg1fKVieBZNoAvz7c3oqklnvREbXups1/8bfU8cubrxEpPd
         v6/fEm8Bd+6rAZKM71W2MAxdK4TCCgWsgNKHJhgXx0RRXasNpHro98/8vQKP9i9ZlTlU
         Kk14nrTSajjWwJEWKXElwKYZbaGnxJrCdOIQ/REwVFjjZ5podCcBJBc6+C+yUC1afuJC
         xN+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq3WRSPwbz/0ftWHwBcVoTMpCfhnpVjAZ9lLG5SP3+HqKwbjHK5fbJE2GpQg15aXNvMZ800EQxh3yl1Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAnFf79+GR6jVyrayqYjr8igZnVjBOrTEJ0z6NekmW9ywgBY29
	1AxnX+iYSbN+/GAp4BxI4E2+qw5F4hgNkUlOG+kAYjzjBU1UnwKD1xTu4OwMk8ZfvxdnYFaMN9p
	4JhNs5mBGhDzOUsZojHwB0U2kwqSWQiOiAXjgE4hWAA3Mlr9vYSe6e8PLqyw=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2291:b0:490:315d:e0d5 with SMTP id
 5614622812f47-4af5e251641mr18787129b6e.16.1785804201934; Mon, 03 Aug 2026
 17:43:21 -0700 (PDT)
Date: Mon, 03 Aug 2026 17:43:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7135a9.d35e88fd.de8b.0004.GAE@google.com>
Subject: [syzbot] [media?] WARNING in as102_stream_ctrl
From: syzbot <syzbot+ea047a32630b1f47da67@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    075b74841bd0 Linux 7.2-rc6
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1584d3b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=ea047a32630b1f47da67
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1dc04730d019/disk-075b7484.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d76da42271f4/vmlinux-075b7484.xz
kernel image: https://storage.googleapis.com/syzbot-assets/07b1cdbcbe45/bzImage-075b7484.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ea047a32630b1f47da67@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: kernel/locking/mutex.c:625 at __mutex_lock_common kernel/locking/mutex.c:625 [inline], CPU#0: syz.0.181/6386
WARNING: kernel/locking/mutex.c:625 at __mutex_lock+0x947/0x1bd0 kernel/locking/mutex.c:821, CPU#0: syz.0.181/6386
Modules linked in:
CPU: 0 UID: 0 PID: 6386 Comm: syz.0.181 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:625 [inline]
RIP: 0010:__mutex_lock+0x94e/0x1bd0 kernel/locking/mutex.c:821
Code: 0f b6 14 11 38 d0 7c 08 84 d2 0f 85 c6 10 00 00 44 8b 35 c5 b6 65 05 45 85 f6 75 13 48 8d 3d a9 14 69 05 48 c7 c6 00 d9 cf 8b <67> 48 0f b9 3a 90 e9 18 f8 ff ff 4d 8d a7 e8 0a 00 00 4c 89 e7 e8
RSP: 0018:ffffc900102cf670 EFLAGS: 00010246
RAX: 0000000000000003 RBX: ffff8880223a6010 RCX: 1ffffffff2245754
RDX: 0000000000000000 RSI: ffffffff8bcfd900 RDI: ffffffff91261890
RBP: ffffc900102cf7e0 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  00007febfa3f06c0(0000) GS:ffff888123dd8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007febfa3efff8 CR3: 00000000551cb000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 as102_stream_ctrl+0x28/0xd0 drivers/media/usb/as102/as102_drv.c:259
 dvb_frontend_open+0x220/0x16d0 drivers/media/dvb-core/dvb_frontend.c:2825
 dvb_device_open+0x270/0x3b0 drivers/media/dvb-core/dvbdev.c:109
 chrdev_open+0x234/0x6a0 fs/char_dev.c:411
 do_dentry_open+0x6ab/0x14d0 fs/open.c:947
 vfs_open+0x82/0x3f0 fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x2873/0x4280 fs/namei.c:4863
 do_file_open+0x20e/0x430 fs/namei.c:4892
 do_sys_openat2+0x10f/0x1e0 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7febfcd5e84e
Code: 08 0f 85 a5 a8 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 80 00 00 00 00 48 83 ec 08
RSP: 002b:00007febfa3efb28 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007febfa3f06c0 RCX: 00007febfcd5e84e
RDX: 0000000000000800 RSI: 00007febfa3efc00 RDI: ffffffffffffff9c
RBP: 00007febfa3efc00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: cccccccccccccccd
R13: 00007febfd0264e8 R14: 00007febfd026450 R15: 00007ffd17b66708
 </TASK>
----------------
Code disassembly (best guess):
   0:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   4:	38 d0                	cmp    %dl,%al
   6:	7c 08                	jl     0x10
   8:	84 d2                	test   %dl,%dl
   a:	0f 85 c6 10 00 00    	jne    0x10d6
  10:	44 8b 35 c5 b6 65 05 	mov    0x565b6c5(%rip),%r14d        # 0x565b6dc
  17:	45 85 f6             	test   %r14d,%r14d
  1a:	75 13                	jne    0x2f
  1c:	48 8d 3d a9 14 69 05 	lea    0x56914a9(%rip),%rdi        # 0x56914cc
  23:	48 c7 c6 00 d9 cf 8b 	mov    $0xffffffff8bcfd900,%rsi
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
