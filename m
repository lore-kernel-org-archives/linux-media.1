Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA131B3925
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 02:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785895526; cv=none; b=DTnq7ra10FtKeAE2lf9TGZZJG02C59fv7YlNsLbfldiDTpUM1EyWPN47Q7KsGbeKWcKE+xQBOoPeeDumwr5IlzdHkkham3JdNTtlIQUtxTbW+zwBZd5cdy5iVeK5keascF9TzJDZKZAA9pm++2EmcKIa4LADNafIGnHSL+HTE/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785895526; c=relaxed/simple;
	bh=o6sp9kojgdX4wUrD7Ny35yCNAXH7VfyS0u9vzO7jkZU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=SJk2xjv7oVjm4rdXWDr3+XeRbKQ13zxu/xDHW19V7LlqlX21fkkhYdDP9lQskP9ZDw4yj3RvNqsjkjwQIovaz/t3sJujUIGoA8PfevbE5pCcb87yOh43PAGcacWgh9o2lTM2roJbTIEvEK/7MwnQbAaaZQVS2aaHFPPxb+jnKcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-49ce04870f8so649589b6e.0
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 19:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785895523; x=1786500323;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GLMngKsxNjbvWcuuO1UYE0K4OHpImt32Ta+YVIAJZi8=;
        b=Vj91smi0eDO+mYtvmsUru8fd2BSgn9xVKp00Um9aJLlq6OsT55XYPIXLekon0AbOSQ
         VSQoi+ZHYpbH7eWvn2PzmcUuagPbdfFuDb8rVZQBbMMk64SxVYwjM/8fDdjU2Nmy3sFO
         iu62eZLyvr941KwDL9eMH5PuyzzA5XuM26CKxIOQcZubjhTKwtM4FA53wR8zaq/021G/
         MzEabjR+wWyyQtv7tmAd4Ok9r5cFKue6Wad0NWaZ8T+RvJpHOqBfgXQcsCmQvrQgtFut
         fpEC0aYN64RjNTyKGLT5tej9a3HbHEtel6qY7xw//SoZsRG9BCriWGor3aNDjM1wTj11
         XLlA==
X-Forwarded-Encrypted: i=1; AHgh+RrvM+PTQwN5cYTaSoJSg/XEZ3btaDAWGA+QfW2JM/Cy+YFSk0AJ/BG+dCQwpnrRRN/Ri3Z4QuKvZo9gzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG0mgb/e7ttde3/xZBFurV1I1kbNtHgPAaA6gXOVKg4PIvFvWD
	OINL9ALZBRITg7yivaRrjw0nWauX/TgQ/pUGIZAHz8x8+FsH1CDYJdceGCRkyTVkSkc98h8vEzH
	941cW7VeNZ3e0xT0bHNR7ItaGkiOXv2T/1FHADx3IyrUBwTULvZ3kN/7xmas=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:7085:20b0:6ae:9e00:c8ef with SMTP id
 006d021491bc7-6ae9e00ca63mr319630eaf.14.1785895523703; Tue, 04 Aug 2026
 19:05:23 -0700 (PDT)
Date: Tue, 04 Aug 2026 19:05:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a729a63.13623e66.bdc14.0046.GAE@google.com>
Subject: [syzbot] [media?] WARNING in vb2_start_streaming
From: syzbot <syzbot+930e6201080a31e9d0c8@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	m.szyprowski@samsung.com, mchehab@kernel.org, syzkaller-bugs@googlegroups.com, 
	tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a2cf4ef33184 Merge tag 'devicetree-fixes-for-7.2' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1397fa49580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f221a1b5d497ed15
dashboard link: https://syzkaller.appspot.com/bug?extid=930e6201080a31e9d0c8
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-a2cf4ef3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c2efb8cc15c7/vmlinux-a2cf4ef3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2391dcb843b8/bzImage-a2cf4ef3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+930e6201080a31e9d0c8@syzkaller.appspotmail.com

------------[ cut here ]------------
!list_empty(&q->done_list)
WARNING: drivers/media/common/videobuf2/videobuf2-core.c:1821 at vb2_start_streaming+0x247/0x570 drivers/media/common/videobuf2/videobuf2-core.c:1821, CPU#2: syz.3.3964/23279
Modules linked in:
CPU: 2 UID: 0 PID: 23279 Comm: syz.3.3964 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:vb2_start_streaming+0x247/0x570 drivers/media/common/videobuf2/videobuf2-core.c:1821
Code: 00 00 00 00 fc ff df 4c 89 e2 48 c1 ea 03 80 3c 02 00 0f 85 b5 02 00 00 48 8b 83 68 01 00 00 49 39 c4 74 0d e8 9a 35 e2 f9 90 <0f> 0b 90 eb 02 31 ed e8 8d 35 e2 f9 89 e8 48 83 c4 30 5b 5d 41 5c
RSP: 0000:ffffc90002e4fa50 EFLAGS: 00010283
RAX: 00000000000027ef RBX: ffff88806deda770 RCX: ffffc90007779000
RDX: 0000000000080000 RSI: ffffffff88277866 RDI: ffff8880282c2540
RBP: 00000000ffffffed R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff88806deda8d8
R13: 0000000000000000 R14: ffff88806deda7d0 R15: ffff88806deda7a0
FS:  0000000000000000(0000) GS:ffff888096de1000(0063) knlGS:00000000f547db40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00000000f6fff000 CR3: 00000000739b9000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 vb2_core_streamon+0x26a/0x3c0 drivers/media/common/videobuf2/videobuf2-core.c:2336
 __vb2_init_fileio+0xcb7/0x1000 drivers/media/common/videobuf2/videobuf2-core.c:2949
 __vb2_perform_fileio+0x9ba/0x1380 drivers/media/common/videobuf2/videobuf2-core.c:3025
 vb2_fop_read+0x211/0x520 drivers/media/common/videobuf2/videobuf2-v4l2.c:1215
 v4l2_read+0x229/0x2c0 drivers/media/v4l2-core/v4l2-dev.c:316
 vfs_read+0x1e4/0xb40 fs/read_write.c:572
 ksys_read+0x12a/0x250 fs/read_write.c:716
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
 __do_fast_syscall_32+0xe7/0x970 arch/x86/entry/syscall_32.c:307
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:332
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf708efec
Code: Unable to access opcode bytes at 0xf708efc2.
RSP: 002b:00000000f547d50c EFLAGS: 00000292 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 0000000080002c00
RDX: 0000000000002020 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
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
