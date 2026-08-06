Received: from mail-ot1-f80.google.com (mail-ot1-f80.google.com [209.85.210.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D5828150F
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 00:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785975158; cv=none; b=AQ6sS92Y79Qy4cTt5nAROTNCvo2t/RG9Kh5fN6gNls8qY4WkabLxEnwzS0W6fLNtzfRXmhciogD/2cdVnVvCkecMyDn3f3z7G05zVn0DRzr7NVPM8cHvZ1AMJDPkQh8gU/dOnPbFWxoOnPVSfXPZp0JGzw15CR+ONGeHTgnhfqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785975158; c=relaxed/simple;
	bh=bIALpx1CXVLdDN8p5i5hrudHhkyx+biMnkip5hypfN0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=evIURdZjFg9Z7PJibzGFcK13Tb7zeQNmWFKJ7/AVL0UKpUg44Ygz7ZpnFcMOlATiUu4eQj0x64aKy8woEjKZdjF17uvRaxbiyl0kq6hM9szBoFOrwqmD6pS5bSaHyXS55WE5OTTERYvIqBXAzWHODMf31UJeTaJPoc2SoDDqmZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f80.google.com with SMTP id 46e09a7af769-7ec3b429610so1820249a34.1
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 17:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785975156; x=1786579956;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=780tSsCyIGPFXmHHr+TYr749n1cZQtCj/2NCjvnVRqA=;
        b=Vxl5SdYPEuk+volOd30qtcq7T1ecRJrDXcpXa/d4FKmEx4kTKsm8zTvB1/LoaRx5NI
         LsLwrZvh5P3hBWphdN9KAFXTeqkhnOts5KTrdk/Th2eneTGTWVBFKTV38JXvgy75ZsRo
         Tw2UCUQ1pkEY6htD9mtmgawFHErnFcZEvPdjGlSSQYXgJCiud+NXUdPnqEi8gYVkREfv
         /XglDX8Q+CYHFWG/FjP7kwy1jcNIL+ml3dCiLZsF1go4H9lX7fkDETvn2ZPbnhlPkPCA
         IkHy2nz/WecfTJmTg2jhkjyid5f234kvaTR+Ws9FT48jMHqa57uA+tqNLJ3MnRY7Lpen
         5Sow==
X-Forwarded-Encrypted: i=1; AHgh+Roi9kCDx+iAjOqEzjIMG/dPRtrt1LSEmHf7rer70JA63nmuiSoznwAx9d/bJGTabFQ4ZFRB8MSmDy9MUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqlBBaB5bMLLcirBpEXzW1RG5laqfwyDD2cTPfXZq89kvPWLV5
	QteIMEROHJDgVzBv5VmhXYvHgTkL2pWqyAJl5mx1HEJ/FzR4Ru/F/LjqFL+6Insyi7u++b7a2Qj
	kVmi2j3g3YD2RltEZlnhkyQDVCg/CVMFonuXpiPr3rmuNnkbHdSAqlWIXaHg=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:8187:b0:6aa:1633:7af9 with SMTP id
 006d021491bc7-6ae97038ad5mr5936841eaf.35.1785975155968; Wed, 05 Aug 2026
 17:12:35 -0700 (PDT)
Date: Wed, 05 Aug 2026 17:12:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a73d173.5aeeccc9.207e63.000a.GAE@google.com>
Subject: [syzbot] [media?] INFO: trying to register non-static key in as102_stream_ctrl
From: syzbot <syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    075b74841bd0 Linux 7.2-rc6
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=133e8cc6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=2a3de29133b40e8f69f3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/678e77cc37b9/disk-075b7484.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/cc9f771e7069/vmlinux-075b7484.xz
kernel image: https://storage.googleapis.com/syzbot-assets/71a5d4620b85/bzImage-075b7484.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 0 UID: 0 PID: 8032 Comm: syz.4.881 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 assign_lock_key+0x133/0x150 kernel/locking/lockdep.c:984
 register_lock_class+0xcc/0x2e0 kernel/locking/lockdep.c:1299
 __lock_acquire+0xab/0x2ce0 kernel/locking/lockdep.c:5112
 lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5868
 __mutex_lock_common kernel/locking/rtmutex_api.c:559 [inline]
 mutex_lock_interruptible_nested+0x5a/0x1d0 kernel/locking/rtmutex_api.c:592
 as102_stream_ctrl+0x27/0xc0 drivers/media/usb/as102/as102_drv.c:259
 dvb_frontend_open+0x7eb/0x1410 drivers/media/dvb-core/dvb_frontend.c:2825
 dvb_device_open+0x258/0x350 drivers/media/dvb-core/dvbdev.c:109
 chrdev_open+0x4dc/0x600 fs/char_dev.c:411
 do_dentry_open+0x849/0x1420 fs/open.c:947
 vfs_open+0x3b/0x350 fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x2e60/0x3850 fs/namei.c:4863
 do_file_open+0x23e/0x4a0 fs/namei.c:4892
 do_sys_openat2+0x115/0x200 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5093cae84e
Code: 08 0f 85 a5 a8 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 80 00 00 00 00 48 83 ec 08
RSP: 002b:00007f50916bdb28 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f50916be6c0 RCX: 00007f5093cae84e
RDX: 0000000000000802 RSI: 00007f50916bdc00 RDI: ffffffffffffff9c
RBP: 00007f50916bdc00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: cccccccccccccccd
R13: 00007f5093f763f8 R14: 00007f5093f76360 R15: 00007ffc19dbf768
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
