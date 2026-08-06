Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5103E1203
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 08:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004129; cv=none; b=GV3Dgw8wCj3vE84TpOCQvskwt1BOKelaX0WTq9YMAHjCjDTFSM3qqN1oAmHDSGgPWYrXUINc61v4U0Z/2lQVxABdEQXOIFFJYmdO01Iz1tKwah24rHqRurBQisbC5Fgrb+fNDYxjbL0IuatNm1f+X0D5YOEhOc7kz09Dv7f3NyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004129; c=relaxed/simple;
	bh=a1h1x1ZAeIHmmSfmBegnr5YouoKxVRGT+g+JQH6cIfQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=A8iEHQDoIa1M/iOXmZGGktE15pGVCnjyP3SaG9rooVzXiDPjvh/8wrmGy/XAcYPGVmrhje2euY49WXzgvLDyMgqprFEaIB1XRA5sHoixelILYdhwtDvYL1WoipBooPq0EgdvTy/1VCsYhfFwSCrKghNKsI8w1Jj4XIRTYDHgsfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-48e5de5a23cso1008498b6e.0
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 01:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786004127; x=1786608927;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZZmP7CGnY8dLE5xsAqpL3r/njAWOqQxros44KpaNhUk=;
        b=cItmFkkKqlXyzmRfStHiqgZR34ZxQJPhBU4IgnxL2J3zwObFjb5Lk59n1jKYPp2zx/
         WAWkA1PxbB0r3T12BmYx8QXWkJlBP0eQzM5SkGfZJH1LpatrQBYA7Mhz4YUm2YLqn5w5
         vo7uxEg1+0AY6jo4wJkegSq0x3tYVgBs8fnaHJiNaDW0CHDEcUbOnn6cgjQgZp9XkIj6
         8acHndWe49Xx6vWuKM0ngE7hh8V1rkZEKuRh0gVM2bXvtUIjzoWvcOGvnDYLdwM2l0me
         1CH4wgBemM+P4jCWa3QqXqUy3ojGJbGns2Y/TL9rlybjSllDpX31gnWuZ+G65VVKT2wP
         bgUg==
X-Forwarded-Encrypted: i=1; AHgh+RqdECm7xIAtI2DXwqg7xQe7K785gYbwoAKmQhHV5rrQJ3DvFk6oItwm+GGXMDZL8r33Odmim2C5PA6dRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP54m9zgSg/zYwXQvwBuMpkgeQYS8FbaZX/z1ro3aT/dgp1fmy
	194gqLZNCu5Cr33R0AlZ8eAB5IeJE0/bNONruqD0OWiOleZk0YSIxL4geW/c/oBeMLAdAa5nRPK
	DOzgcESMtYWIo0GWfz45bU5aqi6huaZjsoQdH3t9bqzn+fmCOROe39hI4xDk=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c90:b0:69e:42fd:4070 with SMTP id
 006d021491bc7-6ae96c56124mr6788134eaf.8.1786004127035; Thu, 06 Aug 2026
 01:15:27 -0700 (PDT)
Date: Thu, 06 Aug 2026 01:15:27 -0700
In-Reply-To: <6a73d173.5aeeccc9.207e63.000a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a74429f.9c11d2ce.289b96.0097.GAE@google.com>
Subject: Re: [syzbot] [media?] INFO: trying to register non-static key in as102_stream_ctrl
From: syzbot <syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    0d8395707651 Merge tag 'soc-fixes-7.2-2' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14458e49580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=2a3de29133b40e8f69f3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16e3bcc6580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e2598164f27a/disk-0d839570.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/20273f2393d5/vmlinux-0d839570.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8ad5a994ee24/bzImage-0d839570.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 0 UID: 0 PID: 6396 Comm: syz.0.92 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
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
RIP: 0033:0x7f17899ae90e
Code: 08 0f 85 a5 a8 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 80 00 00 00 00 48 83 ec 08
RSP: 002b:00007f1788fc9b28 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f1788fca6c0 RCX: 00007f17899ae90e
RDX: 0000000000000802 RSI: 00007f1788fc9c00 RDI: ffffffffffffff9c
RBP: 00007f1788fc9c00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: cccccccccccccccd
R13: 00007f1789c763f8 R14: 00007f1789c76360 R15: 00007ffcf12b1158
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
