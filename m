Received: from mail-oi2-f4.google.com (mail-oi2-f4.google.com [74.125.231.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AB02931F5
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 22:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787696491; cv=none; b=P36837PsASfOqPmcgqqLcro+8ZsS6buPC09gjaw75uDNuLrR1Vz43c+sL4FVYssEQPnR0OC68QNjbB9QqTHJhShYp0fFpf//VnOJX14mUHCNgBI1kQ1RkQqV3Yax/wuO7QsOorQLstou3aNtatPUHBSahYEbDs2hnxZGEHlvHcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787696491; c=relaxed/simple;
	bh=NtMk5a35LHVxvfp1kxuAIL3ItbEFzZ90k2PmNlzzz8I=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Gk2Jlt6EJNOhuLm5ZdKp23vxuAteBVetseyhvrfMBErXOXGuG50ql5/c1OQZWz07aAjc4uM50A1PMluG+WS8Xo8xHT1hCb7O3d5gsOT75XPj0Y77MfXRrORCgvI1FPStnLQSbJ9C2f7AvSFpYZnnXwn6xh0mnXkvRY8HVB3tMVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f4.google.com with SMTP id 5614622812f47-4961058e787so59619b6e.0
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 15:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787696489; x=1788301289;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/gHPJL2DlWvc+AZ1dm0BSlgYZtrrsxK/ph2MqO3QK4=;
        b=JEtGCqF8Gnoa9nvZSu0pG+9ZgE2nuYzPNxrkUtlsMXOTfeCBfQ+r4+yc8G8vVWsR22
         8sqQ2D+4wj633PL7P7DPzntprNm+A7QVMETUIzSSAGC/eHplSX+rScbYLc9bcFlw+2Zi
         LUDZlHVtFYx2hF/9TAREYj++IMQS4JzxFa2UjmiLRHfjYvSCFhy3R7miXdOjce1N+88C
         93IvWbTNX/3CWyea+bQx8931+TmG4+jD1HgLYNJUsH6TITsKILAoToqk+fbMrO9Alupl
         iYoQZI0khBODureEOc3Kiehjo+MXftyZ1gZGmmI8Q1BR2h8Q1wDgGlghzunYWyffa1My
         ORXw==
X-Forwarded-Encrypted: i=1; AHgh+RoiqtutE2iziFpZcJSSlM+eiGKgrt+ENK2BnyibQharkwzssrh0w0UHMmI1Zz3QUkD+jEvWTEf+J20hxA==@vger.kernel.org
X-Gm-Message-State: AFuF++kJGOc8/3sTA6MOAcIIE95ppG0oHMeCav8v4Fojpc9Du8Qer0/b
	000Y/aRKAhpTOdARbLJtuN35eNxQYl9XWZymVwjc8o/dLLJp8f4SrooZSViaNFRHgZrQoaHTdWg
	/TGEVxavXD6RQOCZreXws4hdq2jpVnGtefKa23l7Uo6h80TFNwBEVKsruYWk=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5183:b0:497:df42:1dff with SMTP id
 5614622812f47-4b3668b51cfmr3331541b6e.1.1787696488945; Tue, 25 Aug 2026
 15:21:28 -0700 (PDT)
Date: Tue, 25 Aug 2026 15:21:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8e1568.a5a502ce.31d34.0073.GAE@google.com>
Subject: [syzbot] [media?] WARNING in vidtv_start_feed
From: syzbot <syzbot+525fda837bd5fc2be560@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4e69c1856bfd Merge tag 'drm-next-2026-08-20' of https://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12a60625580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6330e13b2e20bb12
dashboard link: https://syzkaller.appspot.com/bug?extid=525fda837bd5fc2be560
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f9abc0d6723c/disk-4e69c185.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/11f2728e2c65/vmlinux-4e69c185.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a175945b1e38/bzImage-4e69c185.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+525fda837bd5fc2be560@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: kernel/locking/mutex.c:625 at __mutex_lock_common kernel/locking/mutex.c:625 [inline], CPU#1: syz.0.342/7078
WARNING: kernel/locking/mutex.c:625 at __mutex_lock+0x12e6/0x1550 kernel/locking/mutex.c:821, CPU#1: syz.0.342/7078
Modules linked in:
CPU: 1 UID: 0 PID: 7078 Comm: syz.0.342 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:625 [inline]
RIP: 0010:__mutex_lock+0x12ed/0x1550 kernel/locking/mutex.c:821
Code: 29 79 90 48 c1 e8 03 0f b6 04 18 84 c0 0f 85 47 02 00 00 83 3d 77 a5 9a 04 00 75 13 48 8d 3d ba 9b 9d 04 48 c7 c6 80 fe 0c 8c <67> 48 0f b9 3a 90 e9 67 ee ff ff 90 0f 0b 90 e9 3a f2 ff ff 90 0f
RSP: 0018:ffffc900051b7960 EFLAGS: 00010246
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: 0000000000080000
RDX: ffffc9001174a000 RSI: ffffffff8c0cfe80 RDI: ffffffff907c1f80
RBP: ffffc900051b7af0 R08: ffffffff90792933 R09: 1ffffffff20f2526
R10: dffffc0000000000 R11: fffffbfff20f2527 R12: ffff888026075128
R13: 0000000000000000 R14: 1ffff92000a36f40 R15: 0000000000000000
FS:  00007fad388b86c0(0000) GS:ffff888124e0c000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b33316ff8 CR3: 000000002e6c2000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 vidtv_start_feed+0x102/0x5a0 drivers/media/test-drivers/vidtv/vidtv_bridge.c:233
 dmx_ts_feed_start_filtering+0x129/0x220 drivers/media/dvb-core/dvb_demux.c:747
 dvb_dmxdev_start_feed drivers/media/dvb-core/dmxdev.c:658 [inline]
 dvb_dmxdev_filter_start+0x434/0x10d0 drivers/media/dvb-core/dmxdev.c:769
 dvb_demux_do_ioctl+0x48b/0x540 drivers/media/dvb-core/dmxdev.c:1099
 dvb_usercopy+0x199/0x2e0 drivers/media/dvb-core/dvbdev.c:996
 dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1208
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fad3799e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fad388b8028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fad37c26180 RCX: 00007fad3799e0d9
RDX: 00002000000000c0 RSI: 0000000040146f2c RDI: 0000000000000003
RBP: 00007fad37a35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fad37c26218 R14: 00007fad37c26180 R15: 00007fff575e5288
 </TASK>
----------------
Code disassembly (best guess):
   0:	29 79 90             	sub    %edi,-0x70(%rcx)
   3:	48 c1 e8 03          	shr    $0x3,%rax
   7:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
   b:	84 c0                	test   %al,%al
   d:	0f 85 47 02 00 00    	jne    0x25a
  13:	83 3d 77 a5 9a 04 00 	cmpl   $0x0,0x49aa577(%rip)        # 0x49aa591
  1a:	75 13                	jne    0x2f
  1c:	48 8d 3d ba 9b 9d 04 	lea    0x49d9bba(%rip),%rdi        # 0x49d9bdd
  23:	48 c7 c6 80 fe 0c 8c 	mov    $0xffffffff8c0cfe80,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	90                   	nop
  30:	e9 67 ee ff ff       	jmp    0xffffee9c
  35:	90                   	nop
  36:	0f 0b                	ud2
  38:	90                   	nop
  39:	e9 3a f2 ff ff       	jmp    0xfffff278
  3e:	90                   	nop
  3f:	0f                   	.byte 0xf


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
