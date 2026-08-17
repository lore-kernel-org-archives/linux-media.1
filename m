Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2853FBB6D
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 11:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965867; cv=none; b=MKnWTO5rf1DAK0Z+EtgyLRuJoCcc/11OuBGD5oNyJxNA815H057m9lC6GQ5rLlJ1pvT9vMPZGcRJ5Pvs6mVDA+EK7igI7DUEzqsrcaWvq+V2m5AZKzCprJICMRNy+Pn7C9qrfdGTF/ZhYtncLvYE3MegqSl1XtQ6cs4ofay+muY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965867; c=relaxed/simple;
	bh=WkNwSDYrZ30ZPJBaT/VIvgfO5HEXvLOCsu2pqodaejk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=am7sMfFgBglKqXm9ZI0QvBu21eOgNXioDHU3hTobr5O9DoqoMtGmON5AFWY7dL+rDJm/n1rKdltZ/0OQm81Slk/Gp3AH7qP0UHxxv5JHJ6aoY3LjB4lvqbT/hUTjQ1VWJ/j8g89oi5G01rLr0dCUIessswI+hkmBCGULo+P0JmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a49f09233fso1988231b6e.0
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 04:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786965865; x=1787570665;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2xmQkttAtsCjuzgkCEF7v1TswbyGQ8cRqlepQNHU0/s=;
        b=Ihoh3tLfuldIR3FzneN0blo4redikHEiYGHORgn6H3hAo11BOHgQgznQTv+cGN5G9v
         Apwd+chjnaB0ofNbj8Em7U8PQ7KETS6Kw41R0ccH03/RajNLjhRzGhIkvBxBaWXJ9hD3
         rWRWD3yVjQjen0EMHQN6F+69RE1w74YojdfoMsjE6QuqYsqkFxGt1DljoBtJjBjLz1ua
         zpIl99VlKcfgcfZMMn3qm/r1UNvZQhcA1cmo+/QU5wNn9IiEPtN0TOTthHHwhQSR1voR
         fq51lUpdMgNLL6LLNZ/q6/DUpsJ6GqVjY8X3yBi1DJuX9MZx8kkxcAfawshLLXyj6Znu
         FpOQ==
X-Forwarded-Encrypted: i=1; AHgh+RpuYzaWSnKgaO7b/6yeTOrVH01apGGK/HoXQ09DhkVLDyjy8lLroIvEyZp2z5Zdb8l+5LgWpmJB805y6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf7zy1qiKQHP7haoCmnnZjb6EDq10JUD3tWyh2Patkuzc0ryh5
	pNRHGJIZfKY790qz+gG38lLNCQDZWAUYfqt+D1Gnsx01zvtiSO8aRED9NpHhnY4sXgn0CTAnTuk
	nwD/nvunegxbY/w8EjKvyLfI4ECuukVwyH06F4vfjdM4Z2KjwU9U3r2tH84s=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f8d:b0:4a4:66f8:1275 with SMTP id
 5614622812f47-4b2283187d7mr20239862b6e.14.1786965865179; Mon, 17 Aug 2026
 04:24:25 -0700 (PDT)
Date: Mon, 17 Aug 2026 04:24:25 -0700
In-Reply-To: <6a708e5b.13bfb6d0.1ecdd5.027f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a82ef69.f7a79266.2f965f.0028.GAE@google.com>
Subject: Re: [syzbot] [media?] WARNING in v4l2_ctrl_cluster
From: syzbot <syzbot+2d417475ba9d6d02cfc9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

syzbot has found a reproducer for the following issue on:

HEAD commit:    8d3ae59288f1 Linux 7.2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=3D13140679580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D1d67342c314f228=
d
dashboard link: https://syzkaller.appspot.com/bug?extid=3D2d417475ba9d6d02c=
fc9
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1315d949580000

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+2d417475ba9d6d02cfc9@syzkaller.appspotmail.com

usb 5-1: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D0
hackrf 5-1:1.0: Board ID: 02
hackrf 5-1:1.0: Firmware version: =02
------------[ cut here ]------------
ncontrols =3D=3D 0 || controls[0] =3D=3D NULL
WARNING: drivers/media/v4l2-core/v4l2-ctrls-core.c:2493 at v4l2_ctrl_cluste=
r+0x1a1/0x230 drivers/media/v4l2-core/v4l2-ctrls-core.c:2493, CPU#0: kworke=
r/0:1/10
Modules linked in:
CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted syzkaller #0 PREEMPT(fu=
ll)=20
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16=
.3-2 04/01/2014
Workqueue: usb_hub_wq hub_event
RIP: 0010:v4l2_ctrl_cluster+0x1a1/0x230 drivers/media/v4l2-core/v4l2-ctrls-=
core.c:2493
Code: 03 38 d0 7c 08 84 d2 0f 85 88 00 00 00 0f b6 43 35 41 83 e7 01 41 c1 =
e7 02 83 e0 fb 44 09 f8 88 43 35 eb 09 e8 e0 16 f2 f9 90 <0f> 0b 90 e8 d7 1=
6 f2 f9 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41 5f
RSP: 0018:ffffc900000d6f20 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff88185b47
RDX: ffff88801eeba540 RSI: ffffffff88185cc0 RDI: ffff88801eeba540
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000002 R11: 0000000000000000 R12: 0000000000000002
R13: 0000000000000002 R14: ffff88802bff1628 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880d5bde000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffc2c57dd58 CR3: 000000002b63c000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 v4l2_ctrl_auto_cluster+0x4e/0x3a0 drivers/media/v4l2-core/v4l2-ctrls-core.=
c:2515
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
 usb_new_device.part.0+0xcc2/0x1686 drivers/usb/core/hub.c:2703
 usb_new_device include/linux/workqueue.h:714 [inline]
 hub_port_connect drivers/usb/core/hub.c:5575 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5715 [inline]
 port_event drivers/usb/core/hub.c:5879 [inline]
 hub_event.cold+0x1e3/0xe90 drivers/usb/core/hub.c:5961
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
