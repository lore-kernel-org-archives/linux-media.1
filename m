Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EA92D7DD7
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 02:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787367332; cv=none; b=eeGVdbhUfFHKA7GtRcZdJiCek0ssmwJNmq/8R5MyWiu3K5oFRj2ahpDES5wNxafh9fPFSJ5ki77dV0qY+Cp02FkItOU+Bg1AlpKwrZzHps5aRJ0wvY4/LmRxXX0KBQAaITVNxST/V3ypdOyNouIrhErN65Gr1UKb8lzOCH3+xUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787367332; c=relaxed/simple;
	bh=5M4kClCzR1kWQXk5euuCuSDB3iy3rqalZ/8rUyHwlz8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=lPxqfWlOqefm8sJAsva1Q0U0PB16x5zQdcThY8GjJgyh/NwhlqXIpx6T+SwyLoqMZcfJkGye4LQECSBwmVegmGWm8KqRBGliUZN3ecw9VlgwbewQIF3X+Fpq0IrgfvXGc34HzgVjfi/6okfGdoNHmA8AcCeNP/JgkPJQH6eStk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f10.google.com with SMTP id 46e09a7af769-7e9fdad388fso445976a34.0
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 19:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787367329; x=1787972129;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/gy+itAtI8UGtVJtyQdBUnjXDGKvnZGlt/R6WnGHW4=;
        b=cKYMVfXjfemXsnV8B4vJb1DgbCGwt25v1kiAd5NvbDtlJGMMJWvUImhPnKyB94dnVN
         xAUAb1pLTvNoacpm41ybBPkSqKpnfeeWZJMOAavA5vbr7GSA50Psm8+D7q08Lblq5bql
         USmudikaQqlK2kiAzbRjfD8NvkHHtWY98vco6omqjd2FFYtKnKox1kGQ885rhTXeao14
         5dcuWOa6KDs3WVOE4ddf5nxTi2qrEzDwKs3x5SJDvcABqZB6LH6cFcYNJi5Kf5Kxgvlm
         fOQ/Uzd6QlXBQPRRmRiAP2IR+OqytAa+l6Gz1W7YUCMKVfJX8hWEUTZqWmP3BbnK2LEk
         /Xpw==
X-Forwarded-Encrypted: i=1; AHgh+RoTlbWyVAENoZoyKs7+nHie4DM1NQrDrNfUWnuO0+8vvn0OfgIT7IJ03PhCmOOdjASuOP1eqKsPigCBSg==@vger.kernel.org
X-Gm-Message-State: AFuF++nFiNyV3p1wVpwO/2ASL4sXiwSwVGnpzbosdPgkjrFgSfEMhiDo
	WBiUCjaZKw3ecUGXqgBOSVuqNA/xUJnDOOD+CO1rjg1gmmViDmmqXwUwe05amRADmR5B51i9aqj
	cBTd5gS16Wik/f+eItppZeYF5SM/cpzkaLA9pB44gm8hKdysgsxYAbxORKKA=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a1a:b0:4a4:af7f:83d3 with SMTP id
 5614622812f47-4b309c98186mr4282573b6e.20.1787367329730; Fri, 21 Aug 2026
 19:55:29 -0700 (PDT)
