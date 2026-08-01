Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDBD364E98
	for <linux-media@vger.kernel.org>; Sat,  1 Aug 2026 00:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785544544; cv=none; b=Lt0MPd6q9irzrgOFsiq9ce+nY5EVl98YkUfJRVYGhUJ0O47xWztpMLagtwtVgWns34AjKxf5lRPFqDQqGiIK+B3pOVbdxGAiObnxqH61cc/9z/kNFk4HIVkhNu77MHEYlABLlA2ecS1RgFMkpVMge4hiRPZYXxyXwbSJoKYyRZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785544544; c=relaxed/simple;
	bh=ZVGfKI4H3XCL8ydeJRQ39GWmpkde3YSixj6K6/tdzW8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=oQHeox9KPmTHrS719bjUFTGUrXugx5qxqrdJb5eeFkxY18VkeFOFBLxDH0pScTidWbX77aXiaYHz9KrqeGvuoJpNHTFntX+9L3baBzyJjorN1s3jOAjOniCq17g7JH+e2W27Nl5dNMI4Lv5Uhteiwp+/1IqT4CiM2ToF6eEffYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-495b8120909so1957957b6e.1
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 17:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785544535; x=1786149335;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9It3xva2KhBe6zFFezGSXCphvrH/zJ2hqA7UvLZL6U=;
        b=lfQDJDmnz6/5K4QiuIZPv3oDTpb84za2fz0t3uSoGjJ/H2Qfw/oLmuoTJAioWZrLd3
         lp2YxW82ITWOPge00apyNJ+r9e5j8n1Y7beWmNqz8s75dX6NfE35zzlNufEgtjVmAhys
         immMP698Nw/xIvofGqIIxykxrzXBZ2cjIVeiZgHSxFgVptglEwZLb2/CmlBdc4af9ECW
         4WmyFsrutnbuz6Oa2gUDpgtgeP2c4044JIgWjFO8TLEy4wHeSggxwEVaP6gsOaxQaxUK
         8WrOB4pOVIMakKpRpL7US/pXDR/50oAKsh+rwb/ITirK1i6jmzEjW2zz/LtiULY2YOfs
         Ik4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr80wYq1OfftR3sawBJvVwc/PK0gfKNhBNhr9zcs6jVKgvM0q4QiEfT62vgTfadEupaWqec+IbDQZ9cKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTHDXwj+hTklMiyLDfhqIjRggXgWZNzrJIHWNJv0EbHSeIUnXm
	76JGCKrssuQu38gvu+DuOopwTlb69P4thzxPtbaKltzIVfCDoxMc3RcrDZtI07c5bPDgmM5HnWw
	V62iTT02lcNj9aZ/amCHXWJn+2jh2GWgLgF101oAAkVljn1VvFS6ejMOC4YU=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:244f:b0:4a4:9e18:607a with SMTP id
 5614622812f47-4af5e3d7eeemr3761912b6e.21.1785544535599; Fri, 31 Jul 2026
 17:35:35 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:35:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6d3f57.6ce73036.24301b.0011.GAE@google.com>
Subject: [syzbot] [media?] general protection fault in vidtv_s302m_encode
From: syzbot <syzbot+e9ce4d4ff55ba65e3980@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3b5f4b83c4ab Merge tag 'for-7.2-rc5-tag' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11068aea580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=e9ce4d4ff55ba65e3980
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f99ca00b02a2/disk-3b5f4b83.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5caff5208bfc/vmlinux-3b5f4b83.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c0e941f5f816/bzImage-3b5f4b83.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e9ce4d4ff55ba65e3980@syzkaller.appspotmail.com

 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 UID: 0 PID: 5713 Comm: kworker/0:5 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Workqueue: events vidtv_mux_tick
RIP: 0010:vidtv_s302m_encode+0x269/0x1860 drivers/media/test-drivers/vidtv/vidtv_s302m.c:414
Code: 31 aa f9 31 ff 89 de e8 95 2b aa f9 84 db 0f 85 37 0d 00 00 e8 78 31 aa f9 4c 89 e2 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e e7 14 00 00 48 8b 44 24 08 41
RSP: 0018:ffffc9000454f830 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000400
RDX: 0000000000000000 RSI: ffffffff88602ec8 RDI: ffff88813fe238c0
RBP: 0000000000000000 R08: 0000000000000dc0 R09: 00000000ffffffff
R10: ffffffff8edee673 R11: 0000000000000001 R12: 0000000000000000
R13: dffffc0000000000 R14: ffff888076157200 R15: ffff88802e6f2000
FS:  0000000000000000(0000) GS:ffff888123ddc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f89c38f7ff8 CR3: 0000000038e49000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 vidtv_mux_poll_encoders drivers/media/test-drivers/vidtv/vidtv_mux.c:339 [inline]
 vidtv_mux_tick+0x4e4/0x1460 drivers/media/test-drivers/vidtv/vidtv_mux.c:416
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:vidtv_s302m_encode+0x269/0x1860 drivers/media/test-drivers/vidtv/vidtv_s302m.c:414
Code: 31 aa f9 31 ff 89 de e8 95 2b aa f9 84 db 0f 85 37 0d 00 00 e8 78 31 aa f9 4c 89 e2 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e e7 14 00 00 48 8b 44 24 08 41
----------------
Code disassembly (best guess):
   0:	31 aa f9 31 ff 89    	xor    %ebp,-0x7600ce07(%rdx)
   6:	de e8                	fsubrp %st,%st(0)
   8:	95                   	xchg   %eax,%ebp
   9:	2b aa f9 84 db 0f    	sub    0xfdb84f9(%rdx),%ebp
   f:	85 37                	test   %esi,(%rdi)
  11:	0d 00 00 e8 78       	or     $0x78e80000,%eax
  16:	31 aa f9 4c 89 e2    	xor    %ebp,-0x1d76b307(%rdx)
  1c:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  23:	fc ff df
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax <-- trapping instruction
  2e:	84 c0                	test   %al,%al
  30:	74 08                	je     0x3a
  32:	3c 03                	cmp    $0x3,%al
  34:	0f 8e e7 14 00 00    	jle    0x1521
  3a:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  3f:	41                   	rex.B


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
