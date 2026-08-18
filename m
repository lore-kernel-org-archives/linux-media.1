Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78352FD69D
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 08:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043276; cv=none; b=FBjfL2wlF8Tt9zs7pFNScXJsKH8HP5uUmCNKngw0eNAf4b3PSY1Meze0eFfkRPDg/Ve+4fQ1lDaxlDOMUJ93ZcpI3WXyn/7GC37vgx9HgRipJlKjwQk2pQN8LCq+AsZnnToWGwpLJeXE64R/lkntoVaF+A/8VW94E2J7PYQwtp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043276; c=relaxed/simple;
	bh=aBE9SK3cSyKRyMQ3yL4SVgv+oY+5vV8FqDgGwc5Hp7A=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=fJFhYEi/623sxX+BHep9gC66VDyZLIWZiWAycc1XKlEryQPMp+IkZsfc7FO2RpLv2bzcOecvBnVjJX+Ap2b7EPsCMuvHoJwLbSWI3jW4CXnMUMNa/paOlYsZP1h0omRRxOiskQqYIhWzuFZBwBzBUF6GNSI7PnNJXX16rVvBVE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4519ef1babeso2223364fac.2
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 01:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043273; x=1787648073;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZL/mcX8H0Q+ePp1h60nfWYbBIn/nLTIafCh7g7iIDs=;
        b=D3WN8+ej0p/QsHkKN+I1IhhrIP9J+DL2Q8PBvXfKBr54/41LMZwkN0x6PqNIs8x+mI
         M9iyVPupORygQOHrMMJ8mdfpT0ZNB9HohKqeCSh4c3WL1rrFjA1McQtbN/JufKGNqdmb
         XhuqiBjT8P/ZqWyUY3ETRz21o6gAxeTB7MzdlEX70qsE2qfxPti9TadQIKHF0ZEEk8RT
         fqZ1wLlR+iy9KCDEzyVSsowYkVmqsQLNYzjXnFqhMe34bKnbjfcUE+zMVGhuzW6HsU9S
         1a05jGCS+Bse+BcmYOVioaoQT39vqDLDim/Kkb0GEJEqQD5AdQuLeNTTWTzvGz9ZnMQE
         0exA==
X-Forwarded-Encrypted: i=1; AHgh+RrVZkv/rJW8gKck7VrWRGn36do6+DRE1+leXEyV6AGjVgKHZhvsA82po46gBZvRhAtE4V4H9vqyrq+j+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcITbjYWMMfMZ03xfxcZ1/BDhqkwNy9Ww3USdM0aC9P4Aame7y
	3A/KyylrxTOEvZqOt5osNr8FtCqMw1AQ8L+o2E0D1B8pVs/R5Deyp/Bwp810fpa3g5MAHvbbmaX
	4o4HrFI1ca4Qt2i7BlxzjX4cgxw1wYbnZXlmVMXS8qnGdCZnPabwWN1OttPU=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:d54:b0:4b2:8da4:cdc8 with SMTP id
 5614622812f47-4b28da4e97amr7419889b6e.7.1787043273733; Tue, 18 Aug 2026
 01:54:33 -0700 (PDT)
Date: Tue, 18 Aug 2026 01:54:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a841dc9.4d75e56a.c9a88.000e.GAE@google.com>
Subject: [syzbot] [media?] KASAN: use-after-free Read in media_request_release
From: syzbot <syzbot+3910ee87c4ba0a51e3f9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0f23d56f17fd Merge tag 'linux_kselftest-next-7.3-rc1' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14185a25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=65bfb7732ae5a736
dashboard link: https://syzkaller.appspot.com/bug?extid=3910ee87c4ba0a51e3f9
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12185a25580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3910ee87c4ba0a51e3f9@syzkaller.appspotmail.com

vivid-023: unregistering video101
vivid-023: unregistering video102
vivid-023: unregistering v4l-touch23
==================================================================
BUG: KASAN: use-after-free in media_request_release+0x18f/0x1b0 drivers/media/mc/mc-request.c:74
Read of size 8 at addr ffff88802eeb03d0 by task syz-executor137/6019

CPU: 0 UID: 0 PID: 6019 Comm: syz-executor137 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 media_request_release+0x18f/0x1b0 drivers/media/mc/mc-request.c:74
 kref_put include/linux/kref.h:65 [inline]
 media_request_put drivers/media/mc/mc-request.c:83 [inline]
 media_request_close+0x7e/0xc0 drivers/media/mc/mc-request.c:91
 __fput+0x3ff/0xb50 fs/file_table.c:512
 fput_close_sync+0x118/0x250 fs/file_table.c:617
 __do_sys_close fs/open.c:1560 [inline]
 __se_sys_close fs/open.c:1545 [inline]
 __x64_sys_close+0x8b/0x120 fs/open.c:1545
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1498a6cd77
Code: 48 89 fa 4c 89 df e8 98 1d 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffe0f9add20 EFLAGS: 00000202 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 0000555574a0d400 RCX: 00007f1498a6cd77
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 0000555574a0f770 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffe0f9adf80
R13: 00007f1498aa2025 R14: 0000000000000003 R15: 0000000000000000
 </TASK>

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2eeb0
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f0(buddy)
raw: 00fff00000000000 ffffea0000bc7008 ffffea0000bd2008 0000000000000000
raw: 0000000000000000 0000000000000004 00000000f0000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as freed
page last allocated via order 4, migratetype Unmovable, gfp_mask 0x40dc0(GFP_KERNEL|__GFP_ZERO|__GFP_COMP), pid 1, tgid 1 (swapper/0), ts 13637122444, free_ts 68983659713
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0xf48/0x3530 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x299/0x2dc0 mm/page_alloc.c:5304
 alloc_pages_mpol+0x1fb/0x540 mm/mempolicy.c:2490
 ___kmalloc_large_node+0xe5/0x120 mm/slub.c:5274
 __kmalloc_large_noprof+0x1c/0x70 mm/slub.c:5295
 _kmalloc_noprof include/linux/slab.h:985 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 vivid_create_instance drivers/media/test-drivers/vivid/vivid-core.c:1817 [inline]
 vivid_probe+0x1f8/0x10d0 drivers/media/test-drivers/vivid/vivid-core.c:2095
 platform_probe+0x106/0x1d0 drivers/base/platform.c:1439
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __driver_attach+0x21f/0x5b0 drivers/base/dd.c:1292
 bus_for_each_dev+0x13e/0x1d0 drivers/base/bus.c:383
 bus_add_driver+0x305/0x5b0 drivers/base/bus.c:763
 driver_register+0x1e2/0x360 drivers/base/driver.c:174
 vivid_init+0x527/0x6a0 drivers/media/test-drivers/vivid/vivid-core.c:2296
page last free pid 6019 tgid 6019 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_pages_ok+0x73b/0xfe0 mm/page_alloc.c:1584
 v4l2_device_release drivers/media/v4l2-core/v4l2-device.c:51 [inline]
 kref_put include/linux/kref.h:65 [inline]
 v4l2_device_put+0xa3/0xd0 drivers/media/v4l2-core/v4l2-device.c:56
 vivid_remove+0x3fd/0x560 drivers/media/test-drivers/vivid/vivid-core.c:2224
 platform_remove+0x5f/0x80 drivers/base/platform.c:1456
 device_remove+0xcb/0x180 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 unbind_store+0xf8/0x110 drivers/base/bus.c:244
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88802eeb0280: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff88802eeb0300: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff88802eeb0380: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                                                 ^
 ffff88802eeb0400: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff88802eeb0480: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================


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
