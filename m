Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D753E38D407
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 09:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737413; cv=none; b=VqV4HyegEpLtZVKTkp1EwKv8ZNEPFpyUy6RYLqEH+r5gZBaDhTdRwsB2nXpLIgFdzAKJjy2U/vR1opJx2EDTlXQozdpOG9/Gpy1pp/ZJ0WNg0C/kLilHNfKLMr2RXYEliLIpSlDBAmykBp7Zf2omh6YBo9poptvxPlOBSy4N5n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737413; c=relaxed/simple;
	bh=GzHmb+O5eS1R1MTCi9SRU1flxQPp/0FE9gK/PVsioqE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dypnbyV1HhX3jTx41zrpz6D+Ok5MbNH0c4rjlIouIJi/otcEpaSKwOZa5A+W8p4e+rWmyvfSCLcOjvHBZA7P2ffMk7wfci6ILJJmmS9JxP6AKJMA2bKFrZb9jZW+nhf21o7aRPv/5MsqnsPmJ2qFz6EFQGXOwRbHZ3v41qOsQAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-463ddb3b4f7so1107932fac.0
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 02:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787737410; x=1788342210;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q8bUGrwxsZm4UgAQRfNKK60u7Xol04JMy/UG+y6JgAM=;
        b=NleSbQ0oDzQLV1HEP3aOhA1alZCYhQ1G5rARvSnV5xqky3WSXiH3q04cJqbBNSN8RP
         JTwG9iKhI391AW2eL7gHQkcPa0CeMvWtVbx3lIVZoO4GxghVK9n9Hqcfso3Pmpqb4Tdl
         JclmXGZe3O56f5z3eosFNhzCRFHDwsJsdC5H+aN/1YAvGNRMcPIYbm9QiKhdB3SP9daC
         UvNdZxEBt+c6YzXdTbU7kR583MS/Ghjj7oOwk6ghAW+1bQdTd1HyafN7xBxG8rjcrh3w
         qOSEWBcxeFYJ6nmTo5msAvc8TCMrvbNYJERCMKLaUTEdRjCwv9QGvQ/NvAecy2eXa6gr
         OgCw==
X-Forwarded-Encrypted: i=1; AHgh+RodDcVgpS5ya4aB7Q0hi5M/L095f5IDmVtA/PBYg6GbFhjq110Z7qIs07Y/xCXBgEWWfBQT39sYZmeYXw==@vger.kernel.org
X-Gm-Message-State: AFuF++mn2z1Y3EfY97001k8lF0EghciUjTtZHHY615lVhO580UzgaJEm
	Kli7FUhj7Yd138ns5UAmNUF0XHTQ6HL7QJfNGWf8JMVbEz3HtIKKwr6pHyVWtUmaW5bgiPgzcS2
	fuY5vxIr0GnMvJwdJkjJkLkY2+P/uEeYj5oUb8uq+whfwlyg/H4zk23MF73o=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:208a:b0:6ac:b6c0:2c09 with SMTP id
 006d021491bc7-6b1a035992dmr4597875eaf.1.1787737410773; Wed, 26 Aug 2026
 02:43:30 -0700 (PDT)
Date: Wed, 26 Aug 2026 02:43:30 -0700
In-Reply-To: <6a890fa1.91706f20.16b6e3.02af.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8eb542.27659fcc.2ceef7.0000.GAE@google.com>
Subject: Re: [syzbot] [media?] general protection fault in vivid_probe
From: syzbot <syzbot+caaca441bae2799984d3@syzkaller.appspotmail.com>
To: hverkuil@kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1498d979580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=caaca441bae2799984d3
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15551625580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+caaca441bae2799984d3@syzkaller.appspotmail.com

cec: vivid-003-vid-cap0: kthread_run() failed
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000be7: 0000 [#1] SMP KASAN NOPTI
KASAN: probably user-memory-access in range [0x0000000000005f38-0x0000000000005f3f]
CPU: 2 UID: 0 PID: 6367 Comm: syz.1.18 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:vivid_probe+0x579/0x10d0 drivers/media/test-drivers/vivid/vivid-core.c:2119
Code: 3c 28 00 0f 85 36 0a 00 00 48 8b 44 24 10 48 8b 2c c5 c0 09 c8 9b 48 8d bd 39 5f 00 00 48 89 f8 48 89 fa 48 c1 e8 03 83 e2 07 <42> 0f b6 04 28 38 d0 7f 08 84 c0 0f 85 2c 0a 00 00 0f b6 9d 39 5f
RSP: 0018:ffffc900036ef948 EFLAGS: 00010202
RAX: 0000000000000be7 RBX: 0000000000000002 RCX: 0000000000000000
RDX: 0000000000000001 RSI: ffffffff886a5335 RDI: 0000000000005f39
RBP: 0000000000000000 R08: 0000000000000004 R09: 0000000000000002
R10: 0000000000000003 R11: dffffc0000000000 R12: 0000000000000002
R13: dffffc0000000000 R14: 0000000000000004 R15: 0000000000000004
FS:  00007f751a8316c0(0000) GS:ffff8880d5da2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000561c82d2e620 CR3: 0000000059c7e000 CR4: 0000000000352ef0
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
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f751999e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f751a831028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f7519c26090 RCX: 00007f751999e0d9
RDX: 0000000000000006 RSI: 0000200000000300 RDI: 0000000000000005
RBP: 00007f7519a35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f7519c26128 R14: 00007f7519c26090 R15: 00007ffe76265b18
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:vivid_probe+0x579/0x10d0 drivers/media/test-drivers/vivid/vivid-core.c:2119
Code: 3c 28 00 0f 85 36 0a 00 00 48 8b 44 24 10 48 8b 2c c5 c0 09 c8 9b 48 8d bd 39 5f 00 00 48 89 f8 48 89 fa 48 c1 e8 03 83 e2 07 <42> 0f b6 04 28 38 d0 7f 08 84 c0 0f 85 2c 0a 00 00 0f b6 9d 39 5f
RSP: 0018:ffffc900036ef948 EFLAGS: 00010202
RAX: 0000000000000be7 RBX: 0000000000000002 RCX: 0000000000000000
RDX: 0000000000000001 RSI: ffffffff886a5335 RDI: 0000000000005f39
RBP: 0000000000000000 R08: 0000000000000004 R09: 0000000000000002
R10: 0000000000000003 R11: dffffc0000000000 R12: 0000000000000002
R13: dffffc0000000000 R14: 0000000000000004 R15: 0000000000000004
FS:  00007f751a8316c0(0000) GS:ffff8880d5da2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000561c82d2e620 CR3: 0000000059c7e000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	3c 28                	cmp    $0x28,%al
   2:	00 0f                	add    %cl,(%rdi)
   4:	85 36                	test   %esi,(%rsi)
   6:	0a 00                	or     (%rax),%al
   8:	00 48 8b             	add    %cl,-0x75(%rax)
   b:	44 24 10             	rex.R and $0x10,%al
   e:	48 8b 2c c5 c0 09 c8 	mov    -0x6437f640(,%rax,8),%rbp
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
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
