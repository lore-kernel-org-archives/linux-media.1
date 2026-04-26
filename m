Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1E0187346
	for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 00:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777162961; cv=none; b=vAyqUx11VO1OjwSbMx8ui8Cvp6c3CjeRGOb9w6KhOwX/mAMSLwSf+bgddOCdlVcfV4/RpEhtKEAxspk2m3hOAGNKoGKMt7Bf9T+259UCOcpwMhIUa8iTqdB4TKg5f03xPwyGbeXdTBOyxyQRLlXP2dN0oYXzfhI0pw/+zMoru1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777162961; c=relaxed/simple;
	bh=WC0yS2RjY0llA/JyoM//jDlmFlQgInuDDBg8QRl+beI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bI3ejNXuLKy0vwedb7nmeHwHt7hOu+oHkCxI/v4bHBQQq5JRCXtK7Zphl7+JPBNxKJrbFE8ducXwbdlkYKDN/1PN+PN38xjPi1OqJwYW9goRSnlTGdqZ9QqCgM65Sk0kWj0uPcGpTI+9+feNaQnUgkDeHfpd1TV+HYR7Jfs3Vhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-694885643e1so12419670eaf.3
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 17:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777162958; x=1777767758;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tgb+pnNi01+0iTdNJ76I2ejbdSo1gSLQ+9z5prEdm44=;
        b=cRGFtX0X557SQEnu66mNGzk29k1MmLBaV+c8pM+xBuyPk8qMo2utWkPNaBiA6opB8l
         siSRftmhGnTuZ8s+LKGz5UurnbJm4NMK3DSe3isLkyMMR+0N69mkwyFShT5H5KRUeOV3
         t4dDlQpeq8DNLN18dUbUVR9H3FXsXLboEhK47sS2EYzW5QoD1zDajLcqfeo9LdYg6lZf
         zn0TnC0+CgJaLXazapSFATnMAaa40jQACl1FNWAfkHeK/cgIpT9JLQBMytrBzXMmOjs9
         EZuw2Vs2Ax/0qdu47otI24rI56m8CSNNtQ2ewDF0HpE2wnMzHCTicR4Q9fc409Ircalg
         wkYg==
X-Forwarded-Encrypted: i=1; AFNElJ9gwIQBifD0gHbXo4dymOTaT/UIOn4OjeoG22N28M9UZj/hBbQKPKRLlxgASsrynl3q9RsEk6iFW5kYEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfL1lkZqnD195knPVAWGDomANyq/Xp/zl2YyG8ZBeGmuFzXWor
	T0Klqd1/eQVFxP+RbXSBd6R0o1RpGtA+/DVNtnEcBZQvCneYcoYclbHcoqTwu43XppapX9/iTE8
	WN0po1f9geLoyN5Cp/tnZznxp8PQL8Av+/ysrxGTe8Teyys/Z+yhzAaLktDs=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:829:b0:696:2264:e1 with SMTP id
 006d021491bc7-69622640544mr5921020eaf.25.1777162958710; Sat, 25 Apr 2026
 17:22:38 -0700 (PDT)
Date: Sat, 25 Apr 2026 17:22:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69ed5ace.170a0220.11de9.000b.GAE@google.com>
Subject: [syzbot] [media?] memory leak in dvb_dmxdev_add_pid
From: syzbot <syzbot+ba83b7db8e644b8b7c19@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    27d128c1cff6 Merge tag 'trace-ring-buffer-v7.1-3' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=126522ce580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9645c21cfd1d3e8f
dashboard link: https://syzkaller.appspot.com/bug?extid=ba83b7db8e644b8b7c19
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=108352d2580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=166522ce580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7aa00f1165c2/disk-27d128c1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/bba58839d563/vmlinux-27d128c1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6b9d69ada8d6/bzImage-27d128c1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ba83b7db8e644b8b7c19@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88810b771800 (size 32):
  comm "syz.0.17", pid 5923, jiffies 4294942824
  hex dump (first 32 bytes):
    02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    08 00 56 05 00 c9 ff ff 08 00 56 05 00 c9 ff ff  ..V.......V.....
  backtrace (crc 1a56a8d7):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __kmalloc_cache_noprof+0x371/0x480 mm/slub.c:5410
    kmalloc_noprof include/linux/slab.h:950 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    dvb_dmxdev_add_pid+0x9c/0x160 drivers/media/dvb-core/dmxdev.c:897
    dvb_dmxdev_pes_filter_set drivers/media/dvb-core/dmxdev.c:972 [inline]
    dvb_demux_do_ioctl+0x3c6/0x7d0 drivers/media/dvb-core/dmxdev.c:1092
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xee/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff8881297f65e0 (size 32):
  comm "syz.0.18", pid 5934, jiffies 4294942829
  hex dump (first 32 bytes):
    02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    08 00 56 05 00 c9 ff ff 08 00 56 05 00 c9 ff ff  ..V.......V.....
  backtrace (crc 1a56a8d7):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __kmalloc_cache_noprof+0x371/0x480 mm/slub.c:5410
    kmalloc_noprof include/linux/slab.h:950 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    dvb_dmxdev_add_pid+0x9c/0x160 drivers/media/dvb-core/dmxdev.c:897
    dvb_dmxdev_pes_filter_set drivers/media/dvb-core/dmxdev.c:972 [inline]
    dvb_demux_do_ioctl+0x3c6/0x7d0 drivers/media/dvb-core/dmxdev.c:1092
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xee/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


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
