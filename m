Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D5D357D0C
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 20:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788469178; cv=none; b=lWs04zmgfWeZcnzAobL7JtKJb+XaBConQGjmjSoNZqcyShexerUwjF2spnBsS6m6kptjKSjzJqbrzEOjXFMqFX8tx0qNlUz7+8t+G+MUfl/XZ16D0Zc3UamIodCKuzzBEyrKUhdOEth8yelCuKrBTyLVODPixX2VLtdxGSOsqbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788469178; c=relaxed/simple;
	bh=C3RWQOdj4fgEKlz8/Gffl1bhsESZAiimpU1doQZw4PA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=q+SJGffDKeBbLmRhsevcFSWEV+lGw4LKm0Eu08sV6q5xx764DS9ULbIBStrjQApPVKhlRjPVJO11OTqmrE8w5uhZkYPmr/TjgXTR79Tku/nNrlqOwpFaUZwdybqDHKNC+56/1DGm+SX3K+Ogv1Qz96mlmjLB685wOm5IesiKyzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-7f0355eb4b3so89914a34.0
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2026 13:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788469171; x=1789073971;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Twk+f/9HB5uOCBkLR8ShKczkOPcM4YsTZRNfRvtUmj0=;
        b=fLGnbqkl325Jxsax4zZteWGyoFfZAB2pqEQy2TAFGCEuI2xakBP7S7GXrgjt9Kx4kM
         B9B1rscarJvnZUfOMdz1uQShsuBjeNNWbDfa0O4sDL+xG5nRS29PB3Rd76LGTzHaNlk6
         bOnVuaSNEAH5wL2pMKvGjGXDhHfkh6Pf0RQbqrVFa8wZPL1ANriVXR+bSQsy/o7qaRdW
         rRdqc46MDJD8MnAr6buRuMk5EcZkMk4Eie2cWPp//asISC2TPIVX7hCae+ZxaxRojm3D
         qL/j3Sxps4Ykaw7q9XW84LrosfIo0muGCwjz6337PpZW2vuXiOgeSG2+q4Hd7woI/uHL
         8rIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk1oaPUMn0rnF4HIdvgLUtq3nDt56O2+DC6Mt9PU9snYHCzmmft37RLpRaQG1TZh0cm0xBePa/q8ClxA==@vger.kernel.org
X-Gm-Message-State: AFuF++lzKo+fIz4hiVAIPZeqaPKphlnFYWLLUMdJrz2hTsJKwywZkbFd
	8Urbho2TLNFN6b7o+V+lmu9gFmc1ENFYfraQNWp5D3iVdka+JXvTjXST0kVjBvRI9EcXLu/c0N8
	r9K+53wFGMlQbuKuLsa9xhxjMKK2Qq5YresgbUFu/PiMG7A7Z17ix8auLFsk=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1997:b0:6b4:1684:9e48 with SMTP id
 006d021491bc7-6b6fc5dccfemr1266992eaf.19.1788469171103; Thu, 03 Sep 2026
 13:59:31 -0700 (PDT)
Date: Thu, 03 Sep 2026 13:59:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a99dfb3.9266084e.bf0d7.027e.GAE@google.com>
Subject: [syzbot] [media?] WARNING in cx25840_init
From: syzbot <syzbot+9123948aef13fe92d706@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    940de590b839 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=10c8cb49580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=9123948aef13fe92d706
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17faf0f9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14d948f9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5902f4c02b2e/disk-940de590.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3473a7c7a754/vmlinux-940de590.xz
kernel image: https://storage.googleapis.com/syzbot-assets/010eec830bfe/bzImage-940de590.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9123948aef13fe92d706@syzkaller.appspotmail.com

dvb-usb: bulk message failed: -71 (9/0)
dvb-usb: bulk message failed: -71 (9/0)
dvb-usb: bulk message failed: -71 (6/0)
dvb-usb: bulk message failed: -71 (9/0)
dvb-usb: bulk message failed: -71 (6/0)
dvb-usb: bulk message failed: -71 (9/0)
dvb-usb: bulk message failed: -71 (6/0)
dvb-usb: bulk message failed: -71 (9/0)
dvb-usb: bulk message failed: -71 (9/0)
------------[ cut here ]------------
1
WARNING: drivers/media/i2c/cx25840/cx25840-core.c:2313 at cx25840_init+0xa3/0x110 drivers/media/i2c/cx25840/cx25840-core.c:2313, CPU#0: kworker/0:2/983
Modules linked in:
CPU: 0 UID: 0 PID: 983 Comm: kworker/0:2 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:cx25840_init+0xa3/0x110 drivers/media/i2c/cx25840/cx25840-core.c:2313
Code: e4 02 00 00 4c 89 f0 48 c1 e8 03 42 0f b6 04 20 84 c0 75 5e 41 c7 06 2a b5 2a 01 89 de e8 c5 66 00 00 eb 09 e8 fe db c2 f9 90 <0f> 0b 90 31 c0 5b 41 5c 41 5e 41 5f 5d e9 d6 61 0b f9 cc 89 f9 80
RSP: 0018:ffffc90004a06bd0 EFLAGS: 00010293
RAX: ffffffff8804df22 RBX: 00000000000ac8aa RCX: ffff8880271f3e80
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 0000000000000000 R08: ffff8880226e01bb R09: 1ffff110044dc037
R10: dffffc0000000000 R11: ffffffff8804de80 R12: dffffc0000000000
R13: 0000000000000000 R14: ffff88801bb05040 R15: ffff88801bb05338
FS:  0000000000000000(0000) GS:ffff888124cda000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f938c09caa0 CR3: 000000007f389000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 cxusb_medion_register_analog_subdevs drivers/media/usb/dvb-usb/cxusb-analog.c:1730 [inline]
 cxusb_medion_register_analog+0x307/0x1130 drivers/media/usb/dvb-usb/cxusb-analog.c:1793
 cxusb_probe+0x664/0x710 drivers/media/usb/dvb-usb/cxusb.c:1615
 usb_probe_interface+0x788/0xe50 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3776
 usb_set_configuration+0x1ad8/0x2180 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c3/0x3b0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3776
 usb_new_device+0x9aa/0x1690 drivers/usb/core/hub.c:2708
 hub_port_connect drivers/usb/core/hub.c:5580 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5720 [inline]
 port_event drivers/usb/core/hub.c:5884 [inline]
 hub_event+0x28e8/0x4d30 drivers/usb/core/hub.c:5966
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


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