Date: Fri, 21 Aug 2026 19:55:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a890fa1.91706f20.16b6e3.02af.GAE@google.com>
Subject: [syzbot] [media?] general protection fault in vivid_probe
From: syzbot <syzbot+caaca441bae2799984d3@syzkaller.appspotmail.com>
To: hverkuil@kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9d2ed026f031 Merge tag 'sysctl-7.03-rc1' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15c67a25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=54b748b029440e0b
dashboard link: https://syzkaller.appspot.com/bug?extid=caaca441bae2799984d3
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12d56549580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-9d2ed026.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6c5c2e657d2b/vmlinux-9d2ed026.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4d4c9e33af49/bzImage-9d2ed026.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+caaca441bae2799984d3@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000be7: 0000 [#1] SMP KASAN NOPTI
KASAN: probably user-memory-access in range [0x0000000000005f38-0x0000000000005f3f]
CPU: 1 UID: 0 PID: 6030 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:vivid_probe+0x579/0x10d0 drivers/media/test-drivers/vivid/vivid-core.c:2119
Code: 3c 28 00 0f 85 36 0a 00 00 48 8b 44 24 10 48 8b 2c c5 e0 8d c5 9b 48 8d bd 39 5f 00 00 48 89 f8 48 89 fa 48 c1 e8 03 83 e2 07 <42> 0f b6 04 28 38 d0 7f 08 84 c0 0f 85 2c 0a 00 00 0f b6 9d 39 5f
RSP: 0000:ffffc90003937928 EFLAGS: 00010202
RAX: 0000000000000be7 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 0000000000000001 RSI: ffffffff8864b225 RDI: 0000000000005f39
RBP: 0000000000000000 R08: 0000000000000004 R09: 0000000000000001
R10: 0000000000000002 R11: dffffc0000000000 R12: 0000000000000002
R13: dffffc0000000000 R14: 0000000000000003 R15: 0000000000000003
FS:  0000000000000000(0000) GS:ffff888096abd000(0063) knlGS:00000000f6844b40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 000055f869f36de0 CR3: 000000005122a000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 platform_probe+0x106/0x1d0 drivers/base/platform.c:1507
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
 device_driver_attach+0xd1/0x220 drivers/base/dd.c:1203
 bind_store+0xf4/0x190 drivers/base/bus.c:267
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x13a/0x8b0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf706efec
Code: Unable to access opcode bytes at 0xf706efc2.
RSP: 002b:00000000f684450c EFLAGS: 00000292 ORIG_RAX: 0000000000000004
RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 0000000080000300
RDX: 0000000000000006 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:vivid_probe+0x579/0x10d0 drivers/media/test-drivers/vivid/vivid-core.c:2119
Code: 3c 28 00 0f 85 36 0a 00 00 48 8b 44 24 10 48 8b 2c c5 e0 8d c5 9b 48 8d bd 39 5f 00 00 48 89 f8 48 89 fa 48 c1 e8 03 83 e2 07 <42> 0f b6 04 28 38 d0 7f 08 84 c0 0f 85 2c 0a 00 00 0f b6 9d 39 5f
RSP: 0000:ffffc90003937928 EFLAGS: 00010202
RAX: 0000000000000be7 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 0000000000000001 RSI: ffffffff8864b225 RDI: 0000000000005f39
RBP: 0000000000000000 R08: 0000000000000004 R09: 0000000000000001
R10: 0000000000000002 R11: dffffc0000000000 R12: 0000000000000002
R13: dffffc0000000000 R14: 0000000000000003 R15: 0000000000000003
FS:  0000000000000000(0000) GS:ffff888096abd000(0063) knlGS:00000000f6844b40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00000000f706f000 CR3: 000000005122a000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	3c 28                	cmp    $0x28,%al
   2:	00 0f                	add    %cl,(%rdi)
   4:	85 36                	test   %esi,(%rsi)
   6:	0a 00                	or     (%rax),%al
   8:	00 48 8b             	add    %cl,-0x75(%rax)
   b:	44 24 10             	rex.R and $0x10,%al
   e:	48 8b 2c c5 e0 8d c5 	mov    -0x643a7220(,%rax,8),%rbp
  15:	9b
  16:	48 8d bd 39 5f 00 00 	lea    0x5f39(%rbp),%rdi
  1d:	48 89 f8             	mov    %rdi,%rax
  20:	48 89 fa             	mov    %rdi,%rdx
  23:	48 c1 e8 03          	shr    $0x3,%rax
  27:	83 e2 07             	and    $0x7,%edx
* 2a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax <-- trapping instruction
  2f:	38 d0                	cmp    %dl,%al
  31:	7f 08                	jg     0x3b
  33:	84 c0                	test   %al,%al
  35:	0f 85 2c 0a 00 00    	jne    0xa67
  3b:	0f                   	.byte 0xf
  3c:	b6 9d                	mov    $0x9d,%dh
  3e:	39                   	.byte 0x39
  3f:	5f                   	pop    %rdi


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
