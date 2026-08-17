Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF9632B104
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 11:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964544; cv=none; b=bq6oyQ36gSK6tc9HrkqrRq/HiRtEinmosCb5q+uvROkEyvikw8OyTQLaSUJ+BFurSls7HUPU3VzjWZ+JCxT1KkUyGZdtI9BTvTb7eI2qowDl3iQdSUROnbrcjhYfxUIih3s+NTeUsFgbjsKTucxkfbbccghZxQ5F2dS8XKxCd5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964544; c=relaxed/simple;
	bh=W0pWAKVdGXi20E7Ar/3AfZ7gOA5oDCzXKNqtuofXMn8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cmyvqwOLinElDkIDKSF2EZ2MtHeI0v5MfxDIzc4oSO6c0pQZoR2WCsfb8O5rWSTX1XzzK6ckRIeoFaN4RDI48VLvyB2s54ppUUAXTxT+A6cdxRqrZE4EoOqSKHN7yqRYnrtpEwkcESrP5UoVkg2sv1vZD/baY6qfrFrApLU09vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-455ad408573so4558345fac.3
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 04:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786964541; x=1787569341;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gZSO7RPVnyXntARRpn+opbzRcIrQZwCPlmSY31qNfF4=;
        b=lWLoYcqS509YqZys/7OtL2lGtyLGLwkoj0gzdE5lU5msynf7uJtzmQD/ntxb9ZX5yB
         e0kHeMoO8L27QeBBWV09zOBoCzkqJE5vvHQUE6CmkiU+Yo4W6o7dqrIu5ZWea1H7jvam
         3wt43b555cnB0WCxJ58vMihzP0rLhI9iMDgwOsEHUWmigTkBZYjSkxrd+b5sqGe6oNuX
         JibWIXtcK4OUHjS1AngF+qgwxhpFdX5fmVg7EbhaPTdMWRB7fPaj5NwoPA4Q194Y51nr
         GjLutKNjJW9cuEWp8ehMqjYHZi19NWM3E3y5PH+DMclO3ir4gHM/HtOm5Mj+2WBYpxey
         l/MQ==
X-Forwarded-Encrypted: i=1; AHgh+RorprurF1bpkdTbx8i2+7P1rkXOIgbhbajD4s595aPqoLvfvR5+z0yTbqfdyNAwfKkxmyxnjPVtYViG5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXETQOA+qRAWKOHDy0JiOQWhrvXpd5hGNVhcdBam3GSLHdBBKR
	xBzcKO22zVMPXzLXUfbh85QRR+JtXqiN34WEDAsVmxdN4iHCUHzQYsL1pjZL4IxgtfETtfjTpXE
	ULdKFN0u7AvxAY6jHsb+FQ6ddOc8BHxVgxlay9NW+IGbP9TQOe5yPPYiu554=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:200f:b0:6ae:9b39:68ce with SMTP id
 006d021491bc7-6b0d6ed1e24mr20132563eaf.24.1786964541453; Mon, 17 Aug 2026
 04:02:21 -0700 (PDT)
Date: Mon, 17 Aug 2026 04:02:21 -0700
In-Reply-To: <6a63c6bd.a2ea2cc8.fbad6.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a82ea3d.10853dc7.22f513.0024.GAE@google.com>
Subject: Re: [syzbot] [media?] KASAN: vmalloc-out-of-bounds Write in
 tpg_fill_plane_buffer (5)
From: syzbot <syzbot+cb43e758a4dc84dd467f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    8d3ae59288f1 Linux 7.2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14f80679580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d67342c314f228d
dashboard link: https://syzkaller.appspot.com/bug?extid=cb43e758a4dc84dd467f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14b9d949580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cb43e758a4dc84dd467f@syzkaller.appspotmail.com

BUG: KASAN: vmalloc-out-of-bounds in tpg_fill_plane_pattern drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2617 [inline]
BUG: KASAN: vmalloc-out-of-bounds in tpg_fill_plane_buffer+0x2063/0x4160 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2705
Write of size 720 at addr ffffc900038f9d50 by task vivid-000-vid-c/6017

CPU: 0 UID: 0 PID: 6017 Comm: vivid-000-vid-c Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:186 [inline]
 kasan_check_range+0x10f/0x1e0 mm/kasan/generic.c:200
 __asan_memcpy+0x3c/0x60 mm/kasan/shadow.c:106
 tpg_fill_plane_pattern drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2617 [inline]
 tpg_fill_plane_buffer+0x2063/0x4160 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2705
 vivid_fillbuff+0x963/0x3ff0 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:470
 vivid_thread_vid_cap_tick+0x81b/0x1470 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:629
 vivid_thread_vid_cap+0x454/0xd70 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:767
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

