Received: from mail-oa1-f78.google.com (mail-oa1-f78.google.com [209.85.160.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BBE43CE4B
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 05:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786081234; cv=none; b=tB5wwEHcX+bwr1wvuAb/0LL2THGr8GYhvgXO4nH/yHjoH+pqwf0FinKXGfA6EXpyS6eJgOM7MAj0B0sZGl/pd8TmOy8oCHS9JN6QvasyMu5eG1xY9Ww5S/ka3oGmQ9BP5ssMZeD2wtwMwlpxhIz2ijFXTsNnYFM+ja1GtZpovmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786081234; c=relaxed/simple;
	bh=JYSKPJSPjb8f8Jx1UbfJmtzrQs0Zrz2c2TGSWbRlTMg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=VKvfvAjU6FkNmXmWDM7A9NqVqh+v5OICnhOVMjS65UJDN5SiP8ed9/5plcZlf2n5waDvy0eQxZ+5NxG+8SK9ijvzOz1RoPcguvmO9FZmo/p1NMIs3HnlhjusM84vNnSm0dIXlk5P/SRpRGjgDaB91nSY/EPXhetfbqoakXN6pGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f78.google.com with SMTP id 586e51a60fabf-457eba4835bso2853873fac.2
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 22:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786081232; x=1786686032;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CfM/PB1w2EN2DAtr7uqaITALp+oiY96lJZdG5li8ch0=;
        b=fSeUHDotORFEQ/7r4AKLUUpXFD+h4QVAIYgV19WBjX7BOWLM1xqmNr/gPq53E2QaXB
         4O0cOeRJEQCO8T4h0RDzMI4kXSdWryZsZD3uujRfQBWffZr1yNAMMJ5111pW+ZSedjG4
         7WiqpqgImRYs7jj9F/BbHYp1cuu4jdTYnB4ulGDAnTa3WwR2O2ezX4Fqi1XeYuF8LfEg
         go8NIpBv1N2s6COiYVrrc+wumenIRHQGMOaNfKmkVyjuiNRE14TA36XNUtrUCJh0vzsN
         kBDD9SD49QPzrQw9UPhL1iq/xajfjk7FcXpWztjGTr3IB7Zmt72Id41oT9rG5BV2VnXW
         oYYw==
X-Forwarded-Encrypted: i=1; AHgh+Rpg2NuDJoqJoObs56HWIAHYG2HlRazfpGBg3NYqHOvfWxItTSpTaeeywfbal4mYtlZehPYEyB52pOqDrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyctiAFymBTCg1hmTVFR0YUeg6q3nv0Apaa59dO7Ly5reKkGFV+
	69utPZmlUkM+8XlDiFYwAFSOuGysM0F4f5rLbSV8pvMUAf3Ul2WabcnDBkijqn1ymytj8whf2M7
	lPiaPixZ5sOO/a89kzuoHGlmcAjM3dNOkpHc/qhXQ4LILrhufxKeiylEV95Y=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c87:b0:6a1:1269:c776 with SMTP id
 006d021491bc7-6ae96fe3cb7mr11165801eaf.25.1786081231733; Thu, 06 Aug 2026
 22:40:31 -0700 (PDT)
Date: Thu, 06 Aug 2026 22:40:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a756fcf.01d0871a.3a0d52.003e.GAE@google.com>
Subject: [syzbot] [media?] general protection fault in subdev_open
From: syzbot <syzbot+74de6401dbdd377b5746@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0d8395707651 Merge tag 'soc-fixes-7.2-2' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=163ccfb9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=acc0a882b963ae23
dashboard link: https://syzkaller.appspot.com/bug?extid=74de6401dbdd377b5746
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2018c5f56c1d/disk-0d839570.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3bfeae099eec/vmlinux-0d839570.xz
kernel image: https://storage.googleapis.com/syzbot-assets/37bf23e44126/bzImage-0d839570.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+74de6401dbdd377b5746@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 11356 Comm: syz.1.1458 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:subdev_open+0x193/0x510 drivers/media/v4l2-core/v4l2-subdev.c:115
Code: 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 bc 02 00 00 48 b8 00 00 00 00 00 fc ff df 49 8b 2c 24 48 89 ea 48 c1 ea 03 <80> 3c 02 00 0f 85 04 03 00 00 48 8b 6d 00 48 85 ed 0f 84 95 00 00
RSP: 0018:ffffc900037bf8a0 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffff888055f54c00 RCX: ffffc90003e51000
RDX: 0000000000000000 RSI: ffffffff88163993 RDI: ffff88802d3ad3d0
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: ffff88802d414020
R13: ffff88802d70b000 R14: ffff888079c69340 R15: ffff888055f54d38
FS:  00007f15691926c0(0000) GS:ffff888123eed000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1568387700 CR3: 000000003243a000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 v4l2_open+0x1d2/0x490 drivers/media/v4l2-core/v4l2-dev.c:433
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
RIP: 0033:0x7f156835e90e
Code: 08 0f 85 a5 a8 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 80 00 00 00 00 48 83 ec 08
RSP: 002b:00007f1569191b28 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f15691926c0 RCX: 00007f156835e90e
RDX: 0000000000000002 RSI: 00007f1569191c00 RDI: ffffffffffffff9c
RBP: 00007f1569191c00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: cccccccccccccccd
R13: 00007f1568626038 R14: 00007f1568625fa0 R15: 00007ffe228ab238
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:subdev_open+0x193/0x510 drivers/media/v4l2-core/v4l2-subdev.c:115
Code: 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 bc 02 00 00 48 b8 00 00 00 00 00 fc ff df 49 8b 2c 24 48 89 ea 48 c1 ea 03 <80> 3c 02 00 0f 85 04 03 00 00 48 8b 6d 00 48 85 ed 0f 84 95 00 00
RSP: 0018:ffffc900037bf8a0 EFLAGS: 00010246

RAX: dffffc0000000000 RBX: ffff888055f54c00 RCX: ffffc90003e51000
RDX: 0000000000000000 RSI: ffffffff88163993 RDI: ffff88802d3ad3d0
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: ffff88802d414020
R13: ffff88802d70b000 R14: ffff888079c69340 R15: ffff888055f54d38
FS:  00007f15691926c0(0000) GS:ffff888123ded000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc283cc07e8 CR3: 000000003243a000 CR4: 00000000003526f0
----------------
Code disassembly (best guess), 7 bytes skipped:
   0:	48 c1 ea 03          	shr    $0x3,%rdx
   4:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   8:	0f 85 bc 02 00 00    	jne    0x2ca
   e:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  15:	fc ff df
  18:	49 8b 2c 24          	mov    (%r12),%rbp
  1c:	48 89 ea             	mov    %rbp,%rdx
  1f:	48 c1 ea 03          	shr    $0x3,%rdx
* 23:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  27:	0f 85 04 03 00 00    	jne    0x331
  2d:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
  31:	48 85 ed             	test   %rbp,%rbp
  34:	0f                   	.byte 0xf
  35:	84                   	.byte 0x84
  36:	95                   	xchg   %eax,%ebp


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
