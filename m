Received: from mail-ot1-f79.google.com (mail-ot1-f79.google.com [209.85.210.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B4A16F27F
	for <linux-media@vger.kernel.org>; Mon,  3 Aug 2026 12:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761373; cv=none; b=RsbSWRgZSlFiSaxp1MhqiHnOu7WSec7OFZys+ln269gVM7AoH12K7WDJN90ysyjTgpUU2iDZCbpz1gAv5P3GEjbnhHCVh2KY5RzEOrjvagZCXqOfD5tG9vyyQ09hnN3dCtwQf4oohRB8R5poVhhsAA5NGW29RrCRVJxmrl6JTIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761373; c=relaxed/simple;
	bh=UsgiFDaHoAOw7FOTgq68G0S9b+Wg8R/qcqmmSQBOHaA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=sCqQDTZVJiTqRNxmdjVmkLhCY41sVfHV2KY5ySyQMqK2fCvwzc00WFiXzG0KCJdjoXyp0x7PJHxSEb1BZFzTJ3bu7oz1VWfTxtGRF5N99KdAgBKAXHvGU4eL+dwZr7la7BJ1AMJmthZdsCU2AH3yRJgfa+oRwSICQjHeymo3WYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f79.google.com with SMTP id 46e09a7af769-7ec6685adabso4809893a34.0
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 05:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761371; x=1786366171;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=64QN7LTkq2qNHaMOdcQ2ARtSM19t0SiU7kRF5dlfXI8=;
        b=H06raH12xzrBcdEdPiImlGcoq1gbfGNJbereJNvWk8YcxdNXlasyAnQZheX7b4Lpee
         xL5/Y5zJICYOUxcqbx7ba+HxVz/fyMzrDgUH8WcEl8PrpjBHYTdRzxgo5xYVsyfW3VSg
         mr3xDxlpk11SO/xWPvEJiIINPBuMGYcmgHeEopJsv/aod2BpyPQ7KnMvIBvAIwMdRMgc
         eW/qle9J67IQLXw0d97coTJpaDNf4dkQpJm8Fn2urrhQbd6k4P1NnaOhix8lBIgfm+Sv
         FL4PVQ3uumiSRY9T9sYjRdSf0Jp2Jdm/gDtTiER6OpsW//bNh0HQiLw159jp3j5Mnmyl
         N4bQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqu4/3kCRSSZnYioLSxq4FXm+pxq9OPUgAf9WTf3WDTrcHCqqiV0oiZ1hXGcodKndUJcLfZHVFtieaZ9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk1fy+s1ohEHFLXzOBa5HrOAyVAxhTvhm8ZXC5zMqKRwCRJ721
	LrmsPeynjRNcpnT56Vc8I6ABaiJZWuv+MFOwENDm/h2OLRkhOMuks/rpOzirLcWctFvFGauXqLl
	X4uTB+QsgdiEzadhWvB51yaFICuF7FkRih7BM3OumDjPXir80I/UsnWtRJkA=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f8f:b0:495:eb85:fc2b with SMTP id
 5614622812f47-4af5e29ce58mr15188680b6e.10.1785761371033; Mon, 03 Aug 2026
 05:49:31 -0700 (PDT)
Date: Mon, 03 Aug 2026 05:49:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a708e5b.13bfb6d0.1ecdd5.027f.GAE@google.com>
Subject: [syzbot] [media?] WARNING in v4l2_ctrl_cluster
From: syzbot <syzbot+2d417475ba9d6d02cfc9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    11028ab62899 Merge tag 'probes-fixes-v7.2-rc5' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13654aea580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f221a1b5d497ed15
dashboard link: https://syzkaller.appspot.com/bug?extid=2d417475ba9d6d02cfc9
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-11028ab6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/50d1387eb51d/vmlinux-11028ab6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/30ffbd0f8cd4/bzImage-11028ab6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2d417475ba9d6d02cfc9@syzkaller.appspotmail.com

 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
------------[ cut here ]------------
ncontrols == 0 || controls[0] == NULL
WARNING: drivers/media/v4l2-core/v4l2-ctrls-core.c:2493 at v4l2_ctrl_cluster+0x1a1/0x230 drivers/media/v4l2-core/v4l2-ctrls-core.c:2493, CPU#2: kworker/2:3/5745
Modules linked in:
CPU: 2 UID: 0 PID: 5745 Comm: kworker/2:3 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: usb_hub_wq hub_event
RIP: 0010:v4l2_ctrl_cluster+0x1a1/0x230 drivers/media/v4l2-core/v4l2-ctrls-core.c:2493
Code: 03 38 d0 7c 08 84 d2 0f 85 88 00 00 00 0f b6 43 35 41 83 e7 01 41 c1 e7 02 83 e0 fb 44 09 f8 88 43 35 eb 09 e8 50 11 f2 f9 90 <0f> 0b 90 e8 47 11 f2 f9 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41 5f
RSP: 0000:ffffc90004406f10 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff88179997
RDX: ffff8880263f2540 RSI: ffffffff88179b10 RDI: ffff8880263f2540
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000002 R11: 0000000000000000 R12: 0000000000000002
R13: 0000000000000002 R14: ffff8880449f9628 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888096de3000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000f72be860 CR3: 0000000073249000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 v4l2_ctrl_auto_cluster+0x4e/0x3a0 drivers/media/v4l2-core/v4l2-ctrls-core.c:2515
 hackrf_probe.cold+0x5f0/0x12ef drivers/media/usb/hackrf/hackrf.c:1430
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3772
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3772
 usb_new_device.cold+0x685/0x115c drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x30a3/0x4a60 drivers/usb/core/hub.c:5953
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
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

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
