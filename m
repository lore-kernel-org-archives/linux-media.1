Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC20369D61
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786471477; cv=none; b=eDYB5ixc9L1CMdiXrVBx19/TiVkI/cZlebqddQP0g1kdYJNYer9Jr4sL4SwXD6E9xSYNusMAl+AI9/isV8abizlgAgi2lMIYxNUvP3spRGnFqmsLcQi7aYRyaj7DrVPf4sCAWyxm17Id4pHoM4+DcRr2ua/VcyKSsvN7qM2QhNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786471477; c=relaxed/simple;
	bh=3LfJcf/I7r34fKnR61q+T2UM+9UDeTYTUNglB/YxzP4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=AmoeeYSiC8EAvrO+OamR5ulge9AFa6Cex0OubxQmhzFbadKcDCcqcvQTYrguEiSPDjp7k1H7sosUoHCVVqWh+OJeVfSQgQd6MDpsA1Tc//XjCu4zxSn6B7E7yN2OnErvbVZcpwf4yq/WtT7Yv9WFKYgDvM2m8O+ki5cRQhFgFsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-495f637105eso189717b6e.2
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 11:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786471475; x=1787076275;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=teFiCEIoGwwbZEhr4hiDgc+M9MDZOQwVIuSpUDKMWmY=;
        b=bc2ABpEW82p+D64zTYq8dsHUA3Fjvg+bKdg7Lc2nG8IM/tE1VIFbUuLKOzzz3IKvX6
         MP9x+AVoC5GSEBMTQcgzqr0rW6h3GrlGQlo4AOTQ1aCquIyIeBTamSiZLtQQsX9/+rY9
         3J0FSB1ujkAAuJsDa6WPMHEC+JhVzZFE0LFgG7YAm1uZUcSvxglTXbbNp3RDrq7gXQNQ
         yHKE2qyXV/r7oGS1UQUpnyaMbeyZSb0mNsCCbuqux7xEWT7A+SprH3gitM1yWTaUznu8
         F0e9kYJErgF3E4gYOe1xvaD6GXksBrwDtYDp47qNr4kxJYGpz+Y4HxDQ5OrQAmPvhBD9
         H3Kg==
X-Forwarded-Encrypted: i=1; AHgh+RrAmlPNRaAeJPaE6oXHaKaVROR2ebiE7SkUPTl2sYJQC12y0YFPuVn6h6VoNox6Sl42fxJIv3uJWMM4IQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjCT0QQTH77fAOkxFiwd9pYLjhtSKS6jaKMLi3gRKPtA0jULLZ
	3hCs1gbGQREISa1s9d6xnYkj0fegLh+0KnIrmMqWQyXdvhb6GDNiIq+PYndNp4J+VLhH3YpvOzP
	8MmD1aiDXOaZm6ESBFAxxUQAIkL9U1HLXH0gLfHBUwvNtWIt+ZyHdCj8PB5U=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4feb:b0:492:3ed0:9073 with SMTP id
 5614622812f47-4b209a4e473mr1516905b6e.4.1786471474903; Tue, 11 Aug 2026
 11:04:34 -0700 (PDT)
Date: Tue, 11 Aug 2026 11:04:34 -0700
In-Reply-To: <6a73d173.5aeeccc9.207e63.000a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7b6432.ed659fcc.23056a.007c.GAE@google.com>
Subject: Re: [syzbot] [media?] INFO: trying to register non-static key in as102_stream_ctrl
From: syzbot <syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    d58772d8520c Merge tag 'regmap-fix-v7.2-rc7' of git://git...
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=177da879580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=158601bb8cb292dd
dashboard link: https://syzkaller.appspot.com/bug?extid=2a3de29133b40e8f69f3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15ba92c6580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11397879580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1cadbedb5362/disk-d58772d8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/227925db8202/vmlinux-d58772d8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/23ed8848c469/bzImage-d58772d8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 0 UID: 0 PID: 7688 Comm: syz-executor247 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
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
RIP: 0033:0x7f7c03271f8e
Code: 08 0f 85 65 e1 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 90 41 57 41 56 4d 89 c6 41 55 4d 89 cd 41 54 55 53 48 83 ec 08
RSP: 002b:00007f7c031acd08 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f7c031ad6c0 RCX: 00007f7c03271f8e
RDX: 0000000000000802 RSI: 00007f7c031acdc0 RDI: ffffffffffffff9c
RBP: 00007f7c031acdc0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: cccccccccccccccd
R13: 0000200000000100 R14: 00002000000004c4 R15: 00002000000004c0
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
