Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5359C3B83E1
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 19:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179152; cv=none; b=jzR+jLFXiNCHcmddKuFjLwWFgC6WSrJAYI6frntpXB/k2s7yYs3w2Ei9usuEvJuirIorl6n2oehIQ0glGs2i2lMTRiAx1gvfi/vAPjeTy9iItvNyI8dTPoOoColbHy31RgYufeOKnniI6jdBcs1o1KwGRirGyReQrbNhk4Uckf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179152; c=relaxed/simple;
	bh=nema57VpknUEVjHK/6OaGO6/Ax8j31pmoGa6E/DIQpM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=rWPlz/xuBbE93DNGUuqEMqh/UglGwUAG6TsZkBoAz6fpmDf4BmOuofejYe7NxktjhON6tf6SssNlfp4OjfOjFcNakLR59fLlD+vZxJ/16mhR7Yf1KLD7kvLDJh0rORAviFY5AJ7j197faN2QbH4bOm58ryP7WYXc83fjX3f62QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4e778acdbc6so489795b6e.3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 12:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179148; x=1792783948;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eqhbNevn+egUUM8xu0N1mDNSKYZORquqfhQb7/sTToI=;
        b=znZSfATzZIOCrU+85fmS5wrLg6wVf9Ki6Tejau123op6giRWXafySTQNryLjIn4HqY
         Kk7BYgVuzhfvWL8ns9ovJLj06ZmFSrpziAuTxh9bvXw/rFHw3XBUZj9LSztUJ91JSMOQ
         6WNR8Xw81jbaYIvTBm8eM9ctrHupESC9rFQlsaE2lRnsAwAXxeVpvt0V1WKA4i638tys
         0oBhDsACFmItyWx5Cgh0Z/QWM21Az0fKbxbKpPkez8qWHEp6lmlroCDjnorJYtTZVV8e
         jd5+/babYcn2Rcz5jhKpFpqi9NCMKzVmnehk0kfiZySyU+hf3ymv8X1ty7fz2hZzayln
         WTmg==
X-Forwarded-Encrypted: i=1; AKwUvBxg9JukMn5qzWo1apmPn7SVtrzh86vuO0n9I+YyzEEhJAl2v4xquIxn9PP0q911RGSTc7JRrb9opUgOqA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKF1mFRRX57ou/IuSF6TiD2XQCWubaCcNFlvcFeLWmWHLAGxPnH
	c3bZpDbErb4fKnsg/mmJWddw8Paju8dq4lQoZiVSYQG/zJB3tjGkcEVBQaEfh2nrKBCrxGeiqJa
	ne6ptDmomXgkuxiryCBx/RaxDliDZMcVsCYrMPF1gcLKRXyIHfT5V1gF0tG4=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3a1a:b0:4cb:f21c:a795 with SMTP id
 5614622812f47-53cd056572amr606742b6e.29.1792179147921; Fri, 16 Oct 2026
 12:32:27 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:32:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad27bcb.6814cce4.34c49f.000b.GAE@google.com>
Subject: [syzbot] [greybus?] WARNING: ODEBUG bug in gb_operation_sync_timeout
From: syzbot <syzbot+a2e50fb40695811c2dab@syzkaller.appspotmail.com>
To: elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
	johan@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2f2f7eeef8b0 Merge tag 'soc-fixes-7.3-3' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=157b1bd1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c4b098695335c89f
dashboard link: https://syzkaller.appspot.com/bug?extid=a2e50fb40695811c2dab
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e46a243fa39c/disk-2f2f7eee.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/04a37a0099c0/vmlinux-2f2f7eee.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c2964fdca34d/bzImage-2f2f7eee.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a2e50fb40695811c2dab@syzkaller.appspotmail.com

greybus greybus1: 0/0:0: synchronous operation id 0x0002 of type 0x10 failed: -71
------------[ cut here ]------------
ODEBUG: free active (active state 0) object: ffff888087f2c878 object type: timer_list hint: gb_operation_timeout+0x0/0x110 drivers/greybus/operation.c:1265
WARNING: lib/debugobjects.c:632 at debug_print_object+0xec/0x230 lib/debugobjects.c:629, CPU#1: kworker/u8:19/14610
Modules linked in:
CPU: 1 UID: 0 PID: 14610 Comm: kworker/u8:19 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
Workqueue: greybus1:svc gb_svc_process_deferred_request
RIP: 0010:debug_print_object+0x18a/0x230 lib/debugobjects.c:629
Code: f8 48 c1 e8 03 80 3c 18 00 74 08 4c 89 ff e8 4d 99 4c fd 4d 8b 0f 4c 89 ef 48 8b 74 24 08 48 89 ea 44 89 e1 4d 89 f0 ff 34 24 <67> 48 0f b9 3a 48 83 c4 08 ff 05 f3 4c 8e 0c 48 83 c4 10 5b 41 5c
RSP: 0018:ffffc9000767f7e0 EFLAGS: 00010246
RAX: 1ffffffff181f08c RBX: dffffc0000000000 RCX: 0000000000000000
RDX: ffffffff8c6de740 RSI: ffffffff8c6de1c0 RDI: ffffffff91859a20
RBP: ffffffff8c6de740 R08: ffff888087f2c878 R09: ffffffff8c0f97c0
R10: dffffc0000000000 R11: ffffffff81b3f760 R12: 0000000000000000
R13: ffffffff91859a20 R14: ffff888087f2c878 R15: ffffffff8c0f8460
FS:  0000000000000000(0000) GS:ffff888123bbf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000110c25d909 CR3: 0000000071620000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __debug_check_no_obj_freed lib/debugobjects.c:1171 [inline]
 debug_check_no_obj_freed+0x2e3/0x450 lib/debugobjects.c:1201
 slab_free_hook mm/slub.c:2679 [inline]
 slab_free mm/slub.c:6509 [inline]
 kmem_cache_free+0xfd/0x650 mm/slub.c:6636
 gb_operation_sync_timeout+0x1c7/0x270 drivers/greybus/operation.c:1172
 gb_operation_sync include/linux/greybus/operation.h:203 [inline]
 gb_svc_intf_set_power_mode drivers/greybus/svc.c:584 [inline]
 gb_svc_process_hello_deferred drivers/greybus/svc.c:936 [inline]
 gb_svc_process_deferred_request+0x5f3/0x1150 drivers/greybus/svc.c:1102
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	f8                   	clc
   1:	48 c1 e8 03          	shr    $0x3,%rax
   5:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
   9:	74 08                	je     0x13
   b:	4c 89 ff             	mov    %r15,%rdi
   e:	e8 4d 99 4c fd       	call   0xfd4c9960
  13:	4d 8b 0f             	mov    (%r15),%r9
  16:	4c 89 ef             	mov    %r13,%rdi
  19:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  1e:	48 89 ea             	mov    %rbp,%rdx
  21:	44 89 e1             	mov    %r12d,%ecx
  24:	4d 89 f0             	mov    %r14,%r8
  27:	ff 34 24             	push   (%rsp)
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	48 83 c4 08          	add    $0x8,%rsp
  33:	ff 05 f3 4c 8e 0c    	incl   0xc8e4cf3(%rip)        # 0xc8e4d2c
  39:	48 83 c4 10          	add    $0x10,%rsp
  3d:	5b                   	pop    %rbx
  3e:	41 5c                	pop    %r12


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