The buggy address belongs to a vmalloc virtual mapping
The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff88802a460000 pfn:0x2a460
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000000 0000000000000000 dead000000000122 0000000000000000
raw: ffff88802a460000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x2dc2(GFP_KERNEL|__GFP_HIGHMEM|__GFP_ZERO|__GFP_NOWARN), pid 6016, tgid 6016 (syz-executor373), ts 77775340251, free_ts 77775265836
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0xf48/0x3530 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x299/0x2dc0 mm/page_alloc.c:5304
 __alloc_pages_noprof mm/page_alloc.c:5338 [inline]
 alloc_pages_bulk_noprof+0x5de/0x13c0 mm/page_alloc.c:5230
 alloc_pages_bulk_mempolicy_noprof+0x255/0x1270 mm/mempolicy.c:2798
 vm_area_alloc_pages mm/vmalloc.c:3736 [inline]
 __vmalloc_area_node mm/vmalloc.c:3914 [inline]
 __vmalloc_node_range_noprof+0x69d/0x1630 mm/vmalloc.c:4104
 vmalloc_user_noprof+0x9e/0xe0 mm/vmalloc.c:4259
 vb2_vmalloc_alloc+0x135/0x410 drivers/media/common/videobuf2/videobuf2-vmalloc.c:47
 __vb2_buf_mem_alloc drivers/media/common/videobuf2/videobuf2-core.c:242 [inline]
 __vb2_queue_alloc+0x8d5/0x1160 drivers/media/common/videobuf2/videobuf2-core.c:523
 vb2_core_reqbufs+0x899/0xf30 drivers/media/common/videobuf2/videobuf2-core.c:958
 vb2_ioctl_reqbufs+0x291/0x450 drivers/media/common/videobuf2/videobuf2-v4l2.c:1036
 vidioc_reqbufs+0x86/0x100 drivers/media/test-drivers/vivid/vivid-core.c:709
 v4l_reqbufs+0x175/0x1d0 drivers/media/v4l2-core/v4l2-ioctl.c:2171
 __video_do_ioctl+0xb2a/0xdf0 drivers/media/v4l2-core/v4l2-ioctl.c:3133
 video_usercopy+0x47a/0x1730 drivers/media/v4l2-core/v4l2-ioctl.c:3475
 v4l2_ioctl+0x1bd/0x250 drivers/media/v4l2-core/v4l2-dev.c:366
page last free pid 6016 tgid 6016 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x79f/0x1090 mm/page_alloc.c:2950
 __kasan_populate_vmalloc_do mm/kasan/shadow.c:393 [inline]
 __kasan_populate_vmalloc+0x1ea/0x210 mm/kasan/shadow.c:424
 kasan_populate_vmalloc include/linux/kasan.h:580 [inline]
 alloc_vmap_area+0x95d/0x2bb0 mm/vmalloc.c:2145
 __get_vm_area_node+0x1ca/0x330 mm/vmalloc.c:3248
 __vmalloc_node_range_noprof+0x228/0x1630 mm/vmalloc.c:4064
 vmalloc_user_noprof+0x9e/0xe0 mm/vmalloc.c:4259
 vb2_vmalloc_alloc+0x135/0x410 drivers/media/common/videobuf2/videobuf2-vmalloc.c:47
 __vb2_buf_mem_alloc drivers/media/common/videobuf2/videobuf2-core.c:242 [inline]
 __vb2_queue_alloc+0x8d5/0x1160 drivers/media/common/videobuf2/videobuf2-core.c:523
 vb2_core_reqbufs+0x899/0xf30 drivers/media/common/videobuf2/videobuf2-core.c:958
 vb2_ioctl_reqbufs+0x291/0x450 drivers/media/common/videobuf2/videobuf2-v4l2.c:1036
 vidioc_reqbufs+0x86/0x100 drivers/media/test-drivers/vivid/vivid-core.c:709
 v4l_reqbufs+0x175/0x1d0 drivers/media/v4l2-core/v4l2-ioctl.c:2171
 __video_do_ioctl+0xb2a/0xdf0 drivers/media/v4l2-core/v4l2-ioctl.c:3133
 video_usercopy+0x47a/0x1730 drivers/media/v4l2-core/v4l2-ioctl.c:3475
 v4l2_ioctl+0x1bd/0x250 drivers/media/v4l2-core/v4l2-dev.c:366
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583

Memory state around the buggy address:
 ffffc900038f9f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc900038f9f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc900038fa000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                   ^
 ffffc900038fa080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc900038fa100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
