Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5682356BE
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 20:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784923840; cv=none; b=aap1yH2+BTOT0aKWCv0fBDl4YSwDFlSoLSkPl8kO3Tt8t/woxKVHiA7JsG8SbYOo3hlPGR9TeRLhdut5Wp0ejTj24bGBXh+qgO8LFDslTPNR7fsb4L6g1EELi1UOftnU3Dv2iXj6KLuxjSLZRzWI6Nnu8J71fGaxYU/FU/uvlEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784923840; c=relaxed/simple;
	bh=SdvW6zb2m0j165dVkhiU0MFdqA7uMn6Jt9IquwKsKnI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=lLSy8UCh7qUd5bBqibjMWZmT4FIt0cBSlFCVITnFgZVm0fK4IYAunL25LXnkCm+Uk9PJUiL9vEvucPSpzIt2+DHVTl3NLzFvZrHyojQve7+/3yVd2AS3f91sMHcZzuvyt5Mb9w2QfXa/ol8AdcmNjbULt6/zlCSJHztHQMILeFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-497e582f42fso821903b6e.3
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 13:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784923837; x=1785528637;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFTPxAt1GEEhc/zfClnJ1YXcRiKawNFyGhEPqsDd3h8=;
        b=iZISOQ6ihRCRcKcViMo8HEZvW5vDwAy7ShjRClwM/u49mutp9YorOrt9JEhalKPyki
         97N4sHTH2YqdZVF+J7miEXJVNbL4XQKc6eABQvxscsqSVXQ6MerfhG1HF93jcUj9ySLp
         s/buRmXtV6z2RXUulKAaFlc4jSCdlqFntJ6npReWQIopBbHe/u6FUJMBPmJtog0ni3DQ
         jMBqRmnMZCcraSCE2OZcxpGX2K0NZ2DbsWIiHOwZllhls8kaIXJnwsbFstBCB/QnCfaS
         fbBsv8GH6Qw6jYqwhwHR4/LdiAY/UygO0tIJ3MdLdw0Au3EDn+xtvuPnhj9zBfNBOtDY
         PDGg==
X-Forwarded-Encrypted: i=1; AHgh+RoMTvKIBXElUryw0AQ02VnCmRNWte8vW+Cs8AhuIPnN4zpXhZRlrF3wW71yfwykrWtnei/8dHPHLHFwRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6CIEwEYpVo/DwSgOerTV0efCX4L/ojY/vy9Nx88FyT46ML5nZ
	lgAz+GNIXvSDl7KrH6N6KCXtq6CURX25fVJd8FWMbJJoKNj3K+CZHwBqoyMYCuj22od+bAamL8a
	bfz7FOxNevC5KikwkRMayu3q+y2B3jY9HIxPSIAENjeLRsKWF7amdNEHgZcQ=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3501:b0:4a3:d66b:240b with SMTP id
 5614622812f47-4ab353dca4cmr7373615b6e.18.1784923837729; Fri, 24 Jul 2026
 13:10:37 -0700 (PDT)
Date: Fri, 24 Jul 2026 13:10:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a63c6bd.a2ea2cc8.fbad6.0008.GAE@google.com>
Subject: [syzbot] [media?] KASAN: vmalloc-out-of-bounds Write in
 tpg_fill_plane_buffer (5)
From: syzbot <syzbot+cb43e758a4dc84dd467f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    48a5a7ab8d6a Merge tag 'v7.2-rc4-smb3-client-fixes' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11a21ab9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=cb43e758a4dc84dd467f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-48a5a7ab.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8ed725bee82f/vmlinux-48a5a7ab.xz
kernel image: https://storage.googleapis.com/syzbot-assets/110c09c210d5/bzImage-48a5a7ab.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cb43e758a4dc84dd467f@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in tpg_fill_plane_extras drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2439 [inline]
BUG: KASAN: vmalloc-out-of-bounds in tpg_fill_plane_buffer+0x34d9/0x4160 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2707
Write of size 1 at addr ffffc9000579a000 by task vivid-000-vid-c/20070

CPU: 0 UID: 0 PID: 20070 Comm: vivid-000-vid-c Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 tpg_fill_plane_extras drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2439 [inline]
 tpg_fill_plane_buffer+0x34d9/0x4160 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2707
 vivid_fillbuff+0x963/0x3ff0 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:470
 vivid_thread_vid_cap_tick+0x81b/0x1470 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:629
 vivid_thread_vid_cap+0x454/0xd70 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:767
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

The buggy address belongs to a vmalloc virtual mapping
Memory state around the buggy address:
 ffffc90005799f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc90005799f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc9000579a000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                   ^
 ffffc9000579a080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc9000579a100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================


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
